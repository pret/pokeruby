#include "global.h"
#include "ewram.h"
#include "random.h"
#include "contest.h"

static void ContestEffect_00(void);
static void ContestEffect_01(void);
static void ContestEffect_02(void);
static void ContestEffect_03(void);
static void ContestEffect_04(void);
static void ContestEffect_05(void);
static void ContestEffect_06(void);
static void ContestEffect_07(void);
static void ContestEffect_08(void);
static void ContestEffect_09(void);
static void ContestEffect_14(void);
static void ContestEffect_15(void);
static void ContestEffect_16(void);
static void ContestEffect_17(void);
static void ContestEffect_18(void);
static void ContestEffect_19(void);
static void ContestEffect_20(void);
static void ContestEffect_21(void);
static void ContestEffect_22(void);
static void ContestEffect_23(void);
static void ContestEffect_24(void);
static void ContestEffect_25(void);
static void ContestEffect_26(void);
static void ContestEffect_27(void);
static void ContestEffect_28(void);
static void ContestEffect_29(void);
static void ContestEffect_30(void);
static void ContestEffect_31(void);
static void ContestEffect_32(void);
static void ContestEffect_33(void);
static void ContestEffect_34(void);
static void ContestEffect_35(void);
static void ContestEffect_36(void);
static void ContestEffect_37(void);
static void ContestEffect_38(void);
static void ContestEffect_39(void);
static void ContestEffect_40(void);
static void ContestEffect_41(void);
static void ContestEffect_42(void);
static void ContestEffect_43(void);
static void ContestEffect_44(void);
static void ContestEffect_45(void);
static void ContestEffect_46(void);
static void ContestEffect_47(void);
static void JamByMoveCategory(u8);
static bool8 sub_80B90C0(u8);
static u8 WasAtLeastOneOpponentJammed(void);
static void sub_80B9200(u8, u8);
static s16 RoundTowardsZero(s16);
static s16 RoundUp(s16);

#define abs(x) ((x) >= 0 ? (x) : -(x))

#include "data/contest_moves.h"

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

static void ContestEffect_00(void)
// A highly appealing move.
{
}

static void ContestEffect_01(void)
// After this move, the user is more easily startled.
{
    sContestantStatus[shared192D0.contestant].moreEasilyStartled = TRUE;
    SetContestantEffectStringID(shared192D0.contestant, 0);
}

static void ContestEffect_02(void)
// Makes a great appeal, but allows no more to the end.
{
    sContestantStatus[shared192D0.contestant].exploded = TRUE;
    SetContestantEffectStringID(shared192D0.contestant, 1);
}

static void ContestEffect_03(void)
// Can be used repeatedly without boring the JUDGE.
{
    sContestantStatus[shared192D0.contestant].usedRepeatableMove = TRUE;
    sContestantStatus[shared192D0.contestant].disappointedRepeat = FALSE;
    sContestantStatus[shared192D0.contestant].moveRepeatCount = 0;
}

static void ContestEffect_04(void)
// Can avoid being startled by others once.
{
    sContestantStatus[shared192D0.contestant].jamSafetyCount = 1;
    SetContestantEffectStringID(shared192D0.contestant, 2);
}

static void ContestEffect_05(void)
// Can avoid being startled by others.
{
    sContestantStatus[shared192D0.contestant].immune = TRUE;
    SetContestantEffectStringID(shared192D0.contestant, 3);
}

static void ContestEffect_06(void)
// Can avoid being startled by others a little.
{
    sContestantStatus[shared192D0.contestant].jamReduction = 20;
    SetContestantEffectStringID(shared192D0.contestant, 4);
}

static void ContestEffect_07(void)
// After this move, the user is less likely to be startled.
{
    sContestantStatus[shared192D0.contestant].resistant = TRUE;
    SetContestantEffectStringID(shared192D0.contestant, 5);
}

