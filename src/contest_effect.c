#include "global.h"
#include "ewram.h"
#include "random.h"
#include "contest.h"

u8 sub_80B9120(void);
bool8 sub_80B90C0(u8);
void sub_80B9038(u8);
s16 sub_80B9224(s16);

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

void ContestEffect_31(void)
{
    int r1;
    int r3;

    for (r1 = 0, r3 = 0; r1 < 4; r1++)
    {
        if (shared192D0.unk0[shared192D0.unk11] > shared192D0.unk0[r1])
            r3 += sContestantStatus[r1].appeal2;
    }
    if (r3 < 0)
        r3 = 0;
    if (shared192D0.unk0[shared192D0.unk11] == 0 || r3 == 0)
        SetContestantStatusUnk13(shared192D0.unk11, 18);
    else
    {
        curContestant->appeal2 += r3 / 2;
        SetContestantStatusUnk13(shared192D0.unk11, 17);
    }
    sContestantStatus[shared192D0.unk11].appeal2 = sub_80B9224(sContestantStatus[shared192D0.unk11].appeal2);
}

void ContestEffect_32(void)
{
    s16 r6 = 0;

    if (shared192D0.unk0[shared192D0.unk11] != 0)
    {
        int i;
        for (i = 0; i < 4; i++)
        {
            if (shared192D0.unk0[shared192D0.unk11] - 1 == shared192D0.unk0[i])
                r6 = sContestantStatus[i].appeal2;
        }
    }
    if (shared192D0.unk0[shared192D0.unk11] == 0 || r6 <= 0)
        SetContestantStatusUnk13(shared192D0.unk11, 20);
    else
    {
        curContestant->appeal2 += r6;
        SetContestantStatusUnk13(shared192D0.unk11, 19);
    }
}

void ContestEffect_33(void)
{
    u8 r3 = shared192D0.unk0[shared192D0.unk11];
    if (r3 == 0)
        sContestantStatus[shared192D0.unk11].appeal2 = 10;
    else
        sContestantStatus[shared192D0.unk11].appeal2 = 20 * r3;
    if (r3 == 0)
        SetContestantStatusUnk13(shared192D0.unk11, 21);
    else if (r3 == 1)
        SetContestantStatusUnk13(shared192D0.unk11, 22);
    else if (r3 == 2)
        SetContestantStatusUnk13(shared192D0.unk11, 23);
    else
        SetContestantStatusUnk13(shared192D0.unk11, 24);
}

void ContestEffect_34(void)
{
    u8 r0 = Random() % 10;
    s16 r4;

    if (r0 < 3)
    {
        r4 = 10;
        SetContestantStatusUnk13(shared192D0.unk11, 26);
    } else if (r0 < 6)
    {
        r4 = 20;
        SetContestantStatusUnk13(shared192D0.unk11, 27);
    } else if (r0 < 8)
    {
        r4 = 40;
        SetContestantStatusUnk13(shared192D0.unk11, 28);
    } else if (r0 < 9)
    {
        r4 = 60;
        SetContestantStatusUnk13(shared192D0.unk11, 29);
    }
    else
    {
        r4 = 80;
        SetContestantStatusUnk13(shared192D0.unk11, 30);
    }
    curContestant->appeal2 = r4;
}

