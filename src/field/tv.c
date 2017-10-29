#include "global.h"
#include "tv.h"
#include "battle_tower.h"
#include "contest_painting.h"
#include "data2.h"
#include "easy_chat.h"
#include "event_data.h"
#include "fieldmap.h"
#include "field_message_box.h"
#include "field_camera.h"
#include "flags.h"
#include "rng.h"
#include "string_util.h"
#include "text.h"
#include "species.h"
#include "pokedex.h"
#include "naming_screen.h"
#include "overworld.h"
#include "map_constants.h"
#include "strings.h"
#include "battle.h"
#include "link.h"
#include "easy_chat.h"
#include "field_map_obj.h"
#include "field_specials.h"
#include "item.h"
#include "items.h"
#include "link.h"
#include "map_constants.h"
#include "naming_screen.h"
#include "pokedex.h"
#include "region_map.h"
#include "rng.h"
#include "overworld.h"
#include "rtc.h"
#include "script_menu.h"
#include "species.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"

struct UnkTvStruct
{
    s8 var0;
};

extern u8 gUnknown_0300430A[11];

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

extern struct TVSaleItem gUnknown_02038724[3];

struct UnkTvStruct gUnknown_03005D38;

extern u8 *gTVBravoTrainerTextGroup[];
extern u8 *gTVBravoTrainerBattleTowerTextGroup[];
extern u8 *gTVSmartShopperTextGroup[];
extern u8 *gTVNameRaterTextGroup[];
extern u8 *gTVPokemonTodayTextGroup[];
extern u8 *gTVPokemonTodayFailedCaptureTextGroup[];
extern u8 *gTVFanClubTextGroup[];
extern u8 *gTVRecentHappeningsTextGroup[];
extern u8 *gTVFanClubOpinionsTextGroup[];
extern u8 *gTVPokemonOutbreakTextGroup[];
extern u8 *gTVGabbyAndTyTextGroup[];
extern u8 *gTVFishingGuruAdviceTextGroup[];
extern u8 *gTVWorldOfMastersTextGroup[];
extern struct OutbreakPokemon gPokeOutbreakSpeciesList[5];



extern const u8 *gTVNewsTextGroup1[];
extern const u8 *gTVNewsTextGroup2[];
extern const u8 *gTVNewsTextGroup3[];

extern u16 gScriptLastTalked;

extern u8 gScriptContestCategory;
extern u8 gScriptContestRank;
extern u8 gUnknown_03004316[11];
extern u8 gBattleOutcome;

extern u16 gLastUsedItem;

extern u8 ewram[];
#define gUnknown_02007000 (*(ewramStruct_02007000 *)(ewram + 0x7000))

static EWRAM_DATA u16 gUnknown_020387E0 = 0;
static EWRAM_DATA u16 gUnknown_020387E2 = 0;
static EWRAM_DATA u8 gUnknown_020387E4 = 0;
static EWRAM_DATA ALIGNED(4) u8 gUnknown_020387E8 = 0; // why is this aligned to a 4-byte boundary?

static u8 gUnknown_03000720;
static u8 gUnknown_03000721;
static s8 gUnknown_03000722;

void ClearTVShowData(void)
{
    u8 showidx;
    u8 extradataidx;
    for (showidx=0; showidx<25; showidx++) {
        gSaveBlock1.tvShows[showidx].common.var00 = 0;
        gSaveBlock1.tvShows[showidx].common.var01 = 0;
        for (extradataidx=0; extradataidx<34; extradataidx++) {
            gSaveBlock1.tvShows[showidx].common.pad02[extradataidx] = 0;
        }
    }
    sub_80BEBF4();
}

bool8 sub_80BF1B4(u8);
void sub_80BF20C(void);
extern u16 sub_8135D3C(u8);
extern u8 gScriptContestCategory;
extern u8 gScriptContestRank;
extern u8 gUnknown_03004316[11];
extern u8 gBattleOutcome;

void sub_80BF334(void);
void sub_80BF3A4(void);
void sub_80BF3DC(void);
void sub_80BF46C(void);
void sub_80BF478(void);
void sub_80BF484(void);
void sub_80BF4BC(void);

void sub_80BE028(void);
void sub_80BE074(void);
void sub_80BE778(void);
void sub_80BEB20(void);

u8 sub_80BFB54(u8);

s8 sub_80BF74C(TVShow tvShow[]);

void sub_80BF55C(TVShow tvShow[], u8 showidx);
void sub_80BEA88(void);

void sub_80BE138(TVShow *show);
void sub_80BE160(TVShow *show);
extern u16 gLastUsedItem;

void sub_80BE5FC(void);
void sub_80BE65C(void);
void sub_80BE6A0(void);
void nullsub_21(void);
void sub_80BE188(void);
void sub_80BE320(void);

u8 special_0x44(void)
{
    u8 i;
    u8 j;

#ifndef NONMATCHING
    asm("":::"r5");
#endif

    for (i = 5; i < 24; i++)
    {
        if (gSaveBlock1.tvShows[i].common.var00 == 0)
            break;
    }
    i = Random() % i;
    j = i;
    do
    {
        if (sub_80BFB54(gSaveBlock1.tvShows[i].common.var00) != 4)
        {
            if (gSaveBlock1.tvShows[i].common.var01 == 1)
                return i;
        }
        else
        {
            struct TVShowMassOutbreak *massOutbreak = &gSaveBlock1.tvShows[i].massOutbreak;

            if (massOutbreak->var16 == 0 && massOutbreak->var01 == 1)
                return i;
        }

        if (i == 0)
            i = 23;
        else
            i--;
    } while (i != j);
    return 0xFF;
}

u8 sub_80BDA30(void);

u8 sub_80BD8B8(void)
{
    u8 retval = special_0x44();

    if (retval == 0xff)
        return 0xff;
    if (gSaveBlock1.outbreakPokemonSpecies != 0 && gSaveBlock1.tvShows[retval].common.var00 == TVSHOW_MASS_OUTBREAK)
        return sub_80BDA30();
    return retval;
}

u8 CheckForBigMovieOrEmergencyNewsOnTV(void);
void SetTVMetatilesOnMap(int, int, u16);
bool8 sub_80BECA0(void);
bool8 IsTVShowInSearchOfTrainersAiring(void);

