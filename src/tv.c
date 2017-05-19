#include "global.h"
#include "asm.h"
#include "tv.h"
#include "event_data.h"
#include "field_message_box.h"
#include "flags.h"
#include "rng.h"
#include "string_util.h"
#include "text.h"
#include "species.h"
#include "pokedex.h"
#include "naming_screen.h"
#include "rom4.h"
#include "map_constants.h"
#include "strings.h"
#include "link.h"
#include "easy_chat.h"
#include "item.h"

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

extern u8 *gUnknown_083D1464[3];

struct TVSaleItem {
    u16 item_id;
    u16 item_amount;
};
extern struct TVSaleItem gUnknown_02038724[3];

extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;
extern u8 gSpecialVar_0x8007;
extern u16 gScriptResult;
extern u8 gUnknown_020387E8;

extern struct UnkTvStruct gUnknown_03005D38;

extern u8 gSpeciesNames[][11];
extern u8 *gTVPokemonOutbreakTextGroup[];
extern struct OutbreakPokemon gPokeOutbreakSpeciesList[5];

extern void sub_80BEBF4(void);

extern u16 gUnknown_020387E0;
extern u16 gUnknown_020387E2;

u32 GetPlayerTrainerId(void);

void ClearTVShowData(void)
{
    u8 showidx;
    u8 extradataidx;
    for (showidx=0; showidx<25; showidx++) {
        gSaveBlock1.tvShows.shows[showidx].common.var00 = 0;
        gSaveBlock1.tvShows.shows[showidx].common.var01 = 0;
        for (extradataidx=0; extradataidx<34; extradataidx++) {
            gSaveBlock1.tvShows.shows[showidx].common.pad02[extradataidx] = 0;
        }
    }
    sub_80BEBF4();
}

extern void sub_80BE138(TVShow *);

asm(".section .text_a");

void sub_80BE478(void)
{
    u16 playerNameLength;
    u16 pokemonNicknameLength;
    TVShow *tvShow;

    sub_80BF478();

    if (gScriptResult == 1)
    {
        return;
    }

    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar1);

    playerNameLength = StringLength(gSaveBlock2.playerName);
    if (playerNameLength <= 1)
    {
        return;
    }

    pokemonNicknameLength = StringLength(gStringVar1);
    if (pokemonNicknameLength <= 1)
    {
        return;
    }

    tvShow = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];

    tvShow->nameRaterShow.var00 = TVSHOW_NAME_RATER_SHOW;
    tvShow->nameRaterShow.var01 = 1;

    tvShow->nameRaterShow.species = GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_SPECIES, NULL);
    tvShow->nameRaterShow.random = Random() % 3;
    tvShow->nameRaterShow.random2 = Random() % 2;

    tvShow->nameRaterShow.var1C = sub_80BF674(tvShow->nameRaterShow.species);

    StringCopy(tvShow->nameRaterShow.trainerName, gSaveBlock2.playerName);

    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, tvShow->nameRaterShow.pokemonName);

    sub_80BE160(tvShow);

    tvShow->nameRaterShow.language = GAME_LANGUAGE;
    tvShow->nameRaterShow.var1F = sub_80BDEAC(tvShow->nameRaterShow.pokemonName);

    StripExtCtrlCodes(tvShow->nameRaterShow.pokemonName);
}

void StartMassOutbreak(void)
{
    TVShow *tvShow;

    tvShow = &gSaveBlock1.tvShows.shows[gSpecialVar_0x8004];

    gSaveBlock1.outbreakPokemonSpecies = tvShow->massOutbreak.species;
    gSaveBlock1.outbreakLocationMapNum = tvShow->massOutbreak.locationMapNum;
    gSaveBlock1.outbreakLocationMapGroup = tvShow->massOutbreak.locationMapGroup;
    gSaveBlock1.outbreakPokemonLevel = tvShow->massOutbreak.level;
    gSaveBlock1.outbreakUnk1 = tvShow->massOutbreak.var02;
    gSaveBlock1.outbreakUnk2 = tvShow->massOutbreak.var0E;
    gSaveBlock1.outbreakPokemonMoves[0] = tvShow->massOutbreak.moves[0];
    gSaveBlock1.outbreakPokemonMoves[1] = tvShow->massOutbreak.moves[1];
    gSaveBlock1.outbreakPokemonMoves[2] = tvShow->massOutbreak.moves[2];
    gSaveBlock1.outbreakPokemonMoves[3] = tvShow->massOutbreak.moves[3];
    gSaveBlock1.outbreakUnk4 = tvShow->massOutbreak.var03;
    gSaveBlock1.outbreakPokemonProbability = tvShow->massOutbreak.probability;
    gSaveBlock1.outbreakUnk5 = 2;
}

void sub_80BE5FC(void)
{
    TVShow *tvShow;
    u16 species;

    tvShow = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];

    tvShow->fanclubLetter.var00 = TVSHOW_FAN_CLUB_LETTER;
    tvShow->fanclubLetter.var01 = 1;
    StringCopy(tvShow->fanclubLetter.playerName, gSaveBlock2.playerName);

    species = GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, NULL);
    tvShow->fanclubLetter.species = species;
    sub_80BE160(tvShow);
    tvShow->fanclubLetter.var18 = GAME_LANGUAGE;
}

