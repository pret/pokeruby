#include "global.h"
#include "asm.h"
#include "tv.h"
#include "data2.h"
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
#include "items.h"
#include "contest_painting.h"
#include "rtc.h"

struct UnkTvStruct
{
    s8 var0;
};

struct UnkBattleStruct {
    u16 var00;
    u8 var02[3];
    u8 var05_0:1;
    u8 var05_1:1;
    u8 var05_pad2:6;
    u16 var06;
    u8 pad08[24];
    u16 var20;
    u8 pad22[6];
    u16 var28;
    u8 var2a[11];
    u8 var35;
    u8 var36[11];
};
extern struct UnkBattleStruct gUnknown_030042E0;
extern u8 gUnknown_0300430A[11];

struct OutbreakPokemon
{
    /*0x00*/ u16 species;
    /*0x02*/ u16 moves[4];
    /*0x0A*/ u8 level;
    /*0x0B*/ u8 location;
};

extern u8 *gUnknown_083D1464[3];
extern u8 gUnknown_02038694;

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

extern void sub_80BEBF4(void);

extern u16 gUnknown_020387E0;
extern u16 gUnknown_020387E2;
extern const u8 *gUnknown_083CE048[];

extern const u8 *gTVNewsTextGroup1[];
extern const u8 *gTVNewsTextGroup2[];
extern const u8 *gTVNewsTextGroup3[];

extern u16 gScriptLastTalked;

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

bool8 sub_80BF1B4(u8);
void sub_80BF20C(void);
extern u16 sub_8135D3C(u8);
extern u8 gScriptContestCategory;
extern u8 gScriptContestRank;
extern u8 gUnknown_03004316[11];
extern u8 gUnknown_02024D26;

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

asm(".section .text_a");
s8 sub_80BF74C(TVShow tvShow[]);

void sub_80BF55C(TVShow tvShow[], u8 showidx);
void sub_80BEA88(void);

void sub_80BE138(TVShow *show);
void sub_80BE160(TVShow *show);
extern u16 gUnknown_02024C04;

void sub_80BE5FC(void);
void sub_80BE65C(void);
void sub_80BE6A0(void);
void nullsub_21(void);
void sub_80BE188(void);
void sub_80BE320(void);

extern u8 GabbyAndTyGetBattleNum(void);

void GabbyAndTySetScriptVarsToFieldObjectLocalIds(void) {
    switch (GabbyAndTyGetBattleNum()) {
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

void sub_80BDE48(void) {
    switch (gSpecialVar_0x8005) {
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

u8 sub_80BDEAC(u8 *a0) {
    u8 lang;
    lang = GAME_LANGUAGE;
    if (a0[0] == 0xFC && a0[1] == 0x15) {
        lang = LANGUAGE_JAPANESE;
    }
    return lang;
}

void sub_80BDEC8(void) {
    TVShow *show;
    u8 i;
    u16 total;
    u16 item;
    total = 0;
    sub_80BEB20();
    sub_80BE778();
    if (gUnknown_030042E0.var28 == 0) {
        sub_80BE074();
    } else {
        sub_80BE028();
        if (sub_80BF77C(0xffff) == 0 && StringCompareWithoutExtCtrlCodes(gSpeciesNames[gUnknown_030042E0.var28], gUnknown_030042E0.var2a) != 0) {
            gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows.shows);
            if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_POKEMON_TODAY_CAUGHT) != 1) {
                for (i=0; i<11; i++) {
                    total += gUnknown_030042E0.var36[i];
                }
                if (total != 0 || gUnknown_030042E0.var05_1 != 0) {
                    total = FALSE;
                    show = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
                    show->pokemonToday.var00 = TVSHOW_POKEMON_TODAY_CAUGHT;
                    show->pokemonToday.var01 = total;
                    if (gUnknown_030042E0.var05_1 != 0) {
                        total = 1;
                        item = ITEM_MASTER_BALL;
                    } else {
                        for (i=0; i<11; i++) {
                            total += gUnknown_030042E0.var36[i];
                        }
                        if (total > 0xff) {
                            total = 0xff;
                        }
                        item = gUnknown_02024C04;
                    }
                    show->pokemonToday.var12 = total;
                    show->pokemonToday.ball = item;
                    StringCopy(show->pokemonToday.playerName, gSaveBlock2.playerName);
                    StringCopy(show->pokemonToday.nickname, gUnknown_030042E0.var2a);
                    show->pokemonToday.species = gUnknown_030042E0.var28;
                    sub_80BE138(show);
                    show->pokemonToday.language = GAME_LANGUAGE;
                    show->pokemonToday.language2 = sub_80BDEAC(show->pokemonToday.nickname);
                    StripExtCtrlCodes(show->pokemonToday.nickname);
                }
            }
        }
    }
}

void sub_80BE028(void) {
    TVShow *buffer;
    buffer = &gSaveBlock1.tvShows.unknown_2A98;
    if (buffer->worldOfMasters.var00 != TVSHOW_WORLD_OF_MASTERS) {
        sub_80BF55C(gSaveBlock1.tvShows.shows, 24);
        buffer->worldOfMasters.var06 = GetGameStat(GAME_STAT_STEPS);
        buffer->worldOfMasters.var00 = TVSHOW_WORLD_OF_MASTERS;
    }
    buffer->worldOfMasters.var02++;
    buffer->worldOfMasters.var04 = gUnknown_030042E0.var28;
    buffer->worldOfMasters.var08 = gUnknown_030042E0.var06;
    buffer->worldOfMasters.var0a = gMapHeader.name;
}

#ifdef NONMATCHING
void sub_80BE074(void) {
    u8 i;
    u16 total;
    u8 flag;
    TVShow *show;
    if (sub_80BF77C(0xffff) == 0) {
        for (i=0, total=0; i<ARRAY_COUNT(gUnknown_03004316); i++) {
            total += gUnknown_03004316[i];
        }
        if (total > 0xff) {
            total = 0xff;
        }
        if (total > 2 && gUnknown_02024D26 == 1) {
            gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows.shows);
            if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_POKEMON_TODAY_FAILED) != 1) {
                flag = FALSE;
                show = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
                asm_comment("Here the wrong registers are used to hold the show ID and flag.");
                show->pokemonTodayFailed.var00 = TVSHOW_POKEMON_TODAY_FAILED;
                show->pokemonTodayFailed.var01 = flag;
                show->pokemonTodayFailed.species = gUnknown_030042E0.var06;
                show->pokemonTodayFailed.species2 = gUnknown_030042E0.var20;
                show->pokemonTodayFailed.var10 = total;
                show->pokemonTodayFailed.var11 = gUnknown_02024D26;
                show->pokemonTodayFailed.var12 = gMapHeader.name;
                StringCopy(show->pokemonTodayFailed.playerName, gSaveBlock2.playerName);
                sub_80BE138(show);
                show->pokemonTodayFailed.language = GAME_LANGUAGE;
            }
        }
    }
}
#else
NAKED
void sub_80BE074(void) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	ldr r0, _080BE118 @ =0x0000ffff\n\
	bl sub_80BF77C\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080BE112\n\
	movs r1, 0\n\
	movs r5, 0\n\
	ldr r2, _080BE11C @ =gUnknown_03004316\n\
_080BE088:\n\
	adds r0, r1, r2\n\
	ldrb r0, [r0]\n\
	adds r0, r5, r0\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	adds r0, r1, 0x1\n\
	lsls r0, 24\n\
	lsrs r1, r0, 24\n\
	cmp r1, 0xA\n\
	bls _080BE088\n\
	cmp r5, 0xFF\n\
	bls _080BE0A2\n\
	movs r5, 0xFF\n\
