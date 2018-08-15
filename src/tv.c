#include "global.h"
#include "tv.h"
#include "battle_tower.h"
#include "contest.h"
#include "contest_painting.h"
#include "data2.h"
#include "easy_chat.h"
#include "event_data.h"
#include "fieldmap.h"
#include "field_message_box.h"
#include "field_camera.h"
#include "constants/flags.h"
#include "random.h"
#include "string_util.h"
#include "text.h"
#include "constants/species.h"
#include "pokedex.h"
#include "naming_screen.h"
#include "overworld.h"
#include "constants/maps.h"
#include "strings.h"
#include "battle.h"
#include "link.h"
#include "constants/easy_chat.h"
#include "event_object_movement.h"
#include "field_specials.h"
#include "item.h"
#include "constants/items.h"
#include "link.h"
#include "constants/maps.h"
#include "naming_screen.h"
#include "pokedex.h"
#include "region_map.h"
#include "random.h"
#include "overworld.h"
#include "rtc.h"
#include "script_menu.h"
#include "constants/species.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"
#include "ewram.h"
#include "constants/moves.h"
#include "constants/region_map_sections.h"

struct UnkTvStruct
{
    s8 var0;
};

struct OutbreakPokemon
{
    /*0x00*/ u16 species;
    /*0x02*/ u16 moves[4];
    /*0x0A*/ u8 level;
    /*0x0B*/ u8 location;
};

struct TVSaleItem {
    u16 item_id;
    u16 item_amount;
};

extern u8 gUnknown_02038694;

extern struct TVSaleItem gMartPurchaseHistory[3];

struct UnkTvStruct gUnknown_03005D38;

extern u16 gSpecialVar_LastTalked;

extern u16 gSpecialVar_ContestCategory;
extern u16 gSpecialVar_ContestRank;
extern u8 gBattleOutcome;
extern u16 gLastUsedItem;

static EWRAM_DATA u16 gUnknown_020387E0 = 0;
static EWRAM_DATA u16 gUnknown_020387E2 = 0;
static EWRAM_DATA u8 gUnknown_020387E4 = 0;
static EWRAM_DATA ALIGNED(4) u8 sTVShowState = 0; // why is this aligned to a 4-byte boundary?

static u8 gUnknown_03000720;
static u8 gUnknown_03000721;
static s8 gUnknown_03000722;

const struct OutbreakPokemon gPokeOutbreakSpeciesList[5] =
{
    {
        .species = SPECIES_SURSKIT,
        .moves = {MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE},
        .level = 3,
        .location = MAPSEC_ROUTE_102,
    },
    {
        .species = SPECIES_SURSKIT,
        .moves = {MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE},
        .level = 15,
        .location = MAPSEC_ROUTE_114,
    },
    {
        .species = SPECIES_SURSKIT,
        .moves = {MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE},
        .level = 15,
        .location = MAPSEC_ROUTE_117,
    },
    {
        .species = SPECIES_SURSKIT,
        .moves = {MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE},
        .level = 28,
        .location = MAPSEC_ROUTE_120,
    },
    {
        .species = SPECIES_SKITTY,
        .moves = {MOVE_GROWL, MOVE_TACKLE, MOVE_NONE, MOVE_NONE},
        .level = 15,
        .location = MAPSEC_ROUTE_116,
    },
};

extern const u8 gTVNewsText_EnergyGuru1[];
extern const u8 gTVNewsText_GameCorner1[];
extern const u8 gTVNewsText_LilycoveDepartment1[];
extern const u8 gTVNewsText_EnergyGuru2[];
extern const u8 gTVNewsText_GameCorner2[];
extern const u8 gTVNewsText_LilycoveDepartment2[];
extern const u8 gTVNewsText_EnergyGuru3[];
extern const u8 gTVNewsText_GameCorner3[];
extern const u8 gTVNewsText_LilycoveDepartment3[];
extern const u8 gTVFanClubText1[];
extern const u8 gTVFanClubText2[];
extern const u8 gTVFanClubText3[];
extern const u8 gTVFanClubText4[];
extern const u8 gTVFanClubText5[];
extern const u8 gTVFanClubText6[];
extern const u8 gTVFanClubText7[];
extern const u8 gTVFanClubText8[];
extern const u8 gTVRecentHappeningsText1[];
extern const u8 gTVRecentHappeningsText2[];
extern const u8 gTVRecentHappeningsText3[];
extern const u8 gTVRecentHappeningsText4[];
extern const u8 gTVRecentHappeningsText5[];
extern const u8 gTVRecentHappeningsText6[];
extern const u8 gTVFanClubOpinionsText1[];
extern const u8 gTVFanClubOpinionsText2[];
extern const u8 gTVFanClubOpinionsText3[];
extern const u8 gTVFanClubOpinionsText4[];
extern const u8 gTVFanClubOpinionsText5[];
extern const u8 gTVPokemonOutbreakText[];
extern const u8 gTVPokemonTodayText1[];
extern const u8 gTVPokemonTodayText2[];
extern const u8 gTVPokemonTodayText3[];
extern const u8 gTVPokemonTodayText4[];
extern const u8 gTVPokemonTodayText5[];
extern const u8 gTVPokemonTodayText6[];
extern const u8 gTVPokemonTodayText7[];
extern const u8 gTVPokemonTodayText8[];
extern const u8 gTVPokemonTodayText9[];
extern const u8 gTVPokemonTodayText10[];
extern const u8 gTVPokemonTodayText11[];
extern const u8 gTVPokemonTodayText12[];
extern const u8 gTVSmartShopperText1[];
extern const u8 gTVSmartShopperText2[];
extern const u8 gTVSmartShopperText3[];
extern const u8 gTVSmartShopperText4[];
extern const u8 gTVSmartShopperText5[];
extern const u8 gTVSmartShopperText6[];
extern const u8 gTVSmartShopperText7[];
extern const u8 gTVSmartShopperText8[];
extern const u8 gTVSmartShopperText9[];
extern const u8 gTVSmartShopperText10[];
extern const u8 gTVSmartShopperText11[];
extern const u8 gTVSmartShopperText12[];
extern const u8 gTVSmartShopperText13[];
extern const u8 gTVBravoTrainerText1[];
extern const u8 gTVBravoTrainerText2[];
extern const u8 gTVBravoTrainerText3[];
extern const u8 gTVBravoTrainerText4[];
extern const u8 gTVBravoTrainerText5[];
extern const u8 gTVBravoTrainerText6[];
extern const u8 gTVBravoTrainerText7[];
extern const u8 gTVBravoTrainerText8[];
extern const u8 gTVBravoTrainerText9[];
extern const u8 gTVBravoTrainerBattleTowerText1[];
extern const u8 gTVBravoTrainerBattleTowerText2[];
extern const u8 gTVBravoTrainerBattleTowerText3[];
extern const u8 gTVBravoTrainerBattleTowerText4[];
extern const u8 gTVBravoTrainerBattleTowerText5[];
extern const u8 gTVBravoTrainerBattleTowerText6[];
extern const u8 gTVBravoTrainerBattleTowerText7[];
extern const u8 gTVBravoTrainerBattleTowerText8[];
extern const u8 gTVBravoTrainerBattleTowerText9[];
extern const u8 gTVBravoTrainerBattleTowerText10[];
extern const u8 gTVBravoTrainerBattleTowerText11[];
extern const u8 gTVBravoTrainerBattleTowerText12[];
extern const u8 gTVBravoTrainerBattleTowerText13[];
extern const u8 gTVBravoTrainerBattleTowerText14[];
extern const u8 gTVBravoTrainerBattleTowerText15[];
extern const u8 gTVNameRaterText1[];
extern const u8 gTVNameRaterText2[];
extern const u8 gTVNameRaterText3[];
extern const u8 gTVNameRaterText4[];
extern const u8 gTVNameRaterText5[];
extern const u8 gTVNameRaterText6[];
extern const u8 gTVNameRaterText7[];
extern const u8 gTVNameRaterText8[];
extern const u8 gTVNameRaterText9[];
extern const u8 gTVNameRaterText10[];
extern const u8 gTVNameRaterText11[];
extern const u8 gTVNameRaterText12[];
extern const u8 gTVNameRaterText13[];
extern const u8 gTVNameRaterText14[];
extern const u8 gTVNameRaterText15[];
extern const u8 gTVNameRaterText16[];
extern const u8 gTVNameRaterText17[];
extern const u8 gTVNameRaterText18[];
extern const u8 gTVNameRaterText19[];
extern const u8 gTVPokemonTodayFailedCaptureText1[];
extern const u8 gTVPokemonTodayFailedCaptureText2[];
extern const u8 gTVPokemonTodayFailedCaptureText3[];
extern const u8 gTVPokemonTodayFailedCaptureText4[];
extern const u8 gTVPokemonTodayFailedCaptureText5[];
extern const u8 gTVPokemonTodayFailedCaptureText6[];
extern const u8 gTVPokemonTodayFailedCaptureText7[];
extern const u8 gTVFishingGuruAdviceText1[];
extern const u8 gTVFishingGuruAdviceText2[];
extern const u8 gTVWorldOfMastersText1[];
extern const u8 gTVWorldOfMastersText2[];
extern const u8 gTVWorldOfMastersText3[];
extern const u8 gTVGabbyAndTyText1[];
extern const u8 gTVGabbyAndTyText2[];
extern const u8 gTVGabbyAndTyText3[];
extern const u8 gTVGabbyAndTyText4[];
extern const u8 gTVGabbyAndTyText5[];
extern const u8 gTVGabbyAndTyText6[];
extern const u8 gTVGabbyAndTyText7[];
extern const u8 gTVGabbyAndTyText8[];
extern const u8 gTVGabbyAndTyText9[];

const u8 *const gTVNewsTextGroup1[] =
{
    NULL,
    gTVNewsText_EnergyGuru1,
    gTVNewsText_GameCorner1,
    gTVNewsText_LilycoveDepartment1,
};

const u8 *const gTVNewsTextGroup2[] =
{
    NULL,
    gTVNewsText_EnergyGuru2,
    gTVNewsText_GameCorner2,
    gTVNewsText_LilycoveDepartment2,
};

const u8 *const gTVNewsTextGroup3[] =
{
    NULL,
    gTVNewsText_EnergyGuru3,
    gTVNewsText_GameCorner3,
    gTVNewsText_LilycoveDepartment3,
};

u8 *const gUnknown_083D1464[] =
{
    gStringVar1,
    gStringVar2,
    gStringVar3,
};

const u8 *const gTVFanClubTextGroup[] =
{
    gTVFanClubText1,
    gTVFanClubText2,
    gTVFanClubText3,
    gTVFanClubText4,
    gTVFanClubText5,
    gTVFanClubText6,
    gTVFanClubText7,
    gTVFanClubText8,
};

const u8 *const gTVRecentHappeningsTextGroup[] =
{
    gTVRecentHappeningsText1,
    gTVRecentHappeningsText2,
    gTVRecentHappeningsText3,
    gTVRecentHappeningsText4,
    gTVRecentHappeningsText5,
    gTVRecentHappeningsText6,
};

const u8 *const gTVFanClubOpinionsTextGroup[] =
{
    gTVFanClubOpinionsText1,
    gTVFanClubOpinionsText2,
    gTVFanClubOpinionsText3,
    gTVFanClubOpinionsText4,
    gTVFanClubOpinionsText5,
};

const u8 *const gTVPokemonOutbreakTextGroup[] =
{
    gTVPokemonOutbreakText,
};

const u8 *const gTVPokemonTodayTextGroup[] =
{
    gTVPokemonTodayText1,
    gTVPokemonTodayText2,
    gTVPokemonTodayText3,
    gTVPokemonTodayText4,
    gTVPokemonTodayText5,
    gTVPokemonTodayText6,
    gTVPokemonTodayText7,
    gTVPokemonTodayText8,
    gTVPokemonTodayText9,
    gTVPokemonTodayText10,
    gTVPokemonTodayText11,
    gTVPokemonTodayText12,
};

const u8 *const gTVSmartShopperTextGroup[] =
{
    gTVSmartShopperText1,
    gTVSmartShopperText2,
    gTVSmartShopperText3,
    gTVSmartShopperText4,
    gTVSmartShopperText5,
    gTVSmartShopperText6,
    gTVSmartShopperText7,
    gTVSmartShopperText8,
    gTVSmartShopperText9,
    gTVSmartShopperText10,
    gTVSmartShopperText11,
    gTVSmartShopperText12,
    gTVSmartShopperText13,
};

const u8 *const gTVBravoTrainerTextGroup[] =
{
    gTVBravoTrainerText1,
    gTVBravoTrainerText2,
    gTVBravoTrainerText3,
    gTVBravoTrainerText4,
    gTVBravoTrainerText5,
    gTVBravoTrainerText6,
    gTVBravoTrainerText7,
    gTVBravoTrainerText8,
    gTVBravoTrainerText9,
};

const u8 *const gTVBravoTrainerBattleTowerTextGroup[] =
{
    gTVBravoTrainerBattleTowerText1,
    gTVBravoTrainerBattleTowerText2,
    gTVBravoTrainerBattleTowerText3,
    gTVBravoTrainerBattleTowerText4,
    gTVBravoTrainerBattleTowerText5,
    gTVBravoTrainerBattleTowerText6,
    gTVBravoTrainerBattleTowerText7,
    gTVBravoTrainerBattleTowerText8,
    gTVBravoTrainerBattleTowerText9,
    gTVBravoTrainerBattleTowerText10,
    gTVBravoTrainerBattleTowerText11,
    gTVBravoTrainerBattleTowerText12,
    gTVBravoTrainerBattleTowerText13,
    gTVBravoTrainerBattleTowerText14,
    gTVBravoTrainerBattleTowerText15,
};

const u8 *const gTVNameRaterTextGroup[] =
{
    gTVNameRaterText1,
    gTVNameRaterText2,
    gTVNameRaterText3,
    gTVNameRaterText4,
    gTVNameRaterText5,
    gTVNameRaterText6,
    gTVNameRaterText7,
    gTVNameRaterText8,
    gTVNameRaterText9,
    gTVNameRaterText10,
    gTVNameRaterText11,
    gTVNameRaterText12,
    gTVNameRaterText13,
    gTVNameRaterText14,
    gTVNameRaterText15,
    gTVNameRaterText16,
    gTVNameRaterText17,
    gTVNameRaterText18,
    gTVNameRaterText19,
};

const u8 *const gTVPokemonTodayFailedCaptureTextGroup[] =
{
    gTVPokemonTodayFailedCaptureText1,
    gTVPokemonTodayFailedCaptureText2,
    gTVPokemonTodayFailedCaptureText3,
    gTVPokemonTodayFailedCaptureText4,
    gTVPokemonTodayFailedCaptureText5,
    gTVPokemonTodayFailedCaptureText6,
    gTVPokemonTodayFailedCaptureText7,
};

const u8 *const gTVFishingGuruAdviceTextGroup[] =
{
    gTVFishingGuruAdviceText1,
    gTVFishingGuruAdviceText2,
};

const u8 *const gTVWorldOfMastersTextGroup[] =
{
    gTVWorldOfMastersText1,
    gTVWorldOfMastersText2,
    gTVWorldOfMastersText3,
};

