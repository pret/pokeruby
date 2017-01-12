#include "global.h"
#include "event_data.h"
#include "flags.h"
#include "asm.h"
#include "field_camera.h"
#include "field_effect.h"
#include "sound.h"
#include "script.h"
#include "songs.h"
#include "species.h"

extern u8 gPlayerPartyCount;
extern u8 gUnknown_03005CE0;

extern u32 gUnknown_0202FF84[];

bool8 ShouldDoBrailleDigEffect(void)
{
    if(!FlagGet(SYS_BRAILLE_DIG) && (gSaveBlock1.location.mapGroup == 0x18 && gSaveBlock1.location.mapNum == 0x47))
    {
        if(gSaveBlock1.pos.x == 10 && gSaveBlock1.pos.y == 3)
            return TRUE;
        else if(gSaveBlock1.pos.x == 9 && gSaveBlock1.pos.y == 3)
            return TRUE;
        else if(gSaveBlock1.pos.x == 11 && gSaveBlock1.pos.y == 3)
            return TRUE;
    }

    return FALSE;
}

void DoBrailleDigEffect(void)
{
    MapGridSetMetatileIdAt(16, 8, 554);
    MapGridSetMetatileIdAt(17, 8, 555);
    MapGridSetMetatileIdAt(18, 8, 556);
    MapGridSetMetatileIdAt(16, 9, 3634);
    MapGridSetMetatileIdAt(17, 9, 563);
    MapGridSetMetatileIdAt(18, 9, 3636);
    DrawWholeMapView();
    PlaySE(SE_BAN);
    FlagSet(SYS_BRAILLE_DIG);
    ScriptContext2_Disable();
}

bool8 CheckRelicanthWailord(void)
{
    if(GetMonData(&gPlayerParty, MON_DATA_SPECIES2, 0) == SPECIES_RELICANTH)
    {
        CalculatePlayerPartyCount();

        if(GetMonData(&gPlayerParty[gPlayerPartyCount - 1], MON_DATA_SPECIES2, 0) == SPECIES_WAILORD)
            return TRUE;
    }
    return FALSE;
}

bool8 ShouldDoBrailleStrengthEffect(void)
{
    if(!FlagGet(SYS_BRAILLE_STRENGTH) && (gSaveBlock1.location.mapGroup == 0x18 && gSaveBlock1.location.mapNum == 0x6))
    {
        if(gSaveBlock1.pos.x == 10 && gSaveBlock1.pos.y == 23)
            return TRUE;
        else if(gSaveBlock1.pos.x == 9 && gSaveBlock1.pos.y == 23)
            return TRUE;
        else if(gSaveBlock1.pos.x == 11 && gSaveBlock1.pos.y == 23)
            return TRUE;
    }

    return FALSE;
}

void DoBrailleStrengthEffect(void)
{
    FieldEffectActiveListRemove(0x28);
    MapGridSetMetatileIdAt(14, 26, 554);
    MapGridSetMetatileIdAt(15, 26, 555);
    MapGridSetMetatileIdAt(16, 26, 556);
    MapGridSetMetatileIdAt(14, 27, 3634);
    MapGridSetMetatileIdAt(15, 27, 563);
    MapGridSetMetatileIdAt(16, 27, 3636);
    DrawWholeMapView();
    PlaySE(SE_BAN);
    FlagSet(SYS_BRAILLE_STRENGTH);
    ScriptContext2_Disable();
}

bool8 ShouldDoBrailleFlyEffect(void)
{
    if(!FlagGet(SYS_BRAILLE_FLY) && (gSaveBlock1.location.mapGroup == 0x18 && gSaveBlock1.location.mapNum == 0x44))
    {
        if(gSaveBlock1.pos.x == 8 && gSaveBlock1.pos.y == 25)
            return TRUE;
    }
    
    return FALSE;
}

void DoBrailleFlyEffect(void)
{
    gUnknown_0202FF84[0] = gUnknown_03005CE0;
    FieldEffectStart(0x3C);
}
