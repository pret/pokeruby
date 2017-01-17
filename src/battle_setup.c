#include "global.h"
#include "battle_setup.h"
#include "asm.h"
#include "battle.h"
#include "event_data.h"
#include "field_message_box.h"
#include "field_player_avatar.h"
#include "main.h"
#include "metatile_behavior.h"
#include "palette.h"
#include "rng.h"
#include "rom4.h"
#include "safari_zone.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "species.h"
#include "starter_choose.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "trainer.h"
#include "weather.h"

#define NUM_TRAINER_EYE_TRAINERS 56
#define TRAINER_REMATCH_STEPS 255

extern u16 gScriptResult;

// IV + LEVEL + SPECIES
struct TrainerPartyMember0
{
    u16 iv;
    u8 level;
    u16 species;
};

// IV + LEVEL + SPECIES + MOVES
struct TrainerPartyMember1
{
    u16 iv;
    u8 level;
    u16 species;
    u16 moves[4];
};

// IV + LEVEL + SPECIES + ITEMS
struct TrainerPartyMember2
{
    u16 iv;
    u8 level;
    u16 species;
    u16 heldItem;
};

// IV + LEVEL + SPECIES + ITEMS + MOVES
struct TrainerPartyMember3
{
    u16 iv;
    u8 level;
    u16 species;
    u16 heldItem;
    u16 moves[4];
};

struct TrainerBattleSpec
{
    void *ptr;
    u8 ptrType;
};

struct TrainerEyeTrainer
{
   u16 trainerNums[5];
   u16 mapGroup;
   u16 mapNum;
};

extern void (*gUnknown_0300485C)(void);

extern struct Pokemon gEnemyParty[];
extern struct Pokemon gPlayerParty[];
extern struct Trainer gTrainers[];

EWRAM_DATA u16 gTrainerBattleMode = 0;
EWRAM_DATA u16 gTrainerBattleOpponent = 0;
EWRAM_DATA u16 gTrainerMapObjectLocalId = 0;
EWRAM_DATA u8 *gTrainerIntroSpeech = NULL;
EWRAM_DATA u8 *gTrainerDefeatSpeech = NULL;
EWRAM_DATA u8 *gTrainerVictorySpeech = NULL;
EWRAM_DATA u8 *gTrainerCannotBattleSpeech = NULL;
EWRAM_DATA u8 *gTrainerBattleScriptReturnAddress = NULL;
EWRAM_DATA u8 *gTrainerBattleEndScript = NULL;

extern struct TrainerEyeTrainer gTrainerEyeTrainers[];

extern u8 gOtherText_CancelWithTerminator[];

extern u16 gBattleTypeFlags;
extern u16 gScriptLastTalked;
extern u8 gUnknown_02024D26;
extern u16 gBadgeFlags[];

extern struct MapObject gMapObjects[];

extern u8 gUnknown_0819F818[];
extern u8 gUnknown_0819F840[];
extern u8 gUnknown_0819F878[];
extern u8 gUnknown_0819F887[];
extern u8 gUnknown_0819F8AE[];

extern u8 gUnknown_0819F80B[];
extern u8 gUnknown_081C6C02[];

extern struct TrainerBattleSpec gTrainerBattleSpecs_0[];
extern struct TrainerBattleSpec gTrainerBattleSpecs_1[];
extern struct TrainerBattleSpec gTrainerBattleSpecs_2[];
extern struct TrainerBattleSpec gTrainerBattleSpecs_3[];
extern struct TrainerBattleSpec gTrainerBattleSpecs_4[];

extern u8 gBattleTransitionTable_Wild[][2];
extern u8 gBattleTransitionTable_Trainer[][2];

void task01_battle_start(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        if (!FieldPoisonEffectIsRunning()) // is poison not active?
        {
            sub_811AABC(data[1]);
            data[0]++; // go to case 1.
        }
        break;
    case 1:
        if (sub_811AAE8() == TRUE)
        {
            SetMainCallback2(sub_800E7C4);
            prev_quest_postbuffer_cursor_backup_reset();
            overworld_poison_timer_set();
            DestroyTask(taskId);
        }
        break;
    }
}