void UpdateTVScreensOnMap(int width, int height)
{
    FlagSet(SYS_TV_WATCH);
    switch (CheckForBigMovieOrEmergencyNewsOnTV())
    {
    case 1:
        SetTVMetatilesOnMap(width, height, 0x3);
        break;
    case 2:
        break;
    default:
        if (gSaveBlock1.location.mapGroup == MAP_GROUP_LILYCOVE_CITY_COVE_LILY_MOTEL_1F
         && gSaveBlock1.location.mapNum == MAP_ID_LILYCOVE_CITY_COVE_LILY_MOTEL_1F)
        {
            SetTVMetatilesOnMap(width, height, 0x3);
        }
        else if (FlagGet(SYS_TV_START) && (sub_80BD8B8() != 0xff || sub_80BECA0() != 0xff || IsTVShowInSearchOfTrainersAiring()))
        {
            FlagClear(SYS_TV_WATCH);
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

u8 sub_80BDA0C(void)
{
    return gSaveBlock1.tvShows[gSpecialVar_0x8004].common.var00;
}

u8 sub_80BDA30(void)
{
    u8 showIdx;
    for (showIdx=0; showIdx<24; showIdx++)
    {
        if (gSaveBlock1.tvShows[showIdx].common.var00 != 0 && gSaveBlock1.tvShows[showIdx].common.var00 != TVSHOW_MASS_OUTBREAK && gSaveBlock1.tvShows[showIdx].common.var01 == 1)
            return showIdx;
    }
    return 0xff;
}

u8 special_0x4a(void)
{
    TVShow *tvShow;
    tvShow = &gSaveBlock1.tvShows[gSpecialVar_0x8004];
    if (tvShow->common.var00 == TVSHOW_MASS_OUTBREAK && gSaveBlock1.outbreakPokemonSpecies)
        return sub_80BDA30();
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
            if (gBattleResults.unk36[i] != 0)
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
        FlagSet(1);
}

void sub_80BDC14(void)
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

u8 sub_80BDD18(void)
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

void GabbyAndTySetScriptVarsToFieldObjectLocalIds(void)
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

void sub_80BDE48(void)
{
    switch (gSpecialVar_0x8005)
    {
    case TVSHOW_FAN_CLUB_LETTER:
        sub_80BE5FC();
        break;
    case TVSHOW_RECENT_HAPPENINGS:
        sub_80BE65C();
        break;
    case TVSHOW_PKMN_FAN_CLUB_OPINIONS:
        sub_80BE6A0();
        break;
    case TVSHOW_UNKN_SHOWTYPE_04:
        nullsub_21();
        break;
    case TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE:
        sub_80BE188();
        break;
    case TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE:
        sub_80BE320();
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

void sub_80BDEC8(void)
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
                    total += gBattleResults.unk36[i];
                if (total != 0 || gBattleResults.unk5_1 != 0)
                {
                    struct TVShowPokemonToday *pokemonToday;

                    total = 0;
                    pokemonToday = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].pokemonToday;
                    pokemonToday->var00 = TVSHOW_POKEMON_TODAY_CAUGHT;
                    pokemonToday->var01 = total;
                    if (gBattleResults.unk5_1 != 0)
                    {
                        total = 1;
                        item = ITEM_MASTER_BALL;
                    }
                    else
                    {
                        for (i = 0; i < 11; i++)
                            total += gBattleResults.unk36[i];
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
                    StripExtCtrlCodes(pokemonToday->nickname);
                }
            }
        }
    }
}

void sub_80BE028(void)
{
    struct TVShowWorldOfMasters *worldOfMasters = &gSaveBlock1.tvShows[24].worldOfMasters;

    if (worldOfMasters->var00 != TVSHOW_WORLD_OF_MASTERS)
    {
        sub_80BF55C(gSaveBlock1.tvShows, 24);
        worldOfMasters->var06 = GetGameStat(GAME_STAT_STEPS);
        worldOfMasters->var00 = TVSHOW_WORLD_OF_MASTERS;
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
        for (i = 0, total = 0; i < ARRAY_COUNT(gUnknown_03004316); i++)
            total += gUnknown_03004316[i];
        if (total > 0xff)
            total = 0xff;
        if (total > 2 && gBattleOutcome == 1)
        {
            gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows);
            if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_POKEMON_TODAY_FAILED) != 1)
            {
                struct TVShowPokemonTodayFailed *pokemonTodayFailed = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].pokemonTodayFailed;

                zero = 0;
                pokemonTodayFailed->var00 = TVSHOW_POKEMON_TODAY_FAILED;
                pokemonTodayFailed->var01 = zero;
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

void sub_80BE188(void)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainerSrc = &gSaveBlock1.tvShows[24].bravoTrainer;

    if (bravoTrainerSrc->var00 == TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE)
    {
        struct TVShowBravoTrainerPokemonProfiles *bravoTrainerNew = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainer;

        bravoTrainerNew->var00 = TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE;
        bravoTrainerNew->var01 = 1;
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
        StripExtCtrlCodes(bravoTrainerNew->pokemonNickname);
    }
}

void sub_80BE23C(u16 a0)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer = &gSaveBlock1.tvShows[24].bravoTrainer;

    sub_80BF484();
    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows);
    if (gUnknown_03005D38.var0 != -1)
    {
        sub_80BF55C(gSaveBlock1.tvShows, 24);
        bravoTrainer->var14 = a0;
        bravoTrainer->var00 = TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE;
    }
}

void sub_80BE284(u8 a0)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer = &gSaveBlock1.tvShows[24].bravoTrainer;

    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows);
    if (gUnknown_03005D38.var0 != -1)
    {
        bravoTrainer->contestResult = a0;
        bravoTrainer->contestCategory = gScriptContestCategory;
        bravoTrainer->contestRank = gScriptContestRank;
        bravoTrainer->species = GetMonData(&gPlayerParty[gUnknown_02038694], MON_DATA_SPECIES, NULL);
        GetMonData(&gPlayerParty[gUnknown_02038694], MON_DATA_NICKNAME, bravoTrainer->pokemonNickname);
    }
}

void sub_80BE320(void)
{
    struct TVShowBravoTrainerBattleTowerSpotlight *bravoTrainerTower = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainerTower;

    bravoTrainerTower->var00 = TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE;
    bravoTrainerTower->var01 = 1;
    StringCopy(bravoTrainerTower->trainerName, gSaveBlock2.playerName);
    StringCopy(bravoTrainerTower->pokemonName, gSaveBlock2.filler_A8.defeatedByTrainerName);
    bravoTrainerTower->species = gSaveBlock2.filler_A8.firstMonSpecies;
    bravoTrainerTower->defeatedSpecies = gSaveBlock2.filler_A8.defeatedBySpecies;
    bravoTrainerTower->var16 = sub_8135D3C(gSaveBlock2.filler_A8.lastStreakLevelType);
    bravoTrainerTower->var1c = gSaveBlock2.filler_A8.var_4AD;
    if (gSaveBlock2.filler_A8.lastStreakLevelType == 0)
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
            if (gUnknown_02038724[0].item_amount >= 20)
            {
                struct TVShowSmartShopper *smartShopper = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].smartshopperShow;

                smartShopper->var00 = TVSHOW_SMART_SHOPPER;
                smartShopper->var01 = rval;
                smartShopper->shopLocation = gMapHeader.regionMapSectionId;
                for (i=0; i<3; i++)
                {
                    smartShopper->itemIds[i] = gUnknown_02038724[i].item_id;
                    smartShopper->itemAmounts[i] = gUnknown_02038724[i].item_amount;
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
    sub_80BF478();
    if (gScriptResult == 1)
        return;

    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar1);
    if (StringLength(gSaveBlock2.playerName) > 1 && StringLength(gStringVar1) > 1)
    {
        struct TVShowNameRaterShow *nameRaterShow = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].nameRaterShow;

        nameRaterShow->var00 = TVSHOW_NAME_RATER_SHOW;
        nameRaterShow->var01 = 1;
        nameRaterShow->species = GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_SPECIES, NULL);
        nameRaterShow->random = Random() % 3;
        nameRaterShow->random2 = Random() % 2;
        nameRaterShow->var1C = sub_80BF674(nameRaterShow->species);
        StringCopy(nameRaterShow->trainerName, gSaveBlock2.playerName);
        GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, nameRaterShow->pokemonName);
        sub_80BE160((TVShow *)nameRaterShow);
        nameRaterShow->language = GAME_LANGUAGE;
        nameRaterShow->pokemonNameLanguage = sub_80BDEAC(nameRaterShow->pokemonName);
        StripExtCtrlCodes(nameRaterShow->pokemonName);
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

