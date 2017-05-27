#include "global.h"
#include "asm.h"
#include "event_data.h"
#include "field_message_box.h"
#include "pokedex.h"
#include "species.h"

extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;

extern const u8 gUnknown_081C4520[];
extern const u8 gUnknown_081C456A[];
extern const u8 gUnknown_081C45B0[];
extern const u8 gUnknown_081C45F9[];
extern const u8 gUnknown_081C4648[];
extern const u8 gUnknown_081C467E[];
extern const u8 gUnknown_081C46B9[];
extern const u8 gUnknown_081C46FE[];
extern const u8 gUnknown_081C4747[];
extern const u8 gUnknown_081C4780[];
extern const u8 gUnknown_081C47DF[];
extern const u8 gUnknown_081C4828[];
extern const u8 gUnknown_081C4863[];
extern const u8 gUnknown_081C489C[];
extern const u8 gUnknown_081C48EB[];
extern const u8 gUnknown_081C4936[];
extern const u8 gUnknown_081C49A2[];
extern const u8 gUnknown_081C4A06[];
extern const u8 gUnknown_081C4A4F[];
extern const u8 gUnknown_081C4A91[];
extern const u8 gUnknown_081C4ADA[];

bool16 ScriptGetPokedexInfo(void)
{
    if (!gSpecialVar_0x8004)
    {
        gSpecialVar_0x8005 = GetHoennPokedexCount(0);
        gSpecialVar_0x8006 = GetHoennPokedexCount(1);
    }
    else
    {
        gSpecialVar_0x8005 = GetNationalPokedexCount(0);
        gSpecialVar_0x8006 = GetNationalPokedexCount(1);
    }

    return IsNationalPokedexEnabled();
}

const u8 *GetPokedexRatingText(u16 count)
{
    if (count < 10)
        return gUnknown_081C4520;
    if (count < 20)
        return gUnknown_081C456A;
    if (count < 30)
        return gUnknown_081C45B0;
    if (count < 40)
        return gUnknown_081C45F9;
    if (count < 50)
        return gUnknown_081C4648;
    if (count < 60)
        return gUnknown_081C467E;
    if (count < 70)
        return gUnknown_081C46B9;
    if (count < 80)
        return gUnknown_081C46FE;
    if (count < 90)
        return gUnknown_081C4747;
    if (count < 100)
        return gUnknown_081C4780;
    if (count < 110)
        return gUnknown_081C47DF;
    if (count < 120)
        return gUnknown_081C4828;
    if (count < 130)
        return gUnknown_081C4863;
    if (count < 140)
        return gUnknown_081C489C;
    if (count < 150)
        return gUnknown_081C48EB;
    if (count < 160)
        return gUnknown_081C4936;
    if (count < 170)
        return gUnknown_081C49A2;
    if (count < 180)
        return gUnknown_081C4A06;
    if (count < 190)
        return gUnknown_081C4A4F;
    if (count < 200)
        return gUnknown_081C4A91;
    if (count == 200)
    {
        if (sub_8090D90(SpeciesToNationalPokedexNum(SPECIES_JIRACHI), 1) || sub_8090D90(SpeciesToNationalPokedexNum(SPECIES_DEOXYS), 1))
            return gUnknown_081C4A91;
        return gUnknown_081C4ADA;
    }
    if (count == 201)
    {
        if (sub_8090D90(SpeciesToNationalPokedexNum(SPECIES_JIRACHI), 1) && sub_8090D90(SpeciesToNationalPokedexNum(SPECIES_DEOXYS), 1))
            return gUnknown_081C4A91;
        return gUnknown_081C4ADA;
    }
    if (count == 202)
        return gUnknown_081C4ADA;
    return gUnknown_081C4520;
}

void ShowPokedexRatingMessage(void)
{
    ShowFieldMessage(GetPokedexRatingText(gSpecialVar_0x8004));
}