void task_add_01_battle_start(u8 transition, u16 song)
{
    u8 taskId = CreateTask(task01_battle_start, 1);

    gTasks[taskId].data[1] = transition;
    current_map_music_set__default_for_battle(song);
}

void CheckForSafariZoneAndProceed(void)
{
    if (GetSafariZoneFlag())
        StartBattle_Safari();
    else
        StartBattle_StandardWild();
}

void StartBattle_StandardWild(void)
{
    ScriptContext2_Enable();
    FreezeMapObjects();
    sub_80597F4();
    gMain.savedCallback = HandleWildBattleEnd;
    gBattleTypeFlags = 0;
    task_add_01_battle_start(GetWildBattleTransition(), 0);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void StartBattle_Roamer(void)
{
    ScriptContext2_Enable();
    FreezeMapObjects();
    sub_80597F4();
    gMain.savedCallback = HandleWildBattleEnd;
    gBattleTypeFlags = BATTLE_TYPE_ROAMER;
    task_add_01_battle_start(GetWildBattleTransition(), 0);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void StartBattle_Safari(void)
{
    ScriptContext2_Enable();
    FreezeMapObjects();
    sub_80597F4();
    gMain.savedCallback = sub_80C824C;
    gBattleTypeFlags = BATTLE_TYPE_SAFARI;
    task_add_01_battle_start(GetWildBattleTransition(), 0);
}

void task_add_01_battle_start_with_music_and_stats(void)
{
    task_add_01_battle_start(GetTrainerBattleTransition(), 0);
    IncrementGameStat(7);
    IncrementGameStat(9);
}

//Initiates battle where Wally catches Ralts
void StartBattle_WallyTutorial(void)
{
    CreateMaleMon(&gEnemyParty[0], SPECIES_RALTS, 5);
    ScriptContext2_Enable();
    gMain.savedCallback = c2_exit_to_overworld_1_continue_scripts_restart_music;
    gBattleTypeFlags = BATTLE_TYPE_WALLY_TUTORIAL;
    task_add_01_battle_start(8, 0);
}

void StartBattle_ScriptedWild(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = HandleScriptedWildBattleEnd;
    gBattleTypeFlags = 0;
    task_add_01_battle_start(GetWildBattleTransition(), 0);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void StartBattle_SouthernIsland(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = HandleScriptedWildBattleEnd;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY;
    task_add_01_battle_start(GetWildBattleTransition(), 0);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void StartBattle_Rayquaza(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = HandleScriptedWildBattleEnd;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY;
    task_add_01_battle_start(0, BGM_BATTLE34);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void StartBattle_GroudonKyogre(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = HandleScriptedWildBattleEnd;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY | BATTLE_TYPE_KYOGRE_GROUDON;
    if (gGameVersion == 2)
        task_add_01_battle_start(0xB, BGM_BATTLE34); // KYOGRE
    else
        task_add_01_battle_start(0x6, BGM_BATTLE34); // GROUDON
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void StartBattle_Regi(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = HandleScriptedWildBattleEnd;
    gBattleTypeFlags = BATTLE_TYPE_LEGENDARY | BATTLE_TYPE_REGI;
    task_add_01_battle_start(0xA, BGM_BATTLE36);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void HandleWildBattleEnd(void)
{
    CpuFill16(0, (void *)BG_PLTT, BG_PLTT_SIZE);
    ResetOamRange(0, 128);

    if (battle_exit_is_player_defeat(gUnknown_02024D26) == TRUE)
    {
        SetMainCallback2(CB2_WhiteOut);
    }
    else
    {
        SetMainCallback2(c2_exit_to_overworld_2_switch);
        gUnknown_0300485C = sub_8080E44;
    }
}

void HandleScriptedWildBattleEnd(void)
{
    CpuFill16(0, (void *)BG_PLTT, BG_PLTT_SIZE);
    ResetOamRange(0, 128);

    if (battle_exit_is_player_defeat(gUnknown_02024D26) == TRUE)
        SetMainCallback2(CB2_WhiteOut);
    else
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

s8 GetBattleTerrain(void)
{
    u16 tileBehavior;
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);

    if (MetatileBehavior_IsTallGrass(tileBehavior))
        return 0;
    if (MetatileBehavior_IsLongGrass(tileBehavior))
        return 1;
    if (MetatileBehavior_IsSandOrDeepSand(tileBehavior))
        return 2;
    switch (gMapHeader.mapType)
    {
    case MAP_TYPE_TOWN:
    case MAP_TYPE_CITY:
    case MAP_TYPE_ROUTE:
        break;
    case MAP_TYPE_UNDERGROUND:
        if (sub_80574C4(tileBehavior))
            return 8;
        if (MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior))
            return 5;
        return 7;
    case MAP_TYPE_INDOOR:
    case MAP_TYPE_SECRET_BASE:
        return 8;
    case MAP_TYPE_UNDERWATER:
        return 3;
    case MAP_TYPE_6:
        if (MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior))
            return 4;
        return 9;
    }
    if (sub_8057568(tileBehavior))
        return 4;
    if (MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior))
        return 5;
    if (sub_80574D8(tileBehavior))
        return 6;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
    {
        if (sub_8057450(tileBehavior))
            return 5;
        if (MetatileBehavior_IsBridge(tileBehavior) == TRUE)
            return 4;
    }
    if (gSaveBlock1.location.mapGroup == 0 && gSaveBlock1.location.mapNum == 28)
        return 2;
    if (GetSav1Weather() == 8)
        return 2;
    return 9;
}

s8 GetBattleTransitionTypeByMap(void)
{
    u8 flashUsed;
    u16 tileBehavior;
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);

    flashUsed = sav1_get_flash_used_on_map();

    if (flashUsed)
        return 2;

    if (!MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior))
    {
        switch (gMapHeader.mapType)
        {
        case MAP_TYPE_UNDERGROUND:
            return 1;
        case MAP_TYPE_UNDERWATER:
            return 3;
        default:
            return 0;
        }
    }
    return 3;
}

u16 GetSumOfPartyMonLevel(u8 numMons)
{
    u8 sum = 0;
    int i;

    for (i = 0; i < 6; i++)
    {
        u32 species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);

        if (species != SPECIES_EGG && species != SPECIES_NONE && GetMonData(&gPlayerParty[i], MON_DATA_HP) != 0)
        {
            sum += GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
            numMons--;
            if (numMons == 0)
                break;
        }
    }
    return sum;
}

u8 GetSumOfEnemyPartyLevel(u16 trainerNum, u8 numMons)
{
    u8 i;
    u8 sum;
    u32 count = numMons;
    void *party;

    if (gTrainers[trainerNum].partySize < count)
        count = gTrainers[trainerNum].partySize;

    sum = 0;

    switch (gTrainers[trainerNum].partyFlags)
    {
    case 0:
        party = gTrainers[trainerNum].party;
        for (i = 0; i < count; i++)
            sum += ((struct TrainerPartyMember0 *)party)[i].level;
        break;
    case 1:
        party = gTrainers[trainerNum].party;
        for (i = 0; i < count; i++)
            sum += ((struct TrainerPartyMember1 *)party)[i].level;
        break;
    case 2:
        party = gTrainers[trainerNum].party;
        for (i = 0; i < count; i++)
            sum += ((struct TrainerPartyMember2 *)party)[i].level;
        break;
    case 3:
        party = gTrainers[trainerNum].party;
        for (i = 0; i < count; i++)
            sum += ((struct TrainerPartyMember3 *)party)[i].level;
        break;
    }

    return sum;
}

u8 GetWildBattleTransition(void)
{
    u8 flashVar = GetBattleTransitionTypeByMap();
    u8 level = GetMonData(&gEnemyParty[0], MON_DATA_LEVEL);

    if (level < (u8)GetSumOfPartyMonLevel(1)) // is wild mon level than the player's mon level?
        return gBattleTransitionTable_Wild[flashVar][0];
    else
        return gBattleTransitionTable_Wild[flashVar][1]; // use a white fade in instead of normal transition.
}

u8 GetTrainerBattleTransition(void)
{
    struct Trainer *trainer;
    u8 minPartyCount;
    u8 flashVar;
    u8 level;

    if (gTrainerBattleOpponent == 1024) // link battle?
        return 16;

    trainer = gTrainers;

    if (trainer[gTrainerBattleOpponent].trainerClass == 24) // league?
    {
        if (gTrainerBattleOpponent == 261)
            return 12;
        if (gTrainerBattleOpponent == 262)
            return 13;
        if (gTrainerBattleOpponent == 263)
            return 14;
        if (gTrainerBattleOpponent == 264)
            return 15;
        return 16;
    }

    if (trainer[gTrainerBattleOpponent].trainerClass == 32) // team leader?
        return 16;

    if (trainer[gTrainerBattleOpponent].doubleBattle == TRUE)
        minPartyCount = 2; // double battles always at least have 2 pokemon.
    else
        minPartyCount = 1;

    flashVar = GetBattleTransitionTypeByMap();
    level = GetSumOfEnemyPartyLevel(gTrainerBattleOpponent, minPartyCount);

    if (level < (u8)GetSumOfPartyMonLevel(minPartyCount)) // is wild mon level than the player's mon level?
        return gBattleTransitionTable_Trainer[flashVar][0];
    else
        return gBattleTransitionTable_Trainer[flashVar][1];
}

u8 GetBattleTowerBattleTransition(void)
{
    u8 monData = GetMonData(&gEnemyParty[0], MON_DATA_LEVEL);

    if (monData < (u8)GetSumOfPartyMonLevel(1))
        return 4;
    else
        return 3;
}

void ChooseStarter(void)
{
    SetMainCallback2(CB2_ChooseStarter);
    gMain.savedCallback = CB2_GiveStarter;
}

void CB2_GiveStarter(void)
{
    u16 starterPoke;

    *GetVarPointer(0x4023) = gScriptResult;
    starterPoke = GetStarterPokemon(gScriptResult);
    ScriptGiveMon(starterPoke, 5, 0, 0, 0, 0);
    ResetTasks();
    sub_80408BC();
    SetMainCallback2(CB2_StartFirstBattle);
    sub_811AAD8(0);
}

void CB2_StartFirstBattle(void)
{
    UpdatePaletteFade();
    RunTasks();

    if (sub_811AAE8() == TRUE)
    {
        gBattleTypeFlags = BATTLE_TYPE_FIRST_BATTLE;
        gMain.savedCallback = HandleFirstBattleEnd;
        SetMainCallback2(sub_800E7C4);
        prev_quest_postbuffer_cursor_backup_reset();
        overworld_poison_timer_set();
        IncrementGameStat(7);
        IncrementGameStat(8);
    }
}

void HandleFirstBattleEnd(void)
{
    sav1_reset_battle_music_maybe();
    SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

u32 TrainerBattleLoadArg32(u8 *ptr)
{
    return ptr[0] | (ptr[1] << 8) | (ptr[2] << 16) | (ptr[3] << 24);
}

u16 TrainerBattleLoadArg16(u8 *ptr)
{
    return ptr[0] | (ptr[1] << 8);
}

u8 TrainerBattleLoadArg8(u8 *ptr)
{
    return ptr[0];
}

u16 trainerflag_opponent(void)
{
    return TRAINER_FLAG_START + gTrainerBattleOpponent;
}

bool32 battle_exit_is_player_defeat(u32 a1)
{
    switch (a1 - 1)
    {
    case 1:
    case 2:
        return TRUE;
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
        return FALSE;
    }
    return FALSE;
}

void sub_80822BC(void)
{
    gTrainerBattleMode = 0;
    gTrainerBattleOpponent = 0;
    gTrainerMapObjectLocalId = 0;
    gTrainerIntroSpeech = 0;
    gTrainerDefeatSpeech = 0;
    gTrainerVictorySpeech = 0;
    gTrainerCannotBattleSpeech = 0;
    gTrainerBattleScriptReturnAddress = 0;
    gTrainerBattleEndScript = 0;
}

void TrainerBattleLoadArgs(struct TrainerBattleSpec *specs, u8 *data)
{
    while (1)
    {
        switch (specs->ptrType)
        {
        case 0:
            *(u8 *)specs->ptr = TrainerBattleLoadArg8(data);
            data++;
            break;
        case 1:
            *(u16 *)specs->ptr = TrainerBattleLoadArg16(data);
            data += 2;
            break;
        case 2:
            *(u32 *)specs->ptr = TrainerBattleLoadArg32(data);
            data += 4;
            break;
        case 3:
            *(u8 *)specs->ptr = 0;
            break;
        case 4:
            *(u16 *)specs->ptr = 0;
            break;
        case 5:
            *(u32 *)specs->ptr = 0;
            break;
        case 6:
            *(u8 **)specs->ptr = data;
            return;
        }
        specs++;
    }
}

void battle_80801F0(void)
{
    if (gTrainerMapObjectLocalId)
    {
        gScriptLastTalked = gTrainerMapObjectLocalId;
        gSelectedMapObject = GetFieldObjectIdByLocalIdAndMap(gTrainerMapObjectLocalId, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
    }
}

u8 *TrainerBattleConfigure(u8 *data)
{
    sub_80822BC();
    gTrainerBattleMode = TrainerBattleLoadArg8(data);

    switch (gTrainerBattleMode)
    {
    case 3:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_3, data);
        return gUnknown_0819F878;
    case 4:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_2, data);
        battle_80801F0();
        return gUnknown_0819F840;
    case 1:
    case 2:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_1, data);
        battle_80801F0();
        return gUnknown_0819F818;
    case 6:
    case 8:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_4, data);
        battle_80801F0();
        return gUnknown_0819F840;
    case 7:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_2, data);
        battle_80801F0();
        gTrainerBattleOpponent = sub_8082C4C(gTrainerBattleOpponent);
        return gUnknown_0819F8AE;
    case 5:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_0, data);
        battle_80801F0();
        gTrainerBattleOpponent = sub_8082C4C(gTrainerBattleOpponent);
        return gUnknown_0819F887;
    default:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_0, data);
        battle_80801F0();
        return gUnknown_0819F818;
    }
}

