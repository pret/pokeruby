#include "global.h"
#include "main.h"
#include "rom4.h"
#include "task.h"
#include "palette.h"
#include "trig.h"
#include "field_effect.h"
#include "rng.h"
#include "sprite.h"

void sub_807DE10(void);
void dp12_8087EA4(void);

typedef bool8 (*TransitionState)(struct Task* task);

extern const TransitionState sMainTransitionPhases[];
extern const TransitionState sPhase2_Transition0_Funcs[];
extern const TransitionState sPhase2_Transition1_Funcs[];
extern const TransitionState sPhase2_Transition2_Funcs[];
extern const TransitionState sPhase2_Transition3_Funcs[];
extern const TransitionState sPhase2_Transition4_Funcs[];
extern const TransitionState sPhase2_Transition5_Funcs[];

extern const TaskFunc sPhase1_Tasks[];
extern const TaskFunc sPhase2_Tasks[];

extern u8 ewram[];
extern s16 gUnknown_03005560[];

extern u16 gUnknown_03004DE0[][0x3C0];

struct TransitionData
{
    vs8 field_0; // now that's interesting
    s8 field_1;
    s16 field_2;
    s16 field_4;
    s16 field_6;
    s16 field_8;
    s16 field_A;
    s16 field_C;
    s16 field_E;
    s16 field_10;
    s16 field_12;
    s16 field_14;
    s16 field_16;
    s16 field_18;
    s16 field_1A;
    s16 field_1C;
    s16 field_1E;
    s16 field_20;
    s16 field_22;
    s16 field_24;
    s16 field_26;
    s16 field_28;
    s16 field_2A;
    s16 field_2C;
    s16 field_2E;
};

#define TRANSITION_STRUCT   (*(struct TransitionData *)   (ewram + 0xC000))

// this file's functions
static void LaunchBattleTransitionTask(u8 transitionID);
static void Task_BattleTransitionMain(u8 taskID);
void sub_811D4C8(s16 a0, s16 a1, s16 a2, s16 a3, s16 a4);
bool8 sub_811D52C(void);
void sub_811D658(void);

static void VBlankCB_Phase2_Transition1(void);
static void HBlankCB_Phase2_Transition1(void);
static void VBlankCB_Phase2_Transition2(void);
static void HBlankCB_Phase2_Transition2(void);
void VBlankCB0_Phase2_Transition3(void);
void VBlankCB1_Phase2_Transition3(void);
void VBlankCB_Phase2_Transition5(void);

void VBlankCB_BattleTransition(void);
void sub_811D6E8(s16* a0, s16 a1, s16 a2, s16 a3, s16 a4, s16 a5);
void sub_811D6A8(u16** a0, u16** a1);
void sub_811D764(u16* a0, s16 a1, s16 a2, s16 a3);
void sub_811D6D4(void);
void sub_811D8FC(s16* a0, s16 a1, s16 a2, s16 a3, s16 a4, s16 a5, s16 a6);
bool8 sub_811D978(s16* a0, bool8 a1, bool8 a2);

void sub_811AABC(u8 transitionID)
{
    gMain.callback2 = sub_8054398;
    LaunchBattleTransitionTask(transitionID);
}

void sub_811AAD8(u8 transitionID)
{
    LaunchBattleTransitionTask(transitionID);
}

#define tState          data[0]
#define tTransitionID   data[1]
#define tTransitionDone data[15]

bool8 IsBattleTransitionDone(void)
{
    u8 taskID = FindTaskIdByFunc(Task_BattleTransitionMain);
    if (gTasks[taskID].tTransitionDone)
    {
        DestroyTask(taskID);
        return 1;
    }
    else
        return 0;
}

static void LaunchBattleTransitionTask(u8 transitionID)
{
    u8 taskID = CreateTask(Task_BattleTransitionMain, 2);
    gTasks[taskID].tTransitionID = transitionID;
}

static void Task_BattleTransitionMain(u8 taskID)
{
    while (sMainTransitionPhases[gTasks[taskID].tState](&gTasks[taskID]));
}

bool8 Transition_Phase1(struct Task* task)
{
    sub_807DE10();
    CpuSet(gPlttBufferFaded, gPlttBufferUnfaded, 0x4000100);
    if (sPhase1_Tasks[task->tTransitionID] != NULL)
    {
        CreateTask(sPhase1_Tasks[task->tTransitionID], 4);
        task->tState++;
        return 0;
    }
    else
    {
        task->tState = 2;
        return 1;
    }
}