const u8 *const gTVGabbyAndTyTextGroup[] =
{
    gTVGabbyAndTyText1,
    gTVGabbyAndTyText2,
    gTVGabbyAndTyText3,
    gTVGabbyAndTyText4,
    gTVGabbyAndTyText5,
    gTVGabbyAndTyText6,
    gTVGabbyAndTyText7,
    gTVGabbyAndTyText8,
    gTVGabbyAndTyText9,
};

void ClearTVShowData(void)
{
    u8 showidx;
    u8 extradataidx;
    for (showidx=0; showidx<TV_SHOWS_COUNT; showidx++) {
        gSaveBlock1.tvShows[showidx].common.kind = 0;
        gSaveBlock1.tvShows[showidx].common.active = 0;
        for (extradataidx=0; extradataidx<34; extradataidx++) {
            gSaveBlock1.tvShows[showidx].common.pad02[extradataidx] = 0;
        }
    }
    sub_80BEBF4();
}

bool8 sub_80BF1B4(u8);
void sub_80BF20C(void);

void InterviewBefore_FanClubLetter(void);
void InterviewBefore_RecentHappenings(void);
void InterviewBefore_PkmnFanClubOpinions(void);
void InterviewBefore_Dummy(void);
void InterviewBefore_NameRater(void);
void InterviewBefore_BravoTrainerPkmnProfile(void);
void InterviewBefore_BravoTrainerBTProfile(void);


u8 GetTVChannelByShowType(u8);


void InterviewAfter_FanClubLetter(void);
void InterviewAfter_RecentHappenings(void);
void InterviewAfter_PkmnFanClubOpinions(void);
void InterviewAfter_DummyShow4(void);
void InterviewAfter_BravoTrainerPokemonProfile(void);
void InterviewAfter_BravoTrainerBattleTowerProfile(void);

u8 special_0x44(void)
{
    u8 i;
    u8 j;
    u8 selIdx;
    TVShow *show;

    for (i = 5; i < ARRAY_COUNT(gSaveBlock1.tvShows) - 1; i++)
    {
        if (gSaveBlock1.tvShows[i].common.kind == 0)
        {
            break;
        }
    }

    j = Random() % i;
    selIdx = j;

    do
    {
        if (GetTVChannelByShowType(gSaveBlock1.tvShows[j].common.kind) != 4)
        {
            if (gSaveBlock1.tvShows[j].common.active == TRUE)
            {
                return j;
            }
        }
        else
        {
            show = &gSaveBlock1.tvShows[j];
            if (show->massOutbreak.daysLeft == 0 && show->massOutbreak.active == TRUE)
            {
                return j;
            }
        }
        if (j == 0)
        {
            j = ARRAY_COUNT(gSaveBlock1.tvShows) - 2;
        }
        else
        {
            j--;
        }
    } while (j != selIdx);

    return 0xFF;
}

u8 FindNonMassOutbreakActiveTVShow(void);

u8 sub_80BD8B8(void)
{
    u8 retval = special_0x44();

    if (retval == 0xff)
        return 0xff;
    if (gSaveBlock1.outbreakPokemonSpecies != 0 && gSaveBlock1.tvShows[retval].common.kind == TVSHOW_MASS_OUTBREAK)
        return FindNonMassOutbreakActiveTVShow();
    return retval;
}

u8 CheckForBigMovieOrEmergencyNewsOnTV(void);
void SetTVMetatilesOnMap(int, int, u16);
bool8 FindAnyTVNewsOnTheAir(void);
bool8 IsTVShowInSearchOfTrainersAiring(void);

void UpdateTVScreensOnMap(int width, int height)
{
    FlagSet(FLAG_SYS_TV_WATCH);
    switch (CheckForBigMovieOrEmergencyNewsOnTV())
    {
    case 1:
        SetTVMetatilesOnMap(width, height, 0x3);
        break;
    case 2:
        break;
    default:
        if (gSaveBlock1.location.mapGroup == MAP_GROUP(LILYCOVE_CITY_COVE_LILY_MOTEL_1F)
         && gSaveBlock1.location.mapNum == MAP_NUM(LILYCOVE_CITY_COVE_LILY_MOTEL_1F))
        {
            SetTVMetatilesOnMap(width, height, 0x3);
        }
        else if (FlagGet(FLAG_SYS_TV_START) && (sub_80BD8B8() != 0xff || FindAnyTVNewsOnTheAir() != 0xff || IsTVShowInSearchOfTrainersAiring()))
        {
            FlagClear(FLAG_SYS_TV_WATCH);
            SetTVMetatilesOnMap(width, height, 0x3);
        }
        break;
    }
}

void SetTVMetatilesOnMap(int width, int height, u16 tileId)
{
    int x;
    int y;

    for (y=0; y<height; y++)
    {
        for (x=0; x<width; x++)
        {
            if (MapGridGetMetatileBehaviorAt(x, y) == 0x86)
                MapGridSetMetatileIdAt(x, y, tileId | 0xc00);
        }
    }
}

void TurnOffTVScreen(void)
{
    SetTVMetatilesOnMap(gUnknown_03004870.width, gUnknown_03004870.height, 0x2);
    DrawWholeMapView();
}

u8 GetTVShowType(void)
{
    return gSaveBlock1.tvShows[gSpecialVar_0x8004].common.kind;
}

u8 FindNonMassOutbreakActiveTVShow(void)
{
    u8 showIdx;
    for (showIdx=0; showIdx<24; showIdx++)
    {
        if (gSaveBlock1.tvShows[showIdx].common.kind != 0 && gSaveBlock1.tvShows[showIdx].common.kind != TVSHOW_MASS_OUTBREAK && gSaveBlock1.tvShows[showIdx].common.active == 1)
            return showIdx;
    }
    return 0xff;
}

u8 GetNonMassOutbreakActiveTVShow(void)
{
    TVShow *tvShow;
    tvShow = &gSaveBlock1.tvShows[gSpecialVar_0x8004];
    if (tvShow->common.kind == TVSHOW_MASS_OUTBREAK && gSaveBlock1.outbreakPokemonSpecies)
        return FindNonMassOutbreakActiveTVShow();
    return gSpecialVar_0x8004;
}

void ResetGabbyAndTy(void)
{
    gSaveBlock1.gabbyAndTyData.mon1 = 0;
    gSaveBlock1.gabbyAndTyData.mon2 = 0;
    gSaveBlock1.gabbyAndTyData.lastMove = 0;
    gSaveBlock1.gabbyAndTyData.quote = 0xffff;
    gSaveBlock1.gabbyAndTyData.valA_0 = 0;
    gSaveBlock1.gabbyAndTyData.valA_1 = 0;
    gSaveBlock1.gabbyAndTyData.valA_2 = 0;
    gSaveBlock1.gabbyAndTyData.valA_3 = 0;
    gSaveBlock1.gabbyAndTyData.valA_4 = 0;
    gSaveBlock1.gabbyAndTyData.valA_5 = 0;
    gSaveBlock1.gabbyAndTyData.valB_0 = 0;
    gSaveBlock1.gabbyAndTyData.valB_1 = 0;
    gSaveBlock1.gabbyAndTyData.valB_2 = 0;
    gSaveBlock1.gabbyAndTyData.valB_3 = 0;
    gSaveBlock1.gabbyAndTyData.valB_4 = 0;
    gSaveBlock1.gabbyAndTyData.valB_5 = 0;
    gSaveBlock1.gabbyAndTyData.mapnum = 0;
    gSaveBlock1.gabbyAndTyData.battleNum = 0;
}

void TakeTVShowInSearchOfTrainersOffTheAir(void);

void GabbyAndTyBeforeInterview(void)
{
    u8 i;

    gSaveBlock1.gabbyAndTyData.mon1 = gBattleResults.poke1Species;
    gSaveBlock1.gabbyAndTyData.mon2 = gBattleResults.opponentSpecies;
    gSaveBlock1.gabbyAndTyData.lastMove = gBattleResults.lastUsedMove;
    if (gSaveBlock1.gabbyAndTyData.battleNum != 0xff)
        gSaveBlock1.gabbyAndTyData.battleNum ++;
    gSaveBlock1.gabbyAndTyData.valA_0 = gBattleResults.unk5_0;

    if (gBattleResults.playerFaintCounter)
        gSaveBlock1.gabbyAndTyData.valA_1 = 1;
    else
        gSaveBlock1.gabbyAndTyData.valA_1 = 0;

    if (gBattleResults.unk3)
        gSaveBlock1.gabbyAndTyData.valA_2 = 1;
    else
        gSaveBlock1.gabbyAndTyData.valA_2 = 0;

    if (!gBattleResults.unk5_1)
    {
        for (i=0; i<11; i++)
        {
            if (gBattleResults.usedBalls[i] != 0)
            {
                gSaveBlock1.gabbyAndTyData.valA_3 = 1;
                break;
            }
        }
    }
    else
    {
        gSaveBlock1.gabbyAndTyData.valA_3 = 1;
    }

    TakeTVShowInSearchOfTrainersOffTheAir();
    if (gSaveBlock1.gabbyAndTyData.lastMove == 0)
        FlagSet(FLAG_TEMP_1);
}

void GabbyAndTyAfterInterview(void)
{
    gSaveBlock1.gabbyAndTyData.valB_0 = gSaveBlock1.gabbyAndTyData.valA_0;
    gSaveBlock1.gabbyAndTyData.valB_1 = gSaveBlock1.gabbyAndTyData.valA_1;
    gSaveBlock1.gabbyAndTyData.valB_2 = gSaveBlock1.gabbyAndTyData.valA_2;
    gSaveBlock1.gabbyAndTyData.valB_3 = gSaveBlock1.gabbyAndTyData.valA_3;
    gSaveBlock1.gabbyAndTyData.valA_4 = 1;
    gSaveBlock1.gabbyAndTyData.mapnum = gMapHeader.regionMapSectionId;
    IncrementGameStat(GAME_STAT_GOT_INTERVIEWED);
}

void TakeTVShowInSearchOfTrainersOffTheAir(void)
{
    gSaveBlock1.gabbyAndTyData.valA_4 = 0;
}

u8 GabbyAndTyGetBattleNum(void)
{
    if (gSaveBlock1.gabbyAndTyData.battleNum >= 6)
        return (gSaveBlock1.gabbyAndTyData.battleNum % 3) + 6;
    else
        return gSaveBlock1.gabbyAndTyData.battleNum;
}

bool8 IsTVShowInSearchOfTrainersAiring(void)
{
    return gSaveBlock1.gabbyAndTyData.valA_4;
}

bool8 GabbyAndTyGetLastQuote(void)
{
    if (gSaveBlock1.gabbyAndTyData.quote == 0xffff)
        return FALSE;

    EasyChat_GetWordText(gStringVar1, gSaveBlock1.gabbyAndTyData.quote);
    gSaveBlock1.gabbyAndTyData.quote |= 0xffff;
    return TRUE;
}

u8 GabbyAndTyGetLastBattleTrivia(void)
{
    if (!gSaveBlock1.gabbyAndTyData.valB_0)
        return 1;
    if (gSaveBlock1.gabbyAndTyData.valB_3)
        return 2;
    if (gSaveBlock1.gabbyAndTyData.valB_2)
        return 3;
    if (gSaveBlock1.gabbyAndTyData.valB_1)
        return 4;
    return 0;
}

void GabbyAndTySetScriptVarsToEventObjectLocalIds(void)
{
    switch (GabbyAndTyGetBattleNum())
    {
    case 1:
        gSpecialVar_0x8004 = 0xE;
        gSpecialVar_0x8005 = 0xD;
        break;
    case 2:
        gSpecialVar_0x8004 = 0x5;
        gSpecialVar_0x8005 = 0x6;
        break;
    case 3:
        gSpecialVar_0x8004 = 0x12;
        gSpecialVar_0x8005 = 0x11;
        break;
    case 4:
        gSpecialVar_0x8004 = 0x15;
        gSpecialVar_0x8005 = 0x16;
        break;
    case 5:
        gSpecialVar_0x8004 = 0x8;
        gSpecialVar_0x8005 = 0x9;
        break;
    case 6:
        gSpecialVar_0x8004 = 0x13;
        gSpecialVar_0x8005 = 0x14;
        break;
    case 7:
        gSpecialVar_0x8004 = 0x17;
        gSpecialVar_0x8005 = 0x18;
        break;
    case 8:
        gSpecialVar_0x8004 = 0xA;
        gSpecialVar_0x8005 = 0xB;
        break;
    }
}

void InterviewAfter(void)
{
    switch (gSpecialVar_0x8005)
    {
    case TVSHOW_FAN_CLUB_LETTER:
        InterviewAfter_FanClubLetter();
        break;
    case TVSHOW_RECENT_HAPPENINGS:
        InterviewAfter_RecentHappenings();
        break;
    case TVSHOW_PKMN_FAN_CLUB_OPINIONS:
        InterviewAfter_PkmnFanClubOpinions();
        break;
    case TVSHOW_UNKN_SHOWTYPE_04:
        InterviewAfter_DummyShow4();
        break;
    case TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE:
        InterviewAfter_BravoTrainerPokemonProfile();
        break;
    case TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE:
        InterviewAfter_BravoTrainerBattleTowerProfile();
        break;
    }
}

u8 sub_80BDEAC(u8 *a0)
{
    u8 lang = GAME_LANGUAGE;

    if (a0[0] == EXT_CTRL_CODE_BEGIN && a0[1] == 0x15)
        lang = LANGUAGE_JAPANESE;
    return lang;
}

void PutPokemonTodayCaughtOnAir(void)
{
    u8 i;
    u16 total;
    u16 item;

    total = 0;
    sub_80BEB20();
    sub_80BE778();

    if (gBattleResults.caughtPoke == 0)
    {
        sub_80BE074();
    }
    else
    {
        sub_80BE028();
        if (sub_80BF77C(0xffff) == 0 && StringCompareWithoutExtCtrlCodes(gSpeciesNames[gBattleResults.caughtPoke], gBattleResults.caughtNick) != 0)
        {
            gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows);
            if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_POKEMON_TODAY_CAUGHT) != 1)
            {
                for (i = 0; i < 11; i++)
                    total += gBattleResults.usedBalls[i];
                if (total != 0 || gBattleResults.unk5_1 != 0)
                {
                    struct TVShowPokemonToday *pokemonToday;

                    total = 0;
                    pokemonToday = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].pokemonToday;
                    pokemonToday->kind = TVSHOW_POKEMON_TODAY_CAUGHT;
                    pokemonToday->active = total;
                    if (gBattleResults.unk5_1 != 0)
                    {
                        total = 1;
                        item = ITEM_MASTER_BALL;
                    }
                    else
                    {
                        for (i = 0; i < 11; i++)
                            total += gBattleResults.usedBalls[i];
                        if (total > 0xff)
                            total = 0xff;
                        item = gLastUsedItem;
                    }
                    pokemonToday->var12 = total;
                    pokemonToday->ball = item;
                    StringCopy(pokemonToday->playerName, gSaveBlock2.playerName);
                    StringCopy(pokemonToday->nickname, gBattleResults.caughtNick);
                    pokemonToday->species = gBattleResults.caughtPoke;
                    sub_80BE138((TVShow *)pokemonToday);
                    pokemonToday->language = GAME_LANGUAGE;
                    pokemonToday->language2 = sub_80BDEAC(pokemonToday->nickname);
                    Text_StripExtCtrlCodes(pokemonToday->nickname);
                }
            }
        }
    }
}

