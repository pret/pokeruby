#ifndef GUARD_CONTEST_H
#define GUARD_CONTEST_H

enum
{
    CONTEST_CATEGORY_COOL,
    CONTEST_CATEGORY_BEAUTY,
    CONTEST_CATEGORY_CUTE,
    CONTEST_CATEGORY_SMART,
    CONTEST_CATEGORY_TOUGH,
    CONTEST_CATEGORIES_COUNT,
};

enum
{
    CONTEST_WINNER_ARTIST,
    CONTEST_WINNER_NORMAL,
    CONTEST_WINNER_SUPER,
    CONTEST_WINNER_HYPER_1,
    CONTEST_WINNER_HYPER_2,
    CONTEST_WINNER_HYPER_3,
    CONTEST_WINNER_MASTER_1,
    CONTEST_WINNER_MASTER_2,
    CONTEST_WINNER_MASTER_3,
    NUM_CONTEST_HALL_WINNERS = CONTEST_WINNER_MASTER_3,
    MUSEUM_CONTEST_WINNERS_START = CONTEST_WINNER_MASTER_3,
    CONTEST_WINNER_MUSEUM_COOL,
    CONTEST_WINNER_MUSEUM_BEAUTY,
    CONTEST_WINNER_MUSEUM_CUTE,
    CONTEST_WINNER_MUSEUM_SMART,
    CONTEST_WINNER_MUSEUM_TOUGH,
};

enum
{
    CONTEST_RANK_NORMAL,
    CONTEST_RANK_SUPER,
    CONTEST_RANK_HYPER,
    CONTEST_RANK_MASTER,
    CONTEST_RANK_LINK
};

#define CONTEST_SAVE_FOR_MUSEUM ((u8)-1)
#define CONTEST_SAVE_FOR_ARTIST ((u8)-2)

enum
{
    CONTEST_EFFECT_HIGHLY_APPEALING,
    CONTEST_EFFECT_USER_MORE_EASILY_STARTLED,
    CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES,
    CONTEST_EFFECT_REPETITION_NOT_BORING,
    CONTEST_EFFECT_AVOID_STARTLE_ONCE,
    CONTEST_EFFECT_AVOID_STARTLE,
    CONTEST_EFFECT_AVOID_STARTLE_SLIGHTLY,
    CONTEST_EFFECT_USER_LESS_EASILY_STARTLED,
    CONTEST_EFFECT_STARTLE_FRONT_MON,
    CONTEST_EFFECT_SLIGHTLY_STARTLE_PREV_MONS,
    CONTEST_EFFECT_STARTLE_PREV_MON,
    CONTEST_EFFECT_STARTLE_PREV_MONS,
    CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON,
    CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS,
    CONTEST_EFFECT_STARTLE_PREV_MON_2,
    CONTEST_EFFECT_STARTLE_PREV_MONS_2,
    CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION,
    CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION,
    CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN,
    CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL,
    CONTEST_EFFECT_STARTLE_MONS_COOL_APPEAL,
    CONTEST_EFFECT_STARTLE_MONS_BEAUTY_APPEAL,
    CONTEST_EFFECT_STARTLE_MONS_CUTE_APPEAL,
    CONTEST_EFFECT_STARTLE_MONS_SMART_APPEAL,
    CONTEST_EFFECT_STARTLE_MONS_TOUGH_APPEAL,
    CONTEST_EFFECT_MAKE_FOLLOWING_MON_NERVOUS,
    CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS,
    CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS,
    CONTEST_EFFECT_BADLY_STARTLES_MONS_IN_GOOD_CONDITION,
    CONTEST_EFFECT_BETTER_IF_FIRST,
    CONTEST_EFFECT_BETTER_IF_LAST,
    CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES,
    CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE,
    CONTEST_EFFECT_BETTER_WHEN_LATER,
    CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING,
    CONTEST_EFFECT_BETTER_IF_SAME_TYPE,
    CONTEST_EFFECT_BETTER_IF_DIFF_TYPE,
    CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL,
    CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS,
    CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION,
    CONTEST_EFFECT_NEXT_APPEAL_EARLIER,
    CONTEST_EFFECT_NEXT_APPEAL_LATER,
    CONTEST_EFFECT_MAKE_SCRAMBLING_TURN_ORDER_EASIER,
    CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER,
    CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST,
    CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS,
    CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED,
    CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
};

