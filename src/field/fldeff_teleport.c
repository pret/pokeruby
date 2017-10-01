#include "global.h"
#include "fldeff_teleport.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "pokemon_menu.h"
#include "overworld.h"
#include "rom6.h"
#include "task.h"

extern void (*gFieldCallback)(void);
extern u8 gLastFieldPokeMenuOpened;
extern void (*gUnknown_03005CE4)(void);

bool8 SetUpFieldMove_Teleport(void)
{
    if (Overworld_MapTypeAllowsTeleportAndFly(gMapHeader.mapType) == TRUE)
    {
        gFieldCallback = FieldCallback_Teleport;
        gUnknown_03005CE4 = hm_teleport_run_dp02scr;
        return TRUE;
    }

    return FALSE;
}

void hm_teleport_run_dp02scr(void)
{
    Overworld_ResetStateAfterTeleport();
    FieldEffectStart(FLDEFF_USE_TELEPORT);
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
}

bool8 FldEff_UseTeleport(void)
{
    u8 taskId = oei_task_add();
    gTasks[taskId].data[8] = (u32)sub_814A404 >> 16;
    gTasks[taskId].data[9] = (u32)sub_814A404;
    SetPlayerAvatarTransitionFlags(1);
    return 0;
}

void sub_814A404(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_TELEPORT);
    sub_8087BA8();
}