void sub_80BE5FC(void)
{
    struct TVShowFanClubLetter *fanclubLetter = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubLetter;

    fanclubLetter->var00 = TVSHOW_FAN_CLUB_LETTER;
    fanclubLetter->var01 = 1;
    StringCopy(fanclubLetter->playerName, gSaveBlock2.playerName);
    fanclubLetter->species = GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, NULL);
    sub_80BE160((TVShow *)fanclubLetter);
    fanclubLetter->language = GAME_LANGUAGE;
}

void sub_80BE65C(void)
{
    struct TVShowRecentHappenings *recentHappenings = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].recentHappenings;

    recentHappenings->var00 = TVSHOW_RECENT_HAPPENINGS;
    recentHappenings->var01 = 1;
    StringCopy(recentHappenings->playerName, gSaveBlock2.playerName);
    recentHappenings->var02 = 0;
    sub_80BE160((TVShow *)recentHappenings);
    recentHappenings->language = GAME_LANGUAGE;
}

void sub_80BE6A0(void)
{
    u8 monIndex;
    struct TVShowFanclubOpinions *fanclubOpinions = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubOpinions;

    fanclubOpinions->var00 = TVSHOW_PKMN_FAN_CLUB_OPINIONS;
    fanclubOpinions->var01 = 1;
    monIndex = GetLeadMonIndex();
    fanclubOpinions->var04A = GetMonData(&gPlayerParty[monIndex], MON_DATA_FRIENDSHIP, NULL) / 16;
    fanclubOpinions->var04B = gSpecialVar_0x8007;
    StringCopy(fanclubOpinions->playerName, gSaveBlock2.playerName);
    GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_NICKNAME, fanclubOpinions->var10);
    fanclubOpinions->var02 = GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, NULL);
    sub_80BE160((TVShow *)fanclubOpinions);
    fanclubOpinions->language = GAME_LANGUAGE;
    fanclubOpinions->var0E = sub_80BDEAC(fanclubOpinions->var10);
    StripExtCtrlCodes(fanclubOpinions->var10);
}

void nullsub_21(void)
{
}

void sub_80BE778(void)
{
    if (FlagGet(SYS_GAME_CLEAR))
    {
        u8 i;

        for (i = 0; i < 24; i++)
        {
            if (gSaveBlock1.tvShows[i].massOutbreak.var00 == TVSHOW_MASS_OUTBREAK)
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

            massOutbreak->var00 = TVSHOW_MASS_OUTBREAK;
            massOutbreak->var01 = 1;
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
            massOutbreak->var16 = 0x01;
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
            if (gSaveBlock1.tvShows[showidx].massOutbreak.var00 == TVSHOW_MASS_OUTBREAK
             && gSaveBlock1.tvShows[showidx].massOutbreak.var01 == 0x01)
            {
                struct TVShowMassOutbreak *massOutbreak = &gSaveBlock1.tvShows[showidx].massOutbreak;

                if (massOutbreak->var16 < arg0)
                    massOutbreak->var16 = 0;
                else
                    massOutbreak->var16 -= arg0;
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
        pokemonAngler->var00 = TVSHOW_FISHING_ADVICE;
        pokemonAngler->var01 = zero;
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

    if (worldOfMasters->var00 == TVSHOW_WORLD_OF_MASTERS)
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

            worldOfMastersDst->var00 = TVSHOW_WORLD_OF_MASTERS;
            worldOfMastersDst->var01 = 0;
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

    if (FlagGet(SYS_GAME_CLEAR) != 0)
    {
        gUnknown_03005D38.var0 = sub_80BEBC8(gSaveBlock1.unknown_2ABC);
        if (gUnknown_03005D38.var0 != -1 && sub_80BF77C(0x28f) != 1)
        {
            rval = (Random() % 3) + 1;
            if (sub_80BEE48(rval) != 1)
            {
                gSaveBlock1.unknown_2ABC[gUnknown_03005D38.var0].val0 = rval;
                gSaveBlock1.unknown_2ABC[gUnknown_03005D38.var0].val2 = 4;
                gSaveBlock1.unknown_2ABC[gUnknown_03005D38.var0].val1 = 1;
            }
        }
    }
}

int sub_80BEBC8(struct UnknownSaveStruct2ABC *arg0)
{
    s8 i;

    for (i = 0; i < 16; i++)
    {
        if (arg0[i].val0 == 0)
            return i;
    }
    return -1;
}

void sub_80BEBF4(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
        sub_80BEC10(i);
}

void sub_80BEC10(u8 arg0)
{
    gSaveBlock1.unknown_2ABC[arg0].val0 = 0;
    gSaveBlock1.unknown_2ABC[arg0].val1 = 0;
    gSaveBlock1.unknown_2ABC[arg0].val2 = 0;
}

void sub_80BEC40(void)
{
    u8 i, j;

    for (i = 0; i < 15; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 == 0)
        {
            for (j = i + 1; j < 16; j++)
            {
                if (gSaveBlock1.unknown_2ABC[j].val0 != 0)
                {
                    gSaveBlock1.unknown_2ABC[i] = gSaveBlock1.unknown_2ABC[j];
                    sub_80BEC10(j);
                    break;
                }
            }
        }
    }
}

u8 sub_80BECA0(void)
{
    u8 i;
    for (i = 0; i < 16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 != 0
         && gSaveBlock1.unknown_2ABC[i].val1 == 1
         && gSaveBlock1.unknown_2ABC[i].val2 < 3)
            return i;
    }
    return 0xFF;
}

void sub_80BECE8(void)
{
    u8 arg0;
    arg0 = sub_80BECA0();
    if (arg0 == 0xff)
    {
        gScriptResult = 0;
        return;
    }
    if (gSaveBlock1.unknown_2ABC[arg0].val2 == 0)
    {
        gSaveBlock1.unknown_2ABC[arg0].val1 = 2;
        if (gLocalTime.hours < 20)
            ShowFieldMessage(gTVNewsTextGroup2[gSaveBlock1.unknown_2ABC[arg0].val0]);
        else
            ShowFieldMessage(gTVNewsTextGroup3[gSaveBlock1.unknown_2ABC[arg0].val0]);
    }
    else
    {
        u16 value = gSaveBlock1.unknown_2ABC[arg0].val2;

        ConvertIntToDecimalStringN(gStringVar1, value, 0, 1);
        gSaveBlock1.unknown_2ABC[arg0].val1 = 0;
        ShowFieldMessage(gTVNewsTextGroup1[gSaveBlock1.unknown_2ABC[arg0].val0]);
    }
    gScriptResult = 1;
}

bool8 GetPriceReduction(u8 arg0)
{
    u8 i;

    if (arg0 == 0)
        return FALSE;
    for (i=0; i<16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 == arg0)
        {
            if (gSaveBlock1.unknown_2ABC[i].val1 == 2 && IsPriceDiscounted(arg0) != 0)
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
        if (gSaveBlock1.location.mapGroup == MAP_GROUP_SLATEPORT_CITY
         && gSaveBlock1.location.mapNum == MAP_ID_SLATEPORT_CITY
         && gScriptLastTalked == 0x1a)
            return TRUE;
        else
            return FALSE;
        break;
    case 3:
        if (gSaveBlock1.location.mapGroup == MAP_GROUP_LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP
         && gSaveBlock1.location.mapNum == MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP)
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
    for (i=0; i<16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 == arg0)
            return TRUE;
    }
    return FALSE;
}

void sub_80BEE84(u16 var0)
{
    u8 i;

    for (i=0; i<16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0)
        {
            if (gSaveBlock1.unknown_2ABC[i].val2 < var0)
            {
                sub_80BEC10(i);
            }
            else
            {
                if (!gSaveBlock1.unknown_2ABC[i].val1 && FlagGet(SYS_GAME_CLEAR) == 1)
                    gSaveBlock1.unknown_2ABC[i].val1 = 1;
                gSaveBlock1.unknown_2ABC[i].val2 -= var0;
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
        if (tvShows[i].common.var00 == showIdx)
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
            if (gUnknown_02038724[i].item_amount < gUnknown_02038724[j].item_amount)
            {
                tmpId = gUnknown_02038724[i].item_id;
                tmpAmount = gUnknown_02038724[i].item_amount;
                gUnknown_02038724[i].item_id = gUnknown_02038724[j].item_id;
                gUnknown_02038724[i].item_amount = gUnknown_02038724[j].item_amount;
                gUnknown_02038724[j].item_id = tmpId;
                gUnknown_02038724[j].item_amount = tmpAmount;
            }
        }
    }
}

void sub_80BF25C(u8 showType)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (gSaveBlock1.tvShows[i].common.var00 == showType)
        {
            if(gSaveBlock1.tvShows[i].common.var01 == 1)
            {
                gScriptResult = 1;
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

void sub_80BF2C4(void)
{
    gScriptResult = 0;
    switch (gSpecialVar_0x8005)
    {
    case TVSHOW_FAN_CLUB_LETTER:
        sub_80BF334();
        break;
    case TVSHOW_RECENT_HAPPENINGS:
        sub_80BF3A4();
        break;
    case TVSHOW_PKMN_FAN_CLUB_OPINIONS:
        sub_80BF3DC();
        break;
    case TVSHOW_UNKN_SHOWTYPE_04:
        sub_80BF46C();
        break;
    case TVSHOW_NAME_RATER_SHOW:
        sub_80BF478();
        break;
    case TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE:
        sub_80BF484();
        break;
    case TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE:
        sub_80BF4BC();
        break;
    }
}

void sub_80BF334(void)
{
    struct TVShowFanClubLetter *fanclubLetter;

    sub_80BF25C(TVSHOW_FAN_CLUB_LETTER);
    if (gScriptResult == 0)
    {
        StringCopy(gStringVar1, gSpeciesNames[GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, 0)]);
        fanclubLetter = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubLetter;
        sub_80EB6FC(fanclubLetter->pad04, 6);
    }
}

void sub_80BF3A4(void)
{
    struct TVShowRecentHappenings *recentHappenings;

    sub_80BF25C(TVSHOW_RECENT_HAPPENINGS);
    if (gScriptResult == 0)
    {
        recentHappenings = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].recentHappenings;
        sub_80EB6FC(recentHappenings->var04, 6);
    }
}

void sub_80BF3DC(void)
{
    struct TVShowFanclubOpinions *fanclubOpinions;

    sub_80BF25C(TVSHOW_PKMN_FAN_CLUB_OPINIONS);
    if (gScriptResult == 0)
    {
        StringCopy(gStringVar1, gSpeciesNames[GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, 0)]);
        GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_NICKNAME, gStringVar2);
        StringGetEnd10(gStringVar2);
        fanclubOpinions = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubOpinions;
        sub_80EB6FC(fanclubOpinions->var1C, 2);
    }
}

