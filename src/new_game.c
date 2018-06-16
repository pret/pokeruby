#include "global.h"
#include "constants/maps.h"
#include "constants/species.h"
#include "clock.h"
#include "new_game.h"
#include "battle_records.h"
#include "berry.h"
#include "contest.h"
#include "decoration_inventory.h"
#include "dewford_trend.h"
#include "easy_chat.h"
#include "event_data.h"
#include "field_specials.h"
#include "item_menu.h"
#include "lottery_corner.h"
#include "mail_data.h"
#include "mauville_man.h"
#include "play_time.h"
#include "player_pc.h"
#include "pokeblock.h"
#include "pokedex.h"
#include "pokemon_size_record.h"
#include "pokemon_storage_system.h"
#include "random.h"
#include "roamer.h"
#include "script_pokemon_80C4.h"
#include "overworld.h"
#include "rtc.h"
#include "script.h"
#include "secret_base.h"
#include "text.h"
#include "tv.h"

EWRAM_DATA u8 gDifferentSaveFile = 0;
EWRAM_DATA u8 gUnknown_020297ED = 0;

extern u8 gPlayerPartyCount;
extern u8 gUnknown_03005CE8;
extern u16 gSaveFileStatus;

extern u8 gUnknown_0819FA81[];

static const struct ContestWinner sEmptyMuseumPortrait =
{
    .nickname = {EOS},
    .trainerName = {EOS},
};

#if DEBUG
const s8 gUnknown_Debug_0823C788[][2] =
{
    { MAP_GROUP(INSIDE_OF_TRUCK),                   MAP_NUM(INSIDE_OF_TRUCK) },
    { MAP_GROUP(OLDALE_TOWN_POKEMON_CENTER_2F),     MAP_NUM(OLDALE_TOWN_POKEMON_CENTER_2F) },
    { MAP_GROUP(LITTLEROOT_TOWN),                   MAP_NUM(LITTLEROOT_TOWN) },
    { MAP_GROUP(LITTLEROOT_TOWN_BRENDANS_HOUSE_2F), MAP_NUM(LITTLEROOT_TOWN_BRENDANS_HOUSE_2F) }
};

const u8 gUnknown_Debug_0823C790[] = _("KRÖTE");
#endif

void write_word_to_mem(u32 var, u8 *dataPtr)
{
    dataPtr[0] = var;
    dataPtr[1] = var >> 8;
    dataPtr[2] = var >> 16;
    dataPtr[3] = var >> 24;
}

void copy_word_to_mem(u8 *copyTo, u8 *copyFrom)
{
    s32 i;
    for (i = 0; i < 4; i++)
        copyTo[i] = copyFrom[i];
}

void InitPlayerTrainerId(void)
{
    write_word_to_mem((Random() << 16) | Random(), gSaveBlock2.playerTrainerId);
}

// L=A isnt set here for some reason.
void SetDefaultOptions(void)
{
    gSaveBlock2.optionsTextSpeed = OPTIONS_TEXT_SPEED_MID;
    gSaveBlock2.optionsWindowFrameType = 0;
    gSaveBlock2.optionsSound = OPTIONS_SOUND_MONO;
    gSaveBlock2.optionsBattleStyle = OPTIONS_BATTLE_STYLE_SHIFT;
    gSaveBlock2.optionsBattleSceneOff = FALSE;
    gSaveBlock2.regionMapZoom = FALSE;
}

void ClearPokedexFlags(void)
{
    gUnknown_03005CE8 = 0;
    memset(&gSaveBlock2.pokedex.owned, 0, sizeof(gSaveBlock2.pokedex.owned));
    memset(&gSaveBlock2.pokedex.seen, 0, sizeof(gSaveBlock2.pokedex.seen));
}

void ResetContestAndMuseumWinners(void)
{
    s32 i;

    Contest_ResetWinners();
    for (i = 0; i < 5; i++)
        gSaveBlock1.museumPortraits[i] = sEmptyMuseumPortrait;
}

void ZeroBattleTowerData(void)
{
    CpuFill32(0, &gSaveBlock2.battleTower, sizeof(gSaveBlock2.battleTower));
}

