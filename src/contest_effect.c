#include "global.h"
#include "ewram.h"
#include "random.h"
#include "contest.h"

u8 sub_80B9120(void);
bool8 sub_80B90C0(u8);
void sub_80B9038(u8);

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
    if (r0 < 2)
        r1 = 20;
    else if (r0 < 8)
        r1 = 40;
    else
        r1 = 60;
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
                int r1;
                if (r0 == 0)
                    r1 = 0;
                else if (r0 <= 2)
                    r1 = 10;
                else if (r0 <= 4)
                    r1 = 20;
                else if (r0 <= 6)
                    r1 = 30;
                else if (r0 <= 8)
                    r1 = 40;
                else
                    r1 = 60;
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

void ContestEffect_17(void)
{
    u8 r9 = 0;
    u8 r8 = shared192D0.unk11;

    if (shared192D0.unk0[shared192D0.unk11] != 0)
    {
        int r5;

        for (r5 = 0; r5 < 4; r5++)
        {
            if (shared192D0.unk0[r8] > shared192D0.unk0[r5])
            {
                if (sContestantStatus[r5].unk15_4)
                    shared192D0.unk4 = 50;
                else
                    shared192D0.unk4 = 10;
                shared192D0.unk8[0] = r5;
                shared192D0.unk8[1] = 0xFF;
                if (sub_80B9120())
                    r9++;
            }
        }
    }
    SetContestantStatusUnk13(shared192D0.unk11, 48);
    if (r9 == 0)
        SetContestantStatusUnk14(shared192D0.unk11, 0x36);
}

void ContestEffect_18(void)
{
    curContestant->unk11_2 = TRUE;
    ContestEffect_09();
    SetContestantStatusUnk13(shared192D0.unk11, 48);
}

void ContestEffect_19(void)
{
    u16 move = curContestant->currMove;
    sub_80B9038(gContestMoves[move].contestCategory);
    SetContestantStatusUnk13(shared192D0.unk11, 48);
}

void ContestEffect_20(void)
{
    sub_80B9038(CONTEST_CATEGORY_COOL);
    SetContestantStatusUnk13(shared192D0.unk11, 48);
}

void ContestEffect_21(void)
{
    sub_80B9038(CONTEST_CATEGORY_BEAUTY);
    SetContestantStatusUnk13(shared192D0.unk11, 48);
}

void ContestEffect_22(void)
{
    sub_80B9038(CONTEST_CATEGORY_CUTE);
    SetContestantStatusUnk13(shared192D0.unk11, 48);
}

void ContestEffect_23(void)
{
    sub_80B9038(CONTEST_CATEGORY_SMART);
    SetContestantStatusUnk13(shared192D0.unk11, 48);
}

void ContestEffect_24(void)
{
    sub_80B9038(CONTEST_CATEGORY_TOUGH);
    SetContestantStatusUnk13(shared192D0.unk11, 48);
}

void ContestEffect_25(void)
{
    bool32 r4 = FALSE;

    if (shared192D0.unk0[shared192D0.unk11] != 3)
    {
        int r5;

        for (r5 = 0; r5 < 4; r5++)
        {
            if (shared192D0.unk0[shared192D0.unk11] + 1 == shared192D0.unk0[r5])
            {
                if (sub_80B90C0(r5))
                {
                    sub_80B157C(r5);
                    SetContestantStatusUnk13(r5, 10);
                    r4 = TRUE;
                }
                else
                {
                    SetContestantStatusUnk13(r5, 60);
                    r4 = TRUE;
                }
            }
        }
    }
    SetContestantStatusUnk13(shared192D0.unk11, 9);
    if (!r4)
        SetContestantStatusUnk14(shared192D0.unk11, 0x36);
}

