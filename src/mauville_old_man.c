#include "global.h"
#include "asm.h"
#include "menu.h"
#include "rng.h"
#include "script.h"
#include "string_util.h"

extern u16 gScriptResult;
extern u16 gSpecialVar_0x8004;

extern void sub_80F83F8(void);
extern void sub_81099CC(void);
extern void sub_80F83D0(void);
extern void sub_80F7F80(u8);
extern u16 sub_80EB8EC(void);
extern void sub_80F7DC0(void);
extern u8 gOtherText_Is[];
extern u8 gOtherText_DontYouAgree[];
extern u32 gUnknown_083E5388[];
extern u32 gUnknown_083E53A8[];

extern u16 gUnknown_083E537C[];

void sub_80F7A34(void)
{
    u16 i;
    OldMan *oldMan = &gSaveBlock1.oldMan;

    oldMan->oldMan1.unk_2D94 = 0;
    oldMan->oldMan1.unk_2DBD = 0;

    for(i = 0; i < 6; i++)
        oldMan->oldMan1.mauvilleOldMan_ecArray[i] = gUnknown_083E537C[i];
}

void sub_80F7A6C(void)
{
    struct UnkMauvilleOldManStruct *bard = &gSaveBlock1.oldMan.oldMan1;

    bard->unk_2D94 = 1;
    bard->unk_2D95 = 0;
}

void sub_80F7A7C(void)
{
    sub_80F83F8();
}

void sub_80F7A88(void)
{
    OldMan *oldMan = &gSaveBlock1.oldMan;

    oldMan->oldMan1.unk_2D94 = 4;
    oldMan->oldMan1.unk_2D95 = 0;
}

void sub_80F7A98(void)
{
    sub_81099CC();
}

void SetMauvilleOldMan(void)
{
    u32 var = ((u16)((gSaveBlock2.playerTrainerId[1] << 8 | gSaveBlock2.playerTrainerId[0])) % 10) / 2;

    switch(var)
    {
        case 0:
            sub_80F7A34();
            break;
        case 1:
            sub_80F7A6C();
            break;
        case 2:
            sub_80F7A98();
            break;
        case 3:
            sub_80F7A7C();
            break;
        case 4:
            sub_80F7A88();
            break;
    }
    sub_80F83D0();
}

u8 GetCurrentMauvilleOldMan(void)
{
    OldMan *oldMan = &gSaveBlock1.oldMan;

    return oldMan->oldMan1.unk_2D94;
}

void sub_80F7B14(void)
{
    gScriptResult = GetCurrentMauvilleOldMan();
}

void sub_80F7B2C(void)
{
    u16 *scriptPtr = &gScriptResult; // why??
    OldMan *oldMan = &gSaveBlock1.oldMan;

    *scriptPtr = oldMan->oldMan1.unk_2DBD;
}

void sub_80F7B40(void)
{
    u16 i;
    OldMan *oldMan = &gSaveBlock1.oldMan;
    //struct UnkMauvilleOldManStruct *oldManStruct = &gSaveBlock1.oldManStruct;

    StringCopy(oldMan->oldMan1.playerName, gSaveBlock2.playerName);

    for(i = 0; i < 4; i++)
        oldMan->oldMan1.playerTrainerId[i] = gSaveBlock2.playerTrainerId[i];

    for(i = 0; i < 6; i++)
        oldMan->oldMan1.mauvilleOldMan_ecArray[i] = oldMan->oldMan1.mauvilleOldMan_ecArray2[i];

    oldMan->oldMan1.unk_2DBD = 1;
}