void sub_80BE65C(void)
{
    TVShow *tvShow;

    tvShow = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];

    tvShow->recentHappenings.var00 = TVSHOW_RECENT_HAPPENINGS;
    tvShow->recentHappenings.var01 = 1;
    StringCopy(&tvShow->recentHappenings.var10[0], &gSaveBlock2.playerName[0]);
    tvShow->recentHappenings.var02 = 0;

    sub_80BE160(tvShow);
    tvShow->recentHappenings.var18 = GAME_LANGUAGE;
}

void sub_80BE6A0(void)
{
    TVShow *tvShow;
    u8 monIndex;

    tvShow = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];

    tvShow->fanclubOpinions.var00 = TVSHOW_PKMN_FAN_CLUB_OPINIONS;
    tvShow->fanclubOpinions.var01 = 1;

    monIndex = GetLeadMonIndex();

    tvShow->fanclubOpinions.var04A = GetMonData(&gPlayerParty[monIndex], MON_DATA_FRIENDSHIP, NULL) / 16;
    tvShow->fanclubOpinions.var04B = gSpecialVar_0x8007;


    StringCopy(tvShow->fanclubOpinions.var05, gSaveBlock2.playerName);

    GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_NICKNAME, tvShow->fanclubOpinions.var10);

    tvShow->fanclubOpinions.var02 = GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, NULL);
    sub_80BE160(tvShow);
    tvShow->fanclubOpinions.var0D = GAME_LANGUAGE;
    tvShow->fanclubOpinions.var0E = sub_80BDEAC(tvShow->fanclubOpinions.var10);
    StripExtCtrlCodes(tvShow->fanclubOpinions.var10);
}

void nullsub_21(void)
{
}