#if DEBUG
void debug_sub_8052E04()
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (gUnknown_Debug_0823C788[i][0] == gSaveBlock1.location.mapGroup &&
            gUnknown_Debug_0823C788[i][1] == gSaveBlock1.location.mapNum)
        {
            break;
        }
    }

    i++;
    if (i >= 4)
    {
        i = 0;
    }

    Overworld_SetWarpDestination(gUnknown_Debug_0823C788[i][0], gUnknown_Debug_0823C788[i][1], -1, -1, -1);
}
#endif

void WarpToTruck(void)
{
    Overworld_SetWarpDestination(MAP_GROUP(INSIDE_OF_TRUCK), MAP_NUM(INSIDE_OF_TRUCK), -1, -1, -1);
    WarpIntoMap();
}

void ClearSav2(void)
{
    CpuFill16(0, &gSaveBlock2, sizeof(gSaveBlock2));
    SetDefaultOptions();
}

void sub_8052E4C(void)
{
    gDifferentSaveFile = 0;
#if DEBUG
    gUnknown_020297ED = 0;
#endif
    sub_808C0A0();
    ZeroPlayerPartyMons();
    ZeroEnemyPartyMons();
    ResetBagScrollPositions();
}

void NewGameInitData(void)
{
    if (gSaveFileStatus == 0 || gSaveFileStatus == 2)
        RtcReset();

    gDifferentSaveFile = 1;
    ZeroPlayerPartyMons();
    ZeroEnemyPartyMons();
    ResetPokedex();
    ZeroBattleTowerData();
    memset(&gSaveBlock1, 0, sizeof(gSaveBlock1));
    ClearMailData();
    gSaveBlock2.specialSaveWarp = 0;
    InitPlayerTrainerId();
    PlayTimeCounter_Reset();
    ClearPokedexFlags();
    InitEventData();
    ClearTVShowData();
    ResetGabbyAndTy();
    ResetSecretBases();
    ClearBerryTrees();
    gSaveBlock1.money = 3000;
    ResetLinkContestBoolean();
    ResetGameStats();
    ResetContestAndMuseumWinners();
    InitLinkBattleRecords();
    InitShroomishSizeRecord();
    InitBarboachSizeRecord();
    gPlayerPartyCount = 0;
    ZeroPlayerPartyMons();
    ResetPokemonStorageSystem();
    ClearRoamerData();
    ClearRoamerLocationData();
    gSaveBlock1.registeredItem = 0;
    ClearBag();
    NewGameInitPCItems();
    ClearPokeblocks();
    ClearDecorationInventories();
    InitEasyChatPhrases();
    SetupMauvilleOldMan();
    InitDewfordTrend();
    ResetFanClub();
    ResetLotteryCorner();
    WarpToTruck();
    ScriptContext2_RunNewScript(gUnknown_0819FA81);
}

#if DEBUG
extern void debug_sub_80A3904(void);
extern void debug_sub_80A3714(void);
extern void debug_sub_8120F98(void);
extern void unref_sub_8070F90(void);

void debug_sub_8057508(bool32 arg0)
{
    gUnknown_020297ED = 1;
    NewGameInitData();
    gSaveBlock1.money = 999999;
    FlagSet(FLAG_SYS_POKEMON_GET);
    FlagSet(FLAG_SYS_POKEDEX_GET);
    FlagSet(FLAG_SYS_POKENAV_GET);
    FlagSet(FLAG_SYS_B_DASH);
    ScriptGiveMon(SPECIES_TREECKO, 99, 0, 0, 0, 0);

    if (arg0 == TRUE)
        SetMonData(&gPlayerParty[0], MON_DATA_NICKNAME, gUnknown_Debug_0823C790);

    debug_sub_80A3904();
    debug_sub_80A3714();
    debug_sub_8120F98();
    FlagSet(FLAG_SYS_HIPSTER_MEET);
    sub_80EB8EC();
    unref_sub_8070F90();
    InitTimeBasedEvents();
}
#endif