void sub_80BE028(void)
{
    struct TVShowWorldOfMasters *worldOfMasters = &gSaveBlock1.tvShows[24].worldOfMasters;

    if (worldOfMasters->kind != TVSHOW_WORLD_OF_MASTERS)
    {
        sub_80BF55C(gSaveBlock1.tvShows, 24);
        worldOfMasters->var06 = GetGameStat(GAME_STAT_STEPS);
        worldOfMasters->kind = TVSHOW_WORLD_OF_MASTERS;
    }
    worldOfMasters->var02++;
    worldOfMasters->var04 = gBattleResults.caughtPoke;
    worldOfMasters->var08 = gBattleResults.poke1Species;
    worldOfMasters->var0a = gMapHeader.regionMapSectionId;
}

void sub_80BE074(void)
{
    u8 i;
    u16 total;
    u8 zero = 0;

    if (sub_80BF77C(0xffff) == 0)
    {
        for (i = 0, total = 0; i < 11; i++)
            total += gBattleResults.usedBalls[i];
        if (total > 0xff)
            total = 0xff;
        if (total > 2 && gBattleOutcome == 1)
        {
            gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows);
            if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_POKEMON_TODAY_FAILED) != 1)
            {
                struct TVShowPokemonTodayFailed *pokemonTodayFailed = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].pokemonTodayFailed;

                zero = 0;
                pokemonTodayFailed->kind = TVSHOW_POKEMON_TODAY_FAILED;
                pokemonTodayFailed->active = zero;
                pokemonTodayFailed->species = gBattleResults.poke1Species;
                pokemonTodayFailed->species2 = gBattleResults.lastOpponentSpecies;
                pokemonTodayFailed->var10 = total;
                pokemonTodayFailed->var11 = gBattleOutcome;
                pokemonTodayFailed->var12 = gMapHeader.regionMapSectionId;
                StringCopy(pokemonTodayFailed->playerName, gSaveBlock2.playerName);
                sub_80BE138((TVShow *)pokemonTodayFailed);
                pokemonTodayFailed->language = GAME_LANGUAGE;
            }
        }
    }
}


void sub_80BE138(TVShow *show)
{
    u32 playerId = GetPlayerTrainerId();

    show->common.srcTrainerId2Lo = playerId & 0xFF;
    show->common.srcTrainerId2Hi = playerId >> 8;
    show->common.srcTrainerIdLo = playerId & 0xFF;
    show->common.srcTrainerIdHi = playerId >> 8;
    show->common.trainerIdLo = playerId & 0xFF;
    show->common.trainerIdHi = playerId >> 8;
}

void sub_80BE160(TVShow *show)
{
    u32 playerId = GetPlayerTrainerId();

    show->common.srcTrainerIdLo = playerId & 0xFF;
    show->common.srcTrainerIdHi = playerId >> 8;
    show->common.trainerIdLo = playerId & 0xFF;
    show->common.trainerIdHi = playerId >> 8;
}

void InterviewAfter_BravoTrainerPokemonProfile(void)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainerSrc = &gSaveBlock1.tvShows[24].bravoTrainer;

    if (bravoTrainerSrc->kind == TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE)
    {
        struct TVShowBravoTrainerPokemonProfiles *bravoTrainerNew = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainer;

        bravoTrainerNew->kind = TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE;
        bravoTrainerNew->active = 1;
        bravoTrainerNew->species = bravoTrainerSrc->species;
        StringCopy(bravoTrainerNew->playerName, gSaveBlock2.playerName);
        StringCopy(bravoTrainerNew->pokemonNickname, bravoTrainerSrc->pokemonNickname);
        bravoTrainerNew->contestCategory = bravoTrainerSrc->contestCategory;
        bravoTrainerNew->contestRank = bravoTrainerSrc->contestRank;
        bravoTrainerNew->var14 = bravoTrainerSrc->var14;
        bravoTrainerNew->contestResult = bravoTrainerSrc->contestResult;
        bravoTrainerNew->contestCategory = bravoTrainerSrc->contestCategory;
        sub_80BE160((TVShow *)bravoTrainerNew);
        bravoTrainerNew->language = GAME_LANGUAGE;
        bravoTrainerNew->var1f = sub_80BDEAC(bravoTrainerNew->pokemonNickname);
        Text_StripExtCtrlCodes(bravoTrainerNew->pokemonNickname);
    }
}

void sub_80BE23C(u16 a0)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer = &gSaveBlock1.tvShows[24].bravoTrainer;

    InterviewBefore_BravoTrainerPkmnProfile();
    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows);
    if (gUnknown_03005D38.var0 != -1)
    {
        sub_80BF55C(gSaveBlock1.tvShows, 24);
        bravoTrainer->var14 = a0;
        bravoTrainer->kind = TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE;
    }
}

void sub_80BE284(u8 contestResult)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer = &gSaveBlock1.tvShows[24].bravoTrainer;

    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows);
    if (gUnknown_03005D38.var0 != -1)
    {
        bravoTrainer->contestResult = contestResult;
        bravoTrainer->contestCategory = gSpecialVar_ContestCategory;
        bravoTrainer->contestRank = (u8)gSpecialVar_ContestRank;
        bravoTrainer->species = GetMonData(&gPlayerParty[gUnknown_02038694], MON_DATA_SPECIES, NULL);
        GetMonData(&gPlayerParty[gUnknown_02038694], MON_DATA_NICKNAME, bravoTrainer->pokemonNickname);
    }
}

void InterviewAfter_BravoTrainerBattleTowerProfile(void)
{
    struct TVShowBravoTrainerBattleTowerSpotlight *bravoTrainerTower = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainerTower;

    bravoTrainerTower->kind = TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE;
    bravoTrainerTower->active = 1;
    StringCopy(bravoTrainerTower->trainerName, gSaveBlock2.playerName);
    StringCopy(bravoTrainerTower->enemyTrainerName, gSaveBlock2.battleTower.defeatedByTrainerName);
    bravoTrainerTower->species = gSaveBlock2.battleTower.firstMonSpecies;
    bravoTrainerTower->defeatedSpecies = gSaveBlock2.battleTower.defeatedBySpecies;
    bravoTrainerTower->var16 = GetCurrentBattleTowerWinStreak(gSaveBlock2.battleTower.lastStreakLevelType);
    bravoTrainerTower->var1c = gSaveBlock2.battleTower.battleOutcome;
    if (gSaveBlock2.battleTower.lastStreakLevelType == 0)
        bravoTrainerTower->btLevel = 50;
    else
        bravoTrainerTower->btLevel = 100;
    bravoTrainerTower->var1b = gSpecialVar_0x8004;
    sub_80BE160((TVShow *)bravoTrainerTower);
    bravoTrainerTower->language = GAME_LANGUAGE;
}

void sub_80BE3BC(void)
{
    u8 rval;
    u8 i;

    rval = sub_80BF77C(0x5555);
    if (rval == 0)
    {
        gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows);
        if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_SMART_SHOPPER) != 1)
        {
            sub_80BF20C();
            if (gMartPurchaseHistory[0].item_amount >= 20)
            {
                struct TVShowSmartShopper *smartShopper = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].smartshopperShow;

                smartShopper->kind = TVSHOW_SMART_SHOPPER;
                smartShopper->active = rval;
                smartShopper->shopLocation = gMapHeader.regionMapSectionId;
                for (i=0; i<3; i++)
                {
                    smartShopper->itemIds[i] = gMartPurchaseHistory[i].item_id;
                    smartShopper->itemAmounts[i] = gMartPurchaseHistory[i].item_amount;
                }
                smartShopper->priceReduced = GetPriceReduction(1);
                StringCopy(smartShopper->playerName, gSaveBlock2.playerName);
                sub_80BE138((TVShow *)smartShopper);
                smartShopper->language = GAME_LANGUAGE;
            }
        }
    }
}

void sub_80BE478(void)
{
    InterviewBefore_NameRater();
    if (gSpecialVar_Result == 1)
        return;

    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar1);
    if (StringLength(gSaveBlock2.playerName) > 1 && StringLength(gStringVar1) > 1)
    {
        struct TVShowNameRaterShow *nameRaterShow = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].nameRaterShow;

        nameRaterShow->kind = TVSHOW_NAME_RATER_SHOW;
        nameRaterShow->active = 1;
        nameRaterShow->species = GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_SPECIES, NULL);
        nameRaterShow->random = Random() % 3;
        nameRaterShow->random2 = Random() % 2;
        nameRaterShow->var1C = sub_80BF674(nameRaterShow->species);
        StringCopy(nameRaterShow->trainerName, gSaveBlock2.playerName);
        GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, nameRaterShow->pokemonName);
        sub_80BE160((TVShow *)nameRaterShow);
        nameRaterShow->language = GAME_LANGUAGE;
        nameRaterShow->pokemonNameLanguage = sub_80BDEAC(nameRaterShow->pokemonName);
        Text_StripExtCtrlCodes(nameRaterShow->pokemonName);
    }
}

void StartMassOutbreak(void)
{
    struct TVShowMassOutbreak *massOutbreak = &gSaveBlock1.tvShows[gSpecialVar_0x8004].massOutbreak;

    gSaveBlock1.outbreakPokemonSpecies = massOutbreak->species;
    gSaveBlock1.outbreakLocationMapNum = massOutbreak->locationMapNum;
    gSaveBlock1.outbreakLocationMapGroup = massOutbreak->locationMapGroup;
    gSaveBlock1.outbreakPokemonLevel = massOutbreak->level;
    gSaveBlock1.outbreakUnk1 = massOutbreak->var02;
    gSaveBlock1.outbreakUnk2 = massOutbreak->var0E;
    gSaveBlock1.outbreakPokemonMoves[0] = massOutbreak->moves[0];
    gSaveBlock1.outbreakPokemonMoves[1] = massOutbreak->moves[1];
    gSaveBlock1.outbreakPokemonMoves[2] = massOutbreak->moves[2];
    gSaveBlock1.outbreakPokemonMoves[3] = massOutbreak->moves[3];
    gSaveBlock1.outbreakUnk4 = massOutbreak->var03;
    gSaveBlock1.outbreakPokemonProbability = massOutbreak->probability;
    gSaveBlock1.outbreakUnk5 = 2;
}

void InterviewAfter_FanClubLetter(void)
{
    struct TVShowFanClubLetter *fanclubLetter = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubLetter;

    fanclubLetter->kind = TVSHOW_FAN_CLUB_LETTER;
    fanclubLetter->active = 1;
    StringCopy(fanclubLetter->playerName, gSaveBlock2.playerName);
    fanclubLetter->species = GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, NULL);
    sub_80BE160((TVShow *)fanclubLetter);
    fanclubLetter->language = GAME_LANGUAGE;
}

void InterviewAfter_RecentHappenings(void)
{
    struct TVShowRecentHappenings *recentHappenings = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].recentHappenings;

    recentHappenings->kind = TVSHOW_RECENT_HAPPENINGS;
    recentHappenings->active = 1;
    StringCopy(recentHappenings->playerName, gSaveBlock2.playerName);
    recentHappenings->var02 = 0;
    sub_80BE160((TVShow *)recentHappenings);
    recentHappenings->language = GAME_LANGUAGE;
}

void InterviewAfter_PkmnFanClubOpinions(void)
{
    u8 monIndex;
    struct TVShowFanclubOpinions *fanclubOpinions = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubOpinions;

    fanclubOpinions->kind = TVSHOW_PKMN_FAN_CLUB_OPINIONS;
    fanclubOpinions->active = 1;
    monIndex = GetLeadMonIndex();
    fanclubOpinions->var04A = GetMonData(&gPlayerParty[monIndex], MON_DATA_FRIENDSHIP, NULL) / 16;
    fanclubOpinions->var04B = gSpecialVar_0x8007;
    StringCopy(fanclubOpinions->playerName, gSaveBlock2.playerName);
    GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_NICKNAME, fanclubOpinions->var10);
    fanclubOpinions->var02 = GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, NULL);
    sub_80BE160((TVShow *)fanclubOpinions);
    fanclubOpinions->language = GAME_LANGUAGE;
    fanclubOpinions->var0E = sub_80BDEAC(fanclubOpinions->var10);
    Text_StripExtCtrlCodes(fanclubOpinions->var10);
}

void InterviewAfter_DummyShow4(void)
{
}

void sub_80BE778(void)
{
    if (FlagGet(FLAG_SYS_GAME_CLEAR))
    {
        u8 i;

        for (i = 0; i < 24; i++)
        {
            if (gSaveBlock1.tvShows[i].massOutbreak.kind == TVSHOW_MASS_OUTBREAK)
                return;
        }
        if (sub_80BF77C(0x147))
            return;

        gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows);
        if (gUnknown_03005D38.var0 != -1)
        {
            u16 rand = Random();
            u16 val = rand % 5;
            s32 val2 = gUnknown_03005D38.var0;
            struct TVShowMassOutbreak *massOutbreak = &gSaveBlock1.tvShows[val2].massOutbreak;

            massOutbreak->kind = TVSHOW_MASS_OUTBREAK;
            massOutbreak->active = 1;
            massOutbreak->level = gPokeOutbreakSpeciesList[val].level;
            massOutbreak->var02 = 0;
            massOutbreak->var03 = 0;
            massOutbreak->species = gPokeOutbreakSpeciesList[val].species;
            massOutbreak->var0E = 0;
            massOutbreak->moves[0] = gPokeOutbreakSpeciesList[val].moves[0];
            massOutbreak->moves[1] = gPokeOutbreakSpeciesList[val].moves[1];
            massOutbreak->moves[2] = gPokeOutbreakSpeciesList[val].moves[2];
            massOutbreak->moves[3] = gPokeOutbreakSpeciesList[val].moves[3];
            massOutbreak->locationMapNum = gPokeOutbreakSpeciesList[val].location;
            massOutbreak->locationMapGroup = 0;
            massOutbreak->var12 = 0;
            massOutbreak->probability = 0x32;
            massOutbreak->var15 = 0;
            massOutbreak->daysLeft = 0x01;
            sub_80BE160((TVShow *)massOutbreak);
            massOutbreak->language = GAME_LANGUAGE;
        }
    }
}

void EndMassOutbreak(void)
{
    gSaveBlock1.outbreakPokemonSpecies = 0;
    gSaveBlock1.outbreakLocationMapNum = 0;
    gSaveBlock1.outbreakLocationMapGroup = 0;
    gSaveBlock1.outbreakPokemonLevel = 0;
    gSaveBlock1.outbreakUnk1 = 0;
    gSaveBlock1.outbreakUnk2 = 0;
    gSaveBlock1.outbreakPokemonMoves[0] = 0;
    gSaveBlock1.outbreakPokemonMoves[1] = 0;
    gSaveBlock1.outbreakPokemonMoves[2] = 0;
    gSaveBlock1.outbreakPokemonMoves[3] = 0;
    gSaveBlock1.outbreakUnk4 = 0;
    gSaveBlock1.outbreakPokemonProbability = 0;
    gSaveBlock1.outbreakUnk5 = 0;
}

void UpdateTVShowsPerDay(u16 arg0)
{
    sub_80BE8EC(arg0);
    UpdateMassOutbreakTimeLeft(arg0);
    sub_80BEE84(arg0);
    sub_80BEA5C(arg0);
}