void TrainerWantsBattle(u8 trainerMapObjId, u8 *trainerScript)
{
    gSelectedMapObject = trainerMapObjId;
    gScriptLastTalked = gMapObjects[trainerMapObjId].localId;
    TrainerBattleConfigure(trainerScript + 1);
    ScriptContext1_SetupScript(gUnknown_0819F80B);
    ScriptContext2_Enable();
}

bool32 GetTrainerFlagFromScriptPointer(u8 *data)
{
    u32 flag = TrainerBattleLoadArg16(data + 2);
    return FlagGet(TRAINER_FLAG_START + flag);
}

void sub_8082524(void)
{
    struct MapObject *mapObject = &gMapObjects[gSelectedMapObject];

    npc_set_running_behaviour_etc(mapObject, npc_running_behaviour_by_direction(mapObject->mapobj_unk_18));
}

u8 sub_8082558(void)
{
    return gTrainerBattleMode;
}

u8 sub_8082564(void)
{
    return FlagGet(trainerflag_opponent());
}

void sub_808257C(void)
{
    FlagSet(trainerflag_opponent());
}

void unref_sub_8082590(void)
{
    FlagSet(trainerflag_opponent()); // duplicate function
}

u8 trainer_flag_check(u16 flag)
{
    return FlagGet(TRAINER_FLAG_START + flag);
}