void sub_80BE778(void)
{
    u8 i;

    if (!FlagGet(SYS_GAME_CLEAR))
    {
        return;
    }


    for (i = 0; i < 24; i++)
    {
        if (gSaveBlock1.tvShows.shows[i].massOutbreak.var00 == TVSHOW_MASS_OUTBREAK)
        {
            return;
        }
    }

    if (sub_80BF77C(0x147))
    {
        return;
    }

    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows.shows);
    if (gUnknown_03005D38.var0 == -1)
    {
        return;
    }
    {
        u16 rand;
        u16 val;
        s32 val2;
        TVShow *tvShow;

        rand = Random();
        val = rand % 5;

        val2 = gUnknown_03005D38.var0;

        tvShow = &gSaveBlock1.tvShows.shows[val2];

        tvShow->massOutbreak.var00 = TVSHOW_MASS_OUTBREAK;
        tvShow->massOutbreak.var01 = 1;

        tvShow->massOutbreak.level = gPokeOutbreakSpeciesList[val].level;
        tvShow->massOutbreak.var02 = 0;
        tvShow->massOutbreak.var03 = 0;
        tvShow->massOutbreak.species = gPokeOutbreakSpeciesList[val].species;
        tvShow->massOutbreak.var0E = 0;
        tvShow->massOutbreak.moves[0] = gPokeOutbreakSpeciesList[val].moves[0];
        tvShow->massOutbreak.moves[1] = gPokeOutbreakSpeciesList[val].moves[1];
        tvShow->massOutbreak.moves[2] = gPokeOutbreakSpeciesList[val].moves[2];
        tvShow->massOutbreak.moves[3] = gPokeOutbreakSpeciesList[val].moves[3];
        tvShow->massOutbreak.locationMapNum = gPokeOutbreakSpeciesList[val].location;
        tvShow->massOutbreak.locationMapGroup = 0;
        tvShow->massOutbreak.var12 = 0;
        tvShow->massOutbreak.probability = 0x32;
        tvShow->massOutbreak.var15 = 0;
        tvShow->massOutbreak.var16 = 0x01;
        sub_80BE160(tvShow);

        tvShow->massOutbreak.var18 = GAME_LANGUAGE;
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
    TVShow *tvShow;
    if (gSaveBlock1.outbreakPokemonSpecies == 0) {
        for (showidx=0; showidx<24; showidx++) {
            if (gSaveBlock1.tvShows.shows[showidx].massOutbreak.var00 == 0x29 && gSaveBlock1.tvShows.shows[showidx].massOutbreak.var01 == 0x01) {
                tvShow = &(gSaveBlock1.tvShows.shows[showidx]);
                if (tvShow->massOutbreak.var16 < arg0)
                    tvShow->massOutbreak.var16 = 0;
                else
                    tvShow->massOutbreak.var16 -= arg0;
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

void sub_80BE9D4();

void sub_80BE97C(bool8 flag)
{
    u8 var0, var1;
    if (flag != 0) {
        var0 = gUnknown_020387E2 >> 8;
        if (var0 > 4)
            sub_80BE9D4();
        gUnknown_020387E2 &= 0xFF;
        var1 = gUnknown_020387E2 & 0xFF;
        if (var1 != 0xFF)
            gUnknown_020387E2++;
    } else {
        var0 = gUnknown_020387E2 & 0xFF;
        if (var0 > 4)
            sub_80BE9D4();
        gUnknown_020387E2 &= 0xFF00;
        var1 = gUnknown_020387E2 >> 8;
        if (var1 != 0xFF)
            gUnknown_020387E2 += 0x100;
    }
}

s8 sub_80BF74C(TVShow tvShow[]);
bool8 sub_80BF1B4(u8);

void sub_80BE9D4()
{
    TVShow *show;
    gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows.shows);
    if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(24) != 1) {
        show = &(gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0]);
#ifdef NONMATCHING
        show->common.var00 = 24;
        show->common.var01 = 0;
#else
        asm(".syntax unified\n\
        movs r1, 0\n\
        movs r0, 24\n\
        strb r0, [r4]\n\
        strb r1, [r4, 1]\n\
        .syntax divided\n");
#endif
        show->unknownTvShowType.var02 = gUnknown_020387E2 & 0xFF;
        show->unknownTvShowType.var03 = gUnknown_020387E2 >> 8;
        show->unknownTvShowType.var04 = gUnknown_020387E0;
        StringCopy(show->unknownTvShowType.playerName, gSaveBlock2.playerName);
        sub_80BE138(show);
        show->unknownTvShowType.language = GAME_LANGUAGE;
    }
}

void sub_80BEA50(u16 var)
{
    gUnknown_020387E0 = var;
}

void sub_80BF55C(TVShow tvShow[], u8 showidx);
void sub_80BEA88(void);

void sub_80BEA5C(u16 arg0)
{
    struct UnknownSaveStruct2A98 *unk_2a98;
    unk_2a98 = &gSaveBlock1.tvShows.unknown_2A98;
    if (unk_2a98->var00 == 0x19)
    {
        if (unk_2a98->var02 <= 0x13)
        {
            sub_80BF55C(gSaveBlock1.tvShows.shows, 0x18);
        }
        else
        {
            sub_80BEA88();
        }
    }
}
void sub_80BEA88(void)
{
    struct UnknownSaveStruct2A98 *unk_2a98;
    TVShow *tvShow;
    u8 rval;
    unk_2a98 = &gSaveBlock1.tvShows.unknown_2A98;
    rval = sub_80BF77C(0xFFFF);
    if (rval == 0)
    {
        gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows.shows);
        if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(0x19) != 1)
        {
            tvShow = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
            tvShow->unknownTvShowType2.var00 = 0x19;
            tvShow->unknownTvShowType2.var01 = rval;
            tvShow->unknownTvShowType2.var02 = unk_2a98->var02;
            tvShow->unknownTvShowType2.var06 = GetGameStat(GAME_STAT_STEPS) - unk_2a98->var06;
            tvShow->unknownTvShowType2.var04 = unk_2a98->var04;
            tvShow->unknownTvShowType2.var08 = unk_2a98->var08;
            tvShow->unknownTvShowType2.var0a = unk_2a98->var0a;
            StringCopy(tvShow->unknownTvShowType2.playerName, gSaveBlock2.playerName);
            sub_80BE138(tvShow);
            tvShow->unknownTvShowType2.language = GAME_LANGUAGE;
        }
    }
}

// void sub_80BEB20(void)
// {
    // struct UnknownSaveStruct2ABC *unk_2abc;
    // u16 rval16;
    // u16 val;
    // unk_2abc = &gSaveBlock1.unknown_2ABC;
    // TVShow *tvShow;
    // if (FlagGet(SYS_GAME_CLEAR) != 0)
    // {
        // gUnknown_03005D38.var0 = sub_80BEBC8(unk_2abc);
        // if (gUnknown_03005D38.var0 != -1 && sub_80BF77C(0x28f) != 1)
        // {
            // rval16 = Random();
            // val = (rval16 % 3) + 1;
            // if (sub_80BEE48(val) != 1)
            // {
                // tvShow = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
                // unk_2abc[gUnknown_03005D38.var0][0] = val;
                // to do
            // }
        // }
    // }
// }

asm(".section .text_b");

void sub_80BF088(u8 arg0, s32 price);

void sub_80BF6D8(void);
void sub_80BF588(TVShow tvShows[]);

u8 sub_80BF0B8(int value)
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
    for (i=0; i<3; i++)
    {
        if (arg1->itemIds[i])
        {
            price += ItemId_GetPrice(arg1->itemIds[i]) * arg1->itemAmounts[i];
        }
    }
    if (arg1->boughtOrSoldFlag == 1)
    {
        sub_80BF088(arg0, price >> 1);
    }
    else
    {
        sub_80BF088(arg0, price);
    }
}

