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