void trainer_flag_set(u16 flag)
{
    FlagSet(TRAINER_FLAG_START + flag);
}

void trainer_flag_clear(u16 flag)
{
    FlagReset(TRAINER_FLAG_START + flag);
}

void sub_80825E4(void)
{
    gBattleTypeFlags = BATTLE_TYPE_TRAINER;
    gMain.savedCallback = sub_808260C;
    task_add_01_battle_start_with_music_and_stats();
    ScriptContext1_Stop();
}

void sub_808260C(void)
{
    if (gTrainerBattleOpponent == 1024)
    {
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music); // link battle?
    }
    else if (battle_exit_is_player_defeat(gUnknown_02024D26) == TRUE)
    {
        SetMainCallback2(CB2_WhiteOut);
    }
    else
    {
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
        sub_808257C();
    }
}

void do_choose_name_or_words_screen(void)
{
    if (gTrainerBattleOpponent == 1024)
    {
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music); // link battle?
    }
    else if (battle_exit_is_player_defeat(gUnknown_02024D26) == TRUE)
    {
        SetMainCallback2(CB2_WhiteOut);
    }
    else
    {
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
        sub_808257C();
        sub_8082CB8();
    }
}

void sub_80826B0(void)
{
    gBattleTypeFlags = BATTLE_TYPE_TRAINER;
    gMain.savedCallback = do_choose_name_or_words_screen;
    task_add_01_battle_start_with_music_and_stats();
    ScriptContext1_Stop();
}