void sub_80BE8EC(u16 arg0)
{
    u8 showidx;

    if (gSaveBlock1.outbreakPokemonSpecies == 0)
    {
        for (showidx=0; showidx<24; showidx++)
        {
            if (gSaveBlock1.tvShows[showidx].massOutbreak.kind == TVSHOW_MASS_OUTBREAK
             && gSaveBlock1.tvShows[showidx].massOutbreak.active == 0x01)
            {
                struct TVShowMassOutbreak *massOutbreak = &gSaveBlock1.tvShows[showidx].massOutbreak;

                if (massOutbreak->daysLeft < arg0)
                    massOutbreak->daysLeft = 0;
                else
                    massOutbreak->daysLeft -= arg0;
                break;
            }
        }
    }
}

void UpdateMassOutbreakTimeLeft(u16 arg0)
{
    if (gSaveBlock1.outbreakUnk5 <= arg0)
        EndMassOutbreak();
    else
        gSaveBlock1.outbreakUnk5 -= arg0;
}

void sub_80BE97C(bool8 flag)
{
    u8 var0, var1;

    if (flag)
    {
        var0 = gUnknown_020387E2 >> 8;
        if (var0 > 4)
            sub_80BE9D4();
        gUnknown_020387E2 &= 0xFF;
        var1 = gUnknown_020387E2 & 0xFF;
        if (var1 != 0xFF)
            gUnknown_020387E2++;
    }
    else
    {
        var0 = gUnknown_020387E2 & 0xFF;
        if (var0 > 4)
            sub_80BE9D4();
        gUnknown_020387E2 &= 0xFF00;
        var1 = gUnknown_020387E2 >> 8;
        if (var1 != 0xFF)
            gUnknown_020387E2 += 0x100;
    }
}

void sub_80BE9D4(void)
{
    gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows);
    if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_FISHING_ADVICE) != 1)
    {
        struct TVShowPokemonAngler *pokemonAngler = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].pokemonAngler;
        register u8 zero asm("r1") = 0;

        asm(""::"r"(zero));
        pokemonAngler->kind = TVSHOW_FISHING_ADVICE;
        pokemonAngler->active = zero;
        pokemonAngler->var02 = gUnknown_020387E2 & 0xFF;
        pokemonAngler->var03 = gUnknown_020387E2 >> 8;
        pokemonAngler->var04 = gUnknown_020387E0;
        StringCopy(pokemonAngler->playerName, gSaveBlock2.playerName);
        sub_80BE138((TVShow *)pokemonAngler);
        pokemonAngler->language = GAME_LANGUAGE;
    }
}

void sub_80BEA50(u16 var)
{
    gUnknown_020387E0 = var;
}

void sub_80BEA88(void);

void sub_80BEA5C(u16 arg0)
{
    struct TVShowWorldOfMasters *worldOfMasters = &gSaveBlock1.tvShows[24].worldOfMasters;

    if (worldOfMasters->kind == TVSHOW_WORLD_OF_MASTERS)
    {
        if (worldOfMasters->var02 < 20)
            sub_80BF55C(gSaveBlock1.tvShows, 0x18);
        else
            sub_80BEA88();
    }
}
void sub_80BEA88(void)
{
    struct TVShowWorldOfMasters *worldOfMastersSrc = &gSaveBlock1.tvShows[24].worldOfMasters;

    if (sub_80BF77C(0xFFFF) == 0)
    {
        gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows);
        if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_WORLD_OF_MASTERS) != 1)
        {
            struct TVShowWorldOfMasters *worldOfMastersDst = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].worldOfMasters;

            worldOfMastersDst->kind = TVSHOW_WORLD_OF_MASTERS;
            worldOfMastersDst->active = 0;
            worldOfMastersDst->var02 = worldOfMastersSrc->var02;
            worldOfMastersDst->var06 = GetGameStat(GAME_STAT_STEPS) - worldOfMastersSrc->var06;
            worldOfMastersDst->var04 = worldOfMastersSrc->var04;
            worldOfMastersDst->var08 = worldOfMastersSrc->var08;
            worldOfMastersDst->var0a = worldOfMastersSrc->var0a;
            StringCopy(worldOfMastersDst->playerName, gSaveBlock2.playerName);
            sub_80BE138((TVShow *)worldOfMastersDst);
            worldOfMastersDst->language = GAME_LANGUAGE;
        }
    }
}

void sub_80BEB20(void)
{
    u16 rval;

    if (FlagGet(FLAG_SYS_GAME_CLEAR) != 0)
    {
        gUnknown_03005D38.var0 = sub_80BEBC8(gSaveBlock1.pokeNews);
        if (gUnknown_03005D38.var0 != -1 && sub_80BF77C(0x28f) != 1)
        {
            rval = (Random() % 3) + 1;
            if (sub_80BEE48(rval) != 1)
            {
                gSaveBlock1.pokeNews[gUnknown_03005D38.var0].kind = rval;
                gSaveBlock1.pokeNews[gUnknown_03005D38.var0].days = 4;
                gSaveBlock1.pokeNews[gUnknown_03005D38.var0].state = 1;
            }
        }
    }
}

int sub_80BEBC8(struct PokeNews *pokeNews)
{
    s8 i;

    for (i = 0; i < POKE_NEWS_COUNT; i++)
    {
        if (pokeNews[i].kind == 0)
            return i;
    }
    return -1;
}

void sub_80BEBF4(void)
{
    u8 i;

    for (i = 0; i < POKE_NEWS_COUNT; i++)
        sub_80BEC10(i);
}

void sub_80BEC10(u8 arg0)
{
    gSaveBlock1.pokeNews[arg0].kind = 0;
    gSaveBlock1.pokeNews[arg0].state = 0;
    gSaveBlock1.pokeNews[arg0].days = 0;
}

void sub_80BEC40(void)
{
    u8 i, j;

    for (i = 0; i < 15; i++)
    {
        if (gSaveBlock1.pokeNews[i].kind == 0)
        {
            for (j = i + 1; j < POKE_NEWS_COUNT; j++)
            {
                if (gSaveBlock1.pokeNews[j].kind != 0)
                {
                    gSaveBlock1.pokeNews[i] = gSaveBlock1.pokeNews[j];
                    sub_80BEC10(j);
                    break;
                }
            }
        }
    }
}

u8 FindAnyTVNewsOnTheAir(void)
{
    u8 i;
    for (i = 0; i < POKE_NEWS_COUNT; i++)
    {
        if (gSaveBlock1.pokeNews[i].kind != 0
         && gSaveBlock1.pokeNews[i].state == 1
         && gSaveBlock1.pokeNews[i].days < 3)
            return i;
    }
    return 0xFF;
}

void DoPokeNews(void)
{
    u8 i;
    i = FindAnyTVNewsOnTheAir();
    if (i == 0xff)
    {
        gSpecialVar_Result = 0;
        return;
    }
    if (gSaveBlock1.pokeNews[i].days == 0)
    {
        gSaveBlock1.pokeNews[i].state = 2;
        if (gLocalTime.hours < 20)
            ShowFieldMessage(gTVNewsTextGroup2[gSaveBlock1.pokeNews[i].kind]);
        else
            ShowFieldMessage(gTVNewsTextGroup3[gSaveBlock1.pokeNews[i].kind]);
    }
    else
    {
        u16 value = gSaveBlock1.pokeNews[i].days;

        ConvertIntToDecimalStringN(gStringVar1, value, 0, 1);
        gSaveBlock1.pokeNews[i].state = 0;
        ShowFieldMessage(gTVNewsTextGroup1[gSaveBlock1.pokeNews[i].kind]);
    }
    gSpecialVar_Result = 1;
}

bool8 GetPriceReduction(u8 arg0)
{
    u8 i;

    if (arg0 == 0)
        return FALSE;
    for (i=0; i<POKE_NEWS_COUNT; i++)
    {
        if (gSaveBlock1.pokeNews[i].kind == arg0)
        {
            if (gSaveBlock1.pokeNews[i].state == 2 && IsPriceDiscounted(arg0) != 0)
                return TRUE;
            else
                return FALSE;
        }
    }
    return FALSE;
}

bool8 IsPriceDiscounted(u8 arg0)
{
    switch (arg0)
    {
    case 1:
        if (gSaveBlock1.location.mapGroup == MAP_GROUP(SLATEPORT_CITY)
         && gSaveBlock1.location.mapNum == MAP_NUM(SLATEPORT_CITY)
         && gSpecialVar_LastTalked == 0x1a)
            return TRUE;
        else
            return FALSE;
        break;
    case 3:
        if (gSaveBlock1.location.mapGroup == MAP_GROUP(LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP)
         && gSaveBlock1.location.mapNum == MAP_NUM(LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP))
            return TRUE;
        else
            return FALSE;
        break;
    default:
        return TRUE;
    }
}

bool8 sub_80BEE48(u8 arg0)
{
    u8 i;

    if (arg0 == 0)
        return TRUE;
    for (i=0; i<POKE_NEWS_COUNT; i++)
    {
        if (gSaveBlock1.pokeNews[i].kind == arg0)
            return TRUE;
    }
    return FALSE;
}

void sub_80BEE84(u16 var0)
{
    u8 i;

    for (i=0; i<POKE_NEWS_COUNT; i++)
    {
        if (gSaveBlock1.pokeNews[i].kind)
        {
            if (gSaveBlock1.pokeNews[i].days < var0)
            {
                sub_80BEC10(i);
            }
            else
            {
                if (!gSaveBlock1.pokeNews[i].state && FlagGet(FLAG_SYS_GAME_CLEAR) == 1)
                    gSaveBlock1.pokeNews[i].state = 1;
                gSaveBlock1.pokeNews[i].days -= var0;
            }
        }
    }
    sub_80BEC40();
}

void sub_80BEF10(u8 strvaridx, u8 rank)
{
    switch (rank)
    {
    case NORMAL_RANK:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[NORMAL_RANK + 5]);
        break;
    case SUPER_RANK:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[SUPER_RANK + 5]);
        break;
    case HYPER_RANK:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[HYPER_RANK + 5]);
        break;
    case MASTER_RANK:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[MASTER_RANK + 5]);
        break;
    }
}

void CopyContestCategoryToStringVar(u8 strvaridx, u8 category)
{
    switch (category)
    {
    case CONTEST_COOL:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[CONTEST_COOL]);
        break;
    case CONTEST_BEAUTY:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[CONTEST_BEAUTY]);
        break;
    case CONTEST_CUTE:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[CONTEST_CUTE]);
        break;
    case CONTEST_SMART:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[CONTEST_SMART]);
        break;
    case CONTEST_TOUGH:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[CONTEST_TOUGH]);
        break;
    }
}

void SetContestCategoryStringVarForInterview(void)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer = &gSaveBlock1.tvShows[gSpecialVar_0x8004].bravoTrainer;

    CopyContestCategoryToStringVar(1, bravoTrainer->contestCategory);
}

void sub_80BF088(u8 arg0, s32 price)
{
    size_t log10val = sub_80BF0B8(price);

    ConvertIntToDecimalStringN(gUnknown_083D1464[arg0], price, 0, log10val);
}

size_t sub_80BF0B8(int value)
{
    if (value / 10 == 0)
        return 1;
    else if (value / 100 == 0)
        return 2;
    else if (value / 1000 == 0)
        return 3;
    else if (value / 10000 == 0)
        return 4;
    else if (value / 100000 == 0)
        return 5;
    else if (value / 1000000 == 0)
        return 6;
    else if (value / 10000000 == 0)
        return 7;
    else if (value / 100000000 == 0)
        return 8;
    else
        return 1;
}

void sub_80BF154(u8 arg0, struct TVShowSmartShopper *arg1)
{
    u8 i;
    s32 price;
    price = 0;

    for (i = 0; i < 3; i++)
    {
        if (arg1->itemIds[i])
            price += ItemId_GetPrice(arg1->itemIds[i]) * arg1->itemAmounts[i];
    }
    if (arg1->priceReduced == 1)
        sub_80BF088(arg0, price >> 1);
    else
        sub_80BF088(arg0, price);
}

bool8 sub_80BF1B4(u8 showIdx)
{
    u8 i;
    //TVShow *tvShows;
    TVShow *tvShows = gSaveBlock1.tvShows;
    u32 trainerId = GetPlayerTrainerId();

    for (i = 5; i < 24; i++)
    {
        if (tvShows[i].common.kind == showIdx)
        {
            if ((trainerId & 0xFF) == tvShows[i].common.trainerIdLo && ((trainerId >> 8) & 0xFF) == tvShows[i].common.trainerIdHi)
                return TRUE;
        }
    }
    return FALSE;
}

void sub_80BF20C(void)
{
    u8 i, j;
    u16 tmpId, tmpAmount;

    for (i = 0; i < 2; i++)
    {
        for (j = i + 1; j < 3; j++)
        {
            if (gMartPurchaseHistory[i].item_amount < gMartPurchaseHistory[j].item_amount)
            {
                tmpId = gMartPurchaseHistory[i].item_id;
                tmpAmount = gMartPurchaseHistory[i].item_amount;
                gMartPurchaseHistory[i].item_id = gMartPurchaseHistory[j].item_id;
                gMartPurchaseHistory[i].item_amount = gMartPurchaseHistory[j].item_amount;
                gMartPurchaseHistory[j].item_id = tmpId;
                gMartPurchaseHistory[j].item_amount = tmpAmount;
            }
        }
    }
}

void sub_80BF25C(u8 showType)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (gSaveBlock1.tvShows[i].common.kind == showType)
        {
            if(gSaveBlock1.tvShows[i].common.active == 1)
            {
                gSpecialVar_Result = 1;
            }
            else
            {
                sub_80BF55C(gSaveBlock1.tvShows, i);
                sub_80BF588(gSaveBlock1.tvShows);
                sub_80BF6D8();
            }
            return;
        }
    }
    sub_80BF6D8();
}

void InterviewBefore(void)
{
    gSpecialVar_Result = FALSE;
    switch (gSpecialVar_0x8005)
    {
    case TVSHOW_FAN_CLUB_LETTER:
        InterviewBefore_FanClubLetter();
        break;
    case TVSHOW_RECENT_HAPPENINGS:
        InterviewBefore_RecentHappenings();
        break;
    case TVSHOW_PKMN_FAN_CLUB_OPINIONS:
        InterviewBefore_PkmnFanClubOpinions();
        break;
    case TVSHOW_UNKN_SHOWTYPE_04:
        InterviewBefore_Dummy();
        break;
    case TVSHOW_NAME_RATER_SHOW:
        InterviewBefore_NameRater();
        break;
    case TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE:
        InterviewBefore_BravoTrainerPkmnProfile();
        break;
    case TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE:
        InterviewBefore_BravoTrainerBTProfile();
        break;
    }
}

void InterviewBefore_FanClubLetter(void)
{
    struct TVShowFanClubLetter *fanclubLetter;

    sub_80BF25C(TVSHOW_FAN_CLUB_LETTER);
    if (gSpecialVar_Result == 0)
    {
        StringCopy(gStringVar1, gSpeciesNames[GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, 0)]);
        fanclubLetter = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubLetter;
        sub_80EB6FC(fanclubLetter->pad04, 6);
    }
}

