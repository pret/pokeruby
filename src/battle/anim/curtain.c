#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u16 gBattle_WIN0V;
extern u16 gBattle_WIN0H;

static void sub_80D1D48(u8 taskId);
static void sub_80D1D9C(u8 taskId);

// curtain (a sweeping blackening curtain in the BG)
// Used in Fake Out.

void sub_80D1CD0(u8 taskId)
{
    int zero;
    bool8 result = IsContest();
    u16 var = 0xF0;
    if (result)
    {
        var = 0x98;
        zero = 0;
    }
    else
    {
        zero = 0;
    }

    gBattle_WIN0H = var;
    gBattle_WIN0V = 0xA0;
    REG_WIN0H = var;
    REG_WIN0V = 0xA0;
    REG_WININ = 0x3F1F;
    REG_WINOUT = 0x3F3F;
    REG_BLDCNT = 0xC8;
    REG_BLDY = 0x10;
    gTasks[taskId].data[0] = zero;
    gTasks[taskId].data[1] = var;
    gTasks[taskId].func = sub_80D1D48;
}

void sub_80D1D48(u8 taskId)
{
    gTasks[taskId].data[0] += 13;
    gTasks[taskId].data[1] -= 13;
    if (gTasks[taskId].data[0] >= gTasks[taskId].data[1])
    {
        gBattle_WIN0H = 0;
        gTasks[taskId].func = sub_80D1D9C;
    }
    else
    {
        gBattle_WIN0H = gTasks[taskId].data[1] | (gTasks[taskId].data[0] << 8);
    }
}

void sub_80D1D9C(u8 taskId)
{
    if (++gTasks[taskId].data[10] == 5)
    {
        gTasks[taskId].data[11] = 0x88;
        RequestSpriteCopy((u8 *)(&gTasks[taskId].data[11]), (u8 *)(&REG_BLDCNT), 2);
        BlendPalettes(sub_80791A8(1, 0, 0, 0, 0, 0, 0), 16, RGB(31, 31, 31));
    }
    else if (gTasks[taskId].data[10] > 4)
    {
        gBattle_WIN0H = 0;
        gBattle_WIN0V = 0;
        REG_WININ = 0x3F3F;
        REG_WINOUT = 0x3F3F;
        REG_BLDCNT = 0;
        REG_BLDY = 0;
        DestroyAnimVisualTask(taskId);
    }
}
