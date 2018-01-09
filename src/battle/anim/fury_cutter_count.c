#include "global.h"
#include "battle.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[8];

// fury_cutter (updates the direction and count of the fury cutter animation)
// Used in Fury Cutter.

void UpdateFuryCutterAnimDirection(u8 taskId)
{
    gBattleAnimArgs[7] = gAnimDisableStructPtr->furyCutterCounter & 1;
    DestroyAnimVisualTask(taskId);
}

void UpdateFuryCutterAnimCount(u8 taskId)
{
    gBattleAnimArgs[7] = gAnimDisableStructPtr->furyCutterCounter;
    DestroyAnimVisualTask(taskId);
}
