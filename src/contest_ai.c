#include "global.h"
#include "contest.h"
#include "random.h"
#include "ewram.h"

enum
{
    ContestAI_SettingUp,
    ContestAI_Processing,
    ContestAI_FinishedProcessing,
    ContestAI_DoNotProcess
};

extern s16 gUnknown_02038670[];
extern u16 gSpecialVar_ContestCategory;

extern u8 *gAIScriptPtr;
extern u8 *gContestAIs[];

typedef void (* ContestAICmdFunc)(void);

extern const ContestAICmdFunc sContestAICmdTable[]; // TODO: Move table to C file

void ContestAI_DoAIProcessing(void);

void ContestAI_ResetAI(u8 var)
{
    int i;
    memset(eContestAI, 0, sizeof(struct ContestAIInfo));

    for(i = 0; i < 4; i++)
        eContestAI->unk5[i] = 100;

    eContestAI->unk41 = var;
    eContestAI->unk40 = 0;
    eContestAI->flags = gContestMons[eContestAI->unk41].flags;
}

u8 ContestAI_GetActionToUse(void)
{
    while(eContestAI->flags != 0)
    {
        if(eContestAI->flags & 1)
        {
            eContestAI->aiState = 0;
            ContestAI_DoAIProcessing();
        }
        eContestAI->flags >>= 1;
        eContestAI->unk10++;
        eContestAI->unk4 = 0;
    }

    while (1)
    {
        u8 rval = Random() & 3;
        u8 r2 = eContestAI->unk5[rval];
        int i;
        for (i = 0; i < 4; i++)
        {
            if (r2 < eContestAI->unk5[i])
                break;
        }
        if (i == 4)
            return rval;
    }
}

void ContestAI_DoAIProcessing(void)
{
    while(eContestAI->aiState != ContestAI_FinishedProcessing)
    {
        switch(eContestAI->aiState)
        {
            case ContestAI_DoNotProcess:
                break;
            case ContestAI_SettingUp:
                gAIScriptPtr = gContestAIs[eContestAI->unk10];

                if(gContestMons[eContestAI->unk41].moves[eContestAI->unk4] == 0)
                    eContestAI->unk2 = 0; // don't process a move that doesn't exist.
                else
                    eContestAI->unk2 = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];
                eContestAI->aiState++;
                break;
            case ContestAI_Processing:
                if(eContestAI->unk2 != 0)
                    sContestAICmdTable[*gAIScriptPtr](); // run the command.
                else
                {
                    eContestAI->unk5[eContestAI->unk4] = 0; // don't consider a move that doesn't exist.
                    eContestAI->aiAction |= 1;
                }
                if(eContestAI->aiAction & 1)
                {
                    eContestAI->unk4++;
                    if(eContestAI->unk4 < 4)
                        eContestAI->aiState = 0;
                    else
                        eContestAI->aiState++;
                    eContestAI->aiAction &= 0xFE; // TODO: Define action flags
                }
                break;
        }
    }
}

u8 sub_8128A7C(u8 var)
{
    int i;

    for(i = 0; i < 4; i++)
        if(shared192D0.unk0[i] == var)
            break;

    return i;
}

void ContestAICmd_unk_00(void)
{
    s16 score = eContestAI->unk5[eContestAI->unk4] + (s8)gAIScriptPtr[1];

    if (score > 255)
        score = 255;
    else if (score < 0)
        score = 0;

    eContestAI->unk5[eContestAI->unk4] = score;

    gAIScriptPtr += 2;
}