void ContestEffect_26(void)
{
    u8 r9 = 0;
    bool32 sp18 = FALSE;
    u8 sp00[5];
    int r6;
    int r4;
    s16 sp08[4];
    s16 sp10[4];

    memset(sp00, 0xFF, ARRAY_COUNT(sp00));
    for (r6 = 0, r4 = 0; r6 < 4; r6++)
    {
        if (shared192D0.unk0[shared192D0.unk11] < shared192D0.unk0[r6] &&
            !sContestantStatus[r6].unkC_0 && !Contest_IsMonsTurnDisabled(r6))
            sp00[r4++] = r6;
    }

    if (r4 == 1)
    {
        sp10[0] = 60;
    }
    else if (r4 == 2)
    {
        sp10[0] = 30;
        sp10[1] = 30;
    }
    else if (r4 == 3)
    {
        sp10[0] = 20;
        sp10[1] = 20;
        sp10[2] = 20;
    }
    else
    {
        for (r6 = 0; r6 < 4; r6++)
            sp10[r6] = 0;
    }
    for (r6 = 0; r6 < 4; r6++)
    {
        if (sContestantStatus[r6].unk15_4 && sub_80B214C(r6))
            sp08[r6] = gComboStarterLookupTable[gContestMoves[sContestantStatus[r6].prevMove].comboStarterId] * 10;
        else
            sp08[r6] = 0;
        sp08[r6] -= (sContestantStatus[r6].unkD / 10) * 10;
    }
    if (sp10[0] != 0)
    {
        for (r6 = 0; sp00[r6] != 0xFF; r6++)
        {
            if (Random() % 100 < sp10[r6] + sp08[sp00[r6]])
            {
                if (sub_80B90C0(sp00[r6]))
                {
                    sub_80B157C(sp00[r6]);
                    SetContestantStatusUnk13(sp00[r6], 10);
                    r9++;
                } else
                    sp18 = TRUE;
            } else
                sp18 = TRUE;
            if (sp18)
            {
                sp18 = FALSE;
                SetContestantStatusUnk13(sp00[r6], 60);
                r9++;
            }
            shared192D0.unkD[sp00[r6]] = 1;
        }
    }
    SetContestantStatusUnk13(shared192D0.unk11, 11);
    if (r9 == 0)
        SetContestantStatusUnk14(shared192D0.unk11, 0x36);
}

void ContestEffect_27(void)
{
    u8 r8 = 0;
    int r6;

    for (r6 = 0; r6 < 4; r6++)
    {
        if (shared192D0.unk0[shared192D0.unk11] > shared192D0.unk0[r6] &&
            sContestantStatus[r6].unkD > 0 &&
            sub_80B90C0(r6))
        {
            sContestantStatus[r6].unkD = 0;
            sContestantStatus[r6].unk10_4 = 2;
            SetContestantStatusUnk13(r6, 13);
            r8++;
        }
    }

    SetContestantStatusUnk13(shared192D0.unk11, 12);
    if (r8 == 0)
        SetContestantStatusUnk14(shared192D0.unk11, 0x39);
}

void ContestEffect_28(void)
{
    u8 r7 = 0;
    int r5;

    for (r5 = 0; r5 < 4; r5++)
    {
        if (shared192D0.unk0[shared192D0.unk11] > shared192D0.unk0[r5])
        {
            if (sContestantStatus[r5].unkD > 0)
                shared192D0.unk4 = 40;
            else
                shared192D0.unk4 = 10;
            shared192D0.unk8[0] = r5;
            shared192D0.unk8[1] = 0xFF;
            if (sub_80B9120())
                r7++;
        }
    }
    SetContestantStatusUnk13(shared192D0.unk11, 14);
    if (r7 == 0)
        SetContestantStatusUnk14(shared192D0.unk11, 0x39);
}

void ContestEffect_29(void)
{
    if (gUnknown_02038696[shared192D0.unk11] == 0)
    {
        u16 move = curContestant->currMove;
        curContestant->appeal2 += 2 * gContestEffects[gContestMoves[move].effect].appeal;
        SetContestantStatusUnk13(shared192D0.unk11, 15);
    }
}

void ContestEffect_30(void)
{
    if (gUnknown_02038696[shared192D0.unk11] == 3)
    {
        u16 move = curContestant->currMove;
        curContestant->appeal2 += 2 * gContestEffects[gContestMoves[move].effect].appeal;
        SetContestantStatusUnk13(shared192D0.unk11, 16);
    }
}
