#include "global.h"
#include "asm.h"
#include "event_data.h"
#include "field_message_box.h"
#include "flags.h"
#include "global.h"
#include "rng.h"
#include "string_util.h"
#include "text.h"

enum {
    TVSHOW_FAN_CLUB_LETTER = 1,
    TVSHOW_RECENT_HAPPENINGS = 2,
    TVSHOW_PKMN_FAN_CLUB_OPINIONS = 3,
    TVSHOW_NAME_RATER_SHOW = 5,
    TVSHOW_MASS_OUTBREAK = 41,
};

struct UnkTvStruct {
    s8 var0;
};

struct OutbreakPokemon {
    /* 0x00 */ u16 species;
    /* 0x02 */ u16 moves[4];
    /* 0x0A */ u8 level;
    /* 0x0B */ u8 location;
};

extern u16 gSpecialVar_0x8004;
extern u8 gSpecialVar_0x8007;
extern u16 gScriptResult;
extern u8 gUnknown_020387E8;

extern struct UnkTvStruct gUnknown_03005D38;

extern u8 gSpeciesNames[][11];
extern u8 *gUnknown_083D14BC[];
extern struct OutbreakPokemon gUnknown_083D13F8[5];

void sub_80BE478(void) {
    u16 playerNameLength;
    u16 pokemonNicknameLength;
    TVShow *tvShow;

    sub_80BF478();

    if (gScriptResult == 1) {
        return;
    }

    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar1);

    playerNameLength = StringLength(gSaveBlock2.playerName);
    if (playerNameLength <= 1) {
        return;
    }

    pokemonNicknameLength = StringLength(gStringVar1);
    if (pokemonNicknameLength <= 1) {
        return;
    }

    tvShow = &gSaveBlock1.tvShows[gUnknown_03005D38.var0];

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

void StartMassOutbreak(void) {
    TVShow *tvShow;

    tvShow = &gSaveBlock1.tvShows[gSpecialVar_0x8004];

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

void sub_80BE5FC(void) {
    TVShow *tvShow;
    u16 species;

    tvShow = &gSaveBlock1.tvShows[gUnknown_03005D38.var0];

    tvShow->fanclubLetter.var00 = TVSHOW_FAN_CLUB_LETTER;
    tvShow->fanclubLetter.var01 = 1;
    StringCopy(tvShow->fanclubLetter.playerName, gSaveBlock2.playerName);

    species = GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, NULL);
    tvShow->fanclubLetter.species = species;
    sub_80BE160(tvShow);
    tvShow->fanclubLetter.var18 = GAME_LANGUAGE;
}

void sub_80BE65C(void) {
    TVShow *tvShow;

    tvShow = &gSaveBlock1.tvShows[gUnknown_03005D38.var0];

    tvShow->recentHappenings.var00 = TVSHOW_RECENT_HAPPENINGS;
    tvShow->recentHappenings.var01 = 1;
    StringCopy(&tvShow->recentHappenings.var10[0], &gSaveBlock2.playerName[0]);
    tvShow->recentHappenings.var02 = 0;

    sub_80BE160(tvShow);
    tvShow->recentHappenings.var18 = GAME_LANGUAGE;
}

void sub_80BE6A0(void) {
    TVShow *tvShow;
    u8 monIndex;

    tvShow = &gSaveBlock1.tvShows[gUnknown_03005D38.var0];

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

void nullsub_21(void) {

}

void sub_80BE778(void) {
    u8 i;

    if (!FlagGet(SYS_GAME_CLEAR)) {
        return;
    }


    for (i = 0; i < 24; i++) {
        if (gSaveBlock1.tvShows[i].massOutbreak.var00 == TVSHOW_MASS_OUTBREAK) {
            return;
        }
    }

    if (sub_80BF77C(0x147)) {
        return;
    }

    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows);
    if (gUnknown_03005D38.var0 == -1) {
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

        tvShow = &gSaveBlock1.tvShows[val2];

        tvShow->massOutbreak.var00 = TVSHOW_MASS_OUTBREAK;
        tvShow->massOutbreak.var01 = 1;

        tvShow->massOutbreak.level = gUnknown_083D13F8[val].level;
        tvShow->massOutbreak.var02 = 0;
        tvShow->massOutbreak.var03 = 0;
        tvShow->massOutbreak.species = gUnknown_083D13F8[val].species;
        tvShow->massOutbreak.var0E = 0;
        tvShow->massOutbreak.moves[0] = gUnknown_083D13F8[val].moves[0];
        tvShow->massOutbreak.moves[1] = gUnknown_083D13F8[val].moves[1];
        tvShow->massOutbreak.moves[2] = gUnknown_083D13F8[val].moves[2];
        tvShow->massOutbreak.moves[3] = gUnknown_083D13F8[val].moves[3];
        tvShow->massOutbreak.locationMapNum = gUnknown_083D13F8[val].location;
        tvShow->massOutbreak.locationMapGroup = 0;
        tvShow->massOutbreak.var12 = 0;
        tvShow->massOutbreak.probability = 0x32;
        tvShow->massOutbreak.var15 = 0;
        tvShow->massOutbreak.var16 = 0x01;
        sub_80BE160(tvShow);

        tvShow->massOutbreak.var18 = GAME_LANGUAGE;
    }
}

void EndMassOutbreak(void) {
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

void sub_80BE8C4(u16 arg0) {
    sub_80BE8EC(arg0);
    UpdateMassOutbreakTimeLeft(arg0);
    sub_80BEE84(arg0);
    sub_80BEA5C(arg0);
}

asm(".section .text_b");

u8 sub_80BF4F4(u8 arg0) {
    u32 species;

    GetMonData(&gPlayerParty[arg0], MON_DATA_NICKNAME, &gStringVar1);

    species = GetMonData(&gPlayerParty[arg0], MON_DATA_SPECIES, NULL);

    if (StringCompareWithoutExtCtrlCodes(gSpeciesNames[species], gStringVar1) == FALSE) {
        return FALSE;
    }

    return TRUE;
}

asm(".section .text_c");

void DoTVShowPokemonNewsMassOutbreak(void) {
    TVShow *tvShow;

    tvShow = &gSaveBlock1.tvShows[gSpecialVar_0x8004];

    sub_80FBFB4(gStringVar1, tvShow->massOutbreak.locationMapNum, 0);

    StringCopy(gStringVar2, gSpeciesNames[tvShow->massOutbreak.species]);

    TVShowDone();
    StartMassOutbreak();

    ShowFieldMessage(gUnknown_083D14BC[gUnknown_020387E8]);
}

asm(".section .text_d");

void TVShowDone(void) {
    gScriptResult = 1;
    gUnknown_020387E8 = 0;

    gSaveBlock1.tvShows[gSpecialVar_0x8004].common.var01 = 0;
}

void sub_80C2014(void) {
    gUnknown_020387E8 = 0;
}