void sub_80BF46C(void)
{
    gScriptResult = 1;
}

void sub_80BF478(void)
{
    sub_80BF25C(TVSHOW_NAME_RATER_SHOW);
}

void sub_80BF484(void)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer;

    sub_80BF25C(TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE);
    if (gScriptResult == 0)
    {
        bravoTrainer = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainer;
        sub_80EB6FC(bravoTrainer->var04, 2);
    }
}

void sub_80BF4BC(void)
{
    struct TVShowBravoTrainerBattleTowerSpotlight *bravoTrainerTower;

    sub_80BF25C(TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE);
    if (gScriptResult == 0)
    {
        bravoTrainerTower = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainerTower;
        sub_80EB6FC(bravoTrainerTower->var18, 1); // wrong struct ident, fix later
    }
}

#if ENGLISH
u8 sub_80BF4F4(u8 arg0)
{
    u32 species;

    GetMonData(&gPlayerParty[arg0], MON_DATA_NICKNAME, &gStringVar1);
    species = GetMonData(&gPlayerParty[arg0], MON_DATA_SPECIES, NULL);
    if (StringCompareWithoutExtCtrlCodes(gSpeciesNames[species], gStringVar1) == FALSE)
        return FALSE;

    return TRUE;
}
#elif GERMAN
u8 sub_80BF4F4(u8 arg0)
{
    u8 langData[4];
    u32 species;
    u8 *tmp;

    GetMonData(&gPlayerParty[arg0], MON_DATA_NICKNAME, &gStringVar1);

    tmp = langData;
    tmp[0] = GetMonData(&gPlayerParty[arg0], MON_DATA_LANGUAGE, &langData);
    if (tmp[0] != GAME_LANGUAGE)
        return TRUE;

    species = GetMonData(&gPlayerParty[arg0], MON_DATA_SPECIES, NULL);
    if (StringCompareWithoutExtCtrlCodes(gSpeciesNames[species], gStringVar1))
        return TRUE;

    return FALSE;
}
#endif

u8 sub_80BF544(void)
{
    return sub_80BF4F4(GetLeadMonIndex());
}

void sub_80BF55C(TVShow tvShow[], u8 showidx)
{
    u8 idx;

    tvShow[showidx].common.var00 = 0;
    tvShow[showidx].common.var01 = 0;
    for (idx = 0; idx < 34; idx++)
        tvShow[showidx].common.pad02[idx] = 0;
}

void sub_80BF588(TVShow tvShow[])
{
    u8 showidx;
    u8 showidx2;

    for (showidx = 0; showidx < 4; showidx++)
    {
        if (tvShow[showidx].common.var00 == 0)
        {
            for (showidx2 = showidx + 1; showidx2 < 5; showidx2++)
            {
                if (tvShow[showidx2].common.var00 != 0)
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
        if (tvShow[showidx].common.var00 == 0)
        {
            for (showidx2 = showidx + 1; showidx2 < 24; showidx2++)
            {
                if (tvShow[showidx2].common.var00 != 0)
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
        gScriptResult = 1;
    else
        gScriptResult = 0;
}

s8 sub_80BF720(TVShow tvShow[])
{
    u8 idx;

    for (idx = 0; idx < 5; idx++)
    {
        if (tvShow[idx].common.var00 == 0)
            return idx;
    }
    return -1;
}

s8 sub_80BF74C(TVShow tvShow[])
{
    s8 idx;

    for (idx = 5; idx < 24; idx++)
    {
        if (tvShow[idx].common.var00 == 0)
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

bool8 sub_80BF974(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (gSaveBlock1.tvShows[i].common.var00 == gSpecialVar_0x8004)
            return TRUE;
    }
    return FALSE;
}

bool8 sub_80BF9B4(void)
{
    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_NICKNAME, &gStringVar1);
    if (!StringCompareWithoutExtCtrlCodes(gStringVar3, gStringVar1))
        return FALSE;
    sub_80BE478();
    return TRUE;
}

void c2_080CC144(void);

void sub_80BF9F8(void)
{
    u16 spec;
    u16 gender;
    u32 pval;

    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_NICKNAME, &gStringVar3);
    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_NICKNAME, &gStringVar2);
    spec = GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_SPECIES, 0);
    gender = GetMonGender(&(gPlayerParty[gSpecialVar_0x8004]));
    pval = GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_PERSONALITY, 0);
    DoNamingScreen(3, gStringVar2, spec, gender, pval, c2_080CC144);
}

void c2_080CC144(void)
{
    SetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_NICKNAME, gStringVar2);
    c2_exit_to_overworld_1_continue_scripts_restart_music();
}