bool8 Transition_WaitForPhase1(struct Task* task)
{
    if (FindTaskIdByFunc(sPhase1_Tasks[task->tTransitionID]) == 0xFF)
    {
        task->tState++;
        return 1;
    }
    else
        return 0;
}

bool8 Transition_Phase2(struct Task* task)
{
    CreateTask(sPhase2_Tasks[task->tTransitionID], 0);
    task->tState++;
    return 0;
}

bool8 Transition_WaitForPhase2(struct Task* task)
{
    task->tTransitionDone = 0;
    if (FindTaskIdByFunc(sPhase2_Tasks[task->tTransitionID]) == 0xFF)
        task->tTransitionDone = 1;
    return 0;
}

void Phase1Task_TransitionAll(u8 taskID)
{
    if (gTasks[taskID].tState == 0)
    {
        gTasks[taskID].tState++;
        sub_811D4C8(0, 0, 3, 2, 2);
    }
    else if (sub_811D52C())
        DestroyTask(taskID);
}

void Phase2Task_Transition0(u8 taskID)
{
    while (sPhase2_Transition0_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

bool8 Phase2_Transition0_Func1(struct Task* task)
{
    REG_MOSAIC = 0;
    REG_BG1CNT |= 0x40;
    REG_BG2CNT |= 0x40;
    REG_BG3CNT |= 0x40;
    task->tState++;
    return 1;
}

bool8 Phase2_Transition0_Func2(struct Task* task)
{
    if (task->data[1] != 0)
        task->data[1]--;
    else
    {
        task->data[1] = 4;
        if (++task->data[2] == 10)
            BeginNormalPaletteFade(-1, -1, 0, 0x10, 0);
        REG_MOSAIC = (task->data[2] & 15) * 17;
        if (task->data[2] > 14)
            task->tState++;
    }
    return 0;
}

bool8 Phase2_Transition0_Func3(struct Task* task)
{
    if (!gPaletteFade.active)
    {
        u8 taskID = FindTaskIdByFunc(Phase2Task_Transition0);
        DestroyTask(taskID);
    }
    return 0;
}

void Phase2Task_Transition1(u8 taskID)
{
    while (sPhase2_Transition1_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

bool8 Phase2_Transition1_Func1(struct Task* task)
{
    u16 savedIME;

    sub_811D658();
    dp12_8087EA4();
    BeginNormalPaletteFade(-1, 4, 0, 0x10, 0);
    sub_811D6E8(gUnknown_03005560, TRANSITION_STRUCT.field_14, 0, 2, 0, 160);

    SetVBlankCallback(VBlankCB_Phase2_Transition1);
    SetHBlankCallback(HBlankCB_Phase2_Transition1);

    savedIME = REG_IME;
    REG_IME = 0;
    REG_IE |= 3;
    REG_IME = savedIME;
    REG_DISPSTAT |= 0x18;

    task->tState++;
    return 0;
}

bool8 Phase2_Transition1_Func2(struct Task* task)
{
    TRANSITION_STRUCT.field_0 = 0;
    task->data[1] += 4;
    task->data[2] += 8;

    sub_811D6E8(gUnknown_03004DE0[0], TRANSITION_STRUCT.field_14, task->data[1], 2, task->data[2], 160);

    if (!gPaletteFade.active)
    {
        u8 taskID = FindTaskIdByFunc(Phase2Task_Transition1);
        DestroyTask(taskID);
    }

    TRANSITION_STRUCT.field_0++;
    return 0;
}

static void VBlankCB_Phase2_Transition1(void)
{
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.field_0)
        DmaCopy16(3, gUnknown_03004DE0[0], gUnknown_03004DE0[1], 320);
}

static void HBlankCB_Phase2_Transition1(void)
{
    u16 var = gUnknown_03004DE0[1][REG_VCOUNT];
    REG_BG1HOFS = var;
    REG_BG2HOFS = var;
    REG_BG3HOFS = var;
}

void Phase2Task_Transition2(u8 taskID)
{
    while (sPhase2_Transition2_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

bool8 Phase2_Transition2_Func1(struct Task* task)
{
    u16 savedIME;

    sub_811D658();
    dp12_8087EA4();

    BeginNormalPaletteFade(-1, 4, 0, 0x10, 0);
    memset(gUnknown_03005560, TRANSITION_STRUCT.field_16, 0x140);

    SetVBlankCallback(VBlankCB_Phase2_Transition2);
    SetHBlankCallback(HBlankCB_Phase2_Transition2);

    savedIME = REG_IME;
    REG_IME = 0;
    REG_IE |= 3;
    REG_IME = savedIME;
    REG_DISPSTAT |= 0x18;

    task->tState++;
    return 0;
}

bool8 Phase2_Transition2_Func2(struct Task* task)
{
    u8 i;
    u16 r3, r4;

    TRANSITION_STRUCT.field_0 = 0;
    r4 = task->data[1];
    r3 = task->data[2] >> 8;
    task->data[1] += 4224;
    task->data[2] += 384;

    for (i = 0; i < 160; i++, r4 += 4224)
    {
        u16 var = r4 / 256;
        gUnknown_03004DE0[0][i] = TRANSITION_STRUCT.field_16 + Sin(var, r3);
    }

    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition2));

    TRANSITION_STRUCT.field_0++;
    return 0;
}

static void VBlankCB_Phase2_Transition2(void)
{
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.field_0)
        DmaCopy16(3, gUnknown_03004DE0[0], gUnknown_03004DE0[1], 320);
}

static void HBlankCB_Phase2_Transition2(void)
{
    u16 var = gUnknown_03004DE0[1][REG_VCOUNT];
    REG_BG1VOFS = var;
    REG_BG2VOFS = var;
    REG_BG3VOFS = var;
}

void Phase2Task_Transition3(u8 taskID)
{
    while (sPhase2_Transition3_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

extern const u8 gUnknown_083FBB88[];
extern const u16 gFieldEffectObjectPalette10[];

bool8 Phase2_Transition3_Func1(struct Task* task)
{
    u16 i;
    u16 *dst1, *dst2;

    sub_811D658();
    dp12_8087EA4();

    task->data[1] = 16;
    task->data[2] = 0;
    task->data[4] = 0;
    task->data[5] = 0x4000;
    TRANSITION_STRUCT.field_2 = 63;
    TRANSITION_STRUCT.field_4 = 0;
    TRANSITION_STRUCT.field_6 = 240;
    TRANSITION_STRUCT.field_8 = 160;
    TRANSITION_STRUCT.field_E = 0x3F41;
    TRANSITION_STRUCT.field_10 = task->data[1] * 256; // 16 * 256 = 0x1000

    for (i = 0; i < 160; i++)
    {
        gUnknown_03005560[i] = 240;
    }

    SetVBlankCallback(VBlankCB0_Phase2_Transition3);

    sub_811D6A8(&dst1, & dst2);
    CpuFill16(0, dst1, 0x800);
    CpuSet(gUnknown_083FBB88, dst2, 0x2C0);
    LoadPalette(gFieldEffectObjectPalette10, 240, 32);

    task->tState++;
    return 0;
}

extern const u16 gUnknown_083FDB44[];

bool8 Phase2_Transition3_Func2(struct Task* task)
{
    s16 i, j;
    u16 *dst1, *dst2;
    const u16* var;

    var = gUnknown_083FDB44;
    sub_811D6A8(&dst1, &dst2);
    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 30; j++, var++)
        {
            dst1[i * 32 + j] = *var | 0xF000;
        }
    }
    sub_811D6E8(gUnknown_03004DE0[0], 0, task->data[4], 132, task->data[5], 160);

    task->tState++;
    return 1;
}

bool8 Phase2_Transition3_Func3(struct Task* task)
{
    TRANSITION_STRUCT.field_0 = 0;
    if (task->data[3] == 0 || --task->data[3] == 0)
    {
        task->data[2]++;
        task->data[3] = 2;
    }
    TRANSITION_STRUCT.field_10 = (task->data[1] << 8) | task->data[2];
    if (task->data[2] > 15)
        task->tState++;
    task->data[4] += 8;
    task->data[5] -= 256;

    sub_811D6E8(gUnknown_03004DE0[0], 0, task->data[4], 132, task->data[5] >> 8, 160);

    TRANSITION_STRUCT.field_0++;
    return 0;
}

bool8 Phase2_Transition3_Func4(struct Task* task)
{
    TRANSITION_STRUCT.field_0 = 0;
    if (task->data[3] == 0 || --task->data[3] == 0)
    {
        task->data[1]--;
        task->data[3] = 2;
    }
    TRANSITION_STRUCT.field_10 = (task->data[1] << 8) | task->data[2];
    if (task->data[1] == 0)
        task->tState++;
    task->data[4] += 8;
    task->data[5] -= 256;

    sub_811D6E8(gUnknown_03004DE0[0], 0, task->data[4], 132, task->data[5] >> 8, 160);

    TRANSITION_STRUCT.field_0++;
    return 0;
}

bool8 Phase2_Transition3_Func5(struct Task* task)
{
    TRANSITION_STRUCT.field_0 = 0;
    task->data[4] += 8;
    task->data[5] -= 256;

    sub_811D6E8(gUnknown_03004DE0[0], 0, task->data[4], 132, task->data[5] >> 8, 160);

    if (task->data[5] <= 0)
    {
        task->tState++;
        task->data[1] = 160;
        task->data[2] = 256;
        task->data[3] = 0;
    }

    TRANSITION_STRUCT.field_0++;
    return 0;
}

bool8 Phase2_Transition3_Func6(struct Task* task)
{
    TRANSITION_STRUCT.field_0 = 0;
    if (task->data[2] < 1024)
        task->data[2] += 128;
    if (task->data[1] != 0)
    {
        task->data[1] -= (task->data[2] >> 8);
        if (task->data[1] < 0)
            task->data[1] = 0;
    }
    sub_811D764(gUnknown_03004DE0[0], 120, 80, task->data[1]);
    if (task->data[1] == 0)
    {
        DmaStop(0);
        sub_811D6D4();
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition3));
    }
    if (task->data[3] == 0)
    {
        task->data[3]++;
        SetVBlankCallback(VBlankCB1_Phase2_Transition3);
    }

    TRANSITION_STRUCT.field_0++;
    return 0;
}

