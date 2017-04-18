#include "global.h"
#include "script.h"
#include "main.h"
#include "script_menu.h"
#include "palette.h"
#include "rom4.h"
#include "task.h"

extern void sub_81428CC(void);
extern void (*gUnknown_0300485C)(void);

static void ReshowPCMenuAfterHallOfFamePC(void);
static void Task_WaitForPaletteFade(u8);

void AccessHallOfFamePC(void)
{
    SetMainCallback2(sub_81428CC);
    ScriptContext2_Enable();
}

void ReturnFromHallOfFamePC(void)
{
    SetMainCallback2(c2_exit_to_overworld_2_switch);
    gUnknown_0300485C = ReshowPCMenuAfterHallOfFamePC;
}

static void ReshowPCMenuAfterHallOfFamePC(void)
{
    ScriptContext2_Enable();
    sub_8053E90();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0);
    TryCreatePCMenu();
    sub_80B5838();
    CreateTask(Task_WaitForPaletteFade, 10);
}

static void Task_WaitForPaletteFade(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}