void sub_80BFAE0(void)
{
    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_NICKNAME, &gStringVar1);
    StringGetEnd10(gStringVar1);
}

void sub_80BFB10(void)
{
    if (GetPlayerTrainerId() == GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), MON_DATA_OT_ID, 0))
        gScriptResult = 0;
    else
        gScriptResult = 1;
}

u8 sub_80BFB54(u8 arg0)
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
    if (gSaveBlock1.location.mapGroup != MAP_GROUP_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F)
        return 0;
    if (gSaveBlock2.playerGender == MALE)
    {
        if (gSaveBlock1.location.mapNum != MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F)
            return 0;
    }
    else
    {
        if (gSaveBlock1.location.mapNum != MAP_ID_LITTLEROOT_TOWN_MAYS_HOUSE_1F)
            return 0;
    }
    if (FlagGet(SYS_TV_LATI) == 1)
        return 1;
    if (FlagGet(SYS_TV_HOME) == 1)
        return 2;
    return 1;
}

void GetMomOrDadStringForTVMessage(void)
{
    if (gSaveBlock1.location.mapGroup == MAP_GROUP_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F)
    {
        if (gSaveBlock2.playerGender == MALE)
        {
            if (gSaveBlock1.location.mapNum == MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F)
            {
                StringCopy(gStringVar1, gOtherText_Mom);
                VarSet(VAR_0x4003, 1);
            }
        }
        else
        {
            if (gSaveBlock1.location.mapNum == MAP_ID_LITTLEROOT_TOWN_MAYS_HOUSE_1F)
            {
                StringCopy(gStringVar1, gOtherText_Mom);
                VarSet(VAR_0x4003, 1);
            }
        }
    }
    if (VarGet(VAR_0x4003) == 1)
    {
        StringCopy(gStringVar1, gOtherText_Mom);
    }
    else if (VarGet(VAR_0x4003) == 2)
    {
        StringCopy(gStringVar1, gOtherText_Dad);
    }
    else if (VarGet(VAR_0x4003) > 2)
    {
        if (VarGet(VAR_0x4003) % 2 == 0)
            StringCopy(gStringVar1, gOtherText_Mom);
        else
            StringCopy(gStringVar1, gOtherText_Dad);
    }
    else
    {
        if (Random() % 2 != 0)
        {
            StringCopy(gStringVar1, gOtherText_Mom);
            VarSet(VAR_0x4003, 1);
        }
        else
        {
            StringCopy(gStringVar1, gOtherText_Dad);
            VarSet(VAR_0x4003, 2);
        }
    }
}

void sub_80BFD20(void)
{
    VarSet(VAR_0x40BC, 0);
    RemoveFieldObjectByLocalIdAndMap(5, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
}

typedef union ewramStruct_02007000
{
    TVShow tvshows[4][25];
    struct UnknownSaveStruct2ABC unknown_2abc[4][16];
} ewramStruct_02007000;

void sub_80BFE24(TVShow arg0[25], TVShow arg1[25], TVShow arg2[25], TVShow arg3[25]);

void sub_80C04A0(void);
void sub_80C01D4(void);
void sub_80C0408(void);

void sub_80BFD44(u8 *arg0, u32 arg1, u8 arg2)
{
    u8 i;
    ewramStruct_02007000 *ewramTVShows;

    for (i = 0; i < 4; i++)
        memcpy(&gUnknown_02007000.tvshows[i], &arg0[i * arg1], 25 * sizeof(TVShow));
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
bool8 sub_80BFF68(TVShow * tv1[25], TVShow * tv2[25], u8 idx);
u8 sub_80C004C(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C00B4(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C0134(TVShow *tv1, TVShow *tv2, u8 idx);

void sub_80BFE24(TVShow arg0[25], TVShow arg1[25], TVShow arg2[25], TVShow arg3[25])
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

bool8 sub_80BFF68(TVShow * arg1[25], TVShow * arg2[25], u8 idx)
{
    u8 value;
    u8 switchval;
    TVShow *tv1;
    TVShow *tv2;

    tv1 = *arg1;
    tv2 = *arg2;
    value = FALSE;
    switchval = sub_80BFB54(tv2[gUnknown_03000722].common.var00);
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
    tv1->common.var01 = 1;
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
    tv1->common.var01 = 1;
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
    tv1->common.var01 = 1;
    tv1->common.var16[0] = 1;
    return TRUE;
}

s8 sub_80C019C(TVShow tvShows[])
{
    u8 i;
    for (i = 0; i < 24; i++)
    {
        if (tvShows[i].common.var01 == 0 && (u8)(tvShows[i].common.var00 - 1) < 60)
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
        switch (gSaveBlock1.tvShows[i].common.var00)
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
__attribute__((naked))
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
    gSaveBlock1.tvShows[showidx].common.var01 = 0;
}

void sub_80C03C8(u16 species, u8 showidx)
{
    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), 0) == 0)
        gSaveBlock1.tvShows[showidx].common.var01 = 0;
}

void sub_80C0408(void)
{
    u16 i;

    if (FlagGet(SYS_GAME_CLEAR) == TRUE)
        return;
    for (i = 0; i < 24; i++)
    {
        if (gSaveBlock1.tvShows[i].common.var00 == TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE)
            gSaveBlock1.tvShows[i].common.var01 = 0;
        else if (gSaveBlock1.tvShows[i].common.var00 == TVSHOW_MASS_OUTBREAK)
            gSaveBlock1.tvShows[i].common.var01 = 0;
    }
}

void sub_80C045C(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (sub_80BFB54(gSaveBlock1.tvShows[i].common.var00) == 2)
            gSaveBlock1.tvShows[i].common.var01 = 0;
    }
}

void sub_80C04A0(void)
{
    s8 showIdx;
    s8 count;
    count = 0;

    for (showIdx = 5; showIdx < 24; showIdx++)
    {
        if (gSaveBlock1.tvShows[showIdx].common.var00 == 0)
            count++;
    }
    for (showIdx = 0; showIdx < 5 - count; showIdx++)
        sub_80BF55C(gSaveBlock1.tvShows, showIdx+5);
}

void sub_80C05C4(struct UnknownSaveStruct2ABC[16], struct UnknownSaveStruct2ABC[16], struct UnknownSaveStruct2ABC[16], struct UnknownSaveStruct2ABC[16]);
void sub_80C0750(void);
void sub_80C0788(void);
s8 sub_80C0730(struct UnknownSaveStruct2ABC[16], u8);
void sub_80C06BC(struct UnknownSaveStruct2ABC *[16], struct UnknownSaveStruct2ABC *[16]);

void sub_80C0514(void *a0, u32 a1, u8 a2)
{
    ewramStruct_02007000 *struct02007000;
    u8 i;

    for (i = 0; i < 4; i++)
        memcpy(gUnknown_02007000.unknown_2abc[i], a0 + i * a1, 64);
    struct02007000 = &gUnknown_02007000;
    switch (a2)
    {
    case 0:
        sub_80C05C4(gSaveBlock1.unknown_2ABC, struct02007000->unknown_2abc[1], struct02007000->unknown_2abc[2], struct02007000->unknown_2abc[3]);
        break;
    case 1:
        sub_80C05C4(struct02007000->unknown_2abc[0], gSaveBlock1.unknown_2ABC, struct02007000->unknown_2abc[2], struct02007000->unknown_2abc[3]);
        break;
    case 2:
        sub_80C05C4(struct02007000->unknown_2abc[0], struct02007000->unknown_2abc[1], gSaveBlock1.unknown_2ABC, struct02007000->unknown_2abc[3]);
        break;
    case 3:
        sub_80C05C4(struct02007000->unknown_2abc[0], struct02007000->unknown_2abc[1], struct02007000->unknown_2abc[2], gSaveBlock1.unknown_2ABC);
        break;
    }
    sub_80C0750();
    sub_80C0788();
}

void sub_80C05C4(struct UnknownSaveStruct2ABC a0[16], struct UnknownSaveStruct2ABC a1[16], struct UnknownSaveStruct2ABC a2[16], struct UnknownSaveStruct2ABC a3[16])
{
    u8 i;
    u8 j;
    u8 k;
    struct UnknownSaveStruct2ABC ** arglist[4];

    arglist[0] = &a0;
    arglist[1] = &a1;
    arglist[2] = &a2;
    arglist[3] = &a3;
    gUnknown_03000721 = GetLinkPlayerCount();
    for (i = 0; i < 16; i++)
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

void sub_80C06BC(struct UnknownSaveStruct2ABC *arg0[16], struct UnknownSaveStruct2ABC *arg1[16])
{
    struct UnknownSaveStruct2ABC *str0;
    struct UnknownSaveStruct2ABC *str1;

    str0 = arg0[0];
    str1 = arg1[0];
    str1 += gUnknown_03000722;
    sub_80C06E8(str0, str1, gUnknown_03005D38.var0);
}

bool8 sub_80C06E8(struct UnknownSaveStruct2ABC *arg0, struct UnknownSaveStruct2ABC *arg1, s8 arg2)
{
    u8 i;

    if (arg1->val0 == 0)
        return FALSE;
    for (i = 0; i < 16; i++)
    {
        if (arg0[i].val0 == arg1->val0)
            return FALSE;
    }
    arg0[arg2].val0 = arg1->val0;
    arg0[arg2].val1 = 1;
    arg0[arg2].val2 = arg1->val2;
    return TRUE;
}

s8 sub_80C0730(struct UnknownSaveStruct2ABC *arg0, u8 arg1)
{
    if (arg0[arg1].val0 == 0)
        return -1;
    return arg1;
}

void sub_80C0750(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 > 3)
            sub_80BEC10(i);
    }
    sub_80BEC40();
}