enum
{
    COMBO_STARTER_RAIN_DANCE = 1,
    COMBO_STARTER_RAGE,
    COMBO_STARTER_FOCUS_ENERGY,
    COMBO_STARTER_HYPNOSIS,
    COMBO_STARTER_ENDURE,
    COMBO_STARTER_HORN_ATTACK,
    COMBO_STARTER_SWORDS_DANCE,
    COMBO_STARTER_STOCKPILE,
    COMBO_STARTER_SUNNY_DAY,
    COMBO_STARTER_REST,
    COMBO_STARTER_VICE_GRIP,
    COMBO_STARTER_DEFENSE_CURL,
    COMBO_STARTER_CHARGE,
    COMBO_STARTER_ROCK_THROW,
    COMBO_STARTER_YAWN,
    COMBO_STARTER_SCARY_FACE,
    COMBO_STARTER_POWDER_SNOW,
    COMBO_STARTER_LOCK_ON,
    COMBO_STARTER_SOFT_BOILED,
    COMBO_STARTER_MEAN_LOOK,
    COMBO_STARTER_SCRATCH,
    COMBO_STARTER_GROWTH,
    COMBO_STARTER_HAIL,
    COMBO_STARTER_SANDSTORM,
    COMBO_STARTER_BELLY_DRUM,
    COMBO_STARTER_MIND_READER,
    COMBO_STARTER_DRAGON_BREATH,
    COMBO_STARTER_DRAGON_RAGE,
    COMBO_STARTER_DRAGON_DANCE,
    COMBO_STARTER_SURF,
    COMBO_STARTER_DIVE,
    COMBO_STARTER_STRING_SHOT,
    COMBO_STARTER_LEER,
    COMBO_STARTER_TAUNT,
    COMBO_STARTER_CHARM,
    COMBO_STARTER_HARDEN,
    COMBO_STARTER_SING,
    COMBO_STARTER_EARTHQUAKE,
    COMBO_STARTER_DOUBLE_TEAM,
    COMBO_STARTER_CURSE,
    COMBO_STARTER_SWEET_SCENT,
    COMBO_STARTER_SLUDGE,
    COMBO_STARTER_SLUDGE_BOMB,
    COMBO_STARTER_THUNDER_PUNCH,
    COMBO_STARTER_FIRE_PUNCH,
    COMBO_STARTER_ICE_PUNCH,
    COMBO_STARTER_PECK,
    COMBO_STARTER_METAL_SOUND,
    COMBO_STARTER_MUD_SPORT,
    COMBO_STARTER_WATER_SPORT,
    COMBO_STARTER_BONE_CLUB,
    COMBO_STARTER_BONEMERANG,
    COMBO_STARTER_BONE_RUSH,
    COMBO_STARTER_SAND_ATTACK,
    COMBO_STARTER_MUD_SLAP,
    COMBO_STARTER_FAKE_OUT,
    COMBO_STARTER_PSYCHIC,
    COMBO_STARTER_KINESIS,
    COMBO_STARTER_CONFUSION,
    COMBO_STARTER_POUND,
    COMBO_STARTER_SMOG,
    COMBO_STARTER_CALM_MIND
};

