#include "global.h"
#include "event_data.h"
#include "hall_of_fame.h"
#include "load_save.h"
#include "main.h"
#include "pokemon.h"
#include "overworld.h"
#include "script_pokemon_80C4.h"

extern u8 gUnknown_02039324;

int GameClear(void)
{
    int i;
    bool32 ribbonGet;

    HealPlayerParty();

    if (FlagGet(SYS_GAME_CLEAR) == TRUE)
    {
        gUnknown_02039324 = 1;
    }
    else
    {
        gUnknown_02039324 = 0;
        FlagSet(SYS_GAME_CLEAR);
    }

    if (!GetGameStat(1))
        SetGameStat(1, (gSaveBlock2.playTimeHours << 16) | (gSaveBlock2.playTimeMinutes << 8) | gSaveBlock2.playTimeSeconds);

    SetSecretBase2Field_9();

    if (gSaveBlock2.playerGender == MALE)
        sub_80537CC(1);
    else
        sub_80537CC(2);

    ribbonGet = FALSE;

    for (i = 0; i < 6; i++)
    {
        u8 val;
        u8 *ptr = &val;
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_BIT2)
         && !GetMonData(&gPlayerParty[i], MON_DATA_SANITY_BIT3)
         && !GetMonData(&gPlayerParty[i], MON_DATA_CHAMPION_RIBBON))
        {
            *ptr = 1;
            SetMonData(&gPlayerParty[i], MON_DATA_CHAMPION_RIBBON, ptr);
            ribbonGet = TRUE;
        }
    }

    if (ribbonGet == TRUE)
    {
        IncrementGameStat(42);
        FlagSet(SYS_RIBBON_GET);
    }

    SetMainCallback2(sub_8141F90);
    return 0;
}

int sp0C8_whiteout_maybe(void)
{
    SetMainCallback2(CB2_WhiteOut);
    return 0;
}
