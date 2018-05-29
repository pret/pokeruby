#include "global.h"
#include "braille_puzzles.h"
#include "field_effect.h"
#include "party_menu.h"
#include "pokemon.h"
#include "pokemon_menu.h"
#include "rom6.h"
#include "script.h"
#include "task.h"
#include "text.h"
#include "constants/field_effects.h"
#include "constants/event_objects.h"

static void sub_811AA18(void);
static void sub_811AA38(void);
static void sub_811AA9C(void);

extern u8 gLastFieldPokeMenuOpened;
extern u16 gSpecialVar_Result;
extern void (*gFieldCallback)(void);
extern void (*gPostMenuFieldCallback)(void);

extern u8 S_UseStrength[];

#if DEBUG
void debug_sub_8130318(void)
{
    if (ShouldDoBrailleStrengthEffect())
    {
        gLastFieldPokeMenuOpened = 0;
        gSpecialVar_Result = 0;
        sub_811AA38();
    }
    else if (SetLastTalkedObjectInFrontOfPlayer(EVENT_OBJ_GFX_PUSHABLE_BOULDER) == TRUE)
    {
        gLastFieldPokeMenuOpened = 0;
        gSpecialVar_Result = 0;
        sub_811AA18();
    }
    else
    {
        ScriptContext2_Disable();
    }
}
#endif

bool8 SetUpFieldMove_Strength(void)
{
    if (ShouldDoBrailleStrengthEffect())
    {
        gSpecialVar_Result = gLastFieldPokeMenuOpened;
        gFieldCallback = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = sub_811AA38;
    }
    else
    {
        if (SetLastTalkedObjectInFrontOfPlayer(EVENT_OBJ_GFX_PUSHABLE_BOULDER) != TRUE)
            return 0;
        gSpecialVar_Result = gLastFieldPokeMenuOpened;
        gFieldCallback = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = sub_811AA18;
    }

    return TRUE;
}

static void sub_811AA18(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(S_UseStrength);
}

static void sub_811AA38(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    FieldEffectStart(FLDEFF_USE_STRENGTH);
}

bool8 FldEff_UseStrength(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (u32)sub_811AA9C >> 16;
    gTasks[taskId].data[9] = (u32)sub_811AA9C;
    GetMonNickname(&gPlayerParty[gFieldEffectArguments[0]], gStringVar1);
    return FALSE;
}

static void sub_811AA9C(void)
{
    if (ShouldDoBrailleStrengthEffect())
    {
        DoBrailleStrengthEffect();
    }
    else
    {
        FieldEffectActiveListRemove(40);
        EnableBothScriptContexts();
    }
}