static void Transition3_Vblank(void)
{
    DmaStop(0);
    VBlankCB_BattleTransition();
    if (TRANSITION_STRUCT.field_0)
        DmaCopy16(3, gUnknown_03004DE0[0], gUnknown_03004DE0[1], 320);
    REG_WININ = TRANSITION_STRUCT.field_2;
    REG_WINOUT = TRANSITION_STRUCT.field_4;
    REG_WIN0V = TRANSITION_STRUCT.field_8;
    REG_BLDCNT = TRANSITION_STRUCT.field_E;
    REG_BLDALPHA = TRANSITION_STRUCT.field_10;
}

void VBlankCB0_Phase2_Transition3(void)
{
    Transition3_Vblank();
    DmaSet(0, gUnknown_03005560, &REG_BG0HOFS, 0xA2400001);
}

void VBlankCB1_Phase2_Transition3(void)
{
    Transition3_Vblank();
    DmaSet(0, gUnknown_03005560, &REG_WIN0H, 0xA2400001);
}

void Phase2Task_Transition4(u8 taskID)
{
    while (sPhase2_Transition4_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

extern const u8 gUnknown_083FC108[];

bool8 Phase2_Transition4_Func1(struct Task* task)
{
    u16 *dst1, *dst2;

    sub_811D6A8(&dst1, &dst2);
    CpuSet(gUnknown_083FC108, dst2, 0x20);
    CpuFill32(0, dst1, 0x800);
    LoadPalette(gFieldEffectObjectPalette10, 0xF0, 0x20);

    task->tState++;
    return 0;
}

extern const s16 gUnknown_083FD7E4[2];
extern const s16 gUnknown_083FD7F2[2];
extern const s16 gUnknown_083FD7E8[5];

bool8 Phase2_Transition4_Func2(struct Task* task)
{
    s16 i;
    s16 rand;
    s16 arr0[2];
    s16 arr1[5];

    memcpy(arr0, gUnknown_083FD7E4, sizeof(gUnknown_083FD7E4));
    memcpy(arr1, gUnknown_083FD7E8, sizeof(gUnknown_083FD7E8));
    rand = Random() & 1;
    for (i = 0; i <= 4; i++, rand ^= 1)
    {
        gUnknown_0202FF84[0] = arr0[rand];      // x
        gUnknown_0202FF84[1] = (i * 32) + 16;   // y
        gUnknown_0202FF84[2] = rand;
        gUnknown_0202FF84[3] = arr1[i];
        FieldEffectStart(FLDEFF_POKEBALL);
    }

    task->tState++;
    return 0;
}

bool8 Phase2_Transition4_Func3(struct Task* task)
{
    if (!FieldEffectActiveListContains(FLDEFF_POKEBALL))
    {
        sub_811D6D4();
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition4));
    }
    return 0;
}

