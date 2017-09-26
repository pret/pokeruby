#include "global.h"
#include "roulette.h"
#include "roulette_util.h"
#include "task.h"
#include "palette.h"
#include "text.h"
#include "pokemon.h"
#include "species.h"
#include "rtc.h"
#include "main.h"
#include "menu_helpers.h"
#include "unknown_task.h"
#include "menu.h"
#include "trig.h"
#include "sprite.h"
#include "menu_cursor.h"
#include "sound.h"
#include "songs.h"
#include "m4a.h"
#include "rng.h"
#include "game_stat.h"
#include "rom4.h"
#include "string_util.h"
#include "field_fadetransition.h"

extern u8 gUnknown_02019000[];
extern u16 gSpecialVar_0x8004;
extern struct Unkg083F8DF4 gUnknown_083F8DF4[];
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
extern const u8 gUnknown_083F86BC[];
extern const u8 gUnknown_083F88BC[];
extern const u8 gUnknown_083F8A60[];

extern u16 gPlttBufferFaded[];
extern u16 gPlttBufferUnfaded[];

extern const u8 gUnknown_081C4157[];

extern const struct YesNoFuncTable gUnknown_083F8EBC;
extern const u8 gUnknown_081C41E3;

extern const u16 gUnknown_083F8ECE;

struct StructUnknown_083F8C00
{
    u8 var00;
    u8 var01;
    u16 var02;
    u32 var04;
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

extern const struct StructUnknown_083F8C00 gUnknown_083F8C00[];

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

void sub_8117434(void);

void sub_8117838(u8);
void sub_811857C(void);
void sub_81184D8(void);
void sub_8117F2C(void);
void sub_8117900(void);
void sub_8117BBC(void);
void sub_8117DF4(void);

void sub_81180F4(u16);
void sub_81182F8(u8);
void sub_811829C(u8);
void sub_8117158(u8);

void sub_81156BC(u8);
void sub_8115634(u8);

void sub_8116CAC(u8);
void sub_8116CF8(void);
void sub_81185E8(void);
void sub_81182F8(u8);
void sub_81159BC(u8);
void sub_8116C34(u8, TaskFunc, u16, u16);

void sub_8116AB0(u8);

void sub_8115E14(u8);

void sub_8116EF8(u8);

void sub_8115ECC(u8);

u8 sub_8117380(u8);

void sub_8117AA8(u8, u8);
void sub_8117C60(u8, u8);
void sub_8116100(u8);

void sub_8116308(u8);

void sub_81191F4(struct Sprite *);
void sub_811637C(u8);

u8 sub_8116D54(u8, u8);
u8 sub_8116E5C(u8 ,u8);
void sub_8116474(u8);

void sub_81184CC(struct Sprite *);
void sub_8117D68(u8);
void sub_8116514(u8);

void sub_8116638(u8);

void sub_811677C(u8);
void sub_81167F4(u8);

void sub_8116880(u8);
void sub_81157AC(u8);

void sub_8116B40(u8);


void dp01t_12_3_battle_menu(u8);

extern u8 ewram[];

#define ewram18a20  ((u16 *)                (ewram + 0x18a20))
#define ewram18a32  ((u16 *)                (ewram + 0x18A32))
#define ewram18a80  ((u16 *)                (ewram + 0x18a80))
#define ewram19000  ((u8 *)                 (ewram + 0x19000))
#define RDATA       ((struct RData *)       (ewram + 0x19000))

#define S16TOPOSFLOAT(val)   \
({                           \
    s16 v = (val);           \
    float f = (float)v;      \
    if(v < 0) f += 65536.0f; \
    f;                       \
})

struct Matrix
{
    s16 a;
    s16 b;
    s16 c;
    s16 d;
};

struct Unkg083F8DF4
{
    u8 var00;
    u8 var01;
    u8 var02;
    u8 var03;
    u8 var04;
    u8 v[0x13];
    s16 var18;
    s16 var1A; //is this signed or not ?
    u8 v2[0x4];
};

struct RData /* ewram + 0x19000 */
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
    u8 v7[0x3];
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
    struct Matrix var2C;
    u16 var34;
    u8 v99[0x2];
    struct Sprite *var38;
    u8 var3C[0x30]; // TODO: add some defines for the different areas
    u8 var6C;
    u8 v6[0xF];
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
    u8 varA5; // taskid
    u8 v51[0x2];
    u16 varA8;
    u16 varAA;
    TaskFunc varAC;
    u8 v46[0x4];
    TaskFunc varB4;
    struct UnkStruct0 varB8;
};


void sub_81150FC(void)
{
    u8 *p;
	struct UnkStruct0 *s;
	RunTasks();
	AnimateSprites();
	BuildOamBuffer();
    p = ewram19000;
	s = (struct UnkStruct0 *)(&p[0xB8]);
	if (s->val0)
	   task_tutorial_controls_fadein(s);
}

