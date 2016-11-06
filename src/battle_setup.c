#include "global.h"
#include "battle.h"
#include "main.h"
#include "species.h"
#include "pokemon.h"
#include "songs.h"
#include "task.h"
#include "fieldmap.h"
#include "string_util.h"
#include "rng.h"
#include "flag.h"
#include "var.h"
#include "script.h"
#include "field_message_box.h"
#include "trainer.h"

#define NUM_TRAINER_EYE_TRAINERS 56
#define TRAINER_REMATCH_STEPS 255

extern void prev_quest_postbuffer_cursor_backup_reset(void);
extern void overworld_poison_timer_set(void);
extern void current_map_music_set__default_for_battle(u16);
extern void c2_exit_to_overworld_1_continue_scripts_restart_music(void);
extern void c2_exit_to_overworld_2_switch(void);
extern void npc_set_running_behaviour_etc(struct MapObject *, u8);
extern void c2_whiteout(void);
extern void sub_800E7C4(void);
extern void sub_8081AA4(void);
extern void sub_8081A18(void);
extern void sub_8081C8C(void);
extern void sub_80C824C(void);
extern void sub_8081CEC(void);
extern void sub_8080E44(void);
extern void sub_80821D8(void);
extern void sub_8082228(void);
extern void sub_808260C(void);
extern void sub_8082CB8(void);
extern u8 *sub_80BCCE8(void);
extern void CB2_ChooseStarter(void);
extern void sub_811AABC(u8);
extern u8 sub_811AAE8(void);
extern u8 GetFieldObjectIdByLocalIdAndMap(u8, u8, u8);
extern u8 *sub_8082880(void);
extern u8 sub_803FC58(u16);
extern bool32 FieldPoisonEffectIsRunning(void);
extern bool32 GetSafariZoneFlag(void);
extern void player_bitmagic(void);

u8 GetWildBattleTransition(void);
u8 GetTrainerBattleTransition(void);
bool32 battle_exit_is_player_defeat(u32 a1);
u8 *sub_808281C(void);
u16 sub_8082C4C(u16 a1);

extern u16 gScriptResult;

struct TrainerPartyMember0
{
    u16 iv;
    u8 level;
    u16 species;
};

struct TrainerPartyMember1
{
    u16 iv;
    u8 level;
    u16 species;
    u16 moves[4];
};

struct TrainerPartyMember2
{
    u16 iv;
    u8 level;
    u16 species;
    u16 heldItem;
};

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

extern u16 MapGridGetMetatileBehaviorAt(s16, s16);
extern bool8 MetatileBehavior_IsTallGrass(char);
extern bool8 MetatileBehavior_IsLongGrass(char);
extern bool8 MetatileBehavior_IsSandOrDeepSand(char);
extern bool8 MetatileBehavior_IsSurfableWaterOrUnderwater(char);
extern bool8 MetatileBehavior_IsBridge(char);
extern bool8 sub_80574C4(char);
extern bool8 sub_80574D8(char);
extern bool8 sub_8057568(char);
extern u8 TestPlayerAvatarFlags(u8);
extern u8 sub_8057450(u8);
extern u8 GetSav1Weather(void);
extern void PlayNewMapMusic(u16);

extern u8 ScriptGiveMon(u16, u8, u16, u32, u32, u8);

extern void (*gUnknown_0300485C)(void);

extern struct Pokemon gEnemyParty[];
extern struct Pokemon gPlayerParty[];
extern struct Trainer gTrainers[];

extern u16 gTrainerBattleMode;
extern u16 gTrainerBattleOpponent;
extern u16 gTrainerMapObjectLocalId;
extern u8 *gTrainerIntroSpeech;
extern u8 *gTrainerDefeatSpeech;
extern u8 *gTrainerVictorySpeech;
extern u8 *gTrainerCannotBattleSpeech;
extern u8 *gTrainerBattleScriptReturnAddress;
extern u8 *gTrainerBattleEndScript;

extern struct TrainerEyeTrainer gTrainerEyeTrainers[];

extern u8 gOtherText_CancelWithTerminator[];

extern u16 gUnknown_020239F8;
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

extern u8 gStringVar4[];

extern u8 gBattleTransitionTable_Wild[][2];
extern u8 gBattleTransitionTable_Trainer[][2];

void sub_8082188(void);

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
        sub_8081AA4();
    else
        sub_8081A18();
}