extern const struct SpriteTemplate gSpriteTemplate_83FD98C;

bool8 FldEff_Pokeball(void)
{
    u8 spriteID = CreateSpriteAtEnd(&gSpriteTemplate_83FD98C, gUnknown_0202FF84[0], gUnknown_0202FF84[1], 0);
    gSprites[spriteID].oam.priority = 0;
    gSprites[spriteID].oam.affineMode = 1;
    gSprites[spriteID].data0 = gUnknown_0202FF84[2];
    gSprites[spriteID].data1 = gUnknown_0202FF84[3];
    gSprites[spriteID].data2 = -1;
    InitSpriteAffineAnim(&gSprites[spriteID]);
    StartSpriteAffineAnim(&gSprites[spriteID], gUnknown_0202FF84[2]);
    return 0;
}

#ifdef NONMATCHING
void sub_811B720(struct Sprite* sprite)
{
    s16 arr0[2];

    memcpy(arr0, gUnknown_083FD7F2, sizeof(gUnknown_083FD7F2));
    if (sprite->data1 != 0)
        sprite->data1--;
    else
    {
        if (sprite->pos1.x < 240)
        {
            s32 posY = sprite->pos1.y >> 3;
            s32 posX = sprite->pos1.x >> 3;
            if ((posX >> 3) != sprite->data2)
            {
                u32 var;

                sprite->data2 = (posX);
                var = (((REG_BG0CNT >> 8) & 0x1F) << 10);

                vram[MULTI_DIM_ARR(posY - 2, 32, posX)] = 0xF001;
                vram[MULTI_DIM_ARR(posY - 1, 32, posX)] = 0xF001;
                vram[MULTI_DIM_ARR(posY - 0, 32, posX)] = 0xF001;
                vram[MULTI_DIM_ARR(posY + 0, 32, posX)] = 0xF001;
            }
        }
        sprite->pos1.x += arr0[sprite->data0];
        if (sprite->pos1.x + 15 > 270)
            FieldEffectStop(sprite, FLDEFF_POKEBALL);
    }
}
#else
__attribute__((naked))
void sub_811B720(struct Sprite* sprite)
{
    asm(".syntax unified\n\
        	push {r4-r6,lr}\n\
	sub sp, 0x4\n\
	adds r4, r0, 0\n\
	ldr r1, _0811B740 @ =gUnknown_083FD7F2\n\
	mov r0, sp\n\
	movs r2, 0x4\n\
	bl memcpy\n\
	ldrh r1, [r4, 0x30]\n\
	movs r2, 0x30\n\
	ldrsh r0, [r4, r2]\n\
	cmp r0, 0\n\
	beq _0811B744\n\
	subs r0, r1, 0x1\n\
	strh r0, [r4, 0x30]\n\
	b _0811B7D6\n\
	.align 2, 0\n\
_0811B740: .4byte gUnknown_083FD7F2\n\
_0811B744:\n\
	ldrh r0, [r4, 0x20]\n\
	lsls r1, r0, 16\n\
	lsrs r0, r1, 16\n\
	cmp r0, 0xF0\n\
	bhi _0811B7B2\n\
	asrs r0, r1, 19\n\
	lsls r0, 16\n\
	ldrh r1, [r4, 0x22]\n\
	lsls r1, 16\n\
	asrs r1, 19\n\
	lsls r1, 16\n\
	lsrs r1, 16\n\
	lsrs r2, r0, 16\n\
	asrs r5, r0, 16\n\
	movs r3, 0x32\n\
	ldrsh r0, [r4, r3]\n\
	cmp r5, r0\n\
	beq _0811B7B2\n\
	strh r2, [r4, 0x32]\n\
	ldr r0, _0811B7E0 @ =REG_BG0CNT\n\
	ldrh r2, [r0]\n\
	lsrs r2, 8\n\
	movs r0, 0x1F\n\
	ands r2, r0\n\
	lsls r2, 11\n\
	movs r0, 0xC0\n\
	lsls r0, 19\n\
	adds r2, r0\n\
	lsls r1, 16\n\
	asrs r1, 16\n\
	subs r0, r1, 0x2\n\
	lsls r0, 5\n\
	adds r0, r5\n\
	lsls r0, 1\n\
	adds r0, r2\n\
	ldr r6, _0811B7E4 @ =0x0000f001\n\
	adds r3, r6, 0\n\
	strh r3, [r0]\n\
	subs r0, r1, 0x1\n\
	lsls r0, 5\n\
	adds r0, r5\n\
	lsls r0, 1\n\
	adds r0, r2\n\
	strh r3, [r0]\n\
	lsls r0, r1, 5\n\
	adds r0, r5\n\
	lsls r0, 1\n\
	adds r0, r2\n\
	strh r3, [r0]\n\
	adds r1, 0x1\n\
	lsls r1, 5\n\
	adds r1, r5\n\
	lsls r1, 1\n\
	adds r1, r2\n\
	strh r3, [r1]\n\
_0811B7B2:\n\
	movs r1, 0x2E\n\
	ldrsh r0, [r4, r1]\n\
	lsls r0, 1\n\
	add r0, sp\n\
	ldrh r0, [r0]\n\
	ldrh r2, [r4, 0x20]\n\
	adds r0, r2\n\
	strh r0, [r4, 0x20]\n\
	adds r0, 0xF\n\
	lsls r0, 16\n\
	movs r1, 0x87\n\
	lsls r1, 17\n\
	cmp r0, r1\n\
	bls _0811B7D6\n\
	adds r0, r4, 0\n\
	movs r1, 0x2D\n\
	bl FieldEffectStop\n\
_0811B7D6:\n\
	add sp, 0x4\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_0811B7E0: .4byte 0x04000008\n\
_0811B7E4: .4byte 0x0000f001\n\
        .syntax divided");
}
#endif // NONMATCHING