void sub_8115124(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_8117434();
    REG_BG1HOFS = 0x200 - RDATA->var26;
    if (RDATA->var01)
        REG_BLDALPHA = RDATA->var34;
    if (RDATA->var2A != 0)
    {
        DmaCopy16(3, &gBGTilemapBuffers[1][0xE0], (void *)(VRAM + 0x21C0), 0x340);
        RDATA->var2A = 0x0;
    }
    switch (RDATA->var28)
    {
    case 0x1:
        REG_BG0CNT = (0x20 * 0xF8);
        DmaCopy16(3, &gBGTilemapBuffers[2][0xE0], (void *)(VRAM + 0xF9C0), 0x340);
        RDATA->var28 = 0x2;
    break;
    case 0x2:
        DmaCopy16(3, &gBGTilemapBuffers[2][0xE0], (void *)(VRAM + 0xF9C0), 0x340);
    break;
    case 0xFF:
        REG_BG0CNT = 0x1F08;
        DmaFill16(3, 0x0, (void *)(VRAM + 0xF9C0), 0x340);
        RDATA->var28 = 0x0;
    break;
    case 0x0:
    }
}
#ifdef NONMATCHING
void sub_8115238(void)
{
    u8 i;
    u32 temp;
    struct Unkg083F8DF4 *s0;
    u16 arr[0x3]; // the third is never used ?
    memcpy(&arr, &gUnknown_083F8EC4, 0x6);
    memset(RDATA, 0x0, 0x17C);
    RDATA->var04_0 = (gSpecialVar_0x8004 & 0x1);
    if (gSpecialVar_0x8004 & 0x80)
        RDATA->var04_7 = 0x1;
    s0 = &gUnknown_083F8DF4[0];
    RDATA->var22   = s0[RDATA->var04_0].var03;
    RDATA->var23   = s0[RDATA->var04_0].var04;
    temp = gUnknown_083F8DF0[RDATA->var04_0 + RDATA->var04_7 * 2];
    RDATA->var19   = temp;
    RDATA->var1A_4 = 0x1;
    if (temp == 0x1)
    {
        u16 *faded = &gPlttBufferFaded[0];
        u16 *unfaded = &gPlttBufferUnfaded[0];
        faded[0x51]   = arr[0];
        faded[0x0]    = arr[0];
        unfaded[0x51] = arr[0];
        unfaded[0x0]  = arr[0];
    }
    else
    {
        u16 *faded = &gPlttBufferFaded[0];
        u16 *unfaded = &gPlttBufferUnfaded[0];
        faded[0x51]   = arr[1];
        faded[0x0]    = arr[1];
        unfaded[0x51] = arr[1];
        unfaded[0x0]  = arr[1];
    }
    sub_8124918((&RDATA->varB8));
    for (i = 0; i < 0xD; i++)
        sub_812492C((&RDATA->varB8), i, (struct UnkStruct1 *)&gUnknown_083F8E34[i * 8]);
    for (i = 0; i < 0x6; i++)
    {
        switch (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2))
        {
        case SPECIES_TAILLOW:
        RDATA->var02 |= 0x2;
        break;
        case SPECIES_SHROOMISH:
        RDATA->var02 |= 0x1;
        break;
        }
    }
    RtcCalcLocalTime();
}
#else
__attribute__((naked))
void sub_8115238(void)
{
    	asm(".syntax unified\n\
        push {r4-r6,lr}\n\
    	sub sp, 0x8\n\
    	ldr r1, _081152C0 @ =gUnknown_083F8EC4\n\
    	mov r0, sp\n\
    	movs r2, 0x6\n\
    	bl memcpy\n\
    	ldr r5, _081152C4 @ =0x02019000\n\
    	movs r2, 0xBE\n\
    	lsls r2, 1\n\
    	adds r0, r5, 0\n\
    	movs r1, 0\n\
    	bl memset\n\
    	ldr r0, _081152C8 @ =gSpecialVar_0x8004\n\
    	ldrh r2, [r0]\n\
    	movs r0, 0x1\n\
    	ands r0, r2\n\
    	ldrb r1, [r5, 0x4]\n\
    	movs r3, 0x4\n\
    	negs r3, r3\n\
    	ands r3, r1\n\
    	orrs r3, r0\n\
    	strb r3, [r5, 0x4]\n\
    	movs r0, 0x80\n\
    	ands r0, r2\n\
    	cmp r0, 0\n\
    	beq _08115276\n\
    	movs r0, 0x80\n\
    	orrs r3, r0\n\
    	strb r3, [r5, 0x4]\n\
    _08115276:\n\
    	ldr r3, _081152CC @ =gUnknown_083F8DF4\n\
    	ldrb r2, [r5, 0x4]\n\
    	lsls r1, r2, 30\n\
    	lsrs r0, r1, 25\n\
    	adds r0, r3\n\
    	ldrb r0, [r0, 0x3]\n\
    	adds r4, r5, 0\n\
    	adds r4, 0x22\n\
    	strb r0, [r4]\n\
    	lsrs r0, r1, 25\n\
    	adds r0, r3\n\
    	ldrb r0, [r0, 0x4]\n\
    	adds r3, r5, 0\n\
    	adds r3, 0x23\n\
    	strb r0, [r3]\n\
    	ldr r0, _081152D0 @ =gUnknown_083F8DF0\n\
    	lsrs r1, 30\n\
    	lsls r2, 24\n\
    	lsrs r2, 31\n\
    	lsls r2, 1\n\
    	adds r1, r2\n\
    	adds r1, r0\n\
    	ldrb r2, [r1]\n\
    	strb r2, [r5, 0x19]\n\
    	ldrb r1, [r5, 0x1A]\n\
    	movs r0, 0xF\n\
    	ands r0, r1\n\
    	movs r1, 0x10\n\
    	orrs r0, r1\n\
    	strb r0, [r5, 0x1A]\n\
    	cmp r2, 0x1\n\
    	bne _081152DC\n\
    	ldr r4, _081152D4 @ =gPlttBufferUnfaded\n\
    	ldr r3, _081152D8 @ =gPlttBufferFaded\n\
    	mov r0, sp\n\
    	ldrh r2, [r0]\n\
    	b _081152E4\n\
    	.align 2, 0\n\
    _081152C0: .4byte gUnknown_083F8EC4\n\
    _081152C4: .4byte 0x02019000\n\
    _081152C8: .4byte gSpecialVar_0x8004\n\
    _081152CC: .4byte gUnknown_083F8DF4\n\
    _081152D0: .4byte gUnknown_083F8DF0\n\
    _081152D4: .4byte gPlttBufferUnfaded\n\
    _081152D8: .4byte gPlttBufferFaded\n\
    _081152DC:\n\
    	ldr r4, _08115348 @ =gPlttBufferUnfaded\n\
    	ldr r3, _0811534C @ =gPlttBufferFaded\n\
    	mov r0, sp\n\
    	ldrh r2, [r0, 0x2]\n\
    _081152E4:\n\
    	adds r0, r3, 0\n\
    	adds r0, 0xA2\n\
    	strh r2, [r0]\n\
    	ldr r1, _08115350 @ =0x0000ffff\n\
    	adds r0, r1, 0\n\
    	ands r0, r2\n\
    	strh r0, [r3]\n\
    	ands r0, r1\n\
    	adds r2, r4, 0\n\
    	adds r2, 0xA2\n\
    	strh r0, [r2]\n\
    	ands r0, r1\n\
    	strh r0, [r4]\n\
    	ldr r0, _08115354 @ =0x020190b8\n\
    	bl sub_8124918\n\
    	movs r4, 0\n\
    	ldr r5, _08115358 @ =gUnknown_083F8E34\n\
    _08115308:\n\
    	lsls r2, r4, 3\n\
    	adds r2, r5\n\
    	ldr r0, _08115354 @ =0x020190b8\n\
    	adds r1, r4, 0\n\
    	bl sub_812492C\n\
    	adds r0, r4, 0x1\n\
    	lsls r0, 24\n\
    	lsrs r4, r0, 24\n\
    	cmp r4, 0xC\n\
    	bls _08115308\n\
    	movs r4, 0\n\
    	ldr r5, _0811535C @ =0x02019000\n\
    _08115322:\n\
    	movs r0, 0x64\n\
    	muls r0, r4\n\
    	ldr r1, _08115360 @ =gPlayerParty\n\
    	adds r0, r1\n\
    	movs r1, 0x41\n\
    	bl GetMonData\n\
    	adds r1, r0, 0\n\
    	movs r0, 0x98\n\
    	lsls r0, 1\n\
    	cmp r1, r0\n\
    	beq _08115364\n\
    	adds r0, 0x2\n\
    	cmp r1, r0\n\
    	bne _0811536C\n\
    	ldrb r0, [r5, 0x2]\n\
    	movs r1, 0x1\n\
    	b _08115368\n\
    	.align 2, 0\n\
    _08115348: .4byte gPlttBufferUnfaded\n\
    _0811534C: .4byte gPlttBufferFaded\n\
    _08115350: .4byte 0x0000ffff\n\
    _08115354: .4byte 0x020190b8\n\
    _08115358: .4byte gUnknown_083F8E34\n\
    _0811535C: .4byte 0x02019000\n\
    _08115360: .4byte gPlayerParty\n\
    _08115364:\n\
    	ldrb r0, [r5, 0x2]\n\
    	movs r1, 0x2\n\
    _08115368:\n\
    	orrs r0, r1\n\
    	strb r0, [r5, 0x2]\n\
    _0811536C:\n\
    	adds r0, r4, 0x1\n\
    	lsls r0, 24\n\
    	lsrs r4, r0, 24\n\
    	cmp r4, 0x5\n\
    	bls _08115322\n\
    	bl RtcCalcLocalTime\n\
    	add sp, 0x8\n\
    	pop {r4-r6}\n\
    	pop {r0}\n\
    	bx r0\n\
        .syntax divided\n");
}
#endif

