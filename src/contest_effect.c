#include "global.h"
#include "ewram.h"
#include "random.h"
#include "contest.h"

static void ContestEffect_HighlyAppealing(void);
static void ContestEffect_UserMoreEasilyStartled(void);
static void ContestEffect_GreatAppealButNoMoreMoves(void);
static void ContestEffect_RepetitionNotBoring(void);
static void ContestEffect_AvoidStartleOnce(void);
static void ContestEffect_AvoidStartle(void);
static void ContestEffect_AvoidStartleSlightly(void);
static void ContestEffect_UserLessEasilyStartled(void);
static void ContestEffect_StartleFrontMon(void);
static void ContestEffect_StartlePrevMons(void);
static void ContestEffect_StartlePrevMon2(void);
static void ContestEffect_StartlePrevMons2(void);
static void ContestEffect_ShiftJudgeAttention(void);
static void ContestEffect_StartleMonWithJudgesAttention(void);
static void ContestEffect_JamsOthersButMissOneTurn(void);
static void ContestEffect_StartleMonsSameTypeAppeal(void);
static void ContestEffect_StartleMonsCoolAppeal(void);
static void ContestEffect_StartleMonsBeautyAppeal(void);
static void ContestEffect_StartleMonsCuteAppeal(void);
static void ContestEffect_StartleMonsSmartAppeal(void);
static void ContestEffect_StartleMonsToughAppeal(void);
static void ContestEffect_MakeFollowingMonNervous(void);
static void ContestEffect_MakeFollowingMonsNervous(void);
static void ContestEffect_WorsenConditionOfPrevMons(void);
static void ContestEffect_BadlyStartlesMonsInGoodCondition(void);
static void ContestEffect_BetterIfFirst(void);
static void ContestEffect_BetterIfLast(void);
static void ContestEffect_AppealAsGoodAsPrevOnes(void);
static void ContestEffect_AppealAsGoodAsPrevOne(void);
static void ContestEffect_BetterWhenLater(void);
static void ContestEffect_QualityDependsOnTiming(void);
static void ContestEffect_BetterIfSameType(void);
static void ContestEffect_BetterIfDiffType(void);
static void ContestEffect_AffectedByPrevAppeal(void);
static void ContestEffect_ImproveConditionPreventNervousness(void);
static void ContestEffect_BetterWithGoodCondition(void);
static void ContestEffect_NextAppealEarlier(void);
static void ContestEffect_NextAppealLater(void);
static void ContestEffect_MakeScramblingTurnOrderEasier(void);
static void ContestEffect_ScrambleNextTurnOrder(void);
static void ContestEffect_ExciteAudienceInAnyContest(void);
static void ContestEffect_BadlyStartleMonsWithGoodAppeals(void);
static void ContestEffect_BetterWhenAudienceExcited(void);
static void ContestEffect_DontExciteAudience(void);
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

// A highly appealing move.
static void ContestEffect_HighlyAppealing(void)
{
}

// After this move, the user is more easily startled.
static void ContestEffect_UserMoreEasilyStartled(void)
{
    sContestantStatus[shared192D0.contestant].moreEasilyStartled = TRUE;
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_MORE_CONSCIOUS);
}

// Makes a great appeal, but allows no more to the end.
static void ContestEffect_GreatAppealButNoMoreMoves(void)
{
    sContestantStatus[shared192D0.contestant].exploded = TRUE;
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_NO_APPEAL);
}

// Can be used repeatedly without boring the JUDGE.
static void ContestEffect_RepetitionNotBoring(void)
{
    sContestantStatus[shared192D0.contestant].usedRepeatableMove = TRUE;
    sContestantStatus[shared192D0.contestant].disappointedRepeat = FALSE;
    sContestantStatus[shared192D0.contestant].moveRepeatCount = 0;
}

// Can avoid being startled by others once.
static void ContestEffect_AvoidStartleOnce(void)
{
    sContestantStatus[shared192D0.contestant].jamSafetyCount = 1;
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_SETTLE_DOWN);
}