_080BE0A2:\n\
	cmp r5, 0x2\n\
	bls _080BE112\n\
	ldr r7, _080BE120 @ =gUnknown_02024D26\n\
	ldrb r0, [r7]\n\
	cmp r0, 0x1\n\
	bne _080BE112\n\
	ldr r6, _080BE124 @ =gSaveBlock1 + 0x2738\n\
	adds r0, r6, 0\n\
	bl sub_80BF74C\n\
	ldr r4, _080BE128 @ =gUnknown_03005D38\n\
	strb r0, [r4]\n\
	lsls r0, 24\n\
	asrs r0, 24\n\
	movs r1, 0x1\n\
	negs r1, r1\n\
	cmp r0, r1\n\
	beq _080BE112\n\
	movs r0, 0x17\n\
	bl sub_80BF1B4\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0x1\n\
	beq _080BE112\n\
	movs r0, 0\n\
	ldrsb r0, [r4, r0]\n\
	lsls r4, r0, 3\n\
	adds r4, r0\n\
	lsls r4, 2\n\
	adds r4, r6\n\
    @ -- Here the compiler puts the status flag in the wrong register. --\n\
	movs r1, 0\n\
	movs r0, 0x17\n\
	strb r0, [r4]\n\
	strb r1, [r4, 0x1]\n\
	ldr r1, _080BE12C @ =gUnknown_030042E0\n\
	ldrh r0, [r1, 0x6]\n\
	strh r0, [r4, 0xC]\n\
	ldrh r0, [r1, 0x20]\n\
	strh r0, [r4, 0xE]\n\
	strb r5, [r4, 0x10]\n\
	ldrb r0, [r7]\n\
	strb r0, [r4, 0x11]\n\
	ldr r0, _080BE130 @ =gMapHeader\n\
	ldrb r0, [r0, 0x14]\n\
	strb r0, [r4, 0x12]\n\
	adds r0, r4, 0\n\
	adds r0, 0x13\n\
	ldr r1, _080BE134 @ =gSaveBlock2\n\
	bl StringCopy\n\
	adds r0, r4, 0\n\
	bl sub_80BE138\n\
	movs r0, 2 @ GAME_LANGUAGE\n\
	strb r0, [r4, 0x2]\n\
_080BE112:\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080BE118: .4byte 0x0000ffff\n\
_080BE11C: .4byte gUnknown_03004316\n\
_080BE120: .4byte gUnknown_02024D26\n\
_080BE124: .4byte gSaveBlock1 + 0x2738\n\
_080BE128: .4byte gUnknown_03005D38\n\
_080BE12C: .4byte gUnknown_030042E0\n\
_080BE130: .4byte gMapHeader\n\
_080BE134: .4byte gSaveBlock2\n\
.syntax divided\n");
}
#endif

void sub_80BE138(TVShow *show) {
    u32 playerId;
    playerId = GetPlayerTrainerId();
    show->common.srcTrainerId2Lo = playerId & 0xFF;
    show->common.srcTrainerId2Hi = playerId >> 8;
    show->common.srcTrainerIdLo = playerId & 0xFF;
    show->common.srcTrainerIdHi = playerId >> 8;
    show->common.trainerIdLo = playerId & 0xFF;
    show->common.trainerIdHi = playerId >> 8;
}

void sub_80BE160(TVShow *show) {
    u32 playerId;
    playerId = GetPlayerTrainerId();
    show->common.srcTrainerIdLo = playerId & 0xFF;
    show->common.srcTrainerIdHi = playerId >> 8;
    show->common.trainerIdLo = playerId & 0xFF;
    show->common.trainerIdHi = playerId >> 8;
}

void sub_80BE188(void) {
    TVShow *show;
    TVShow *buffer;
    buffer = &gSaveBlock1.tvShows.unknown_2A98;
    if (buffer->bravoTrainer.var00 == TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE) {
        show = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
        show->bravoTrainer.var00 = TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE;
        show->bravoTrainer.var01 = 1;
        show->bravoTrainer.species = buffer->bravoTrainer.species;
        StringCopy(show->bravoTrainer.playerName, gSaveBlock2.playerName);
        StringCopy(show->bravoTrainer.pokemonNickname, buffer->bravoTrainer.pokemonNickname);
        show->bravoTrainer.contestCategory = buffer->bravoTrainer.contestCategory;
        show->bravoTrainer.contestRank = buffer->bravoTrainer.contestRank;
        show->bravoTrainer.var14 = buffer->bravoTrainer.var14;
        show->bravoTrainer.var13_5 = buffer->bravoTrainer.var13_5;
        show->bravoTrainer.contestCategory = buffer->bravoTrainer.contestCategory;
        sub_80BE160(show);
        show->bravoTrainer.language = GAME_LANGUAGE;
        show->bravoTrainer.var1f = sub_80BDEAC(show->bravoTrainer.pokemonNickname);
        StripExtCtrlCodes(show->bravoTrainer.pokemonNickname);
    }
}

void sub_80BE23C(u16 a0) {
    TVShow *show;
    show = &gSaveBlock1.tvShows.unknown_2A98;
    sub_80BF484();
    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows.shows);
    if (gUnknown_03005D38.var0 != -1) {
        sub_80BF55C(gSaveBlock1.tvShows.shows, 24);
        show->bravoTrainer.var14 = a0;
        show->bravoTrainer.var00 = TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE;
    }
}

void sub_80BE284(u8 a0) {
    TVShow *show;
    show = &gSaveBlock1.tvShows.unknown_2A98;
    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows.shows);
    if (gUnknown_03005D38.var0 != -1) {
        show->bravoTrainer.var13_5 = a0;
        show->bravoTrainer.contestCategory = gScriptContestCategory;
        show->bravoTrainer.contestRank = gScriptContestRank;
        show->bravoTrainer.species = GetMonData(&gPlayerParty[gUnknown_02038694], MON_DATA_SPECIES, NULL);
        GetMonData(&gPlayerParty[gUnknown_02038694], MON_DATA_NICKNAME, show->bravoTrainer.pokemonNickname);
    }
}

void sub_80BE320(void) {
    TVShow *show;
    show = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
    show->bravoTrainerTower.var00 = TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE;
    show->bravoTrainerTower.var01 = 1;
    StringCopy(show->bravoTrainerTower.trainerName, gSaveBlock2.playerName);
    StringCopy(show->bravoTrainerTower.pokemonName, gSaveBlock2.filler_A8.filler_3DC);
    show->bravoTrainerTower.species = gSaveBlock2.filler_A8.var_480;
    show->bravoTrainerTower.winningMove = gSaveBlock2.filler_A8.var_482;
    show->bravoTrainerTower.var16 = sub_8135D3C(gSaveBlock2.filler_A8.var_4D0);
    show->bravoTrainerTower.var1c = gSaveBlock2.filler_A8.var_4AD;
    if (gSaveBlock2.filler_A8.var_4D0 == 0) {
        show->bravoTrainerTower.btLevel = 50;
    } else {
        show->bravoTrainerTower.btLevel = 100;
    }
    show->bravoTrainerTower.var1b = gSpecialVar_0x8004;
    sub_80BE160(show);
    show->bravoTrainerTower.language = GAME_LANGUAGE;
}

