#include "global.h"
#include "random.h"
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

struct Roulette /* ewram + 0x19000 */
{
    u8 var00;
    u8 var01;
    u8 var02;
    u8 var03_0:5;
    u8 var03_5:1;
    u8 var03_6:1;
    u8 var03_7:1;
    u8 var04_0:2;
    u8 var04_2:5;
    u8 var04_7:1;
    u32 var08;
    u8 var0C[0x6];
    u8 var12[0x4];
    u8 var16[0x3];
    u8 var19;
    u8 var1A_0:4;
    u8 var1A_4:4;
    u8 var1B[0x6];
    u8 var21;
    u8 var22;
    u8 var23;
    s16 var24;
    s16 var26;
    s16 var28;
    s16 var2A;
    struct OamMatrix var2C;
    u16 var34;
    struct Sprite *var38;
    u8 var3C[0x40]; // Sprite IDs
    u8 var7C;
    u8 var7D;
    u8 var7E;
    u8 var7F;
    s16 var80;
    s16 var82;
    s16 var84;
    s16 var86;
    float var88;
    float var8C;
    float var90;
    float var94;
    float var98;
    float var9C;
    float varA0;
    u8 varA4;
    u8 varA5;
    u8 v51[0x2];
    u16 varA8;
    u16 varAA;
    TaskFunc varAC;
    u8 v46[0x4];
    TaskFunc varB4;
    struct UnkStruct0 varB8;
};

struct StructgUnknown_083F8DF4
{
    u8 var00;
    u8 var01;
    u8 var02;
    u8 var03;
    u8 var04;
    u8 v[0x3];
    u16 var08;
    u16 var0A;
    u16 var0C;
    u16 v13[0x1];
    u16 var10;
    u16 var12;
    u16 var14;
    u8 v1[0x2];
    u16 var18;
    u16 var1A;
    float var1C;
};

struct StructgUnknown_083F8C00
{
    u8 var00;
    u8 var01_0:4;
    u8 var01_4:4;
    u8 var02;
    u8 var03;
    u8 var04;
    u8 var05;
    u8 var06;
    u8 var07;
    u32 var08;
    u32 var0C;
    u16 var10;
    u16 var12;
};

struct StructgUnknown_083F8D90
{
    u8 var00;
    u8 var01;
    u8 var02;
    u8 var03;
    u32 var04;
};

#if DEBUG
void *gUnknown_Debug_03005FB8;
#endif

#define static

static void sub_81150FC(void);
static void sub_8115124(void);
static void sub_8115238(void);
static void sub_8115384(void);
static void sub_8115634(u8);
static void sub_81156BC(u8);
static void sub_8115734(u8);
void sub_811577C(u8);
void sub_81157AC(u8);
static void sub_81157D0(u8);
static void sub_8115928(u8, u8);
static void sub_811597C(u8);
static void sub_81159BC(u8);
static u8 sub_8115A94(s16 *, u8);
void sub_8115B58(u8);
static void sub_8115DA0(u8);
static void sub_8115E14(u8);
static void sub_8115ECC(u8);
u8 sub_8115F58(u16, u16);
static void sub_8116100(u8);
void sub_8116308(u8);
static void sub_811637C(u8);
static void sub_8116474(u8);
static void sub_8116514(u8);
static void sub_811659C(u8);
static void sub_8116638(u8);
static void sub_81166E8(u8);
static void sub_811677C(u8);
static void sub_81167F4(u8);
static void sub_8116880(u8);
static void dp01t_12_3_battle_menu(u8);
static void sub_8116AB0(u8);
static void sub_8116B40(u8);
static void sub_8116BC0(u8);
static void sub_8116C34(u8, TaskFunc, u16, u16);
static void sub_8116CAC(u8);
static void sub_8116CF8(void);
static u8 sub_8116D54(u8, u8);
static u8 sub_8116E5C(u8, u8);
static void sub_8116EF8(u8);
static void sub_8117158(u8);
static u8 sub_8117380(u8);
static void sub_8117434(void);
static void sub_81174F8(u8);
static void sub_8117528(u8);
void sub_811755C(u8);
void sub_81175C0(u8);
static void sub_81175DC(u8);
static void sub_8117630(u8);
static void Task_Roulette_0(u8);
static void sub_8117838(u8);
static u8 sub_8117890(const struct SpriteTemplate *, u8, u16 *);
static void sub_8117900(void);
void unref_sub_8117A74(void);
static void sub_8117AA8(u8, u8);
static void sub_8117BBC(void);
static void sub_8117C60(u8, u8);
static void sub_8117D68(u8);
static void sub_8117DF4(void);
void sub_8117E98(struct Sprite *);
static void sub_8117F2C(void);
static void sub_81180F4(u16);
static u8 sub_81181E8(u8);
static void sub_811829C(u8);
static void sub_81182F8(u8);
void sub_81184CC(struct Sprite *);
static void sub_81184D8(void);
void sub_8118554(struct Sprite *);
static void sub_811857C(void);
static void sub_81185E8(void);
static s16 sub_811866C(struct Sprite *);
static u8 sub_81186B8(struct Sprite *);
static s16 sub_81186E8(struct Sprite *);
static void sub_8118724(struct Sprite *);
static void sub_8118834(struct Sprite *);
static void sub_811889C(struct Sprite *);
static void sub_81189A8(struct Sprite *);
static void sub_8118B30(struct Sprite *);
static void sub_8118BD8(struct Sprite *);
static void sub_8118CAC(struct Sprite *);
void sub_8118CEC(struct Sprite *);
void sub_8118D2C(struct Sprite *);
static void sub_8118DE4(struct Sprite *);
static void sub_8118F8C(struct Sprite *);
static void sub_8119088(struct Sprite *);
static void sub_8119134(struct Sprite *);
static void sub_81191F4(struct Sprite *);
static void sub_8119224(struct Sprite *);
static void sub_81193D4(struct Sprite *);
static void sub_811952C(struct Sprite *);
static void sub_8119780(struct Sprite *);
static void sub_81197D8(struct Sprite *);
static void sub_8119898(struct Sprite *);
void sub_8119964(struct Sprite *);
static void sub_8119A90(struct Sprite *);
static void sub_8119AAC(struct Sprite *);
static void sub_8119B24(struct Sprite *);
static void sub_8119BCC(struct Sprite *);
static void sub_8119D08(struct Sprite *);
void sub_8119D80(struct Sprite *);