void InterviewBefore_RecentHappenings(void)
{
    struct TVShowRecentHappenings *recentHappenings;

    sub_80BF25C(TVSHOW_RECENT_HAPPENINGS);
    if (gSpecialVar_Result == 0)
    {
        recentHappenings = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].recentHappenings;
        sub_80EB6FC(recentHappenings->var04, 6);
    }
}

void InterviewBefore_PkmnFanClubOpinions(void)
{
    struct TVShowFanclubOpinions *fanclubOpinions;

    sub_80BF25C(TVSHOW_PKMN_FAN_CLUB_OPINIONS);
    if (gSpecialVar_Result == 0)
    {
        StringCopy(gStringVar1, gSpeciesNames[GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, 0)]);
        GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_NICKNAME, gStringVar2);
        StringGetEnd10(gStringVar2);
        fanclubOpinions = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubOpinions;
        sub_80EB6FC(fanclubOpinions->var1C, 2);
    }
}

void InterviewBefore_Dummy(void)
{
    gSpecialVar_Result = 1;
}

void InterviewBefore_NameRater(void)
{
    sub_80BF25C(TVSHOW_NAME_RATER_SHOW);
}

void InterviewBefore_BravoTrainerPkmnProfile(void)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer;

    sub_80BF25C(TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE);
    if (gSpecialVar_Result == 0)
    {
        bravoTrainer = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainer;
        sub_80EB6FC(bravoTrainer->var04, 2);
    }
}

void InterviewBefore_BravoTrainerBTProfile(void)
{
    struct TVShowBravoTrainerBattleTowerSpotlight *bravoTrainerTower;

    sub_80BF25C(TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE);
    if (gSpecialVar_Result == 0)
    {
        bravoTrainerTower = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainerTower;
        sub_80EB6FC(bravoTrainerTower->var18, 1); // wrong struct ident, fix later
    }
}

#if ENGLISH
u8 NicknameDiffersFromSpeciesName(u8 monIndex)
{
    u32 species;

    GetMonData(&gPlayerParty[monIndex], MON_DATA_NICKNAME, &gStringVar1);
    species = GetMonData(&gPlayerParty[monIndex], MON_DATA_SPECIES, NULL);
    if (StringCompareWithoutExtCtrlCodes(gSpeciesNames[species], gStringVar1) == 0)
        return FALSE;

    return TRUE;
}
#elif GERMAN
u8 NicknameDiffersFromSpeciesName(u8 monIndex)
{
    u8 langData[4];
    u32 species;
    u8 *tmp;

    GetMonData(&gPlayerParty[monIndex], MON_DATA_NICKNAME, &gStringVar1);

    tmp = langData;
    tmp[0] = GetMonData(&gPlayerParty[monIndex], MON_DATA_LANGUAGE, &langData);
    if (tmp[0] != GAME_LANGUAGE)
        return TRUE;

    species = GetMonData(&gPlayerParty[monIndex], MON_DATA_SPECIES, NULL);
    if (StringCompareWithoutExtCtrlCodes(gSpeciesNames[species], gStringVar1))
        return TRUE;

    return FALSE;
}
#endif

u8 LeadMonNicknamed(void)
{
    return NicknameDiffersFromSpeciesName(GetLeadMonIndex());
}

void sub_80BF55C(TVShow tvShow[], u8 showidx)
{
    u8 idx;

    tvShow[showidx].common.kind = 0;
    tvShow[showidx].common.active = 0;
    for (idx = 0; idx < 34; idx++)
        tvShow[showidx].common.pad02[idx] = 0;
}

void sub_80BF588(TVShow tvShow[])
{
    u8 showidx;
    u8 showidx2;

    for (showidx = 0; showidx < 4; showidx++)
    {
        if (tvShow[showidx].common.kind == 0)
        {
            for (showidx2 = showidx + 1; showidx2 < 5; showidx2++)
            {
                if (tvShow[showidx2].common.kind != 0)
                {
                    tvShow[showidx] = tvShow[showidx2];
                    sub_80BF55C(tvShow, showidx2);
                    break;
                }
            }
        }
    }
    for (showidx = 5; showidx < 24; showidx++)
    {
        if (tvShow[showidx].common.kind == 0)
        {
            for (showidx2 = showidx + 1; showidx2 < 24; showidx2++)
            {
                if (tvShow[showidx2].common.kind != 0)
                {
                    tvShow[showidx] = tvShow[showidx2];
                    sub_80BF55C(gSaveBlock1.tvShows, showidx2);
                    break;
                }
            }
        }
    }
}

u16 sub_80BF638(u8 arg0, u16 arg1)
{
    u16 retval = sub_80BF674(arg1);

    StringCopy(gUnknown_083D1464[arg0], gSpeciesNames[retval]);
    return retval;
}

u16 sub_80BF674(u16 species)
{
    u16 rspecies;
    u16 cspecies;

    rspecies = (Random() % (NUM_SPECIES - 1)) + 1;
    cspecies = rspecies;
    while (GetSetPokedexFlag(SpeciesToNationalPokedexNum(cspecies), 0) != 1 || cspecies == species)
    {
        if (cspecies == SPECIES_BULBASAUR)
            cspecies = NUM_SPECIES - 1;
        else
            cspecies --;
        if (cspecies == rspecies)
        {
            cspecies = species;
            return cspecies;
        }
    }
    return cspecies;
}

void sub_80BF6D8(void)
{
    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows);
    gSpecialVar_0x8006 = gUnknown_03005D38.var0;
    if (gUnknown_03005D38.var0 == -1)
        gSpecialVar_Result = 1;
    else
        gSpecialVar_Result = 0;
}

s8 sub_80BF720(TVShow tvShow[])
{
    u8 idx;

    for (idx = 0; idx < 5; idx++)
    {
        if (tvShow[idx].common.kind == 0)
            return idx;
    }
    return -1;
}

s8 sub_80BF74C(TVShow tvShow[])
{
    s8 idx;

    for (idx = 5; idx < 24; idx++)
    {
        if (tvShow[idx].common.kind == 0)
            return idx;
    }
    return -1;
}

bool8 sub_80BF77C(u16 value)
{
    if (Random() <= value)
        return FALSE;
    return TRUE;
}

void sub_80BF79C(TVShow *arg0)
{
    u8 i = Random() % 6;

    while (1)
    {
        if (i == 6)
            i = 0;
        if (arg0->recentHappenings.var04[i] != 0xFFFF)
            break;
        i++;
    }
    EasyChat_GetWordText(gStringVar3, arg0->recentHappenings.var04[i]);
}

u8 sub_80BF7E8(struct TVShowNameRaterShow *arg0)
{
    u16 flagsum = 0;
    u8 i = 0;

    if (arg0->pokemonName[0] != 0xFF)
    {
        while (i < 11 && arg0->pokemonName[i] != 0xFF)
        {
            flagsum += arg0->pokemonName[i];
            i++;
        }
    }
    return flagsum & 0x7;
}


void sub_80BF820(u8 arg0, u8 arg1, u8 arg2, u16 arg3, u16 arg4, struct TVShowNameRaterShow *tvShow)
{
    u8 flags[3];
    u16 nameLength;
    u8 i;

    for (i = 0; i < 3; i++)
        flags[i] = EOS;

    if (arg3 == 0)
    {
        nameLength = StringLength(tvShow->trainerName);
        if (arg2 == 0)
        {
            flags[0] = tvShow->trainerName[arg1];
        }
        else if (arg2 == 1)
        {
            flags[0] = tvShow->trainerName[nameLength - arg1];
        }
        else if (arg2 == 2) {
            flags[0] = tvShow->trainerName[arg1];
            flags[1] = tvShow->trainerName[arg1 + 1];
        }
        else
        {
            flags[0] = tvShow->trainerName[nameLength - (arg1 + 2)];
            flags[1] = tvShow->trainerName[nameLength - (arg1 + 1)];
        }
    }
    else if (arg3 == 1)
    {
        nameLength = StringLength(tvShow->pokemonName);
        if (arg2 == 0)
        {
            flags[0] = tvShow->pokemonName[arg1];
        }
        else if (arg2 == 1)
        {
            flags[0] = tvShow->pokemonName[nameLength - arg1];
        }
        else if (arg2 == 2)
        {
            flags[0] = tvShow->pokemonName[arg1];
            flags[1] = tvShow->pokemonName[arg1 + 1];
        }
        else
        {
            flags[0] = tvShow->pokemonName[nameLength - (arg1 + 2)];
            flags[1] = tvShow->pokemonName[nameLength - (arg1 + 1)];
        }
    }
    else
    {
        nameLength = StringLength(gSpeciesNames[arg4]);
        if (arg2 == 0)
        {
            flags[0] = gSpeciesNames[arg4][arg1];
        }
        else if (arg2 == 1)
        {
            flags[0] = gSpeciesNames[arg4][nameLength - arg1];
        }
        else if (arg2 == 2)
        {
            flags[0] = gSpeciesNames[arg4][arg1];
            flags[1] = gSpeciesNames[arg4][arg1 + 1];
        }
        else
        {
            flags[0] = gSpeciesNames[arg4][nameLength - (arg1 + 2)];
            flags[1] = gSpeciesNames[arg4][nameLength - (arg1 + 1)];
        }
    }
    StringCopy(gUnknown_083D1464[arg0], flags);
}

bool8 TV_IsScriptShowKindAlreadyInQueue(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (gSaveBlock1.tvShows[i].common.kind == gSpecialVar_0x8004)
            return TRUE;
    }
    return FALSE;
}

bool8 TV_PutNameRaterShowOnTheAirIfNicnkameChanged(void)
{
    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_NICKNAME, &gStringVar1);
    if (!StringCompareWithoutExtCtrlCodes(gStringVar3, gStringVar1))
        return FALSE;
    sub_80BE478();
    return TRUE;
}

void ChangePokemonNickname_CB(void);

void ChangePokemonNickname(void)
{
    u16 spec;
    u16 gender;
    u32 pval;

    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_NICKNAME, &gStringVar3);
    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_NICKNAME, &gStringVar2);
    spec = GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_SPECIES, 0);
    gender = GetMonGender(&(gPlayerParty[gSpecialVar_0x8004]));
    pval = GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_PERSONALITY, 0);
    DoNamingScreen(3, gStringVar2, spec, gender, pval, ChangePokemonNickname_CB);
}

void ChangePokemonNickname_CB(void)
{
    SetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_NICKNAME, gStringVar2);
    c2_exit_to_overworld_1_continue_scripts_restart_music();
}

void TV_CopyNicknameToStringVar1AndEnsureTerminated(void)
{
    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_NICKNAME, &gStringVar1);
    StringGetEnd10(gStringVar1);
}

void TV_CheckMonOTIDEqualsPlayerID(void)
{
    if (GetPlayerTrainerId() == GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_OT_ID, 0))
        gSpecialVar_Result = 0;
    else
        gSpecialVar_Result = 1;
}

u8 GetTVChannelByShowType(u8 arg0)
{
    if (arg0 == 0)
        return 0;
    else if (arg0 > 0 && arg0 <= 20)
        return 2;
    else if (arg0 > 20 && arg0 <= 40)
        return 3;
    else if (arg0 > 40 && arg0 <= 60)
        return 4;
    else
        return 0;
}

u32 GetPlayerTrainerId(void)
{
    return (gSaveBlock2.playerTrainerId[3] << 24) | (gSaveBlock2.playerTrainerId[2] << 16) | (gSaveBlock2.playerTrainerId[1] << 8) | (gSaveBlock2.playerTrainerId[0]);
}

u8 CheckForBigMovieOrEmergencyNewsOnTV(void)
{
    if (gSaveBlock1.location.mapGroup != MAP_GROUP(LITTLEROOT_TOWN_BRENDANS_HOUSE_1F))
        return 0;
    if (gSaveBlock2.playerGender == MALE)
    {
        if (gSaveBlock1.location.mapNum != MAP_NUM(LITTLEROOT_TOWN_BRENDANS_HOUSE_1F))
            return 0;
    }
    else
    {
        if (gSaveBlock1.location.mapNum != MAP_NUM(LITTLEROOT_TOWN_MAYS_HOUSE_1F))
            return 0;
    }
    if (FlagGet(FLAG_SYS_TV_LATI) == 1)
        return 1;
    if (FlagGet(FLAG_SYS_TV_HOME) == 1)
        return 2;
    return 1;
}

void GetMomOrDadStringForTVMessage(void)
{
    if (gSaveBlock1.location.mapGroup == MAP_GROUP(LITTLEROOT_TOWN_BRENDANS_HOUSE_1F))
    {
        if (gSaveBlock2.playerGender == MALE)
        {
            if (gSaveBlock1.location.mapNum == MAP_NUM(LITTLEROOT_TOWN_BRENDANS_HOUSE_1F))
            {
                StringCopy(gStringVar1, gOtherText_Mom);
                VarSet(VAR_TEMP_3, 1);
            }
        }
        else
        {
            if (gSaveBlock1.location.mapNum == MAP_NUM(LITTLEROOT_TOWN_MAYS_HOUSE_1F))
            {
                StringCopy(gStringVar1, gOtherText_Mom);
                VarSet(VAR_TEMP_3, 1);
            }
        }
    }
    if (VarGet(VAR_TEMP_3) == 1)
    {
        StringCopy(gStringVar1, gOtherText_Mom);
    }
    else if (VarGet(VAR_TEMP_3) == 2)
    {
        StringCopy(gStringVar1, gOtherText_Dad);
    }
    else if (VarGet(VAR_TEMP_3) > 2)
    {
        if (VarGet(VAR_TEMP_3) % 2 == 0)
            StringCopy(gStringVar1, gOtherText_Mom);
        else
            StringCopy(gStringVar1, gOtherText_Dad);
    }
    else
    {
        if (Random() % 2 != 0)
        {
            StringCopy(gStringVar1, gOtherText_Mom);
            VarSet(VAR_TEMP_3, 1);
        }
        else
        {
            StringCopy(gStringVar1, gOtherText_Dad);
            VarSet(VAR_TEMP_3, 2);
        }
    }
}