void sub_80BE3BC(void) {
    u8 rval;
    TVShow *tvShow;
    u8 i;

    rval = sub_80BF77C(0x5555);
    if (rval == 0) {
        gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows.shows);
        if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_SMART_SHOPPER) != 1) {
            sub_80BF20C();
            if (gUnknown_02038724[0].item_amount >= 20) {
                tvShow = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
                tvShow->smartshopperShow.var00 = TVSHOW_SMART_SHOPPER;
                tvShow->smartshopperShow.var01 = rval;
                tvShow->smartshopperShow.shopLocation = gMapHeader.name;
                for (i=0; i<3; i++) {
                    tvShow->smartshopperShow.itemIds[i] = gUnknown_02038724[i].item_id;
                    tvShow->smartshopperShow.itemAmounts[i] = gUnknown_02038724[i].item_amount;
                }
                tvShow->smartshopperShow.priceReduced = GetPriceReduction(1);
                StringCopy(tvShow->smartshopperShow.playerName, gSaveBlock2.playerName);
                sub_80BE138(tvShow);
                tvShow->smartshopperShow.language = GAME_LANGUAGE;
            }
        }
    }
}

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
    tvShow->nameRaterShow.pokemonNameLanguage = sub_80BDEAC(tvShow->nameRaterShow.pokemonName);

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
    tvShow->fanclubLetter.language = GAME_LANGUAGE;
}

void sub_80BE65C(void)
{
    TVShow *tvShow;

    tvShow = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];

    tvShow->recentHappenings.var00 = TVSHOW_RECENT_HAPPENINGS;
    tvShow->recentHappenings.var01 = 1;
    StringCopy(tvShow->recentHappenings.playerName, gSaveBlock2.playerName);
    tvShow->recentHappenings.var02 = 0;

    sub_80BE160(tvShow);
    tvShow->recentHappenings.language = GAME_LANGUAGE;
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


    StringCopy(tvShow->fanclubOpinions.playerName, gSaveBlock2.playerName);

    GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_NICKNAME, tvShow->fanclubOpinions.var10);

    tvShow->fanclubOpinions.var02 = GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SPECIES, NULL);
    sub_80BE160(tvShow);
    tvShow->fanclubOpinions.language = GAME_LANGUAGE;
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

        tvShow->massOutbreak.language = GAME_LANGUAGE;
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
            if (gSaveBlock1.tvShows.shows[showidx].massOutbreak.var00 == TVSHOW_MASS_OUTBREAK && gSaveBlock1.tvShows.shows[showidx].massOutbreak.var01 == 0x01) {
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

void sub_80BE9D4()
{
    TVShow *show;
    gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows.shows);
    if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_FISHING_ADVICE) != 1) {
        show = &(gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0]);
#ifdef NONMATCHING
        show->pokemonAngler.var00 = TVSHOW_FISHING_ADVICE;
        show->pokemonAngler.var01 = 0;
#else
        asm(".syntax unified\n\
        movs r1, 0\n\
        movs r0, 24\n\
        strb r0, [r4]\n\
        strb r1, [r4, 1]\n\
        .syntax divided\n");
#endif
        show->pokemonAngler.var02 = gUnknown_020387E2 & 0xFF;
        show->pokemonAngler.var03 = gUnknown_020387E2 >> 8;
        show->pokemonAngler.var04 = gUnknown_020387E0;
        StringCopy(show->pokemonAngler.playerName, gSaveBlock2.playerName);
        sub_80BE138(show);
        show->pokemonAngler.language = GAME_LANGUAGE;
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
    TVShow *unk_2a98;
    unk_2a98 = &gSaveBlock1.tvShows.unknown_2A98;
    if (unk_2a98->common.var00 == TVSHOW_WORLD_OF_MASTERS)
    {
        if (unk_2a98->worldOfMasters.var02 < 20)
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
    TVShow *unk_2a98;
    TVShow *tvShow;
    u8 rval;
    unk_2a98 = &gSaveBlock1.tvShows.unknown_2A98;
    rval = sub_80BF77C(0xFFFF);
    if (rval == 0)
    {
        gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows.shows);
        if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_WORLD_OF_MASTERS) != 1)
        {
            tvShow = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
            tvShow->worldOfMasters.var00 = TVSHOW_WORLD_OF_MASTERS;
            tvShow->worldOfMasters.var01 = rval;
            tvShow->worldOfMasters.var02 = unk_2a98->worldOfMasters.var02;
            tvShow->worldOfMasters.var06 = GetGameStat(GAME_STAT_STEPS) - unk_2a98->worldOfMasters.var06;
            tvShow->worldOfMasters.var04 = unk_2a98->worldOfMasters.var04;
            tvShow->worldOfMasters.var08 = unk_2a98->worldOfMasters.var08;
            tvShow->worldOfMasters.var0a = unk_2a98->worldOfMasters.var0a;
            StringCopy(tvShow->worldOfMasters.playerName, gSaveBlock2.playerName);
            sub_80BE138(tvShow);
            tvShow->worldOfMasters.language = GAME_LANGUAGE;
        }
    }
}

int sub_80BEBC8(struct UnknownSaveStruct2ABC *arg0);
void sub_80BEC10(u8);
void sub_80BF588(TVShow tvShows[]);
void sub_80BF6D8(void);
bool8 sub_80BF77C(u16);
bool8 sub_80BEE48(u8);

bool8 IsPriceDiscounted(u8);

void sub_80BEB20(void) {
    u16 rval;
    struct SaveBlock1 *save;
    struct UnknownSaveStruct2ABC *unk2abc;
    if (FlagGet(SYS_GAME_CLEAR) != 0) {
        unk2abc = gSaveBlock1.unknown_2ABC;
        gUnknown_03005D38.var0 = sub_80BEBC8(unk2abc);
        if (gUnknown_03005D38.var0 != -1 && sub_80BF77C(0x28f) != 1) {
            rval = (Random() % 3) + 1;
            if (sub_80BEE48(rval) != 1) {
                save = &gSaveBlock1;
                save->unknown_2ABC[gUnknown_03005D38.var0].val0 = rval;
                save->unknown_2ABC[gUnknown_03005D38.var0].val2 = 4;
                save->unknown_2ABC[gUnknown_03005D38.var0].val1 = 1;
            }
        }
    }
}

int sub_80BEBC8(struct UnknownSaveStruct2ABC *arg0) {
    s8 i;
    for (i=0; i<16; i++) {
        if (arg0[i].val0 == 0) {
            return i;
        }
    }
    return -1;
}

void sub_80BEBF4(void) {
    u8 i;
    for (i=0; i<16; i++) {
        sub_80BEC10(i);
    }
}

void sub_80BEC10(u8 arg0) {
    gSaveBlock1.unknown_2ABC[arg0].val0 = 0;
    gSaveBlock1.unknown_2ABC[arg0].val1 = 0;
    gSaveBlock1.unknown_2ABC[arg0].val2 = 0;
}

