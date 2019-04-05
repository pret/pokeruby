#include "global.h"
#include "decompress.h"
#include "battle_setup.h"
#include "overworld.h"
#include "pokenav.h"
#include "battle.h"
#include "data2.h"
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

void sub_80F6E04(u8);

void sub_80F6C20(void)
{
    u16 i;

    gPokenavStructPtr->unkD158 = 0;

    for (i = 0; i < 56; i++)
    {
        if (HasTrainerAlreadyBeenFought(gTrainerEyeTrainers[i].opponentIDs[0]))
        {
            gPokenavStructPtr->trainersEye[gPokenavStructPtr->unkD158].opponentId = gTrainerEyeTrainers[i].opponentIDs[0];
            gPokenavStructPtr->trainersEye[gPokenavStructPtr->unkD158].rematchTableIdx = i;
            gPokenavStructPtr->trainersEye[gPokenavStructPtr->unkD158].rematchNo = gSaveBlock1.trainerRematches[i];
            gPokenavStructPtr->trainersEye[gPokenavStructPtr->unkD158].regionMapSectionId = Overworld_GetMapHeaderByGroupAndId(gTrainerEyeTrainers[i].mapGroup, gTrainerEyeTrainers[i].mapNum)->regionMapSectionId;
            gPokenavStructPtr->unkD158++;
        }
    }

    for (i = 0; i < 13; i++)
    {
        {
            if (HasTrainerAlreadyBeenFought(sGymLeaderTrainersEye[i].opponentId))
            {
                gPokenavStructPtr->trainersEye[gPokenavStructPtr->unkD158].opponentId = sGymLeaderTrainersEye[i].opponentId;
                gPokenavStructPtr->trainersEye[gPokenavStructPtr->unkD158].regionMapSectionId = sGymLeaderTrainersEye[i].regionMapSectionId;
                gPokenavStructPtr->trainersEye[gPokenavStructPtr->unkD158].rematchNo = 0;
                gPokenavStructPtr->trainersEye[gPokenavStructPtr->unkD158].rematchTableIdx = i + 0x38;
                gPokenavStructPtr->unkD158++;
            }
        }
    }

    gPokenavStructPtr->unk876C = 0;
    gPokenavStructPtr->unk8770 = 0;
    gPokenavStructPtr->unk876E = 0;
    gPokenavStructPtr->unk8772 = gPokenavStructPtr->unkD158 <= 8 ? gPokenavStructPtr->unkD158 - 1 : 7;
    gPokenavStructPtr->unk8774 = gPokenavStructPtr->unkD158 - 1;
    gPokenavStructPtr->unk87C9 = gPokenavStructPtr->unk8774 < 8 ? 0 : 1;
}

void sub_80F6DB8(void)
{
    s32 r1 = 0;
    gPokenavStructPtr->unk8fe9 = r1;
    sub_80F6E04(0);
    gPokenavStructPtr->unkD15A = -72;
    sub_80F2F7C(0);
    gPokenavStructPtr->unk87DC = gPokenavStructPtr->unk876E;
}

void sub_80F6E04(u8 a0)
{
    u16 r1 = gPokenavStructPtr->trainersEye[gPokenavStructPtr->unk876E].opponentId;
    u8 r6 = gTrainers[r1].trainerPic;
    DecompressPicFromTable_2(&gTrainerFrontPicTable[r6], gTrainerFrontPicCoords[r6].coords, 1, gPokenavStructPtr->unk131E4, gPokenavStructPtr->unkD1E4[a0], r6);
    LZ77UnCompWram(gTrainerFrontPicPaletteTable[r6].data, gPokenavStructPtr->unk0[a0]);
}