void Phase2Task_Transition5(u8 taskID)
{
    while (sPhase2_Transition5_Funcs[gTasks[taskID].tState](&gTasks[taskID]));
}

bool8 Phase2_Transition5_Func1(struct Task* task)
{
    u16 i;

    sub_811D658();
    dp12_8087EA4();

    TRANSITION_STRUCT.field_2 = 0;
    TRANSITION_STRUCT.field_4 = 63;
    TRANSITION_STRUCT.field_6 = -3855;
    TRANSITION_STRUCT.field_8 = 160;

    for (i = 0; i < 160; i++)
    {
        gUnknown_03005560[i] = 0xF3F4;
    }

    SetVBlankCallback(VBlankCB_Phase2_Transition5);
    TRANSITION_STRUCT.field_2C = 120;

    task->tState++;
    return 1;
}

bool8 Phase2_Transition5_Func2(struct Task* task)
{
    TRANSITION_STRUCT.field_0 = 0;

    sub_811D8FC(&TRANSITION_STRUCT.field_24, 120, 80, TRANSITION_STRUCT.field_2C, -1, 1, 1);
    do
    {
        gUnknown_03004DE0[0][TRANSITION_STRUCT.field_2A] = (TRANSITION_STRUCT.field_28 + 1) | 0x7800;
    } while (!sub_811D978(&TRANSITION_STRUCT.field_24, 1, 1));

    TRANSITION_STRUCT.field_2C += 16;
    if (TRANSITION_STRUCT.field_2C >= 240)
    {
        TRANSITION_STRUCT.field_2E = 0;
        task->tState++;
    }

    TRANSITION_STRUCT.field_0++;
    return 0;
}

