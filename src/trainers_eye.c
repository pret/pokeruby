#include "global.h"
#include "battle_setup.h"
#include "overworld.h"
#include "pokenav.h"

struct TrainersEyeGymLeadersAndE4
{
    u16 opponentId;
    u16 regionMapSectionId;
};

extern const struct TrainersEyeGymLeadersAndE4 gUnknown_083E49C0[13];

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
            if (HasTrainerAlreadyBeenFought(gUnknown_083E49C0[i].opponentId))
            {
                gUnknown_083DFEC4->unkCEE8[gUnknown_083DFEC4->unkD158].unk0 = gUnknown_083E49C0[i].opponentId;
                gUnknown_083DFEC4->unkCEE8[gUnknown_083DFEC4->unkD158].unk2 = gUnknown_083E49C0[i].regionMapSectionId;
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
