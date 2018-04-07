#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "task.h"

extern s16 gBattleAnimArgs[8];

extern const union AffineAnimCmd gUnknown_083D7CA8[];

void sub_80D2D3C(u8);

void sub_80D2CF8(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);

    sub_80798F4(&gTasks[taskId], spriteId, gUnknown_083D7CA8);
    gTasks[taskId].func = sub_80D2D3C;
}

void sub_80D2D3C(u8 taskId)
{
    if (!sub_807992C(&gTasks[taskId]))
        DestroyAnimVisualTask(taskId);
}