// Can avoid being startled by others.
static void ContestEffect_AvoidStartle(void)
{
    sContestantStatus[shared192D0.contestant].immune = TRUE;
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_OBLIVIOUS_TO_OTHERS);
}

// Can avoid being startled by others a little.
static void ContestEffect_AvoidStartleSlightly(void)
{
    sContestantStatus[shared192D0.contestant].jamReduction = 20;
    SetContestantEffectStringID(shared192D0.contestant,CONTEST_STRING_LESS_AWARE);
}

// After this move, the user is less likely to be startled.
static void ContestEffect_UserLessEasilyStartled(void)
{
    sContestantStatus[shared192D0.contestant].resistant = TRUE;
    SetContestantEffectStringID(shared192D0.contestant,CONTEST_STRING_STOPPED_CARING);
}

// Slightly startles the POKéMON in front.
static void ContestEffect_StartleFrontMon(void)
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
        SetContestantEffectStringID2(shared192D0.contestant, CONTEST_STRING_MESSED_UP2);
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
}

// Slightly startles those that have made appeals.
static void ContestEffect_StartlePrevMons(void)
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
        SetContestantEffectStringID2(shared192D0.contestant, CONTEST_STRING_MESSED_UP2);
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
}

// Startles the POKéMON that appealed before the user.
static void ContestEffect_StartlePrevMon2(void)
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
    ContestEffect_StartleFrontMon();
}

// Startles all POKéMON that appealed before the user.
static void ContestEffect_StartlePrevMons2(void)
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
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
    if (numStartled == 0)
        SetContestantEffectStringID2(shared192D0.contestant, CONTEST_STRING_MESSED_UP2);
}

// Shifts the JUDGE’s attention from others.
static void ContestEffect_ShiftJudgeAttention(void)
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
                SetContestantEffectStringID(i, CONTEST_STRING_JUDGE_LOOK_AWAY2);
                hitAny = TRUE;
            }
        }
    }
    SetContestantEffectStringID(shared192D0.contestant,CONTEST_STRING_DAZZLE_ATTEMPT);
    if (!hitAny)
    {
        SetContestantEffectStringID2(shared192D0.contestant, CONTEST_STRING_MESSED_UP2);
    }
}

// Startles the POKéMON that has the JUDGE’s attention.
static void ContestEffect_StartleMonWithJudgesAttention(void)
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
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
    if (numStartled == 0)
        SetContestantEffectStringID2(shared192D0.contestant, CONTEST_STRING_MESSED_UP2);
}

// Jams the others, and misses one turn of appeals.
static void ContestEffect_JamsOthersButMissOneTurn(void)
{
    sContestantStatus[shared192D0.contestant].turnSkipped = TRUE;
    ContestEffect_StartlePrevMons();
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
}

// Startles POKéMON that made a same-type appeal.
static void ContestEffect_StartleMonsSameTypeAppeal(void)
{
    u16 move = sContestantStatus[shared192D0.contestant].currMove;
    JamByMoveCategory(gContestMoves[move].contestCategory);
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
}

// Badly startles POKéMON that made COOL appeals.
static void ContestEffect_StartleMonsCoolAppeal(void)
{
    JamByMoveCategory(CONTEST_CATEGORY_COOL);
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
}

// Badly startles POKéMON that made BEAUTY appeals.
static void ContestEffect_StartleMonsBeautyAppeal(void)
{
    JamByMoveCategory(CONTEST_CATEGORY_BEAUTY);
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
}

// Badly startles POKéMON that made CUTE appeals.
static void ContestEffect_StartleMonsCuteAppeal(void)
{
    JamByMoveCategory(CONTEST_CATEGORY_CUTE);
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
}

// Badly startles POKéMON that made SMART appeals.
static void ContestEffect_StartleMonsSmartAppeal(void)
{
    JamByMoveCategory(CONTEST_CATEGORY_SMART);
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
}

// Badly startles POKéMON that made TOUGH appeals.
static void ContestEffect_StartleMonsToughAppeal(void)
{
    JamByMoveCategory(CONTEST_CATEGORY_TOUGH);
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
}

