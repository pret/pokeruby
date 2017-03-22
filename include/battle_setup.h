#ifndef GUARD_BATTLE_SETUP_H
#define GUARD_BATTLE_SETUP_H

#define NUM_TRAINER_EYE_TRAINERS 56
#define TRAINER_REMATCH_STEPS 255

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

//void task01_battle_start(u8 taskId);
//void task_add_01_battle_start(u8 transition, u16 song);
void CheckForSafariZoneAndProceed(void);
void StartBattle_StandardWild(void);
void StartBattle_Roamer(void);
void StartBattle_Safari(void);
//void task_add_01_battle_start_with_music_and_stats(void);
//void StartBattle_WallyTutorial(void);
void StartBattle_ScriptedWild(void);
//void StartBattle_SouthernIsland(void);
//void StartBattle_Rayquaza(void);
//void StartBattle_GroudonKyogre(void);
//void StartBattle_Regi(void);
void HandleWildBattleEnd(void);
void HandleScriptedWildBattleEnd(void);
s8 GetBattleTerrain(void);
//s8 GetBattleTransitionTypeByMap(void);
//u16 GetSumOfPartyMonLevel(u8 numMons);
//u8 GetSumOfEnemyPartyLevel(u16 trainerNum, u8 numMons);
u8 GetWildBattleTransition(void);
u8 GetTrainerBattleTransition(void);
u8 GetBattleTowerBattleTransition(void);
//void ChooseStarter(void);
void CB2_GiveStarter(void);
void CB2_StartFirstBattle(void);
void HandleFirstBattleEnd(void);
//u32 TrainerBattleLoadArg32(u8 *ptr);
//u16 TrainerBattleLoadArg16(u8 *ptr);
//u8 TrainerBattleLoadArg8(u8 *ptr);
//u16 trainerflag_opponent(void);
bool32 battle_exit_is_player_defeat(u32 a1);
//void sub_80822BC(void);
//void TrainerBattleLoadArgs(const struct TrainerBattleSpec *specs, u8 *data);
//void battle_80801F0(void);
u8 *TrainerBattleConfigure(u8 *data);
void TrainerWantsBattle(u8, u8 *);
bool32 GetTrainerFlagFromScriptPointer(u8 *data);
//void sub_8082524(void);
//u8 sub_8082558(void);
//u8 sub_8082564(void);
//void sub_808257C(void);
//void unref_sub_8082590(void); // unused
u8 trainer_flag_check(u16);
void trainer_flag_set(u16);
void trainer_flag_clear(u16);
void sub_80825E4(void);
void sub_808260C(void);
void do_choose_name_or_words_screen(void);
//void sub_80826B0(void);
//void sub_80826D8(void);
u8 *sub_80826E8(void);
u8 *sub_8082700(void);
//void sub_8082718(void);
//void PlayTrainerEncounterMusic(void);
//u8 *SanitizeString(u8 *str);
u8 *sub_808281C(void);
u8 *sub_8082830(void);
//u8 *unref_sub_808286C(void);
u8 *sub_8082880(void);
//s32 sub_8082894(const struct TrainerEyeTrainer *trainers, u16 trainerNum);
//s32 sub_80828B8(const struct TrainerEyeTrainer *trainers, u16 trainerNum);
//bool32 sub_80828FC(const struct TrainerEyeTrainer *trainers, u16 mapGroup, u16 mapNum);
//s32 sub_80829A8(const struct TrainerEyeTrainer *trainers, u16 mapGroup, u16 mapNum);
//s32 sub_80829E8(const struct TrainerEyeTrainer *trainers, u16 mapGroup, u16 mapNum);
//bool8 sub_8082A18(const struct TrainerEyeTrainer *trainers, u16 trainerNum);
//bool8 sub_8082A54(const struct TrainerEyeTrainer *trainers, u16 trainerNum);
//u16 sub_8082A90(const struct TrainerEyeTrainer *trainers, u16 trainerNum);
//void sub_8082AE4(const struct TrainerEyeTrainer *trainers, u16 trainerNum);
//bool8 sub_8082B10(const struct TrainerEyeTrainer *trainers, u16 trainerNum);
//bool32 sub_8082B44(void);
void sub_8082B78(void);
//bool32 sub_8082BA4(void);
void sub_8082BD0(u16, u16);
s32 sub_8082C0C(u16 mapGroup, u16 mapNum);
s32 unref_sub_8082C2C(u16 mapGroup, u16 mapNum);
u16 sub_8082C4C(u16 a1);
//s32 sub_8082C68(void);
//u8 sub_8082C9C(void);
void sub_8082CB8(void);

#endif // GUARD_BATTLE_SETUP_H
