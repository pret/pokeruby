#ifndef GUARD_BATTLE_SETUP_H
#define GUARD_BATTLE_SETUP_H

// task01_battle_start
// task_add_01_battle_start
void CheckForSafariZoneAndProceed(void);
void StartBattle_StandardWild(void);
void StartBattle_Roamer(void);
void StartBattle_Safari(void);
// task_add_01_battle_start_with_music_and_stats
// StartBattle_WallyTutorial
void StartBattle_ScriptedWild(void);
// StartBattle_SouthernIsland
// StartBattle_Rayquaza
// StartBattle_GroudonKyogre
// StartBattle_Regi
void HandleWildBattleEnd(void);
void HandleScriptedWildBattleEnd(void);
// GetBattleTerrain
// GetBattleTransitionTypeByMap
// GetSumOfPartyMonLevel
// GetSumOfEnemyPartyLevel
u8 GetWildBattleTransition(void);
u8 GetTrainerBattleTransition(void);
// GetBattleTowerBattleTransition
// ChooseStarter
void CB2_GiveStarter(void);
void CB2_StartFirstBattle(void);
void HandleFirstBattleEnd(void);
// TrainerBattleLoadArg32
// TrainerBattleLoadArg16
// TrainerBattleLoadArg8
// trainerflag_opponent
bool32 battle_exit_is_player_defeat(u32 a1);
// sub_80822BC
// TrainerBattleLoadArgs
// battle_80801F0
u8 *TrainerBattleConfigure(u8 *data);
void TrainerWantsBattle(u8, u8 *);
bool32 GetTrainerFlagFromScriptPointer(u8 *data);
// sub_8082524
// sub_8082558
// sub_8082564
// sub_808257C
// unref_sub_8082590
u8 trainer_flag_check(u16);
void trainer_flag_set(u16);
void trainer_flag_clear(u16);
void sub_80825E4(void);
void sub_808260C(void);
// do_choose_name_or_words_screen
// sub_80826B0
// sub_80826D8
u8 *sub_80826E8(void);
u8 *sub_8082700(void);
// sub_8082718
// PlayTrainerEncounterMusic
// SanitizeString
u8 *sub_808281C(void);
// sub_8082830
// unref_sub_808286C
u8 *sub_8082880(void);
// sub_8082894
// sub_80828B8
// sub_80828FC
// sub_80829A8
// sub_80829E8
// sub_8082A18
// sub_8082A54
// sub_8082A90
// sub_8082AE4
// sub_8082B10
// sub_8082B44
void sub_8082B78(void);
// sub_8082BA4
void sub_8082BD0(u16, u16);
// sub_8082C0C
// unref_sub_8082C2C
u16 sub_8082C4C(u16 a1);
// sub_8082C68
// sub_8082C9C
void sub_8082CB8(void);

#endif // GUARD_BATTLE_SETUP_H
