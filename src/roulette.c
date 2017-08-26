#include "global.h"

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

struct StructUnknown_083F8C00
{
    u32 var00;
    u32 var04;
    u32 var08;
    u32 var0C;
    u32 var10;
};

extern const struct StructUnknown_083F8C00 gUnknown_083F8C00[];

const extern u8 gUnknown_083F8ECA[];


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


extern u8 ewram[];

#define ewram18a20  ((u16 *)                (ewram + 0x18a20))
#define ewram18a32  ((u16 *)                (ewram + 0x18A32))
#define ewram18a80  ((u16 *)                (ewram + 0x18a80))
#define ewram19000  ((u8 *)                 (ewram + 0x19000))
#define ewram190b8  ((u8 *)                 (ewram + 0x190B8))
#define RDATA       ((struct RData *)       (ewram + 0x19000))
#define UNKDATA     ((struct UnkStruct0 *)  (ewram + 0x190B8))

////////////////
struct OamMatrix
{
    s16 a;
    s16 b;
    s16 c;
    s16 d;
};

struct SpriteCopyRequest
{
    const u8 *src;
    u8 *dest;
    u16 size;
};

struct OamDimensions
{
    s8 width;
    s8 height;
};
////////////////

struct Unkg083F8DF4
{
    u8 var00;
    u8 var01;
    u8 var02;
    u8 var03;
    u8 var04;
    u8 v[0x1B];
};

struct RData /* ewram + 0x19000 */
{
    u8 v00;
    u8 var01;
    u8 var02;
    u8 v03;
    u8 var04_0:2;
    u8 var04_2:5;
    u8 var04_7:1;
    u8 v7[0x3];
    u32 var08; // may be bitfield
    u8 v0[0xD];
    u8 var19;
    u8 var1A_0:4;
    u8 var1A_4:4;
    u8 var1B[0x6];
    u8 var21;
    u8 var22;
    u8 var23;
    s16 var24;
    u16 var26;
    s16 var28;
    s16 var2A;
    struct OamMatrix var2C;
    u16 var34;
    u8 v99[0x6];
    u8 var3C;
    u8 v67[0x28];
    u8 var65[0x4];
    u8 v6[0x3B];
    u8 varA4;
    u8 varA5; // taskid
};


void sub_8117434(void);

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
    sub_8124918(UNKDATA);
    for (i = 0; i < 0xD; i++)
        sub_812492C(UNKDATA, i, (struct UnkStruct1 *)&gUnknown_083F8E34[i * 8]);
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
    bool8 var0;
    if (!(gMain.newKeys & DPAD_UP) || ((var0 = TRUE), sub_8115A94(&gTasks[r0].data[0x4], 0x0)))
        if (!(gMain.newKeys & DPAD_DOWN) || ((var0 = TRUE), sub_8115A94(&gTasks[r0].data[0x4], 0x1)))
            if (!(gMain.newKeys & DPAD_LEFT) || ((var0 = TRUE), sub_8115A94(&gTasks[r0].data[0x4], 0x2)))
                if (!(gMain.newKeys & DPAD_RIGHT) || ((var0 = TRUE), sub_8115A94(&gTasks[r0].data[0x4], 0x3)))
                    if (var0)
                    {
                        u8 i;
                        //u16 temp5;
                        sub_8117158(gTasks[r0].data[0x4]);
                        sub_8115928(r0, FALSE);
                        gTasks[r0].data[0x1] = 0;
                        PlaySE(0x5);
                        sub_8124D3C(UNKDATA, 0xFFFF);
                        UNKDATA->val3[0xF].field1 = 0x0;
                        UNKDATA->val3[0xE].field1 = 0x0;
                        UNKDATA->val3[0xD].field1 = 0x0;
                        sub_8116EF8(gTasks[r0].data[0x4]);
                        for (i = 0; i < 4; i++)
                        {
                            struct Sprite *sprite = &gSprites[RDATA->var65[i]];
                            //u16 *temp0 = ; //deoptimize ->var65
                            sprite->oam.tileNum = ((*sprite->anims)->type + sprite->sheetTileStart);
                        }
                        //temp5 = ();
                        if ((u16)(gTasks[r0].data[0x4] - 1) < 0x4)
                        {
                            if ((RDATA->var08 & gUnknown_083F8C00[gTasks[r0].data[0x4]].var08) == 0)
                            {
                                //u16 temp1 = gTasks[r0].data[0x4] - 1;
                                u32 temp2 = gSprites[RDATA->var65[(u8)(gTasks[r0].data[0x4] - 1)]].sheetTileStart;
                                temp2 += (u16)((*gSprites[RDATA->var65[r0]].anims + 1)->type);
                                gSprites[RDATA->var65[r0]].oam.tileNum = temp2;
                            }
                        }
                    }
}
