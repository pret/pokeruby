#include "global.h"
#include "asm.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "rom4.h"
#include "rom6.h"

extern void sub_8087BA8(void);

extern u32 gUnknown_0202FF84;

extern void (*gUnknown_0300485C)(void);
extern u8 gUnknown_03005CE0;
extern void (*gUnknown_03005CE4)(void);

void hm_teleport_run_dp02scr(void);
void sub_814A404(void);

bool8 SetUpFieldMove_Teleport(void)
{
    if (is_light_level_1_2_3_or_6(gMapHeader.mapType) == TRUE)
    {
        gUnknown_0300485C = sub_808AB90;
        gUnknown_03005CE4 = hm_teleport_run_dp02scr;
        return TRUE;
    }

    return FALSE;
}

void hm_teleport_run_dp02scr(void)
{
    new_game();
    FieldEffectStart(63);
    gUnknown_0202FF84 = gUnknown_03005CE0;
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
    FieldEffectActiveListRemove(63);
    sub_8087BA8();
}