// too mathy
__attribute__((naked))
void sub_80F7BA0(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    ldr r1, _080F7C48 @ =gSaveBlock1 + 0x2D94\n\
    ldr r0, _080F7C4C @ =gSpecialVar_0x8004\n\
    ldrh r0, [r0]\n\
    adds r5, r1, 0\n\
    adds r5, 0xE\n\
    cmp r0, 0\n\
    bne _080F7BB2\n\
    adds r5, r1, 0x2\n\
_080F7BB2:\n\
    ldr r2, _080F7C50 @ =gStringVar4\n\
    adds r4, r2, 0\n\
    movs r6, 0\n\
_080F7BB8:\n\
    ldrh r1, [r5]\n\
    adds r5, 0x2\n\
    adds r0, r2, 0\n\
    bl sub_80EB3FC\n\
    adds r2, r0, 0\n\
    adds r7, r6, 0x1\n\
    cmp r2, r4\n\
    beq _080F7BDA\n\
    movs r1, 0x37\n\
_080F7BCC:\n\
    ldrb r0, [r4]\n\
    cmp r0, 0\n\
    bne _080F7BD4\n\
    strb r1, [r4]\n\
_080F7BD4:\n\
    adds r4, 0x1\n\
    cmp r2, r4\n\
    bne _080F7BCC\n\
_080F7BDA:\n\
    adds r4, 0x1\n\
    movs r0, 0\n\
    strb r0, [r2]\n\
    adds r2, 0x1\n\
    ldrh r1, [r5]\n\
    adds r5, 0x2\n\
    adds r0, r2, 0\n\
    bl sub_80EB3FC\n\
    adds r2, r0, 0\n\
    cmp r2, r4\n\
    beq _080F7C02\n\
    movs r1, 0x37\n\
_080F7BF4:\n\
    ldrb r0, [r4]\n\
    cmp r0, 0\n\
    bne _080F7BFC\n\
    strb r1, [r4]\n\
_080F7BFC:\n\
    adds r4, 0x1\n\
    cmp r2, r4\n\
    bne _080F7BF4\n\
_080F7C02:\n\
    adds r4, 0x1\n\
    movs r0, 0xFE\n\
    strb r0, [r2]\n\
    adds r2, 0x1\n\
    ldrh r1, [r5]\n\
    adds r5, 0x2\n\
    adds r0, r2, 0\n\
    bl sub_80EB3FC\n\
    adds r2, r0, 0\n\
    cmp r2, r4\n\
    beq _080F7C2A\n\
    movs r1, 0x37\n\
_080F7C1C:\n\
    ldrb r0, [r4]\n\
    cmp r0, 0\n\
    bne _080F7C24\n\
    strb r1, [r4]\n\
_080F7C24:\n\
    adds r4, 0x1\n\
    cmp r2, r4\n\
    bne _080F7C1C\n\
_080F7C2A:\n\
    cmp r6, 0\n\
    bne _080F7C3A\n\
    movs r0, 0xFC\n\
    strb r0, [r2]\n\
    adds r2, 0x1\n\
    movs r0, 0xF\n\
    strb r0, [r2]\n\
    adds r2, 0x1\n\
_080F7C3A:\n\
    lsls r0, r7, 16\n\
    lsrs r6, r0, 16\n\
    cmp r6, 0x1\n\
    bls _080F7BB8\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080F7C48: .4byte gSaveBlock1 + 0x2D94\n\
_080F7C4C: .4byte gSpecialVar_0x8004\n\
_080F7C50: .4byte gStringVar4\n\
    .syntax divided");
}

void sub_80F7C54(void)
{
    sub_80F7F80(gSpecialVar_0x8004);
    MenuDisplayMessageBox();
    ScriptContext1_Stop();
}

void sub_80F7C70(void)
{
    u16 *scriptPtr = &gScriptResult; // again??
    OldMan *oldMan = &gSaveBlock1.oldMan;

    *scriptPtr = oldMan->oldMan1.unk_2D95;
}

void sub_80F7C84(void)
{
    OldMan *oldMan = &gSaveBlock1.oldMan;

    oldMan->oldMan1.unk_2D95 = 1;
}

void sub_80F7C90(void)
{
    u16 var = sub_80EB8EC();

    if(var == 0xFFFF)
    {
        gScriptResult = FALSE;
    }
    else
    {
        sub_80EB3FC(gStringVar1, var);
        gScriptResult = TRUE;
    }
}

void sub_80F7CC8(void)
{
    OldMan *oldMan = &gSaveBlock1.oldMan;

    if(oldMan->oldMan1.unk_2D95 == 10)
    {
        gScriptResult = FALSE;
        oldMan->oldMan1.unk_2D95 = 0;
    }
    else
        gScriptResult = TRUE;
}