void sub_80C0788(void)
{
    u8 i;

    if (FlagGet(SYS_GAME_CLEAR) != 1)
    {
        for (i = 0; i < 16; i++)
            gSaveBlock1.unknown_2ABC[i].val1 = 0;
    }
}

void DoTVShow(void)
{
    if (gSaveBlock1.tvShows[gSpecialVar_0x8004].common.var01 != 0)
    {
        switch (gSaveBlock1.tvShows[gSpecialVar_0x8004].common.var00)
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

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch(state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        CopyContestCategoryToStringVar(1, bravoTrainer->contestCategory);
        sub_80BEF10(2, bravoTrainer->contestRank);
        if (!StringCompareWithoutExtCtrlCodes(gSpeciesNames[bravoTrainer->species], bravoTrainer->pokemonNickname))
            gUnknown_020387E8 = 8;
        else
            gUnknown_020387E8 = 1;
        break;
    case 1:
        StringCopy(gStringVar1, gSpeciesNames[bravoTrainer->species]);
        TVShowConvertInternationalString(gStringVar2, bravoTrainer->pokemonNickname, bravoTrainer->var1f);
        CopyContestCategoryToStringVar(2, bravoTrainer->contestCategory);
        gUnknown_020387E8 = 2;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        if (bravoTrainer->contestResult == 0) // placed first
            gUnknown_020387E8 = 3;
        else
            gUnknown_020387E8 = 4;
        break;
    case 3:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        EasyChat_GetWordText(gStringVar2, bravoTrainer->var04[0]);
        sub_80BF088(2, bravoTrainer->contestResult + 1);
        gUnknown_020387E8 = 5;
        break;
    case 4:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        EasyChat_GetWordText(gStringVar2, bravoTrainer->var04[0]);
        sub_80BF088(2, bravoTrainer->contestResult + 1);
        gUnknown_020387E8 = 5;
        break;
    case 5:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        CopyContestCategoryToStringVar(1, bravoTrainer->contestCategory);
        EasyChat_GetWordText(gStringVar3, bravoTrainer->var04[1]);
        if (bravoTrainer->var14)
            gUnknown_020387E8 = 6;
        else
            gUnknown_020387E8 = 7;
        break;
    case 6:
        StringCopy(gStringVar1, gSpeciesNames[bravoTrainer->species]);
        StringCopy(gStringVar2, gMoveNames[bravoTrainer->var14]);
        EasyChat_GetWordText(gStringVar3, bravoTrainer->var04[1]);
        gUnknown_020387E8 = 7;
        break;
    case 7:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainer->species]);
        TVShowDone();
        break;
    case 8:
        StringCopy(gStringVar1, gSpeciesNames[bravoTrainer->species]);
        gUnknown_020387E8 = 2;
        break;
    }
    ShowFieldMessage(gTVBravoTrainerTextGroup[state]);
}

