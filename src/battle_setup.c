#include "global.h"
#include "main.h"
#include "species.h"
#include "pokemon.h"
#include "songs.h"
#include "task.h"
#include "fieldmap.h"
#include "string_util.h"
#include "rng.h"

extern void prev_quest_postbuffer_cursor_backup_reset(void);
extern void overworld_poison_timer_set(void);
extern void current_map_music_set__default_for_battle(u16);
extern void c2_exit_to_overworld_1_continue_scripts_restart_music(void);
extern void c2_exit_to_overworld_2_switch(void);
extern void npc_set_running_behaviour_etc(struct MapObject *, u8);
extern u8 FlagGet(u16);
extern u8 FlagSet(u16);
extern void FlagReset(u16);
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
extern u8 * sub_80BCCE8(void);
extern void ShowFieldMessage();
extern void CB2_ChooseStarter(void);
extern void sub_811AABC(u8);
extern u8 sub_811AAE8(void);
extern u32 GetMonData(struct Pokemon *mon, s32 field);
extern u8 GetFieldObjectIdByLocalIdAndMap(u8, u8, u8);
extern u32 sub_8082880(void);
extern u8 sub_803FC58(u16);

extern u16 gScriptResult;

struct Trainer
{
/* 0x00 */ u8 partyFlags;
/* 0x01 */ u8 trainerClass;
/* 0x02 */ u8 encounterMusic:7;
/* 0x02 */ u8 gender:1;
/* 0x03 */ u8 trainerPic;
/* 0x04 */ u8 trainerName[12];
/* 0x10 */ u16 items[4];
/* 0x18 */ bool8 doubleBattle;
/* 0x1C */ u32 aiFlags;
/* 0x20 */ u8 partySize;
/* 0x24 */ struct TrainerPartyMember *party;
};

struct TrainerPartyMember
{
    u16 iv;
    u8 level;
    u16 species;
};

struct TrainerBattleSpec
{
    void *ptr;
    u8 ptrType;
};

