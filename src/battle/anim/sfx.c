#include "global.h"
#include "battle_anim.h"
#include "sound.h"
#include "task.h"

extern s16 gBattleAnimArgs[];

void sub_812AF98(u8 taskId);
void sub_812B004(u8 taskId);
void sub_812B004(u8 taskId);

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

#ifdef NONMATCHING
void sub_812AF98(u8 taskId) // r4 := TASK
{
    s16 pan = TASK.data[2]; // r5
    s8 var0 = TASK.data[4]; // r6

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
        TASK.data[2] = sub_8077104(var0 + pan);
    }
}
#else
__attribute__((naked))
void sub_812AF98(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    ldr r2, _0812AFC8 @ =gTasks\n\
    lsls r1, r0, 2\n\
    adds r1, r0\n\
    lsls r1, 3\n\
    adds r4, r1, r2\n\
    ldrh r5, [r4, 0xC]\n\
    ldrb r6, [r4, 0x10]\n\
    ldrh r0, [r4, 0x1E]\n\
    adds r0, 0x1\n\
    movs r1, 0\n\
    strh r0, [r4, 0x1E]\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x6F\n\
    bne _0812AFD0\n\
    movs r0, 0x5\n\
    strh r0, [r4, 0x1C]\n\
    strh r1, [r4, 0x1E]\n\
    ldr r0, _0812AFCC @ =sub_812B004\n\
    str r0, [r4]\n\
    b _0812AFFE\n\
    .align 2, 0\n\
_0812AFC8: .4byte gTasks\n\
_0812AFCC: .4byte sub_812B004\n\
_0812AFD0:\n\
    ldrh r0, [r4, 0x1C]\n\
    adds r0, 0x1\n\
    strh r0, [r4, 0x1C]\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    cmp r0, 0xB\n\
    bne _0812AFEA\n\
    strh r1, [r4, 0x1C]\n\
    ldrh r0, [r4, 0x8]\n\
    lsls r1, r5, 24\n\
    asrs r1, 24\n\
    bl PlaySE12WithPanning\n\
_0812AFEA:\n\
    lsls r1, r6, 24\n\
    asrs r1, 24\n\
    lsls r0, r5, 16\n\
    asrs r0, 16\n\
    adds r0, r1\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    bl sub_8077104\n\
    strh r0, [r4, 0xC]\n\
_0812AFFE:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif // NONMATCHING

