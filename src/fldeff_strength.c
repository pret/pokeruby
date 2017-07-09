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

static void sub_811AA18(void);
static void sub_811AA38(void);
static void sub_811AA9C(void);

extern u32 gUnknown_0202FF84[];

extern u8 gLastFieldPokeMenuOpened;
extern u16 gScriptResult;
extern void (*gFieldCallback)(void);
extern void (*gUnknown_03005CE4)(void);

extern u8 UseStrengthScript[];

enum {
    MAP_OBJ_GFX_PUSHABLE_BOULDER = 87,
};

extern u8 gLastFieldPokeMenuOpened;

void debug_sub_8130318(void) {

    if (ShouldDoBrailleStrengthEffect()) {
        gLastFieldPokeMenuOpened = 0;
        gScriptResult = 0;
        sub_811AA38();
    } else if (npc_before_player_of_type(MAP_OBJ_GFX_PUSHABLE_BOULDER) == TRUE) {
        gLastFieldPokeMenuOpened = 0;
        gScriptResult = 0;
        sub_811AA18();
    } else {
        ScriptContext2_Disable();
    }
}

bool8 SetUpFieldMove_Strength(void)
{
    if (ShouldDoBrailleStrengthEffect())
    {
        gScriptResult = gLastFieldPokeMenuOpened;
        gFieldCallback = sub_808AB90;
        gUnknown_03005CE4 = sub_811AA38;
    }
    else
    {
        if (npc_before_player_of_type(MAP_OBJ_GFX_PUSHABLE_BOULDER) != TRUE)
            return 0;
        gScriptResult = gLastFieldPokeMenuOpened;
        gFieldCallback = sub_808AB90;
        gUnknown_03005CE4 = sub_811AA18;
    }

    return TRUE;
}

static void sub_811AA18(void)
{
    gUnknown_0202FF84[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(UseStrengthScript);
}

static void sub_811AA38(void)
{
    gUnknown_0202FF84[0] = gLastFieldPokeMenuOpened;
    FieldEffectStart(40);
}

bool8 FldEff_UseStrength(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (u32)sub_811AA9C >> 16;
    gTasks[taskId].data[9] = (u32)sub_811AA9C;
    GetMonNickname(&gPlayerParty[gUnknown_0202FF84[0]], gStringVar1);
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
