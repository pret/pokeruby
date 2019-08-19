#ifndef GUARD_BATTLEAI_H
#define GUARD_BATTLEAI_H

enum
{
    TARGET,
    USER
};

// AI states
enum
{
    BATTLEAI_SETTING_UP,
    BATTLEAI_PROCESSING,
    BATTLEAI_FINISHED,
    BATTLEAI_DO_NOT_PROCESS
};



#define AI_FLAG_CHECK_BAD_MOVE        (1 <<  0)
#define AI_FLAG_CHECK_VIABILITY       (1 <<  1)
#define AI_FLAG_TRY_TO_FAINT          (1 <<  2)
#define AI_FLAG_SETUP_FIRST_TURN      (1 <<  3)
#define AI_FLAG_RISKY                 (1 <<  4)
#define AI_FLAG_PREFER_STRONGEST_MOVE (1 <<  5)
#define AI_FLAG_PREFER_BATON_PASS     (1 <<  6)
#define AI_FLAG_NOTHING               (1 <<  7)
#define AI_FLAG_HP_AWARE              (1 <<  8)
#define AI_FLAG_UNKNOWN               (1 <<  9)
#define AI_FLAG_ROAMING               (1 << 29)
#define AI_FLAG_SAFARI                (1 << 30)
#define AI_FLAG_GO_EASY               (1 << 31)



// battle_ai
void BattleAI_SetupAIData(void);
u8 BattleAI_GetAIActionToUse(void);
void BattleAI_DoAIProcessing(void);
void sub_810745C(void);
void AIStackPushVar(u8 *);
u8 AIStackPop(void);
void BattleAI_HandleItemUseBeforeAISetup(void);
void RecordAbilityBattle(u8 a, u8 b);

#endif