bool8 Phase2_Transition5_Func3(struct Task* task)
{
    s16 r1, r3;
    vu8 var = 0;

    TRANSITION_STRUCT.field_0 = 0;

    sub_811D8FC(&TRANSITION_STRUCT.field_24, 120, 80, 240, TRANSITION_STRUCT.field_2E, 1, 1);

    while (1)
    {
        r1 = 120, r3 = TRANSITION_STRUCT.field_28 + 1;
        if (TRANSITION_STRUCT.field_2E >= 80)
            r1 = TRANSITION_STRUCT.field_28, r3 = 240;
        gUnknown_03004DE0[0][TRANSITION_STRUCT.field_2A] = (r3) | (r1 << 8);
        if (var != 0)
            break;
        var = sub_811D978(&TRANSITION_STRUCT.field_24, 1, 1);
    }

    TRANSITION_STRUCT.field_2E += 8;
    if (TRANSITION_STRUCT.field_2E >= 160)
    {
        TRANSITION_STRUCT.field_2C = 240;
        task->tState++;
    }
    else
    {
        while (TRANSITION_STRUCT.field_2A < TRANSITION_STRUCT.field_2E)
        {
            gUnknown_03004DE0[0][++TRANSITION_STRUCT.field_2A] = (r3) | (r1 << 8);
        }
    }

    TRANSITION_STRUCT.field_0++;
    return 0;
}