void sub_80826D8(void)
{
    ShowFieldMessage(sub_808281C());
}

u8 *sub_80826E8(void)
{
    if (gTrainerBattleScriptReturnAddress)
        return gTrainerBattleScriptReturnAddress;
    else
        return gUnknown_081C6C02;
}

u8 *sub_8082700(void)
{
    if (gTrainerBattleEndScript)
        return gTrainerBattleEndScript;
    else
        return gUnknown_081C6C02;
}

void sub_8082718()
{
    ShowFieldMessage(sub_8082880());
}

void PlayTrainerEncounterMusic(void)
{
    u16 music;

    if (gTrainerBattleMode != 1 && gTrainerBattleMode != 8)
    {
        switch (sub_803FC58(gTrainerBattleOpponent))
        {
        case TRAINER_ENCOUNTER_MUSIC_MALE:
            music = BGM_BOYEYE;
            break;
        case TRAINER_ENCOUNTER_MUSIC_FEMALE:
            music = BGM_GIRLEYE;
            break;
        case TRAINER_ENCOUNTER_MUSIC_GIRL:
            music = BGM_SYOUJOEYE;
            break;
        case TRAINER_ENCOUNTER_MUSIC_INTENSE:
            music = BGM_HAGESHII;
            break;
        case TRAINER_ENCOUNTER_MUSIC_COOL:
            music = BGM_KAKKOII;
            break;
        case TRAINER_ENCOUNTER_MUSIC_AQUA:
            music = BGM_AQA_0;
            break;
        case TRAINER_ENCOUNTER_MUSIC_MAGMA:
            music = BGM_MGM0;
            break;
        case TRAINER_ENCOUNTER_MUSIC_SWIMMER:
            music = BGM_SWIMEYE;
            break;
        case TRAINER_ENCOUNTER_MUSIC_TWINS:
            music = BGM_HUTAGO;
            break;
        case TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR:
            music = BGM_SITENNOU;
            break;
        case TRAINER_ENCOUNTER_MUSIC_HIKER:
            music = BGM_YAMA_EYE;
            break;
        case TRAINER_ENCOUNTER_MUSIC_INTERVIEWER:
            music = BGM_INTER_V;
            break;
        case TRAINER_ENCOUNTER_MUSIC_RICH:
            music = BGM_TEST;
            break;
        default:
            music = BGM_AYASII;
        }
        PlayNewMapMusic(music);
    }
}