enum
{
    CONTEST_STRING_MORE_CONSCIOUS,
    CONTEST_STRING_NO_APPEAL,
    CONTEST_STRING_SETTLE_DOWN,
    CONTEST_STRING_OBLIVIOUS_TO_OTHERS,
    CONTEST_STRING_LESS_AWARE,
    CONTEST_STRING_STOPPED_CARING,
    CONTEST_STRING_STARTLE_ATTEMPT,
    CONTEST_STRING_DAZZLE_ATTEMPT,
    CONTEST_STRING_JUDGE_LOOK_AWAY2,
    CONTEST_STRING_UNNERVE_ATTEMPT,
    CONTEST_STRING_NERVOUS,
    CONTEST_STRING_UNNERVE_WAITING,
    CONTEST_STRING_TAUNT_WELL,
    CONTEST_STRING_REGAINED_FORM,
    CONTEST_STRING_JAM_WELL,
    CONTEST_STRING_HUSTLE_STANDOUT,
    CONTEST_STRING_WORK_HARD_UNNOTICED,
    CONTEST_STRING_WORK_BEFORE,
    CONTEST_STRING_APPEAL_NOT_WELL,
    CONTEST_STRING_WORK_PRECEDING,
    CONTEST_STRING_APPEAL_NOT_WELL2,
    CONTEST_STRING_APPEAL_NOT_SHOWN_WELL,
    CONTEST_STRING_APPEAL_SLIGHTLY_WELL,
    CONTEST_STRING_APPEAL_PRETTY_WELL,
    CONTEST_STRING_APPEAL_EXCELLENTLY,
    CONTEST_STRING_APPEAL_DUD,
    CONTEST_STRING_APPEAL_NOT_VERY_WELL,
    CONTEST_STRING_APPEAL_SLIGHTLY_WELL2,
    CONTEST_STRING_APPEAL_PRETTY_WELL2,
    CONTEST_STRING_APPEAL_VERY_WELL,
    CONTEST_STRING_APPEAL_EXCELLENTLY2,
    CONTEST_STRING_SAME_TYPE_GOOD,
    CONTEST_STRING_DIFF_TYPE_GOOD,
    CONTEST_STRING_STOOD_OUT_AS_MUCH,
    CONTEST_STRING_NOT_AS_WELL,
    CONTEST_STRING_CONDITION_ROSE,
    CONTEST_STRING_HOT_STATUS,
    CONTEST_STRING_MOVE_UP_LINE,
    CONTEST_STRING_MOVE_BACK_LINE,
    CONTEST_STRING_SCRAMBLE_ORDER,
    CONTEST_STRING_JUDGE_EXPECTANTLY2,
    CONTEST_STRING_WENT_OVER_WELL,
    CONTEST_STRING_WENT_OVER_VERY_WELL,
    CONTEST_STRING_APPEAL_COMBO_EXCELLENTLY,
    CONTEST_STRING_AVERT_GAZE,
    CONTEST_STRING_AVOID_SEEING,
    CONTEST_STRING_NOT_FAZED,
    CONTEST_STRING_LITTLE_DISTRACTED,
    CONTEST_STRING_ATTEMPT_STARTLE,
    CONTEST_STRING_LOOKED_DOWN,
    CONTEST_STRING_TURNED_BACK,
    CONTEST_STRING_UTTER_CRY,
    CONTEST_STRING_LEAPT_UP,
    CONTEST_STRING_TRIPPED_OVER,
    CONTEST_STRING_MESSED_UP2,
    CONTEST_STRING_FAILED_TARGET_NERVOUS,
    CONTEST_STRING_FAILED_ANYONE_NERVOUS,
    CONTEST_STRING_IGNORED,
    CONTEST_STRING_NO_CONDITION_IMPROVE,
    CONTEST_STRING_BAD_CONDITION_WEAK_APPEAL,
    CONTEST_STRING_UNAFFECTED,
    CONTEST_STRING_ATTRACTED_ATTENTION,
    CONTEST_STRING_NONE = 255
};

struct ContestMove
{
    u8 effect;
    u8 contestCategory:3;
    u8 comboStarterId;
    u8 comboMoves[4];
};

struct ContestEffect
{
    u8 effectType;
    u8 appeal;
    u8 jam;
};

struct ContestPokemon
{
    /*0x00*/ u16 species;
    /*0x02*/ u8 nickname[POKEMON_NAME_LENGTH + 1];
    /*0x0D*/ u8 trainerName[8];
    /*0x15*/ u8 trainerGfxId;
    /*0x18*/ u32 flags;
    /*0x1C*/ u8 whichRank:2;
             u8 aiPool_Cool:1;
             u8 aiPool_Beauty:1;
             u8 aiPool_Cute:1;
             u8 aiPool_Smart:1;
             u8 aiPool_Tough:1;
    /*0x1E*/ u16 moves[4]; // moves
    /*0x26*/ u8 cool; // cool
    /*0x27*/ u8 beauty; // beauty
    /*0x28*/ u8 cute; // cute
    /*0x29*/ u8 smart; // smart
    /*0x2A*/ u8 tough; // tough
    /*0x2B*/ u8 sheen; // sheen
    /*0x2C*/ u8 unk2C[12];
    /*0x38*/ u32 personality;  // personality
    /*0x3C*/ u32 otId;  // otId
}; // wow

