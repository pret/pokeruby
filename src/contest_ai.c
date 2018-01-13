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