struct MyStruct
{
   u16 arr[8];
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
extern u16 *GetVarPointer(u16);

extern struct Pokemon gEnemyParty[];
extern struct Pokemon gPlayerParty[];
extern struct Trainer gTrainers[];

extern u16 gTrainerBattleMode;
extern u16 gTrainerBattleOpponent;
extern u16 gTrainerMapObjectLocalId;
extern u32 gTrainerIntroSpeech;
extern u32 gTrainerDefeatSpeech;
extern u32 gTrainerVictorySpeech;
extern u32 gTrainerCannotBattleSpeech;
extern u32 gTrainerBattleScriptReturnAddress;
extern u32 gTrainerBattleEndScript;

extern u32 gTrainerEyeTrainers[];

extern u32 gOtherText_CancelWithTerminator[];

extern u16 gUnknown_020239F8;
extern u16 gUnknown_0202E8DE;
extern u8 gUnknown_02024D26;
extern u16 gUnknown_0839B1F0[];

extern struct MapObject gMapObjects[];

extern u8 gUnknown_0819F818[];
extern u8 gUnknown_0819F840[];
extern u8 gUnknown_0819F878[];
extern u8 gUnknown_0819F887[];
extern u8 gUnknown_0819F8AE[];

extern u8 gUnknown_0819F80B[];
extern u8 gUnknown_081C6C02[];

extern u8 gTrainerBattleSpecs_0[];
extern u8 gTrainerBattleSpecs_1[];
extern u8 gTrainerBattleSpecs_2[];
extern u8 gTrainerBattleSpecs_3[];
extern u8 gTrainerBattleSpecs_4[];

extern u8 gStringVar4[];

extern u8 gBattleTransitionTable_Wild[][2];
extern u8 gBattleTransitionTable_Trainer[][2];

void sub_8082188(void);

void task01_battle_start(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch(data[0])
    {
        case 0:
            if ( !FieldPoisonEffectIsRunning() ) // is poison not active?
            {
                sub_811AABC(data[1]);
                ++data[0]; // go to case 1.
            }
            break;
        case 1:
            if ( sub_811AAE8() == 1 )
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
    if ( GetSafariZoneFlag() )
        sub_8081AA4();
    else
        sub_8081A18();
}

void sub_8081A18(void)
{
    u8 transition;
    
    ScriptContext2_Enable();
    player_bitmagic();
    sub_80597F4();
    gMain.field_8 = sub_8081C8C;
    gUnknown_020239F8 = 0;
    transition = GetHigherOrLowerLevelTransitionForWild();
    task_add_01_battle_start(transition, 0);
    sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081A5C(void)
{
    u8 transition;
    
    ScriptContext2_Enable();
    player_bitmagic();
    sub_80597F4();
    gMain.field_8 = sub_8081C8C;
    gUnknown_020239F8 = 1024;
    transition = GetHigherOrLowerLevelTransitionForWild();
    task_add_01_battle_start(transition, 0);
    sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081AA4(void)
{
    u8 transition;
    
    ScriptContext2_Enable();
    player_bitmagic();
    sub_80597F4();
    gMain.field_8 = sub_80C824C;
    gUnknown_020239F8 = 128;
    transition = GetHigherOrLowerLevelTransitionForWild();
    task_add_01_battle_start(transition, 0);
}

void task_add_01_battle_start_with_music_and_stats(void)
{
    u8 transition;
    
    transition = sub_8082080();
    task_add_01_battle_start(transition, 0);
    sav12_xor_increment(7);
    sav12_xor_increment(9);
}

void sub_8081AFC(void)
{
    CreateMaleMon(&gEnemyParty, SPECIES_RALTS, 5);
    ScriptContext2_Enable();
    gMain.field_8 = c2_exit_to_overworld_1_continue_scripts_restart_music;
    gUnknown_020239F8 = 512;
    task_add_01_battle_start(8, 0);
}

void sub_8081B3C(void)
{
    u8 transition;
    
    ScriptContext2_Enable();
    gMain.field_8 = sub_8081CEC;
    gUnknown_020239F8 = 0;
    transition = GetHigherOrLowerLevelTransitionForWild();
    task_add_01_battle_start(transition, 0);
    sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081B78(void)
{
    u8 transition;

    ScriptContext2_Enable();
    gMain.field_8 = sub_8081CEC;
    gUnknown_020239F8 = 0x2000;
    transition = GetHigherOrLowerLevelTransitionForWild();
    task_add_01_battle_start(transition, 0);
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
    if ( gGameVersion == 2 )
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
    CpuFill16(0, 0x5000000, 0x1000200);
    ResetOamRange(0, 0x80);

    if ( battle_exit_is_player_defeat(gUnknown_02024D26) == 1 )
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
    CpuFill16(0, 0x5000000, 0x1000200);
    ResetOamRange(0, 0x80);
    
    if ( battle_exit_is_player_defeat(gUnknown_02024D26) == 1 )
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
    
    if ( MetatileBehavior_IsTallGrass(tileBehavior) )
        return 0;
    if ( MetatileBehavior_IsLongGrass(tileBehavior) )
        return 1;
    if ( MetatileBehavior_IsSandOrDeepSand(tileBehavior) )
        return 2;
    switch(gMapHeader.light)
    {
        case 1:
        case 2:
        case 3:
            break;
        case 4:
            if ( sub_80574C4(tileBehavior) )
                return 8;
            if ( MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior) )
                return 5;
            return 7;
        case 8:
        case 9:
            return 8;
        case 5:
            return 3;
        case 6:
            if ( MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior) )
                return 4;
            return 9;
    }
    if ( sub_8057568(tileBehavior) )
        return 4;
    if ( MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior) )
        return 5;
    if ( sub_80574D8(tileBehavior) )
        return 6;
    if ( TestPlayerAvatarFlags(8) )
    {
        if ( sub_8057450(tileBehavior) )
            return 5;
        if ( MetatileBehavior_IsBridge(tileBehavior) == 1 )
            return 4;
    }
    if ( !(gSaveBlock1.location.mapGroup == 0 && gSaveBlock1.location.mapNum == 28) && GetSav1Weather() != 8 )
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
    
    if(flashUsed)
        return 2;
    
    if( !(MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior)) )
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

u16 GetSumOfPartyMonLevel(u8 fixCount)
{
    u32 monData;
    u8 returnThis = 0;
    int loopCounter;
    
    for (loopCounter = 0; loopCounter <= 5; loopCounter++)
    {
        monData = GetMonData(&gPlayerParty[loopCounter], MON_DATA_SPECIES2);
        if ( monData != 412 && monData ) // if the pokemon in question is either NOT Ten question marks or an egg, proceed
        // note that it actually considers the 26 glitch mons to be "valid".
        {
            if ( GetMonData(&gPlayerParty[loopCounter], MON_DATA_HP))
            {
                returnThis += GetMonData(&gPlayerParty[loopCounter], MON_DATA_LEVEL);

                fixCount--;
                if ( !fixCount ) // has it reached 0?
                    break;
            }
        }
    }
    return returnThis;
}

u8 GetSumOfEnemyPartyLevel(u16 trainerNum, u8 partyCount)
{
    // TODO: Clean this up.
    u8 i;
    u8 returnThis; // v4
    u32 _partyCount = partyCount;
    struct TrainerPartyMember *party;
   
    if ( gTrainers[trainerNum].partySize < _partyCount ) // is the actual party size smaller than the specified size?
        _partyCount = gTrainers[trainerNum].partySize; // if so, set the specified size to the actual size. seems to be error correction?
   
    returnThis = 0;
    switch(gTrainers[trainerNum].partyFlags)
    {
        case 0:
            party = gTrainers[trainerNum].party;
            for(i = 0; i < _partyCount; i++)
                returnThis += party[i].level;
            break;
        case 1:
            party = gTrainers[trainerNum].party;
            for(i = 0; i < _partyCount; i++)
                returnThis += party[i * 2].level;
            break;
        case 2:
            party = gTrainers[trainerNum].party;
            for(i = 0; i < _partyCount; i++)
                returnThis += party[i].level;
            break;
        case 3:
            party = gTrainers[trainerNum].party;
            for(i = 0; i < _partyCount; i++)
                returnThis += party[i * 2].level;
            break;
    }
    return returnThis;
}

u8 GetHigherOrLowerLevelTransitionForWild(void)
{
    u8 flashVar = sub_8081E90();
    u8 level = GetMonData(&gEnemyParty, MON_DATA_LEVEL);
   
    if ( level < (u8)GetSumOfPartyMonLevel(1) ) // is wild mon level than the player's mon level?
        return gBattleTransitionTable_Wild[flashVar][0];
    else
        return gBattleTransitionTable_Wild[flashVar][1]; // use a white fade in instead of normal transition.
}

u8 sub_8082080(void)
{
    struct Trainer *trainer;
    u8 trainerClass;
    u8 partyCount;
    u8 flashVar;
    u8 level;
    
    if ( gTrainerBattleOpponent == 1024 ) // link battle?
        return 16;
        
    trainer = gTrainers;
    
    if ( trainer[gTrainerBattleOpponent].trainerClass == 24 ) // league?
    {
        if ( gTrainerBattleOpponent == 261 )
            return 12;
        if ( gTrainerBattleOpponent == 262 )
            return 13;
        if ( gTrainerBattleOpponent == 263 )
            return 14;
        if ( gTrainerBattleOpponent == 264 )
            return 15;
        return 16;
    }
    
    if ( trainer[gTrainerBattleOpponent].trainerClass == 32 ) // team leader?
        return 16;
    
    if ( trainer[gTrainerBattleOpponent].doubleBattle == TRUE )
        partyCount = 2; // double battles always at least have 2 pokemon.
    else
        partyCount = 1;
    
    flashVar = sub_8081E90();
    level = GetSumOfEnemyPartyLevel(gTrainerBattleOpponent, partyCount);
    
    if ( level < (u8)GetSumOfPartyMonLevel(partyCount) ) // is wild mon level than the player's mon level?
        return gBattleTransitionTable_Trainer[flashVar][0];
    else
        return gBattleTransitionTable_Trainer[flashVar][1];
}

s8 sub_8082138(void)
{
    u8 monData = GetMonData(&gEnemyParty, MON_DATA_LEVEL);
    
    if ( monData < (u8)GetSumOfPartyMonLevel(1) )
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
    
    if ( sub_811AAE8() == 1 )
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
    return gTrainerBattleOpponent + 1280;
}

bool32 battle_exit_is_player_defeat(u32 a1)
{
    a1--;

    if (a1 > 6)
        return 0;

    switch(a1)
    {
        case 1:
        case 2:
            return 1;
        case 0:
        case 3:
        case 4:
        case 5:
        case 6:
            return 0;
    }
}

u32 sub_80822BC(void)
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
    pointer = &gTrainerBattleEndScript;
    gTrainerBattleEndScript = 0;
    return pointer;  
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
    if ( gTrainerMapObjectLocalId )
    {
        gUnknown_0202E8DE = gTrainerMapObjectLocalId;
        gSelectedMapObject = GetFieldObjectIdByLocalIdAndMap(gTrainerMapObjectLocalId, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
    }
}

u8 *TrainerBattleConfigure(u8 *a1)
{
    sub_80822BC();
    gTrainerBattleMode = TrainerBattleLoadArg8(a1);
    
    switch (gTrainerBattleMode)
    {
    case 3:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_3, a1);
        return gUnknown_0819F878;
    case 4:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_2, a1);
        battle_80801F0();
        return gUnknown_0819F840;
    case 1:
    case 2:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_1, a1);
        battle_80801F0();
        return gUnknown_0819F818;
    case 6:
    case 8:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_4, a1);
        battle_80801F0();
        return gUnknown_0819F840;
    case 7:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_2, a1);
        battle_80801F0();
        gTrainerBattleOpponent = sub_8082C4C(gTrainerBattleOpponent);
        return gUnknown_0819F8AE;
    case 5:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_0, a1);
        battle_80801F0();
        gTrainerBattleOpponent = sub_8082C4C(gTrainerBattleOpponent);
        return gUnknown_0819F887;
    default:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_0, a1);
        battle_80801F0();
        return gUnknown_0819F818;
    }
}

