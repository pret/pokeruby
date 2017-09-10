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

struct TrainerEyeTrainer
{
   u16 opponentIDs[5];  // Each of these trainers has 5 increasingly stronger teams.
   u16 mapGroup;
   u16 mapNum;
};

void BattleSetup_StartWildBattle(void);
void BattleSetup_StartRoamerBattle(void);
void BattleSetup_StartScriptedWildBattle(void);
s8 BattleSetup_GetTerrain(void);
u8 BattleSetup_GetBattleTowerBattleTransition(void);
u8 *BattleSetup_ConfigureTrainerBattle(const u8 *data);
void TrainerWantsBattle(u8, u8 *);

bool32 GetTrainerFlagFromScriptPointer(u8 *data);
//void sub_8082524(void);
//u8 ScrSpecial_GetTrainerBattleMode(void);
//u8 ScrSpecial_HasTrainerBeenFought(void);
//void sub_808257C(void);
//void unref_sub_8082590(void); // unused
u8 HasTrainerAlreadyBeenFought(u16);
void trainer_flag_set(u16);
void trainer_flag_clear(u16);
void BattleSetup_StartTrainerBattle(void);
void sub_808260C(void);
void do_choose_name_or_words_screen(void);
//void ScrSpecial_StartTrainerEyeRematch(void);
//void ScrSpecial_ShowTrainerIntroSpeech(void);
u8 *BattleSetup_GetScriptAddrAfterBattle(void);
u8 *BattleSetup_GetTrainerPostBattleScript(void);
//void ScrSpecial_ShowTrainerNonBattlingSpeech(void);
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
//bool8 DoesTrainerEyeTrainerWantRematch(const struct TrainerEyeTrainer *trainers, u16 trainerNum);
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
//u8 ScrSpecial_GetTrainerEyeRematchFlag(void);
void sub_8082CB8(void);

#endif // GUARD_BATTLE_SETUP_H