void ContestAICmd_get_turn(void)
{
    eContestAI->scriptResult = sContest.turnNumber;
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_02(void)
{
    ContestAICmd_get_turn();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_03(void)
{
    ContestAICmd_get_turn();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_04(void)
{
    ContestAICmd_get_turn();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_05(void)
{
    ContestAICmd_get_turn();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_get_excitement(void)
{
    eContestAI->scriptResult = sContest.applauseLevel;
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_07(void)
{
    ContestAICmd_get_excitement();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_08(void)
{
    ContestAICmd_get_excitement();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_09(void)
{
    ContestAICmd_get_excitement();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_0A(void)
{
    ContestAICmd_get_excitement();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_get_user_order(void)
{
    eContestAI->scriptResult = shared192D0.unk0[eContestAI->unk41];
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_0C(void)
{
    ContestAICmd_get_user_order();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_0D(void)
{
    ContestAICmd_get_user_order();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_0E(void)
{
    ContestAICmd_get_user_order();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_0F(void)
{
    ContestAICmd_get_user_order();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_get_user_condition_maybe(void)
{
    eContestAI->scriptResult = sContestantStatus[eContestAI->unk41].unkD / 10;
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_11(void)
{
    ContestAICmd_get_user_condition_maybe();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_12(void)
{
    ContestAICmd_get_user_condition_maybe();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_13(void)
{
    ContestAICmd_get_user_condition_maybe();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_14(void)
{
    ContestAICmd_get_user_condition_maybe();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_15(void)
{
    eContestAI->scriptResult = sContestantStatus[eContestAI->unk41].unk4;
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_16(void)
{
    ContestAICmd_unk_15();

    if((s16)eContestAI->scriptResult < (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void ContestAICmd_unk_17(void)
{
    ContestAICmd_unk_15();

    if((s16)eContestAI->scriptResult > (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void ContestAICmd_unk_18(void)
{
    ContestAICmd_unk_15();

    if((s16)eContestAI->scriptResult == (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void ContestAICmd_unk_19(void)
{
    ContestAICmd_unk_15();

    if((s16)eContestAI->scriptResult != (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void ContestAICmd_unk_1A(void)
{
    eContestAI->scriptResult = gUnknown_02038670[eContestAI->unk41];
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_1B(void)
{
    ContestAICmd_unk_1A();

    if((s16)eContestAI->scriptResult < (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void ContestAICmd_unk_1C(void)
{
    ContestAICmd_unk_1A();

    if((s16)eContestAI->scriptResult > (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void ContestAICmd_unk_1D(void)
{
    ContestAICmd_unk_1A();

    if((s16)eContestAI->scriptResult == (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void ContestAICmd_unk_1E(void)
{
    ContestAICmd_unk_1A();

    if((s16)eContestAI->scriptResult != (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void ContestAICmd_get_contest_type(void)
{
    eContestAI->scriptResult = gSpecialVar_ContestCategory;
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_20(void)
{
    ContestAICmd_get_contest_type();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_21(void)
{
    ContestAICmd_get_contest_type();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_get_move_excitement(void)
{
    eContestAI->scriptResult = Contest_GetMoveExcitement(gContestMons[eContestAI->unk41].moves[eContestAI->unk4]);
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_23(void)
{
    ContestAICmd_get_move_excitement();

    if((s16)eContestAI->scriptResult < (s8)gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_24(void)
{
    ContestAICmd_get_move_excitement();

    if((s16)eContestAI->scriptResult > (s8)gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_25(void)
{
    ContestAICmd_get_move_excitement();

    if((s16)eContestAI->scriptResult == (s8)gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_26(void)
{
    ContestAICmd_get_move_excitement();

    if((s16)eContestAI->scriptResult != (s8)gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_get_move_effect(void)
{
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    eContestAI->scriptResult = gContestMoves[move].effect;
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_28(void)
{
    ContestAICmd_get_move_effect();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_29(void)
{
    ContestAICmd_get_move_effect();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_get_move_effect_type(void)
{
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    eContestAI->scriptResult = gContestEffects[gContestMoves[move].effect].effectType;
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_2B(void)
{
    ContestAICmd_get_move_effect_type();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_2C(void)
{
    ContestAICmd_get_move_effect_type();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_check_move_has_highest_appeal(void)
{
    int i;
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];
    u8 appeal = gContestEffects[gContestMoves[move].effect].appeal;

    for(i = 0; i < 4; i++)
    {
        u16 newMove = gContestMons[eContestAI->unk41].moves[i];
        if(newMove != 0 && appeal < gContestEffects[gContestMoves[newMove].effect].appeal)
            break;
    }

    if(i == 4)
        eContestAI->scriptResult = TRUE;
    else
        eContestAI->scriptResult = FALSE;

    gAIScriptPtr += 1;
}

void ContestAICmd_unk_2E(void)
{
    ContestAICmd_check_move_has_highest_appeal();

    if((s16)eContestAI->scriptResult != FALSE)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

void ContestAICmd_unk_2F(void)
{
    int i;
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];
    u8 jam = gContestEffects[gContestMoves[move].effect].jam;

    for(i = 0; i < 4; i++)
    {
        u16 newMove = gContestMons[eContestAI->unk41].moves[i];
        if(newMove != 0 && jam < gContestEffects[gContestMoves[newMove].effect].jam)
            break;
    }

    if(i == 4)
        eContestAI->scriptResult = TRUE;
    else
        eContestAI->scriptResult = FALSE;

    gAIScriptPtr += 1;
}

void ContestAICmd_unk_30(void)
{
    ContestAICmd_unk_2F();

    if((s16)eContestAI->scriptResult != FALSE)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_31(void)
{
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    eContestAI->scriptResult = gContestEffects[gContestMoves[move].effect].appeal / 10;
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_32(void)
{
    ContestAICmd_unk_31();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_33(void)
{
    ContestAICmd_unk_31();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_34(void)
{
    ContestAICmd_unk_31();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_35(void)
{
    ContestAICmd_unk_31();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_36(void)
{
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    eContestAI->scriptResult = gContestEffects[gContestMoves[move].effect].jam / 10;
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_37(void)
{
    ContestAICmd_unk_36();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_38(void)
{
    ContestAICmd_unk_36();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_39(void)
{
    ContestAICmd_unk_36();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_3A(void)
{
    ContestAICmd_unk_36();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_get_move_used_count(void)
{
    s16 result;
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    if(move != sContestantStatus[eContestAI->unk41].prevMove)
        result = 0; // move is unique and not reused.
    else
        result = sContestantStatus[eContestAI->unk41].moveRepeatCount + 1;

    eContestAI->scriptResult = result;
    gAIScriptPtr += 1;
}

void ContestAICmd_unk_3C(void)
{
    ContestAICmd_get_move_used_count();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_3D(void)
{
    ContestAICmd_get_move_used_count();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_3E(void)
{
    ContestAICmd_get_move_used_count();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void ContestAICmd_unk_3F(void)
{
    ContestAICmd_get_move_used_count();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

extern u8 AreMovesContestCombo(u16, u16);

/*
void ContestAICmd_check_combo_starter(void)
{
    u8 result = 0;
    int i;
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    for(i = 0; i < 4; i++)
    {
        u16 newMove = gContestMons[eContestAI->unk41].moves[i];
        u16 isCombo = AreMovesContestCombo(move, gContestMons[eContestAI->unk41].moves[i]);
        if(newMove && isCombo)
        {
            result = 1;
            break;
        }
        if(isCombo) // dumb double r5 check?
        {
            result = 1;
            break;
        }
    }

    eContestAI->scriptResult = result;
    gAIScriptPtr += 1;
}*/

/*
    thumb_func_start ContestAICmd_check_combo_starter
ContestAICmd_check_combo_starter: @ 8129B44
    push {r4-r7,lr}
    mov r7, r8
    push {r7}
    movs r5, 0
    ldr r3, _08129BAC @ =gContestMons
    ldr r2, _08129BB0 @ =gSharedMem + 0x192E4
    ldrb r1, [r2, 0x4]
    lsls r1, 1
    adds r2, 0x41
    ldrb r0, [r2]
    lsls r0, 6
    adds r1, r0
    adds r3, 0x1E
    adds r1, r3
    ldrh r6, [r1]
    movs r4, 0
    mov r8, r2
    adds r7, r3, 0
_08129B68:
    lsls r0, r4, 1
    mov r2, r8
    ldrb r1, [r2]
    lsls r1, 6
    adds r0, r1
    adds r1, r0, r7
    ldrh r0, [r1]
    cmp r0, 0
    beq _08129B8A
    adds r1, r0, 0
    adds r0, r6, 0
    bl AreMovesContestCombo
    lsls r0, 24
    lsrs r5, r0, 24
    cmp r5, 0
    bne _08129B94
_08129B8A:
    adds r4, 0x1
    cmp r4, 0x3
    ble _08129B68
    cmp r5, 0
    beq _08129B96
_08129B94:
    movs r5, 0x1
_08129B96:
    ldr r0, _08129BB0 @ =gSharedMem + 0x192E4
    strh r5, [r0, 0x18]
    ldr r1, _08129BB4 @ =gAIScriptPtr
    ldr r0, [r1]
    adds r0, 0x1
    str r0, [r1]
    pop {r3}
    mov r8, r3
    pop {r4-r7}
    pop {r0}
    bx r0
    .align 2, 0
_08129BAC: .4byte gContestMons
_08129BB0: .4byte gSharedMem + 0x192E4
_08129BB4: .4byte gAIScriptPtr
    thumb_func_end ContestAICmd_check_combo_starter
*/