void TrainerWantsBattle(u8 ptr, int a2)
{
    gSelectedMapObject = ptr;
    gUnknown_0202E8DE = gMapObjects[ptr].localId;
    TrainerBattleConfigure(a2 + 1);
    ScriptContext1_SetupScript(gUnknown_0819F80B);
    ScriptContext2_Enable();
}

u8 GetTrainerFlagFromScriptPointer(int a1)
{
    u32 localFlag;
 
    localFlag = TrainerBattleLoadArg16(a1 + 2);
    return FlagGet(localFlag + 0x500);
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
    return FlagGet(flag + 0x500);
}

void trainer_flag_set(u16 flag)
{
    FlagSet(flag + 0x500);
}

void trainer_flag_clear(u16 flag)
{
    FlagReset(flag + 0x500);
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
    if ( gTrainerBattleOpponent == 1024 )
    {
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music); // link battle?
    }
    else if ( battle_exit_is_player_defeat(gUnknown_02024D26) == 1 )
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
    if ( gTrainerBattleOpponent == 1024 )
    {
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music); // link battle?
    }
    else if ( battle_exit_is_player_defeat(gUnknown_02024D26) == 1 )
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
    sub_808281C();
    ShowFieldMessage();
}

u32 sub_80826E8(void)
{
    u32 *result = gTrainerBattleScriptReturnAddress;
    
    if ( !gTrainerBattleScriptReturnAddress )
        return gUnknown_081C6C02;
    
    return result;
}

