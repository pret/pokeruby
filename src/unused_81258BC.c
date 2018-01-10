#include "constants/songs.h"
#include "global.h"
#include "menu.h"
#include "mystery_event_script.h"
#include "sound.h"
#include "text.h"

void sub_812AF10(void);

bool8 unref_sub_812AECC(u8 *script)
{
    u8 result = RunMysteryEventScript(script);
    switch (result)
    {
    case 0:
        return FALSE;
    case 1:
        PlaySE(SE_BOO);
        return TRUE;
    case 2:
        sub_812AF10();
        return FALSE;
    case 3:
        PlaySE(SE_BOO);
        sub_812AF10();
        return TRUE;
    default:
        return FALSE;
    }
}

void sub_812AF10(void)
{
    Menu_DrawStdWindowFrame(2, 14, 27, 19);
    Menu_PrintText(gStringVar4, 3, 15);
}