#include "global.h"
#include "contest.h"
#include "random.h"
#include "ewram.h"

extern u8 AreMovesContestCombo(u16, u16);
extern bool8 sub_80B214C(u8);
extern bool8 Contest_IsMonsTurnDisabled(u8);

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

static void ContestAICmd_unk_00(void);
static void ContestAICmd_get_turn(void);
static void ContestAICmd_unk_02(void);
static void ContestAICmd_unk_03(void);
static void ContestAICmd_unk_04(void);
static void ContestAICmd_unk_05(void);
static void ContestAICmd_get_excitement(void);
static void ContestAICmd_unk_07(void);
static void ContestAICmd_unk_08(void);
static void ContestAICmd_unk_09(void);
static void ContestAICmd_unk_0A(void);
static void ContestAICmd_get_user_order(void);
static void ContestAICmd_unk_0C(void);
static void ContestAICmd_unk_0D(void);
static void ContestAICmd_unk_0E(void);
static void ContestAICmd_unk_0F(void);
static void ContestAICmd_get_user_condition_maybe(void);
static void ContestAICmd_unk_11(void);
static void ContestAICmd_unk_12(void);
static void ContestAICmd_unk_13(void);
static void ContestAICmd_unk_14(void);
static void ContestAICmd_unk_15(void);
static void ContestAICmd_unk_16(void);
static void ContestAICmd_unk_17(void);
static void ContestAICmd_unk_18(void);
static void ContestAICmd_unk_19(void);
static void ContestAICmd_unk_1A(void);
static void ContestAICmd_unk_1B(void);
static void ContestAICmd_unk_1C(void);
static void ContestAICmd_unk_1D(void);
static void ContestAICmd_unk_1E(void);
static void ContestAICmd_get_contest_type(void);
static void ContestAICmd_unk_20(void);
static void ContestAICmd_unk_21(void);
static void ContestAICmd_get_move_excitement(void);
static void ContestAICmd_unk_23(void);
static void ContestAICmd_unk_24(void);
static void ContestAICmd_unk_25(void);
static void ContestAICmd_unk_26(void);
static void ContestAICmd_get_move_effect(void);
static void ContestAICmd_unk_28(void);
static void ContestAICmd_unk_29(void);
static void ContestAICmd_get_move_effect_type(void);
static void ContestAICmd_unk_2B(void);
static void ContestAICmd_unk_2C(void);
static void ContestAICmd_check_move_has_highest_appeal(void);
static void ContestAICmd_unk_2E(void);
static void ContestAICmd_unk_2F(void);
static void ContestAICmd_unk_30(void);
static void ContestAICmd_unk_31(void);
static void ContestAICmd_unk_32(void);
static void ContestAICmd_unk_33(void);
static void ContestAICmd_unk_34(void);
static void ContestAICmd_unk_35(void);
static void ContestAICmd_unk_36(void);
static void ContestAICmd_unk_37(void);
static void ContestAICmd_unk_38(void);
static void ContestAICmd_unk_39(void);
static void ContestAICmd_unk_3A(void);
static void ContestAICmd_get_move_used_count(void);
static void ContestAICmd_unk_3C(void);
static void ContestAICmd_unk_3D(void);
static void ContestAICmd_unk_3E(void);
static void ContestAICmd_unk_3F(void);
static void ContestAICmd_check_combo_starter(void);
static void ContestAICmd_unk_41(void);
static void ContestAICmd_unk_42(void);
static void ContestAICmd_check_combo_finisher(void);
static void ContestAICmd_unk_44(void);
static void ContestAICmd_unk_45(void);
static void ContestAICmd_check_would_finish_combo(void);
static void ContestAICmd_unk_47(void);
static void ContestAICmd_unk_48(void);
static void ContestAICmd_get_condition(void);
static void ContestAICmd_unk_4A(void);
static void ContestAICmd_unk_4B(void);
static void ContestAICmd_unk_4C(void);
static void ContestAICmd_unk_4D(void);
static void ContestAICmd_get_used_combo_starter(void);
static void ContestAICmd_unk_4F(void);
static void ContestAICmd_unk_50(void);
static void ContestAICmd_unk_51(void);
static void ContestAICmd_unk_52(void);
static void ContestAICmd_check_can_participate(void);
static void ContestAICmd_unk_54(void);
static void ContestAICmd_unk_55(void);
static void ContestAICmd_get_val_812A188(void);
static void ContestAICmd_unk_57(void);
static void ContestAICmd_unk_58(void);
static void ContestAICmd_unk_59(void);
static void ContestAICmd_unk_5A(void);
static void ContestAICmd_unk_5B(void);
static void ContestAICmd_unk_5C(void);
static void ContestAICmd_unk_5D(void);
static void ContestAICmd_unk_5E(void);
static void ContestAICmd_unk_5F(void);
static void ContestAICmd_unk_60(void);
static void ContestAICmd_unk_61(void);
static void ContestAICmd_unk_62(void);
static void ContestAICmd_unk_63(void);
static void ContestAICmd_unk_64(void);
static void ContestAICmd_unk_65(void);
static void ContestAICmd_unk_66(void);
static void ContestAICmd_unk_67(void);
static void ContestAICmd_unk_68(void);
static void ContestAICmd_unk_69(void);
static void ContestAICmd_unk_6A(void);
static void ContestAICmd_unk_6B(void);
static void ContestAICmd_unk_6C(void);
static void ContestAICmd_unk_6D(void);
static void ContestAICmd_unk_6E(void);
static void ContestAICmd_unk_6F(void);
static void ContestAICmd_unk_70(void);
static void ContestAICmd_unk_71(void);
static void ContestAICmd_unk_72(void);
static void ContestAICmd_unk_73(void);
static void ContestAICmd_unk_74(void);
static void ContestAICmd_unk_75(void);
static void ContestAICmd_unk_76(void);
static void ContestAICmd_unk_77(void);
static void ContestAICmd_unk_78(void);
static void ContestAICmd_unk_79(void);
static void ContestAICmd_unk_7A(void);
static void ContestAICmd_unk_7B(void);
static void ContestAICmd_unk_7C(void);
static void ContestAICmd_unk_7D(void);
static void ContestAICmd_unk_7E(void);
static void ContestAICmd_unk_7F(void);
static void ContestAICmd_unk_80(void);
static void ContestAICmd_unk_81(void);
static void ContestAICmd_check_for_exciting_move(void);
static void ContestAICmd_unk_83(void);
static void ContestAICmd_unk_84(void);
static void ContestAICmd_unk_85(void);
static void ContestAICmd_unk_86(void);
static void ContestAICmd_unk_87(void);

