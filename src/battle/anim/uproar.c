#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "task.h"

extern s16 gBattleAnimArgs[8];

static void sub_80D2D3C(u8);

const union AffineAnimCmd gSpriteAffineAnim_83D7CA8[] =
{
    AFFINEANIMCMD_FRAME(-12, 8, 0, 4),
    AFFINEANIMCMD_FRAME(20, -20, 0, 4),
    AFFINEANIMCMD_FRAME(-8, 12, 0, 4),
    AFFINEANIMCMD_END,
};

void sub_80D2CF8(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);

    sub_80798F4(&gTasks[taskId], spriteId, gSpriteAffineAnim_83D7CA8);
    gTasks[taskId].func = sub_80D2D3C;
}

static void sub_80D2D3C(u8 taskId)
{
    if (!sub_807992C(&gTasks[taskId]))
        DestroyAnimVisualTask(taskId);
}
