#include "global.h"
#include "hall_of_fame.h"
#include "main.h"
#include "palette.h"
#include "rom4.h"
#include "script.h"
#include "script_menu.h"
#include "task.h"

extern void (*gFieldCallback)(void);
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
    gFieldCallback = ReshowPCMenuAfterHallOfFamePC;
}

static void ReshowPCMenuAfterHallOfFamePC(void)
{
    ScriptContext2_Enable();
    sub_8053E90();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0);
    ScrSpecial_CreatePCMenu();
    ScriptMenu_DisplayPCStartupPrompt();
    CreateTask(Task_WaitForPaletteFade, 10);
}

static void Task_WaitForPaletteFade(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}
