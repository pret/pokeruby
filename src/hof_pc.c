#include "global.h"
#include "hall_of_fame.h"
#include "main.h"
#include "palette.h"
#include "overworld.h"
#include "script.h"
#include "script_menu.h"
#include "task.h"

extern void (*gFieldCallback)(void);

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
    Overworld_PlaySpecialMapMusic();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    ScrSpecial_CreatePCMenu();
    ScriptMenu_DisplayPCStartupPrompt();
    CreateTask(Task_WaitForPaletteFade, 10);
}

static void Task_WaitForPaletteFade(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}