void sub_80BFD20(void)
{
    VarSet(VAR_BRAVO_TRAINER_BATTLE_TOWER_ON, 0);
    RemoveEventObjectByLocalIdAndMap(5, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
}

typedef union ewramStruct_02007000
{
    TVShow tvshows[4][TV_SHOWS_COUNT];
    struct PokeNews pokeNews[4][POKE_NEWS_COUNT];
} ewramStruct_02007000;

void sub_80BFE24(TVShow arg0[TV_SHOWS_COUNT], TVShow arg1[TV_SHOWS_COUNT], TVShow arg2[TV_SHOWS_COUNT], TVShow arg3[TV_SHOWS_COUNT]);

void sub_80C04A0(void);
void sub_80C01D4(void);
void sub_80C0408(void);

void sub_80BFD44(u8 *arg0, u32 arg1, u8 arg2)
{
    u8 i;
    ewramStruct_02007000 *ewramTVShows;

    for (i = 0; i < 4; i++)
        memcpy(&gUnknown_02007000.tvshows[i], &arg0[i * arg1], TV_SHOWS_COUNT * sizeof(TVShow));
    ewramTVShows = &gUnknown_02007000;
    switch (arg2)
    {
    case 0:
        sub_80BFE24(gSaveBlock1.tvShows, ewramTVShows->tvshows[1], ewramTVShows->tvshows[2], ewramTVShows->tvshows[3]);
        break;
    case 1:
        sub_80BFE24(ewramTVShows->tvshows[0], gSaveBlock1.tvShows, ewramTVShows->tvshows[2], ewramTVShows->tvshows[3]);
        break;
    case 2:
        sub_80BFE24(ewramTVShows->tvshows[0], ewramTVShows->tvshows[1], gSaveBlock1.tvShows, ewramTVShows->tvshows[3]);
        break;
    case 3:
        sub_80BFE24(ewramTVShows->tvshows[0], ewramTVShows->tvshows[1], ewramTVShows->tvshows[2], gSaveBlock1.tvShows);
        break;
    }
    sub_80BF588(gSaveBlock1.tvShows);
    sub_80C04A0();
    sub_80BF588(gSaveBlock1.tvShows);
    sub_80C01D4();
    sub_80C0408();
}

s8 sub_80C019C(TVShow tvShows[]);
bool8 sub_80BFF68(TVShow * tv1[TV_SHOWS_COUNT], TVShow * tv2[TV_SHOWS_COUNT], u8 idx);
u8 sub_80C004C(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C00B4(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C0134(TVShow *tv1, TVShow *tv2, u8 idx);

void sub_80BFE24(TVShow arg0[TV_SHOWS_COUNT], TVShow arg1[TV_SHOWS_COUNT], TVShow arg2[TV_SHOWS_COUNT], TVShow arg3[TV_SHOWS_COUNT])
{
    u8 i, j;
    TVShow **argslist[4];

    argslist[0] = &arg0;
    argslist[1] = &arg1;
    argslist[2] = &arg2;
    argslist[3] = &arg3;
    gUnknown_03000720 = GetLinkPlayerCount();
    while (1)
    {
        for (i=0; i<gUnknown_03000720; i++)
        {
            if (i == 0)
                gUnknown_020387E4 = i;
            gUnknown_03000722 = sub_80C019C(argslist[i][0]);
            if (gUnknown_03000722 == -1)
            {
                gUnknown_020387E4++;
                if (gUnknown_020387E4 == gUnknown_03000720)
                    return;
            }
            else
            {
                for (j=0; j<gUnknown_03000720-1; j++)
                {
                    gUnknown_03005D38.var0 = sub_80BF74C(argslist[(i + j + 1) % gUnknown_03000720][0]);
                    if (gUnknown_03005D38.var0 != -1
                     && sub_80BFF68(&argslist[(i + j + 1) % gUnknown_03000720][0], &argslist[i][0], (i + j + 1) % gUnknown_03000720) == 1)
                        break;
                }
                if (j == gUnknown_03000720 - 1)
                    sub_80BF55C(argslist[i][0], gUnknown_03000722);
            }
        }
    }
}

bool8 sub_80BFF68(TVShow * arg1[TV_SHOWS_COUNT], TVShow * arg2[TV_SHOWS_COUNT], u8 idx)
{
    u8 value;
    u8 switchval;
    TVShow *tv1;
    TVShow *tv2;

    tv1 = *arg1;
    tv2 = *arg2;
    value = FALSE;
    switchval = GetTVChannelByShowType(tv2[gUnknown_03000722].common.kind);
    switch (switchval)
    {
    case 2:
        value = sub_80C004C(&tv1[gUnknown_03005D38.var0], &tv2[gUnknown_03000722], idx);
        break;
    case 3:
        value = sub_80C00B4(&tv1[gUnknown_03005D38.var0], &tv2[gUnknown_03000722], idx);
        break;
    case 4:
        value = sub_80C0134(&tv1[gUnknown_03005D38.var0], &tv2[gUnknown_03000722], idx);
        break;
    }
    if (value == TRUE)
    {
        sub_80BF55C(tv2, gUnknown_03000722);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

u8 sub_80C004C(TVShow *tv1, TVShow *tv2, u8 idx)
{
    u32 linkTrainerId = GetLinkPlayerTrainerId(idx);

    if ((linkTrainerId & 0xFF) == tv2->common.trainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.trainerIdHi)
        return FALSE;
    tv2->common.trainerIdLo = tv2->common.srcTrainerIdLo;
    tv2->common.trainerIdHi = tv2->common.srcTrainerIdHi;
    tv2->common.srcTrainerIdLo = linkTrainerId & 0xFF;
    tv2->common.srcTrainerIdHi = linkTrainerId >> 8;
    *tv1 = *tv2;
    tv1->common.active = 1;
    return TRUE;
}

u8 sub_80C00B4(TVShow *tv1, TVShow *tv2, u8 idx)
{
    u32 linkTrainerId = GetLinkPlayerTrainerId(idx);
    if ((linkTrainerId & 0xFF) == tv2->common.srcTrainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.srcTrainerIdHi)
        return FALSE;
    if ((linkTrainerId & 0xFF) == tv2->common.trainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.trainerIdHi)
        return FALSE;
    tv2->common.srcTrainerIdLo = tv2->common.srcTrainerId2Lo;
    tv2->common.srcTrainerIdHi = tv2->common.srcTrainerId2Hi;
    tv2->common.srcTrainerId2Lo = linkTrainerId & 0xFF;
    tv2->common.srcTrainerId2Hi = linkTrainerId >> 8;
    *tv1 = *tv2;
    tv1->common.active = 1;
    return TRUE;
}

u8 sub_80C0134(TVShow *tv1, TVShow *tv2, u8 idx)
{
    u32 linkTrainerId = GetLinkPlayerTrainerId(idx);
    if ((linkTrainerId & 0xFF) == tv2->common.trainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.trainerIdHi)
        return FALSE;
    tv2->common.trainerIdLo = tv2->common.srcTrainerIdLo;
    tv2->common.trainerIdHi = tv2->common.srcTrainerIdHi;
    tv2->common.srcTrainerIdLo = linkTrainerId & 0xFF;
    tv2->common.srcTrainerIdHi = linkTrainerId >> 8;
    *tv1 = *tv2;
    tv1->common.active = 1;
    tv1->common.var16[0] = 1;
    return TRUE;
}

s8 sub_80C019C(TVShow tvShows[])
{
    u8 i;
    for (i = 0; i < 24; i++)
    {
        if (tvShows[i].common.active == 0 && (u8)(tvShows[i].common.kind - 1) < 60)
            return i;
    }
    return -1;
}

#ifdef NONMATCHING
void sub_80C01D4(void)
{
    u16 i;
    for (i=0; i<24; i++)
    {
        switch (gSaveBlock1.tvShows[i].common.kind)
        {
            case 0:
            case TVSHOW_RECENT_HAPPENINGS:
            case TVSHOW_SMART_SHOPPER:
            case TVSHOW_MASS_OUTBREAK:
                break;
            case TVSHOW_FAN_CLUB_LETTER:
                sub_80C03C8((&gSaveBlock1.tvShows[i])->fanclubLetter.species, i);
                break;
            case TVSHOW_PKMN_FAN_CLUB_OPINIONS:
                sub_80C03C8((&gSaveBlock1.tvShows[i])->fanclubOpinions.var02, i);
                break;
            case TVSHOW_UNKN_SHOWTYPE_04:
                sub_80C03C8((&gSaveBlock1.tvShows[i])->unkShow04.var06, i);
                break;
            case TVSHOW_NAME_RATER_SHOW:
                sub_80C03C8((&gSaveBlock1.tvShows[i])->nameRaterShow.species, i);
                sub_80C03C8((&gSaveBlock1.tvShows[i])->nameRaterShow.var1C, i);
                break;
            case TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE:
                sub_80C03C8((&gSaveBlock1.tvShows[i])->bravoTrainer.species, i);
                break;
            case TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE:
                sub_80C03C8((&gSaveBlock1.tvShows[i])->bravoTrainerTower.species, i);
                sub_80C03C8((&gSaveBlock1.tvShows[i])->bravoTrainerTower.defeatedSpecies, i);
                break;
            case TVSHOW_POKEMON_TODAY_CAUGHT:
                sub_80C03C8((&gSaveBlock1.tvShows[i])->pokemonToday.species, i);
                break;
            case TVSHOW_POKEMON_TODAY_FAILED:
                sub_80C03C8((&gSaveBlock1.tvShows[i])->pokemonTodayFailed.species, i);
                sub_80C03C8((&gSaveBlock1.tvShows[i])->pokemonTodayFailed.species2, i);
                break;
            case TVSHOW_FISHING_ADVICE:
                sub_80C03C8((&gSaveBlock1.tvShows[i])->pokemonAngler.var04, i);
                break;
            case TVSHOW_WORLD_OF_MASTERS:
                sub_80C03C8((&gSaveBlock1.tvShows[i])->worldOfMasters.var08, i);
                sub_80C03C8((&gSaveBlock1.tvShows[i])->worldOfMasters.var04, i);
                break;
            default:
                sub_80C03A8(i);
        }
    }
}
#else
NAKED
void sub_80C01D4(void) {
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    movs r6, 0\n\
_080C01D8:\n\
    ldr r0, _080C01F8 @ =gSaveBlock1\n\
    lsls r2, r6, 3\n\
    adds r1, r2, r6\n\
    lsls r1, 2\n\
    adds r1, r0\n\
    ldr r0, _080C01FC @ =0x00002738\n\
    adds r1, r0\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x29\n\
    bls _080C01EE\n\
    b _default\n\
_080C01EE:\n\
    lsls r0, 2\n\
    ldr r1, _080C0200 @ =_080C0204\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_080C01F8: .4byte gSaveBlock1\n\
_080C01FC: .4byte 0x00002738\n\
_080C0200: .4byte _080C0204\n\
    .align 2, 0\n\
_080C0204:\n\
    .4byte _break\n\
    .4byte _fanclubLetter @ TVSHOW_FAN_CLUB_LETTER\n\
    .4byte _break    @ TVSHOW_RECENT_HAPPENINGS\n\
    .4byte _fanclubOpinions @ TVSHOW_PKMN_FAN_CLUB_OPINIONS\n\
    .4byte _showtype4 @ TVSHOW_UNKN_SHOWTYPE_04\n\
    .4byte _nameRater @ TVSHOW_NAME_RATER_SHOW\n\
    .4byte _bravoTrainerContest @ TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE\n\
    .4byte _bravoTrainerTower @ TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _pokemonTodayS @ TVSHOW_POKEMON_TODAY_CAUGHT\n\
    .4byte _break    @ TVSHOW_SMART_SHOPPER\n\
    .4byte _pokemonTodayF @ TVSHOW_POKEMON_TODAY_FAILED\n\
    .4byte _fishing @ TVSHOW_FISHING_ADVICE\n\
    .4byte _worldOfMasters @ TVSHOW_WORLD_OF_MASTERS\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _default\n\
    .4byte _break    @ TVSHOW_MASS_OUTBREAK\n\
_fanclubLetter:\n\
    adds r0, r2, r6\n\
    lsls r0, 2\n\
    ldr r1, _080C02B8 @ =gSaveBlock1 + 0x2738\n\
    adds r0, r1\n\
    ldrh r0, [r0, 0x2]\n\
    b _checkSpecies1 @ sub_80C03C8(r0, i)\n\
    .align 2, 0\n\
_080C02B8: .4byte gSaveBlock1 + 0x2738\n\
_fanclubOpinions:\n\
    adds r0, r2, r6\n\
    lsls r0, 2\n\
    ldr r1, _080C02C8 @ =gSaveBlock1 + 0x2738\n\
    adds r0, r1\n\
    ldrh r0, [r0, 0x2]\n\
    b _checkSpecies1 @ sub_80C03C8(r0, i)\n\
    .align 2, 0\n\
_080C02C8: .4byte gSaveBlock1 + 0x2738\n\
_showtype4:\n\
    adds r0, r2, r6\n\
    lsls r0, 2\n\
    ldr r1, _080C02D8 @ =gSaveBlock1 + 0x2738\n\
    adds r0, r1\n\
    ldrh r0, [r0, 0x6]\n\
    b _checkSpecies1 @ sub_80C03C8(r0, i)\n\
    .align 2, 0\n\
_080C02D8: .4byte gSaveBlock1 + 0x2738\n\
_nameRater:\n\
    adds r4, r2, r6\n\
    lsls r4, 2\n\
    ldr r0, _080C02F4 @ =gSaveBlock1 + 0x2738\n\
    adds r4, r0\n\
    ldrh r0, [r4, 0x2]\n\
    lsls r5, r6, 24\n\
    lsrs r5, 24\n\
    adds r1, r5, 0\n\
    bl sub_80C03C8\n\
    ldrh r0, [r4, 0x1C]\n\
    b _checkSpecies2 @ sub_80C03C8(r0, i)\n\
    .align 2, 0\n\
_080C02F4: .4byte gSaveBlock1 + 0x2738\n\
_bravoTrainerContest:\n\
    adds r0, r2, r6\n\
    lsls r0, 2\n\
    ldr r1, _080C0304 @ =gSaveBlock1 + 0x2738\n\
    adds r0, r1\n\
    ldrh r0, [r0, 0x2]\n\
    b _checkSpecies1 @ sub_80C03C8(r0, i)\n\
    .align 2, 0\n\
_080C0304: .4byte gSaveBlock1 + 0x2738\n\
_bravoTrainerTower:\n\
    adds r4, r2, r6\n\
    lsls r4, 2\n\
    ldr r0, _080C0320 @ =gSaveBlock1 + 0x2738\n\
    adds r4, r0\n\
    ldrh r0, [r4, 0xA]\n\
    lsls r5, r6, 24\n\
    lsrs r5, 24\n\
    adds r1, r5, 0\n\
    bl sub_80C03C8\n\
    ldrh r0, [r4, 0x14]\n\
    b _checkSpecies2 @ sub_80C03C8(r0, i)\n\
    .align 2, 0\n\
_080C0320: .4byte gSaveBlock1 + 0x2738\n\
_pokemonTodayS:\n\
    adds r0, r2, r6\n\
    lsls r0, 2\n\
    ldr r1, _080C0330 @ =gSaveBlock1 + 0x2738\n\
    adds r0, r1\n\
    ldrh r0, [r0, 0x10]\n\
    b _checkSpecies1 @ sub_80C03C8(r0, i)\n\
    .align 2, 0\n\
_080C0330: .4byte gSaveBlock1 + 0x2738\n\
_pokemonTodayF:\n\
    adds r4, r2, r6\n\
    lsls r4, 2\n\
    ldr r0, _080C034C @ =gSaveBlock1 + 0x2738\n\
    adds r4, r0\n\
    ldrh r0, [r4, 0xC]\n\
    lsls r5, r6, 24\n\
    lsrs r5, 24\n\
    adds r1, r5, 0\n\
    bl sub_80C03C8\n\
    ldrh r0, [r4, 0xE]\n\
    b _checkSpecies2 @ sub_80C03C8(r0, i)\n\
    .align 2, 0\n\
_080C034C: .4byte gSaveBlock1 + 0x2738\n\
_fishing:\n\
    adds r0, r2, r6\n\
    lsls r0, 2\n\
    ldr r1, _080C0364 @ =gSaveBlock1 + 0x2738\n\
    adds r0, r1\n\
    ldrh r0, [r0, 0x4]\n\
_checkSpecies1:\n\
    lsls r1, r6, 24\n\
    lsrs r1, 24\n\
    bl sub_80C03C8\n\
    b _break\n\
    .align 2, 0\n\
_080C0364: .4byte gSaveBlock1 + 0x2738\n\
_worldOfMasters:\n\
    adds r4, r2, r6\n\
    lsls r4, 2\n\
    ldr r0, _080C0388 @ =gSaveBlock1 + 0x2738\n\
    adds r4, r0\n\
    ldrh r0, [r4, 0x8]\n\
    lsls r5, r6, 24\n\
    lsrs r5, 24\n\
    adds r1, r5, 0\n\
    bl sub_80C03C8\n\
    ldrh r0, [r4, 0x4]\n\
_checkSpecies2:\n\
    adds r1, r5, 0\n\
    bl sub_80C03C8\n\
    b _break\n\
    .align 2, 0\n\
_080C0388: .4byte gSaveBlock1 + 0x2738\n\
_default:\n\
    lsls r0, r6, 24\n\
    lsrs r0, 24\n\
    bl sub_80C03A8\n\
_break:\n\
    adds r0, r6, 0x1\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
    cmp r6, 0x17\n\
    bhi _080C03A0\n\
    b _080C01D8\n\
_080C03A0:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
.syntax divided\n");
}
#endif

void sub_80C03A8(u8 showidx)
{
    gSaveBlock1.tvShows[showidx].common.active = 0;
}

void sub_80C03C8(u16 species, u8 showidx)
{
    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), 0) == 0)
        gSaveBlock1.tvShows[showidx].common.active = 0;
}

void sub_80C0408(void)
{
    u16 i;

    if (FlagGet(FLAG_SYS_GAME_CLEAR) == TRUE)
        return;
    for (i = 0; i < 24; i++)
    {
        if (gSaveBlock1.tvShows[i].common.kind == TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE)
            gSaveBlock1.tvShows[i].common.active = 0;
        else if (gSaveBlock1.tvShows[i].common.kind == TVSHOW_MASS_OUTBREAK)
            gSaveBlock1.tvShows[i].common.active = 0;
    }
}

void sub_80C045C(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (GetTVChannelByShowType(gSaveBlock1.tvShows[i].common.kind) == 2)
            gSaveBlock1.tvShows[i].common.active = 0;
    }
}

void sub_80C04A0(void)
{
    s8 showIdx;
    s8 count;
    count = 0;

    for (showIdx = 5; showIdx < 24; showIdx++)
    {
        if (gSaveBlock1.tvShows[showIdx].common.kind == 0)
            count++;
    }
    for (showIdx = 0; showIdx < 5 - count; showIdx++)
        sub_80BF55C(gSaveBlock1.tvShows, showIdx+5);
}

void sub_80C05C4(struct PokeNews[POKE_NEWS_COUNT], struct PokeNews[POKE_NEWS_COUNT], struct PokeNews[POKE_NEWS_COUNT], struct PokeNews[POKE_NEWS_COUNT]);
void sub_80C0750(void);
void sub_80C0788(void);
s8 sub_80C0730(struct PokeNews[POKE_NEWS_COUNT], u8);
void sub_80C06BC(struct PokeNews *[POKE_NEWS_COUNT], struct PokeNews *[POKE_NEWS_COUNT]);

void sub_80C0514(void *a0, u32 a1, u8 a2)
{
    ewramStruct_02007000 *struct02007000;
    u8 i;

    for (i = 0; i < 4; i++)
        memcpy(gUnknown_02007000.pokeNews[i], a0 + i * a1, 64);
    struct02007000 = &gUnknown_02007000;
    switch (a2)
    {
    case 0:
        sub_80C05C4(gSaveBlock1.pokeNews, struct02007000->pokeNews[1], struct02007000->pokeNews[2], struct02007000->pokeNews[3]);
        break;
    case 1:
        sub_80C05C4(struct02007000->pokeNews[0], gSaveBlock1.pokeNews, struct02007000->pokeNews[2], struct02007000->pokeNews[3]);
        break;
    case 2:
        sub_80C05C4(struct02007000->pokeNews[0], struct02007000->pokeNews[1], gSaveBlock1.pokeNews, struct02007000->pokeNews[3]);
        break;
    case 3:
        sub_80C05C4(struct02007000->pokeNews[0], struct02007000->pokeNews[1], struct02007000->pokeNews[2], gSaveBlock1.pokeNews);
        break;
    }
    sub_80C0750();
    sub_80C0788();
}

void sub_80C05C4(struct PokeNews a0[POKE_NEWS_COUNT], struct PokeNews a1[POKE_NEWS_COUNT], struct PokeNews a2[POKE_NEWS_COUNT], struct PokeNews a3[POKE_NEWS_COUNT])
{
    u8 i;
    u8 j;
    u8 k;
    struct PokeNews ** arglist[4];

    arglist[0] = &a0;
    arglist[1] = &a1;
    arglist[2] = &a2;
    arglist[3] = &a3;
    gUnknown_03000721 = GetLinkPlayerCount();
    for (i = 0; i < POKE_NEWS_COUNT; i++)
    {
        for (j = 0; j < gUnknown_03000721; j++)
        {
            gUnknown_03000722 = sub_80C0730(*arglist[j], i);
            if (gUnknown_03000722 != -1)
            {
                for (k = 0; k < gUnknown_03000721-1; k++)
                {
                    gUnknown_03005D38.var0 = sub_80BEBC8(*arglist[(j + k + 1) % gUnknown_03000721]);
                    if (gUnknown_03005D38.var0 != -1)
                        sub_80C06BC(arglist[(j + k + 1) % gUnknown_03000721], arglist[j]);
                }
            }
        }
    }
}

void sub_80C06BC(struct PokeNews *arg0[POKE_NEWS_COUNT], struct PokeNews *arg1[POKE_NEWS_COUNT])
{
    struct PokeNews *str0;
    struct PokeNews *str1;

    str0 = arg0[0];
    str1 = arg1[0];
    str1 += gUnknown_03000722;
    sub_80C06E8(str0, str1, gUnknown_03005D38.var0);
}

bool8 sub_80C06E8(struct PokeNews *arg0, struct PokeNews *arg1, s8 arg2)
{
    u8 i;

    if (arg1->kind == 0)
        return FALSE;
    for (i = 0; i < POKE_NEWS_COUNT; i++)
    {
        if (arg0[i].kind == arg1->kind)
            return FALSE;
    }
    arg0[arg2].kind = arg1->kind;
    arg0[arg2].state = 1;
    arg0[arg2].days = arg1->days;
    return TRUE;
}

s8 sub_80C0730(struct PokeNews *arg0, u8 arg1)
{
    if (arg0[arg1].kind == 0)
        return -1;
    return arg1;
}

void sub_80C0750(void)
{
    u8 i;

    for (i = 0; i < POKE_NEWS_COUNT; i++)
    {
        if (gSaveBlock1.pokeNews[i].kind > 3)
            sub_80BEC10(i);
    }
    sub_80BEC40();
}

void sub_80C0788(void)
{
    u8 i;

    if (FlagGet(FLAG_SYS_GAME_CLEAR) != 1)
    {
        for (i = 0; i < POKE_NEWS_COUNT; i++)
            gSaveBlock1.pokeNews[i].state = 0;
    }
}

void DoTVShow(void)
{
    if (gSaveBlock1.tvShows[gSpecialVar_0x8004].common.active != 0)
    {
        switch (gSaveBlock1.tvShows[gSpecialVar_0x8004].common.kind)
        {
        case TVSHOW_FAN_CLUB_LETTER:
            DoTVShowPokemonFanClubLetter();
            break;
        case TVSHOW_RECENT_HAPPENINGS:
            DoTVShowRecentHappenings();
            break;
        case TVSHOW_PKMN_FAN_CLUB_OPINIONS:
            DoTVShowPokemonFanClubOpinions();
            break;
        case TVSHOW_UNKN_SHOWTYPE_04:
            nullsub_22();
            break;
        case TVSHOW_MASS_OUTBREAK:
            DoTVShowPokemonNewsMassOutbreak();
            break;
        case TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE:
            DoTVShowBravoTrainerPokemonProfile();
            break;
        case TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE:
            DoTVShowBravoTrainerBattleTowerProfile();
            break;
        case TVSHOW_POKEMON_TODAY_CAUGHT:
            DoTVShowPokemonTodaySuccessfulCapture();
            break;
        case TVSHOW_SMART_SHOPPER:
            DoTVShowTodaysSmartShopper();
            break;
        case TVSHOW_NAME_RATER_SHOW:
            DoTVShowTheNameRaterShow();
            break;
        case TVSHOW_POKEMON_TODAY_FAILED:
            DoTVShowPokemonTodayFailedCapture();
            break;
        case TVSHOW_FISHING_ADVICE:
            DoTVShowPokemonAngler();
            break;
        case TVSHOW_WORLD_OF_MASTERS:
            DoTVShowTheWorldOfMasters();
            break;
        }
    }
}

void TVShowConvertInternationalString(u8 *dest, u8 *src, u8 language)
{
    StringCopy(dest, src);
    if (language < LANGUAGE_ENGLISH)
        ConvertInternationalString(dest, LANGUAGE_JAPANESE);
}

void DoTVShowBravoTrainerPokemonProfile(void)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer = &gSaveBlock1.tvShows[gSpecialVar_0x8004].bravoTrainer;
    u8 state;

    gSpecialVar_Result = 0;
    state = sTVShowState;
    switch(state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        CopyContestCategoryToStringVar(1, bravoTrainer->contestCategory);
        sub_80BEF10(2, bravoTrainer->contestRank);
        if (!StringCompareWithoutExtCtrlCodes(gSpeciesNames[bravoTrainer->species], bravoTrainer->pokemonNickname))
            sTVShowState = 8;
        else
            sTVShowState = 1;
        break;
    case 1:
        StringCopy(gStringVar1, gSpeciesNames[bravoTrainer->species]);
        TVShowConvertInternationalString(gStringVar2, bravoTrainer->pokemonNickname, bravoTrainer->var1f);
        CopyContestCategoryToStringVar(2, bravoTrainer->contestCategory);
        sTVShowState = 2;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        if (bravoTrainer->contestResult == 0) // placed first
            sTVShowState = 3;
        else
            sTVShowState = 4;
        break;
    case 3:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        EasyChat_GetWordText(gStringVar2, bravoTrainer->var04[0]);
        sub_80BF088(2, bravoTrainer->contestResult + 1);
        sTVShowState = 5;
        break;
    case 4:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        EasyChat_GetWordText(gStringVar2, bravoTrainer->var04[0]);
        sub_80BF088(2, bravoTrainer->contestResult + 1);
        sTVShowState = 5;
        break;
    case 5:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        CopyContestCategoryToStringVar(1, bravoTrainer->contestCategory);
        EasyChat_GetWordText(gStringVar3, bravoTrainer->var04[1]);
        if (bravoTrainer->var14)
            sTVShowState = 6;
        else
            sTVShowState = 7;
        break;
    case 6:
        StringCopy(gStringVar1, gSpeciesNames[bravoTrainer->species]);
        StringCopy(gStringVar2, gMoveNames[bravoTrainer->var14]);
        EasyChat_GetWordText(gStringVar3, bravoTrainer->var04[1]);
        sTVShowState = 7;
        break;
    case 7:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainer->species]);
        TVShowDone();
        break;
    case 8:
        StringCopy(gStringVar1, gSpeciesNames[bravoTrainer->species]);
        sTVShowState = 2;
        break;
    }
    ShowFieldMessage(gTVBravoTrainerTextGroup[state]);
}

