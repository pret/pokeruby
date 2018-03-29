#include "global.h"
#include "ewram.h"
#include "random.h"
#include "contest.h"

u8 sub_80B9120(void);
bool8 sub_80B90C0(u8);

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
        shared192D0.unk8[0] = i;
        shared192D0.unk8[1] = 0xFF;
        idx = sub_80B9120();
    }
    if (idx == 0)
        SetContestantStatusUnk14(shared192D0.unk11, 0x36);
    SetContestantStatusUnk13(shared192D0.unk11, 48);
}

void ContestEffect_09(void)
{
    u8 idx = 0;
    u8 a = shared192D0.unk11;

    if (shared192D0.unk0[a] != 0) {
        int i;
        int j = 0;

        for (i = 0; i < 4; i++)
            if (shared192D0.unk0[a] > shared192D0.unk0[i])
                shared192D0.unk8[j++] = i;
        shared192D0.unk8[j] = 0xFF;
        idx = sub_80B9120();
    }
    if (idx == 0)
        SetContestantStatusUnk14(shared192D0.unk11, 0x36);
    SetContestantStatusUnk13(shared192D0.unk11, 48);
}

void ContestEffect_14(void)
{
    u8 r0 = Random() % 10;
    int r1 = 20;
    if (r0 >= 2)
    {
        r1 = 60;
        if (r0 < 8)
            r1 = 40;
    }
    shared192D0.unk4 = r1;
    ContestEffect_08();
}

void ContestEffect_15(void) {
    u8 r7 = 0;
    u8 r6 = shared192D0.unk11;

    if (shared192D0.unk0[r6] != 0)
    {
        int r5;

        for (r5 = 0; r5 < 4; r5++)
        {
            if (shared192D0.unk0[r6] > shared192D0.unk0[r5])
            {
                shared192D0.unk8[0] = r5;
                shared192D0.unk8[1] = 0xFF;
                {
                u8 r0 = Random() % 10;
                int r1 = 0;
                if (r0 > 0)
                {
                    r1 = 10;
                    if (r0 > 2)
                    {
                        r1 = 20;
                        if (r0 > 4)
                        {
                            r1 = 30;
                            if (r0 > 6)
                            {
                                r1 = 60;
                                if (r0 <= 8)
                                    r1 = 40;
                            }
                        }
                    }
                }
                shared192D0.unk4 = r1;
                }
                if (sub_80B9120())
                    r7++;
            }
        }
    }
    SetContestantStatusUnk13(shared192D0.unk11, 48);
    if (r7 == 0)
        SetContestantStatusUnk14(shared192D0.unk11, 0x36);
}

void ContestEffect_16(void)
{
    bool32 r9 = FALSE;
    u8 r7 = shared192D0.unk11;

    if (shared192D0.unk0[shared192D0.unk11] != 0)
    {
        int r6;

        for (r6 = 0; r6 < 4; r6++)
        {
            if (shared192D0.unk0[r7] > shared192D0.unk0[r6] &&
                sContestantStatus[r6].unk15_4 &&
                sub_80B90C0(r6))
            {
                sContestantStatus[r6].unk15_4 = FALSE;
                sContestantStatus[r6].unk15_5 = TRUE;
                SetContestantStatusUnk13(r6, 8);
                r9 = TRUE;
            }
        }
    }
    SetContestantStatusUnk13(shared192D0.unk11, 7);
    if (!r9)
    {
        SetContestantStatusUnk14(shared192D0.unk11, 0x36);
    }
}
