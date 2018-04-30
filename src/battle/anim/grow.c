#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80D0904(u8 taskId);

// grow (grows a Pokemon then shrinks back to normal size.)
// Used in Swagger and Bulk Up.

const union AffineAnimCmd gSpriteAffineAnim_83D7714[] =
{
    AFFINEANIMCMD_FRAME(-4, -5, 0, 12),
    AFFINEANIMCMD_FRAME(0, 0, 0, 24),
    AFFINEANIMCMD_FRAME(4, 5, 0, 12),
    AFFINEANIMCMD_END,
};

void sub_80D08C8(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(0);
    sub_80798F4(task, spriteId, &gSpriteAffineAnim_83D7714);
    task->func = sub_80D0904;
}

static void sub_80D0904(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (!sub_807992C(task))
        DestroyAnimVisualTask(taskId);
}