void DoTVShowBravoTrainerBattleTowerProfile(void)
{
    struct TVShowBravoTrainerBattleTowerSpotlight *bravoTrainerTower = &gSaveBlock1.tvShows[gSpecialVar_0x8004].bravoTrainerTower;
    u8 state;

    gSpecialVar_Result = 0;
    state = sTVShowState;
    switch(state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->trainerName, bravoTrainerTower->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainerTower->species]);
        if (bravoTrainerTower->var16 >= 7)
            sTVShowState = 1;
        else
            sTVShowState = 2;
        break;
    case 1:
        sub_80BF088(0, bravoTrainerTower->btLevel);
        sub_80BF088(1, bravoTrainerTower->var16);
        if (bravoTrainerTower->var1c == 1)
            sTVShowState = 3;
        else
            sTVShowState = 4;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->enemyTrainerName, bravoTrainerTower->language);
        sub_80BF088(1, bravoTrainerTower->var16 + 1);
        if (bravoTrainerTower->var1b == 0)
            sTVShowState = 5;
        else
            sTVShowState = 6;
        break;
    case 3:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->enemyTrainerName, bravoTrainerTower->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainerTower->defeatedSpecies]);
        if (bravoTrainerTower->var1b == 0)
            sTVShowState = 5;
        else
            sTVShowState = 6;
        break;
    case 4:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->enemyTrainerName, bravoTrainerTower->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainerTower->defeatedSpecies]);
        if (bravoTrainerTower->var1b == 0)
            sTVShowState = 5;
        else
            sTVShowState = 6;
        break;
    case 5:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->enemyTrainerName, bravoTrainerTower->language);
        sTVShowState = 11;
        break;
    case 6:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->enemyTrainerName, bravoTrainerTower->language);
        sTVShowState = 11;
        break;
    case 7:
        sTVShowState = 11;
        break;
    case 8:
    case 9:
    case 10:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->trainerName, bravoTrainerTower->language);
        sTVShowState = 11;
        break;
    case 11:
        EasyChat_GetWordText(gStringVar1, bravoTrainerTower->var18[0]);
        if (bravoTrainerTower->var1b == 0)
            sTVShowState = 12;
        else
            sTVShowState = 13;
        break;
    case 12:
    case 13:
        EasyChat_GetWordText(gStringVar1, bravoTrainerTower->var18[0]);
        TVShowConvertInternationalString(gStringVar2, bravoTrainerTower->trainerName, bravoTrainerTower->language);
        TVShowConvertInternationalString(gStringVar3, bravoTrainerTower->enemyTrainerName, bravoTrainerTower->language);
        sTVShowState = 14;
        break;
    case 14:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->trainerName, bravoTrainerTower->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainerTower->species]);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVBravoTrainerBattleTowerTextGroup[state]);
}