void sub_8115384(void)
{
    u32 temp_IME;
    u8 taskid;
    switch (gMain.state)
    {
    case 0x0:
        SetVBlankCallback(NULL);
        remove_some_task();
        sub_80F9438();
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
        SetUpWindowConfig(&gWindowConfig_81E6C3C);
        InitMenuWindow(&gWindowConfig_81E6CE4);
        LoadPalette(&gUnknown_083F86BC, 0x0, 0x1C0);
        gMain.state++;
        break;
    case 0x3:
        sub_8115238();
        sub_80F9020();
        LZ77UnCompWram(&gUnknown_083F88BC, (void *)(ewram + 0x18800));
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
        MenuDrawTextWindow(0x0, 0xE, 0x1D, 0x13);
        MenuPrint(&gUnknown_081C4157[0], 0x1, 0xF);
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
        taskid = RDATA->varA4 = CreateTask(&sub_81156BC, 0x0);
        gTasks[taskid].data[0x6] = 0x6;
        gTasks[taskid].data[0xD] = gSaveBlock1.coins;
        RDATA->varA5 = CreateTask(&sub_8115634, 0x1);
        SetMainCallback2(&sub_81150FC);
        break;
    }
}

void sub_8115634(u8 unused)
{
    s16 sin;
    s16 cos;
    s32 cos32;
    if (RDATA->var21++ == RDATA->var23)
    {
        RDATA->var21 = 0x0;
        if ((RDATA->var24 -= RDATA->var22) < 0)
            RDATA->var24 = 0x168 - RDATA->var22;
    }
    sin = Sin2(RDATA->var24);
    cos = Cos2(RDATA->var24);
    sin = sin / 16;
    cos32 = cos / 16;
    RDATA->var2C.d =  cos32;
    RDATA->var2C.a =  cos32;
    RDATA->var2C.b =  sin;
    RDATA->var2C.c = -sin;
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
    MenuDrawTextWindow(0x0, 0xE, 0x1D, 0x13);
    MenuPrint(&gUnknown_081C41E3, 0x1, 0xF);
    DoYesNoFuncWithChoice(taskid, &gUnknown_083F8EBC);
}

void sub_811577C(u8 taskid)
{
    MenuZeroFillWindowRect(0x14, 0x8, 0x1A, 0xD);
    gTasks[taskid].func = &sub_81159BC;
}

void sub_81157AC(u8 taskid)
{
    DestroyTask(RDATA->varA5);
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
    }
}

void sub_8115928(u8 taskid, bool8 r1)
{
    if (!r1)
        sub_811829C(gTasks[taskid].data[0x4]);
    else
        sub_811829C(RDATA->var1B[RDATA->var1A_0]);
    sub_81157D0(gTasks[taskid].data[0x4]);
}