//Returns an empty string if a null pointer was passed, otherwise returns str
u8 *SanitizeString(u8 *str)
{
    if (str)
        return str;
    else
        return gOtherText_CancelWithTerminator;
}

u8 *sub_808281C(void)
{
    return SanitizeString(gTrainerIntroSpeech);
}

u8 *sub_8082830(void)
{
    u8 *str;

    if (gTrainerBattleOpponent == 1024)
        str = sub_80BCCE8();
    else
        str = gTrainerDefeatSpeech;

    StringExpandPlaceholders(gStringVar4, SanitizeString(str));
    return gStringVar4;
}

u8 *unref_sub_808286C(void)
{
    return SanitizeString(gTrainerVictorySpeech);
}

u8 *sub_8082880(void)
{
    return SanitizeString(gTrainerCannotBattleSpeech);
}

s32 sub_8082894(struct TrainerEyeTrainer *trainers, u16 trainerNum)
{
    s32 i;

    for (i = 0; i < NUM_TRAINER_EYE_TRAINERS; i++)
    {
        if (trainers[i].trainerNums[0] == trainerNum)
            return i;
    }
    return -1;
}

s32 sub_80828B8(struct TrainerEyeTrainer *trainers, u16 trainerNum)
{
    s32 i;
    s32 j;

    for (i = 0; i < NUM_TRAINER_EYE_TRAINERS; i++)
    {
        for (j = 0; j < 5 && trainers[i].trainerNums[j] != 0; j++)
        {
            if (trainers[i].trainerNums[j] == trainerNum)
                return i;
        }
    }
    return -1;
}

