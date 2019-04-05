#include "global.h"
#include "main.h"
#include "decompress.h"
#include "battle_setup.h"
#include "overworld.h"
#include "pokenav.h"
#include "battle.h"
#include "data2.h"
#include "constants/opponents.h"
#include "constants/region_map_sections.h"
#include "text.h"
#include "de_rom_8040FE0.h"
#include "string_util.h"

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
void sub_80F6FB8(bool8);

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

bool8 sub_80F6E9C(void)
{
    if (gPokenavStructPtr->unkD15A == 0)
    {
        return FALSE;
    }
    if ((gPokenavStructPtr->unkD15A += 8) >= 0)
    {
        gPokenavStructPtr->unkD15A = 0;
        return FALSE;
    }
    return TRUE;
}

bool8 sub_80F6ED4(void)
{
    if (gPokenavStructPtr->unkD15A == -72)
    {
        return FALSE;
    }
    if ((gPokenavStructPtr->unkD15A -= 8) <= -72)
    {
        gPokenavStructPtr->unkD15A = -72;
        return FALSE;
    }
    return TRUE;
}

void sub_80F6F10(void)
{
    gPokenavStructPtr->unkD15E = 0;
    gPokenavStructPtr->unkD15F = 0;
    REG_BLDCNT = BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_DARKEN;
    REG_BLDY = 0;
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x1F1F;
    sub_80F6FB8(0);
}

void sub_80F6F64(void)
{
    if (++gPokenavStructPtr->unkD15E > 8)
    {
        gPokenavStructPtr->unkD15E = 0;
        ++gPokenavStructPtr->unkD15F;
        if (gPokenavStructPtr->unkD15F & 1)
            REG_BLDY = 6;
        else
            REG_BLDY = 0;
    }
}

void sub_80F6FB8(bool8 a0)
{
    if (!a0)
    {
        REG_WIN0H = -0x1710;
        REG_WIN0V = 0x888;
    }
    else
    {
        REG_WIN0H = -0x1710;
        REG_WIN0V = 0x818;
    }
}

void sub_80F6FFC(void)
{
    REG_BLDCNT = 0;
    REG_BLDY = 0;
}

void sub_80F700C(u8 *arg0, u16 arg1)
{
    const struct Trainer *trainer = &gTrainers[gPokenavStructPtr->trainersEye[arg1].opponentId];
    u8 *ptr = arg0;

    ptr = arg0;
    if (arg1 < gPokenavStructPtr->unkD158)
    {
#if ENGLISH
        ptr = StringCopy(ptr, gTrainerClassNames[trainer->trainerClass]);
#elif GERMAN
        ptr = StringCopy(ptr, de_sub_8041024(0, gPokenavStructPtr->trainersEye[arg1].opponentId));
#endif

        ptr[0] = EXT_CTRL_CODE_BEGIN;
        ptr[1] = 0x13;
        ptr[2] = 0x4B;
        ptr += 3;
        ptr = StringCopy(ptr, trainer->trainerName);
    }

    ptr[0] = EXT_CTRL_CODE_BEGIN;
    ptr[1] = 0x13;
    ptr[2] = 0x80;
    ptr[3] = 0xFF;
}

void sub_80F708C(s8 a0)
{
    gPokenavStructPtr->unk876E += a0;
    if (gPokenavStructPtr->unk876E < 0)
    {
        gPokenavStructPtr->unk876E = gPokenavStructPtr->unk8774;
    }
    if (gPokenavStructPtr->unk876E > gPokenavStructPtr->unk8774)
    {
        gPokenavStructPtr->unk876E = 0;
    }
    gPokenavStructPtr->unkBC94 = a0;
    gPokenavStructPtr->unk87DC = gPokenavStructPtr->unk876E;
    gPokenavStructPtr->unk87DE = 0;
}

bool8 sub_80F70FC(void)
{
    switch (gPokenavStructPtr->unk87DE)
    {
    case 0:
        if (!sub_80F6ED4())
            gPokenavStructPtr->unk87DE++;
        break;
    case 1:
        sub_80F6E04(0);
        gPokenavStructPtr->unk87DE++;
        break;
    case 2:
        sub_80F2F7C(0);
        gPokenavStructPtr->unk87DE++;
        break;
    case 3:
        sub_80F700C(gPokenavStructPtr->unk8788, gPokenavStructPtr->unk876E);
        sub_80F43D4(gPokenavStructPtr->unk8788);
        sub_80F105C();
        sub_80F0FFC(gPokenavStructPtr->unk876E);
        gPokenavStructPtr->unk87DE++;
        break;
    case 4:
        LoadTrainerEyesDescriptionLines();
        gPokenavStructPtr->unkBC95 = 0;
        gPokenavStructPtr->unk87DE++;
        // fallthrough
    case 5:
        if (gPokenavStructPtr->unkBC95 < 2){
            sub_80F0D5C();
            gPokenavStructPtr->unkBC95++;
            break;
        }
        gPokenavStructPtr->unk87DE++;
        // fallthrough
    case 6:
        if (!sub_80F6E9C() && !sub_80F0D5C())
            gPokenavStructPtr->unk87DE++;
        break;
    default:
        return FALSE;
    }

    return TRUE;
}

void sub_80F7224(u8 a0)
{
    u8 sheen = GetMonData(&gPlayerParty[a0], MON_DATA_SHEEN);
    gPokenavStructPtr->unk8931[gPokenavStructPtr->unk8fe9] = sheen != 255 ? sheen / 29 : 9;
}