void sub_811597C(u8 taskid)
{
    RDATA->var28 = 0x1;
    sub_81157D0(gTasks[taskid].data[0x4]);
    RDATA->var23 = 0x2;
    RDATA->var21 = 0x0;
    gTasks[taskid].func = &sub_8115E14;
}

void sub_81159BC(u8 taskid)
{
    s16 i;
    if(RDATA->var08 & 0x20)
    {
        for (i = 0xB; (i < 0xE); i++)
            if ((RDATA->var08 & gUnknown_083F8C00[i].var08) == 0)
                break;
    }
    else
    {
        for (i = 0x6; (i < 0xA); i++)
            if ((RDATA->var08 & gUnknown_083F8C00[i].var08) == 0)
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

bool8 sub_8115A94(s16 *r0, u8 r1)
{
    s8 temp1 = 0;
    s8 temp = 0;
    s8 arr[0x4];
    s8 t;
    memcpy(&arr, gUnknown_083F8ECA, 0x4);
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
                        sub_8124D3C((&RDATA->varB8), 0xFFFF);
                        (&RDATA->varB8)->val3[0xF].field1 = 0x0;
                        (&RDATA->varB8)->val3[0xE].field1 = 0x0;
                        (&RDATA->varB8)->val3[0xD].field1 = 0x0;
                        sub_8116EF8(gTasks[r0].data[0x4]);
                        for (i = 0; i < 0x4; i++)
                        {
                            gSprites[RDATA->var3C[i + 0x29]].oam.tileNum =
                            gSprites[RDATA->var3C[i + 0x29]].sheetTileStart
                            + (*gSprites[RDATA->var3C[i + 0x29]].anims)->type;
                        }
                        if ((u16)(gTasks[r0].data[0x4] - 1) < 0x4 && !(RDATA->var08 & gUnknown_083F8C00[gTasks[r0].data[0x4]].var08) )
                        {
                            z = gTasks[r0].data[0x4] - 1;
                            gSprites[RDATA->var3C[z + 0x29]].oam.tileNum =
                            gSprites[RDATA->var3C[z + 0x29]].sheetTileStart
                            + (*gSprites[RDATA->var3C[z + 0x29]].anims + 1)->type;
                        }
                    }
}

void sub_8115D58(u8 r0)
{
    RDATA->var28 = 0xFF;
    if (RDATA->var19 == 1)
        RDATA->var23 = 1;
    else
        RDATA->var23 = 0;
    RDATA->var21 = 0;
    gTasks[r0].data[0x1] = 0x20;
    gTasks[r0].func = &sub_8115ECC;
}

void sub_8115DA0(u8 taskid)
{
    RDATA->var1B[RDATA->var1A_0] = gTasks[taskid].data[0x4];
    gTasks[taskid].data[0x2] = sub_8117380(RDATA->var1B[RDATA->var1A_0]);
    sub_811829C(RDATA->var1B[RDATA->var1A_0]);
    if ((gTasks[taskid].data[0xD] -= RDATA->var19) < 0)
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
        if ((RDATA->var08 & gUnknown_083F8C00[gTasks[taskid].data[0x4]].var08))
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
        if ((RDATA->var26 += 0x4) == 0x68)
            gSprites[RDATA->var3C[0x19]].callback = &SpriteCallbackDummy;
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
    switch (RDATA->var02)
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
                struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[RDATA->var04_0].var02 / 2;
            }
        }
        else if (!(r1 & 0x3))
        {
            struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[RDATA->var04_0].var02 / 2;
        }
        else
        {
            struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[RDATA->var04_0].var02;
        }
        break;
    case 0x3:
        // both are in party
        timeh = gLocalTime.hours - 0x4;
        if (!(timeh > 0x6))
        {
            if (r0 < 0x6 || (r1 & 0x1))
            {
                struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[RDATA->var04_0].var02 / 2;
            }
            else
            {
                return 0x1;
            }
        }
        else if ((r1 & 0x1) && !(r0 < 0x7))
        {
            struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[RDATA->var04_0].var02 / 4;
        }
        else
        {
            struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[RDATA->var04_0].var02 / 2;
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
                struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[RDATA->var04_0].var02 / 2;
            }
        }
        else if (!(r1 & 0x3))
        {
            if (!(r0 < 0xD))
            {
                struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[RDATA->var04_0].var02 / 2;
            }
            else
            {
                struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[RDATA->var04_0].var02;
            }
        }
        else if (r1 & (0x80 << 8))
        {
            if (!(r0 < 0xD))
            {
                struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[RDATA->var04_0].var02;
            }
            else
            {
                struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[RDATA->var04_0].var01;
            }
        }
        else
        {
            struct Unkg083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[RDATA->var04_0].var01 * 2;
        }
    }
}