void sub_80BEC40(void) {
    u8 i, j;
    for (i = 0; i < 15; i++) {
        if (gSaveBlock1.unknown_2ABC[i].val0 == 0) {
            for (j = i + 1; j < 16; j++) {
                if (gSaveBlock1.unknown_2ABC[j].val0 != 0) {
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
    for (i=0; i<16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 != 0 && gSaveBlock1.unknown_2ABC[i].val1 == 1 && gSaveBlock1.unknown_2ABC[i].val2 < 3)
        {
            return i;
        }
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
        {
            ShowFieldMessage(gTVNewsTextGroup2[gSaveBlock1.unknown_2ABC[arg0].val0]);
        }
        else
        {
            ShowFieldMessage(gTVNewsTextGroup3[gSaveBlock1.unknown_2ABC[arg0].val0]);
        }
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
    {
        return FALSE;
    }
    for (i=0; i<16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 == arg0)
        {
            if (gSaveBlock1.unknown_2ABC[i].val1 == 2 && IsPriceDiscounted(arg0) != 0)
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
    }
    return FALSE;
}

bool8 IsPriceDiscounted(u8 arg0)
{
    switch (arg0)
    {
    case 1:
        if (gSaveBlock1.location.mapGroup == MAP_GROUP_SLATEPORT_CITY && gSaveBlock1.location.mapNum == MAP_ID_SLATEPORT_CITY && gScriptLastTalked == 0x1a)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
        break;
    case 3:
        if (gSaveBlock1.location.mapGroup == MAP_GROUP_LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP && gSaveBlock1.location.mapNum == MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
        break;
    default:
        return TRUE;
    }
}

bool8 sub_80BEE48(u8 arg0)
{
    u8 i;
    if (arg0 == 0)
    {
        return TRUE;
    }
    else
    {
        for (i=0; i<16; i++)
        {
            if (gSaveBlock1.unknown_2ABC[i].val0 == arg0)
            {
                return TRUE;
            }
        }
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
                {
                    gSaveBlock1.unknown_2ABC[i].val1 = 1;
                }
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
    TVShow *tvShow;
    tvShow = &gSaveBlock1.tvShows.shows[gSpecialVar_0x8004];
    CopyContestCategoryToStringVar(1, tvShow->bravoTrainer.contestCategory);
}

void sub_80BF088(u8 arg0, s32 price)
{
    size_t log10val;
    log10val = sub_80BF0B8(price);
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
    for (i=0; i<3; i++)
    {
        if (arg1->itemIds[i])
        {
            price += ItemId_GetPrice(arg1->itemIds[i]) * arg1->itemAmounts[i];
        }
    }
    if (arg1->priceReduced == 1)
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
    sub_80BF25C(TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE);
    if (gScriptResult == 0) {
        show = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
        sub_80EB6FC(show->bravoTrainer.var04, 2);
    }
}

void sub_80BF4BC(void)
{
    TVShow *show;
    sub_80BF25C(TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE);
    if (gScriptResult == 0) {
        show = &gSaveBlock1.tvShows.shows[gUnknown_03005D38.var0];
        sub_80EB6FC(show->bravoTrainerTower.var18, 1); // wrong struct ident, fix later
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

void sub_80BF79C(TVShow *arg0)
{
    u8 i = Random() % 6;
    while (1) {
        if (i == 6)
            i = 0;
        if (arg0->recentHappenings.var04[i] != 0xFFFF)
            break;
        i ++;
    }
    sub_80EB3FC(gStringVar3, arg0->recentHappenings.var04[i]);
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
NAKED
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
s8 sub_80C019C(TVShow tvShows[]);
bool8 sub_80BFF68(struct SaveTVStruct ** tv1, struct SaveTVStruct ** tv2, u8 idx);
u8 sub_80C004C(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C00B4(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C0134(TVShow *tv1, TVShow *tv2, u8 idx);

void sub_80BFE24(struct SaveTVStruct *arg0, struct SaveTVStruct *arg1, struct SaveTVStruct *arg2, struct SaveTVStruct *arg3)
{
    u8 i, j;
    struct SaveTVStruct ** argslist[4];
    argslist[0] = &arg0;
    argslist[1] = &arg1;
    argslist[2] = &arg2;
    argslist[3] = &arg3;
    gUnknown_03000720 = GetLinkPlayerCount();
    while (1) {
        for (i=0; i<gUnknown_03000720; i++) {
            if (i == 0)
                gUnknown_020387E4 = i;
            gUnknown_03000722 = sub_80C019C(argslist[i][0]->shows);
            if (gUnknown_03000722 == -1) {
                gUnknown_020387E4++;
                if (gUnknown_020387E4 == gUnknown_03000720)
                    return;
            } else {
                for (j=0; j<gUnknown_03000720-1; j++) {
                    gUnknown_03005D38.var0 = sub_80BF74C(argslist[(i + j + 1) % gUnknown_03000720][0]->shows);
                    if (gUnknown_03005D38.var0 != -1 && sub_80BFF68(argslist[(i + j + 1) % gUnknown_03000720], argslist[i], (i + j + 1) % gUnknown_03000720) == 1) {
                        break;
                    }
                }
                if (j == gUnknown_03000720 - 1) {
                    sub_80BF55C(argslist[i][0]->shows, gUnknown_03000722);
                }
            }
        }
    }
}

#ifdef NONMATCHING
bool8 sub_80BFF68(struct SaveTVStruct ** arg1, struct SaveTVStruct ** arg2, u8 idx) {
    u8 value;
    u8 switchval;
    struct SaveTVStruct *tv1;
    struct SaveTVStruct *tv2;
    tv1 = *arg1;
    tv2 = *arg2;
    value = FALSE;
    switchval = sub_80BFB54(tv2->shows[gUnknown_03000722].common.var00);
    switch (switchval) {
    case 2:
        value = sub_80C004C(&tv1->shows[gUnknown_03005D38.var0], &tv2->shows[gUnknown_03000722], idx);
        break;
    case 3:
        value = sub_80C00B4(&tv1->shows[gUnknown_03005D38.var0], &tv2->shows[gUnknown_03000722], idx);
        break;
    case 4:
        value = sub_80C0134(&tv1->shows[gUnknown_03005D38.var0], &tv2->shows[gUnknown_03000722], idx);
        break;
    }
    if (value == TRUE) {
        sub_80BF55C(tv2->shows, gUnknown_03000722);
        return TRUE;
    } else {
        return FALSE;
    }
}
#else
NAKED
bool8 sub_80BFF68(struct SaveTVStruct ** arg1, struct SaveTVStruct ** arg2, u8 idx) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	sub sp, 0x4\n\
	lsls r2, 24\n\
	lsrs r7, r2, 24\n\
	ldr r4, [r0]\n\
	ldr r6, [r1]\n\
	movs r5, 0\n\
	ldr r2, _080BFFA4 @ =gUnknown_03000722\n\
	movs r1, 0\n\
	ldrsb r1, [r2, r1]\n\
	lsls r0, r1, 3\n\
	adds r0, r1\n\
	lsls r0, 2\n\
	adds r0, r6 @ this is the only mimsmatch\n\
	ldrb r0, [r0]\n\
	str r2, [sp]\n\
	bl sub_80BFB54\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	adds r1, r0, 0\n\
	ldr r2, [sp]\n\
	cmp r0, 0x3\n\
	beq _080BFFD8\n\
	cmp r0, 0x3\n\
	bgt _080BFFA8\n\
	cmp r0, 0x2\n\
	beq _080BFFAE\n\
	b _080C0026\n\
	.align 2, 0\n\
_080BFFA4: .4byte gUnknown_03000722\n\
_080BFFA8:\n\
	cmp r1, 0x4\n\
	beq _080C0000\n\
	b _080C0026\n\
_080BFFAE:\n\
	ldr r0, _080BFFD4 @ =gUnknown_03005D38\n\
	movs r1, 0\n\
	ldrsb r1, [r0, r1]\n\
	lsls r0, r1, 3\n\
	adds r0, r1\n\
	lsls r0, 2\n\
	adds r0, r4, r0\n\
	ldrb r2, [r2]\n\
	lsls r2, 24\n\
	asrs r2, 24\n\
	lsls r1, r2, 3\n\
	adds r1, r2\n\
	lsls r1, 2\n\
	adds r1, r6, r1\n\
	adds r2, r7, 0\n\
	bl sub_80C004C\n\
	b _080C0022\n\
	.align 2, 0\n\
_080BFFD4: .4byte gUnknown_03005D38\n\
_080BFFD8:\n\
	ldr r0, _080BFFFC @ =gUnknown_03005D38\n\
	movs r1, 0\n\
	ldrsb r1, [r0, r1]\n\
	lsls r0, r1, 3\n\
	adds r0, r1\n\
	lsls r0, 2\n\
	adds r0, r4, r0\n\
	ldrb r2, [r2]\n\
	lsls r2, 24\n\
	asrs r2, 24\n\
	lsls r1, r2, 3\n\
	adds r1, r2\n\
	lsls r1, 2\n\
	adds r1, r6, r1\n\
	adds r2, r7, 0\n\
	bl sub_80C00B4\n\
	b _080C0022\n\
	.align 2, 0\n\
_080BFFFC: .4byte gUnknown_03005D38\n\
_080C0000:\n\
	ldr r0, _080C0030 @ =gUnknown_03005D38\n\
	movs r1, 0\n\
	ldrsb r1, [r0, r1]\n\
	lsls r0, r1, 3\n\
	adds r0, r1\n\
	lsls r0, 2\n\
	adds r0, r4, r0\n\
	ldrb r2, [r2]\n\
	lsls r2, 24\n\
	asrs r2, 24\n\
	lsls r1, r2, 3\n\
	adds r1, r2\n\
	lsls r1, 2\n\
	adds r1, r6, r1\n\
	adds r2, r7, 0\n\
	bl sub_80C0134\n\
_080C0022:\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
_080C0026:\n\
	cmp r5, 0x1\n\
	beq _080C0034\n\
	movs r0, 0\n\
	b _080C0040\n\
	.align 2, 0\n\
_080C0030: .4byte gUnknown_03005D38\n\
_080C0034:\n\
	ldr r0, _080C0048 @ =gUnknown_03000722\n\
	ldrb r1, [r0]\n\
	adds r0, r6, 0\n\
	bl sub_80BF55C\n\
	movs r0, 0x1\n\
_080C0040:\n\
	add sp, 0x4\n\
	pop {r4-r7}\n\
	pop {r1}\n\
	bx r1\n\
	.align 2, 0\n\
_080C0048: .4byte gUnknown_03000722\n\
.syntax divided\n");
}
#endif

u8 sub_80C004C(TVShow *tv1, TVShow *tv2, u8 idx) {
    u32 linkTrainerId = GetLinkPlayerTrainerId(idx);
    if ((linkTrainerId & 0xFF) == tv2->common.trainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.trainerIdHi) {
        return FALSE;
    }
    tv2->common.trainerIdLo = tv2->common.srcTrainerIdLo;
    tv2->common.trainerIdHi = tv2->common.srcTrainerIdHi;
    tv2->common.srcTrainerIdLo = linkTrainerId & 0xFF;
    tv2->common.srcTrainerIdHi = linkTrainerId >> 8;
    *tv1 = *tv2;
    tv1->common.var01 = 1;
    return TRUE;
}

u8 sub_80C00B4(TVShow *tv1, TVShow *tv2, u8 idx) {
    u32 linkTrainerId = GetLinkPlayerTrainerId(idx);
    if ((linkTrainerId & 0xFF) == tv2->common.srcTrainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.srcTrainerIdHi) {
        return FALSE;
    }
    if ((linkTrainerId & 0xFF) == tv2->common.trainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.trainerIdHi) {
        return FALSE;
    }
    tv2->common.srcTrainerIdLo = tv2->common.srcTrainerId2Lo;
    tv2->common.srcTrainerIdHi = tv2->common.srcTrainerId2Hi;
    tv2->common.srcTrainerId2Lo = linkTrainerId & 0xFF;
    tv2->common.srcTrainerId2Hi = linkTrainerId >> 8;
    *tv1 = *tv2;
    tv1->common.var01 = 1;
    return TRUE;
}

u8 sub_80C0134(TVShow *tv1, TVShow *tv2, u8 idx) {
    u32 linkTrainerId = GetLinkPlayerTrainerId(idx);
    if ((linkTrainerId & 0xFF) == tv2->common.trainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.trainerIdHi) {
        return FALSE;
    }
    tv2->common.trainerIdLo = tv2->common.srcTrainerIdLo;
    tv2->common.trainerIdHi = tv2->common.srcTrainerIdHi;
    tv2->common.srcTrainerIdLo = linkTrainerId & 0xFF;
    tv2->common.srcTrainerIdHi = linkTrainerId >> 8;
    *tv1 = *tv2;
    tv1->common.var01 = 1;
    tv1->common.var16[0] = 1;
    return TRUE;
}

s8 sub_80C019C(TVShow tvShows[]) {
    u8 i;
    for (i=0; i<24; i++) {
        if (tvShows[i].common.var01 == 0 && (u8)(tvShows[i].common.var00 - 1) < 60) {
            return i;
        }
    }
    return -1;
}

void sub_80C03A8(u8 showidx);
void sub_80C03C8(u16 species, u8 showidx);

#ifdef NONMATCHING
void sub_80C01D4(void) {
    u8 i;
    for (i=0; i<24; i++) {
        switch (gSaveBlock1.tvShows.shows[i].common.var00) {
        case 0:
            break;
        case TVSHOW_FAN_CLUB_LETTER:
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].fanclubLetter.species, i);
            break;
        case TVSHOW_RECENT_HAPPENINGS:
            break;
        case TVSHOW_PKMN_FAN_CLUB_OPINIONS:
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].fanclubOpinions.var02, i);
            break;
        case TVSHOW_UNKN_SHOWTYPE_04:
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].worldOfMasters.var06, i);
            break;
        case TVSHOW_NAME_RATER_SHOW:
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].nameRaterShow.species, i);
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].nameRaterShow.var1C, i);
            break;
        case TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE:
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].bravoTrainer.species, i);
            break;
        case TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE:
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].bravoTrainerTower.var0a, i);
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].bravoTrainerTower.var14, i);
            break;
        case TVSHOW_POKEMON_TODAY_CAUGHT:
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].pokemonToday.species, i);
            break;
        case TVSHOW_SMART_SHOPPER:
            break;
        case TVSHOW_POKEMON_TODAY_FAILED:
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].pokemonTodayFailed.species, i);
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].pokemonTodayFailed.species2, i);
            break;
        case TVSHOW_FISHING_ADVICE:
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].pokemonAngler.var04, i);
            break;
        case TVSHOW_WORLD_OF_MASTERS:
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].worldOfMasters.var08, i);
            sub_80C03C8(gSaveBlock1.tvShows.shows[i].worldOfMasters.var04, i);
            break;
        case TVSHOW_MASS_OUTBREAK:
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