struct ContestAIInfo {
 /*0x00*/ u8 aiState;
 /*0x02*/ u16 unk2;
 /*0x04*/ u8 unk4;
 /*0x05*/ u8 unk5[4];
 /*0x09*/ u8 aiAction;
 /*0x0A*/ u8 fillerA[0x6]; // TODO: don't know what's here
 /*0x10*/ u8 unk10;
 /*0x14*/ u32 flags;
 /*0x18*/ s16 scriptResult;
 /*0x1A*/ s16 scriptArr[3];
 /*0x20*/ u32 stack[8];
 /*0x40*/ u8 unk40;
 /*0x41*/ u8 unk41;
};

extern struct ContestPokemon gContestMons[];
extern const struct ContestMove gContestMoves[];
extern const struct ContestEffect gContestEffects[];
extern const u8 *const gContestEffectStrings[];

void ResetLinkContestBoolean(void);
void LoadContestBgAfterMoveAnim(void);
void CB2_StartContest(void);
void Contest_CreatePlayerMon(u8);
void Contest_InitAllPokemon(u8, u8);
u8 CanMonParticipateInContest(struct Pokemon *party);
u16 CalculateContestantRound1Points(u8, u8);
void CalculateRound1Points(u8);
u8 IsSpeciesNotUnown(u16);
void CalculateFinalScores(void);
void SortContestants(u8);
bool8 Contest_SaveWinner(u8);
u8 GetContestWinnerSaveIdx(u8, u8);
void Contest_ResetWinners(void);
s8 Contest_GetMoveExcitement(u16);

// Contest Shared EWRAM

struct ContestTempSave
{
    /*0x18004*/ u16 cachedWindowPalettes[16][16];
    /*0x18204*/ u16 cachedPlttBufferUnfaded[0x200];
    /*0x18604*/ u16 cachedPlttBufferFaded[0x200];
    /*0x18A04*/ u8 savedJunk[0x800];
};

struct Contest
{
    /*0x19204*/ u8 playerMoveChoice;
    /*0x19205*/ u8 appealNumber;
    /*0x19206*/ u8 unk19206[4];    // seems to only be used by an unref function
    /*0x1920A*/ bool16 unk1920A_0:1;  // Task active flags?
                bool16 unk1920A_1:1;
                bool16 unk1920A_2:1;
                bool16 unk1920A_3:1;
                bool16 waitForJudgeSpeechBubble:1;
                bool16 isShowingApplauseMeter:1;
                bool16 applauseMeterIsMoving:1;
                bool16 animatingAudience:1;
    /*0x1920B*/ bool16 waitForAudienceBlend:1;
                bool16 sliderHeartsAnimating:1;
                bool16 waitForLink:1;
    /*0x1920C*/ u8 mainTaskId;
    /*0x1920D*/ u8 unk1920D[4];
    /*0x19211*/ u8 judgeAttentionTaskId;
    /*0x19212*/ u8 blendTaskId;
    /*0x19213*/ u8 filler19213;
    /*0x19214*/ u8 turnNumber;
    /*0x19215*/ u8 currentContestant;
    /*0x19216*/ u8 judgeSpeechBubbleSpriteId;
    /*0x19217*/ s8 applauseLevel;
    /*0x19218*/ u8 prevTurnOrder[4];
    /*0x1921C*/ u32 unusedRng;   // saved RNG value?
                u16 moveHistory[5][4];  // move history?
                u8 excitementHistory[5][4];  // excitement history
                u8 applauseMeterSpriteId;    // sprite ID
    /*0x1925D*/ u8 contestSetupState;
    /*0x1925E*/ u8 moveAnimTurnCount;
};

