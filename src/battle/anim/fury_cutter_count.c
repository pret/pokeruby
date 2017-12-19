#include "global.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[8];
extern u8 *gDisableStructMoveAnim; // TODO: this is declared with a different type in different files

// fury_cutter (updates the direction and count of the fury cutter animation)
// Used in Fury Cutter.

void UpdateFuryCutterAnimDirection(u8 taskId)
{
    gBattleAnimArgs[7] = gDisableStructMoveAnim[16] & 1;
    DestroyAnimVisualTask(taskId);
}

void UpdateFuryCutterAnimCount(u8 taskId)
{
    gBattleAnimArgs[7] = gDisableStructMoveAnim[16];
    DestroyAnimVisualTask(taskId);
}