#ifdef NONMATCHING
void sub_8116100(u8 taskid)
{
    u8 randf;
    u16 floatr;
    float tempf;
    u32 zzz;
    s8 randfinal;
    s8 r5;
    u16 g;
    u16 rand;
    u16 randmod;
    s16 angles[0x4]; // angles in 90 degree steps
    u8 zero = 0x0;
    memcpy(angles, &gUnknown_083F8ECE, 0x8);
    rand = Random();
    randmod = rand % 0x64;
    RDATA->var7C = gTasks[taskid].data[0x6];
    RDATA->var7F = zero;
    RDATA->var7E = zero;
    RDATA->var7D = zero;
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
    g = (&gUnknown_083F8DF4[RDATA->var04_0])->var1A;
    RDATA->var80 = (g + randfinal);
    tempf = S16TOPOSFLOAT(g + randfinal);
    // some register differences here
    floatr = tempf / 5.0f;
    zzz = floatr * 3;
    RDATA->var82 = floatr * 3;
    RDATA->var84 = floatr;
    RDATA->var86 = floatr;
    //
    RDATA->var88 = S16TOPOSFLOAT(angles[(rand & 0x1) + r5]);
    RDATA->var8C = S16TOPOSFLOAT((&gUnknown_083F8DF4[RDATA->var04_0])->var18);
    RDATA->var90 = ((RDATA->var8C * 0.5f) - RDATA->var8C) / S16TOPOSFLOAT(zzz);
    RDATA->var94 = 68.0f;
    RDATA->var9C = 0.0f;
    RDATA->var98 = -(8.0f / S16TOPOSFLOAT(zzz));
    RDATA->varA0 = 36.0f;
    gTasks[taskid].func = &sub_8116308;
}
#else
__attribute__((naked))
void sub_8116100(u8 taskid)
{
asm(".syntax unified\n\
push {r4-r7,lr}\n\
mov r7, r10\n\
mov r6, r9\n\
mov r5, r8\n\
push {r5-r7}\n\
sub sp, 0x8\n\
lsls r0, 24\n\
lsrs r0, 24\n\
mov r9, r0\n\
movs r4, 0\n\
ldr r1, _08116188 @ =gUnknown_083F8ECE\n\
mov r0, sp\n\
movs r2, 0x8\n\
bl memcpy\n\
bl Random\n\
lsls r0, 16\n\
lsrs r7, r0, 16\n\
adds r0, r7, 0\n\
movs r1, 0x64\n\
bl __umodsi3\n\
lsls r0, 16\n\
lsrs r6, r0, 16\n\
ldr r3, _0811618C @ =0x02019000\n\
ldr r1, _08116190 @ =gTasks\n\
mov r2, r9\n\
lsls r0, r2, 2\n\
add r0, r9\n\
lsls r0, 3\n\
adds r0, r1\n\
ldrh r2, [r0, 0x14]\n\
adds r1, r3, 0\n\
adds r1, 0x7C\n\
strb r2, [r1]\n\
adds r1, 0x3\n\
strb r4, [r1]\n\
subs r1, 0x1\n\
strb r4, [r1]\n\
subs r1, 0x1\n\
strb r4, [r1]\n\
ldrh r0, [r0, 0x18]\n\
adds r1, r7, 0\n\
bl sub_8115F58\n\
adds r4, r0, 0\n\
lsls r4, 24\n\
lsrs r1, r4, 24\n\
adds r0, r7, 0\n\
bl __modsi3\n\
lsrs r4, 25\n\
subs r0, r4\n\
lsls r0, 24\n\
lsrs r4, r0, 24\n\
ldr r0, _08116194 @ =gLocalTime\n\
ldrb r0, [r0, 0x2]\n\
lsls r0, 24\n\
asrs r0, 24\n\
movs r5, 0x1\n\
cmp r0, 0xC\n\
bgt _08116180\n\
movs r5, 0\n\
_08116180:\n\
cmp r6, 0x4F\n\
bhi _08116198\n\
lsls r0, r5, 25\n\
b _081161A2\n\
.align 2, 0\n\
_08116188: .4byte gUnknown_083F8ECE\n\
_0811618C: .4byte 0x02019000\n\
_08116190: .4byte gTasks\n\
_08116194: .4byte gLocalTime\n\
_08116198:\n\
lsls r1, r5, 24\n\
asrs r1, 24\n\
movs r0, 0x1\n\
subs r0, r1\n\
lsls r0, 25\n\
_081161A2:\n\
lsrs r5, r0, 24\n\
ldr r6, _081162D8 @ =0x02019000\n\
ldrb r0, [r6, 0x4]\n\
lsls r0, 30\n\
mov r10, r0\n\
lsrs r0, 25\n\
ldr r1, _081162DC @ =gUnknown_083F8DF4\n\
adds r0, r1\n\
lsls r4, 24\n\
asrs r4, 24\n\
ldrh r0, [r0, 0x1A]\n\
adds r4, r0\n\
adds r0, r6, 0\n\
adds r0, 0x80\n\
strh r4, [r0]\n\
lsls r4, 16\n\
asrs r4, 16\n\
adds r0, r4, 0\n\
bl __floatsisf\n\
cmp r4, 0\n\
bge _081161D4\n\
ldr r1, _081162E0 @ =0x47800000\n\
bl __addsf3\n\
_081161D4:\n\
ldr r1, _081162E4 @ =0x40a00000\n\
bl __divsf3\n\
bl __fixunssfsi\n\
lsls r0, 16\n\
lsrs r4, r0, 16\n\
lsls r0, r4, 1\n\
adds r0, r4\n\
mov r8, r0\n\
adds r0, r6, 0\n\
adds r0, 0x82\n\
mov r2, r8\n\
strh r2, [r0]\n\
adds r0, 0x2\n\
strh r4, [r0]\n\
adds r0, 0x2\n\
strh r4, [r0]\n\
movs r0, 0x1\n\
ands r0, r7\n\
lsls r1, r5, 24\n\
asrs r1, 24\n\
adds r0, r1\n\
lsls r0, 1\n\
add r0, sp\n\
movs r1, 0\n\
ldrsh r4, [r0, r1]\n\
adds r0, r4, 0\n\
bl __floatsisf\n\
cmp r4, 0\n\
bge _0811621A\n\
ldr r1, _081162E0 @ =0x47800000\n\
bl __addsf3\n\
_0811621A:\n\
ldr r2, _081162E8 @ =0x02019088\n\
str r0, [r2]\n\
adds r7, r6, 0\n\
adds r7, 0x8C\n\
mov r1, r10\n\
lsrs r0, r1, 25\n\
ldr r2, _081162DC @ =gUnknown_083F8DF4\n\
adds r0, r2\n\
movs r1, 0x18\n\
ldrsh r4, [r0, r1]\n\
adds r0, r4, 0\n\
bl __floatsisf\n\
adds r5, r0, 0\n\
cmp r4, 0\n\
bge _08116242\n\
ldr r1, _081162E0 @ =0x47800000\n\
bl __addsf3\n\
adds r5, r0, 0\n\
_08116242:\n\
str r5, [r7]\n\
adds r7, r6, 0\n\
adds r7, 0x90\n\
ldr r1, _081162EC @ =0x3f000000\n\
adds r0, r5, 0\n\
bl __mulsf3\n\
adds r1, r5, 0\n\
bl __subsf3\n\
adds r5, r0, 0\n\
mov r2, r8\n\
lsls r0, r2, 16\n\
asrs r4, r0, 16\n\
adds r0, r4, 0\n\
bl __floatsisf\n\
adds r2, r0, 0\n\
cmp r4, 0\n\
bge _08116272\n\
ldr r1, _081162E0 @ =0x47800000\n\
bl __addsf3\n\
adds r2, r0, 0\n\
_08116272:\n\
adds r0, r5, 0\n\
adds r1, r2, 0\n\
bl __divsf3\n\
str r0, [r7]\n\
adds r1, r6, 0\n\
adds r1, 0x94\n\
ldr r0, _081162F0 @ =0x42880000\n\
str r0, [r1]\n\
adds r1, 0x8\n\
ldr r0, _081162F4 @ =0x00000000\n\
str r0, [r1]\n\
adds r5, r6, 0\n\
adds r5, 0x98\n\
adds r0, r4, 0\n\
bl __floatsisf\n\
adds r2, r0, 0\n\
cmp r4, 0\n\
bge _081162A2\n\
ldr r1, _081162E0 @ =0x47800000\n\
bl __addsf3\n\
adds r2, r0, 0\n\
_081162A2:\n\
ldr r0, _081162F8 @ =0x41000000\n\
adds r1, r2, 0\n\
bl __divsf3\n\
bl __negsf2\n\
str r0, [r5]\n\
adds r1, r6, 0\n\
adds r1, 0xA0\n\
ldr r0, _081162FC @ =0x42100000\n\
str r0, [r1]\n\
ldr r1, _08116300 @ =gTasks\n\
mov r2, r9\n\
lsls r0, r2, 2\n\
add r0, r9\n\
lsls r0, 3\n\
adds r0, r1\n\
ldr r1, _08116304 @ =sub_8116308\n\
str r1, [r0]\n\
add sp, 0x8\n\
pop {r3-r5}\n\
mov r8, r3\n\
mov r9, r4\n\
mov r10, r5\n\
pop {r4-r7}\n\
pop {r0}\n\
bx r0\n\
.align 2, 0\n\
_081162D8: .4byte 0x02019000\n\
_081162DC: .4byte gUnknown_083F8DF4\n\
_081162E0: .4byte 0x47800000\n\
_081162E4: .4byte 0x40a00000\n\
_081162E8: .4byte 0x02019088\n\
_081162EC: .4byte 0x3f000000\n\
_081162F0: .4byte 0x42880000\n\
_081162F4: .4byte 0x00000000\n\
_081162F8: .4byte 0x41000000\n\
_081162FC: .4byte 0x42100000\n\
_08116300: .4byte gTasks\n\
_08116304: .4byte sub_8116308\n\
.syntax divided\n");
}
#endif