u32 sub_8082700(void)
{
    u32 *result = gTrainerBattleEndScript;
    
    if ( !gTrainerBattleEndScript )
        return gUnknown_081C6C02;
    
    return result;
}

void sub_8082718()
{
    ShowFieldMessage(sub_8082880());
}

void sub_8082728(void) // sets the music to be played after a battle
{
    u16 music;
    u8 val;
    
    if ( gTrainerBattleMode != 1 && gTrainerBattleMode != 8 )
    {
        val = sub_803FC58(gTrainerBattleOpponent);
        if ( val > 13 )
            music = 423;
        else
        {
            switch ( val )
            {
                // TODO: Replace with music constants.
                case 0:
                    music = 380;
                    break;
                case 1:
                    music = 407;
                    break;
                case 2:
                    music = 379;
                    break;
                case 4:
                    music = 416;
                    break;
                case 5:
                    music = 417;
                    break;
                case 6:
                    music = 419;
                    break;
                case 7:
                    music = 441;
                    break;
                case 8:
                    music = 385;
                    break;
                case 9:
                    music = 449;
                    break;
                case 10:
                    music = 450;
                    break;
                case 11:
                    music = 451;
                    break;
                case 12:
                    music = 453;
                    break;
                case 13:
                    music = 397;
                    break;
                default:
                    music = 423;
            }
        }
        PlayNewMapMusic(music);
    }
}

