#include "global.h"
#include "battle_anim.h"
#include "sound.h"
#include "task.h"

extern s16 gBattleAnimArgs[];

void sub_812AF98(u8 taskId);
void sub_812B004(u8 taskId);
void sub_812B004(u8 taskId);
void sub_812B108(u8 taskId);

void sub_812AF30(u8 taskId)
{
    s8 sourcePan, targetPan, incrementPan;
    
    TASK.data[0] = gBattleAnimArgs[0];
    TASK.data[1] = gBattleAnimArgs[1];

    sourcePan = BattleAnimAdjustPanning(-64);
    targetPan = BattleAnimAdjustPanning(63);
    incrementPan = CalculatePanIncrement(sourcePan, targetPan, 2);

    TASK.data[2] = sourcePan;
    TASK.data[3] = targetPan;
    TASK.data[4] = incrementPan;
    TASK.data[10] = 10;

    TASK.func = sub_812AF98;
}

void sub_812AF98(u8 taskId)
{
    s16 pan = TASK.data[2];
    s8 var0 = TASK.data[4];

    if (++TASK.data[11] == 111)
    {
        TASK.data[10] = 5;
        TASK.data[11] = 0;
        TASK.func = sub_812B004;
    } 
    else
    {
        if (++TASK.data[10] == 11)
        {
            TASK.data[10] = 0;
            PlaySE12WithPanning(TASK.data[0], pan);
        }
        pan += var0;
        TASK.data[2] = sub_8077104(pan);
    }
}

void sub_812B004(u8 taskId)
{
    s8 pan;

    if (++TASK.data[10] == 6)
    {
        TASK.data[10] = 0;

        pan = BattleAnimAdjustPanning(0x3f);
        PlaySE12WithPanning(TASK.data[1], pan);

        if (++TASK.data[11] == 2)
        {
            DestroyAnimSoundTask(taskId);
        }
    }
}

void sub_812B058(u8 taskId)
{
    s16 sp;
    u8 r10, r7, r9;
    s8 r5, r6, r4, r0;

    sp = gBattleAnimArgs[0];
    r5 = gBattleAnimArgs[2];
    r6 = gBattleAnimArgs[3];
    r10 = gBattleAnimArgs[4];
    r7 = gBattleAnimArgs[5];
    r9 = gBattleAnimArgs[6];
    r4 = BattleAnimAdjustPanning(gBattleAnimArgs[1]);
    r5 = BattleAnimAdjustPanning(r5);
    r0 = CalculatePanIncrement(r4, r5, r6);

    TASK.data[0] = sp;
    TASK.data[1] = r4;
    TASK.data[2] = r5;
    TASK.data[3] = r0;
    TASK.data[4] = r10;
    TASK.data[5] = r7;
    TASK.data[6] = r9;
    TASK.data[10] = 0;
    TASK.data[11] = r4;
    TASK.data[12] = r9;

    TASK.func = sub_812B108;
    sub_812B108(taskId);
}

void sub_812B108(u8 taskId)
{
    if (TASK.data[12]++ == TASK.data[6])
    {
        TASK.data[12] = 0;
        PlaySE12WithPanning(TASK.data[0], TASK.data[11]);

        if (--TASK.data[4] == 0)
        {
            DestroyAnimSoundTask(taskId);
            return;
        }
    }

    if (TASK.data[10]++ == TASK.data[5])
    {
        TASK.data[10] = 0;
        TASK.data[11] += TASK.data[3];
        TASK.data[11] = sub_8077104(TASK.data[11]);
    }
}
