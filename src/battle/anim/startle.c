#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// startle (the pokemon sprite shrivels upward and restores after a brief time.)
// Used in Fake Out, Trick, and Astonish.

const union AffineAnimCmd gSpriteAffineAnim_83D7A98[] =
{
    AFFINEANIMCMD_FRAME(0x000A, 0xFFF3, 0x00, 0x0A),
    AFFINEANIMCMD_FRAME(0xFFF6, 0x000D, 0x00, 0x0A),
    AFFINEANIMCMD_END,
};

// opponent
void sub_80D1E38(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(1);
    if (++gTasks[taskId].data[0] == 1)
    {
        sub_80798F4(&gTasks[taskId], GetAnimBattlerSpriteId(1), &gSpriteAffineAnim_83D7A98);
        gSprites[spriteId].pos2.x = 4;
    }
    else
    {
        gSprites[spriteId].pos2.x = -gSprites[spriteId].pos2.x;
        if (sub_807992C(&gTasks[taskId]) == 0)
        {
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

// player
void sub_80D1EC8(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(0);
    if (++gTasks[taskId].data[0] == 1)
    {
        sub_80798F4(&gTasks[taskId], GetAnimBattlerSpriteId(0), &gSpriteAffineAnim_83D7A98);
        gSprites[spriteId].pos2.x = 4;
    }
    else
    {
        gSprites[spriteId].pos2.x = -gSprites[spriteId].pos2.x;
        if (sub_807992C(&gTasks[taskId]) == 0)
        {
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}