u32 ReturnEmptyStringIfNull(u32 *result)
{
    if ( result )
        return result;
    else
        return gOtherText_CancelWithTerminator;
}

u32 sub_808281C(void)
{
    return ReturnEmptyStringIfNull(gTrainerIntroSpeech);
}

u8 *sub_8082830(void)
{
    u32 *var;
    
    if ( gTrainerBattleOpponent == 1024 )
        var = sub_80BCCE8();
    else
        var = gTrainerDefeatSpeech;
    
    StringExpandPlaceholders(gStringVar4, ReturnEmptyStringIfNull(var));
    return gStringVar4;
}

u32 unref_sub_808286C(void)
{
    return ReturnEmptyStringIfNull(gTrainerVictorySpeech);
}

u32 sub_8082880(void)
{
    return ReturnEmptyStringIfNull(gTrainerCannotBattleSpeech);
}

s32 sub_8082894(u16 *ptr, u16 var)
{
    s32 i;
    
    for(i = 0; i <= 55; i++)
    {
        if(ptr[i * 8] == var)
            return i;
    }
    return -1;
}

s32 sub_80828B8(struct MyStruct *a, u16 b)
{
   s32 i;
   
   for(i = 0; i < 56; i++)
   {
       s32 j;
       
       for(j = 0; j < 5 && a[i].arr[j] != 0; j++)
       {
           if(a[i].arr[j] == b)
               return i;
       }
   }
   return -1;
}

u32 sub_80828FC(struct MyStruct *a, u16 b, u16 c)
{
   s32 i;
   s32 ret = 0;
   
   for (i = 0; i < 56; i++)
   {
       if (a[i].arr[5] == b && a[i].arr[6] == c)
       {
           if (gSaveBlock1.trainerRematches[i] != 0)
           {
               ret = 1;
               continue;
           }
           if (trainer_flag_check(a[i].arr[0]) == TRUE && (Random() % 100) <= 0x1E)
           {
               ret = 1;
               
               while(ret <= 4 && a[i].arr[ret] != 0 && trainer_flag_check(a[i].arr[ret]))
                   ret++;
               gSaveBlock1.trainerRematches[i] = ret;
               ret = 1;
           }
       }
   }
   return ret;
}

s32 sub_80829A8(struct MyStruct *a1, u16 a2, u16 a3)
{
   s32 i;
   
   for (i = 0; i <= 55; i++)
   {
       if (a1[i].arr[5] == a2 && a1[i].arr[6] == a3 && gSaveBlock1.trainerRematches[i])
           return 1;
   }
   return 0;
}

s32 sub_80829E8(struct MyStruct *a1, u16 a2, u16 a3)
{
    s32 i;
    
    for (i = 0; i <= 55; i++)
    {
        if (a1[i].arr[5] == a2 && a1[i].arr[6] == a3 )
            return 1;
    }
    return 0;
}