extern u8 gUnknown_02019000[];
extern u16 gSpecialVar_0x8004;
extern struct StructgUnknown_083F8DF4 gUnknown_083F8DF4[];
extern u8 gUnknown_083F8EC4;
extern u8 gUnknown_083F8DF0[];
extern u8 gUnknown_083F8E34[];
extern const u8 gUnknown_08E8096C[];
extern const u8 gRouletteWheelTiles[];
extern const u8 gRouletteCenter_Gfx[];
extern const u8 gRouletteHeadersTiles[];
extern const u8 gRouletteCreditTiles[];
extern const u8 gRouletteNumbersTiles[];
extern const u8 gRouletteMultiplierTiles[];
extern const u16 gUnknown_083F86BC[];
extern const u8 gUnknown_083F88BC[];
extern const u8 gUnknown_083F8A60[];
extern u16 gPlttBufferFaded[];
extern u16 gPlttBufferUnfaded[];
extern const u8 gUnknown_081C4157[];
extern const struct YesNoFuncTable gUnknown_083F8EBC;
extern const u8 gUnknown_081C41E3;
extern const u16 gUnknown_083F8ECE;
extern const struct StructgUnknown_083F8C00 gUnknown_083F8C00[];
const extern u8 gUnknown_083F8ECA[];
const extern u8 gUnknown_081C41A5;
const extern u8 gUnknown_081C4199;
const extern u8 gUnknown_081C41AE;
const extern u8 gUnknown_081C41BD;
const extern u8 gUnknown_081C41F1;
const extern u8 gUnknown_081C4231;
const extern u8 gUnknown_081C41D2;
extern const struct StructgUnknown_083F8D90 gUnknown_083F8D90[];
extern const u32 gUnknown_083F8ED8[];
extern const u32 gUnknown_083F8EE8[];
extern const struct UnkStruct1 gUnknown_083F8E9C[];
extern const u8 gUnknown_083F8EF4[];
extern const struct YesNoFuncTable gUnknown_083F8EB4;
extern const u8 gUnknown_081C40DF;
extern const u8 gUnknown_081C4139;
extern const u8 gUnknown_081C411C;
extern const u8 gUnknown_083F92A8[];
extern const u8 gUnknown_083F90FC[];
extern const u8 gUnknown_083F9D3C[];
extern const struct SpritePalette gUnknown_083F9E30;
extern const struct SpriteSheet gUnknown_083F9F54;
extern const struct SpriteSheet gUnknown_083F9F5C;
extern const struct SpriteTemplate gSpriteTemplate_83FA07C[];
extern const struct SpriteTemplate gSpriteTemplate_83F9FD4[];
extern const struct SpriteTemplate gSpriteTemplate_83FA034[];
extern const struct SpriteTemplate gSpriteTemplate_83FA40C;
extern const struct SpriteSheet gUnknown_083F9EE8;
extern const struct SpriteTemplate gSpriteTemplate_83FA0DC[];
extern struct OamMatrix gOamMatrices[];
extern const struct SpriteSheet gUnknown_083FA21C[];
extern const struct SpriteTemplate gSpriteTemplate_83FA2B0;
extern const struct SpriteTemplate gSpriteTemplate_83FA2C8;
extern const struct SpriteTemplate gSpriteTemplate_83FA2E0;
extern const struct SpriteTemplate gSpriteTemplate_83FA2F8;
extern const struct SpriteTemplate gSpriteTemplate_83FA310;
extern const u8 gUnknown_083FA608[0x5];
extern const struct SpriteSheet gUnknown_083FA42C;
extern const struct SpriteTemplate gSpriteTemplate_83FA434;
extern void (*gFieldCallback)(void);
extern struct MusicPlayerInfo gMPlay_SE1;
extern struct MusicPlayerInfo gMPlay_SE2;
extern struct MusicPlayerInfo gMPlay_SE3;
extern const u16 gUnknown_083FA60E[0x2][0x2];
extern const struct SpriteTemplate gSpriteTemplate_83FA50C;
extern const struct SpriteTemplate gSpriteTemplate_83FA5C0[];
extern const u16 gUnknown_083FA616[0x2][0x2];
extern const struct SpriteTemplate gSpriteTemplate_83FA524;
extern const struct SpriteTemplate gSpriteTemplate_83FA5F0;
extern const u16 gUnknown_083FA61E[0xA];
extern const u16 gUnknown_083FA632[];
extern const s8 gUnknown_083FA64A[0x2];
extern const s8 gUnknown_083FA64C[0x8][0x2];

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
    struct StructgUnknown_083F8DF4 *s0;
    u16 arr[0x3]; // the third is never used ?

    memcpy(arr, &gUnknown_083F8EC4, 0x6);
    // u16 arr[] = {RGB(24, 4, 10), RGB(10, 19, 6), RGB(24, 4, 10)};
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
        sub_812492C((&eRoulette->varB8), i, (struct UnkStruct1 *)&gUnknown_083F8E34[i * 8]);
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
    s8 arr[0x4];
    s8 t;
    memcpy(&arr, gUnknown_083F8ECA, 0x4);
    // char arr[] = {-5, 5, -1, 1};
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
                struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02 / 2;
            }
        }
        else if (!(r1 & 0x3))
        {
            struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[eRoulette->var04_0].var02 / 2;
        }
        else
        {
            struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
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
                struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02 / 2;
            }
            else
            {
                return 0x1;
            }
        }
        else if ((r1 & 0x1) && !(r0 < 0x7))
        {
            struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[eRoulette->var04_0].var02 / 4;
        }
        else
        {
            struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
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
                struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02 / 2;
            }
        }
        else if (!(r1 & 0x3))
        {
            if (!(r0 < 0xD))
            {
                struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02 / 2;
            }
            else
            {
                struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02;
            }
        }
        else if (r1 & (0x80 << 8))
        {
            if (!(r0 < 0xD))
            {
                struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02;
            }
            else
            {
                struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var01;
            }
        }
        else
        {
            struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
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
    u16 angles[0x4]; // angles in 90 degree steps
    memcpy(angles, &gUnknown_083F8ECE, 0x8);
    // u16 angles[] = {0, 180, 90, 270};
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
        SetMainCallback2(&c2_exit_to_overworld_2_switch);
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
    u32 t0[0x4];
    u32 t1[0x3];
    memcpy(t0, gUnknown_083F8ED8, 0x10);
    memcpy(t1, gUnknown_083F8EE8, 0xC);
    // u32 t0[] = {67650, 135300, 270600, 541200};
    // u32 t1[] = {0x3e0, 0x7c00, 0xf8000};
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
    u8 var0[5];
    memcpy(var0, gUnknown_083F8EF4, 5);
    // u8 var0[] = {0, 3, 4, 6, 12};
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

extern const u8 gUnknown_Debug_0842510D[];

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

void sub_8117838(u8 r0)
{
    if (!r0)
    {
        FreeAllSpritePalettes();
        LoadSpritePalettes(&gUnknown_083F9E30);
        LZ77UnCompWram(gUnknown_083F92A8, ewram17000);
        LZ77UnCompWram(gUnknown_083F90FC, ewram17E00);
        LZ77UnCompWram(gUnknown_083F9D3C, ewram18000);
    }
    else
    {
        FreeAllSpritePalettes();
    }
}

u8 sub_8117890(const struct SpriteTemplate *r0, u8 r1, u16 *r2)
{
    u16 temp;
    u8 spriteid = CreateSprite(r0, 0x74, 0x50, r0->oam->y);
    gSprites[spriteid].data[0]            = *r2;
    gSprites[spriteid].data[1]            = r1;
    gSprites[spriteid].coordOffsetEnabled = TRUE;
    gSprites[spriteid].animPaused         = TRUE;
    gSprites[spriteid].affineAnimPaused   = TRUE;
    temp = *r2;
    *r2 += 0x1E;
    if (*r2 > 0x167)
        *r2 = temp - 0x14A;
    return spriteid;
}

void sub_8117900(void)
{
    u8 i, j;
    u8 spriteid;
    struct SpriteSheet s;
    LZ77UnCompWram(gUnknown_083F9F54.data, gSharedMem);
    s.data = gSharedMem;
    s.size = gUnknown_083F9F54.size;
    s.tag  = gUnknown_083F9F54.tag;
    LoadSpriteSheet(&s);
    LZ77UnCompWram(gUnknown_083F9F5C.data, gSharedMem);
    s.data = gSharedMem;
    s.size = gUnknown_083F9F5C.size;
    s.tag  = gUnknown_083F9F5C.tag;
    LoadSpriteSheet(&s);
    for (i = 0; i < 0x3; i++)
    {
        u8 o = i * 0x18;
        for (j = 0; j < 0x4; j++)
        {
            spriteid = eRoulette->var3C[0x1D + i * 0x4 + j] =
                CreateSprite(&gSpriteTemplate_83FA07C[j], j * 0x18 + 0x94, o + 0x5C, 0x1E);
            gSprites[spriteid].animPaused = TRUE;
            o += 0x18;
            if (o > 0x47)
                o = 0x0;
        }
    }
    for (i = 0x0; i < 0x4; i++)
    {
        spriteid = eRoulette->var3C[0x29 + i] =
            CreateSprite(&gSpriteTemplate_83F9FD4[i], (s16)(i * 0x18 + 0x94), 0x46, 0x1E);
        gSprites[spriteid].animPaused = TRUE;
    }
    for (i = 0x0; i < 0x3; i++)
    {
        spriteid = eRoulette->var3C[0x2D + i] =
            CreateSprite(&gSpriteTemplate_83FA034[i], 0x7E, (s16)(i * 0x18 + 0x5C), 0x1E);
        gSprites[spriteid].animPaused = TRUE;
    }
}

void unref_sub_8117A74(void) //destroy all sprites at 0x1D
{
    u8 i;
    for (i = 0x0; i < 0xC; i++)
        DestroySprite(&gSprites[eRoulette->var3C[0x1D + i]]);
}

void sub_8117AA8(u8 r0, u8 r1)
{
    u8 i;
    switch (r0)
    {
    case 0x1:
        for (i = 0x0; i < 0x13; i++)
            gSprites[eRoulette->var3C[0x1D + i]].invisible = TRUE;
        break;
    case 0x0:
        for (i = 0x0; i < 0xC; i++)
        {
            if (!(eRoulette->var08 & gUnknown_083F8D90[i].var04))
                gSprites[eRoulette->var3C[0x1D + i]].invisible = FALSE;
            else if(!(gUnknown_083F8D90[i].var02 == r1))
                gSprites[eRoulette->var3C[0x1D + i]].invisible = TRUE;
            else
                gSprites[eRoulette->var3C[0x1D + i]].invisible = FALSE;
        }
        for (; i < 0x13; i++)
            gSprites[eRoulette->var3C[0x1D + i]].invisible = FALSE;
        break;
    }
}

void sub_8117BBC(void)
{
    u8 i;
    for (i = 0x0; i < 0x6; i++)
    {
        eRoulette->var3C[0x31 + i] = CreateSprite(&gSpriteTemplate_83FA40C, 0x74, 0x14, 0xA);
        gSprites[eRoulette->var3C[0x31 + i]].invisible    = TRUE;
        gSprites[eRoulette->var3C[0x31 + i]].data[0]      = 0x1;
        gSprites[eRoulette->var3C[0x31 + i]].callback     = &sub_81184CC;
        gSprites[eRoulette->var3C[0x31 + i]].oam.priority = 0x1;
        StartSpriteAnim(&gSprites[eRoulette->var3C[0x31 + i]], 0x8);
    }
}

void sub_8117C60(u8 r0, u8 r1)
{
    u8 i = 0x0;
    if (r0)
    {
        for ( ; i < 0x6; i++)
            gSprites[eRoulette->var3C[0x31 + i]].invisible = TRUE;
    }
    else
    {
        for ( ; i < 0x6; i++)
        {
            if (!(eRoulette->var0C[i]) || (i == r1))
            {
                gSprites[eRoulette->var3C[0x31 + i]].invisible = TRUE;
            }
            else
            {
                gSprites[eRoulette->var3C[0x31 + i]].invisible = FALSE;
                gSprites[eRoulette->var3C[0x31 + i]].pos1.x    = (gUnknown_083F8C00[eRoulette->var0C[i]].var03 + 0x1) * 0x8 + 0x4;
                gSprites[eRoulette->var3C[0x31 + i]].pos1.y    = (gUnknown_083F8C00[eRoulette->var0C[i]].var04 + 0x1) * 0x8 + 0x3;
            }
        }
    }
}

void sub_8117D68(u8 r0)
{
    if (!r0)
    {
        gSprites[eRoulette->var3C[0x30]].invisible = TRUE;
    }
    else
    {
        gSprites[eRoulette->var3C[0x30]].invisible = FALSE;
        gSprites[eRoulette->var3C[0x30]].pos1.x    = (gUnknown_083F8C00[r0].var03 + 0x2) * 0x8;
        gSprites[eRoulette->var3C[0x30]].pos1.y    = (gUnknown_083F8C00[r0].var04 + 0x2) * 0x8;
    }
}

void sub_8117DF4(void)
{
    u8 i, j;
    u16 k;
    struct SpriteSheet s;
    LZ77UnCompWram(gUnknown_083F9EE8.data, gSharedMem);
    s.data = gSharedMem;
    s.size = gUnknown_083F9EE8.size;
    s.tag  = gUnknown_083F9EE8.tag;
    LoadSpriteSheet(&s);
    k = 0xF;
    for (i = 0x0; i < 0x3; i++)
    {
        for (j = 0x0; j < 0x4; j++)
        {
            u8 spriteid;
            spriteid =
                eRoulette->var3C[0x7 + i * 0x4 + j] = sub_8117890(&gSpriteTemplate_83FA0DC[i * 0x4 + j], 0x28, &k);
            gSprites[spriteid].animPaused       = TRUE;
            gSprites[spriteid].affineAnimPaused = TRUE;
        }
    }
}

void sub_8117E98(struct Sprite *sprite)
{
    s16 cos;
    s16 sin;
    u32 matrixNum;
    s16 angle = eRoulette->var24 + sprite->data[0];
    if (angle >= 360)
        angle -= 360;
    sin = Sin2(angle);
    cos = Cos2(angle);
    sprite->pos2.x =  sin * sprite->data[1] >> 0xC;
    sprite->pos2.y = -cos * sprite->data[1] >> 0xC;
    matrixNum = sprite->oam.matrixNum;
    sin /= 16;
    gOamMatrices[matrixNum].d = cos /= 16;
    gOamMatrices[matrixNum].a = cos;
    gOamMatrices[matrixNum].b = sin;
    gOamMatrices[matrixNum].c = -sin;
}

void sub_8117F2C(void)
{
    u8 i;
    for (i = 0x0; i < 0x5; i++)
    {
        struct SpriteSheet s;
        LZ77UnCompWram(gUnknown_083FA21C[i].data, gSharedMem);
        s.data = gSharedMem;
        s.size = gUnknown_083FA21C[i].size;
        s.tag  = gUnknown_083FA21C[i].tag;
        LoadSpriteSheet(&s);
    }
    eRoulette->var3C[0x14] = CreateSprite(&gSpriteTemplate_83FA2B0, 0xD0, 0x10, 0x4);
    gSprites[eRoulette->var3C[0x14]].animPaused = TRUE;
    for (i = 0x0; i < 0x4; i++)
    {
        eRoulette->var3C[0x15 + i] = CreateSprite(&gSpriteTemplate_83FA2C8, (s16)(i * 0x8 + 0xC4), 0x18, 0x0);
        gSprites[eRoulette->var3C[0x15 + i]].invisible = TRUE;
        gSprites[eRoulette->var3C[0x15 + i]].animPaused = TRUE;
    }
    eRoulette->var3C[0x19] = CreateSprite(&gSpriteTemplate_83FA2E0, 0x78, 0x44, 0x4);
    gSprites[eRoulette->var3C[0x19]].animPaused = TRUE;
    for (i = 0x0; i < 0x3; i++)
    {
        eRoulette->var3C[0x1A + i] = CreateSprite(&gSpriteTemplate_83FA2F8, (s16)(i * 0x10 + 0xC0), 0x24, 0x4);
        gSprites[eRoulette->var3C[0x1A + i]].invisible = TRUE;
        gSprites[eRoulette->var3C[0x1A + i]].animPaused = TRUE;
    }
    eRoulette->var3C[0x30] = CreateSprite(&gSpriteTemplate_83FA310, 0x98, 0x60, 0x9);
    gSprites[eRoulette->var3C[0x30]].oam.priority = 0x1;
    gSprites[eRoulette->var3C[0x30]].animPaused = TRUE;
    gSprites[eRoulette->var3C[0x30]].invisible = TRUE;
}

void sub_81180F4(u16 r0)
{
    u8 i;
    u16 d = 1000;
    bool8 v = FALSE;
    for (i = 0x0; i < 0x4; i++)
    {
        u8 t = r0 / d;
        gSprites[eRoulette->var3C[0x15 + i]].invisible = TRUE;
        if (t > 0x0 || v || i == 0x3)
        {
            gSprites[eRoulette->var3C[0x15 + i]].invisible = FALSE;
            gSprites[eRoulette->var3C[0x15 + i]].oam.tileNum =
                gSprites[eRoulette->var3C[0x15 + i]].sheetTileStart
                + (*gSprites[eRoulette->var3C[0x15 + i]].anims + t)->type;
            v = TRUE;
        }
        r0 = r0 % d;
        d = d / 10;
    }
}

u8 sub_81181E8(u8 r0)
{
    u8 t[5];
    memcpy(t, gUnknown_083FA608, sizeof t);
    // u8 t = {0, 1, 2, 3, 4};
    if (r0 >= 20)
        r0 = 0;
    switch (gUnknown_083F8C00[r0].var01_0)
    {
    case 0x3:
        r0 = r0 / 5 - 1;
        if (eRoulette->var16[r0] < 4)
            return t[((vu8 *)eRoulette->var16)[r0] + 1]; // couldn't recreate redundant loads
        break;
    case 0x4:
        r0--;
        if (eRoulette->var12[r0] < 3)
            return t[((vu8 *)eRoulette->var12)[r0] + 2];
        break;
    case 0xC:
        if (!(eRoulette->var08 & gUnknown_083F8C00[r0].var08))
            return t[4];
        break;
    }
    return 0;
}

void sub_811829C(u8 r0)
{
    struct Sprite *s = &gSprites[eRoulette->var3C[0x19]];
    s->animCmdIndex  = sub_81181E8(r0);
    s->oam.tileNum   =
        s->sheetTileStart
        + (*s->anims + s->animCmdIndex)->type;
}

void sub_81182F8(u8 r0)
{
    u8 i;
    u8 t = 0x0;
    if (eRoulette->var19 == 0x1)
        t = 0x2;
    switch (r0)
    {
    case 0x6:
        for (i = 0x0; i < 0x3; i++)
        {
            gSprites[eRoulette->var3C[0x1A + i]].invisible = FALSE;
            gSprites[eRoulette->var3C[0x1A + i]].oam.tileNum =
                gSprites[eRoulette->var3C[0x1A + i]].sheetTileStart
                + (*gSprites[eRoulette->var3C[0x1A + i]].anims)->type;
        }
        break;
    case 0x5:
        gSprites[eRoulette->var3C[0x1C]].oam.tileNum =
            gSprites[eRoulette->var3C[0x1C]].sheetTileStart
            + (*gSprites[eRoulette->var3C[0x1C]].anims + t + 0x1)->type;
        break;
    case 0x4:
        gSprites[eRoulette->var3C[0x1C]].oam.tileNum =
            gSprites[eRoulette->var3C[0x1C]].sheetTileStart
            + (*gSprites[eRoulette->var3C[0x1C]].anims + t + 0x2)->type;
        break;
    case 0x3:
        gSprites[eRoulette->var3C[0x1B]].oam.tileNum =
            gSprites[eRoulette->var3C[0x1B]].sheetTileStart
            + (*gSprites[eRoulette->var3C[0x1B]].anims + t + 0x1)->type;
        break;
    case 0x2:
        gSprites[eRoulette->var3C[0x1B]].oam.tileNum =
            gSprites[eRoulette->var3C[0x1B]].sheetTileStart
            + (*gSprites[eRoulette->var3C[0x1B]].anims + t + 0x2)->type;
        break;
    case 0x1:
        gSprites[eRoulette->var3C[0x1A]].oam.tileNum =
            gSprites[eRoulette->var3C[0x1A]].sheetTileStart
            + (*gSprites[eRoulette->var3C[0x1A]].anims + t + 0x1)->type;
        break;
    case 0x0:
    default:
        for (i = 0x0; i < 0x3; i++)
        {
            gSprites[eRoulette->var3C[0x1A + i]].oam.tileNum =
                gSprites[eRoulette->var3C[0x1A + i]].sheetTileStart
                + (*gSprites[eRoulette->var3C[0x1A + i]].anims + t + 2)->type;
        }
    }
}

void sub_81184CC(struct Sprite *sprite)
{
    sprite->pos2.x = eRoulette->var26;
}

void sub_81184D8(void)
{
    u8 spriteid;
    struct SpriteSheet s;
    LZ77UnCompWram(gUnknown_083FA42C.data, gSharedMem);
    s.data = gSharedMem;
    s.size = gUnknown_083FA42C.size;
    s.tag  = gUnknown_083FA42C.tag;
    LoadSpriteSheet(&s);
    spriteid = CreateSprite(&gSpriteTemplate_83FA434, 0x74, 0x50, 0x51);
    gSprites[spriteid].data[0]            = eRoulette->var24;
    gSprites[spriteid].data[1]            = 0x0;
    gSprites[spriteid].animPaused         = TRUE;
    gSprites[spriteid].affineAnimPaused   = TRUE;
    gSprites[spriteid].coordOffsetEnabled = TRUE;
}

void sub_8118554(struct Sprite *sprite)
{
    u32 t = sprite->oam.matrixNum;
    struct OamMatrix *m = &gOamMatrices[0];
    m[t].d = eRoulette->var2C.a;
    m[t].a = eRoulette->var2C.a;
    m[t].b = eRoulette->var2C.b;
    m[t].c = eRoulette->var2C.c;
}

void sub_811857C(void)
{
    u8 i;
    for (i = 0x0; i < 0x6; i++)
    {
        u8 spriteid =
            eRoulette->var3C[i] = CreateSprite(&gSpriteTemplate_83FA40C, 0x74, 0x50, 0x39 - i);
        if (spriteid != 0x40)
        {
            gSprites[eRoulette->var3C[i]].invisible          = TRUE;
            gSprites[eRoulette->var3C[i]].coordOffsetEnabled = TRUE;
        }
    }
}

void sub_81185E8(void)
{
    u8 t = eRoulette->var3C[0x0];
    u8 i;
    for (i = 0x0; i < 0x6; i++)
    {
        u8 j;
        gSprites[t].invisible = TRUE;
        gSprites[t].callback = &SpriteCallbackDummy;
        StartSpriteAnim(&gSprites[t], 0x0);
        for (j = 0x0; j < 0x8; j++)
            gSprites[t].data[j] = 0x0;
        t++;
    }
}

s16 sub_811866C(struct Sprite *sprite)
{
    if (eRoulette->var24 > sprite->data[0x3])
    {
        sprite->data[0x6] = 360 - eRoulette->var24 + sprite->data[0x3];
        if (sprite->data[0x6] > 359)
            sprite->data[0x6] -=360;
    }
    else
        sprite->data[0x6] = sprite->data[0x3] - eRoulette->var24;
    return sprite->data[0x6];
}

u8 sub_81186B8(struct Sprite *sprite)
{
    eRoulette->var7E = (u8)(((float)(s16)sub_811866C(sprite)) / 30.0f);
    return eRoulette->var7E;
}

s16 sub_81186E8(struct Sprite *sprite)
{
    s16 t = sub_811866C(sprite) % 30;
    u16 z;
    if (t == 0xE)
    {
        z = 0x0;
        return sprite->data[0x2] = z;
    }
    else if (t > 0xD)
    {
        z = (u16)(0x2B - t);
        return sprite->data[0x2] = z;
    }
    else
    {
        z = (u16)(0xE - t);
        return sprite->data[0x2] = z;
    }
}

void sub_8118724(struct Sprite *sprite)
{
    s16 sin, cos;
    eRoulette->var8C += eRoulette->var90;
    eRoulette->var88 += eRoulette->var8C;
    if (eRoulette->var88 >= 360)
        eRoulette->var88 -= 360.0f;
    else
        if (eRoulette->var88 < 0.0f)
            eRoulette->var88 += 360.0f;
    sprite->data[0x3] = eRoulette->var88;
    eRoulette->var98 += eRoulette->var9C;
    eRoulette->var94 += eRoulette->var98;
    sprite->data[0x4] = eRoulette->var94;
    sin = Sin2(sprite->data[0x3]);
    cos = Cos2(sprite->data[0x3]);
    sprite->pos2.x =  sin * sprite->data[0x4] >> 0xC;
    sprite->pos2.y = -cos * sprite->data[0x4] >> 0xC;
    if (IsSEPlaying())
    {
        m4aMPlayPanpotControl(&gMPlay_SE1, 0xFFFF, sprite->pos2.x);
        m4aMPlayPanpotControl(&gMPlay_SE2, 0xFFFF, sprite->pos2.x);
    }
}

void sub_8118834(struct Sprite *sprite)
{
    s16 sin, cos;
    sprite->data[0x3] = eRoulette->var24 + sprite->data[0x6];
    if (sprite->data[0x3] > 359)
        sprite->data[0x3] -= 360;
    sin = Sin2(sprite->data[0x3]);
    cos = Cos2(sprite->data[0x3]);
    sprite->pos2.x =  sin * sprite->data[0x4] >> 0xC;
    sprite->pos2.y = -cos * sprite->data[0x4] >> 0xC;
    sprite->pos2.y += gSpriteCoordOffsetY;
}

void sub_811889C(struct Sprite *sprite)
{
    sub_8118724(sprite);
    sprite->data[0x2]++;
    if ((u16)(sprite->data[0x4] + 0x84) > 0xD4)
        sprite->invisible = TRUE;
    else
        sprite->invisible = FALSE;
    if (!(sprite->data[0x2] < 30))
    {
        if (!sprite->data[0x0])
        {
            if (eRoulette->var94 <= eRoulette->varA0 - 2.0f)
            {
                eRoulette->var7D = 0xFF;
                eRoulette->var03_7 = 0x0;
                StartSpriteAnim(sprite, sprite->animCmdIndex + 0x3);
                sub_81186B8(sprite);
                sprite->data[0x4] = 30;
                sub_811866C(sprite);
                sprite->data[0x6] = (sprite->data[0x6] / 30) * 30 + 0xF;
                sprite->callback = &sub_8118834;
                m4aSongNumStartOrChange(0x47);
                eRoulette->var9C = eRoulette->var98 = 0.0f;
                eRoulette->var8C = -1.0f;
            }
        }
        else
        {
            if (eRoulette->var94 >= eRoulette->varA0 - 2.0f)
            {
                eRoulette->var7D = 0xFF;
                eRoulette->var03_7 = 0x0;
                StartSpriteAnim(sprite, sprite->animCmdIndex + 0x3);
                sub_81186B8(sprite);
                sprite->data[0x4] = 30;
                sub_811866C(sprite);
                sprite->data[0x6] = (sprite->data[0x6] / 30) * 30 + 0xF;
                sprite->callback = &sub_8118834;
                m4aSongNumStartOrChange(0x47);
                eRoulette->var9C = eRoulette->var98 = 0.0f;
                eRoulette->var8C = -1.0f;
            }
        }
    }
}

void sub_81189A8(struct Sprite *sprite)
{
    float f0, f1, f2;
    struct StructgUnknown_083F8DF4 *p;
    sub_8118724(sprite);
    switch (sprite->data[0x3])
    {
    case 0:
        if (sprite->data[0x0] != 0x1)
        {
            f0 = ((float)sprite->data[0x7]);
            p = &gUnknown_083F8DF4[0];
            f1 = (f0 * ((float)(s32)p[eRoulette->var04_0].var01) + (float)((s32)p[eRoulette->var04_0].var02 - 0x1));
            f2 = (f0 / ((float)(s32)p[eRoulette->var04_0].var0C));
        }
        else
        {
            return;
        }
        break;
    case 180:
        if (sprite->data[0x0] != 0x0)
        {
            f0 = ((float)sprite->data[0x7]);
            p = &gUnknown_083F8DF4[0];
            f1 = (f0 * ((float)(s32)p[eRoulette->var04_0].var01) + (float)((s32)p[eRoulette->var04_0].var02 - 0x1));
            f2 = -(f0 / ((float)(s32)p[eRoulette->var04_0].var0C));
        }
        else
        {
            return;
        }
        break;
        default: return;
    }
    eRoulette->varA0 = eRoulette->var94;
    eRoulette->var98 = f2;
    eRoulette->var9C = -((f2 + f2) / f1 + (2.0f / (f1 * f1)));
    eRoulette->var8C = 0.0f;
    sprite->animPaused    = FALSE;
    sprite->animNum       = 0x0;
    sprite->animBeginning = TRUE;
    sprite->animEnded     = FALSE;
    sprite->callback      = &sub_811889C;
    sprite->data[0x2]     = 0x0;
}

void sub_8118B30(struct Sprite *sprite)
{
    sprite->pos2.y = (s32)(((float)sprite->data[0x2]) * 0.05f * ((float)sprite->data[0x2])) - 45;
    sprite->data[0x2]++;
    if (sprite->data[0x2] > 29 && sprite->pos2.y >= 0)
    {
        eRoulette->var7D   = 0xFF;
        eRoulette->var03_7 = FALSE;
        StartSpriteAnim(sprite, sprite->animCmdIndex + 0x3);
        sub_81186B8(sprite);
        sprite->data[0x4] = 30;
        sub_811866C(sprite);
        sprite->data[0x6] = (sprite->data[0x6] / 30) * 30 + 0xF;
        sprite->callback  = &sub_8118834;
        m4aSongNumStartOrChange(0x47);
        eRoulette->var03_6 = TRUE;
    }
}

void sub_8118BD8(struct Sprite *sprite)
{
    if (sprite->data[0x2]++ < 45)
    {
        sprite->pos2.y--;
        if (sprite->data[0x2] == 45)
        {
            if (gSprites[eRoulette->var3C[0x37]].animCmdIndex == 0x1)
                sprite->pos2.y++;
        }
    }
    else
    {
        if (sprite->data[0x2] < sprite->data[0x7])
        {
            if (gSprites[eRoulette->var3C[0x37]].animDelayCounter == 0x0)
            {
                if (gSprites[eRoulette->var3C[0x37]].animCmdIndex == 0x1)
                    sprite->pos2.y++;
                else
                    sprite->pos2.y--;
            }
        }
        else
        {
            sprite->animPaused    = FALSE;
            sprite->animNum       = 0x1;
            sprite->animBeginning = TRUE;
            sprite->animEnded     = FALSE;
            sprite->data[0x2]     = 0x0;
            sprite->callback      = &sub_8118B30;
            m4aSongNumStart(0x3D);
        }
    }
}

void sub_8118CAC(struct Sprite *sprite)
{
    sub_8118724(sprite);
    switch (sprite->data[0x3])
    {
    case 90:
        if (sprite->data[0x0] != 0x1)
        {
            sprite->callback  = &sub_8118BD8;
            sprite->data[0x2] = 0x0;
        }
        break;
    case 270:
        if (sprite->data[0x0] != 0x0)
        {
            sprite->callback  = &sub_8118BD8;
            sprite->data[0x2] = 0x0;
        }
        break;
    }
}

void sub_8118CEC(struct Sprite *sprite)
{
    sub_8118724(sprite);
    switch (eRoulette->var03_0)
    {
    default:
    case 0x0:
        sub_8119224(sprite);
        sprite->callback = &sub_81189A8;
        break;
    case 0x1:
        sub_81193D4(sprite);
        sprite->callback = &sub_8118CAC;
        break;
    }
}

void sub_8118D2C(struct Sprite *sprite)
{
    sub_8118724(sprite);
    if (sprite->data[0x2]-- == 0x10)
        eRoulette->var98 *= -1.0f;
    if (sprite->data[0x2] == 0x0)
    {
        if (!sprite->data[0x0])
        {
            eRoulette->var7D   = 0xFF;
            eRoulette->var03_7 = 0x0;
            StartSpriteAnim(sprite, sprite->animCmdIndex + 0x3);
            sub_81186B8(sprite);
            sprite->data[0x4] = 30;
            sub_811866C(sprite);
            sprite->data[0x6] = (sprite->data[0x6] / 30) * 30 + 15;
            sprite->callback  = &sub_8118834;
            m4aSongNumStartOrChange(0x47);
        }
        else
        {
            sprite->animPaused = TRUE;
            m4aSongNumStart(0x38);
            sub_811952C(sprite);
        }
    }
}

#if DEBUG

void debug_sub_812E698(struct Sprite *sprite)
{
    sub_8118724(sprite);
    sprite->data[2] = 0;
    sub_81186B8(sprite);
    m4aSongNumStart(0x38);
    if (Random() & 1)
    {
	    eRoulette->var8C = 0;
	    eRoulette->var7F = (eRoulette->var7E + 1) % 12;
    }
    else
    {
	    eRoulette->var8C = gUnknown_083F8DF4[eRoulette->var04_0].var1C * 2;
	    eRoulette->var7F = eRoulette->var7E;
    }
    sprite->data[0] = 1;
    sprite->data[2] = gUnknown_083F8DF4[eRoulette->var04_0].var02;
    eRoulette->var98 = 0.085;
    sprite->callback = sub_8118D2C;
    sprite->data[1] = 5;
}

#endif

void sub_8118DE4(struct Sprite *sprite)
{
    sub_8118724(sprite);
    sprite->data[0x2] = 0x0;
    sub_81186B8(sprite);
    if (!(gUnknown_083F8D90[eRoulette->var7E].var04 & eRoulette->var08))
    {
        eRoulette->var7D   = 0xFF;
        eRoulette->var03_7 = 0x0;
        StartSpriteAnim(sprite, sprite->animCmdIndex + 0x3);
        sub_81186B8(sprite);
        sprite->data[0x4] = 30;
        sub_811866C(sprite);
        sprite->data[0x6] = (sprite->data[0x6] / 30) * 30 + 15;
        sprite->callback  = &sub_8118834;
        m4aSongNumStartOrChange(SE_HASHI);
    }
    else
    {
        u8 t;
        u32 z;
        m4aSongNumStart(SE_KON);
        if ((z = (Random() & 0x1)))
        {
            u32 o;
            eRoulette->var8C = 0.0f;
            o = (eRoulette->var7E + 0x1) % 0xC;
            t = o;
            eRoulette->var7F = o;
        }
        else
        {
            eRoulette->var8C = gUnknown_083F8DF4[eRoulette->var04_0].var1C * 2; // couldn't replicate loads
            t = (eRoulette->var7E + 0xB) % 0xC;
            eRoulette->var7F = eRoulette->var7E;
        }
        if (gUnknown_083F8D90[t].var04 & eRoulette->var08)
        {
            sprite->data[0x0] = 0x1;
            sprite->data[0x2] = gUnknown_083F8DF4[eRoulette->var04_0].var02;
        }
        else
        {
            sprite->data[0x0] = gUnknown_083F8D90[t].var04 & eRoulette->var08;
            if (eRoulette->var04_0)
            {
                sprite->data[0x2] = gUnknown_083F8DF4[eRoulette->var04_0].var01;
            }
            else
            {
                sprite->data[0x2] = gUnknown_083F8DF4[eRoulette->var04_0].var02;
                if (z)
                {
                    eRoulette->var8C = 0.5f;
                }
                else
                {
                    eRoulette->var8C = -1.5f;
                }
            }
        }
        eRoulette->var98 = 0.085f;
        sprite->callback = sub_8118D2C;
        sprite->data[0x1] = 0x5;
    }
}

void sub_8118F8C(struct Sprite *sprite)
{
    sub_8118724(sprite);
    if (!(eRoulette->var8C > 0.5f))
    {
        sub_81186B8(sprite);
        if (!sub_81186E8(sprite))
        {
            struct StructgUnknown_083F8DF4 *p;
            eRoulette->var90 = 0.0f;
            p = &gUnknown_083F8DF4[0];
            eRoulette->var8C -= ((float)p[eRoulette->var04_0].var03)
                / ((float)(s16)(p[eRoulette->var04_0].var04 + 0x1));
            sprite->data[0x1] = 0x4;
#if DEBUG
            if (unk_2039560 != 0)
                sprite->callback = debug_sub_812E698;
            else
#endif
                sprite->callback = sub_8118DE4;
        }
        else
        {
            if (eRoulette->var90 != 0.0f)
            {
                if (eRoulette->var8C < 0.0f)
                {
                    eRoulette->var90 = 0.0f;
                    eRoulette->var8C = 0.0f;
                    eRoulette->var98 /= 1.2;
                }
            }
        }
    }
}

void sub_8119088(struct Sprite *sprite)
{
    sub_8118724(sprite);
    if (!(eRoulette->var94 > 40.f))
    {
        eRoulette->var98 = - (        4.0f / (float)(u16)eRoulette->var86);
        eRoulette->var90 = - (eRoulette->var8C / (float)(u16)eRoulette->var86);
        sprite->animNum       = 0x2;
        sprite->animBeginning = TRUE;
        sprite->animEnded     = FALSE;
        sprite->data[0x1]     = 0x3;
        sprite->callback      = &sub_8118F8C;
    }
}

void sub_8119134(struct Sprite *sprite)
{
    sub_8118724(sprite);
    if (!(eRoulette->var94 > 60.0f))
    {
        m4aSongNumStartOrChange(0x5D);
        eRoulette->var98 = - (                20.0f / (float)(u16)eRoulette->var84);
        eRoulette->var90 =   ((1.0f - eRoulette->var8C) / (float)(u16)eRoulette->var84);
        sprite->animNum       = 0x1;
        sprite->animBeginning = TRUE;
        sprite->animEnded     = FALSE;
        sprite->data[0x1]     = 0x2;
        sprite->callback      = &sub_8119088;
    }
}

void sub_81191F4(struct Sprite *sprite)
{
    sprite->data[0x1] = 0x1;
    sprite->data[0x2] = 0x0;
    sub_8118724(sprite);
    sprite->invisible = FALSE;
    sprite->callback  = &sub_8119134;
}

void sub_8119224(struct Sprite *sprite)
{
    u16 t;
    u8 i;
    s16 s[0x2][0x2];
    struct Roulette *p;
    memcpy(s, &gUnknown_083FA60E, 0x8);
    t = sprite->data[0x7] - 0x2;
    p = eRoulette;
    p->var3C[0x37] = CreateSprite(&gSpriteTemplate_83FA50C, 0x24, -0xC, 0x32);
    p->var3C[0x38] = CreateSprite(&gSpriteTemplate_83FA5C0[0x0], s[sprite->data[0x0]][0x0], s[sprite->data[0x0]][0x1], 0x3B);
    p->var3C[0x39] = CreateSprite(&gSpriteTemplate_83FA5C0[0x1], 0x24, 0x8C, 0x33);
    gSprites[eRoulette->var3C[0x39]].oam.objMode = 0x1;
    for (i = 0x0; i < 0x3; i++)
    {
        gSprites[eRoulette->var3C[0x37 + i]].coordOffsetEnabled = FALSE;
        gSprites[eRoulette->var3C[0x37 + i]].invisible          = TRUE;
        gSprites[eRoulette->var3C[0x37 + i]].animPaused         = TRUE;
        gSprites[eRoulette->var3C[0x37 + i]].affineAnimPaused   = TRUE;
        gSprites[eRoulette->var3C[0x37 + i]].data[0x4]          = eRoulette->var3C[0x37];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x5]          = eRoulette->var3C[0x38];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x6]          = eRoulette->var3C[0x39];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x2]          = t;
        gSprites[eRoulette->var3C[0x37 + i]].data[0x3]          = (sprite->data[0x7] * gUnknown_083F8DF4[eRoulette->var04_0].var01) +
                                                                (gUnknown_083F8DF4[eRoulette->var04_0].var02 + 0xFFFF);
    }
    gSprites[eRoulette->var3C[0x38]].coordOffsetEnabled = TRUE;
    eRoulette->var38 = sprite;
}