typedef void (* ContestAICmdFunc)(void);

static const ContestAICmdFunc sContestAICmdTable[] =
{
    ContestAICmd_unk_00,
    ContestAICmd_get_turn,
    ContestAICmd_unk_02,
    ContestAICmd_unk_03,
    ContestAICmd_unk_04,
    ContestAICmd_unk_05,
    ContestAICmd_get_excitement,
    ContestAICmd_unk_07,
    ContestAICmd_unk_08,
    ContestAICmd_unk_09,
    ContestAICmd_unk_0A,
    ContestAICmd_get_user_order,
    ContestAICmd_unk_0C,
    ContestAICmd_unk_0D,
    ContestAICmd_unk_0E,
    ContestAICmd_unk_0F,
    ContestAICmd_get_user_condition_maybe,
    ContestAICmd_unk_11,
    ContestAICmd_unk_12,
    ContestAICmd_unk_13,
    ContestAICmd_unk_14,
    ContestAICmd_unk_15,
    ContestAICmd_unk_16,
    ContestAICmd_unk_17,
    ContestAICmd_unk_18,
    ContestAICmd_unk_19,
    ContestAICmd_unk_1A,
    ContestAICmd_unk_1B,
    ContestAICmd_unk_1C,
    ContestAICmd_unk_1D,
    ContestAICmd_unk_1E,
    ContestAICmd_get_contest_type,
    ContestAICmd_unk_20,
    ContestAICmd_unk_21,
    ContestAICmd_get_move_excitement,
    ContestAICmd_unk_23,
    ContestAICmd_unk_24,
    ContestAICmd_unk_25,
    ContestAICmd_unk_26,
    ContestAICmd_get_move_effect,
    ContestAICmd_unk_28,
    ContestAICmd_unk_29,
    ContestAICmd_get_move_effect_type,
    ContestAICmd_unk_2B,
    ContestAICmd_unk_2C,
    ContestAICmd_check_move_has_highest_appeal,
    ContestAICmd_unk_2E,
    ContestAICmd_unk_2F,
    ContestAICmd_unk_30,
    ContestAICmd_unk_31,
    ContestAICmd_unk_32,
    ContestAICmd_unk_33,
    ContestAICmd_unk_34,
    ContestAICmd_unk_35,
    ContestAICmd_unk_36,
    ContestAICmd_unk_37,
    ContestAICmd_unk_38,
    ContestAICmd_unk_39,
    ContestAICmd_unk_3A,
    ContestAICmd_get_move_used_count,
    ContestAICmd_unk_3C,
    ContestAICmd_unk_3D,
    ContestAICmd_unk_3E,
    ContestAICmd_unk_3F,
    ContestAICmd_check_combo_starter,
    ContestAICmd_unk_41,
    ContestAICmd_unk_42,
    ContestAICmd_check_combo_finisher,
    ContestAICmd_unk_44,
    ContestAICmd_unk_45,
    ContestAICmd_check_would_finish_combo,
    ContestAICmd_unk_47,
    ContestAICmd_unk_48,
    ContestAICmd_get_condition,
    ContestAICmd_unk_4A,
    ContestAICmd_unk_4B,
    ContestAICmd_unk_4C,
    ContestAICmd_unk_4D,
    ContestAICmd_get_used_combo_starter,
    ContestAICmd_unk_4F,
    ContestAICmd_unk_50,
    ContestAICmd_unk_51,
    ContestAICmd_unk_52,
    ContestAICmd_check_can_participate,
    ContestAICmd_unk_54,
    ContestAICmd_unk_55,
    ContestAICmd_get_val_812A188,
    ContestAICmd_unk_57,
    ContestAICmd_unk_58,
    ContestAICmd_unk_59,
    ContestAICmd_unk_5A,
    ContestAICmd_unk_5B,
    ContestAICmd_unk_5C,
    ContestAICmd_unk_5D,
    ContestAICmd_unk_5E,
    ContestAICmd_unk_5F,
    ContestAICmd_unk_60,
    ContestAICmd_unk_61,
    ContestAICmd_unk_62,
    ContestAICmd_unk_63,
    ContestAICmd_unk_64,
    ContestAICmd_unk_65,
    ContestAICmd_unk_66,
    ContestAICmd_unk_67,
    ContestAICmd_unk_68,
    ContestAICmd_unk_69,
    ContestAICmd_unk_6A,
    ContestAICmd_unk_6B,
    ContestAICmd_unk_6C,
    ContestAICmd_unk_6D,
    ContestAICmd_unk_6E,
    ContestAICmd_unk_6F,
    ContestAICmd_unk_70,
    ContestAICmd_unk_71,
    ContestAICmd_unk_72,
    ContestAICmd_unk_73,
    ContestAICmd_unk_74,
    ContestAICmd_unk_75,
    ContestAICmd_unk_76,
    ContestAICmd_unk_77,
    ContestAICmd_unk_78,
    ContestAICmd_unk_79,
    ContestAICmd_unk_7A,
    ContestAICmd_unk_7B,
    ContestAICmd_unk_7C,
    ContestAICmd_unk_7D,
    ContestAICmd_unk_7E,
    ContestAICmd_unk_7F,
    ContestAICmd_unk_80,
    ContestAICmd_unk_81,
    ContestAICmd_check_for_exciting_move,
    ContestAICmd_unk_83,
    ContestAICmd_unk_84,
    ContestAICmd_unk_85,
    ContestAICmd_unk_86,
    ContestAICmd_unk_87,
};

