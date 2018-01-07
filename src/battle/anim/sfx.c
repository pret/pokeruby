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

#ifdef NONMATCHING
void sub_812B058(u8 taskId)
{
    s16 sp, r10, r7, r9;
    s8 r5, r6, r4, r0;

    sp = gBattleAnimArgs[0];
    r5 = gBattleAnimArgs[2];
    r6 = gBattleAnimArgs[3];
    r10  = gBattleAnimArgs[4];
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
#else
__attribute__((naked))
void sub_812B058(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    mov r8, r0\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    ldr r0, _0812B0FC @ =gBattleAnimArgs\n\
    ldrh r1, [r0]\n\
    str r1, [sp]\n\
    ldrb r5, [r0, 0x4]\n\
    ldrb r6, [r0, 0x6]\n\
    ldrb r3, [r0, 0x8]\n\
    mov r10, r3\n\
    ldrb r7, [r0, 0xA]\n\
    ldrb r1, [r0, 0xC]\n\
    mov r9, r1\n\
    ldrb r0, [r0, 0x2]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    bl BattleAnimAdjustPanning\n\
    adds r4, r0, 0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    lsls r5, 24\n\
    asrs r5, 24\n\
    adds r0, r5, 0\n\
    bl BattleAnimAdjustPanning\n\
    adds r5, r0, 0\n\
    lsls r4, 24\n\
    asrs r4, 24\n\
    lsls r5, 24\n\
    asrs r5, 24\n\
    lsls r6, 24\n\
    asrs r6, 24\n\
    adds r0, r4, 0\n\
    adds r1, r5, 0\n\
    adds r2, r6, 0\n\
    bl CalculatePanIncrement\n\
    ldr r2, _0812B100 @ =gTasks\n\
    mov r3, r8\n\
    lsls r1, r3, 2\n\
    add r1, r8\n\
    lsls r1, 3\n\
    adds r1, r2\n\
    movs r2, 0\n\
    mov r6, sp\n\
    ldrh r6, [r6]\n\
    strh r6, [r1, 0x8]\n\
    strh r4, [r1, 0xA]\n\
    strh r5, [r1, 0xC]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    strh r0, [r1, 0xE]\n\
    mov r0, r10\n\
    strh r0, [r1, 0x10]\n\
    strh r7, [r1, 0x12]\n\
    mov r3, r9\n\
    strh r3, [r1, 0x14]\n\
    strh r2, [r1, 0x1C]\n\
    strh r4, [r1, 0x1E]\n\
    strh r3, [r1, 0x20]\n\
    ldr r2, _0812B104 @ =sub_812B108\n\
    str r2, [r1]\n\
    mov r0, r8\n\
    bl _call_via_r2\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0812B0FC: .4byte gBattleAnimArgs\n\
_0812B100: .4byte gTasks\n\
_0812B104: .4byte sub_812B108\n\
    .syntax divided\n");
}
#endif // NONMATCHING

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