// someone fix this
#ifdef NONMATCHING
void sub_80F7CF4(void)
{
    u8 *stringPtr;
    OldMan *oldMan = &gSaveBlock1.oldMan;

    if(oldMan->oldMan2.unk1 == 0)
        sub_80F7DC0();

    if(oldMan->oldMan2.mauvilleOldMan_ecArray[oldMan->oldMan2.unk1] != 0xFFFF) // is not the last element of the array?
    {
        u16 random = 7 % Random(); // this is a little bit closer, but the compiler prefers an AND instead of division. i assume its because the compiler wants to avoid division by zero, however using an & causes this order to not be close anymore.
        sub_80EB3FC(gStringVar4, oldMan->oldMan2.mauvilleOldMan_ecArray[oldMan->oldMan2.unk1]);
        stringPtr = StringCopy(gStringVar4, gOtherText_Is);
        stringPtr = StringCopy(stringPtr, (u8 *)gUnknown_083E5388[random]);
        StringCopy(stringPtr, gOtherText_DontYouAgree);
    }
    else
    {
        StringCopy(gStringVar4, (u8 *)gUnknown_083E53A8[oldMan->oldMan2.mauvilleOldMan_ecArray2[oldMan->oldMan2.unk2++]]);
    }
    if(!(Random() % 10))
        oldMan->oldMan2.unk1 = 10;
    else
        oldMan->oldMan2.unk1++;

    gScriptResult = TRUE;
}
#else
__attribute__((naked))
void sub_80F7CF4(void)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    ldr r5, _080F7D50 @ =gSaveBlock1 + 0x2D94\n\
    ldrb r0, [r5, 0x1]\n\
    cmp r0, 0\n\
    bne _080F7D02\n\
    bl sub_80F7DC0\n\
_080F7D02:\n\
    ldrb r0, [r5, 0x1]\n\
    lsls r0, 1\n\
    adds r6, r5, 0x4\n\
    adds r0, r6\n\
    ldrh r1, [r0]\n\
    ldr r0, _080F7D54 @ =0x0000ffff\n\
    cmp r1, r0\n\
    beq _080F7D68\n\
    bl Random\n\
    adds r4, r0, 0\n\
    lsls r4, 16\n\
    lsrs r4, 16\n\
    movs r0, 0x7\n\
    ands r4, r0\n\
    ldr r0, _080F7D58 @ =gStringVar4\n\
    ldrb r1, [r5, 0x1]\n\
    lsls r1, 1\n\
    adds r1, r6\n\
    ldrh r1, [r1]\n\
    bl sub_80EB3FC\n\
    adds r2, r0, 0\n\
    ldr r1, _080F7D5C @ =gOtherText_Is\n\
    bl StringCopy\n\
    adds r2, r0, 0\n\
    ldr r0, _080F7D60 @ =gUnknown_083E5388\n\
    lsls r4, 2\n\
    adds r4, r0\n\
    ldr r1, [r4]\n\
    adds r0, r2, 0\n\
    bl StringCopy\n\
    adds r2, r0, 0\n\
    ldr r1, _080F7D64 @ =gOtherText_DontYouAgree\n\
    bl StringCopy\n\
    b _080F7D88\n\
    .align 2, 0\n\
_080F7D50: .4byte gSaveBlock1 + 0x2D94\n\
_080F7D54: .4byte 0x0000ffff\n\
_080F7D58: .4byte gStringVar4\n\
_080F7D5C: .4byte gOtherText_Is\n\
_080F7D60: .4byte gUnknown_083E5388\n\
_080F7D64: .4byte gOtherText_DontYouAgree\n\
_080F7D68:\n\
    ldr r0, _080F7DA0 @ =gStringVar4\n\
    ldr r3, _080F7DA4 @ =gUnknown_083E53A8\n\
    ldrb r1, [r5, 0x2]\n\
    adds r2, r1, 0x1\n\
    strb r2, [r5, 0x2]\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    adds r2, r5, 0\n\
    adds r2, 0x18\n\
    adds r1, r2\n\
    ldrb r1, [r1]\n\
    lsls r1, 2\n\
    adds r1, r3\n\
    ldr r1, [r1]\n\
    bl StringCopy\n\
_080F7D88:\n\
    bl Random\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0xA\n\
    bl __umodsi3\n\
    lsls r0, 16\n\
    cmp r0, 0\n\
    bne _080F7DA8\n\
    movs r0, 0xA\n\
    b _080F7DAC\n\
    .align 2, 0\n\
_080F7DA0: .4byte gStringVar4\n\
_080F7DA4: .4byte gUnknown_083E53A8\n\
_080F7DA8:\n\
    ldrb r0, [r5, 0x1]\n\
    adds r0, 0x1\n\
_080F7DAC:\n\
    strb r0, [r5, 0x1]\n\
    ldr r1, _080F7DBC @ =gScriptResult\n\
    movs r0, 0x1\n\
    strh r0, [r1]\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080F7DBC: .4byte gScriptResult\n\
    .syntax divided");
}
#endif