static void ContestAI_DoAIProcessing(void);
static bool8 sub_8128A7C(u8);
static void sub_812ACA4(u8 *);
static u8 sub_812ACC8(void);

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

static void ContestAI_DoAIProcessing(void)
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

static u8 sub_8128A7C(u8 var)
{
    int i;

    for(i = 0; i < 4; i++)
        if(shared192D0.unk0[i] == var)
            break;

    return i;
}

static void ContestAICmd_unk_00(void)
{
    s16 score = eContestAI->unk5[eContestAI->unk4] + (s8)gAIScriptPtr[1];

    if (score > 255)
        score = 255;
    else if (score < 0)
        score = 0;

    eContestAI->unk5[eContestAI->unk4] = score;

    gAIScriptPtr += 2;
}

static void ContestAICmd_get_turn(void)
{
    eContestAI->scriptResult = sContest.turnNumber;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_02(void)
{
    ContestAICmd_get_turn();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_03(void)
{
    ContestAICmd_get_turn();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_04(void)
{
    ContestAICmd_get_turn();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_05(void)
{
    ContestAICmd_get_turn();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_get_excitement(void)
{
    eContestAI->scriptResult = sContest.applauseLevel;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_07(void)
{
    ContestAICmd_get_excitement();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_08(void)
{
    ContestAICmd_get_excitement();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_09(void)
{
    ContestAICmd_get_excitement();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_0A(void)
{
    ContestAICmd_get_excitement();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_get_user_order(void)
{
    eContestAI->scriptResult = shared192D0.unk0[eContestAI->unk41];
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_0C(void)
{
    ContestAICmd_get_user_order();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_0D(void)
{
    ContestAICmd_get_user_order();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_0E(void)
{
    ContestAICmd_get_user_order();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_0F(void)
{
    ContestAICmd_get_user_order();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_get_user_condition_maybe(void)
{
    eContestAI->scriptResult = sContestantStatus[eContestAI->unk41].unkD / 10;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_11(void)
{
    ContestAICmd_get_user_condition_maybe();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_12(void)
{
    ContestAICmd_get_user_condition_maybe();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_13(void)
{
    ContestAICmd_get_user_condition_maybe();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_14(void)
{
    ContestAICmd_get_user_condition_maybe();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_15(void)
{
    eContestAI->scriptResult = sContestantStatus[eContestAI->unk41].unk4;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_16(void)
{
    ContestAICmd_unk_15();

    if((s16)eContestAI->scriptResult < (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

static void ContestAICmd_unk_17(void)
{
    ContestAICmd_unk_15();

    if((s16)eContestAI->scriptResult > (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

static void ContestAICmd_unk_18(void)
{
    ContestAICmd_unk_15();

    if((s16)eContestAI->scriptResult == (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

static void ContestAICmd_unk_19(void)
{
    ContestAICmd_unk_15();

    if((s16)eContestAI->scriptResult != (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

static void ContestAICmd_unk_1A(void)
{
    eContestAI->scriptResult = gUnknown_02038670[eContestAI->unk41];
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_1B(void)
{
    ContestAICmd_unk_1A();

    if((s16)eContestAI->scriptResult < (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

static void ContestAICmd_unk_1C(void)
{
    ContestAICmd_unk_1A();

    if((s16)eContestAI->scriptResult > (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

static void ContestAICmd_unk_1D(void)
{
    ContestAICmd_unk_1A();

    if((s16)eContestAI->scriptResult == (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

static void ContestAICmd_unk_1E(void)
{
    ContestAICmd_unk_1A();

    if((s16)eContestAI->scriptResult != (s16)T1_READ_16(gAIScriptPtr + 0))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

static void ContestAICmd_get_contest_type(void)
{
    eContestAI->scriptResult = gSpecialVar_ContestCategory;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_20(void)
{
    ContestAICmd_get_contest_type();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_21(void)
{
    ContestAICmd_get_contest_type();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_get_move_excitement(void)
{
    eContestAI->scriptResult = Contest_GetMoveExcitement(gContestMons[eContestAI->unk41].moves[eContestAI->unk4]);
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_23(void)
{
    ContestAICmd_get_move_excitement();

    if((s16)eContestAI->scriptResult < (s8)gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_24(void)
{
    ContestAICmd_get_move_excitement();

    if((s16)eContestAI->scriptResult > (s8)gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_25(void)
{
    ContestAICmd_get_move_excitement();

    if((s16)eContestAI->scriptResult == (s8)gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_26(void)
{
    ContestAICmd_get_move_excitement();

    if((s16)eContestAI->scriptResult != (s8)gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_get_move_effect(void)
{
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    eContestAI->scriptResult = gContestMoves[move].effect;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_28(void)
{
    ContestAICmd_get_move_effect();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_29(void)
{
    ContestAICmd_get_move_effect();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_get_move_effect_type(void)
{
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    eContestAI->scriptResult = gContestEffects[gContestMoves[move].effect].effectType;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_2B(void)
{
    ContestAICmd_get_move_effect_type();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_2C(void)
{
    ContestAICmd_get_move_effect_type();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_check_move_has_highest_appeal(void)
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

static void ContestAICmd_unk_2E(void)
{
    ContestAICmd_check_move_has_highest_appeal();

    if((s16)eContestAI->scriptResult != FALSE)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_2F(void)
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

static void ContestAICmd_unk_30(void)
{
    ContestAICmd_unk_2F();

    if((s16)eContestAI->scriptResult != FALSE)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_31(void)
{
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    eContestAI->scriptResult = gContestEffects[gContestMoves[move].effect].appeal / 10;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_32(void)
{
    ContestAICmd_unk_31();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_33(void)
{
    ContestAICmd_unk_31();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_34(void)
{
    ContestAICmd_unk_31();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_35(void)
{
    ContestAICmd_unk_31();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_36(void)
{
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    eContestAI->scriptResult = gContestEffects[gContestMoves[move].effect].jam / 10;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_37(void)
{
    ContestAICmd_unk_36();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_38(void)
{
    ContestAICmd_unk_36();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_39(void)
{
    ContestAICmd_unk_36();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_3A(void)
{
    ContestAICmd_unk_36();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_get_move_used_count(void)
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

static void ContestAICmd_unk_3C(void)
{
    ContestAICmd_get_move_used_count();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_3D(void)
{
    ContestAICmd_get_move_used_count();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_3E(void)
{
    ContestAICmd_get_move_used_count();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_3F(void)
{
    ContestAICmd_get_move_used_count();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_check_combo_starter(void)
{
    u8 result = 0;
    int i;
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    for(i = 0; i < 4; i++)
    {
        if (gContestMons[eContestAI->unk41].moves[i])
        {
            result = AreMovesContestCombo(move, gContestMons[eContestAI->unk41].moves[i]);
            if (result)
            {
                result = 1;
                break;
            }
        }
    }

    if (result)
        result = 1;

    eContestAI->scriptResult = result;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_41(void)
{
    ContestAICmd_check_combo_starter();

    if((s16)eContestAI->scriptResult != 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_42(void)
{
    ContestAICmd_check_combo_starter();

    if((s16)eContestAI->scriptResult == 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_check_combo_finisher(void)
{
    u8 result = 0;
    int i;
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    for(i = 0; i < 4; i++)
    {
        if (gContestMons[eContestAI->unk41].moves[i])
        {
            result = AreMovesContestCombo(gContestMons[eContestAI->unk41].moves[i], move);
            if (result)
            {
                result = 1;
                break;
            }
        }
    }

    if (result)
        result = 1;

    eContestAI->scriptResult = result;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_44(void)
{
    ContestAICmd_check_combo_finisher();

    if((s16)eContestAI->scriptResult != 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_45(void)
{
    ContestAICmd_check_combo_finisher();

    if((s16)eContestAI->scriptResult == 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_check_would_finish_combo(void)
{
    u8 result = 0;
    u16 move = gContestMons[eContestAI->unk41].moves[eContestAI->unk4];

    if(sContestantStatus[eContestAI->unk41].prevMove)
        result = AreMovesContestCombo(sContestantStatus[eContestAI->unk41].prevMove, move);
    
    if(result)
        result = 1;

    eContestAI->scriptResult = result;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_47(void)
{
    ContestAICmd_check_would_finish_combo();

    if((s16)eContestAI->scriptResult != 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_48(void)
{
    ContestAICmd_check_would_finish_combo();

    if((s16)eContestAI->scriptResult == 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_get_condition(void)
{
    int var = sub_8128A7C(gAIScriptPtr[1]);

    eContestAI->scriptResult = sContestantStatus[var].unkD / 10;
    gAIScriptPtr += 2;
}

static void ContestAICmd_unk_4A(void)
{
    ContestAICmd_get_condition();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_4B(void)
{
    ContestAICmd_get_condition();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_4C(void)
{
    ContestAICmd_get_condition();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_4D(void)
{
    ContestAICmd_get_condition();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_get_used_combo_starter(void)
{
    u16 result = 0;
    u8 var = sub_8128A7C(gAIScriptPtr[1]);

    if(sub_80B214C(var))
        result = gContestMoves[sContestantStatus[var].prevMove].comboStarterId ? 1 : 0;

    eContestAI->scriptResult = result;
    gAIScriptPtr += 2;
}

static void ContestAICmd_unk_4F(void)
{
    ContestAICmd_get_used_combo_starter();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_50(void)
{
    ContestAICmd_get_used_combo_starter();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_51(void)
{
    ContestAICmd_get_used_combo_starter();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_52(void)
{
    ContestAICmd_get_used_combo_starter();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_check_can_participate(void)
{
    if(Contest_IsMonsTurnDisabled(sub_8128A7C(gAIScriptPtr[1])))
        eContestAI->scriptResult = FALSE;
    else
        eContestAI->scriptResult = TRUE;

    gAIScriptPtr += 2;
}

static void ContestAICmd_unk_54(void)
{
    ContestAICmd_check_can_participate();

    if((s16)eContestAI->scriptResult != 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_55(void)
{
    ContestAICmd_check_can_participate();

    if((s16)eContestAI->scriptResult == 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_get_val_812A188(void)
{
    u8 var = sub_8128A7C(gAIScriptPtr[1]);

    eContestAI->scriptResult = sContestantStatus[var].unk15_3;
    gAIScriptPtr += 2;
}

static void ContestAICmd_unk_57(void)
{
    ContestAICmd_get_val_812A188();

    if((s16)eContestAI->scriptResult != 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_58(void)
{
    ContestAICmd_get_val_812A188();

    if((s16)eContestAI->scriptResult == 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_59(void)
{
    u8 var = sub_8128A7C(gAIScriptPtr[1]);

    eContestAI->scriptResult = sContestantStatus[var].unk4 - sContestantStatus[eContestAI->unk41].unk4;
    gAIScriptPtr += 2;
}

static void ContestAICmd_unk_5A(void)
{
    ContestAICmd_unk_59();

    if((s16)eContestAI->scriptResult < 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_5B(void)
{
    ContestAICmd_unk_59();

    if((s16)eContestAI->scriptResult > 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_5C(void)
{
    ContestAICmd_unk_59();

    if((s16)eContestAI->scriptResult == 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_5D(void)
{
    ContestAICmd_unk_59();

    if((s16)eContestAI->scriptResult != 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_5E(void)
{
    u8 var = sub_8128A7C(gAIScriptPtr[1]);

    eContestAI->scriptResult = gUnknown_02038670[var] - gUnknown_02038670[eContestAI->unk41];
    gAIScriptPtr += 2;
}

static void ContestAICmd_unk_5F(void)
{
    ContestAICmd_unk_5E();

    if((s16)eContestAI->scriptResult < 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_60(void)
{
    ContestAICmd_unk_5E();

    if((s16)eContestAI->scriptResult > 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_61(void)
{
    ContestAICmd_unk_5E();

    if((s16)eContestAI->scriptResult == 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_62(void)
{
    ContestAICmd_unk_5E();

    if((s16)eContestAI->scriptResult != 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_63(void)
{
    u8 var = sub_8128A7C(gAIScriptPtr[1]);
    u8 var2 = gAIScriptPtr[2];
    u16 move = sContest.unk19220[var2][var];

    eContestAI->scriptResult = gContestMoves[move].effect;
    gAIScriptPtr += 3;
}

static void ContestAICmd_unk_64(void)
{
    ContestAICmd_unk_63();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_65(void)
{
    ContestAICmd_unk_63();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_66(void)
{
    ContestAICmd_unk_63();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_67(void)
{
    ContestAICmd_unk_63();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_68(void)
{
    u8 var = sub_8128A7C(gAIScriptPtr[1]);
    u8 var2 = gAIScriptPtr[2];
    s8 result = sContest.unk19248[var2][var];

    eContestAI->scriptResult = result;
    gAIScriptPtr += 3;
}

static void ContestAICmd_unk_69(void)
{
    ContestAICmd_unk_68();

    if((s16)eContestAI->scriptResult < gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_6A(void)
{
    ContestAICmd_unk_68();

    if((s16)eContestAI->scriptResult > gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_6B(void)
{
    ContestAICmd_unk_68();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_6C(void)
{
    ContestAICmd_unk_68();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_6D(void)
{
    u8 var = sub_8128A7C(gAIScriptPtr[1]);
    u8 var2 = gAIScriptPtr[2];
    u16 move = sContest.unk19220[var2][var];

    eContestAI->scriptResult = gContestEffects[gContestMoves[move].effect].effectType;
    gAIScriptPtr += 3;
}

static void ContestAICmd_unk_6E(void)
{
    ContestAICmd_unk_6D();

    if((s16)eContestAI->scriptResult == gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_6F(void)
{
    ContestAICmd_unk_6D();

    if((s16)eContestAI->scriptResult != gAIScriptPtr[0])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

static void ContestAICmd_unk_70(void)
{
    eContestAI->scriptArr[gAIScriptPtr[1]] = eContestAI->scriptResult;
    gAIScriptPtr += 2;
}

static void ContestAICmd_unk_71(void)
{
    eContestAI->scriptArr[gAIScriptPtr[1]] = T1_READ_16(gAIScriptPtr + 2);
    gAIScriptPtr += 4;
}

static void ContestAICmd_unk_72(void)
{
    // wtf? shouldn't T1_READ_16 work here? why the signed 8 load by gAIScriptPtr[2]?
    eContestAI->scriptArr[gAIScriptPtr[1]] += ((s8)gAIScriptPtr[2] | gAIScriptPtr[3] << 8);
    gAIScriptPtr += 4;
}

static void ContestAICmd_unk_73(void)
{
    eContestAI->scriptArr[gAIScriptPtr[1]] += eContestAI->scriptArr[gAIScriptPtr[2]];
    gAIScriptPtr += 3;
}

static void ContestAICmd_unk_74(void)
{
    eContestAI->scriptArr[gAIScriptPtr[1]] += eContestAI->scriptArr[gAIScriptPtr[2]];
    gAIScriptPtr += 3;
}

static void ContestAICmd_unk_75(void)
{
    if((s16)eContestAI->scriptArr[gAIScriptPtr[1]] < T1_READ_16(gAIScriptPtr + 2))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 4);
    else
        gAIScriptPtr += 8;
}

static void ContestAICmd_unk_76(void)
{
    if((s16)eContestAI->scriptArr[gAIScriptPtr[1]] > T1_READ_16(gAIScriptPtr + 2))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 4);
    else
        gAIScriptPtr += 8;
}

static void ContestAICmd_unk_77(void)
{
    if((s16)eContestAI->scriptArr[gAIScriptPtr[1]] == T1_READ_16(gAIScriptPtr + 2))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 4);
    else
        gAIScriptPtr += 8;
}

static void ContestAICmd_unk_78(void)
{
    if((s16)eContestAI->scriptArr[gAIScriptPtr[1]] != T1_READ_16(gAIScriptPtr + 2))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 4);
    else
        gAIScriptPtr += 8;
}

static void ContestAICmd_unk_79(void)
{
    if((s16)eContestAI->scriptArr[gAIScriptPtr[1]] < ((s16)eContestAI->scriptArr[gAIScriptPtr[2]]))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 3);
    else
        gAIScriptPtr += 7;
}

static void ContestAICmd_unk_7A(void)
{
    if((s16)eContestAI->scriptArr[gAIScriptPtr[1]] > ((s16)eContestAI->scriptArr[gAIScriptPtr[2]]))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 3);
    else
        gAIScriptPtr += 7;
}

static void ContestAICmd_unk_7B(void)
{
    if((s16)eContestAI->scriptArr[gAIScriptPtr[1]] == ((s16)eContestAI->scriptArr[gAIScriptPtr[2]]))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 3);
    else
        gAIScriptPtr += 7;
}

static void ContestAICmd_unk_7C(void)
{
    if((s16)eContestAI->scriptArr[gAIScriptPtr[1]] != ((s16)eContestAI->scriptArr[gAIScriptPtr[2]]))
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 3);
    else
        gAIScriptPtr += 7;
}

static void ContestAICmd_unk_7D(void)
{
    if((Random() & 0xFF) < (s16)eContestAI->scriptArr[gAIScriptPtr[1]])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

static void ContestAICmd_unk_7E(void)
{
    if((Random() & 0xFF) > (s16)eContestAI->scriptArr[gAIScriptPtr[1]])
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

// jump
static void ContestAICmd_unk_7F(void)
{
    gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
}

static void ContestAICmd_unk_80(void)
{
    sub_812ACA4(gAIScriptPtr + 5);
    gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 1);
}

static void ContestAICmd_unk_81(void)
{
    if(!sub_812ACC8())
        eContestAI->aiAction |= 1;
}

// push stack?
static void sub_812ACA4(u8 *ptr)
{
    u8 unk40 = eContestAI->unk40++;
    eContestAI->stack[unk40] = (u32)ptr;
}

// pop stack?
static bool8 sub_812ACC8(void)
{
    if(eContestAI->unk40 != 0)
    {
        --eContestAI->unk40;
        gAIScriptPtr = (u8 *)eContestAI->stack[eContestAI->unk40];
        return TRUE;
    }
    else
        return FALSE;
}

static void ContestAICmd_check_for_exciting_move(void)
{
    int result = 0;
    int i;

    for(i = 0; i < 4; i++)
    {
        if(gContestMons[eContestAI->unk41].moves[i])
        {
            // why is it using gSharedMem + 0x19325? that does not exist...
            if(Contest_GetMoveExcitement(gContestMons[eContestAI->unk41].moves[i]) == 1)
            {
                result = 1;
                break;
            }
        }
    }

    eContestAI->scriptResult = result;
    gAIScriptPtr += 1;
}

static void ContestAICmd_unk_83(void)
{
    ContestAICmd_check_for_exciting_move();

    if((s16)eContestAI->scriptResult != 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_84(void)
{
    ContestAICmd_check_for_exciting_move();

    if((s16)eContestAI->scriptResult == 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_85(void)
{
    int result = 0;
    int i;
    u16 arg = T1_READ_16(gAIScriptPtr + 1);
    
    for(i = 0; i < 4; i++)
    {
        u16 move = gContestMons[eContestAI->unk41].moves[i];
        if(move == arg)
        {
            result = 1;
            break;
        }
    }

    eContestAI->scriptResult = result;
    gAIScriptPtr += 3;
}

static void ContestAICmd_unk_86(void)
{
    ContestAICmd_unk_85();

    if((s16)eContestAI->scriptResult != 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}

static void ContestAICmd_unk_87(void)
{
    ContestAICmd_unk_85();

    if((s16)eContestAI->scriptResult == 0)
        gAIScriptPtr = T1_READ_PTR(gAIScriptPtr + 0);
    else
        gAIScriptPtr += 4;
}