void DoTVShowBravoTrainerBattleTowerProfile(void)
{
    struct TVShowBravoTrainerBattleTowerSpotlight *bravoTrainerTower = &gSaveBlock1.tvShows[gSpecialVar_0x8004].bravoTrainerTower;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch(state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->trainerName, bravoTrainerTower->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainerTower->species]);
        if (bravoTrainerTower->var16 >= 7)
            gUnknown_020387E8 = 1;
        else
            gUnknown_020387E8 = 2;
        break;
    case 1:
        sub_80BF088(0, bravoTrainerTower->btLevel);
        sub_80BF088(1, bravoTrainerTower->var16);
        if (bravoTrainerTower->var1c == 1)
            gUnknown_020387E8 = 3;
        else
            gUnknown_020387E8 = 4;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        sub_80BF088(1, bravoTrainerTower->var16 + 1);
        if (bravoTrainerTower->var1b == 0)
            gUnknown_020387E8 = 5;
        else
            gUnknown_020387E8 = 6;
        break;
    case 3:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainerTower->defeatedSpecies]);
        if (bravoTrainerTower->var1b == 0)
            gUnknown_020387E8 = 5;
        else
            gUnknown_020387E8 = 6;
        break;
    case 4:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainerTower->defeatedSpecies]);
        if (bravoTrainerTower->var1b == 0)
            gUnknown_020387E8 = 5;
        else
            gUnknown_020387E8 = 6;
        break;
    case 5:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        gUnknown_020387E8 = 11;
        break;
    case 6:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        gUnknown_020387E8 = 11;
        break;
    case 7:
        gUnknown_020387E8 = 11;
        break;
    case 8:
    case 9:
    case 10:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->trainerName, bravoTrainerTower->language);
        gUnknown_020387E8 = 11;
        break;
    case 11:
        EasyChat_GetWordText(gStringVar1, bravoTrainerTower->var18[0]);
        if (bravoTrainerTower->var1b == 0)
            gUnknown_020387E8 = 12;
        else
            gUnknown_020387E8 = 13;
        break;
    case 12:
    case 13:
        EasyChat_GetWordText(gStringVar1, bravoTrainerTower->var18[0]);
        TVShowConvertInternationalString(gStringVar2, bravoTrainerTower->trainerName, bravoTrainerTower->language);
        TVShowConvertInternationalString(gStringVar3, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        gUnknown_020387E8 = 14;
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

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch(state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, smartShopper->playerName, smartShopper->language);
        GetMapSectionName(gStringVar2, smartShopper->shopLocation, 0);
        if (smartShopper->itemAmounts[0] >= 0xff)
            gUnknown_020387E8 = 11;
        else
            gUnknown_020387E8 = 1;
        break;
    case 1:
        TVShowConvertInternationalString(gStringVar1, smartShopper->playerName, smartShopper->language);
        StringCopy(gStringVar2, ItemId_GetItem(smartShopper->itemIds[0])->name);
        sub_80BF088(2, smartShopper->itemAmounts[0]);
        gUnknown_020387E8 += (Random() % 4) + 1;
        break;
    case 2:
    case 4:
    case 5:
        if (smartShopper->itemIds[1] != 0)
            gUnknown_020387E8 = 6;
        else
            gUnknown_020387E8 = 10;
        break;
    case 3:
        sub_80BF088(2, smartShopper->itemAmounts[0] + 1);
        if (smartShopper->itemIds[1] != 0)
            gUnknown_020387E8 = 6;
        else
            gUnknown_020387E8 = 10;
        break;
    case 6:
        StringCopy(gStringVar2, ItemId_GetItem(smartShopper->itemIds[1])->name);
        sub_80BF088(2, smartShopper->itemAmounts[1]);
        if (smartShopper->itemIds[2] != 0)
            gUnknown_020387E8 = 7;
        else if (smartShopper->priceReduced == 1)
            gUnknown_020387E8 = 8;
        else
            gUnknown_020387E8 = 9;
        break;
    case 7:
        StringCopy(gStringVar2, ItemId_GetItem(smartShopper->itemIds[2])->name);
        sub_80BF088(2, smartShopper->itemAmounts[2]);
        if (smartShopper->priceReduced == 1)
            gUnknown_020387E8 = 8;
        else
            gUnknown_020387E8 = 9;
        break;
    case 8:
        if (smartShopper->itemAmounts[0] < 0xff)
            gUnknown_020387E8 = 9;
        else
            gUnknown_020387E8 = 12;
        break;
    case 9:
        sub_80BF154(1, smartShopper);
        TVShowDone();
        break;
    case 10:
        if (smartShopper->priceReduced == 1)
            gUnknown_020387E8 = 8;
        else
            gUnknown_020387E8 = 9;
        break;
    case 11:
        TVShowConvertInternationalString(gStringVar1, smartShopper->playerName, smartShopper->language);
        StringCopy(gStringVar2, ItemId_GetItem(smartShopper->itemIds[0])->name);
        if (smartShopper->priceReduced == 1)
            gUnknown_020387E8 = 8;
        else
            gUnknown_020387E8 = 12;
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

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        StringCopy(gStringVar2, gSpeciesNames[nameRaterShow->species]);
        TVShowConvertInternationalString(gStringVar3, nameRaterShow->pokemonName, nameRaterShow->pokemonNameLanguage);
        gUnknown_020387E8 = sub_80BF7E8(nameRaterShow) + 1;
        break;
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
        if (nameRaterShow->random == 0)
            gUnknown_020387E8 = 9;
        else if (nameRaterShow->random == 1)
            gUnknown_020387E8 = 10;
        else if (nameRaterShow->random == 2)
            gUnknown_020387E8 = 11;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        if (nameRaterShow->random == 0)
            gUnknown_020387E8 = 9;
        else if (nameRaterShow->random == 1)
            gUnknown_020387E8 = 10;
        else if (nameRaterShow->random == 2)
            gUnknown_020387E8 = 11;
        break;
    case 9:
    case 10:
    case 11:
        sub_80BF820(0, 1, 0, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(0, 0, 0, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, nameRaterShow->pokemonNameLanguage);
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->pokemonName, nameRaterShow->pokemonNameLanguage);
        gUnknown_020387E8 = 12;
        break;
    case 13:
        sub_80BF820(0, 0, 3, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(0, 0, 2, 0, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, nameRaterShow->language);
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        gUnknown_020387E8 = 14;
        break;
    case 14:
        sub_80BF820(0, 0, 3, 0, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->language);
        sub_80BF820(0, 0, 2, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, nameRaterShow->pokemonNameLanguage);
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        gUnknown_020387E8 = 18;
        break;
    case 15:
        sub_80BF820(1, 0, 2, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar1, gStringVar2, nameRaterShow->pokemonNameLanguage);
        StringCopy(gStringVar2, gSpeciesNames[nameRaterShow->species]);
        sub_80BF820(2, 0, 3, 2, nameRaterShow->species, nameRaterShow);
        gUnknown_020387E8 = 16;
        break;
    case 16:
        sub_80BF820(0, 0, 3, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(0, 0, 2, 2, nameRaterShow->species, nameRaterShow);
        gUnknown_020387E8 = 17;
        break;
    case 17:
        sub_80BF820(1, 0, 2, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar1, gStringVar2, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(2, 0, 3, 2, nameRaterShow->var1C, nameRaterShow);
        StringCopy(gStringVar2, gSpeciesNames[nameRaterShow->var1C]);
        gUnknown_020387E8 = 18;
        break;
    case 12:
        state = 18;
        gUnknown_020387E8 = 18;
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

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar3, pokemonToday->nickname, pokemonToday->language2);
        if (pokemonToday->ball == ITEM_MASTER_BALL)
            gUnknown_020387E8 = 5;
        else
            gUnknown_020387E8 = 1;
        break;
    case 1:
        gUnknown_020387E8 = 2;
        break;
    case 2:
        StringCopy(gStringVar2, ItemId_GetItem(pokemonToday->ball)->name);
        sub_80BF088(2, pokemonToday->var12);
        if (pokemonToday->var12 < 4)
            gUnknown_020387E8 = 3;
        else
            gUnknown_020387E8 = 4;
        break;
    case 3:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar3, pokemonToday->nickname, pokemonToday->language2);
        gUnknown_020387E8 = 6;
        break;
    case 4:
        gUnknown_020387E8 = 6;
        break;
    case 5:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        gUnknown_020387E8 = 6;
        break;
    case 6:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar3, pokemonToday->nickname, pokemonToday->language2);
        gUnknown_020387E8 += (Random() % 4) + 1;
        break;
    case 7:
    case 8:
        StringCopy(gStringVar1, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar2, pokemonToday->nickname, pokemonToday->language2);
        sub_80BF638(2, pokemonToday->species);
        gUnknown_020387E8 = 11;
        break;
    case 9:
    case 10:
        StringCopy(gStringVar1, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar2, pokemonToday->nickname, pokemonToday->language2);
        gUnknown_020387E8 = 11;
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

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonTodayFailed->species]);
        gUnknown_020387E8 = 1;
        break;
    case 1:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        GetMapSectionName(gStringVar2, pokemonTodayFailed->var12, 0);
        StringCopy(gStringVar3, gSpeciesNames[pokemonTodayFailed->species2]);
        if (pokemonTodayFailed->var11 == 1)
            gUnknown_020387E8 = 3;
        else
            gUnknown_020387E8 = 2;
        break;
    case 2:
    case 3:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        sub_80BF088(1, pokemonTodayFailed->var10);
        if ((Random() % 3) == 0)
            gUnknown_020387E8 = 5;
        else
            gUnknown_020387E8 = 4;
        break;
    case 4:
    case 5:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        gUnknown_020387E8 = 6;
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

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, fanclubLetter->playerName, fanclubLetter->language);
        StringCopy(gStringVar2, gSpeciesNames[fanclubLetter->species]);
        gUnknown_020387E8 = 50;
        break;
    case 1:
        rval = (Random() % 4) + 1;
        if (rval == 1)
            gUnknown_020387E8 = 2;
        else
            gUnknown_020387E8 = rval + 2;
        break;
    case 2:
        gUnknown_020387E8 = 51;
        break;
    case 3:
        gUnknown_020387E8 += (Random() % 3) + 1;
        break;
    case 4:
    case 5:
    case 6:
        sub_80BF79C((TVShow *)fanclubLetter);
        gUnknown_020387E8 = 7;
        break;
    case 7:
        rval = (Random() % 0x1f) + 0x46;
        sub_80BF088(2, rval);
        TVShowDone();
        break;
    case 50:
        ConvertEasyChatWordsToString(gStringVar4, fanclubLetter->pad04, 2, 2);
        ShowFieldMessage(gStringVar4);
        gUnknown_020387E8 = 1;
        return;
    case 51:
        ConvertEasyChatWordsToString(gStringVar4, fanclubLetter->pad04, 2, 2);
        ShowFieldMessage(gStringVar4);
        gUnknown_020387E8 = 3;
        return;
    }
    ShowFieldMessage(gTVFanClubTextGroup[state]);
}