bool32 sub_80828FC(struct TrainerEyeTrainer *trainers, u16 mapGroup, u16 mapNum)
{
    int i;
    bool32 ret = FALSE;

    for (i = 0; i < NUM_TRAINER_EYE_TRAINERS; i++)
    {
        if (trainers[i].mapGroup == mapGroup && trainers[i].mapNum == mapNum)
        {
            if (gSaveBlock1.trainerRematches[i] != 0)
                ret = TRUE;
            else if (trainer_flag_check(trainers[i].trainerNums[0]) == TRUE && (Random() % 100) <= 30)
            {
                int j = 1;

                while (j < 5 && trainers[i].trainerNums[j] != 0 && trainer_flag_check(trainers[i].trainerNums[j]))
                    j++;
                gSaveBlock1.trainerRematches[i] = j;
                ret = TRUE;
            }
        }
    }
   return ret;
}

s32 sub_80829A8(struct TrainerEyeTrainer *trainers, u16 mapGroup, u16 mapNum)
{
    s32 i;

    for (i = 0; i < NUM_TRAINER_EYE_TRAINERS; i++)
    {
        if (trainers[i].mapGroup == mapGroup && trainers[i].mapNum == mapNum && gSaveBlock1.trainerRematches[i])
            return 1;
    }
    return 0;
}

s32 sub_80829E8(struct TrainerEyeTrainer *trainers, u16 mapGroup, u16 mapNum)
{
    s32 i;

    for (i = 0; i < NUM_TRAINER_EYE_TRAINERS; i++)
    {
        if (trainers[i].mapGroup == mapGroup && trainers[i].mapNum == mapNum)
            return 1;
    }
    return 0;
}