void sub_8116308(u8 taskid)
{
    u8 index;
    RDATA->var03_7 = 1;
    index = RDATA->var3C[RDATA->var7C];
    RDATA->var38 = &gSprites[index];
    (&gSprites[index])->callback = &sub_81191F4;
    gTasks[taskid].data[0x6]++;
    gTasks[taskid].data[0x8]++;
    sub_81182F8(0x6 - gTasks[taskid].data[0x6]);
    m4aSongNumStart(SE_TAMAKORO);
    gTasks[taskid].func = &sub_811637C;
}

void sub_811637C(u8 taskid)
{
    if (RDATA->var7D)
    {
        if (RDATA->var03_5)
        {
            if (RDATA->var03_6)
            {
                RDATA->var03_6 = FALSE;
                RDATA->var03_5 = FALSE;
            }
        }
        else
        {
            if (!gTasks[taskid].data[0x1])
            {
                u8 temp = sub_8116E5C(sub_8116D54(taskid, RDATA->var7E), RDATA->var1B[RDATA->var1A_0]);
                gTasks[taskid].data[0x5] = temp;
                if (temp == 1)
                    sub_8124CE8((&RDATA->varB8), 0x1000);
            }
            if (gTasks[taskid].data[0x1] < 0x3D)
            {
                if (gMain.newKeys & A_BUTTON)
                    gTasks[taskid].data[0x1] = 0x3C;
                gTasks[taskid].data[0x1]++;
            }
            else
            {
                sub_8117158(RDATA->var1B[RDATA->var1A_0]);
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
        if(gTasks[taskid].data[0x1] > 0x2)
            gSpriteCoordOffsetX -= 0x2;
        if((RDATA->var26 -= 0x4) == 0x68)
            gSprites[RDATA->var3C[0x19]].callback = &sub_81184CC;
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
        switch(gTasks[taskid].data[0x1] % 0x10)
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
    switch(gTasks[taskid].data[0x5])
    {
    case 0x1:
    case 0x2:
        if (IsFanfareTaskInactive())
        {
            u32 wins = GetGameStat(GAME_STAT_CONSECUTIVE_ROULETTE_WINS);
            if(wins < ++gTasks[taskid].data[0xB])
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
    switch(gTasks[taskid].data[0x5])
    {
    case 0x1:
    case 0x2:
        if (gTasks[taskid].data[0x2] == 0xC)
        {
            PlayFanfare(BGM_ME_B_BIG);
            MenuDrawTextWindow(0x0, 0xE, 0x1D, 0x13);
            MenuPrint(&gUnknown_081C41A5, 0x1, 0xF);
        }
        else
        {
            PlayFanfare(BGM_ME_B_SMALL);
            MenuDrawTextWindow(0x0, 0xE, 0x1D, 0x13);
            MenuPrint(&gUnknown_081C4199, 0x1, 0xF);
        }
        break;
    case 0:
    default:
        m4aSongNumStart(SE_HAZURE);
        MenuDrawTextWindow(0x0, 0xE, 0x1D, 0x13);
        MenuPrint(&gUnknown_081C41AE, 0x1, 0xF);
    }
    gTasks[taskid].data[0x1] = 0x0;
    gTasks[taskid].func = &sub_811659C;
}

void sub_81166E8(u8 taskid)
{
    s32 r0 = gTasks[taskid].data[0x7];
    switch(r0)
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
    ConvertIntToDecimalStringN((u8 *)&gStringVar1, (RDATA->var19 * gTasks[taskid].data[0x2]), STR_CONV_MODE_LEFT_ALIGN, 0x2);
    StringExpandPlaceholders((u8 *)&gStringVar4, &gUnknown_081C41BD);
    MenuDrawTextWindow(0x0, 0xE, 0x1D, 0x13);
    MenuPrint((u8 *)&gStringVar4, 0x1, 0xF);
    gTasks[taskid].data[0x1] = (RDATA->var19 * gTasks[taskid].data[0x2]);
    gTasks[taskid].data[0x7] = 0x0;
    gTasks[taskid].func = &sub_81166E8;
}

void sub_81167F4(u8 taskid)
{
    sub_8124D3C((&RDATA->varB8), 0xFFFF);
    (&RDATA->varB8)->val3[0xF].field1 = 0x0;
    (&RDATA->varB8)->val3[0xE].field1 = 0x0;
    (&RDATA->varB8)->val3[0xD].field1 = 0x0;
    gSprites[RDATA->var3C[0x7 + gUnknown_083F8C00[gTasks[taskid].data[0xC]].var00]].invisible = TRUE;
    gTasks[taskid].func = &sub_8116880;
}

void sub_8116880(u8 taskid)
{
    u8 i = 0;
    gTasks[taskid].data[0x4] = i;
    RDATA->var1B[RDATA->var1A_0] = 0x0;
    sub_8117158(0x0);
    gSprites[RDATA->var6C].invisible = TRUE;
    for (i = 0; i < 0x4; i++)
    {
        gSprites[RDATA->var3C[i + 0x29]].oam.tileNum =
        gSprites[RDATA->var3C[i + 0x29]].sheetTileStart
        + (*gSprites[RDATA->var3C[i + 0x29]].anims)->type;
    }
    if (!(gTasks[taskid].data[0xD] < RDATA->var19))
    {
        if (gTasks[taskid].data[0x6] == 0x6)
        {
            MenuDrawTextWindow(0x0, 0xE, 0x1D, 0x13);
            MenuPrint(&gUnknown_081C41F1, 0x1, 0xF);
            sub_8116C34(taskid, &dp01t_12_3_battle_menu, 0xFFFF, 0x3);
        }
        else if (gTasks[taskid].data[0xD] == 0x270F)
        {
            MenuDrawTextWindow(0x0, 0xE, 0x1D, 0x13);
            MenuPrint(&gUnknown_081C4231, 0x1, 0xF);
            sub_8116C34(taskid, &sub_8115734, 0xFFFF, 0x3);
        }
        else
        {
            gTasks[taskid].func = &sub_8115734;
        }
    }
    else
    {
        MenuDrawTextWindow(0x0, 0xE, 0x1D, 0x13);
        MenuPrint(&gUnknown_081C41D2, 0x1, 0xF);
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
        gSprites[RDATA->var3C[i + 0x7]].invisible = FALSE;
    if (gTasks[taskid].data[0xD] == 0x270F)
    {
        MenuDrawTextWindow(0x0, 0xE, 0x1D, 0x13);
        MenuPrint(&gUnknown_081C4231, 0x1, 0xF);
        sub_8116C34(taskid, &sub_8115734, 0xFFFF, 0x3);
    }
    else
    {
        gTasks[taskid].func = &sub_8115734;
    }
}

void sub_8116AB0(u8 taskid)
{
    sub_8124D3C((&RDATA->varB8), 0xFFFF);
    sub_8124918((&RDATA->varB8));
    gSaveBlock1.coins = gTasks[taskid].data[0xD];
    if (gSaveBlock1.coins < RDATA->var19)
        gSpecialVar_0x8004 = TRUE;
    else
        gSpecialVar_0x8004 = FALSE;
    BeginHardwarePaletteFade(0xFF, 0x0, 0x0, 0x10, 0x0);
    gTasks[taskid].func = &sub_8116B40;
}

void sub_8116B40(u8 taskid) // end oulette ?
{
    if (UpdatePaletteFade() == 0)
    {
        SetVBlankCallback(0x0);
        memset(RDATA, 0x0, 0x17C);
        gSpriteCoordOffsetX = gSpriteCoordOffsetY = 0x0;
        sub_80F9368();
        FreeAllSpritePalettes();
        ResetPaletteFade();
        ResetSpriteData();
        sub_80F9020();
        REG_BLDCNT = 0x0;
        REG_BLDALPHA = 0x0;
        REG_BLDY = 0x0;
        gFieldCallback = &sub_8080990;
        SetMainCallback2(&c2_exit_to_overworld_2_switch);
        DestroyTask(taskid);
    }
}

void sub_8116BC0(u8 taskid)
{
    if(RDATA->varA8 == 0 || gMain.newKeys & RDATA->varAA)
    {
        gTasks[taskid].func = RDATA->varAC;
        if (RDATA->varAA > 0)
            PlaySE(SE_SELECT);
        RDATA->varAC = NULL;
        RDATA->varAA = 0x0;
        RDATA->varA8 = 0x0;
    }
    if (RDATA->varA8 != 0xFFFF)
        RDATA->varA8--;
}

void sub_8116C34(u8 taskid, TaskFunc r1, u16 r2, u16 r3)
{
    RDATA->varB4 = gTasks[taskid].func;
    if(r1 == NULL)
        r1 = RDATA->varB4;
    RDATA->varAC = r1;
    RDATA->varA8 = r2;
    if (r2 == 0xFFFF && r3 == 0)
        RDATA->varAA = 0xFFFF;
    else
        RDATA->varAA = r3;
    gTasks[taskid].func = &sub_8116BC0;
}

void sub_8116CAC(u8 taskid)
{
    u8 i = 0;
    RDATA->var00 = i;
    RDATA->var03_0 = 0x0;
    RDATA->var03_5 = 0x0;
    RDATA->var03_6 = 0x0;
    RDATA->var03_7 = 0x0;
    for (i = 0; i < 0x6; i++)
        RDATA->var1B[i] = 0x0;
    RDATA->var1A_0 = 0x0;
    gTasks[taskid].data[0x1] = 0x0;
}

void sub_8116CF8(void)
{
    u8 i;
    RDATA->var08 = 0x0;
    for (i = 0; i < 0x6; i++)
        RDATA->var0C[i] = 0x0;
    for (i = 0; i < 0x4; i++)
        RDATA->var12[i] = 0x0;
    for (i = 0; i < 0x3; i++)
        RDATA->var16[i] = 0x0;
    sub_8117C60(0x1, 0xFF);
}

u8 sub_8116D54(u8 taskid, u8 r1)
{
    u32 t0[0x4];
    u32 t1[0x3];
    memcpy(t0, gUnknown_083F8ED8, 0x10);
    memcpy(t1, gUnknown_083F8EE8, 0xC);
    if (r1 > 0xB)
    {
        return 0x0;
    }
    else
    {
        u8 i;
        u8 z;
        RDATA->var0C[gTasks[taskid].data[0x6] - 1] = gUnknown_083F8D90[r1].var02;
        gTasks[taskid].data[0xC] = gUnknown_083F8D90[r1].var02;
        RDATA->var08 |= gUnknown_083F8D90[r1].var04;
        for (i = 0; i < 0x4; i++)
        {
            if (gUnknown_083F8D90[r1].var04 & t0[i])
                RDATA->var12[i]++;
            if (RDATA->var12[i] > 0x2)
                RDATA->var08 |= t0[i];
        }
        for (z = 0; z < 0x3; z++)
        {
            if (gUnknown_083F8D90[r1].var04 & t1[z])
                RDATA->var16[z]++;
            if (RDATA->var16[z] > 0x3)
                RDATA->var08 |= t1[z];
        }
        return gUnknown_083F8D90[r1].var02;
    }
}

u8 sub_8116E5C(u8 r0, u8 r1)
{
    u8 t = r0;
    if (--r0 < 0x13)
    {
        switch(r1)
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
/*
void sub_8116EF8(u8 r0)
{

    u32 var0 = 0x0;
    struct UnkStruct1 var1[0x3];
    u32 var2;
    u16 var3;
    u32 var4;
    u8 i;
    switch(r0)
    {
    case 0x5:
    case 0xA:
    case 0xF:
        for (i = (r0 + 0x1); i < (r0 + 0x5); i++)
            if (!(RDATA->var08 & gUnknown_083F8C00[i].var08))
                var0 |= gUnknown_083F8C00[i].var10;
        var0 &= 0xDFFF;
        sub_8124CE8(&RDATA->varB8, var0);
        break;
    default:
        memcpy(var1, gUnknown_083F8E9C, 0x18);
        if ((u8)(r0 - 0x1) < 0x4)
            var2 = 0x3;
        else
            var2 = 0x1;
        var3 = ((r0 / 0x5) - 0x1);
        switch((u8)r0 % 0x5)
        {
        case 0x1:
            var3 = gSprites[RDATA->var3C[0x7 + 0x0]].oam.paletteNum * 0x10;
            break;
        case 0x2:
            var3 = gSprites[RDATA->var3C[0x7 + 0x1]].oam.paletteNum * 0x10;
            break;
        case 0x3:
            var3 = gSprites[RDATA->var3C[0x7 + 0x2]].oam.paletteNum * 0x10;
            break;
        case 0x4:
            var3 = gSprites[RDATA->var3C[0x7 + 0x3]].oam.paletteNum * 0x10;
            break;
        }
        if (var2 == 0x1)
        {
            if (!(RDATA->var08 & gUnknown_083F8C00[r0].var08))
            {
                var4 = (r0 / 0x5);
                var1[var4 - 0x1].val1 += var3;
                sub_812492C(&RDATA->varB8, 0xD, &var1[var4 - 0x2]);
                sub_8124CE8(&RDATA->varB8, var0 |= gUnknown_083F8C00[r0].var10);
            }
        }
        else
        {
            //u8 i;
            for (i = 0; i < 0x3; i++)
            {
                u8 var4 = i * 0x5 + r0 + 0x5;
                if (!(RDATA->var08 & gUnknown_083F8C00[var4].var08))
                {
                    u8 var5 = (var4 / 0x5);
                    var1[var5 - 0x1].val1 += var3;
                    sub_812492C(&RDATA->varB8, (u8)(0xD + i), &var1[var5 - 0x2]);
                    if (var2 == 0x3)
                        var0 = gUnknown_083F8C00[var4].var10;
                    var2--;
                }
            }
            if (var2 != 0x2)
                var0 = 0x0;
            sub_8124CE8(&RDATA->varB8, var0 |= gUnknown_083F8C00[r0].var10);
        }
    }
}
*/
