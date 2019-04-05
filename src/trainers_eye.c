#include "global.h"
#include "battle_setup.h"
#include "overworld.h"
#include "pokenav.h"
#include "constants/opponents.h"
#include "constants/region_map_sections.h"

struct TrainersEyeGymLeadersAndE4
{
    u16 opponentId;
    u16 regionMapSectionId;
};

static const struct TrainersEyeGymLeadersAndE4 sGymLeaderTrainersEye[13] = {
    {TRAINER_ROXANNE,       MAPSEC_RUSTBORO_CITY},
    {TRAINER_BRAWLY,        MAPSEC_DEWFORD_TOWN},
    {TRAINER_WATTSON,       MAPSEC_MAUVILLE_CITY},
    {TRAINER_FLANNERY,      MAPSEC_LAVARIDGE_TOWN},
    {TRAINER_NORMAN,        MAPSEC_PETALBURG_CITY},
    {TRAINER_WINONA,        MAPSEC_FORTREE_CITY},
    {TRAINER_TATE_AND_LIZA, MAPSEC_MOSSDEEP_CITY},
    {TRAINER_WALLACE,       MAPSEC_SOOTOPOLIS_CITY},
    {TRAINER_SIDNEY,        MAPSEC_EVER_GRANDE_CITY},
    {TRAINER_PHOEBE,        MAPSEC_EVER_GRANDE_CITY},
    {TRAINER_GLACIA,        MAPSEC_EVER_GRANDE_CITY},
    {TRAINER_DRAKE,         MAPSEC_EVER_GRANDE_CITY},
    {TRAINER_STEVEN,        MAPSEC_EVER_GRANDE_CITY}
};

void sub_80F6C20(void)
{
    u16 i;

    gUnknown_083DFEC4->unkD158 = 0;

    for (i = 0; i < 56; i++)
    {
        if (HasTrainerAlreadyBeenFought(gTrainerEyeTrainers[i].opponentIDs[0]))
        {
            gUnknown_083DFEC4->unkCEE8[gUnknown_083DFEC4->unkD158].unk0 = gTrainerEyeTrainers[i].opponentIDs[0];
            gUnknown_083DFEC4->unkCEE8[gUnknown_083DFEC4->unkD158].unk4 = i;
            gUnknown_083DFEC4->unkCEE8[gUnknown_083DFEC4->unkD158].unk5 = gSaveBlock1.trainerRematches[i];
            gUnknown_083DFEC4->unkCEE8[gUnknown_083DFEC4->unkD158].unk2 = Overworld_GetMapHeaderByGroupAndId(gTrainerEyeTrainers[i].mapGroup, gTrainerEyeTrainers[i].mapNum)->regionMapSectionId;
            gUnknown_083DFEC4->unkD158++;
        }
    }

    for (i = 0; i < 13; i++)
    {
        {
            if (HasTrainerAlreadyBeenFought(sGymLeaderTrainersEye[i].opponentId))
            {
                gUnknown_083DFEC4->unkCEE8[gUnknown_083DFEC4->unkD158].unk0 = sGymLeaderTrainersEye[i].opponentId;
                gUnknown_083DFEC4->unkCEE8[gUnknown_083DFEC4->unkD158].unk2 = sGymLeaderTrainersEye[i].regionMapSectionId;
                gUnknown_083DFEC4->unkCEE8[gUnknown_083DFEC4->unkD158].unk5 = 0;
                gUnknown_083DFEC4->unkCEE8[gUnknown_083DFEC4->unkD158].unk4 = i + 0x38;
                gUnknown_083DFEC4->unkD158++;
            }
        }
    }

    gUnknown_083DFEC4->unk876C = 0;
    gUnknown_083DFEC4->unk8770 = 0;
    gUnknown_083DFEC4->unk876E = 0;
    gUnknown_083DFEC4->unk8772 = gUnknown_083DFEC4->unkD158 <= 8 ? gUnknown_083DFEC4->unkD158 - 1 : 7;
    gUnknown_083DFEC4->unk8774 = gUnknown_083DFEC4->unkD158 - 1;
    gUnknown_083DFEC4->unk87C9 = gUnknown_083DFEC4->unk8774 < 8 ? 0 : 1;
}
