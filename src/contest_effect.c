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
static bool8 CanUnnerveContestant(u8);
static u8 WasAtLeastOneOpponentJammed(void);
static void JamContestant(u8, u8);
static s16 RoundTowardsZero(s16);
static s16 RoundUp(s16);

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
        shared192D0.jamQueue[0] = i;
        shared192D0.jamQueue[1] = 0xFF;
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
                shared192D0.jamQueue[j++] = i;
        shared192D0.jamQueue[j] = 0xFF;
        idx = WasAtLeastOneOpponentJammed();
    }
    if (idx == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
    SetContestantEffectStringID(shared192D0.contestant, 48);
}

static void ContestEffect_14(void)
// Startles the POKéMON that appealed before the user.
{
    u8 rval = Random() % 10;
    int jam;

    if (rval < 2)
        jam = 20;
    else if (rval < 8)
        jam = 40;
    else
        jam = 60;
    shared192D0.jam = jam;
    ContestEffect_08();
}

static void ContestEffect_15(void)
// Startles all POKéMON that appealed before the user.
{
    u8 numStartled = 0;
    u8 contestant = shared192D0.contestant;

    if (shared192D0.turnOrder[contestant] != 0)
    {
        int i;

        for (i = 0; i < 4; i++)
        {
            if (shared192D0.turnOrder[contestant] > shared192D0.turnOrder[i])
            {
                shared192D0.jamQueue[0] = i;
                shared192D0.jamQueue[1] = 0xFF;
                {
                u8 rval = Random() % 10;
                int jam;

                if (rval == 0)
                    jam = 0;
                else if (rval <= 2)
                    jam = 10;
                else if (rval <= 4)
                    jam = 20;
                else if (rval <= 6)
                    jam = 30;
                else if (rval <= 8)
                    jam = 40;
                else
                    jam = 60;
                shared192D0.jam = jam;
                }
                if (WasAtLeastOneOpponentJammed())
                    numStartled++;
            }
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 48);
    if (numStartled == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
}

static void ContestEffect_16(void)
// Shifts the JUDGE’s attention from others.
{
    bool32 hitAny = FALSE;
    u8 contestant = shared192D0.contestant;

    if (shared192D0.turnOrder[shared192D0.contestant] != 0)
    {
        int i;

        for (i = 0; i < 4; i++)
        {
            if (shared192D0.turnOrder[contestant] > shared192D0.turnOrder[i] &&
                sContestantStatus[i].hasJudgesAttention &&
                CanUnnerveContestant(i))
            {
                sContestantStatus[i].hasJudgesAttention = FALSE;
                sContestantStatus[i].judgesAttentionWasRemoved = TRUE;
                SetContestantEffectStringID(i, 8);
                hitAny = TRUE;
            }
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 7);
    if (!hitAny)
    {
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
    }
}

static void ContestEffect_17(void)
// Startles the POKéMON that has the JUDGE’s attention.
{
    u8 numStartled = 0;
    u8 contestant = shared192D0.contestant;

    if (shared192D0.turnOrder[shared192D0.contestant] != 0)
    {
        int i;

        for (i = 0; i < 4; i++)
        {
            if (shared192D0.turnOrder[contestant] > shared192D0.turnOrder[i])
            {
                if (sContestantStatus[i].hasJudgesAttention)
                    shared192D0.jam = 50;
                else
                    shared192D0.jam = 10;
                shared192D0.jamQueue[0] = i;
                shared192D0.jamQueue[1] = 0xFF;
                if (WasAtLeastOneOpponentJammed())
                    numStartled++;
            }
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 48);
    if (numStartled == 0)
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
    bool32 hitAny = FALSE;

    if (shared192D0.turnOrder[shared192D0.contestant] != 3)
    {
        int i;

        for (i = 0; i < 4; i++)
        {
            if (shared192D0.turnOrder[shared192D0.contestant] + 1 == shared192D0.turnOrder[i])
            {
                if (CanUnnerveContestant(i))
                {
                    MakeContestantNervous(i);
                    SetContestantEffectStringID(i, 10);
                    hitAny = TRUE;
                }
                else
                {
                    SetContestantEffectStringID(i, 60);
                    hitAny = TRUE;
                }
            }
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 9);
    if (!hitAny)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
}

static void ContestEffect_26(void)
// Makes all POKéMON after the user nervous.
{
    u8 numUnnerved = 0;
    bool32 contestantUnnerved = FALSE;
    u8 contestantIds[5];
    int i;
    int numAfter;
    s16 oddsMod[4];
    s16 odds[4];

    memset(contestantIds, 0xFF, ARRAY_COUNT(contestantIds));
    for (i = 0, numAfter = 0; i < 4; i++)
    {
        if (shared192D0.turnOrder[shared192D0.contestant] < shared192D0.turnOrder[i] &&
            !sContestantStatus[i].nervous && !Contest_IsMonsTurnDisabled(i))
            contestantIds[numAfter++] = i;
    }

    if (numAfter == 1)
    {
        odds[0] = 60;
    }
    else if (numAfter == 2)
    {
        odds[0] = 30;
        odds[1] = 30;
    }
    else if (numAfter == 3)
    {
        odds[0] = 20;
        odds[1] = 20;
        odds[2] = 20;
    }
    else
    {
        for (i = 0; i < 4; i++)
            odds[i] = 0;
    }
    for (i = 0; i < 4; i++)
    {
        if (sContestantStatus[i].hasJudgesAttention && sub_80B214C(i))
            oddsMod[i] = gComboStarterLookupTable[gContestMoves[sContestantStatus[i].prevMove].comboStarterId] * 10;
        else
            oddsMod[i] = 0;
        oddsMod[i] -= (sContestantStatus[i].condition / 10) * 10;
    }
    if (odds[0] != 0)
    {
        for (i = 0; contestantIds[i] != 0xFF; i++)
        {
            if (Random() % 100 < odds[i] + oddsMod[contestantIds[i]])
            {
                if (CanUnnerveContestant(contestantIds[i]))
                {
                    MakeContestantNervous(contestantIds[i]);
                    SetContestantEffectStringID(contestantIds[i], 10);
                    numUnnerved++;
                } else
                    contestantUnnerved = TRUE;
            } else
                contestantUnnerved = TRUE;
            if (contestantUnnerved)
            {
                contestantUnnerved = FALSE;
                SetContestantEffectStringID(contestantIds[i], 60);
                numUnnerved++;
            }
            shared192D0.unnervedPokes[contestantIds[i]] = 1;
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 11);
    if (numUnnerved == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
}

static void ContestEffect_27(void)
// Worsens the condition of those that made appeals.
{
    u8 numHit = 0;
    int i;

    for (i = 0; i < 4; i++)
    {
        if (shared192D0.turnOrder[shared192D0.contestant] > shared192D0.turnOrder[i] &&
            sContestantStatus[i].condition > 0 &&
            CanUnnerveContestant(i))
        {
            sContestantStatus[i].condition = 0;
            sContestantStatus[i].conditionMod = 2;
            SetContestantEffectStringID(i, 13);
            numHit++;
        }
    }

    SetContestantEffectStringID(shared192D0.contestant, 12);
    if (numHit == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x39);
}

static void ContestEffect_28(void)
// Badly startles POKéMON in good condition.
{
    u8 numHit = 0;
    int i;

    for (i = 0; i < 4; i++)
    {
        if (shared192D0.turnOrder[shared192D0.contestant] > shared192D0.turnOrder[i])
        {
            if (sContestantStatus[i].condition > 0)
                shared192D0.jam = 40;
            else
                shared192D0.jam = 10;
            shared192D0.jamQueue[0] = i;
            shared192D0.jamQueue[1] = 0xFF;
            if (WasAtLeastOneOpponentJammed())
                numHit++;
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, 14);
    if (numHit == 0)
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
    int i;
    int appealSum;

    for (i = 0, appealSum = 0; i < 4; i++)
    {
        if (shared192D0.turnOrder[shared192D0.contestant] > shared192D0.turnOrder[i])
            appealSum += sContestantStatus[i].appeal2;
    }
    if (appealSum < 0)
        appealSum = 0;
    if (shared192D0.turnOrder[shared192D0.contestant] == 0 || appealSum == 0)
        SetContestantEffectStringID(shared192D0.contestant, 18);
    else
    {
        sContestantStatus[shared192D0.contestant].appeal2 += appealSum / 2;
        SetContestantEffectStringID(shared192D0.contestant, 17);
    }
    sContestantStatus[shared192D0.contestant].appeal2 = RoundTowardsZero(sContestantStatus[shared192D0.contestant].appeal2);
}

static void ContestEffect_32(void)
// Makes the appeal as good as the one before it.
{
    s16 appeal = 0;

    if (shared192D0.turnOrder[shared192D0.contestant] != 0)
    {
        int i;
        for (i = 0; i < 4; i++)
        {
            if (shared192D0.turnOrder[shared192D0.contestant] - 1 == shared192D0.turnOrder[i])
                appeal = sContestantStatus[i].appeal2;
        }
    }
    if (shared192D0.turnOrder[shared192D0.contestant] == 0 || appeal <= 0)
        SetContestantEffectStringID(shared192D0.contestant, 20);
    else
    {
        sContestantStatus[shared192D0.contestant].appeal2 += appeal;
        SetContestantEffectStringID(shared192D0.contestant, 19);
    }
}

static void ContestEffect_33(void)
// The appeal works better the later it is performed.
{
    u8 whichTurn = shared192D0.turnOrder[shared192D0.contestant];
    if (whichTurn == 0)
        sContestantStatus[shared192D0.contestant].appeal2 = 10;
    else
        sContestantStatus[shared192D0.contestant].appeal2 = 20 * whichTurn;
    if (whichTurn == 0)
        SetContestantEffectStringID(shared192D0.contestant, 21);
    else if (whichTurn == 1)
        SetContestantEffectStringID(shared192D0.contestant, 22);
    else if (whichTurn == 2)
        SetContestantEffectStringID(shared192D0.contestant, 23);
    else
        SetContestantEffectStringID(shared192D0.contestant, 24);
}

static void ContestEffect_34(void)
// The appeal’s quality varies depending on its timing.
{
    u8 rval = Random() % 10;
    s16 appeal;

    if (rval < 3)
    {
        appeal = 10;
        SetContestantEffectStringID(shared192D0.contestant, 26);
    } else if (rval < 6)
    {
        appeal = 20;
        SetContestantEffectStringID(shared192D0.contestant, 27);
    } else if (rval < 8)
    {
        appeal = 40;
        SetContestantEffectStringID(shared192D0.contestant, 28);
    } else if (rval < 9)
    {
        appeal = 60;
        SetContestantEffectStringID(shared192D0.contestant, 29);
    }
    else
    {
        appeal = 80;
        SetContestantEffectStringID(shared192D0.contestant, 30);
    }
    sContestantStatus[shared192D0.contestant].appeal2 = appeal;
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
        sContestantStatus[shared192D0.contestant].conditionMod = 1;
        SetContestantEffectStringID(shared192D0.contestant, 35);
    }
    else
        SetContestantEffectStringID(shared192D0.contestant, 58);
}

static void ContestEffect_39(void)
// The appeal works well if the user’s condition is good.
{
    sContestantStatus[shared192D0.contestant].appealTripleCondition = TRUE;
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
    u8 turnOrder[4];

    if (sContest.turnNumber != 4)
    {
        for (i = 0; i < 4; i++)
            turnOrder[i] = sContestantStatus[i].nextTurnOrder;

        turnOrder[shared192D0.contestant] = 0xFF;

        for (i = 0; i < 4; i++)
        {
            for (j = 0; j < 4; j++)
            {
                if (j != shared192D0.contestant &&
                    i == turnOrder[j] &&
                    turnOrder[j] == sContestantStatus[j].nextTurnOrder)
                {
                    turnOrder[j]++;
                    break;
                }
            }
            if (j == 4)
                break;
        }

        turnOrder[shared192D0.contestant] = 0;
        sContestantStatus[shared192D0.contestant].turnOrderMod = 1;

        for (i = 0; i < 4; i++)
        {
            sContestantStatus[i].nextTurnOrder = turnOrder[i];
        }
        sContestantStatus[shared192D0.contestant].turnOrderModAction = 1;
        SetContestantEffectStringID(shared192D0.contestant, 37);
    }
}

static void ContestEffect_41(void)
// The next appeal can be made later next turn.
{
    s8 i;
    s8 j;
    u8 turnOrder[4];

    if (sContest.turnNumber != 4)
    {
        for (i = 0; i < 4; i++)
            turnOrder[i] = sContestantStatus[i].nextTurnOrder;

        turnOrder[shared192D0.contestant] = 0xFF;

        for (i = 3; i > -1; i--)
        {
            for (j = 0; j < 4; j++)
            {
                if (j != shared192D0.contestant &&
                    i == turnOrder[j] &&
                    turnOrder[j] == sContestantStatus[j].nextTurnOrder)
                {
                    turnOrder[j]--;
                    break;
                }
            }
            if (j == 4)
                break;
        }

        turnOrder[shared192D0.contestant] = 3;
        sContestantStatus[shared192D0.contestant].turnOrderMod = 1;

        for (i = 0; i < 4; i++)
        {
            sContestantStatus[i].nextTurnOrder = turnOrder[i];
        }
        sContestantStatus[shared192D0.contestant].turnOrderModAction = 2;
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
    u8 turnOrder[4];
    u8 unselectedContestants[4];

    if (sContest.turnNumber != 4)
    {
        for (i = 0; i < 4; i++)
        {
            turnOrder[i] = sContestantStatus[i].nextTurnOrder;
            unselectedContestants[i] = i;
        }

        for (i = 0; i < 4; i++)
        {
            u8 r4 = Random() % (4 - i);

            for (j = 0; j < 4; j++)
            {
                if (unselectedContestants[j] != 0xFF)
                {
                    if (r4 == 0)
                    {
                        turnOrder[j] = i;
                        unselectedContestants[j] = 0xFF;
                        break;
                    }
                    else
                        r4--;
                }
            }
        }

        for (i = 0; i < 4; i++)
        {
            sContestantStatus[i].nextTurnOrder = turnOrder[i];
            sContestantStatus[i].turnOrderMod = 2;
        }
        sContestantStatus[shared192D0.contestant].turnOrderModAction = 3;
        SetContestantEffectStringID(shared192D0.contestant, 39);
    }
}

static void ContestEffect_44(void)
// An appeal that excites the audience in any CONTEST.
{
    if (gContestMoves[sContestantStatus[shared192D0.contestant].currMove].contestCategory != gSpecialVar_ContestCategory)
    {
        sContestantStatus[shared192D0.contestant].overrideCategoryExcitementMod = TRUE;
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
            shared192D0.jamQueue[0] = i;
            shared192D0.jamQueue[1] = 0xFF;
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
    int numJammed = 0;

    for (i = 0; i < 4; i++)
    {
        if (shared192D0.turnOrder[shared192D0.contestant] > shared192D0.turnOrder[i])
        {
            if (category == gContestMoves[sContestantStatus[i].currMove].contestCategory)
                shared192D0.jam = 40;
            else
                shared192D0.jam = 10;
            shared192D0.jamQueue[0] = i;
            shared192D0.jamQueue[1] = 0xFF;
            if (WasAtLeastOneOpponentJammed())
                numJammed++;
        }
    }

    if (numJammed == 0)
        SetContestantEffectStringID2(shared192D0.contestant, 0x36);
}

#ifdef NONMATCHING
static bool8 CanUnnerveContestant(u8 i)
{
    // For whatever reason, i is copied to r4.  I cannot optimize this out.
    shared192D0.unnervedPokes[i] = 1;
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
static __attribute__((naked)) bool8 CanUnnerveContestant(u8 i)
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
    s16 jamBuffer[4] = {0};
    int i;

    for (i = 0; shared192D0.jamQueue[i] != 0xFF; i++)
    {
        u8 r4 = shared192D0.jamQueue[i];
        if (CanUnnerveContestant(r4))
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
                JamContestant(r4, shared192D0.jam2);
                sub_80B141C(r4, shared192D0.jam2);
                jamBuffer[r4] = shared192D0.jam2;
            }
        }
    }

    for (i = 0; i < 4; i++)
    {
        if (jamBuffer[i] != 0)
            return TRUE;
    }
    return FALSE;
}

static void JamContestant(u8 i, u8 jam)
{
    sContestantStatus[i].appeal2 -= jam;
    sContestantStatus[i].jam += jam;
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