bool8 sub_80BF1B4(u8 showIdx)
{
    TVShow *tvShows;
    u8 i;
    u32 trainerId;
    tvShows = gSaveBlock1.tvShows.shows;
    trainerId = GetPlayerTrainerId();
    for (i=5; i<24; i++)
    {
        if (tvShows[i].common.var00 == showIdx)
        {
            if ((trainerId & 0xFF) == tvShows[i].common.trainerIdLo && ((trainerId >> 8) & 0xFF) == tvShows[i].common.trainerIdHi)
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}

void sub_80BF20C(void)
{
    u8 i, j;
    u16 tmpId, tmpAmount;
    for (i=0; i<2; i++)
    {
        for (j=i+1; j<3; j++)
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
    for (i=0; i<5; i++)
    {
        if (gSaveBlock1.tvShows.shows[i].common.var00 == showType) {
            if(gSaveBlock1.tvShows.shows[i].common.var01 == 1)
            {
                gScriptResult = 1;
            }
            else
            {
                sub_80BF55C(gSaveBlock1.tvShows.shows, i);
                sub_80BF588(gSaveBlock1.tvShows.shows);
                sub_80BF6D8();
            }
            return;
        }
    }
    sub_80BF6D8();
}

void sub_80BF334(void);
void sub_80BF3A4(void);
void sub_80BF3DC(void);
void sub_80BF46C(void);
void sub_80BF478(void);
void sub_80BF484(void);
void sub_80BF4BC(void);

void sub_80BF2C4(void)
{
    gScriptResult = 0;
    switch (gSpecialVar_0x8005) {
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
        case TVSHOW_UNK_SHOWTYPE_06:
            sub_80BF484();
            break;
        case TVSHOW_UNK_SHOWTYPE_07:
            sub_80BF4BC();
            break;
    }
}

void sub_80BF334(void)
{
    TVShow *show;
    sub_80BF25C(TVSHOW_FAN_CLUB_LETTER);
    if (gScriptResult == 0) {
        StringCopy(gStringVar1, gSpeciesNames[GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, 0)]);
        show = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
        sub_80EB6FC(show->fanclubLetter.pad04, 6);
    }
}

void sub_80BF3A4(void)
{
    TVShow *show;
    sub_80BF25C(TVSHOW_RECENT_HAPPENINGS);
    if (gScriptResult == 0) {
        show = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
        sub_80EB6FC(show->recentHappenings.var04, 6);
    }
}

void sub_80BF3DC(void)
{
    TVShow *show;
    sub_80BF25C(TVSHOW_PKMN_FAN_CLUB_OPINIONS);
    if (gScriptResult == 0) {
        StringCopy(gStringVar1, gSpeciesNames[GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, 0)]);
        GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_NICKNAME, gStringVar2);
        StringGetEnd10(gStringVar2);
        show = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
        sub_80EB6FC(show->fanclubOpinions.var1C, 2);
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
    TVShow *show;
    sub_80BF25C(TVSHOW_UNK_SHOWTYPE_06);
    if (gScriptResult == 0) {
        show = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
        sub_80EB6FC(show->recentHappenings.var04, 2); // wrong struct ident, fix later
    }
}

void sub_80BF4BC(void)
{
    TVShow *show;
    sub_80BF25C(TVSHOW_UNK_SHOWTYPE_07);
    if (gScriptResult == 0) {
        show = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
        sub_80EB6FC(show->fanclubOpinions.var18, 1); // wrong struct ident, fix later
    }
}

u8 sub_80BF4F4(u8 arg0)
{
    u32 species;

    GetMonData(&gPlayerParty[arg0], MON_DATA_NICKNAME, &gStringVar1);

    species = GetMonData(&gPlayerParty[arg0], MON_DATA_SPECIES, NULL);

    if (StringCompareWithoutExtCtrlCodes(gSpeciesNames[species], gStringVar1) == FALSE)
    {
        return FALSE;
    }

    return TRUE;
}

u8 sub_80BF544(void)
{
    return sub_80BF4F4(GetLeadMonIndex());
}

void sub_80BF55C(TVShow tvShow[], u8 showidx)
{
    u8 idx;
    tvShow[showidx].common.var00 = 0;
    tvShow[showidx].common.var01 = 0;
    for (idx=0; idx<34; idx++) {
        tvShow[showidx].common.pad02[idx] = 0;
    }
}

void sub_80BF588(TVShow tvShow[])
{
    u8 showidx;
    u8 showidx2;
    for (showidx=0; showidx<4; showidx++) {
        if (tvShow[showidx].common.var00 == 0) {
            for (showidx2=showidx+1; showidx2<5; showidx2++) {
                if (tvShow[showidx2].common.var00 != 0) {
                    tvShow[showidx] = tvShow[showidx2];
                    sub_80BF55C(tvShow, showidx2);
                    break;
                }
            }
        }
    }
    for (showidx=5; showidx<24; showidx++) {
        if (tvShow[showidx].common.var00 == 0) {
            for (showidx2=showidx+1; showidx2<24; showidx2++) {
                if (tvShow[showidx2].common.var00 != 0) {
                    tvShow[showidx] = tvShow[showidx2];
                    sub_80BF55C(gSaveBlock1.tvShows.shows, showidx2);
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
    while ((s8)sub_8090D90(SpeciesToNationalPokedexNum(cspecies), 0) != 1 || cspecies == species) {
        if (cspecies == SPECIES_BULBASAUR)
            cspecies = NUM_SPECIES - 1;
        else
            cspecies --;
        if (cspecies == rspecies) {
            cspecies = species;
            return cspecies;
        }
    }
    return cspecies;
}

void sub_80BF6D8(void)
{
    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows.shows);
    gSpecialVar_0x8006 = gUnknown_03005D38.var0;
    if (gUnknown_03005D38.var0 == -1)
        gScriptResult = 1;
    else
        gScriptResult = 0;
}

s8 sub_80BF720(TVShow tvShow[])
{
    u8 idx;
    for (idx=0; idx<5; idx++) {
        if (tvShow[idx].common.var00 == 0)
            return idx;
    }
    return -1;
}

s8 sub_80BF74C(TVShow tvShow[])
{
    s8 idx;
    for (idx=5; idx<24; idx++) {
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

void sub_80BF79C(struct TVShowRecentHappenings *arg0)
{
    u8 i = Random() % 6;
    while (1) {
        if (i == 6)
            i = 0;
        if (arg0->var04[i] != 0xFFFF)
            break;
        i ++;
    }
    sub_80EB3FC(gStringVar3, arg0->var04[i]);
}

u8 sub_80BF7E8(struct TVShowNameRaterShow *arg0)
{
    u16 flagsum = 0;
    u8 i = 0;
    if (arg0->pokemonName[0] != 0xFF) {
        while (i < 11 && arg0->pokemonName[i] != 0xFF) {
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
    for (i=0; i<3; i++)
        flags[i] = EOS;
    if (arg3 == 0) {
        nameLength = StringLength(tvShow->trainerName);
        if (arg2 == 0) {
            flags[0] = tvShow->trainerName[arg1];
        } else if (arg2 == 1) {
            flags[0] = tvShow->trainerName[nameLength - arg1];
        } else if (arg2 == 2) {
            flags[0] = tvShow->trainerName[arg1];
            flags[1] = tvShow->trainerName[arg1 + 1];
        } else {
            flags[0] = tvShow->trainerName[nameLength - (arg1 + 2)];
            flags[1] = tvShow->trainerName[nameLength - (arg1 + 1)];
        }
    } else if (arg3 == 1) {
        nameLength = StringLength(tvShow->pokemonName);
        if (arg2 == 0) {
            flags[0] = tvShow->pokemonName[arg1];
        } else if (arg2 == 1) {
            flags[0] = tvShow->pokemonName[nameLength - arg1];
        } else if (arg2 == 2) {
            flags[0] = tvShow->pokemonName[arg1];
            flags[1] = tvShow->pokemonName[arg1 + 1];
        } else {
            flags[0] = tvShow->pokemonName[nameLength - (arg1 + 2)];
            flags[1] = tvShow->pokemonName[nameLength - (arg1 + 1)];
        }
    } else {
        nameLength = StringLength(gSpeciesNames[arg4]);
        if (arg2 == 0) {
            flags[0] = gSpeciesNames[arg4][arg1];
        } else if (arg2 == 1) {
            flags[0] = gSpeciesNames[arg4][nameLength - arg1];
        } else if (arg2 == 2) {
            flags[0] = gSpeciesNames[arg4][arg1];
            flags[1] = gSpeciesNames[arg4][arg1 + 1];
        } else {
            flags[0] = gSpeciesNames[arg4][nameLength - (arg1 + 2)];
            flags[1] = gSpeciesNames[arg4][nameLength - (arg1 + 1)];
        }
    }
    StringCopy(gUnknown_083D1464[arg0], flags);
}

bool8 sub_80BF974(void)
{
    u8 i;
    for (i=0; i<5; i++)
    {
        if (gSaveBlock1.tvShows.shows[i].common.var00 == gSpecialVar_0x8004)
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
    if (gSaveBlock2.playerGender == MALE) {
        if (gSaveBlock1.location.mapNum != MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F)
            return 0;
    } else {
        if (gSaveBlock1.location.mapNum != MAP_ID_LITTLEROOT_TOWN_MAYS_HOUSE_1F)
            return 0;
    }
    if (FlagGet(SYS_TV_LATI) == 1)
        return 1;
    if (FlagGet(SYS_TV_HOME) == 1)
        return 2;
    return 1;
}

#ifdef NONMATCHING
void GetMomOrDadStringForTVMessage(void)
{
    if (gSaveBlock1.location.mapGroup == MAP_GROUP_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F) {
        if (gSaveBlock2.playerGender == MALE) {
            if (gSaveBlock1.location.mapNum == MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F) {
                StringCopy(gStringVar1, gOtherText_Mom);
                VarSet(VAR_0x4003, 1);
            }
        } else {
            if (gSaveBlock1.location.mapNum == MAP_ID_LITTLEROOT_TOWN_MAYS_HOUSE_1F) {
                StringCopy(gStringVar1, gOtherText_Mom);
                VarSet(VAR_0x4003, 1);
            }
        }
    }
    if (VarGet(VAR_0x4003) == 1) {
        StringCopy(gStringVar1, gOtherText_Mom);
    } else if (VarGet(VAR_0x4003) == 2) {
        StringCopy(gStringVar1, gOtherText_Dad);
    } else if (VarGet(VAR_0x4003) > 2) {
        if ((u16)(VarGet(VAR_0x4003) & 1) == 0) {
            StringCopy(gStringVar1, gOtherText_Mom);
        } else {
            StringCopy(gStringVar1, gOtherText_Dad);
        }
    } else {
        if ((u16)(Random() & 1) != 0) {
            StringCopy(gStringVar1, gOtherText_Mom);
            VarSet(VAR_0x4003, 1);
        } else {
            StringCopy(gStringVar1, gOtherText_Dad);
            VarSet(VAR_0x4003, 2);
        }
    }
}
#else
__attribute__((naked))
void GetMomOrDadStringForTVMessage(void)
{
    asm(".syntax unified\n\
	push {r4,lr}\n\
	ldr r1, _080BFC40 @ =gSaveBlock1\n\
	movs r0, 0x4\n\
	ldrsb r0, [r1, r0]\n\
	cmp r0, 0x1\n\
	bne _080BFC6C\n\
	ldr r0, _080BFC44 @ =gSaveBlock2\n\
	ldrb r0, [r0, 0x8]\n\
	cmp r0, 0\n\
	bne _080BFC54\n\
	movs r0, 0x5\n\
	ldrsb r0, [r1, r0]\n\
	cmp r0, 0\n\
	bne _080BFC6C\n\
	ldr r0, _080BFC48 @ =gStringVar1\n\
	ldr r1, _080BFC4C @ =gOtherText_Mom\n\
	bl StringCopy\n\
	ldr r0, _080BFC50 @ =0x00004003\n\
	movs r1, 0x1\n\
	bl VarSet\n\
	b _080BFC6C\n\
	.align 2, 0\n\
_080BFC40: .4byte gSaveBlock1\n\
_080BFC44: .4byte gSaveBlock2\n\
_080BFC48: .4byte gStringVar1\n\
_080BFC4C: .4byte gOtherText_Mom\n\
_080BFC50: .4byte 0x00004003\n\
_080BFC54:\n\
	movs r0, 0x5\n\
	ldrsb r0, [r1, r0]\n\
	cmp r0, 0x2\n\
	bne _080BFC6C\n\
	ldr r0, _080BFCB4 @ =gStringVar1\n\
	ldr r1, _080BFCB8 @ =gOtherText_Mom\n\
	bl StringCopy\n\
	ldr r0, _080BFCBC @ =0x00004003\n\
	movs r1, 0x1\n\
	bl VarSet\n\
_080BFC6C:\n\
	ldr r4, _080BFCBC @ =0x00004003\n\
	adds r0, r4, 0\n\
	bl VarGet\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	cmp r0, 0x1\n\
	beq _080BFCAA\n\
	adds r0, r4, 0\n\
	bl VarGet\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	cmp r0, 0x2\n\
	beq _080BFCC0\n\
	adds r0, r4, 0\n\
	bl VarGet\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	cmp r0, 0x2\n\
	bls _080BFCD4\n\
	adds r0, r4, 0\n\
	bl VarGet\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080BFCC0\n\
_080BFCAA:\n\
	ldr r0, _080BFCB4 @ =gStringVar1\n\
	ldr r1, _080BFCB8 @ =gOtherText_Mom\n\
	bl StringCopy\n\
	b _080BFD10\n\
	.align 2, 0\n\
_080BFCB4: .4byte gStringVar1\n\
_080BFCB8: .4byte gOtherText_Mom\n\
_080BFCBC: .4byte 0x00004003\n\
_080BFCC0:\n\
	ldr r0, _080BFCCC @ =gStringVar1\n\
	ldr r1, _080BFCD0 @ =gOtherText_Dad\n\
	bl StringCopy\n\
	b _080BFD10\n\
	.align 2, 0\n\
_080BFCCC: .4byte gStringVar1\n\
_080BFCD0: .4byte gOtherText_Dad\n\
_080BFCD4:\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080BFD00\n\
	ldr r0, _080BFCF8 @ =gStringVar1\n\
	ldr r1, _080BFCFC @ =gOtherText_Mom\n\
	bl StringCopy\n\
	adds r0, r4, 0\n\
	movs r1, 0x1\n\
	bl VarSet\n\
	b _080BFD10\n\
	.align 2, 0\n\
_080BFCF8: .4byte gStringVar1\n\
_080BFCFC: .4byte gOtherText_Mom\n\
_080BFD00:\n\
	ldr r0, _080BFD18 @ =gStringVar1\n\
	ldr r1, _080BFD1C @ =gOtherText_Dad\n\
	bl StringCopy\n\
	adds r0, r4, 0\n\
	movs r1, 0x2\n\
	bl VarSet\n\
_080BFD10:\n\
	pop {r4}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080BFD18: .4byte gStringVar1\n\
_080BFD1C: .4byte gOtherText_Dad\n\
.syntax divided\n");
}
#endif

void sub_80BFD20(void)
{
    VarSet(VAR_0x40BC, 0);
    RemoveFieldObjectByLocalIdAndMap(5, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
}

extern u8 ewram[];
#define gUnknown_02007000 (*(struct ewramStruct_0207000 *)(ewram + 0x7000))
extern u8 gUnknown_020387E4;

struct ewramStruct_0207000 {
    struct SaveTVStruct tvshows[4];
};

void sub_80BFE24(struct SaveTVStruct *arg0, struct SaveTVStruct *arg1, struct SaveTVStruct *arg2, struct SaveTVStruct *arg3);

void sub_80C04A0(void);
void sub_80C01D4(void);
void sub_80C0408(void);

void sub_80BFD44(u8 *arg0, u32 arg1, u8 arg2)
{
    u8 i;
    struct ewramStruct_0207000 *ewramTVShows;
    for (i=0; i<4; i++) {
        memcpy(&gUnknown_02007000.tvshows[i], &arg0[i * arg1], sizeof(struct SaveTVStruct));
    }
    ewramTVShows = &gUnknown_02007000;
    switch (arg2) {
        case 0:
            sub_80BFE24(&gSaveBlock1.tvShows, &ewramTVShows->tvshows[1], &ewramTVShows->tvshows[2], &ewramTVShows->tvshows[3]);
            break;
        case 1:
            sub_80BFE24(&ewramTVShows->tvshows[0], &gSaveBlock1.tvShows, &ewramTVShows->tvshows[2], &ewramTVShows->tvshows[3]);
            break;
        case 2:
            sub_80BFE24(&ewramTVShows->tvshows[0], &ewramTVShows->tvshows[1], &gSaveBlock1.tvShows, &ewramTVShows->tvshows[3]);
            break;
        case 3:
            sub_80BFE24(&ewramTVShows->tvshows[0], &ewramTVShows->tvshows[1], &ewramTVShows->tvshows[2], &gSaveBlock1.tvShows);
            break;
    }
    sub_80BF588(gSaveBlock1.tvShows.shows);
    sub_80C04A0();
    sub_80BF588(gSaveBlock1.tvShows.shows);
    sub_80C01D4();
    sub_80C0408();
}

extern u8 gUnknown_03000720;
extern s8 gUnknown_03000722;
s8 sub_80C019C(struct SaveTVStruct *tvStruct);
extern u8 sub_80BFF68(struct SaveTVStruct *tv1, struct SaveTVStruct *tv2, u8 idx);

#ifdef NONMATCHING
void sub_80BFE24(struct SaveTVStruct *arg0, struct SaveTVStruct *arg1, struct SaveTVStruct *arg2, struct SaveTVStruct *arg3)
{
    struct SaveTVStruct ** argslist[4] = {&arg0, &arg1, &arg2, &arg3};
    u8 i;
    u8 j;
    gUnknown_03000720 = GetLinkPlayerCount();
    for (i=0; i < gUnknown_03000720; i++) {
        while (gUnknown_03000720 > 0);
        if (i == 0)
            gUnknown_020387E4 = 0;
        gUnknown_03000722 = sub_80C019C(*(argslist[i]));
        if (gUnknown_03000722 == -1) {
            gUnknown_020387E4++;
            if (gUnknown_020387E4 == gUnknown_03000720)
                return;
        } else {
            for (j=0; j<gUnknown_03000720-1; j++) {
                gUnknown_03005D38.var0 = sub_80BF74C(*(argslist[(j + 1) % gUnknown_03000720])->shows);
                if (gUnknown_03005D38.var0 != -1 && sub_80BFF68(*(argslist[(i + 1) % gUnknown_03000720]), *(argslist[(i + 1)]), (i + 1) % gUnknown_03000720) == 1) {
                    break;
                }
            }
        }
    }
}
#else
__attribute__((naked))
void sub_80BFE24(struct SaveTVStruct *arg0, struct SaveTVStruct *arg1, struct SaveTVStruct *arg2, struct SaveTVStruct *arg3)
{
    asm(".syntax unified\n\
    	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x20\n\
	str r0, [sp, 0x10]\n\
	str r1, [sp, 0x14]\n\
	str r2, [sp, 0x18]\n\
	str r3, [sp, 0x1C]\n\
	add r0, sp, 0x10\n\
	str r0, [sp]\n\
	add r0, sp, 0x14\n\
	str r0, [sp, 0x4]\n\
	add r0, sp, 0x18\n\
	str r0, [sp, 0x8]\n\
	add r0, sp, 0x1C\n\
	str r0, [sp, 0xC]\n\
	bl GetLinkPlayerCount\n\
	ldr r1, _080BFEA0 @ =gUnknown_03000720\n\
	strb r0, [r1]\n\
_080BFE50:\n\
	movs r6, 0\n\
	ldr r0, _080BFEA0 @ =gUnknown_03000720\n\
	ldrb r1, [r0]\n\
	cmp r6, r1\n\
	bcs _080BFE50\n\
	mov r10, r0\n\
_080BFE5C:\n\
	cmp r6, 0\n\
	bne _080BFE64\n\
	ldr r2, _080BFEA4 @ =gUnknown_020387E4\n\
	strb r6, [r2]\n\
_080BFE64:\n\
	lsls r4, r6, 2\n\
	mov r3, sp\n\
	adds r0, r3, r4\n\
	ldr r0, [r0]\n\
	ldr r0, [r0]\n\
	bl sub_80C019C\n\
	ldr r1, _080BFEA8 @ =gUnknown_03000722\n\
	strb r0, [r1]\n\
	lsls r0, 24\n\
	asrs r0, 24\n\
	movs r1, 0x1\n\
	negs r1, r1\n\
	adds r7, r4, 0\n\
	cmp r0, r1\n\
	bne _080BFEAC\n\
	ldr r1, _080BFEA4 @ =gUnknown_020387E4\n\
	ldrb r0, [r1]\n\
	adds r0, 0x1\n\
	strb r0, [r1]\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r2, r10\n\
	ldrb r2, [r2]\n\
	cmp r0, r2\n\
	beq _080BFF58\n\
	adds r6, 0x1\n\
	mov r9, r6\n\
	b _080BFF3C\n\
	.align 2, 0\n\
_080BFEA0: .4byte gUnknown_03000720\n\
_080BFEA4: .4byte gUnknown_020387E4\n\
_080BFEA8: .4byte gUnknown_03000722\n\
_080BFEAC:\n\
	movs r5, 0\n\
	mov r3, r10\n\
	ldrb r0, [r3]\n\
	subs r0, 0x1\n\
	adds r2, r6, 0x1\n\
	mov r9, r2\n\
	cmp r5, r0\n\
	bge _080BFF22\n\
	ldr r3, _080BFF4C @ =gUnknown_03000720\n\
	mov r8, r3\n\
_080BFEC0:\n\
	adds r0, r6, r5\n\
	adds r4, r0, 0x1\n\
	mov r0, r8\n\
	ldrb r1, [r0]\n\
	adds r0, r4, 0\n\
	bl __modsi3\n\
	lsls r0, 2\n\
	add r0, sp\n\
	ldr r0, [r0]\n\
	ldr r0, [r0]\n\
	bl sub_80BF74C\n\
	ldr r1, _080BFF50 @ =gUnknown_03005D38\n\
	strb r0, [r1]\n\
	lsls r0, 24\n\
	asrs r0, 24\n\
	movs r1, 0x1\n\
	negs r1, r1\n\
	cmp r0, r1\n\
	beq _080BFF12\n\
	mov r2, r8\n\
	ldrb r1, [r2]\n\
	adds r0, r4, 0\n\
	bl __modsi3\n\
	adds r2, r0, 0\n\
	lsls r0, r2, 2\n\
	add r0, sp\n\
	ldr r0, [r0]\n\
	mov r3, sp\n\
	adds r1, r3, r7\n\
	ldr r1, [r1]\n\
	lsls r2, 24\n\
	lsrs r2, 24\n\
	bl sub_80BFF68\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0x1\n\
	beq _080BFF22\n\
_080BFF12:\n\
	adds r0, r5, 0x1\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	mov r1, r8\n\
	ldrb r0, [r1]\n\
	subs r0, 0x1\n\
	cmp r5, r0\n\
	blt _080BFEC0\n\
_080BFF22:\n\
	mov r2, r10\n\
	ldrb r0, [r2]\n\
	subs r0, 0x1\n\
	cmp r5, r0\n\
	bne _080BFF3C\n\
	mov r3, sp\n\
	adds r0, r3, r7\n\
	ldr r0, [r0]\n\
	ldr r0, [r0]\n\
	ldr r1, _080BFF54 @ =gUnknown_03000722\n\
	ldrb r1, [r1]\n\
	bl sub_80BF55C\n\
_080BFF3C:\n\
	mov r1, r9\n\
	lsls r0, r1, 24\n\
	lsrs r6, r0, 24\n\
	mov r2, r10\n\
	ldrb r2, [r2]\n\
	cmp r6, r2\n\
	bcc _080BFE5C\n\
	b _080BFE50\n\
	.align 2, 0\n\
_080BFF4C: .4byte gUnknown_03000720\n\
_080BFF50: .4byte gUnknown_03005D38\n\
_080BFF54: .4byte gUnknown_03000722\n\
_080BFF58:\n\
	add sp, 0x20\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
.syntax divided\n");
}
#endif

asm(".section .text_c");

void DoTVShowPokemonNewsMassOutbreak(void)
{
    TVShow *tvShow;

    tvShow = &gSaveBlock1.tvShows.shows[gSpecialVar_0x8004];

    sub_80FBFB4(gStringVar1, tvShow->massOutbreak.locationMapNum, 0);

    StringCopy(gStringVar2, gSpeciesNames[tvShow->massOutbreak.species]);

    TVShowDone();
    StartMassOutbreak();

    ShowFieldMessage(gTVPokemonOutbreakTextGroup[gUnknown_020387E8]);
}

asm(".section .text_d");

void TVShowDone(void)
{
    gScriptResult = 1;
    gUnknown_020387E8 = 0;

    gSaveBlock1.tvShows.shows[gSpecialVar_0x8004].common.var01 = 0;
}

void sub_80C2014(void)
{
    gUnknown_020387E8 = 0;
}