void sub_80C03A8(u8 showidx) {
    gSaveBlock1.tvShows.shows[showidx].common.var01 = 0;
}

void sub_80C03C8(u16 species, u8 showidx) {
    if (sub_8090D90(SpeciesToNationalPokedexNum(species), 0) == 0) {
        gSaveBlock1.tvShows.shows[showidx].common.var01 = 0;
    }
}

#ifdef NONMATCHING
void sub_80C0408(void) {
    u16 i;
    if (FlagGet(SYS_GAME_CLEAR) != 1) {
        for (i=0; i<24; i++) {
            if (gSaveBlock1.tvShows.shows[i].common.var00 == TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE || gSaveBlock1.tvShows.shows[i].common.var00 == TVSHOW_MASS_OUTBREAK) {
                gSaveBlock1.tvShows.shows[i].common.var01 = 0;
            }
        }
    }
}
#else
NAKED
void sub_80C0408(void) {
    asm(".syntax unified\n\
	push {r4-r6,lr}\n\
	ldr r0, _080C044C @ =0x00000804\n\
	bl FlagGet\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0x1\n\
	beq _080C0444\n\
	movs r2, 0\n\
	ldr r6, _080C0450 @ =gSaveBlock1\n\
	ldr r4, _080C0454 @ =0x00002739\n\
	movs r3, 0\n\
	ldr r5, _080C0458 @ =0x00002738\n\
_080C0422:\n\
	lsls r0, r2, 3\n\
	adds r0, r2\n\
	lsls r0, 2\n\
	adds r1, r0, r6\n\
	adds r0, r1, r5\n\
	ldrb r0, [r0]\n\
	cmp r0, 0x7\n\
	beq _080C0436\n\
	cmp r0, 0x29\n\
	bne _080C043A\n\
_080C0436:\n\
	adds r0, r1, r4\n\
	strb r3, [r0]\n\
_080C043A:\n\
	adds r0, r2, 0x1\n\
	lsls r0, 16\n\
	lsrs r2, r0, 16\n\
	cmp r2, 0x17\n\
	bls _080C0422\n\
_080C0444:\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080C044C: .4byte 0x00000804\n\
_080C0450: .4byte gSaveBlock1\n\
_080C0454: .4byte 0x00002739\n\
_080C0458: .4byte 0x00002738\n\
.syntax divided\n");
}
#endif

