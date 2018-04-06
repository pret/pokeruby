#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80D0428(u8 taskId);

// shadow_enlarge (the magnifying-like shadow over the Pokemon effect)
// Used in Disable.

void sub_80D03C4(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(1);
    sub_8078E70(spriteId, 1);
    obj_id_set_rotscale(spriteId, 0xD0, 0xD0, 0);
    sub_8079108(gSprites[spriteId].oam.paletteNum + 16, 0);
    gTasks[taskId].data[0] = 0x50;
    gTasks[taskId].func = sub_80D0428;
}

void sub_80D0428(u8 taskId)
{
    if (--gTasks[taskId].data[0] == -1)
    {
        u8 spriteId = GetAnimBattlerSpriteId(1);
        sub_8078F40(spriteId);
        sub_8079108(gSprites[spriteId].oam.paletteNum + 16, 1);
        DestroyAnimVisualTask(taskId);
    }
}