static void ContestEffect_08(void)
// Slightly startles the POKéMON in front.
{
    u8 idx = 0;
    u8 a = shared192D0.contestant;

    if (shared192D0.turnOrder[a] != 0) {
        int i;

        for (i = 0; i < 4; i++)
        {
            if (shared192D0.turnOrder[a] - 1 == shared192D0.turnOrder[i])
                break;
        }
        shared192D0.unk8[0] = i;
        shared192D0.unk8[1] = 0xFF;
        idx = WasAtLeastOneOpponentJammed();
    }
    if (idx == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
    SetContestantEffectStringID(shared192D0.contestant, 48);
}

static void ContestEffect_09(void)
// Slightly startles those that have made appeals.
{
    u8 idx = 0;
    u8 a = shared192D0.contestant;

    if (shared192D0.turnOrder[a] != 0) {
        int i;
        int j = 0;

        for (i = 0; i < 4; i++)
            if (shared192D0.turnOrder[a] > shared192D0.turnOrder[i])
                shared192D0.unk8[j++] = i;
        shared192D0.unk8[j] = 0xFF;
        idx = WasAtLeastOneOpponentJammed();
    }
    if (idx == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
    SetContestantEffectStringID(shared192D0.contestant, 48);
}

static void ContestEffect_14(void)
// Startles the POKéMON that appealed before the user.
{
    u8 r0 = Random() % 10;
    int r1 = 20;
    if (r0 < 2)
        r1 = 20;
    else if (r0 < 8)
        r1 = 40;
    else
        r1 = 60;
    shared192D0.jam = r1;
    ContestEffect_08();
}

static void ContestEffect_15(void)
// Startles all POKéMON that appealed before the user.
{
    u8 r7 = 0;
    u8 r6 = shared192D0.contestant;

    if (shared192D0.turnOrder[r6] != 0)
    {
        int r5;

        for (r5 = 0; r5 < 4; r5++)
        {
            if (shared192D0.turnOrder[r6] > shared192D0.turnOrder[r5])
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
                shared192D0.jam = r1;
                }
                if (WasAtLeastOneOpponentJammed())
                    r7++;
            }
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 48);
    if (r7 == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
}

static void ContestEffect_16(void)
// Shifts the JUDGE’s attention from others.
{
    bool32 r9 = FALSE;
    u8 r7 = shared192D0.contestant;

    if (shared192D0.turnOrder[shared192D0.contestant] != 0)
    {
        int r6;

        for (r6 = 0; r6 < 4; r6++)
        {
            if (shared192D0.turnOrder[r7] > shared192D0.turnOrder[r6] &&
                sContestantStatus[r6].hasJudgesAttention &&
                sub_80B90C0(r6))
            {
                sContestantStatus[r6].hasJudgesAttention = FALSE;
                sContestantStatus[r6].unk15_5 = TRUE;
                SetContestantEffectStringID(r6, 8);
                r9 = TRUE;
            }
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 7);
    if (!r9)
    {
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
    }
}

static void ContestEffect_17(void)
// Startles the POKéMON that has the JUDGE’s attention.
{
    u8 r9 = 0;
    u8 r8 = shared192D0.contestant;

    if (shared192D0.turnOrder[shared192D0.contestant] != 0)
    {
        int r5;

        for (r5 = 0; r5 < 4; r5++)
        {
            if (shared192D0.turnOrder[r8] > shared192D0.turnOrder[r5])
            {
                if (sContestantStatus[r5].hasJudgesAttention)
                    shared192D0.jam = 50;
                else
                    shared192D0.jam = 10;
                shared192D0.unk8[0] = r5;
                shared192D0.unk8[1] = 0xFF;
                if (WasAtLeastOneOpponentJammed())
                    r9++;
            }
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 48);
    if (r9 == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
}

static void ContestEffect_18(void)
// Jams the others, and misses one turn of appeals.
{
    sContestantStatus[shared192D0.contestant].turnSkipped = TRUE;
    ContestEffect_09();
    SetContestantEffectStringID(shared192D0.contestant, 48);
}

static void ContestEffect_19(void)
// Startles POKéMON that made a same-type appeal.
{
    u16 move = sContestantStatus[shared192D0.contestant].currMove;
    JamByMoveCategory(gContestMoves[move].contestCategory);
    SetContestantEffectStringID(shared192D0.contestant, 48);
}

static void ContestEffect_20(void)
// Badly startles POKéMON that made COOL appeals.
{
    JamByMoveCategory(CONTEST_CATEGORY_COOL);
    SetContestantEffectStringID(shared192D0.contestant, 48);
}

static void ContestEffect_21(void)
// Badly startles POKéMON that made BEAUTY appeals.
{
    JamByMoveCategory(CONTEST_CATEGORY_BEAUTY);
    SetContestantEffectStringID(shared192D0.contestant, 48);
}

static void ContestEffect_22(void)
// Badly startles POKéMON that made CUTE appeals.
{
    JamByMoveCategory(CONTEST_CATEGORY_CUTE);
    SetContestantEffectStringID(shared192D0.contestant, 48);
}

static void ContestEffect_23(void)
// Badly startles POKéMON that made SMART appeals.
{
    JamByMoveCategory(CONTEST_CATEGORY_SMART);
    SetContestantEffectStringID(shared192D0.contestant, 48);
}

static void ContestEffect_24(void)
// Badly startles POKéMON that made TOUGH appeals.
{
    JamByMoveCategory(CONTEST_CATEGORY_TOUGH);
    SetContestantEffectStringID(shared192D0.contestant, 48);
}

static void ContestEffect_25(void)
// Makes one POKéMON after the user nervous.
{
    bool32 r4 = FALSE;

    if (shared192D0.turnOrder[shared192D0.contestant] != 3)
    {
        int r5;

        for (r5 = 0; r5 < 4; r5++)
        {
            if (shared192D0.turnOrder[shared192D0.contestant] + 1 == shared192D0.turnOrder[r5])
            {
                if (sub_80B90C0(r5))
                {
                    MakeContestantNervous(r5);
                    SetContestantEffectStringID(r5, 10);
                    r4 = TRUE;
                }
                else
                {
                    SetContestantEffectStringID(r5, 60);
                    r4 = TRUE;
                }
            }
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 9);
    if (!r4)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
}

static void ContestEffect_26(void)
// Makes all POKéMON after the user nervous.
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
        if (shared192D0.turnOrder[shared192D0.contestant] < shared192D0.turnOrder[r6] &&
            !sContestantStatus[r6].nervous && !Contest_IsMonsTurnDisabled(r6))
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
        if (sContestantStatus[r6].hasJudgesAttention && sub_80B214C(r6))
            sp08[r6] = gComboStarterLookupTable[gContestMoves[sContestantStatus[r6].prevMove].comboStarterId] * 10;
        else
            sp08[r6] = 0;
        sp08[r6] -= (sContestantStatus[r6].condition / 10) * 10;
    }
    if (sp10[0] != 0)
    {
        for (r6 = 0; sp00[r6] != 0xFF; r6++)
        {
            if (Random() % 100 < sp10[r6] + sp08[sp00[r6]])
            {
                if (sub_80B90C0(sp00[r6]))
                {
                    MakeContestantNervous(sp00[r6]);
                    SetContestantEffectStringID(sp00[r6], 10);
                    r9++;
                } else
                    sp18 = TRUE;
            } else
                sp18 = TRUE;
            if (sp18)
            {
                sp18 = FALSE;
                SetContestantEffectStringID(sp00[r6], 60);
                r9++;
            }
            shared192D0.unkD[sp00[r6]] = 1;
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 11);
    if (r9 == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
}

static void ContestEffect_27(void)
// Worsens the condition of those that made appeals.
{
    u8 r8 = 0;
    int r6;

    for (r6 = 0; r6 < 4; r6++)
    {
        if (shared192D0.turnOrder[shared192D0.contestant] > shared192D0.turnOrder[r6] &&
            sContestantStatus[r6].condition > 0 &&
            sub_80B90C0(r6))
        {
            sContestantStatus[r6].condition = 0;
            sContestantStatus[r6].unk10_4 = 2;
            SetContestantEffectStringID(r6, 13);
            r8++;
        }
    }

    SetContestantEffectStringID(shared192D0.contestant, 12);
    if (r8 == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x39);
}

static void ContestEffect_28(void)
// Badly startles POKéMON in good condition.
{
    u8 r7 = 0;
    int r5;

    for (r5 = 0; r5 < 4; r5++)
    {
        if (shared192D0.turnOrder[shared192D0.contestant] > shared192D0.turnOrder[r5])
        {
            if (sContestantStatus[r5].condition > 0)
                shared192D0.jam = 40;
            else
                shared192D0.jam = 10;
            shared192D0.unk8[0] = r5;
            shared192D0.unk8[1] = 0xFF;
            if (WasAtLeastOneOpponentJammed())
                r7++;
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 14);
    if (r7 == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x39);
}

static void ContestEffect_29(void)
// The appeal works great if performed first.
{
    if (gUnknown_02038696[shared192D0.contestant] == 0)
    {
        u16 move = sContestantStatus[shared192D0.contestant].currMove;
        sContestantStatus[shared192D0.contestant].appeal2 += 2 * gContestEffects[gContestMoves[move].effect].appeal;
        SetContestantEffectStringID(shared192D0.contestant, 15);
    }
}

static void ContestEffect_30(void)
// The appeal works great if performed last.
{
    if (gUnknown_02038696[shared192D0.contestant] == 3)
    {
        u16 move = sContestantStatus[shared192D0.contestant].currMove;
        sContestantStatus[shared192D0.contestant].appeal2 += 2 * gContestEffects[gContestMoves[move].effect].appeal;
        SetContestantEffectStringID(shared192D0.contestant, 16);
    }
}

static void ContestEffect_31(void)
// Makes the appeal as good as those before it.
{
    int r1;
    int r3;

    for (r1 = 0, r3 = 0; r1 < 4; r1++)
    {
        if (shared192D0.turnOrder[shared192D0.contestant] > shared192D0.turnOrder[r1])
            r3 += sContestantStatus[r1].appeal2;
    }
    if (r3 < 0)
        r3 = 0;
    if (shared192D0.turnOrder[shared192D0.contestant] == 0 || r3 == 0)
        SetContestantEffectStringID(shared192D0.contestant, 18);
    else
    {
        sContestantStatus[shared192D0.contestant].appeal2 += r3 / 2;
        SetContestantEffectStringID(shared192D0.contestant, 17);
    }
    sContestantStatus[shared192D0.contestant].appeal2 = RoundTowardsZero(sContestantStatus[shared192D0.contestant].appeal2);
}

static void ContestEffect_32(void)
// Makes the appeal as good as the one before it.
{
    s16 r6 = 0;

    if (shared192D0.turnOrder[shared192D0.contestant] != 0)
    {
        int i;
        for (i = 0; i < 4; i++)
        {
            if (shared192D0.turnOrder[shared192D0.contestant] - 1 == shared192D0.turnOrder[i])
                r6 = sContestantStatus[i].appeal2;
        }
    }
    if (shared192D0.turnOrder[shared192D0.contestant] == 0 || r6 <= 0)
        SetContestantEffectStringID(shared192D0.contestant, 20);
    else
    {
        sContestantStatus[shared192D0.contestant].appeal2 += r6;
        SetContestantEffectStringID(shared192D0.contestant, 19);
    }
}

static void ContestEffect_33(void)
// The appeal works better the later it is performed.
{
    u8 r3 = shared192D0.turnOrder[shared192D0.contestant];
    if (r3 == 0)
        sContestantStatus[shared192D0.contestant].appeal2 = 10;
    else
        sContestantStatus[shared192D0.contestant].appeal2 = 20 * r3;
    if (r3 == 0)
        SetContestantEffectStringID(shared192D0.contestant, 21);
    else if (r3 == 1)
        SetContestantEffectStringID(shared192D0.contestant, 22);
    else if (r3 == 2)
        SetContestantEffectStringID(shared192D0.contestant, 23);
    else
        SetContestantEffectStringID(shared192D0.contestant, 24);
}

static void ContestEffect_34(void)
// The appeal’s quality varies depending on its timing.
{
    u8 r0 = Random() % 10;
    s16 r4;

    if (r0 < 3)
    {
        r4 = 10;
        SetContestantEffectStringID(shared192D0.contestant, 26);
    } else if (r0 < 6)
    {
        r4 = 20;
        SetContestantEffectStringID(shared192D0.contestant, 27);
    } else if (r0 < 8)
    {
        r4 = 40;
        SetContestantEffectStringID(shared192D0.contestant, 28);
    } else if (r0 < 9)
    {
        r4 = 60;
        SetContestantEffectStringID(shared192D0.contestant, 29);
    }
    else
    {
        r4 = 80;
        SetContestantEffectStringID(shared192D0.contestant, 30);
    }
    sContestantStatus[shared192D0.contestant].appeal2 = r4;
}

#ifdef NONMATCHING
// Not even close, send help
static void ContestEffect_35(void)
// Works well if it’s the same type as the one before.
{
    s8 r4;
    s8 r2;

    for (r4 = shared192D0.turnOrder[shared192D0.contestant]; r4 > 0; r4--)
    {
        for (r2 = 0; r2 < 4; r2++)
        {
            if (shared192D0.turnOrder[r2] == r4 - 1)
                break;
        }
        if (!(sContestantStatus[r2].noMoreTurns || sContestantStatus[r2].nervous || sContestantStatus[r2].numTurnsSkipped))
        {
            u16 move = sContestantStatus[shared192D0.contestant].currMove;

            if (gContestMoves[move].contestCategory == gContestMoves[sContestantStatus[r2].currMove].contestCategory)
            {
                sContestantStatus[shared192D0.contestant].appeal2 += gContestEffects[gContestMoves[move].effect].appeal * 2;
                SetContestantEffectStringID(shared192D0.contestant, 31);
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
                "\tbl SetContestantEffectStringID\n"
                "_080B8994:\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080B899C: .4byte gContestMoves\n"
                "_080B89A0: .4byte gContestEffects");
}
#endif

static void ContestEffect_36(void)
// Works well if different in type than the one before.
{
    if (shared192D0.turnOrder[shared192D0.contestant] != 0)
    {
        u16 move = sContestantStatus[shared192D0.contestant].currMove;
        int i;

        for (i = 0; i < 4; i++)
        {
            if (shared192D0.turnOrder[shared192D0.contestant] - 1 == shared192D0.turnOrder[i] &&
                gContestMoves[move].contestCategory != gContestMoves[sContestantStatus[i].currMove].contestCategory)
            {
                sContestantStatus[shared192D0.contestant].appeal2 += gContestEffects[gContestMoves[move].effect].appeal * 2;
                SetContestantEffectStringID(shared192D0.contestant, 32);
                break;
            }
        }
    }
}

static void ContestEffect_37(void)
// Affected by how well the appeal in front goes.
{
    if (shared192D0.turnOrder[shared192D0.contestant] != 0)
    {
        int i;

        for (i = 0; i < 4; i++)
        {
            if (shared192D0.turnOrder[shared192D0.contestant] - 1 == shared192D0.turnOrder[i])
            {
                if (sContestantStatus[shared192D0.contestant].appeal2 > sContestantStatus[i].appeal2)
                {
                    sContestantStatus[shared192D0.contestant].appeal2 *= 2;
                    SetContestantEffectStringID(shared192D0.contestant, 33);
                }
                else if (sContestantStatus[shared192D0.contestant].appeal2 < sContestantStatus[i].appeal2)
                {
                    sContestantStatus[shared192D0.contestant].appeal2 = 0;
                    SetContestantEffectStringID(shared192D0.contestant, 34);
                }
            }
        }
    }
}

static void ContestEffect_38(void)
// Ups the user’s condition. Helps prevent nervousness.
{
    if (sContestantStatus[shared192D0.contestant].condition < 30)
    {
        sContestantStatus[shared192D0.contestant].condition += 10;
        sContestantStatus[shared192D0.contestant].unk10_4 = 1;
        SetContestantEffectStringID(shared192D0.contestant, 35);
    }
    else
        SetContestantEffectStringID(shared192D0.contestant, 58);
}

static void ContestEffect_39(void)
// The appeal works well if the user’s condition is good.
{
    sContestantStatus[shared192D0.contestant].unk11_5 = TRUE;
    if (sContestantStatus[shared192D0.contestant].condition != 0)
        SetContestantEffectStringID(shared192D0.contestant, 36);
    else
        SetContestantEffectStringID(shared192D0.contestant, 59);
}

static void ContestEffect_40(void)
// The next appeal can be made earlier next turn.
{
    s8 i;
    s8 j;
    u8 sp00[4];

    if (sContest.turnNumber != 4)
    {
        for (i = 0; i < 4; i++)
            sp00[i] = sContestantStatus[i].unk19;

        sp00[shared192D0.contestant] = 0xFF;

        for (i = 0; i < 4; i++)
        {
            for (j = 0; j < 4; j++)
            {
                if (j != shared192D0.contestant &&
                    i == sp00[j] &&
                    sp00[j] == sContestantStatus[j].unk19)
                {
                    sp00[j]++;
                    break;
                }
            }
            if (j == 4)
                break;
        }

        sp00[shared192D0.contestant] = 0;
        sContestantStatus[shared192D0.contestant].unk10_6 = 1;

        for (i = 0; i < 4; i++)
        {
            sContestantStatus[i].unk19 = sp00[i];
        }
        sContestantStatus[shared192D0.contestant].unk11_0 = 1;
        SetContestantEffectStringID(shared192D0.contestant, 37);
    }
}

static void ContestEffect_41(void)
// The next appeal can be made later next turn.
{
    s8 i;
    s8 j;
    u8 sp00[4];

    if (sContest.turnNumber != 4)
    {
        for (i = 0; i < 4; i++)
            sp00[i] = sContestantStatus[i].unk19;

        sp00[shared192D0.contestant] = 0xFF;

        for (i = 3; i > -1; i--)
        {
            for (j = 0; j < 4; j++)
            {
                if (j != shared192D0.contestant &&
                    i == sp00[j] &&
                    sp00[j] == sContestantStatus[j].unk19)
                {
                    sp00[j]--;
                    break;
                }
            }
            if (j == 4)
                break;
        }

        sp00[shared192D0.contestant] = 3;
        sContestantStatus[shared192D0.contestant].unk10_6 = 1;

        for (i = 0; i < 4; i++)
        {
            sContestantStatus[i].unk19 = sp00[i];
        }
        sContestantStatus[shared192D0.contestant].unk11_0 = 2;
        SetContestantEffectStringID(shared192D0.contestant, 38);
    }
}

static void ContestEffect_42(void)
// Makes the next turn’s order more easily scrambled.
{
    // dummied out?
}

static void ContestEffect_43(void)
// Scrambles the order of appeals on the next turn.
{
    s8 i;
    s8 j;
    u8 sp00[4];
    u8 sp04[4];

    if (sContest.turnNumber != 4)
    {
        for (i = 0; i < 4; i++)
        {
            sp00[i] = sContestantStatus[i].unk19;
            sp04[i] = i;
        }

        for (i = 0; i < 4; i++)
        {
            u8 r4 = Random() % (4 - i);

            for (j = 0; j < 4; j++)
            {
                if (sp04[j] != 0xFF)
                {
                    if (r4 == 0)
                    {
                        sp00[j] = i;
                        sp04[j] = 0xFF;
                        break;
                    }
                    else
                        r4--;
                }
            }
        }

        for (i = 0; i < 4; i++)
        {
            sContestantStatus[i].unk19 = sp00[i];
            sContestantStatus[i].unk10_6 = 2;
        }
        sContestantStatus[shared192D0.contestant].unk11_0 = 3;
        SetContestantEffectStringID(shared192D0.contestant, 39);
    }
}

static void ContestEffect_44(void)
// An appeal that excites the audience in any CONTEST.
{
    if (gContestMoves[sContestantStatus[shared192D0.contestant].currMove].contestCategory != gSpecialVar_ContestCategory)
    {
        sContestantStatus[shared192D0.contestant].unk11_4 = TRUE;
    }
}

static void ContestEffect_45(void)
// Badly startles all POKéMON that made good appeals.
{
    int i;
    u8 r7 = 0;

    for (i = 0; i < 4; i++)
    {
        if (shared192D0.turnOrder[shared192D0.contestant] > shared192D0.turnOrder[i])
        {
            if (sContestantStatus[i].appeal2 > 0)
            {
                shared192D0.jam = sContestantStatus[i].appeal2 / 2;
                shared192D0.jam = RoundUp(shared192D0.jam);
            }
            else
                shared192D0.jam = 10;
            shared192D0.unk8[0] = i;
            shared192D0.unk8[1] = 0xFF;
            if (WasAtLeastOneOpponentJammed())
                r7++;
        }
    }
    if (r7 == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
    SetContestantEffectStringID(shared192D0.contestant, 48);
}

static void ContestEffect_46(void)
// The appeal works best the more the crowd is excited.
{
    s16 appeal;

    if (sContest.applauseLevel == 0)
    {
        appeal = 10;
        SetContestantEffectStringID(shared192D0.contestant, 26);
    }
    else if (sContest.applauseLevel == 1)
    {
        appeal = 20;
        SetContestantEffectStringID(shared192D0.contestant, 27);
    }
    else if (sContest.applauseLevel == 2)
    {
        appeal = 30;
        SetContestantEffectStringID(shared192D0.contestant, 28);
    }
    else if (sContest.applauseLevel == 3)
    {
        appeal = 50;
        SetContestantEffectStringID(shared192D0.contestant, 29);
    }
    else
    {
        appeal = 60;
        SetContestantEffectStringID(shared192D0.contestant, 30);
    }
    sContestantStatus[shared192D0.contestant].appeal2 = appeal;
}

static void ContestEffect_47(void)
// Temporarily stops the crowd from growing excited.
{
    if (!shared19328.excitementFrozen)
    {
        shared19328.excitementFrozen = TRUE;
        shared19328.excitementFreezer = shared192D0.contestant;
        SetContestantEffectStringID(shared192D0.contestant, 61);
    }
}

static void JamByMoveCategory(u8 category)
{
    int i;
    int r7 = 0;

    for (i = 0; i < 4; i++)
    {
        if (shared192D0.turnOrder[shared192D0.contestant] > shared192D0.turnOrder[i])
        {
            if (category == gContestMoves[sContestantStatus[i].currMove].contestCategory)
                shared192D0.jam = 40;
            else
                shared192D0.jam = 10;
            shared192D0.unk8[0] = i;
            shared192D0.unk8[1] = 0xFF;
            if (WasAtLeastOneOpponentJammed())
                r7++;
        }
    }

    if (r7 == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
}

#ifdef NONMATCHING
static bool8 sub_80B90C0(u8 i)
{
    shared192D0.unkD[i] = 1;
    if (sContestantStatus[i].immune)
    {
        SetContestantEffectStringID(i, 45);
    }
    else if (sContestantStatus[i].jamSafetyCount != 0)
    {
        sContestantStatus[i].jamSafetyCount--;
        SetContestantEffectStringID(i, 44);
    }
    else if (!sContestantStatus[i].noMoreTurns && sContestantStatus[i].numTurnsSkipped == 0)
        return TRUE;
    return FALSE;
}
#else
static __attribute__((naked)) bool8 sub_80B90C0(u8 i)
{
    asm_unified("\tpush {lr}\n"
                "\tlsls r0, 24\n"
                "\tlsrs r3, r0, 24\n"
                "\tldr r2, _080B90EC @ =gSharedMem + 0x192D0\n"
                "\tadds r0, r2, 0\n"
                "\tadds r0, 0xD\n"
                "\tadds r0, r3, r0\n"
                "\tmovs r1, 0x1\n"
                "\tstrb r1, [r0]\n"
                "\tlsls r0, r3, 3\n"
                "\tsubs r0, r3\n"
                "\tlsls r0, 2\n"
                "\tsubs r2, 0x70\n"
                "\tadds r2, r0, r2\n"
                "\tldrb r1, [r2, 0x10]\n"
                "\tmovs r0, 0x2\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080B90F0\n"
                "\tadds r0, r3, 0\n"
                "\tmovs r1, 0x2D\n"
                "\tb _080B9116\n"
                "\t.align 2, 0\n"
                "_080B90EC: .4byte gSharedMem + 0x192D0\n"
                "_080B90F0:\n"
                "\tldrb r0, [r2, 0x12]\n"
                "\tcmp r0, 0\n"
                "\tbne _080B910E\n"
                "\tldrb r1, [r2, 0xB]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _080B911A\n"
                "\tldrb r1, [r2, 0xC]\n"
                "\tmovs r0, 0x6\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _080B911A\n"
                "\tmovs r0, 0x1\n"
                "\tb _080B911C\n"
                "_080B910E:\n"
                "\tsubs r0, 0x1\n"
                "\tstrb r0, [r2, 0x12]\n"
                "\tadds r0, r3, 0\n"
                "\tmovs r1, 0x2C\n"
                "_080B9116:\n"
                "\tbl SetContestantEffectStringID\n"
                "_080B911A:\n"
                "\tmovs r0, 0\n"
                "_080B911C:\n"
                "\tpop {r1}\n"
                "\tbx r1");
}
#endif

static bool8 WasAtLeastOneOpponentJammed(void)
{
    s16 sp00[4] = {0};
    int i;

    for (i = 0; shared192D0.unk8[i] != 0xFF; i++)
    {
        u8 r4 = shared192D0.unk8[i];
        if (sub_80B90C0(r4))
        {
            shared192D0.jam2 = shared192D0.jam;
            if (sContestantStatus[r4].moreEasilyStartled)
                shared192D0.jam2 *= 2;
            if (sContestantStatus[r4].resistant)
            {
                shared192D0.jam2 = 10;
                SetContestantEffectStringID(r4, 47);
            }
            else if ((shared192D0.jam2 -= sContestantStatus[r4].jamReduction) <= 0)
            {
                shared192D0.jam2 = 0;
                SetContestantEffectStringID(r4, 46);
            }
            else
            {
                sub_80B9200(r4, shared192D0.jam2);
                sub_80B141C(r4, shared192D0.jam2);
                sp00[r4] = shared192D0.jam2;
            }
        }
    }

    for (i = 0; i < 4; i++)
    {
        if (sp00[i] != 0)
            return TRUE;
    }
    return FALSE;
}

static void sub_80B9200(u8 i, u8 jam)
{
    sContestantStatus[i].appeal2 -= jam;
    sContestantStatus[i].unkE += jam;
}

static s16 RoundTowardsZero(s16 score)
{
    s16 r1 = abs(score) % 10;
    if (score < 0)
    {
        if (r1 != 0)
            score -= 10 - r1;
    }
    else
        score -= r1;
    return score;
}

static s16 RoundUp(s16 score)
{
    s16 r1 = abs(score) % 10;
    if (r1 != 0)
        score += 10 - r1;
    return score;
}