void sub_80C045C(void) {
    u8 i;
    for (i=0; i<5; i++) {
        if (sub_80BFB54(gSaveBlock1.tvShows.shows[i].common.var00) == 2) {
            gSaveBlock1.tvShows.shows[i].common.var01 = 0;
        }
    }
}

asm(".section .dotvshow\n");

void DoTVShowPokemonFanClubLetter(void);
void DoTVShowRecentHappenings(void);
void DoTVShowPokemonFanClubOpinions(void);
void nullsub_22(void);
void DoTVShowPokemonNewsMassOutbreak(void);
void DoTVShowBravoTrainerPokemonProfile(void);
void DoTVShowBravoTrainerBattleTowerProfile(void);
void DoTVShowPokemonTodaySuccessfulCapture(void);
void DoTVShowTodaysSmartShopper(void);
void DoTVShowTheNameRaterShow(void);
void DoTVShowPokemonTodayFailedCapture(void);
void DoTVShowPokemonAngler(void);
void DoTVShowTheWorldOfMasters(void);

bool8 sub_80C06E8(struct UnknownSaveStruct2ABC *arg0, struct UnknownSaveStruct2ABC *arg1, s8 arg2);

void sub_80C06BC(int *arg0, int *arg1) {
    struct UnknownSaveStruct2ABC *str0;
    struct UnknownSaveStruct2ABC *str1;
    str0 = (void *)arg0[0];
    str1 = (void *)arg1[0];
    str1 += gUnknown_03000722;
    sub_80C06E8(str0, str1, gUnknown_03005D38.var0);
}

bool8 sub_80C06E8(struct UnknownSaveStruct2ABC *arg0, struct UnknownSaveStruct2ABC *arg1, s8 arg2) {
    u8 i;
    if (arg1->val0 == 0) {
        return FALSE;
    }
    for (i=0; i<16; i++) {
        if (arg0[i].val0 == arg1->val0) {
            return FALSE;
        }
    }
    arg0[arg2].val0 = arg1->val0;
    arg0[arg2].val1 = 1;
    arg0[arg2].val2 = arg1->val2;
    return TRUE;
}

s8 sub_80C0730(struct UnknownSaveStruct2ABC *arg0, u8 arg1) {
    if (arg0[arg1].val0 == 0) {
        return -1;
    }
    return arg1;
}

void sub_80C0750(void) {
    u8 i;
    for (i=0; i<16; i++) {
        if (gSaveBlock1.unknown_2ABC[i].val0 > 3) {
            sub_80BEC10(i);
        }
    }
    sub_80BEC40();
}

void sub_80C0788(void) {
    u8 i;
    if (FlagGet(SYS_GAME_CLEAR) != 1) {
        for (i=0; i<16; i++) {
            gSaveBlock1.unknown_2ABC[i].val1 = 0;
        }
    }
}

void DoTVShow(void) {
    if (gSaveBlock1.tvShows.shows[gSpecialVar_0x8004].common.var01 != 0) {
        switch (gSaveBlock1.tvShows.shows[gSpecialVar_0x8004].common.var00) {
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

void TVShowConvertInternationalString(u8 *dest, u8 *src, u8 language) {
    StringCopy(dest, src);
    if (language < LANGUAGE_ENGLISH) {
        ConvertInternationalString(dest, LANGUAGE_JAPANESE);
    }
}

asm(".section .text_c");

void TVShowConvertInternationalString(u8 *, u8 *, u8);

void TakeTVShowInSearchOfTrainersOffTheAir(void);

void DoTVShowTheNameRaterShow(void) {
    TVShow *tvShow;
    u8 switchval;
    tvShow = &gSaveBlock1.tvShows.shows[gSpecialVar_0x8004];
    gScriptResult = 0;
    switchval = gUnknown_020387E8;
    switch (switchval) {
    case 0:
        TVShowConvertInternationalString(gStringVar1, tvShow->nameRaterShow.trainerName, tvShow->nameRaterShow.language);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->nameRaterShow.species]);
        TVShowConvertInternationalString(gStringVar3, tvShow->nameRaterShow.pokemonName, tvShow->nameRaterShow.pokemonNameLanguage);
        gUnknown_020387E8 = sub_80BF7E8(&tvShow->nameRaterShow) + 1;
        break;
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
        if (tvShow->nameRaterShow.random == 0) {
            gUnknown_020387E8 = 9;
        } else if (tvShow->nameRaterShow.random == 1) {
            gUnknown_020387E8 = 10;
        } else if (tvShow->nameRaterShow.random == 2) {
            gUnknown_020387E8 = 11;
        }
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, tvShow->nameRaterShow.trainerName, tvShow->nameRaterShow.language);
        if (tvShow->nameRaterShow.random == 0) {
            gUnknown_020387E8 = 9;
        } else if (tvShow->nameRaterShow.random == 1) {
            gUnknown_020387E8 = 10;
        } else if (tvShow->nameRaterShow.random == 2) {
            gUnknown_020387E8 = 11;
        }
        break;
    case 9:
    case 10:
    case 11:
        sub_80BF820(0, 1, 0, 1, 0, &tvShow->nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, tvShow->nameRaterShow.pokemonNameLanguage);
        sub_80BF820(0, 0, 0, 1, 0, &tvShow->nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, tvShow->nameRaterShow.pokemonNameLanguage);
        TVShowConvertInternationalString(gStringVar1, tvShow->nameRaterShow.pokemonName, tvShow->nameRaterShow.pokemonNameLanguage);
        gUnknown_020387E8 = 12;
        break;
    case 13:
        sub_80BF820(0, 0, 3, 1, 0, &tvShow->nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, tvShow->nameRaterShow.pokemonNameLanguage);
        sub_80BF820(0, 0, 2, 0, 0, &tvShow->nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, tvShow->nameRaterShow.language);
        TVShowConvertInternationalString(gStringVar1, tvShow->nameRaterShow.trainerName, tvShow->nameRaterShow.language);
        gUnknown_020387E8 = 14;
        break;
    case 14:
        sub_80BF820(0, 0, 3, 0, 0, &tvShow->nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, tvShow->nameRaterShow.language);
        sub_80BF820(0, 0, 2, 1, 0, &tvShow->nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, tvShow->nameRaterShow.pokemonNameLanguage);
        TVShowConvertInternationalString(gStringVar1, tvShow->nameRaterShow.trainerName, tvShow->nameRaterShow.language);
        gUnknown_020387E8 = 18;
        break;
    case 15:
        sub_80BF820(1, 0, 2, 1, 0, &tvShow->nameRaterShow);
        TVShowConvertInternationalString(gStringVar1, gStringVar2, tvShow->nameRaterShow.pokemonNameLanguage);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->nameRaterShow.species]);
        sub_80BF820(2, 0, 3, 2, tvShow->nameRaterShow.species, &tvShow->nameRaterShow);
        gUnknown_020387E8 = 16;
        break;
    case 16:
        sub_80BF820(0, 0, 3, 1, 0, &tvShow->nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, tvShow->nameRaterShow.pokemonNameLanguage);
        sub_80BF820(0, 0, 2, 2, tvShow->nameRaterShow.species, &tvShow->nameRaterShow);
        gUnknown_020387E8 = 17;
        break;
    case 17:
        sub_80BF820(1, 0, 2, 1, 0, &tvShow->nameRaterShow);
        TVShowConvertInternationalString(gStringVar1, gStringVar2, tvShow->nameRaterShow.pokemonNameLanguage);
        sub_80BF820(2, 0, 3, 2, tvShow->nameRaterShow.var1C, &tvShow->nameRaterShow);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->nameRaterShow.var1C]);
        gUnknown_020387E8 = 18;
        break;
    case 12:
        switchval = 18;
        gUnknown_020387E8 = 18;
    case 18:
        TVShowConvertInternationalString(gStringVar1, tvShow->nameRaterShow.pokemonName, tvShow->nameRaterShow.pokemonNameLanguage);
        TVShowConvertInternationalString(gStringVar2, tvShow->nameRaterShow.trainerName, tvShow->nameRaterShow.language);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVNameRaterTextGroup[switchval]);
}