// Makes one POKéMON after the user nervous.
static void ContestEffect_MakeFollowingMonNervous(void)
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
                    SetContestantEffectStringID(i, CONTEST_STRING_NERVOUS);
                    hitAny = TRUE;
                }
                else
                {
                    SetContestantEffectStringID(i, CONTEST_STRING_UNAFFECTED);
                    hitAny = TRUE;
                }
            }
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_UNNERVE_ATTEMPT);
    if (!hitAny)
        SetContestantEffectStringID2(shared192D0.contestant, CONTEST_STRING_MESSED_UP2);
}

// Makes all POKéMON after the user nervous.
static void ContestEffect_MakeFollowingMonsNervous(void)
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
                    SetContestantEffectStringID(contestantIds[i], CONTEST_STRING_NERVOUS);
                    numUnnerved++;
                } else
                    contestantUnnerved = TRUE;
            } else
                contestantUnnerved = TRUE;
            if (contestantUnnerved)
            {
                contestantUnnerved = FALSE;
                SetContestantEffectStringID(contestantIds[i], CONTEST_STRING_UNAFFECTED);
                numUnnerved++;
            }
            shared192D0.unnervedPokes[contestantIds[i]] = 1;
        }
    }
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_UNNERVE_WAITING);
    if (numUnnerved == 0)
        SetContestantEffectStringID2(shared192D0.contestant, CONTEST_STRING_MESSED_UP2);
}

// Worsens the condition of those that made appeals.
static void ContestEffect_WorsenConditionOfPrevMons(void)
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
            SetContestantEffectStringID(i, CONTEST_STRING_REGAINED_FORM);
            numHit++;
        }
    }

    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_TAUNT_WELL);
    if (numHit == 0)
        SetContestantEffectStringID2(shared192D0.contestant, CONTEST_STRING_IGNORED);
}

// Badly startles POKéMON in good condition.
static void ContestEffect_BadlyStartlesMonsInGoodCondition(void)
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
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_JAM_WELL);
    if (numHit == 0)
        SetContestantEffectStringID2(shared192D0.contestant, CONTEST_STRING_IGNORED);
}

// The appeal works great if performed first.
static void ContestEffect_BetterIfFirst(void)
{
    if (gUnknown_02038696[shared192D0.contestant] == 0)
    {
        u16 move = sContestantStatus[shared192D0.contestant].currMove;
        sContestantStatus[shared192D0.contestant].appeal2 += 2 * gContestEffects[gContestMoves[move].effect].appeal;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_HUSTLE_STANDOUT);
    }
}

// The appeal works great if performed last.
static void ContestEffect_BetterIfLast(void)
{
    if (gUnknown_02038696[shared192D0.contestant] == 3)
    {
        u16 move = sContestantStatus[shared192D0.contestant].currMove;
        sContestantStatus[shared192D0.contestant].appeal2 += 2 * gContestEffects[gContestMoves[move].effect].appeal;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_WORK_HARD_UNNOTICED);
    }
}

// Makes the appeal as good as those before it.
static void ContestEffect_AppealAsGoodAsPrevOnes(void)
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
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_NOT_WELL);
    else
    {
        sContestantStatus[shared192D0.contestant].appeal2 += appealSum / 2;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_WORK_BEFORE);
    }
    sContestantStatus[shared192D0.contestant].appeal2 = RoundTowardsZero(sContestantStatus[shared192D0.contestant].appeal2);
}

// Makes the appeal as good as the one before it.
static void ContestEffect_AppealAsGoodAsPrevOne(void)
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
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_NOT_WELL2);
    else
    {
        sContestantStatus[shared192D0.contestant].appeal2 += appeal;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_WORK_PRECEDING);
    }
}

// The appeal works better the later it is performed.
static void ContestEffect_BetterWhenLater(void)
{
    u8 whichTurn = shared192D0.turnOrder[shared192D0.contestant];
    if (whichTurn == 0)
        sContestantStatus[shared192D0.contestant].appeal2 = 10;
    else
        sContestantStatus[shared192D0.contestant].appeal2 = 20 * whichTurn;
    if (whichTurn == 0)
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_NOT_SHOWN_WELL);
    else if (whichTurn == 1)
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_SLIGHTLY_WELL);
    else if (whichTurn == 2)
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_PRETTY_WELL);
    else
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_EXCELLENTLY);
}

