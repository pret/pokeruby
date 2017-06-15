#include "global.h"
#include "asm.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "palette.h"
#include "rom6.h"
#include "script.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "wild_encounter.h"

static void sub_812BFD4(void);
static void sub_812C01C(void);
static void sub_812C084(u8);
static void sub_812C118(u8);

extern u32 gUnknown_0202FF84[];

extern u8 gLastFieldPokeMenuOpened;
extern void (*gFieldCallback)(void);
extern void (*gUnknown_03005CE4)(void);

extern u8 SweetScentNothingHereScript[];

bool8 SetUpFieldMove_SweetScent(void)
{
    gFieldCallback = sub_808AB90;
    gUnknown_03005CE4 = sub_812BFD4;
    return TRUE;
}

static void sub_812BFD4(void)
{
    FieldEffectStart(51);
    gUnknown_0202FF84[0] = gLastFieldPokeMenuOpened;
}

bool8 FldEff_SweetScent()
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (u32)sub_812C01C >> 16;
    gTasks[taskId].data[9] = (u32)sub_812C01C;
    return FALSE;
}

static void sub_812C01C(void)
{
    u8 taskId;

    PlaySE(0xEC);
    BeginNormalPaletteFade(~(1 << (gSprites[GetPlayerAvatarObjectId()].oam.paletteNum + 16)), 4, 0, 8, 0x1F);
    taskId = CreateTask(sub_812C084, 0);
    gTasks[taskId].data[0] = 0;
    FieldEffectActiveListRemove(51);
}

static void sub_812C084(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gTasks[taskId].data[0] == 64)
        {
            gTasks[taskId].data[0] = 0;
            if (SweetScentWildEncounter() == TRUE)
            {
                DestroyTask(taskId);
            }
            else
            {
                gTasks[taskId].func = sub_812C118;
                BeginNormalPaletteFade(~(1 << (gSprites[GetPlayerAvatarObjectId()].oam.paletteNum + 16)), 4, 8, 0, 0x1F);
            }
        }
        else
        {
            gTasks[taskId].data[0]++;
        }
    }
}

static void sub_812C118(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        ScriptContext1_SetupScript(SweetScentNothingHereScript);
        DestroyTask(taskId);
    }
}