void DoTVShowRecentHappenings(void)
{
    struct TVShowRecentHappenings *recentHappenings = &gSaveBlock1.tvShows[gSpecialVar_0x8004].recentHappenings;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, recentHappenings->playerName, recentHappenings->language);
        sub_80BF79C((TVShow *)recentHappenings);
        gUnknown_020387E8 = 50;
        break;
    case 1:
        gUnknown_020387E8 += 1 + (Random() % 3);
        break;
    case 2:
    case 3:
    case 4:
        gUnknown_020387E8 = 5;
        break;
    case 5:
        TVShowDone();
        break;
    case 50:
        ConvertEasyChatWordsToString(gStringVar4, recentHappenings->var04, 2, 2);
        ShowFieldMessage(gStringVar4);
        gUnknown_020387E8 = 1;
        return;
    }
    ShowFieldMessage(gTVRecentHappeningsTextGroup[state]);
}

void DoTVShowPokemonFanClubOpinions(void)
{
    struct TVShowFanclubOpinions *fanclubOpinions = &gSaveBlock1.tvShows[gSpecialVar_0x8004].fanclubOpinions;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, fanclubOpinions->playerName, fanclubOpinions->language);
        StringCopy(gStringVar2, gSpeciesNames[fanclubOpinions->var02]);
        TVShowConvertInternationalString(gStringVar3, fanclubOpinions->var10, fanclubOpinions->var0E);
        gUnknown_020387E8 = fanclubOpinions->var04B + 1;
        break;
    case 1:
    case 2:
    case 3:
        TVShowConvertInternationalString(gStringVar1, fanclubOpinions->playerName, fanclubOpinions->language);
        StringCopy(gStringVar2, gSpeciesNames[fanclubOpinions->var02]);
        EasyChat_GetWordText(gStringVar3, fanclubOpinions->var1C[0]);
        gUnknown_020387E8 = 4;
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
    ShowFieldMessage(gTVPokemonOutbreakTextGroup[gUnknown_020387E8]);
}

void DoTVShowInSearchOfTrainers(void)
{
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        GetMapSectionName(gStringVar1, gSaveBlock1.gabbyAndTyData.mapnum, 0);
        if (gSaveBlock1.gabbyAndTyData.battleNum > 1)
            gUnknown_020387E8 = 1;
        else
            gUnknown_020387E8 = 2;
        break;
    case 1:
        gUnknown_020387E8 = 2;
        break;
    case 2:
        if (gSaveBlock1.gabbyAndTyData.valA_0 == 0)
            gUnknown_020387E8 = 4;
        else if (gSaveBlock1.gabbyAndTyData.valA_3 != 0)
            gUnknown_020387E8 = 5;
        else if (gSaveBlock1.gabbyAndTyData.valA_2 != 0)
            gUnknown_020387E8 = 6;
        else if (gSaveBlock1.gabbyAndTyData.valA_1 != 0)
            gUnknown_020387E8 = 7;
        else
            gUnknown_020387E8 = 3;
        break;
    case 3:
        StringCopy(gStringVar1, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon1]);
        StringCopy(gStringVar2, gMoveNames[gSaveBlock1.gabbyAndTyData.lastMove]);
        StringCopy(gStringVar3, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon2]);
        gUnknown_020387E8 = 8;
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        gUnknown_020387E8 = 8;
        break;
    case 8:
        EasyChat_GetWordText(gStringVar1, gSaveBlock1.gabbyAndTyData.quote);
        StringCopy(gStringVar2, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon1]);
        StringCopy(gStringVar3, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon2]);
        gScriptResult = 1;
        gUnknown_020387E8 = 0;;
        TakeTVShowInSearchOfTrainersOffTheAir();
        break;
    }
    ShowFieldMessage(gTVGabbyAndTyTextGroup[state]);
}

void DoTVShowPokemonAngler(void)
{
    struct TVShowPokemonAngler *pokemonAngler = &gSaveBlock1.tvShows[gSpecialVar_0x8004].pokemonAngler;
    u8 state;

    gScriptResult = 0;
    if (pokemonAngler->var02 < pokemonAngler->var03)
        gUnknown_020387E8 = 0;
    else
        gUnknown_020387E8 = 1;
    state = gUnknown_020387E8;
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

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, worldOfMasters->playerName,
                                         worldOfMasters->language);
        sub_80BF088(1, worldOfMasters->var06);
        sub_80BF088(2, worldOfMasters->var02);
        gUnknown_020387E8 = 1;
        break;
    case 1:
        StringCopy(gStringVar1, gSpeciesNames[worldOfMasters->var08]);
        gUnknown_020387E8 = 2;
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
    gScriptResult = 1;
    gUnknown_020387E8 = 0;
    gSaveBlock1.tvShows[gSpecialVar_0x8004].common.var01 = 0;
}

void sub_80C2014(void)
{
    gUnknown_020387E8 = 0;
}