// The appeal’s quality varies depending on its timing.
static void ContestEffect_QualityDependsOnTiming(void)
{
    u8 rval = Random() % 10;
    s16 appeal;

    if (rval < 3)
    {
        appeal = 10;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_NOT_VERY_WELL);
    } else if (rval < 6)
    {
        appeal = 20;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_SLIGHTLY_WELL2);
    } else if (rval < 8)
    {
        appeal = 40;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_PRETTY_WELL2);
    } else if (rval < 9)
    {
        appeal = 60;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_VERY_WELL);
    }
    else
    {
        appeal = 80;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_EXCELLENTLY2);
    }
    sContestantStatus[shared192D0.contestant].appeal2 = appeal;
}

#ifdef NONMATCHING
// Not even close, send help
// Works well if it’s the same type as the one before.
static void ContestEffect_BetterIfSameType(void)
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
                SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_SAME_TYPE_GOOD);
            }
            break;
        }
    }
}
#else
__attribute__((naked)) void ContestEffect_BetterIfSameType(void)
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

// Works well if different in type than the one before.
static void ContestEffect_BetterIfDiffType(void)
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
                SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_DIFF_TYPE_GOOD);
                break;
            }
        }
    }
}

// Affected by how well the appeal in front goes.
static void ContestEffect_AffectedByPrevAppeal(void)
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
                    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_STOOD_OUT_AS_MUCH);
                }
                else if (sContestantStatus[shared192D0.contestant].appeal2 < sContestantStatus[i].appeal2)
                {
                    sContestantStatus[shared192D0.contestant].appeal2 = 0;
                    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_NOT_AS_WELL);
                }
            }
        }
    }
}

// Ups the user’s condition. Helps prevent nervousness.
static void ContestEffect_ImproveConditionPreventNervousness(void)
{
    if (sContestantStatus[shared192D0.contestant].condition < 30)
    {
        sContestantStatus[shared192D0.contestant].condition += 10;
        sContestantStatus[shared192D0.contestant].conditionMod = 1;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_CONDITION_ROSE);
    }
    else
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_NO_CONDITION_IMPROVE);
}

// The appeal works well if the user’s condition is good.
static void ContestEffect_BetterWithGoodCondition(void)
{
    sContestantStatus[shared192D0.contestant].appealTripleCondition = TRUE;
    if (sContestantStatus[shared192D0.contestant].condition != 0)
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_HOT_STATUS);
    else
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_BAD_CONDITION_WEAK_APPEAL);
}

// The next appeal can be made earlier next turn.
static void ContestEffect_NextAppealEarlier(void)
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
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_MOVE_UP_LINE);
    }
}

// The next appeal can be made later next turn.
static void ContestEffect_NextAppealLater(void)
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
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_MOVE_BACK_LINE);
    }
}

// Makes the next turn’s order more easily scrambled.
static void ContestEffect_MakeScramblingTurnOrderEasier(void)
{
    // dummied out?
}

// Scrambles the order of appeals on the next turn.
static void ContestEffect_ScrambleNextTurnOrder(void)
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
            u8 rval = Random() % (4 - i);

            for (j = 0; j < 4; j++)
            {
                if (unselectedContestants[j] != 0xFF)
                {
                    if (rval == 0)
                    {
                        turnOrder[j] = i;
                        unselectedContestants[j] = 0xFF;
                        break;
                    }
                    else
                        rval--;
                }
            }
        }

        for (i = 0; i < 4; i++)
        {
            sContestantStatus[i].nextTurnOrder = turnOrder[i];
            sContestantStatus[i].turnOrderMod = 2;
        }
        sContestantStatus[shared192D0.contestant].turnOrderModAction = 3;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_SCRAMBLE_ORDER);
    }
}

// An appeal that excites the audience in any CONTEST.
static void ContestEffect_ExciteAudienceInAnyContest(void)
{
    if (gContestMoves[sContestantStatus[shared192D0.contestant].currMove].contestCategory != gSpecialVar_ContestCategory)
    {
        sContestantStatus[shared192D0.contestant].overrideCategoryExcitementMod = TRUE;
    }
}