bool8 sub_8082A18(struct TrainerEyeTrainer *trainers, u16 trainerNum)
{
    s32 trainerEyeIndex = sub_8082894(trainers, trainerNum);

    if (trainerEyeIndex != -1 && trainerEyeIndex < 100 && gSaveBlock1.trainerRematches[trainerEyeIndex])
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8082A54(struct TrainerEyeTrainer *trainers, u16 trainerNum)
{
    s32 trainerEyeIndex = sub_80828B8(trainers, trainerNum);

    if (trainerEyeIndex != -1 && trainerEyeIndex < 100 && gSaveBlock1.trainerRematches[trainerEyeIndex])
        return TRUE;
    else
        return FALSE;
}

u16 sub_8082A90(struct TrainerEyeTrainer *trainers, u16 trainerNum)
{
    int i;
    struct TrainerEyeTrainer *trainer;
    s32 trainerEyeIndex = sub_8082894(trainers, trainerNum);

    if (trainerEyeIndex == -1)
        return 0;
    trainer = &trainers[trainerEyeIndex];
    for (i = 1; i < 5; i++)
    {
        if (!trainer->trainerNums[i])
            return trainer->trainerNums[i - 1];
        if (!trainer_flag_check(trainer->trainerNums[i]))
            return trainer->trainerNums[i];
    }
    return trainer->trainerNums[4];
}

void sub_8082AE4(struct TrainerEyeTrainer *trainers, u16 trainerNum)
{
    s32 trainerEyeIndex = sub_80828B8(trainers, trainerNum);

    if (trainerEyeIndex != -1)
        gSaveBlock1.trainerRematches[trainerEyeIndex] = 0;
}

bool8 sub_8082B10(struct TrainerEyeTrainer *trainers, u16 trainerNum)
{
    s32 trainerEyeIndex = sub_8082894(trainers, trainerNum);

    if (trainerEyeIndex != -1 && trainer_flag_check(trainers[trainerEyeIndex].trainerNums[1]))
        return TRUE;
    else
        return FALSE;
}

bool32 sub_8082B44(void)
{
    int badgeCount = 0;
    u32 i;

    for (i = 0; i < 8; i++)
    {
        if (FlagGet(gBadgeFlags[i]) == TRUE)
        {
            badgeCount++;
            if (badgeCount >= 5)
                return TRUE;
        }
    }
    return FALSE;
}

void sub_8082B78(void)
{
    if (sub_8082B44())
    {
        if (gSaveBlock1.trainerRematchStepCounter >= TRAINER_REMATCH_STEPS)
            gSaveBlock1.trainerRematchStepCounter = TRAINER_REMATCH_STEPS;
        else
            gSaveBlock1.trainerRematchStepCounter++;
    }
}

bool32 sub_8082BA4(void)
{
    if (sub_8082B44() && gSaveBlock1.trainerRematchStepCounter >= TRAINER_REMATCH_STEPS)
        return TRUE;
    else
        return FALSE;
}

void sub_8082BD0(u16 mapGroup, u16 mapNum)
{
    if (sub_8082BA4() && sub_80828FC(gTrainerEyeTrainers, mapGroup, mapNum) == TRUE)
        gSaveBlock1.trainerRematchStepCounter = 0;
}

s32 sub_8082C0C(u16 mapGroup, u16 mapNum)
{
    return sub_80829A8(gTrainerEyeTrainers, mapGroup, mapNum);
}

s32 unref_sub_8082C2C(u16 mapGroup, u16 mapNum)
{
    return sub_80829E8(gTrainerEyeTrainers, mapGroup, mapNum);
}

u16 sub_8082C4C(u16 trainerNum)
{
    return sub_8082A90(gTrainerEyeTrainers, trainerNum);
}

s32 sub_8082C68(void)
{
    if (sub_8082A18(gTrainerEyeTrainers, gTrainerBattleOpponent))
        return 1;
    else
        return sub_8082B10(gTrainerEyeTrainers, gTrainerBattleOpponent);
}

u8 sub_8082C9C(void)
{
    return sub_8082A54(gTrainerEyeTrainers, gTrainerBattleOpponent);
}

void sub_8082CB8(void)
{
    sub_8082AE4(gTrainerEyeTrainers, gTrainerBattleOpponent);
    sub_808257C();
}