struct ContestantStatus
{
 /*0x00*/ s16 baseAppeal;
 /*0x02*/ s16 appeal;
 /*0x04*/ s16 pointTotal;
 /*0x06*/ u16 currMove;
 /*0x08*/ u16 prevMove;
 /*0x0A*/ u8 moveCategory;
 /*0x0B*/ u8 ranking:2;
          u8 unkB_2:2; // unused
          u8 moveRepeatCount:3;
          bool8 noMoreTurns:1;  // used a one-time move?
 /*0x0C*/ bool8 nervous:1;
          u8 numTurnsSkipped:2;
 /*0x0D*/ s8 condition;
 /*0x0E*/ u8 jam;
 /*0x0F*/ u8 jamReduction;

          // Flags set by move effect
 /*0x10*/ bool8 resistant:1;
          bool8 immune:1;
          bool8 moreEasilyStartled:1;
          bool8 usedRepeatableMove:1;
          u8 conditionMod:2; // 1: just raised condition; 2: appeal greatly improved by condition
          u8 turnOrderMod:2; // 1: defined; 2: random
 /*0x11*/ u8 turnOrderModAction:2; // 1: made first; 2: made last; 3: made random
          bool8 turnSkipped:1;
          bool8 exploded:1;
          bool8 overrideCategoryExcitementMod:1;
          bool8 appealTripleCondition:1;

 /*0x12*/ u8 jamSafetyCount;
 /*0x13*/ u8 effectStringId;   // status action?
 /*0x14*/ u8 effectStringId2;
 /*0x15*/ bool8 repeatedMove:1;
          bool8 unk15_1:1; // unused
          bool8 repeatedPrevMove:1;
          bool8 completedComboFlag:1;
          bool8 hasJudgesAttention:1;
          bool8 judgesAttentionWasRemoved:1;
          bool8 usedComboMove:1;
 /*0x16*/ u8 completedCombo;
 /*0x17*/ u8 comboAppealBonus;
 /*0x18*/ u8 repeatJam;
 /*0x19*/ u8 nextTurnOrder;  // turn position
 /*0x1A*/ u8 attentionLevel;  // How much the Pokemon "stood out"
 /*0x1B*/ u8 contestantAnimTarget;
};

struct ContestGfxState
{
    u8 sliderHeartSpriteId;
    u8 nextTurnSpriteId;
    bool8 sliderUpdating:1;
    bool8 boxBlinking:1;
    bool8 updatingAppealHearts:1;
};

struct ContestExcitement
{
    s8 moveExcitement;
    bool8 excitementFrozen:1;
    u8 excitementFreezer:3;
    s8 excitementAppealBonus;
};

struct ContestAppealMoveResults
{
    u8 turnOrder[4];
    s16 jam;
    s16 jam2;
    u8 jamQueue[5];
    u8 unnervedPokes[4];
    u8 contestant;
};

struct ContestFinalStandings
{
    s32 totalPoints;
    s32 round1Points;
    s32 random;
    s32 contestant;
};

extern u8 gContestPlayerMonIndex;
extern u8 gIsLinkContest;
extern u32 gContestRngValue;
extern u8 gContestantTurnOrder[4];
extern s16 gContestMonRound1Points[4];
extern s16 gContestMonTotalPoints[4];
extern s16 gContestMonAppealPointTotals[4];
extern s16 gContestMonRound2Points[4];
extern u8 gContestFinalStandings[4];
extern u8 gContestantTurnOrder[4];
extern u8 gContestLinkLeaderIndex;
extern u16 gSpecialVar_ContestRank;
extern u16 gSpecialVar_ContestCategory;
extern u8 gContestMonPartyIndex;

void SetContestantEffectStringID(u8 a, u8 b);
void SetContestantEffectStringID2(u8 a, u8 b);
void MakeContestantNervous(u8 p);
bool8 Contest_IsMonsTurnDisabled(u8 a);
bool8 IsContestantAllowedToCombo(u8 contestant);
void SetStartledString(u8 a, u8 b);

#endif // GUARD_CONTEST_H