void DoTVShowTodaysSmartShopper(void)
{
    struct TVShowSmartShopper *smartShopper = &gSaveBlock1.tvShows[gSpecialVar_0x8004].smartshopperShow;
    u8 state;

    gSpecialVar_Result = 0;
    state = sTVShowState;
    switch(state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, smartShopper->playerName, smartShopper->language);
        GetMapSectionName(gStringVar2, smartShopper->shopLocation, 0);
        if (smartShopper->itemAmounts[0] >= 0xff)
            sTVShowState = 11;
        else
            sTVShowState = 1;
        break;
    case 1:
        TVShowConvertInternationalString(gStringVar1, smartShopper->playerName, smartShopper->language);
        StringCopy(gStringVar2, ItemId_GetName(smartShopper->itemIds[0]));
        sub_80BF088(2, smartShopper->itemAmounts[0]);
        sTVShowState += (Random() % 4) + 1;
        break;
    case 2:
    case 4:
    case 5:
        if (smartShopper->itemIds[1] != 0)
            sTVShowState = 6;
        else
            sTVShowState = 10;
        break;
    case 3:
        sub_80BF088(2, smartShopper->itemAmounts[0] + 1);
        if (smartShopper->itemIds[1] != 0)
            sTVShowState = 6;
        else
            sTVShowState = 10;
        break;
    case 6:
        StringCopy(gStringVar2, ItemId_GetName(smartShopper->itemIds[1]));
        sub_80BF088(2, smartShopper->itemAmounts[1]);
        if (smartShopper->itemIds[2] != 0)
            sTVShowState = 7;
        else if (smartShopper->priceReduced == 1)
            sTVShowState = 8;
        else
            sTVShowState = 9;
        break;
    case 7:
        StringCopy(gStringVar2, ItemId_GetName(smartShopper->itemIds[2]));
        sub_80BF088(2, smartShopper->itemAmounts[2]);
        if (smartShopper->priceReduced == 1)
            sTVShowState = 8;
        else
            sTVShowState = 9;
        break;
    case 8:
        if (smartShopper->itemAmounts[0] < 0xff)
            sTVShowState = 9;
        else
            sTVShowState = 12;
        break;
    case 9:
        sub_80BF154(1, smartShopper);
        TVShowDone();
        break;
    case 10:
        if (smartShopper->priceReduced == 1)
            sTVShowState = 8;
        else
            sTVShowState = 9;
        break;
    case 11:
        TVShowConvertInternationalString(gStringVar1, smartShopper->playerName, smartShopper->language);
        StringCopy(gStringVar2, ItemId_GetName(smartShopper->itemIds[0]));
        if (smartShopper->priceReduced == 1)
            sTVShowState = 8;
        else
            sTVShowState = 12;
        break;
    case 12:
        TVShowConvertInternationalString(gStringVar1, smartShopper->playerName, smartShopper->language);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVSmartShopperTextGroup[state]);
}

void DoTVShowTheNameRaterShow(void)
{
    struct TVShowNameRaterShow *nameRaterShow = &gSaveBlock1.tvShows[gSpecialVar_0x8004].nameRaterShow;
    u8 state;

    gSpecialVar_Result = 0;
    state = sTVShowState;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        StringCopy(gStringVar2, gSpeciesNames[nameRaterShow->species]);
        TVShowConvertInternationalString(gStringVar3, nameRaterShow->pokemonName, nameRaterShow->pokemonNameLanguage);
        sTVShowState = sub_80BF7E8(nameRaterShow) + 1;
        break;
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
        if (nameRaterShow->random == 0)
            sTVShowState = 9;
        else if (nameRaterShow->random == 1)
            sTVShowState = 10;
        else if (nameRaterShow->random == 2)
            sTVShowState = 11;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        if (nameRaterShow->random == 0)
            sTVShowState = 9;
        else if (nameRaterShow->random == 1)
            sTVShowState = 10;
        else if (nameRaterShow->random == 2)
            sTVShowState = 11;
        break;
    case 9:
    case 10:
    case 11:
        sub_80BF820(0, 1, 0, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(0, 0, 0, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, nameRaterShow->pokemonNameLanguage);
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->pokemonName, nameRaterShow->pokemonNameLanguage);
        sTVShowState = 12;
        break;
    case 13:
        sub_80BF820(0, 0, 3, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(0, 0, 2, 0, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, nameRaterShow->language);
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        sTVShowState = 14;
        break;
    case 14:
        sub_80BF820(0, 0, 3, 0, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->language);
        sub_80BF820(0, 0, 2, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, nameRaterShow->pokemonNameLanguage);
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        sTVShowState = 18;
        break;
    case 15:
        sub_80BF820(1, 0, 2, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar1, gStringVar2, nameRaterShow->pokemonNameLanguage);
        StringCopy(gStringVar2, gSpeciesNames[nameRaterShow->species]);
        sub_80BF820(2, 0, 3, 2, nameRaterShow->species, nameRaterShow);
        sTVShowState = 16;
        break;
    case 16:
        sub_80BF820(0, 0, 3, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(0, 0, 2, 2, nameRaterShow->species, nameRaterShow);
        sTVShowState = 17;
        break;
    case 17:
        sub_80BF820(1, 0, 2, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar1, gStringVar2, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(2, 0, 3, 2, nameRaterShow->var1C, nameRaterShow);
        StringCopy(gStringVar2, gSpeciesNames[nameRaterShow->var1C]);
        sTVShowState = 18;
        break;
    case 12:
        state = 18;
        sTVShowState = 18;
    case 18:
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->pokemonName, nameRaterShow->pokemonNameLanguage);
        TVShowConvertInternationalString(gStringVar2, nameRaterShow->trainerName, nameRaterShow->language);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVNameRaterTextGroup[state]);
}

void DoTVShowPokemonTodaySuccessfulCapture(void)
{
    struct TVShowPokemonToday *pokemonToday = &gSaveBlock1.tvShows[gSpecialVar_0x8004].pokemonToday;
    u8 state;

    gSpecialVar_Result = 0;
    state = sTVShowState;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar3, pokemonToday->nickname, pokemonToday->language2);
        if (pokemonToday->ball == ITEM_MASTER_BALL)
            sTVShowState = 5;
        else
            sTVShowState = 1;
        break;
    case 1:
        sTVShowState = 2;
        break;
    case 2:
        StringCopy(gStringVar2, ItemId_GetName(pokemonToday->ball));
        sub_80BF088(2, pokemonToday->var12);
        if (pokemonToday->var12 < 4)
            sTVShowState = 3;
        else
            sTVShowState = 4;
        break;
    case 3:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar3, pokemonToday->nickname, pokemonToday->language2);
        sTVShowState = 6;
        break;
    case 4:
        sTVShowState = 6;
        break;
    case 5:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        sTVShowState = 6;
        break;
    case 6:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar3, pokemonToday->nickname, pokemonToday->language2);
        sTVShowState += (Random() % 4) + 1;
        break;
    case 7:
    case 8:
        StringCopy(gStringVar1, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar2, pokemonToday->nickname, pokemonToday->language2);
        sub_80BF638(2, pokemonToday->species);
        sTVShowState = 11;
        break;
    case 9:
    case 10:
        StringCopy(gStringVar1, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar2, pokemonToday->nickname, pokemonToday->language2);
        sTVShowState = 11;
        break;
    case 11:
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVPokemonTodayTextGroup[state]);
}

void DoTVShowPokemonTodayFailedCapture(void)
{
    struct TVShowPokemonTodayFailed *pokemonTodayFailed = &gSaveBlock1.tvShows[gSpecialVar_0x8004].pokemonTodayFailed;
    u8 state;

    gSpecialVar_Result = 0;
    state = sTVShowState;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonTodayFailed->species]);
        sTVShowState = 1;
        break;
    case 1:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        GetMapSectionName(gStringVar2, pokemonTodayFailed->var12, 0);
        StringCopy(gStringVar3, gSpeciesNames[pokemonTodayFailed->species2]);
        if (pokemonTodayFailed->var11 == 1)
            sTVShowState = 3;
        else
            sTVShowState = 2;
        break;
    case 2:
    case 3:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        sub_80BF088(1, pokemonTodayFailed->var10);
        if ((Random() % 3) == 0)
            sTVShowState = 5;
        else
            sTVShowState = 4;
        break;
    case 4:
    case 5:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        sTVShowState = 6;
        break;
    case 6:
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVPokemonTodayFailedCaptureTextGroup[state]);
}

void DoTVShowPokemonFanClubLetter(void)
{
    struct TVShowFanClubLetter *fanclubLetter = &gSaveBlock1.tvShows[gSpecialVar_0x8004].fanclubLetter;
    u8 state;
    u16 rval;

    gSpecialVar_Result = 0;
    state = sTVShowState;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, fanclubLetter->playerName, fanclubLetter->language);
        StringCopy(gStringVar2, gSpeciesNames[fanclubLetter->species]);
        sTVShowState = 50;
        break;
    case 1:
        rval = (Random() % 4) + 1;
        if (rval == 1)
            sTVShowState = 2;
        else
            sTVShowState = rval + 2;
        break;
    case 2:
        sTVShowState = 51;
        break;
    case 3:
        sTVShowState += (Random() % 3) + 1;
        break;
    case 4:
    case 5:
    case 6:
        sub_80BF79C((TVShow *)fanclubLetter);
        sTVShowState = 7;
        break;
    case 7:
        rval = (Random() % 0x1f) + 0x46;
        sub_80BF088(2, rval);
        TVShowDone();
        break;
    case 50:
        ConvertEasyChatWordsToString(gStringVar4, fanclubLetter->pad04, 2, 2);
        ShowFieldMessage(gStringVar4);
        sTVShowState = 1;
        return;
    case 51:
        ConvertEasyChatWordsToString(gStringVar4, fanclubLetter->pad04, 2, 2);
        ShowFieldMessage(gStringVar4);
        sTVShowState = 3;
        return;
    }
    ShowFieldMessage(gTVFanClubTextGroup[state]);
}

void DoTVShowRecentHappenings(void)
{
    struct TVShowRecentHappenings *recentHappenings = &gSaveBlock1.tvShows[gSpecialVar_0x8004].recentHappenings;
    u8 state;

    gSpecialVar_Result = 0;
    state = sTVShowState;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, recentHappenings->playerName, recentHappenings->language);
        sub_80BF79C((TVShow *)recentHappenings);
        sTVShowState = 50;
        break;
    case 1:
        sTVShowState += 1 + (Random() % 3);
        break;
    case 2:
    case 3:
    case 4:
        sTVShowState = 5;
        break;
    case 5:
        TVShowDone();
        break;
    case 50:
        ConvertEasyChatWordsToString(gStringVar4, recentHappenings->var04, 2, 2);
        ShowFieldMessage(gStringVar4);
        sTVShowState = 1;
        return;
    }
    ShowFieldMessage(gTVRecentHappeningsTextGroup[state]);
}

void DoTVShowPokemonFanClubOpinions(void)
{
    struct TVShowFanclubOpinions *fanclubOpinions = &gSaveBlock1.tvShows[gSpecialVar_0x8004].fanclubOpinions;
    u8 state;

    gSpecialVar_Result = 0;
    state = sTVShowState;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, fanclubOpinions->playerName, fanclubOpinions->language);
        StringCopy(gStringVar2, gSpeciesNames[fanclubOpinions->var02]);
        TVShowConvertInternationalString(gStringVar3, fanclubOpinions->var10, fanclubOpinions->var0E);
        sTVShowState = fanclubOpinions->var04B + 1;
        break;
    case 1:
    case 2:
    case 3:
        TVShowConvertInternationalString(gStringVar1, fanclubOpinions->playerName, fanclubOpinions->language);
        StringCopy(gStringVar2, gSpeciesNames[fanclubOpinions->var02]);
        EasyChat_GetWordText(gStringVar3, fanclubOpinions->var1C[0]);
        sTVShowState = 4;
        break;
    case 4:
        TVShowConvertInternationalString(gStringVar1, fanclubOpinions->playerName, fanclubOpinions->language);
        EasyChat_GetWordText(gStringVar3, fanclubOpinions->var1C[1]);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVFanClubOpinionsTextGroup[state]);
}

void nullsub_22(void)
{
}

void DoTVShowPokemonNewsMassOutbreak(void)
{
    struct TVShowMassOutbreak *massOutbreak = &gSaveBlock1.tvShows[gSpecialVar_0x8004].massOutbreak;

    GetMapSectionName(gStringVar1, massOutbreak->locationMapNum, 0);
    StringCopy(gStringVar2, gSpeciesNames[massOutbreak->species]);
    TVShowDone();
    StartMassOutbreak();
    ShowFieldMessage(gTVPokemonOutbreakTextGroup[sTVShowState]);
}

void DoTVShowInSearchOfTrainers(void)
{
    u8 state;

    gSpecialVar_Result = 0;
    state = sTVShowState;
    switch (state)
    {
    case 0:
        GetMapSectionName(gStringVar1, gSaveBlock1.gabbyAndTyData.mapnum, 0);
        if (gSaveBlock1.gabbyAndTyData.battleNum > 1)
            sTVShowState = 1;
        else
            sTVShowState = 2;
        break;
    case 1:
        sTVShowState = 2;
        break;
    case 2:
        if (gSaveBlock1.gabbyAndTyData.valA_0 == 0)
            sTVShowState = 4;
        else if (gSaveBlock1.gabbyAndTyData.valA_3 != 0)
            sTVShowState = 5;
        else if (gSaveBlock1.gabbyAndTyData.valA_2 != 0)
            sTVShowState = 6;
        else if (gSaveBlock1.gabbyAndTyData.valA_1 != 0)
            sTVShowState = 7;
        else
            sTVShowState = 3;
        break;
    case 3:
        StringCopy(gStringVar1, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon1]);
        StringCopy(gStringVar2, gMoveNames[gSaveBlock1.gabbyAndTyData.lastMove]);
        StringCopy(gStringVar3, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon2]);
        sTVShowState = 8;
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        sTVShowState = 8;
        break;
    case 8:
        EasyChat_GetWordText(gStringVar1, gSaveBlock1.gabbyAndTyData.quote);
        StringCopy(gStringVar2, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon1]);
        StringCopy(gStringVar3, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon2]);
        gSpecialVar_Result = 1;
        sTVShowState = 0;;
        TakeTVShowInSearchOfTrainersOffTheAir();
        break;
    }
    ShowFieldMessage(gTVGabbyAndTyTextGroup[state]);
}

void DoTVShowPokemonAngler(void)
{
    struct TVShowPokemonAngler *pokemonAngler = &gSaveBlock1.tvShows[gSpecialVar_0x8004].pokemonAngler;
    u8 state;

    gSpecialVar_Result = 0;
    if (pokemonAngler->var02 < pokemonAngler->var03)
        sTVShowState = 0;
    else
        sTVShowState = 1;
    state = sTVShowState;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, pokemonAngler->playerName, pokemonAngler->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonAngler->var04]);
        sub_80BF088(2, pokemonAngler->var03);
        TVShowDone();
        break;
    case 1:
        TVShowConvertInternationalString(gStringVar1, pokemonAngler->playerName, pokemonAngler->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonAngler->var04]);
        sub_80BF088(2, pokemonAngler->var02);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVFishingGuruAdviceTextGroup[state]);
}

void DoTVShowTheWorldOfMasters(void)
{
    struct TVShowWorldOfMasters *worldOfMasters = &gSaveBlock1.tvShows[gSpecialVar_0x8004].worldOfMasters;
    u8 state;

    gSpecialVar_Result = 0;
    state = sTVShowState;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, worldOfMasters->playerName,
                                         worldOfMasters->language);
        sub_80BF088(1, worldOfMasters->var06);
        sub_80BF088(2, worldOfMasters->var02);
        sTVShowState = 1;
        break;
    case 1:
        StringCopy(gStringVar1, gSpeciesNames[worldOfMasters->var08]);
        sTVShowState = 2;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, worldOfMasters->playerName,
                                         worldOfMasters->language);
        GetMapSectionName(gStringVar2, worldOfMasters->var0a, 0);
        StringCopy(gStringVar3, gSpeciesNames[worldOfMasters->var04]);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVWorldOfMastersTextGroup[state]);
}

void TVShowDone(void)
{
    gSpecialVar_Result = 1;
    sTVShowState = 0;
    gSaveBlock1.tvShows[gSpecialVar_0x8004].common.active = 0;
}

void ResetTVShowState(void)
{
    sTVShowState = 0;
}