void sub_8081A18(void)
{
    ScriptContext2_Enable();
    player_bitmagic();
    sub_80597F4();
    gMain.field_8 = sub_8081C8C;
    gUnknown_020239F8 = 0;
    task_add_01_battle_start(GetWildBattleTransition(), 0);
    sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081A5C(void)
{
    ScriptContext2_Enable();
    player_bitmagic();
    sub_80597F4();
    gMain.field_8 = sub_8081C8C;
    gUnknown_020239F8 = 1024;
    task_add_01_battle_start(GetWildBattleTransition(), 0);
    sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081AA4(void)
{
    ScriptContext2_Enable();
    player_bitmagic();
    sub_80597F4();
    gMain.field_8 = sub_80C824C;
    gUnknown_020239F8 = 128;
    task_add_01_battle_start(GetWildBattleTransition(), 0);
}

void task_add_01_battle_start_with_music_and_stats(void)
{
    task_add_01_battle_start(GetTrainerBattleTransition(), 0);
    sav12_xor_increment(7);
    sav12_xor_increment(9);
}

void sub_8081AFC(void)
{
    CreateMaleMon(&gEnemyParty[0], SPECIES_RALTS, 5);
    ScriptContext2_Enable();
    gMain.field_8 = c2_exit_to_overworld_1_continue_scripts_restart_music;
    gUnknown_020239F8 = 512;
    task_add_01_battle_start(8, 0);
}

void sub_8081B3C(void)
{
    ScriptContext2_Enable();
    gMain.field_8 = sub_8081CEC;
    gUnknown_020239F8 = 0;
    task_add_01_battle_start(GetWildBattleTransition(), 0);
    sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081B78(void)
{
    ScriptContext2_Enable();
    gMain.field_8 = sub_8081CEC;
    gUnknown_020239F8 = 0x2000;
    task_add_01_battle_start(GetWildBattleTransition(), 0);
    sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081BB8(void)
{
    ScriptContext2_Enable();
    gMain.field_8 = sub_8081CEC;
    gUnknown_020239F8 = 0x2000;
    task_add_01_battle_start(0, BGM_BATTLE34);
    sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081BF8(void)
{
    ScriptContext2_Enable();
    gMain.field_8 = sub_8081CEC;
    gUnknown_020239F8 = 12288;
    if (gGameVersion == 2)
        task_add_01_battle_start(0xB, BGM_BATTLE34); // KYOGRE
    else
        task_add_01_battle_start(0x6, BGM_BATTLE34); // GROUDON
    sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081C50(void)
{
    ScriptContext2_Enable();
    gMain.field_8 = sub_8081CEC;
    gUnknown_020239F8 = 24576;
    task_add_01_battle_start(0xA, BGM_BATTLE36);
    sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081C8C(void)
{
    CpuFill16(0, (void *)BG_PLTT, BG_PLTT_SIZE);
    ResetOamRange(0, 128);

    if (battle_exit_is_player_defeat(gUnknown_02024D26) == TRUE)
    {
        SetMainCallback2(c2_whiteout);
    }
    else
    {
        SetMainCallback2(c2_exit_to_overworld_2_switch);
        gUnknown_0300485C = sub_8080E44;
    }
}

void sub_8081CEC(void)
{
    CpuFill16(0, (void *)BG_PLTT, BG_PLTT_SIZE);
    ResetOamRange(0, 128);

    if (battle_exit_is_player_defeat(gUnknown_02024D26) == TRUE)
        SetMainCallback2(c2_whiteout);
    else
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

s8 sub_8081D3C(void)
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
    switch (gMapHeader.light)
    {
    case 1:
    case 2:
    case 3:
        break;
    case 4:
        if (sub_80574C4(tileBehavior))
            return 8;
        if (MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior))
            return 5;
        return 7;
    case 8:
    case 9:
        return 8;
    case 5:
        return 3;
    case 6:
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
    if (TestPlayerAvatarFlags(8))
    {
        if (sub_8057450(tileBehavior))
            return 5;
        if (MetatileBehavior_IsBridge(tileBehavior) == TRUE)
            return 4;
    }
    if (!(gSaveBlock1.location.mapGroup == 0 && gSaveBlock1.location.mapNum == 28) && GetSav1Weather() != 8)
        return 9;
    else
        return 2;
}

s8 sub_8081E90(void)
{
    u8 flashUsed;
    u16 tileBehavior;
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);

    flashUsed = sav1_get_flash_used_on_map();

    if (flashUsed)
        return 2;

    if (!(MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior)))
    {
        switch (gMapHeader.light)
        {
        case 4:
            return 1;
        case 5:
            return 3;
        default:
            return 0;
        }
    }
    return 3;
}

u16 GetSumOfPartyMonLevel(u8 numMons)
{
    u32 monData;
    u8 sum = 0;
    int i;

    for (i = 0; i < 6; i++)
    {
        monData = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
        if (monData != 412 && monData)
        {
            if (GetMonData(&gPlayerParty[i], MON_DATA_HP))
            {
                sum += GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);

                numMons--;
                if (numMons == 0)
                    break;
            }
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
    u8 flashVar = sub_8081E90();
    u8 level = GetMonData(&gEnemyParty[0], MON_DATA_LEVEL);

    if (level < (u8)GetSumOfPartyMonLevel(1)) // is wild mon level than the player's mon level?
        return gBattleTransitionTable_Wild[flashVar][0];
    else
        return gBattleTransitionTable_Wild[flashVar][1]; // use a white fade in instead of normal transition.
}

u8 GetTrainerBattleTransition(void)
{
    struct Trainer *trainer;
    u8 trainerClass;
    u8 partyCount;
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
        partyCount = 2; // double battles always at least have 2 pokemon.
    else
        partyCount = 1;

    flashVar = sub_8081E90();
    level = GetSumOfEnemyPartyLevel(gTrainerBattleOpponent, partyCount);

    if (level < (u8)GetSumOfPartyMonLevel(partyCount)) // is wild mon level than the player's mon level?
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

void sub_8082168(void)
{
    SetMainCallback2(CB2_ChooseStarter);
    gMain.field_8 = sub_8082188;
}

void sub_8082188(void)
{
    u16 starterPoke;

    *GetVarPointer(0x4023) = gScriptResult;
    starterPoke = GetStarterPokemon(gScriptResult);
    ScriptGiveMon(starterPoke, 5, 0, 0, 0, 0);
    ResetTasks();
    sub_80408BC();
    SetMainCallback2(sub_80821D8);
    sub_811AAD8(0);
}

void sub_80821D8(void)
{
    UpdatePaletteFade();
    RunTasks();

    if (sub_811AAE8() == TRUE)
    {
        gUnknown_020239F8 = 16;
        gMain.field_8 = sub_8082228;
        SetMainCallback2(sub_800E7C4);
        prev_quest_postbuffer_cursor_backup_reset();
        overworld_poison_timer_set();
        sav12_xor_increment(7);
        sav12_xor_increment(8);
    }
}

void sub_8082228(void)
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

u8 **sub_80822BC(void)
{
    u32 *pointer;

    gTrainerBattleMode = 0;
    gTrainerBattleOpponent = 0;
    gTrainerMapObjectLocalId = 0;
    gTrainerIntroSpeech = 0;
    gTrainerDefeatSpeech = 0;
    gTrainerVictorySpeech = 0;
    gTrainerCannotBattleSpeech = 0;
    gTrainerBattleScriptReturnAddress = 0;
    gTrainerBattleEndScript = 0;
    return &gTrainerBattleEndScript;
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

u8 GetTrainerFlagFromScriptPointer(u8 *data)
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
    gUnknown_020239F8 = 8;
    gMain.field_8 = sub_808260C;
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
        SetMainCallback2(c2_whiteout);
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
        SetMainCallback2(c2_whiteout);
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
    gUnknown_020239F8 = 8;
    gMain.field_8 = do_choose_name_or_words_screen;
    task_add_01_battle_start_with_music_and_stats();
    ScriptContext1_Stop();
}

void sub_80826D8(void)
{
    ShowFieldMessage(sub_808281C());
}

u8 *sub_80826E8(void)
{
    u8 *result = gTrainerBattleScriptReturnAddress;

    if (!gTrainerBattleScriptReturnAddress)
        return gUnknown_081C6C02;

    return result;
}

u8 *sub_8082700(void)
{
    u8 *result = gTrainerBattleEndScript;

    if (!gTrainerBattleEndScript)
        return gUnknown_081C6C02;

    return result;
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

u8 *ReturnEmptyStringIfNull(u8 *result)
{
    if (result)
        return result;
    else
        return gOtherText_CancelWithTerminator;
}

u8 *sub_808281C(void)
{
    return ReturnEmptyStringIfNull(gTrainerIntroSpeech);
}

u8 *sub_8082830(void)
{
    u8 *str;

    if (gTrainerBattleOpponent == 1024)
        str = sub_80BCCE8();
    else
        str = gTrainerDefeatSpeech;

    StringExpandPlaceholders(gStringVar4, ReturnEmptyStringIfNull(str));
    return gStringVar4;
}

u8 *unref_sub_808286C(void)
{
    return ReturnEmptyStringIfNull(gTrainerVictorySpeech);
}

u8 *sub_8082880(void)
{
    return ReturnEmptyStringIfNull(gTrainerCannotBattleSpeech);
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

   for (i = 0; i < NUM_TRAINER_EYE_TRAINERS; i++)
   {
       s32 j;

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
           {
               ret = TRUE;
               continue;
           }
           if (trainer_flag_check(trainers[i].trainerNums[0]) == TRUE && (Random() % 100) <= 30)
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
