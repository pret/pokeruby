#include "global.h"
#include "main.h"
#include "rom4.h"
#include "task.h"
#include "palette.h"
#include "trig.h"

void sub_807DE10(void);
void dp12_8087EA4(void);

typedef bool8 (*TransitionState)(struct Task* task);

extern const TransitionState sMainTransitionPhases[];
extern const TransitionState sPhase2_Transition0_Funcs[];
extern const TransitionState sPhase2_Transition1_Funcs[];
extern const TransitionState sPhase2_Transition2_Funcs[];

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
};

#define TRANSITION_STRUCT   (*(struct TransitionData *)   (&ewram[0xC000]))

// this file's functions
static void LaunchBattleTransitionTask(u8 transitionID);
static void Task_BattleTransitionMain(u8 taskID);
void sub_811D4C8(s16 a0, s16 a1, s16 a2, s16 a3, s16 a4);
bool8 sub_811D52C(void);
void sub_811D658(void);
static void VBlankCB_Phase2_Transition1(void);
static void HBlankCB_Phase2_Transition1(void);
void VBlankCB_Phase2_Transition2(void);
void HBlankCB_Phase2_Transition2(void);
void VBlankCB_BattleTransition(void);
void sub_811D6E8(s16* a0, s16 a1, s16 a2, s16 a3, s16 a4, s16 a5);

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
        gUnknown_03004DE0[0][i] = Sin(var, r3) + TRANSITION_STRUCT.field_16;
    }

    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition2));

    TRANSITION_STRUCT.field_0++;
    return 0;
}