void DoTVShowPokemonTodaySuccessfulCapture(void) {
    TVShow *tvShow;
    u8 switchval;
    tvShow = &gSaveBlock1.tvShows.shows[gSpecialVar_0x8004];
    gScriptResult = 0;
    switchval = gUnknown_020387E8;
    switch (switchval) {
    case 0:
        TVShowConvertInternationalString(gStringVar1, tvShow->pokemonToday.playerName, tvShow->pokemonToday.language);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->pokemonToday.species]);
        TVShowConvertInternationalString(gStringVar3, tvShow->pokemonToday.nickname, tvShow->pokemonToday.language2);
        if (tvShow->pokemonToday.ball == ITEM_MASTER_BALL) {
            gUnknown_020387E8 = 5;
        } else {
            gUnknown_020387E8 = 1;
        }
        break;
    case 1:
        gUnknown_020387E8 = 2;
        break;
    case 2:
        StringCopy(gStringVar2, ItemId_GetItem(tvShow->pokemonToday.ball)->name);
        sub_80BF088(2, tvShow->pokemonToday.var12);
        if (tvShow->pokemonToday.var12 < 4) {
            gUnknown_020387E8 = 3;
        } else {
            gUnknown_020387E8 = 4;
        }
        break;
    case 3:
        TVShowConvertInternationalString(gStringVar1, tvShow->pokemonToday.playerName, tvShow->pokemonToday.language);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->pokemonToday.species]);
        TVShowConvertInternationalString(gStringVar3, tvShow->pokemonToday.nickname, tvShow->pokemonToday.language2);
        gUnknown_020387E8 = 6;
        break;
    case 4:
        gUnknown_020387E8 = 6;
        break;
    case 5:
        TVShowConvertInternationalString(gStringVar1, tvShow->pokemonToday.playerName, tvShow->pokemonToday.language);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->pokemonToday.species]);
        gUnknown_020387E8 = 6;
        break;
    case 6:
        TVShowConvertInternationalString(gStringVar1, tvShow->pokemonToday.playerName, tvShow->pokemonToday.language);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->pokemonToday.species]);
        TVShowConvertInternationalString(gStringVar3, tvShow->pokemonToday.nickname, tvShow->pokemonToday.language2);
        gUnknown_020387E8 += (Random() % 4) + 1;
        break;
    case 7:
    case 8:
        StringCopy(gStringVar1, gSpeciesNames[tvShow->pokemonToday.species]);
        TVShowConvertInternationalString(gStringVar2, tvShow->pokemonToday.nickname, tvShow->pokemonToday.language2);
        sub_80BF638(2, tvShow->pokemonToday.species);
        gUnknown_020387E8 = 11;
        break;
    case 9:
    case 10:
        StringCopy(gStringVar1, gSpeciesNames[tvShow->pokemonToday.species]);
        TVShowConvertInternationalString(gStringVar2, tvShow->pokemonToday.nickname, tvShow->pokemonToday.language2);
        gUnknown_020387E8 = 11;
        break;
    case 11:
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVPokemonTodayTextGroup[switchval]);
}

void DoTVShowPokemonTodayFailedCapture(void) {
    TVShow *tvShow;
    u8 switchval;
    u16 rval;
    tvShow = &gSaveBlock1.tvShows.shows[gSpecialVar_0x8004];
    gScriptResult = 0;
    switchval = gUnknown_020387E8;
    switch (switchval) {
    case 0:
        TVShowConvertInternationalString(gStringVar1, tvShow->pokemonTodayFailed.playerName, tvShow->pokemonTodayFailed.language);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->pokemonTodayFailed.species]);
        gUnknown_020387E8 = 1;
        break;
    case 1:
        TVShowConvertInternationalString(gStringVar1, tvShow->pokemonTodayFailed.playerName, tvShow->pokemonTodayFailed.language);
        sub_80FBFB4(gStringVar2, tvShow->pokemonTodayFailed.var12, 0);
        StringCopy(gStringVar3, gSpeciesNames[tvShow->pokemonTodayFailed.species2]);
        if (tvShow->pokemonTodayFailed.var11 == 1) {
            gUnknown_020387E8 = 3;
        } else {
            gUnknown_020387E8 = 2;
        }
        break;
    case 2:
    case 3:
        TVShowConvertInternationalString(gStringVar1, tvShow->pokemonTodayFailed.playerName, tvShow->pokemonTodayFailed.language);
        sub_80BF088(1, tvShow->pokemonTodayFailed.var10);
        rval = (Random() % 3);
        if (rval == 0) {
            gUnknown_020387E8 = 5;
        } else {
            gUnknown_020387E8 = 4;
        }
        break;
    case 4:
    case 5:
        TVShowConvertInternationalString(gStringVar1, tvShow->pokemonTodayFailed.playerName, tvShow->pokemonTodayFailed.language);
        gUnknown_020387E8 = 6;
        break;
    case 6:
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVPokemonTodayFailedCaptureTextGroup[switchval]);
}

