#include "global.h"
#include "ewram.h"
#include "contest.h"

u8 sub_80B9120(void);

extern bool8 const gComboStarterLookupTable[];

#define curContestant (&sContestantStatus[shared192D0.unk11])

bool8 AreMovesContestCombo(u16 lastMove, u16 nextMove) {
    u8 nextMoveComboMoves[4];
    u8 lastMoveComboStarterId = gContestMoves[lastMove].comboStarterId;
    nextMoveComboMoves[0] = gContestMoves[nextMove].comboMoves[0];
    nextMoveComboMoves[1] = gContestMoves[nextMove].comboMoves[1];
    nextMoveComboMoves[2] = gContestMoves[nextMove].comboMoves[2];
    nextMoveComboMoves[3] = gContestMoves[nextMove].comboMoves[3];

    if (lastMoveComboStarterId == 0)
        return 0;

    if (lastMoveComboStarterId == nextMoveComboMoves[0] || lastMoveComboStarterId == nextMoveComboMoves[1] || lastMoveComboStarterId == nextMoveComboMoves[2] || lastMoveComboStarterId == nextMoveComboMoves[3])
        return gComboStarterLookupTable[lastMoveComboStarterId];

    return 0;
}

void ContestEffect_00(void)
{
}

void ContestEffect_01(void)
{
    curContestant->unk10_2 = TRUE;
    SetContestantStatusUnk13(shared192D0.unk11, 0);
}

void ContestEffect_02(void)
{
    curContestant->unk11_3 = TRUE;
    SetContestantStatusUnk13(shared192D0.unk11, 1);
}

void ContestEffect_03(void)
{
    curContestant->unk10_3 = TRUE;
    curContestant->disappointedRepeat = FALSE;
    curContestant->moveRepeatCount = 0;
}

void ContestEffect_04(void)
{
    curContestant->unk12 = 1;
    SetContestantStatusUnk13(shared192D0.unk11, 2);
}

void ContestEffect_05(void)
{
    curContestant->unk10_1 = TRUE;
    SetContestantStatusUnk13(shared192D0.unk11, 3);
}

void ContestEffect_06(void)
{
    curContestant->unkF = 20;
    SetContestantStatusUnk13(shared192D0.unk11, 4);
}

void ContestEffect_07(void)
{
    curContestant->unk10_0 = TRUE;
    SetContestantStatusUnk13(shared192D0.unk11, 5);
}

void ContestEffect_08(void)
{
    u8 idx = 0;
    u8 a = shared192D0.unk11;

    if (shared192D0.unk0[a] != 0) {
        int i;
        for (i = 0; i < 4 && shared192D0.unk0[a] - 1 != shared192D0.unk0[i]; i++)
            ;
        shared192D0.unk8 = i;
        shared192D0.unk9 = 0xFF;
        idx = sub_80B9120();
    }
    if (idx == 0)
        SetContestantStatusUnk14(shared192D0.unk11, 0x36);
    SetContestantStatusUnk13(shared192D0.unk11, 48);
}