void sub_81193D4(struct Sprite *sprite)
{
    u8 i = 0;
    s16 t;
    s16 s[0x2][0x2];
    struct StructgUnknown_083F8DF4 *p;
    memcpy(s, &gUnknown_083FA616, 0x8);
    t = sprite->data[0x7] - 0x2;
    eRoulette->var3C[0x37] = CreateSprite(&gSpriteTemplate_83FA524, s[sprite->data[0x0]][0x0], s[sprite->data[0x0]][0x1], 0x32);
    StartSpriteAnim(&gSprites[eRoulette->var3C[0x37]], sprite->data[0x0]);
    eRoulette->var3C[0x38] = CreateSprite(&gSpriteTemplate_83FA5F0, s[sprite->data[0x0]][0x0], s[sprite->data[0x0]][0x1], 0x33);
    gSprites[eRoulette->var3C[0x38]].affineAnimPaused = TRUE;
    gSprites[eRoulette->var3C[0x38]].animPaused       = TRUE;
    sprite->data[0x7] = (t * (p = &gUnknown_083F8DF4[0])[eRoulette->var04_0].var01) + (p[eRoulette->var04_0].var10 + 0x2D);
    for (; i < 0x2; i++)
    {
        gSprites[eRoulette->var3C[0x37 + i]].data[0x4] = eRoulette->var3C[0x37];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x5] = eRoulette->var3C[0x38];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x6] = eRoulette->var3C[0x38];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x2] = t;
        gSprites[eRoulette->var3C[0x37 + i]].data[0x3] = sprite->data[0x7] - 0x2D;
    }
    eRoulette->var38 = sprite;
}