void DoTVShowPokemonFanClubLetter(void) {
    TVShow *tvShow;
    u8 switchval;
    u16 rval;
    tvShow = &gSaveBlock1.tvShows.shows[gSpecialVar_0x8004];
    gScriptResult = 0;
    switchval = gUnknown_020387E8;
    switch (switchval) {
    case 0:
        TVShowConvertInternationalString(gStringVar1, tvShow->fanclubLetter.playerName, tvShow->fanclubLetter.language);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->fanclubLetter.species]);
        gUnknown_020387E8 = 50;
        break;
    case 1:
        rval = (Random() % 4) + 1;
        if (rval == 1) {
            gUnknown_020387E8 = 2;
        } else {
            gUnknown_020387E8 = rval + 2;
        }
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
        sub_80BF79C(tvShow);
        gUnknown_020387E8 = 7;
        break;
    case 7:
        rval = (Random() % 0x1f) + 0x46;
        sub_80BF088(2, rval);
        TVShowDone();
        break;
    case 50:
        ConvertEasyChatWordsToString(gStringVar4, tvShow->fanclubLetter.pad04, 2, 2);
        ShowFieldMessage(gStringVar4);
        gUnknown_020387E8 = 1;
        return;
    case 51:
        ConvertEasyChatWordsToString(gStringVar4, tvShow->fanclubLetter.pad04, 2, 2);
        ShowFieldMessage(gStringVar4);
        gUnknown_020387E8 = 3;
        return;
    }
    ShowFieldMessage(gTVFanClubTextGroup[switchval]);
}

void DoTVShowRecentHappenings(void) {
    TVShow *tvShow;
    u8 switchval;
    tvShow = &gSaveBlock1.tvShows.shows[gSpecialVar_0x8004];
    gScriptResult = 0;
    switchval = gUnknown_020387E8;
    switch (switchval) {
    case 0:
        TVShowConvertInternationalString(gStringVar1, tvShow->recentHappenings.playerName, tvShow->recentHappenings.language);
        sub_80BF79C(tvShow);
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
        ConvertEasyChatWordsToString(gStringVar4, tvShow->recentHappenings.var04, 2, 2);
        ShowFieldMessage(gStringVar4);
        gUnknown_020387E8 = 1;
        return;
    }
    ShowFieldMessage(gTVRecentHappeningsTextGroup[switchval]);
}

void DoTVShowPokemonFanClubOpinions(void) {
    TVShow *tvShow;
    u8 switchval;
    tvShow = &gSaveBlock1.tvShows.shows[gSpecialVar_0x8004];
    gScriptResult = 0;
    switchval = gUnknown_020387E8;
    switch (switchval) {
    case 0:
        TVShowConvertInternationalString(gStringVar1, tvShow->fanclubOpinions.playerName, tvShow->fanclubOpinions.language);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->fanclubOpinions.var02]);
        TVShowConvertInternationalString(gStringVar3, tvShow->fanclubOpinions.var10, tvShow->fanclubOpinions.var0E);
        gUnknown_020387E8 = tvShow->fanclubOpinions.var04B + 1;
        break;
    case 1:
    case 2:
    case 3:
        TVShowConvertInternationalString(gStringVar1, tvShow->fanclubOpinions.playerName, tvShow->fanclubOpinions.language);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->fanclubOpinions.var02]);
        sub_80EB3FC(gStringVar3, tvShow->fanclubOpinions.var1C[0]);
        gUnknown_020387E8 = 4;
        break;
    case 4:
        TVShowConvertInternationalString(gStringVar1, tvShow->fanclubOpinions.playerName, tvShow->fanclubOpinions.language);
        sub_80EB3FC(gStringVar3, tvShow->fanclubOpinions.var1C[1]);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVFanClubOpinionsTextGroup[switchval]);
}

void nullsub_22(void) {

}

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

void DoTVShowInSearchOfTrainers(void) {
    u8 switchval;
    gScriptResult = 0;
    switchval = gUnknown_020387E8;
    switch (switchval) {
    case 0:
        sub_80FBFB4(gStringVar1, gSaveBlock1.gabbyAndTyData.mapnum, 0);
        if (gSaveBlock1.gabbyAndTyData.val9 > 1) {
            gUnknown_020387E8 = 1;
        } else {
            gUnknown_020387E8 = 2;
        }
        break;
    case 1:
        gUnknown_020387E8 = 2;
        break;
    case 2:
        if (gSaveBlock1.gabbyAndTyData.valA_0 == 0) {
            gUnknown_020387E8 = 4;
        } else if (gSaveBlock1.gabbyAndTyData.valA_3 != 0) {
            gUnknown_020387E8 = 5;
        } else if (gSaveBlock1.gabbyAndTyData.valA_2 != 0) {
            gUnknown_020387E8 = 6;
        } else if (gSaveBlock1.gabbyAndTyData.valA_1 != 0) {
            gUnknown_020387E8 = 7;
        } else {
            gUnknown_020387E8 = 3;
        }
        break;
    case 3:
        StringCopy(gStringVar1, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon1]);
        StringCopy(gStringVar2, gMoveNames[gSaveBlock1.gabbyAndTyData.move1]);
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
        sub_80EB3FC(gStringVar1, gSaveBlock1.gabbyAndTyData.move2);
        StringCopy(gStringVar2, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon1]);
        StringCopy(gStringVar3, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon2]);
        gScriptResult = 1;
        gUnknown_020387E8 = 0;;
        TakeTVShowInSearchOfTrainersOffTheAir();
        break;
    }
    ShowFieldMessage(gTVGabbyAndTyTextGroup[switchval]);
}

void DoTVShowPokemonAngler(void) {
    TVShow *tvShow;
    u8 switchval;
    tvShow = &gSaveBlock1.tvShows.shows[gSpecialVar_0x8004];
    gScriptResult = 0;
    if (tvShow->pokemonAngler.var02 < tvShow->pokemonAngler.var03) {
        gUnknown_020387E8 = 0;
    } else {
        gUnknown_020387E8 = 1;
    }
    switchval = gUnknown_020387E8;
    switch (switchval) {
    case 0:
        TVShowConvertInternationalString(gStringVar1, tvShow->pokemonAngler.playerName, tvShow->pokemonAngler.language);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->pokemonAngler.var04]);
        sub_80BF088(2, tvShow->pokemonAngler.var03);
        TVShowDone();
        break;
    case 1:
        TVShowConvertInternationalString(gStringVar1, tvShow->pokemonAngler.playerName, tvShow->pokemonAngler.language);
        StringCopy(gStringVar2, gSpeciesNames[tvShow->pokemonAngler.var04]);
        sub_80BF088(2, tvShow->pokemonAngler.var02);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVFishingGuruAdviceTextGroup[switchval]);
}

void DoTVShowTheWorldOfMasters(void) {
    TVShow *tvShow;
    u8 switchval;
    tvShow = &gSaveBlock1.tvShows.shows[gSpecialVar_0x8004];
    gScriptResult = 0;
    switchval = gUnknown_020387E8;
    switch (switchval) {
    case 0:
        TVShowConvertInternationalString(gStringVar1, tvShow->worldOfMasters.playerName,
                                         tvShow->worldOfMasters.language);
        sub_80BF088(1, tvShow->worldOfMasters.var06);
        sub_80BF088(2, tvShow->worldOfMasters.var02);
        gUnknown_020387E8 = 1;
        break;
    case 1:
        StringCopy(gStringVar1, gSpeciesNames[tvShow->worldOfMasters.var08]);
        gUnknown_020387E8 = 2;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, tvShow->worldOfMasters.playerName,
                                         tvShow->worldOfMasters.language);
        sub_80FBFB4(gStringVar2, tvShow->worldOfMasters.var0a, 0);
        StringCopy(gStringVar3, gSpeciesNames[tvShow->worldOfMasters.var04]);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVWorldOfMastersTextGroup[switchval]);
}

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