bool8 sub_8082A18(u16 *a1, u16 a2)
{
    s32 v2 = sub_8082894(a1, a2);
    
    if (v2 != -1 && v2 <= 99 && gSaveBlock1.trainerRematches[v2])
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8082A54(u16 *a1, u16 a2)
{
    s32 v2 = sub_80828B8(a1, a2);
    
    if (v2 != -1 && v2 <= 99 && gSaveBlock1.trainerRematches[v2])
        return TRUE;
    else
        return FALSE;
}

__attribute__((naked))
u16 sub_8082A90(struct MyStruct *a1, u16 a2)
{
    // TODO: decompile.
    asm("push {r4-r7,lr}\n\
    add r4, r0, #0\n\
    lsl r1, #16\n\
    lsr r1, #16\n\
    bl sub_8082894\n\
    add r1, r0, #0\n\
    mov r0, #0x1\n\
    neg r0, r0\n\
    cmp r1, r0\n\
    bne _08082AB8\n\
    mov r0, #0\n\
    b _08082ADE\n\
_08082AAA:\n\
    sub r0, r6, #0x1\n\
    lsl r0, #1\n\
    add r0, r7, r0\n\
    ldrh r0, [r0]\n\
    b _08082ADE\n\
_08082AB4:\n\
    ldrh r0, [r5]\n\
    b _08082ADE\n\
_08082AB8:\n\
    lsl r0, r1, #4\n\
    add r7, r4, r0\n\
    mov r6, #0x1\n\
    add r5, r7, #0x2\n\
    add r4, r5, #0\n\
_08082AC2:\n\
    ldrh r0, [r4]\n\
    cmp r0, #0\n\
    beq _08082AAA\n\
    bl trainer_flag_check\n\
    lsl r0, #24\n\
    cmp r0, #0\n\
    beq _08082AB4\n\
    add r4, #0x2\n\
    add r5, #0x2\n\
    add r6, #0x1\n\
    cmp r6, #0x4\n\
    ble _08082AC2\n\
    ldrh r0, [r7, #0x8]\n\
_08082ADE:\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n");
}

void sub_8082AE4(u16 *a1, u16 a2)
{
    s32 var = sub_80828B8(a1, a2);
    
    if ( var != -1 )
        gSaveBlock1.trainerRematches[var] = 0;
}

bool8 sub_8082B10(struct MyStruct *a1, u16 a2)
{
    s32 var = sub_8082894(a1, a2);

    if ( var != -1 && trainer_flag_check(a1[var].arr[1]) )
        return TRUE;
    else
        return FALSE;
}

bool32 sub_8082B44(void)
{
    int j = 0;
    u32 i = 0;
    
    for(i = 0; i < 8; ++i)
    {
        if ( FlagGet(gUnknown_0839B1F0[i]) == 1 && ++j > 4 )
            return 1;
    }
    return 0;
}

void sub_8082B78(void)
{
    if (sub_8082B44())
    {
        if (gSaveBlock1.trainerRematchStepCounter >= 255)
            gSaveBlock1.trainerRematchStepCounter = 255;
        else
            gSaveBlock1.trainerRematchStepCounter++;
    }
}

bool32 sub_8082BA4(void)
{
    if (sub_8082B44() && gSaveBlock1.trainerRematchStepCounter > 0xFE)
        return TRUE;
    else
        return FALSE;
}

void sub_8082BD0(u16 a1, u16 a2)
{
    if ( sub_8082BA4() && sub_80828FC(gTrainerEyeTrainers, a1, a2) == 1 )
        gSaveBlock1.trainerRematchStepCounter = 0;
}

s32 sub_8082C0C(u16 a1, u16 a2)
{
    return sub_80829A8(gTrainerEyeTrainers, a1, a2);
}

s32 unref_sub_8082C2C(u16 a1, u16 a2)
{
    return sub_80829E8(gTrainerEyeTrainers, a1, a2);
}

u16 sub_8082C4C(u16 a1)
{
    return sub_8082A90(gTrainerEyeTrainers, a1);
}

s32 sub_8082C68(void)
{
    if ( sub_8082A18(gTrainerEyeTrainers, gTrainerBattleOpponent) )
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

/*
    thumb_func_start sub_8082A90
sub_8082A90: @ 8082A90
    push {r4-r7,lr}
    adds r4, r0, 0
    lsls r1, 16
    lsrs r1, 16
    bl sub_8082894
    adds r1, r0, 0
    movs r0, 0x1
    negs r0, r0
    cmp r1, r0
    bne _08082AB8
    movs r0, 0
    b _08082ADE
_08082AAA:
    subs r0, r6, 0x1
    lsls r0, 1
    adds r0, r7, r0
    ldrh r0, [r0]
    b _08082ADE
_08082AB4:
    ldrh r0, [r5]
    b _08082ADE
_08082AB8:
    lsls r0, r1, 4
    adds r7, r4, r0
    movs r6, 0x1
    adds r5, r7, 0x2
    adds r4, r5, 0
_08082AC2:
    ldrh r0, [r4]
    cmp r0, 0
    beq _08082AAA
    bl trainer_flag_check
    lsls r0, 24
    cmp r0, 0
    beq _08082AB4
    adds r4, 0x2
    adds r5, 0x2
    adds r6, 0x1
    cmp r6, 0x4
    ble _08082AC2
    ldrh r0, [r7, 0x8]
_08082ADE:
    pop {r4-r7}
    pop {r1}
    bx r1
    thumb_func_end sub_8082A90
*/