#ifdef NONMATCHING
void sub_811952C(struct Sprite *sprite)
{
    u8 i;
    u8 z;
    u16 o;
    u8 h = 0; // r10 (sp+0xc)
    u8 j = 5; // r9 (r9)
    u8 p = 0; // sp+0xc (sp+0x10)
    u8 s[10] = {}; // sp+0 (sp+0)
    u16 t = Random(); // sp+0x10 (r10)

    eRoulette->var7D   = 1;
    eRoulette->var03_5 = TRUE;
    eRoulette->var03_6 = FALSE;
    eRoulette->var7E   = 0xFF;
    eRoulette->var88   = sprite->data[3];
    eRoulette->var98   = 0.0f;
    eRoulette->var8C   = gUnknown_083F8DF4[eRoulette->var04_0].var1C;
    o = (eRoulette->var04_0 * 30 + 33) + (0x1 - eRoulette->var03_0) * 15;
    for (i = 0; i < 4; i++)
    {
        if (o < sprite->data[3] && sprite->data[3] <= o + 90)
        {
            sprite->data[0] = i << 1;
            eRoulette->var03_0 = i & 1;
            break;
        }
        if (i == 3)
        {
            sprite->data[0] = 1;
            eRoulette->var03_0 = 1;
            break;
        }
        o += 90;
    }
    if (eRoulette->var03_0)
    {
        if (sprite->data[0])
        {
            PlayCry1(SPECIES_TAILLOW, -0x3F);
        }
        else
        {
            PlayCry1(SPECIES_TAILLOW, 0x3F);
        }
    }
    else
    {
        PlayCry1(SPECIES_SHROOMISH, -0x3F);
    }
    i = 2;
    z = (eRoulette->var7F + 2) % 12;
    if (eRoulette->var03_0 == 1 && eRoulette->var04_0 == 1)
        j += 6;
    else
        j += i;
    for (; i < j; i++)
    {
        if (!(eRoulette->var08 & gUnknown_083F8D90[z].var04))
        {
            s[h++] = i;
            if (!p && (gUnknown_083F8D90[z].var04 & gUnknown_083F8C00[eRoulette->var1B[eRoulette->var1A_0]].var00))
            {
                p = i;
            }
        }
        z = (z + 1) % 0xC;
    }
    if ((eRoulette->var03_0 + 1) & eRoulette->var02)
    {
        if (p && (t & 0xFF) < 0xc0)
        {
            sprite->data[7] = p;
        }
        else
        {
            sprite->data[7] = s[t % h];
        }
    }
    else
    {
        sprite->data[7] = s[t % h];
    }
    sprite->callback = sub_8118CEC;
}
#else
NAKED
void sub_811952C(struct Sprite *sprite)
{
    asm_unified("push {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0x14\n"
                    "\tmov r8, r0\n"
                    "\tmovs r0, 0\n"
                    "\tmov r10, r0\n"
                    "\tmovs r1, 0x5\n"
                    "\tmov r9, r1\n"
                    "\tmovs r2, 0\n"
                    "\tstr r2, [sp, 0xC]\n"
                    "\tmov r0, sp\n"
                    "\tmovs r1, 0\n"
                    "\tmovs r2, 0xA\n"
                    "\tbl memset\n"
                    "\tbl Random\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tstr r0, [sp, 0x10]\n"
                    "\tldr r7, _08119610 @ =gSharedMem + 0x19000\n"
                    "\tadds r0, r7, 0\n"
                    "\tadds r0, 0x7D\n"
                    "\tmovs r6, 0x1\n"
                    "\tstrb r6, [r0]\n"
                    "\tldrb r4, [r7, 0x3]\n"
                    "\tmovs r0, 0x20\n"
                    "\torrs r4, r0\n"
                    "\tmovs r0, 0x41\n"
                    "\tnegs r0, r0\n"
                    "\tands r4, r0\n"
                    "\tstrb r4, [r7, 0x3]\n"
                    "\tadds r1, r7, 0\n"
                    "\tadds r1, 0x7E\n"
                    "\tmovs r0, 0xFF\n"
                    "\tstrb r0, [r1]\n"
                    "\tadds r5, r7, 0\n"
                    "\tadds r5, 0x88\n"
                    "\tmov r3, r8\n"
                    "\tmovs r1, 0x34\n"
                    "\tldrsh r0, [r3, r1]\n"
                    "\tbl __floatsisf\n"
                    "\tstr r0, [r5]\n"
                    "\tadds r1, r7, 0\n"
                    "\tadds r1, 0x98\n"
                    "\tldr r0, _08119614 @ =0x00000000\n"
                    "\tstr r0, [r1]\n"
                    "\tadds r3, r7, 0\n"
                    "\tadds r3, 0x8C\n"
                    "\tldr r2, _08119618 @ =gUnknown_083F8DF4\n"
                    "\tldrb r0, [r7, 0x4]\n"
                    "\tlsls r0, 30\n"
                    "\tlsrs r1, r0, 25\n"
                    "\tadds r2, 0x1C\n"
                    "\tadds r1, r2\n"
                    "\tldr r1, [r1]\n"
                    "\tstr r1, [r3]\n"
                    "\tlsrs r0, 30\n"
                    "\tlsls r1, r0, 4\n"
                    "\tsubs r1, r0\n"
                    "\tlsls r1, 1\n"
                    "\tadds r1, 0x21\n"
                    "\tlsls r4, 27\n"
                    "\tlsrs r4, 27\n"
                    "\tsubs r6, r4\n"
                    "\tlsls r0, r6, 4\n"
                    "\tsubs r0, r6\n"
                    "\tadds r1, r0\n"
                    "\tlsls r1, 16\n"
                    "\tlsrs r1, 16\n"
                    "\tmov r5, r10\n"
                    "\tmov r3, r8\n"
                    "\tmovs r0, 0x34\n"
                    "\tldrsh r2, [r3, r0]\n"
                    "_081195C8:\n"
                    "\tcmp r1, r2\n"
                    "\tbge _081195D4\n"
                    "\tadds r0, r1, 0\n"
                    "\tadds r0, 0x5A\n"
                    "\tcmp r2, r0\n"
                    "\tble _08119638\n"
                    "_081195D4:\n"
                    "\tcmp r5, 0x3\n"
                    "\tbeq _0811961C\n"
                    "\tadds r0, r1, 0\n"
                    "\tadds r0, 0x5A\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r1, r0, 16\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r5, r0, 24\n"
                    "\tcmp r5, 0x3\n"
                    "\tbls _081195C8\n"
                    "_081195EA:\n"
                    "\tldr r0, _08119610 @ =gSharedMem + 0x19000\n"
                    "\tldrb r1, [r0, 0x3]\n"
                    "\tmovs r0, 0x1F\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08119664\n"
                    "\tmov r1, r8\n"
                    "\tmovs r2, 0x2E\n"
                    "\tldrsh r0, [r1, r2]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08119658\n"
                    "\tmovs r0, 0x98\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r1, 0x3F\n"
                    "\tnegs r1, r1\n"
                    "\tbl PlayCry1\n"
                    "\tb _08119670\n"
                    "\t.align 2, 0\n"
                    "_08119610: .4byte gSharedMem + 0x19000\n"
                    "_08119614: .4byte 0x00000000\n"
                    "_08119618: .4byte gUnknown_083F8DF4\n"
                    "_0811961C:\n"
                    "\tmovs r0, 0x1\n"
                    "\tmov r3, r8\n"
                    "\tstrh r0, [r3, 0x2E]\n"
                    "\tldr r2, _08119634 @ =gSharedMem + 0x19000\n"
                    "\tldrb r1, [r2, 0x3]\n"
                    "\tsubs r0, 0x21\n"
                    "\tands r0, r1\n"
                    "\tmovs r1, 0x1\n"
                    "\torrs r0, r1\n"
                    "\tstrb r0, [r2, 0x3]\n"
                    "\tb _081195EA\n"
                    "\t.align 2, 0\n"
                    "_08119634: .4byte gSharedMem + 0x19000\n"
                    "_08119638:\n"
                    "\tlsrs r0, r5, 1\n"
                    "\tmov r1, r8\n"
                    "\tstrh r0, [r1, 0x2E]\n"
                    "\tldr r3, _08119654 @ =gSharedMem + 0x19000\n"
                    "\tmovs r1, 0x1\n"
                    "\tands r1, r5\n"
                    "\tldrb r2, [r3, 0x3]\n"
                    "\tmovs r0, 0x20\n"
                    "\tnegs r0, r0\n"
                    "\tands r0, r2\n"
                    "\torrs r0, r1\n"
                    "\tstrb r0, [r3, 0x3]\n"
                    "\tb _081195EA\n"
                    "\t.align 2, 0\n"
                    "_08119654: .4byte gSharedMem + 0x19000\n"
                    "_08119658:\n"
                    "\tmovs r0, 0x98\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r1, 0x3F\n"
                    "\tbl PlayCry1\n"
                    "\tb _08119670\n"
                    "_08119664:\n"
                    "\tmovs r0, 0x99\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r1, 0x3F\n"
                    "\tnegs r1, r1\n"
                    "\tbl PlayCry1\n"
                    "_08119670:\n"
                    "\tmovs r5, 0x2\n"
                    "\tldr r4, _081196A0 @ =gSharedMem + 0x19000\n"
                    "\tadds r0, r4, 0\n"
                    "\tadds r0, 0x7F\n"
                    "\tldrb r0, [r0]\n"
                    "\tadds r0, 0x2\n"
                    "\tmovs r1, 0xC\n"
                    "\tbl __modsi3\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r3, r0, 24\n"
                    "\tldrb r1, [r4, 0x3]\n"
                    "\tmovs r0, 0x1F\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0x1\n"
                    "\tbne _081196A4\n"
                    "\tldrb r1, [r4, 0x4]\n"
                    "\tmovs r0, 0x3\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0x1\n"
                    "\tbne _081196A4\n"
                    "\tmov r0, r9\n"
                    "\tadds r0, 0x6\n"
                    "\tb _081196A8\n"
                    "\t.align 2, 0\n"
                    "_081196A0: .4byte gSharedMem + 0x19000\n"
                    "_081196A4:\n"
                    "\tmov r2, r9\n"
                    "\tadds r0, r2, r5\n"
                    "_081196A8:\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tmov r9, r0\n"
                    "\tcmp r5, r9\n"
                    "\tbcs _0811970E\n"
                    "\tldr r6, _08119734 @ =gSharedMem + 0x19000\n"
                    "\tldr r7, _08119738 @ =gUnknown_083F8C00 + 0xC\n"
                    "_081196B6:\n"
                    "\tlsls r0, r3, 3\n"
                    "\tldr r1, _0811973C @ =gUnknown_083F8D90 + 0x4\n"
                    "\tadds r0, r1\n"
                    "\tldr r1, [r6, 0x8]\n"
                    "\tldr r2, [r0]\n"
                    "\tands r1, r2\n"
                    "\tcmp r1, 0\n"
                    "\tbne _081196F8\n"
                    "\tmov r0, r10\n"
                    "\tadds r1, r0, 0x1\n"
                    "\tlsls r1, 24\n"
                    "\tlsrs r1, 24\n"
                    "\tmov r10, r1\n"
                    "\tadd r0, sp\n"
                    "\tstrb r5, [r0]\n"
                    "\tldr r0, [sp, 0xC]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _081196F8\n"
                    "\tldrb r0, [r6, 0x1A]\n"
                    "\tlsls r0, 28\n"
                    "\tlsrs r0, 28\n"
                    "\tldr r1, _08119740 @ =gSharedMem + 0x1901B\n"
                    "\tadds r0, r1\n"
                    "\tldrb r1, [r0]\n"
                    "\tlsls r0, r1, 2\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadds r0, r7\n"
                    "\tldr r0, [r0]\n"
                    "\tands r2, r0\n"
                    "\tcmp r2, 0\n"
                    "\tbeq _081196F8\n"
                    "\tstr r5, [sp, 0xC]\n"
                    "_081196F8:\n"
                    "\tadds r0, r3, 0x1\n"
                    "\tmovs r1, 0xC\n"
                    "\tbl __modsi3\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r3, r0, 24\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r5, r0, 24\n"
                    "\tcmp r5, r9\n"
                    "\tbcc _081196B6\n"
                    "_0811970E:\n"
                    "\tldrb r0, [r4, 0x3]\n"
                    "\tlsls r0, 27\n"
                    "\tlsrs r0, 27\n"
                    "\tadds r0, 0x1\n"
                    "\tldrb r1, [r4, 0x2]\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08119756\n"
                    "\tldr r2, [sp, 0xC]\n"
                    "\tcmp r2, 0\n"
                    "\tbeq _08119744\n"
                    "\tmovs r0, 0xFF\n"
                    "\tldr r3, [sp, 0x10]\n"
                    "\tands r0, r3\n"
                    "\tcmp r0, 0xBF\n"
                    "\tbhi _08119744\n"
                    "\tmov r0, r8\n"
                    "\tstrh r2, [r0, 0x3C]\n"
                    "\tb _08119766\n"
                    "\t.align 2, 0\n"
                    "_08119734: .4byte gSharedMem + 0x19000\n"
                    "_08119738: .4byte gUnknown_083F8C00 + 0xC\n"
                    "_0811973C: .4byte gUnknown_083F8D90 + 0x4\n"
                    "_08119740: .4byte gSharedMem + 0x1901B\n"
                    "_08119744:\n"
                    "\tldr r0, [sp, 0x10]\n"
                    "\tmov r1, r10\n"
                    "\tbl __modsi3\n"
                    "\tadd r0, sp\n"
                    "\tldrb r0, [r0]\n"
                    "\tmov r1, r8\n"
                    "\tstrh r0, [r1, 0x3C]\n"
                    "\tb _08119766\n"
                    "_08119756:\n"
                    "\tldr r0, [sp, 0x10]\n"
                    "\tmov r1, r10\n"
                    "\tbl __modsi3\n"
                    "\tadd r0, sp\n"
                    "\tldrb r0, [r0]\n"
                    "\tmov r2, r8\n"
                    "\tstrh r0, [r2, 0x3C]\n"
                    "_08119766:\n"
                    "\tldr r3, _0811977C @ =sub_8118CEC\n"
                    "\tmov r0, r8\n"
                    "\tstr r3, [r0, 0x1C]\n"
                    "\tadd sp, 0x14\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_0811977C: .4byte sub_8118CEC");
}
#endif