// Badly startles all POKéMON that made good appeals.
static void ContestEffect_BadlyStartleMonsWithGoodAppeals(void)
{
    int i;
    u8 numJammed = 0;

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
                numJammed++;
        }
    }
    if (numJammed == 0)
        SetContestantEffectStringID2(shared192D0.contestant, CONTEST_STRING_MESSED_UP2);
    SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTEMPT_STARTLE);
}

// The appeal works best the more the crowd is excited.
static void ContestEffect_BetterWhenAudienceExcited(void)
{
    s16 appeal;

    if (sContest.applauseLevel == 0)
    {
        appeal = 10;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_NOT_VERY_WELL);
    }
    else if (sContest.applauseLevel == 1)
    {
        appeal = 20;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_SLIGHTLY_WELL2);
    }
    else if (sContest.applauseLevel == 2)
    {
        appeal = 30;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_PRETTY_WELL2);
    }
    else if (sContest.applauseLevel == 3)
    {
        appeal = 50;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_VERY_WELL);
    }
    else
    {
        appeal = 60;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_APPEAL_EXCELLENTLY2);
    }
    sContestantStatus[shared192D0.contestant].appeal2 = appeal;
}

// Temporarily stops the crowd from growing excited.
static void ContestEffect_DontExciteAudience(void)
{
    if (!shared19328.excitementFrozen)
    {
        shared19328.excitementFrozen = TRUE;
        shared19328.excitementFreezer = shared192D0.contestant;
        SetContestantEffectStringID(shared192D0.contestant, CONTEST_STRING_ATTRACTED_ATTENTION);
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
        SetContestantEffectStringID2(shared192D0.contestant, CONTEST_STRING_MESSED_UP2);
}

static bool8 CanUnnerveContestant(u8 i)
{
    shared192D0.unnervedPokes[i] = 1;
    if (sContestantStatus[i].immune)
    {
        SetContestantEffectStringID(i, CONTEST_STRING_AVOID_SEEING);
        return FALSE;
    }
    else if (sContestantStatus[i].jamSafetyCount != 0)
    {
        sContestantStatus[i].jamSafetyCount--;
        SetContestantEffectStringID(i, CONTEST_STRING_AVERT_GAZE);
        return FALSE;
    }
    else if (!sContestantStatus[i].noMoreTurns && sContestantStatus[i].numTurnsSkipped == 0)
    {
        return TRUE;
    }

    return FALSE;
}

static bool8 WasAtLeastOneOpponentJammed(void)
{
    s16 jamBuffer[4] = {0};
    int i;

    for (i = 0; shared192D0.jamQueue[i] != 0xFF; i++)
    {
        u8 contestant = shared192D0.jamQueue[i];
        if (CanUnnerveContestant(contestant))
        {
            shared192D0.jam2 = shared192D0.jam;
            if (sContestantStatus[contestant].moreEasilyStartled)
                shared192D0.jam2 *= 2;
            if (sContestantStatus[contestant].resistant)
            {
                shared192D0.jam2 = 10;
                SetContestantEffectStringID(contestant, CONTEST_STRING_LITTLE_DISTRACTED);
            }
            else if ((shared192D0.jam2 -= sContestantStatus[contestant].jamReduction) <= 0)
            {
                shared192D0.jam2 = 0;
                SetContestantEffectStringID(contestant, CONTEST_STRING_NOT_FAZED);
            }
            else
            {
                JamContestant(contestant, shared192D0.jam2);
                SetStartledString(contestant, shared192D0.jam2);
                jamBuffer[contestant] = shared192D0.jam2;
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
    s16 absScore = abs(score) % 10;
    if (score < 0)
    {
        if (absScore != 0)
            score -= 10 - absScore;
    }
    else
        score -= absScore;
    return score;
}

static s16 RoundUp(s16 score)
{
    s16 absScore = abs(score) % 10;
    if (absScore != 0)
        score += 10 - absScore;
    return score;
}