#ifdef NONMATCHING
// Not even close, send help
void ContestEffect_35(void)
{
    s8 r4;

    for (r4 = shared192D0.unk0[shared192D0.unk11] - 1; r4 >= 0; r4--)
    {
        s8 r2;
        for (r2 = 0; r2 < 4; r2++)
        {
            if (shared192D0.unk0[r2] == r4)
                break;
        }
        if (!(sContestantStatus[r2].unkB_7 || sContestantStatus[r2].unkC_0 || sContestantStatus[r2].unkC_1))
        {
            u16 move = curContestant->currMove;
            const struct ContestMove *contestMove = gContestMoves + move;
            if (contestMove->contestCategory == gContestMoves[sContestantStatus[r2].currMove].contestCategory)
            {
                curContestant->appeal2 += gContestEffects[contestMove->effect].appeal * 2;
                SetContestantStatusUnk13(shared192D0.unk11, 31);
            }
            break;
        }
    }
}
#else
__attribute__((naked)) void ContestEffect_35(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tldr r1, _080B8940 @ =gSharedMem + 0x192D0\n"
                "\tldrb r0, [r1, 0x11]\n"
                "\tadds r0, r1\n"
                "\tmovs r2, 0\n"
                "\tldrsb r2, [r0, r2]\n"
                "\tsubs r0, r2, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tmov r12, r1\n"
                "\tcmp r2, 0\n"
                "\tbeq _080B8994\n"
                "\tldrb r5, [r1]\n"
                "\tmov r6, r12\n"
                "\tsubs r6, 0x70\n"
                "_080B88EA:\n"
                "\tmovs r2, 0\n"
                "\tlsls r0, r4, 24\n"
                "\tasrs r1, r0, 24\n"
                "\tadds r4, r0, 0\n"
                "\tcmp r5, r1\n"
                "\tbeq _080B8910\n"
                "\tldr r3, _080B8940 @ =gSharedMem + 0x192D0\n"
                "_080B88F8:\n"
                "\tlsls r0, r2, 24\n"
                "\tmovs r2, 0x80\n"
                "\tlsls r2, 17\n"
                "\tadds r0, r2\n"
                "\tlsrs r2, r0, 24\n"
                "\tasrs r0, 24\n"
                "\tcmp r0, 0x3\n"
                "\tbgt _080B8910\n"
                "\tadds r0, r3\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, r1\n"
                "\tbne _080B88F8\n"
                "_080B8910:\n"
                "\tlsls r2, 24\n"
                "\tasrs r1, r2, 24\n"
                "\tlsls r0, r1, 3\n"
                "\tsubs r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r3, r0, r6\n"
                "\tldrb r1, [r3, 0xB]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tadds r7, r2, 0\n"
                "\tcmp r0, 0\n"
                "\tbne _080B8932\n"
                "\tldrb r1, [r3, 0xC]\n"
                "\tmovs r0, 0x7\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080B8944\n"
                "_080B8932:\n"
                "\tmovs r1, 0xFF\n"
                "\tlsls r1, 24\n"
                "\tadds r0, r4, r1\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r0, 0\n"
                "\tblt _080B8994\n"
                "\tb _080B88EA\n"
                "\t.align 2, 0\n"
                "_080B8940: .4byte gSharedMem + 0x192D0\n"
                "_080B8944:\n"
                "\tmov r2, r12\n"
                "\tldrb r1, [r2, 0x11]\n"
                "\tlsls r0, r1, 3\n"
                "\tsubs r0, r1\n"
                "\tlsls r0, 2\n"
                "\tmov r3, r12\n"
                "\tsubs r3, 0x70\n"
                "\tadds r5, r0, r3\n"
                "\tldrh r0, [r5, 0x6]\n"
                "\tldr r4, _080B899C @ =gContestMoves\n"
                "\tlsls r0, 3\n"
                "\tadds r6, r0, r4\n"
                "\tldrb r2, [r6, 0x1]\n"
                "\tlsls r2, 29\n"
                "\tasrs r1, r7, 24\n"
                "\tlsls r0, r1, 3\n"
                "\tsubs r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r3\n"
                "\tldrh r0, [r0, 0x6]\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r4\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tlsls r0, 29\n"
                "\tcmp r2, r0\n"
                "\tbne _080B8994\n"
                "\tldr r1, _080B89A0 @ =gContestEffects\n"
                "\tldrb r0, [r6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tlsls r0, 1\n"
                "\tldrh r1, [r5, 0x2]\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r5, 0x2]\n"
                "\tmov r2, r12\n"
                "\tldrb r0, [r2, 0x11]\n"
                "\tmovs r1, 0x1F\n"
                "\tbl SetContestantStatusUnk13\n"
                "_080B8994:\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080B899C: .4byte gContestMoves\n"
                "_080B89A0: .4byte gContestEffects");
}
#endif

void ContestEffect_36(void)
{
    if (shared192D0.unk0[shared192D0.unk11] != 0)
    {
        u16 move = curContestant->currMove;
        int i;

        for (i = 0; i < 4; i++)
        {
            if (shared192D0.unk0[shared192D0.unk11] - 1 == shared192D0.unk0[i] &&
                gContestMoves[move].contestCategory != gContestMoves[sContestantStatus[i].currMove].contestCategory)
            {
                curContestant->appeal2 += gContestEffects[gContestMoves[move].effect].appeal * 2;
                SetContestantStatusUnk13(shared192D0.unk11, 32);
                break;
            }
        }
    }
}

void ContestEffect_37(void)
{
    if (shared192D0.unk0[shared192D0.unk11] != 0)
    {
        int i;

        for (i = 0; i < 4; i++)
        {
            if (shared192D0.unk0[shared192D0.unk11] - 1 == shared192D0.unk0[i])
            {
                if (curContestant->appeal2 > sContestantStatus[i].appeal2)
                {
                    curContestant->appeal2 *= 2;
                    SetContestantStatusUnk13(shared192D0.unk11, 33);
                }
                else if (curContestant->appeal2 < sContestantStatus[i].appeal2)
                {
                    curContestant->appeal2 = 0;
                    SetContestantStatusUnk13(shared192D0.unk11, 34);
                }
            }
        }
    }
}

void ContestEffect_38(void)
{
    if (curContestant->unkD < 30)
    {
        curContestant->unkD += 10;
        curContestant->unk10_4 = 1;
        SetContestantStatusUnk13(shared192D0.unk11, 35);
    }
    else
        SetContestantStatusUnk13(shared192D0.unk11, 58);
}