void sub_8119780(struct Sprite *sprite)
{
    if (sprite->data[1]++ >= sprite->data[3])
    {
	sprite->pos1.x -= 2;
        if (sprite->pos1.x < -16)
        {
            if (!eRoulette->var03_6)
                eRoulette->var03_6 = TRUE;
            DestroySprite(sprite);
            eRoulette->var01 = 0;
            eRoulette->var34 = gUnknown_083FA61E[0];
        }
    }
}

void sub_81197D8(struct Sprite *sprite)
{
    u16 t[0x3][0x4];
    s32 p, z;

    memcpy(t, &gUnknown_083FA632, 24);
    if (sprite->data[1]++ < sprite->data[3])
    {
        if (sprite->data[1] & 1)
        {
            gSpriteCoordOffsetY = t[sprite->data[2] / 2][sprite->data[7]];
            p = z = sprite->data[7] + 1;
            if (z < 0)
                p += 3;
            sprite->data[7] = z - ((p >> 2) * 4);
        }
        sprite->invisible ^= 1;
    }
    else
    {
        gSpriteCoordOffsetY = 0x0;
        gSprites[eRoulette->var3C[0x37]].animPaused = FALSE;
        DestroySprite(sprite);
    }
}

void sub_8119898(struct Sprite *sprite)
{
    float t;
    sprite->data[0x1]++;
    t = sprite->data[0x1];
    sprite->pos2.y = t * 0.039f * t;
    eRoulette->var34 = gUnknown_083FA61E[(eRoulette->var01 - 0x1) / 2];
    if (eRoulette->var01 < 0x13)
        eRoulette->var01++;
    if (sprite->data[0x1] > 0x3C)
    {
        sprite->data[0x1] = 0x0;
        sprite->callback = &sub_8119780;
        gSprites[sprite->data[0x6]].callback  = &sub_8119780;
        gSprites[sprite->data[0x6]].data[0x1] = -0x2;
        gSprites[sprite->data[0x5]].invisible = FALSE;
        gSprites[sprite->data[0x5]].callback  = &sub_81197D8;
        m4aSongNumStart(0xD6);
    }
}

