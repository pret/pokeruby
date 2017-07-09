#include "global.h"
#include "new_game.h"
#include "battle_records.h"
#include "berry.h"
#include "clock.h"
#include "contest.h"
#include "decoration_inventory.h"
#include "dewford_trend.h"
#include "easy_chat.h"
#include "event_data.h"
#include "field_specials.h"
#include "item_menu.h"
#include "lottery_corner.h"
#include "mail_data.h"
#include "map_constants.h"
#include "mauville_old_man.h"
#include "play_time.h"
#include "player_pc.h"
#include "pokeblock.h"
#include "pokedex.h"
#include "pokemon_size_record.h"
#include "pokemon_storage_system.h"
#include "rng.h"
#include "roamer.h"
#include "rom4.h"
#include "rtc.h"
#include "script.h"
#include "script_pokemon_80C4.h"
#include "secret_base.h"
#include "species.h"
#include "tv.h"

extern u8 gDifferentSaveFile;
#ifdef DEBUG
extern u8 gUnknown_020297ED;
#endif

extern u8 gPlayerPartyCount;
extern u8 gUnknown_03005CE8;
extern u16 gSaveFileStatus;

extern u8 gUnknown_0819FA81[];

const struct SB1_2EFC_Struct gUnknown_08216604 =
{
    0x0000,
    {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    }
};

#ifdef DEBUG
const s8 gUnknown_Debug_0823C788[][2] = {
    { MAP_GROUP_INSIDE_OF_TRUCK,                   MAP_ID_INSIDE_OF_TRUCK },
    { MAP_GROUP_OLDALE_TOWN_POKEMON_CENTER_2F,     MAP_ID_OLDALE_TOWN_POKEMON_CENTER_2F },
    { MAP_GROUP_LITTLEROOT_TOWN,                   MAP_ID_LITTLEROOT_TOWN },
    { MAP_GROUP_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F, MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F }
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

void sub_8052DA8(void)
{
    s32 i;

    sub_80B2D1C();
    for (i = 0; i < 5; i++)
        gSaveBlock1.sbStruct.unkSB1.sb1_2EFC_struct[i] = gUnknown_08216604;
}

void sub_8052DE4(void)
{
    CpuFill32(0, &gSaveBlock2.filler_A8, sizeof(gSaveBlock2.filler_A8));
}

#ifdef DEBUG
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

    warp1_set(gUnknown_Debug_0823C788[i][0], gUnknown_Debug_0823C788[i][1], -1, -1, -1);
}
#endif

void WarpToTruck(void)
{
    warp1_set(25, 40, -1, -1, -1); // inside of truck
    warp_in();
}

void ClearSav2(void)
{
    CpuFill16(0, &gSaveBlock2, sizeof(gSaveBlock2));
    SetDefaultOptions();
}

void sub_8052E4C(void)
{
    gDifferentSaveFile = 0;
#ifdef DEBUG
    gUnknown_020297ED = 0;
#endif
    sub_808C0A0();
    ZeroPlayerPartyMons();
    ZeroEnemyPartyMons();
    sub_80A3684();
}

void NewGameInitData(void)
{
    if (gSaveFileStatus == 0 || gSaveFileStatus == 2)
        RtcReset();

    gDifferentSaveFile = 1;
    ZeroPlayerPartyMons();
    ZeroEnemyPartyMons();
    ResetPokedex();
    sub_8052DE4();
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
    sub_8052DA8();
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
    SetMauvilleOldMan();
    InitDewfordTrend();
    ResetFanClub();
    ResetLotteryCorner();
    WarpToTruck();
    ScriptContext2_RunNewScript(gUnknown_0819FA81);
}

#ifdef DEBUG
extern void debug_sub_80A3904(void);

extern void debug_sub_80A3714(void);

extern void debug_sub_8120F98(void);

extern void unref_sub_8070F90(void);

void debug_sub_8057508(bool32 arg0)
{
    gUnknown_020297ED = 1;
    NewGameInitData();
    gSaveBlock1.money = 999999;
    FlagSet(SYS_POKEMON_GET);
    FlagSet(SYS_POKEDEX_GET);
    FlagSet(SYS_POKENAV_GET);
    FlagSet(SYS_B_DASH);
    ScriptGiveMon(SPECIES_TREECKO, 99, 0, 0, 0, 0);

    if (arg0 == TRUE)
    {
        SetMonData(&gPlayerParty[0], MON_DATA_NICKNAME, gUnknown_Debug_0823C790);
    }

    debug_sub_80A3904();
    debug_sub_80A3714();
    debug_sub_8120F98();
    FlagSet(SYS_HIPSTER_MEET);
    sub_80EB8EC();
    unref_sub_8070F90();
    InitTimeBasedEvents();
}
#endif