void sub_8119964(struct Sprite *sprite)
{
    if (sprite->data[0x7] == 0x0)
    {
        register u32 t asm("r2");
        u32 z ;
        if (eRoulette->var38->data[0x0] == 0x0)
        {
            t = eRoulette->var38->data[0x3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var08;
        }
        else
        {
            t = eRoulette->var38->data[0x3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var08;
            z += 0xB4;
        }
        if (t == z)
        {
            sprite->invisible = FALSE;
            sprite->data[0x7]++;
            m4aSongNumStart(0x2B);
            eRoulette->var01 = 0x1;
            eRoulette->var34 = gUnknown_083FA61E[0x0];
        }
    }
    else
    {
        u32 t, z;
        eRoulette->var34 = gUnknown_083FA61E[(eRoulette->var01 - 0x1) / 2];
        if (eRoulette->var01 < 0x13)
            eRoulette->var01++;
        if (eRoulette->var38->data[0x0] == 0x0)
        {
            t = eRoulette->var38->data[0x3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var0A;
        }
        else
        {
            t = eRoulette->var38->data[0x3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var0A ;
            z += 0xB4;
        }
        if (t == z)
        {
            gSprites[sprite->data[0x4]].callback  = &sub_8119898;
            gSprites[sprite->data[0x4]].invisible = FALSE;
            sprite->callback  = &SpriteCallbackDummy;
            sprite->data[0x7] = 0x0;
        }
    }
}

void sub_8119A90(struct Sprite *sprite)
{
    sprite->invisible ^= 0x1;
}

void sub_8119AAC(struct Sprite *sprite)
{
    if (sprite->pos1.y > -0x10)
    {
        sprite->pos1.y--;
    }
    else
    {
        sprite->callback   = &SpriteCallbackDummy;
        sprite->invisible  = TRUE;
        sprite->animPaused = TRUE;
        m4aSongNumStop(0x5E);
        DestroySprite(sprite);
        FreeOamMatrix(gSprites[eRoulette->var3C[0x38]].oam.matrixNum);
        DestroySprite(&gSprites[eRoulette->var3C[0x38]]);
    }
}

void sub_8119B24(struct Sprite *sprite)
{
    if (sprite->data[0x1] >= 0x0)
    {
        sprite->data[0x1]--;
        sprite->pos1.y--;
        if (sprite->data[0x1] == 0x0 && sprite->animCmdIndex == 0x1)
            sprite->pos2.y++;
    }
    else
    {
        if (sprite->data[0x3] >= 0x0)
        {
            sprite->data[0x3]--;
            if (sprite->animDelayCounter == 0x0)
            {
                if (sprite->animCmdIndex == 0x1)
                    sprite->pos2.y++;
                else
                    sprite->pos2.y--;
            }
        }
        else
        {
            m4aSongNumStart(0x2B);
            StartSpriteAnim(sprite, eRoulette->var38->data[0x0] + 0x4);
            sprite->callback = &sub_8119AAC;
            gSprites[sprite->data[0x6]].affineAnimPaused = FALSE;
        }
    }
}

void sub_8119BCC(struct Sprite *sprite)
{
    s8 t[0x2]; //sign
    s8 z[0x8][0x2];
    memcpy(t, &gUnknown_083FA64A, 0x2);
    memcpy(z, &gUnknown_083FA64C, 0x10);
    if (sprite->data[0x1]-- > 0x7)
    {
        sprite->pos1.x += t[eRoulette->var38->data[0x0]] * 0x2;
        if (IsSEPlaying())
        {
            s8 u =  -((0x74 - sprite->pos1.x) / 0x2);
            m4aMPlayPanpotControl(&gMPlay_SE1, 0xFFFF,u);
            m4aMPlayPanpotControl(&gMPlay_SE2, 0xFFFF, u);
        }
    }
    else
    {
        if (sprite->data[0x1] >= 0x0)
        {
            sprite->pos1.x += t[eRoulette->var38->data[0x0]] * z[0x7 - sprite->data[0x1]][0x0];
            sprite->pos1.y += z[0x7 - sprite->data[0x1]][0x1];
        }
        else
        {
            m4aSongNumStartOrChange(0x5E);
            if (eRoulette->var38->data[0x0] == 0x0)
                PlayCry1(SPECIES_TAILLOW, 0x3F);
            else
                PlayCry1(SPECIES_TAILLOW, -0x3F);
            StartSpriteAnim(sprite, eRoulette->var38->data[0x0] + 0x2);
            sprite->data[0x1] = 45;
            sprite->callback = &sub_8119B24;
        }
    }
}

void sub_8119D08(struct Sprite *sprite)
{
    s8 t[0x2]; //sign
    memcpy(t, &gUnknown_083FA64A, 0x2);
    if (sprite->data[0x1]-- >= 0x0)
    {
        sprite->pos1.x += t[eRoulette->var38->data[0x0]] * 0x2;
        gSprites[sprite->data[0x6]].invisible ^= 0x1;
    }
    else
    {
        sprite->callback = &sub_8119A90;
    }
}

void sub_8119D80(struct Sprite *sprite)
{
    if (eRoulette->var38->data[0x0] == 0x0)
    {
        if (eRoulette->var38->data[0x3] == gUnknown_083F8DF4[eRoulette->var04_0].var12 + 90)
        {
            gSprites[sprite->data[0x6]].data[0x1] = 0x34;
            gSprites[sprite->data[0x4]].data[0x1] = 0x34;
        }
        else
        {
            return;
        }
    }
    else
    {
        if (eRoulette->var38->data[0x3] == gUnknown_083F8DF4[eRoulette->var04_0].var14 + 270)
        {
            gSprites[sprite->data[0x6]].data[0x1] = 0x2E;
            gSprites[sprite->data[0x4]].data[0x1] = 0x2E;
        }
        else
        {
            return;
        }
    }
    gSprites[sprite->data[0x6]].callback = &sub_8119D08;
    gSprites[sprite->data[0x4]].callback = &sub_8119BCC;
    m4aSongNumStart(0x2B);
}
