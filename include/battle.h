#ifndef GUARD_BATTLE_H
#define GUARD_BATTLE_H

#include "sprite.h"
#include "constants/battle.h"
#include "battle_setup.h"
#include "main.h"

#define GET_BATTLER_POSITION(battler)     (gBattlerPositions[battler])
#define GET_BATTLER_SIDE(battler)         (GetBattlerPosition(battler) & BIT_SIDE)
#define GET_BATTLER_SIDE2(battler)        (GET_BATTLER_POSITION(battler) & BIT_SIDE)

// Battle Actions
// These determine what each battler will do in a turn
#define B_ACTION_USE_MOVE               0
#define B_ACTION_USE_ITEM               1
#define B_ACTION_SWITCH                 2
#define B_ACTION_RUN                    3
#define B_ACTION_SAFARI_WATCH_CAREFULLY 4
#define B_ACTION_SAFARI_BALL            5
#define B_ACTION_SAFARI_POKEBLOCK       6
#define B_ACTION_SAFARI_GO_NEAR         7
#define B_ACTION_SAFARI_RUN             8
// The exact purposes of these are unclear
#define B_ACTION_WALLY_THROW            9
#define B_ACTION_EXEC_SCRIPT            10 // when executing an action
#define B_ACTION_TRY_FINISH             11
#define B_ACTION_FINISHED               12 // when executing an action

#define B_ACTION_CANCEL_PARTNER         12 // when choosing an action
#define B_ACTION_NOTHING_FAINTED        13 // when choosing an action
#define B_ACTION_NONE                   0xFF

#define MAX_TRAINER_ITEMS 4
#define MAX_MON_MOVES 4

// array entries for battle communication
#define MULTIUSE_STATE          0x0
#define CURSOR_POSITION         0x1
#define TASK_ID                 0x1 // task Id and cursor position share the same field
#define SPRITES_INIT_STATE1     0x1 // shares the Id as well
#define SPRITES_INIT_STATE2     0x2
#define MOVE_EFFECT_BYTE        0x3
#define ACTIONS_CONFIRMED_COUNT 0x4
#define MULTISTRING_CHOOSER     0x5
#define MSG_DISPLAY             0x7
#define BATTLE_COMMUNICATION_ENTRIES_COUNT  0x8

#define MOVE_TARGET_SELECTED            0x0
#define MOVE_TARGET_DEPENDS             0x1
#define MOVE_TARGET_USER_OR_SELECTED    0x2
#define MOVE_TARGET_RANDOM              0x4
#define MOVE_TARGET_BOTH                0x8
#define MOVE_TARGET_USER                0x10
#define MOVE_TARGET_FOES_AND_ALLY       0x20
#define MOVE_TARGET_OPPONENTS_FIELD     0x40

// defines for the u8 array gTypeEffectiveness
#define TYPE_EFFECT_ATK_TYPE(i)((gTypeEffectiveness[i + 0]))
#define TYPE_EFFECT_DEF_TYPE(i)((gTypeEffectiveness[i + 1]))
#define TYPE_EFFECT_MULTIPLIER(i)((gTypeEffectiveness[i + 2]))

// defines for the gTypeEffectiveness multipliers
#define TYPE_MUL_NO_EFFECT          0
#define TYPE_MUL_NOT_EFFECTIVE      5
#define TYPE_MUL_NORMAL             10
#define TYPE_MUL_SUPER_EFFECTIVE    20

// special type table Ids
#define TYPE_FORESIGHT  0xFE
#define TYPE_ENDTABLE   0xFF

struct DisableStruct
{
    /*0x00*/ u32 transformedMonPersonality;
    /*0x04*/ u16 disabledMove;
    /*0x06*/ u16 encoredMove;
    /*0x08*/ u8 protectUses;
    /*0x09*/ u8 stockpileCounter;
    /*0x0A*/ u8 substituteHP;
    /*0x0B*/ u8 disableTimer1 : 4;
    /*0x0B*/ u8 disableTimer2 : 4;
    /*0x0C*/ u8 encoredMovePos;
    /*0x0D*/ u8 unkD;
    /*0x0E*/ u8 encoreTimer1 : 4;
    /*0x0E*/ u8 encoreTimer2 : 4;
    /*0x0F*/ u8 perishSongTimer1 : 4;
    /*0x0F*/ u8 perishSongTimer2 : 4;
    /*0x10*/ u8 furyCutterCounter;
    /*0x11*/ u8 rolloutTimer1 : 4;
    /*0x11*/ u8 rolloutTimer2 : 4;
    /*0x12*/ u8 chargeTimer1 : 4;
    /*0x12*/ u8 chargeTimer2 : 4;
    /*0x13*/ u8 tauntTimer1:4;
    /*0x13*/ u8 tauntTimer2:4;
    /*0x14*/ u8 bankPreventingEscape;
    /*0x15*/ u8 battlerWithSureHit;
    /*0x16*/ u8 isFirstTurn;
    /*0x17*/ u8 unk17;
    /*0x18*/ u8 truantCounter : 1;
    /*0x18*/ u8 unk18_a : 3;
    /*0x18*/ u8 mimickedMoves : 4;
    /*0x19*/ u8 rechargeCounter;
    /*0x1A*/ u8 unk1A[2];
};

struct ProtectStruct
{
    /*field0*/
    u32 protected:1;
    u32 endured:1;
    u32 noValidMoves:1;
    u32 helpingHand:1;
    u32 bounceMove:1;
    u32 stealMove:1;
    u32 flag0Unknown:1;
    u32 prlzImmobility:1;
    /*field1*/
    u32 confusionSelfDmg:1;
    u32 targetNotAffected:1;
    u32 chargingTurn:1;
    u32 fleeFlag:2; // For RunAway and Smoke Ball.
    u32 usedImprisonedMove:1;
    u32 loveImmobility:1;
    u32 usedDisabledMove:1;
    /*field2*/
    u32 usedTauntedMove:1;
    u32 flag2Unknown:1;
    u32 flinchImmobility:1;
    u32 notFirstStrike:1;
    u32 free : 4;
    /*field3*/
    u32 field3 : 8;
    s32 physicalDmg;
    s32 specialDmg;
    u8 physicalBattlerId;
    u8 specialBattlerId;
    u16 fieldE;
};

struct SpecialStatus
{
    u32 statLowered:1;
    u32 lightningRodRedirected:1;
    u32 restoredBattlerSprite: 1;
    u32 intimidatedMon:1;
    u32 traced:1;
    u32 ppNotAffectedByPressure:1;
    u32 flag40:1;
    u32 focusBanded:1;
    s32 dmg;
    s32 physicalDmg;
    s32 specialDmg;
    u8 physicalBattlerId;
    u8 specialBattlerId;
    u8 field12;
    u8 field13;
};

struct SideTimer
{
    u8 reflectTimer;        //0x0
    u8 lightscreenTimer;    //0x1
    u8 mistTimer;           //0x2
    u8 field3;              //0x3
    u16 field4;             //0x4
    u8 spikesAmount;        //0x6
    u8 safeguardTimer;      //0x7
    u8 followmeTimer;       //0x8
    u8 followmeTarget;      //0x9
    u8 fieldA;              //0xA
    u8 fieldB;              //0xB
};

struct WishFutureKnock
{
    u8 futureSightCounter[MAX_BATTLERS_COUNT];
    u8 futureSightAttacker[MAX_BATTLERS_COUNT];
    s32 futureSightDmg[MAX_BATTLERS_COUNT];
    u16 futureSightMove[MAX_BATTLERS_COUNT];
    u8 wishCounter[MAX_BATTLERS_COUNT];
    u8 wishMonId[MAX_BATTLERS_COUNT];
    u8 weatherDuration;
    u8 knockedOffPokes[2];
};

struct AI_ThinkingStruct /* 0x2016800 */
{
    /*0x00*/ u8 aiState;
    /*0x01*/ u8 movesetIndex;
    /*0x02*/ u16 moveConsidered;
    /*0x04*/ s8 score[4]; // score?
    /*0x08*/ u32 funcResult;
    /*0x0C*/ u32 aiFlags;
    /*0x10*/ u8 aiAction;
    /*0x11*/ u8 aiLogicId;
    /*0x12*/ u8 filler12[6];
    /*0x18*/ u8 simulatedRNG[4];
};

struct BattleHistory
{
    /*0x00*/ u16 usedMoves[2][8]; // 0xFFFF means move not used (confuse self hit, etc)
    /*0x20*/ u8 abilities[MAX_BATTLERS_COUNT / 2];
    /*0x22*/ u8 itemEffects[MAX_BATTLERS_COUNT / 2];
    /*0x24*/ u16 trainerItems[MAX_BATTLERS_COUNT];
    /*0x2C*/ u8 numItems;
};

struct BattleScriptsStack
{
    const u8 *ptr[8];
    u8 size;
};

struct BattleCallbacksStack
{
    void* ptr[8];
    u8 size;
};

struct StatsArray
{
    u16 hp;
    u16 atk;
    u16 def;
    u16 spd;
    u16 spAtk;
    u16 spDef;
};

struct BattleResults
{
    u8 playerFaintCounter;    // 0x0
    u8 opponentFaintCounter;  // 0x1
    u8 totalMonSwitchCounter; // 0x2
    u8 playerHealInBattleCount; // 0x3
    u8 reviveCount;           // 0x4
    u8 playerMonWasDamaged:1; // 0x5
    u8 usedMasterBall:1;      // 0x5
    u16 poke1Species;         // 0x6
    u8 pokeString1[10];       // 0x8
    u8 unk12; // unused
    u8 battleTurnCounter;     // 0x13
    u8 pokeString2[10];       // 0x14
    u8 filler1E[2];
    u16 lastOpponentSpecies;  // 0x20
    u16 lastUsedMove;         // 0x22
    u16 opponentMove;         // 0x24
    u16 opponentSpecies;      // 0x26
    u16 caughtPoke;           // 0x28
    u8 caughtNick[10];        // 0x2A
    u8 filler34[2];
    u8 usedBalls[11];
};

union TrainerMonPtr
{
    const struct TrainerMonNoItemDefaultMoves *NoItemDefaultMoves;
    const struct TrainerMonNoItemCustomMoves *NoItemCustomMoves;
    const struct TrainerMonItemDefaultMoves *ItemDefaultMoves;
    const struct TrainerMonItemCustomMoves *ItemCustomMoves;
};

struct Trainer
{
    /*0x00*/ u8 partyFlags;
    /*0x01*/ u8 trainerClass;
    /*0x02*/ u8 encounterMusic_gender;
    /*0x03*/ u8 trainerPic;
    /*0x04*/ u8 trainerName[12];
    /*0x10*/ u16 items[4];
    /*0x18*/ bool8 doubleBattle;
    /*0x1C*/ u32 aiFlags;
    /*0x20*/ u8 partySize;
    /*0x24*/ union TrainerMonPtr party;
};

struct AI_Stack
{
    u8 *ptr[8];
    u8 size;
};

struct LinkPartnerHeader
{
    u8 versionSignatureLo;
    u8 versionSignatureHi;
    u8 vsScreenHealthFlagsLo;
    u8 vsScreenHealthFlagsHi;
    struct BattleEnigmaBerry battleEnigmaBerry;
};

union MultiBuffers
{
    struct LinkPartnerHeader linkPartnerHeader;
    struct MultiBattlePokemonTx multiBattleMons[3];
};

// Used internally
struct LinkBattleCommunicationHeader
{
    u8 state;
    u8 activeBattler;
    u8 battlerAttacker;
    u8 battlerTarget;
    u16 size;
    u8 absentBattlerFlags;
    u8 effectBattler;
    u8 data[0];
};

struct ChooseMoveStruct {
    u16 moves[4];
    u8 currentPp[4];
    u8 maxPp[4];
    u16 species;
    u8 monType1;
    u8 monType2;
};

struct BattleStruct /* 0x2000000 */
{
    u8 filler00000[0x14000];
    /*0x14000*/ u8 linkSend[0x1000];
    /*0x15000*/ u8 linkRecv[0x1000];
    /*0x16000*/ u8 turnEffectsTracker;
    /*0x16001*/ u8 turnEffectsBattlerId;
    /*0x16002*/ u8 animTurn;
    /*0x16003*/ u8 scriptingActive;
    /*0x16004*/ u8 wrappedMove[MAX_BATTLERS_COUNT * 2];
    /*0x1600C*/ u8 cmd49StateTracker;
    /*0x1600D*/ u8 unk1600D; // unused
    /*0x1600E*/ u8 turnCountersTracker;
    /*0x1600F*/ u8 getexpStateTracker;
    /*0x16010*/ u8 moveTarget[MAX_BATTLERS_COUNT];
    /*0x16014*/ u32 painSplitHP;
    /*0x16018*/ u8 expGetterMonId;
    /*0x16019*/ u8 unk16019; // unused
    /*0x1601A*/ u8 atk5A_StateTracker; //also atk5B, statetracker
    /*0x1601B*/ u8 wildVictorySong;
    /*0x1601C*/ u8 dynamicMoveType;
    /*0x1601D*/ u8 focusPunchBattler;
    /*0x1601E*/ u8 statChanger;
    /*0x1601F*/ u8 dmgMultiplier;
    /*0x16020*/ u8 wrappedBy[MAX_BATTLERS_COUNT];
    /*0x16024*/ u16 assistMove[PARTY_SIZE * MAX_MON_MOVES];
    /*0x16054*/ u8 battlerPreventingSwitchout;
    /*0x16055*/ u8 unk16055; // unused
    /*0x16056*/ u8 moneyMultiplier;
    /*0x16057*/ u8 savedTurnActionNumber;
    /*0x16058*/ u8 switchInAbilitiesCounter;
    /*0x16059*/ u8 faintedActionsState;
    /*0x1605A*/ u8 faintedActionsBattlerId;
    /*0x1605C*/ u16 exp;
    /*0x1605E*/ u8 unk1605E;
    /*0x1605F*/ u8 sentInPokes;
    /*0x16060*/ u8 selectionScriptFinished[MAX_BATTLERS_COUNT];
    /*0x16064*/ u8 unk16064[MAX_BATTLERS_COUNT];
    /*0x16068*/ u8 monToSwitchIntoId[MAX_BATTLERS_COUNT];
    /*0x1606C*/ u8 unk1606C[MAX_BATTLERS_COUNT][3];
    /*0x16078*/ u8 runTries;
    /*0x16079*/ u8 caughtNick[POKEMON_NAME_LENGTH + 1];
    /*0x16084*/ u8 battleStyle;
    /*0x16085*/ u8 unk16085;
    /*0x16086*/ u8 safariGoNearCounter;
    /*0x16087*/ u8 safariPkblThrowCounter;
    /*0x16088*/ u8 safariFleeRate;
    /*0x16089*/ u8 safariCatchFactor;
    /*0x1608A*/ u8 linkBattleVsSpriteId_V;
    /*0x1608B*/ u8 linkBattleVsSpriteId_S;
    /*0x1608C*/ u8 ChosenMoveID[MAX_BATTLERS_COUNT];
    /*0x16090*/ s32 bideDmg;
    /*0x16094*/ u8 stateIdAfterSelScript[4];
    /*0x16098*/ u8 unk16098[3]; // unused
    /*0x1609B*/ u8 castformToChangeInto;
    /*0x1609C*/ u8 atk6C_statetracker;
    /*0x1609D*/ u8 unk1609D;
    /*0x1609E*/ u8 dbgAICycleMoveTracker[2]; // debug
    /*0x160A0*/ u8 stringMoveType;
    /*0x160A1*/ u8 animTargetsHit;
    /*0x160A2*/ u8 expGetterBattlerId;
    /*0x160A3*/ u8 unk160A3;
    /*0x160A4*/ u8 animArg1;
    /*0x160A5*/ u8 animArg2;
    /*0x160A6*/ u8 unk160A6; // related to gAbsentBattlerFlags, possibly absent flags turn ago?
    /*0x160A7*/ u8 unk160A7;
    /*0x160A8*/ u8 wallyBattleState;
    /*0x160A9*/ u8 wallyMovesState;
    /*0x160AA*/ u8 wallyWaitFrames;
    /*0x160AB*/ u8 wallyMoveFrames;
    /*0x160AC*/ u16 lastTakenMove[2 * 2 * 2];
    /*0x160BC*/ u16 HP_OnSwitchout[2];
    /*0x160C0*/ u8 abilityPreventingSwitchout;
    /*0x160C1*/ u8 hpScale;
    /*0x160C2*/ u16 unk160C2;
    /*0x160C4*/ MainCallback unk160C4;

    // Buffers used by the AI are indexed using (battler / 2)
    // i.e. the flank bit, because at no point in game is the
    // player's partner in a multi battle controlled by the AI.
    // This is changed in Emerald to support the Tabitha fight
    // in the Space Center.
    /*0x160C8*/ u8 AI_monToSwitchIntoId[2];
    /*0x160CA*/ u8 synchroniseEffect;
    /*0x160CB*/ u8 multiplayerId;
    /*0x160CC*/ u16 usedHeldItems[MAX_BATTLERS_COUNT];
    // Space is reserved for two u16s, one for each opponent in
    // doubles. However, only the lower byte of each is ever used.
    /*0x160D4*/ u16 AI_usedItemId[2];
    /*0x160D8*/ u8 AI_usedItemType[2];
    /*0x160DA*/ u8 AI_usedItemEffect[2];
    /*0x160DC*/ u8 statAnimPlayed;
    /*0x160DD*/ u8 intimidateBank;
    /*0x160DE*/ u8 unk160DE;
    /*0x160DF*/ u8 unk160DF;
    /*0x160E0*/ u8 unk160E0[6];
    /*0x160E6*/ u8 unk160E6;
    /*0x160E7*/ u8 atkCancellerTracker;
    /*0x160E8*/ u16 choicedMove[MAX_BATTLERS_COUNT];
    /*0x160F0*/ u16 changedItems[MAX_BATTLERS_COUNT];
    /*0x160F8*/ u8 unk160F8;
    /*0x160F9*/ u8 unk160F9;
    /*0x160FA*/ u8 levelUpHP;
    /*0x160FB*/ u8 unk160FB;
    /*0x160FC*/ u8 turnSideTracker;
    /*0x160FD*/ u8 unk160FD;
    /*0x160FE*/ u8 unk160FE;
    /*0x160FF*/ u8 unk160FF;
	/*0x16100*/ u16 lastTakenMoveFrom[2 * 4];
    /*0x16110*/ u8 wishPerishSongState;
    /*0x16111*/ u8 wishPerishSongBattlerId;
    /*0x16112*/ u8 multihitMoveEffect;
    /*0x16113*/ u8 givenExpMons;
};

struct ResourceFlags
{
    u32 arr[4];
};

struct BattleSpriteInfo
{
    u8 invisible:1;
    u8 lowHpSong:1;
    u8 behindSubstitute:1;
    u8 flag_x8:1;
    u8 hpNumbersNoBars:1;
    u16 transformSpecies;
};

struct BattleHealthboxInfo
{
 /*0x00*/ u8 partyStatusSummaryShown:1;
 /*0x00*/ u8 unk0_1:1;
 /*0x00*/ u8 unk0_2:1;
 /*0x00*/ u8 ballAnimActive:1;
 /*0x00*/ u8 statusAnimActive:1;
 /*0x00*/ u8 animFromTableActive:1;
 /*0x00*/ u8 specialAnimActive:1;
 /*0x00*/ u8 triedShinyMonAnim:1;
 /*0x01*/ u8 finishedShinyMonAnim:1;
 /*0x01*/ u8 unk1_1:5;
 /*0x02*/ u8 unk2;
 /*0x03*/ u8 unk3;
 /*0x04*/ u8 animationState;
 /*0x05*/ u8 unk5;
 /*0x06*/ u8 unk6;
 /*0x07*/ u8 unk7;
 /*0x08*/ u8 unk8;
 /*0x09*/ u8 unk9;
 /*0x0A*/ u8 fillerA[2];
};

struct Struct2017840
{
    u16 unk0;
    u8 filler2[6];
    u8 unk8;
    u8 unk9_0:1;
    u8 unk9_1:1;
    u8 unkA;
    u16 unkC;
};

struct Struct20238C8
{
    u8 unk0_0:7;
    u8 unk0_7:1;
};

#define GET_MOVE_TYPE(move, typeArg)                        \
{                                                           \
    if (gBattleStruct->dynamicMoveType)                     \
        typeArg = gBattleStruct->dynamicMoveType & 0x3F;    \
    else                                                    \
        typeArg = gBattleMoves[move].type;                  \
}

#define IS_TYPE_PHYSICAL(moveType)(moveType < TYPE_MYSTERY)
#define IS_TYPE_SPECIAL(moveType)(moveType > TYPE_MYSTERY)

#define TARGET_TURN_DAMAGED (((gSpecialStatuses[gBattlerTarget].physicalDmg || gSpecialStatuses[gBattlerTarget].specialDmg)))

#define IS_BATTLER_OF_TYPE(battlerId, type)((gBattleMons[battlerId].type1 == type || gBattleMons[battlerId].type2 == type))
#define SET_BATTLER_TYPE(battlerId, type)   \
{                                           \
    gBattleMons[battlerId].type1 = type;    \
    gBattleMons[battlerId].type2 = type;    \
}

#define GET_STAT_BUFF_ID(n)((n & 0xF))              // first four bits 0x1, 0x2, 0x4, 0x8
#define GET_STAT_BUFF_VALUE2(n)((n & 0xF0))
#define GET_STAT_BUFF_VALUE(n)(((n >> 4) & 7))      // 0x10, 0x20, 0x40
#define STAT_BUFF_NEGATIVE 0x80                     // 0x80, the sign bit

#define SET_STAT_BUFF_VALUE(n)(((s8)(((s8)(n) << 4)) & 0xF0))

#define SET_STATCHANGER(statId, stage, goesDown)(gBattleScripting.statChanger = (statId) + (stage << 4) + (goesDown << 7))

extern struct BattleHistory unk_2016A00;
extern struct DisableStruct gDisableStructs[MAX_BATTLERS_COUNT];
extern struct BattleResults gBattleResults;
extern struct ProtectStruct gProtectStructs[MAX_BATTLERS_COUNT];
extern struct SpecialStatus gSpecialStatuses[MAX_BATTLERS_COUNT];
extern struct SideTimer gSideTimers[2];
extern struct WishFutureKnock gWishFutureKnock;
extern struct AI_ThinkingStruct gAIThinkingSpace;
extern struct Struct20238C8 gUnknown_020238C8;

// used in many battle files, it seems as though Hisashi Sogabe wrote
// some sort of macro to replace the use of actually calling memset.
// Perhaps it was thought calling memset was much slower?

// The compiler wont allow us to locally declare ptr in this macro; some
// functions that invoke this macro will not match without this egregeous
// assumption about the variable names, so in order to avoid this assumption,
// we opt to pass the variables themselves, even though it is likely that
// Sogabe assumed the variables were named src and dest. Trust me: I tried to
// avoid assuming variable names, but the ROM just will not match without the
// assumptions. Therefore, these macros are bad practice, but I'm putting them
// here anyway.
#define MEMSET_ALT(data, c, size, var, dest)    \
{    \
    dest = (u8 *)data;    \
    for(var = 0; var < (u32)size; var++)    \
        dest[var] = c;    \
}    \

#define MEMCPY_ALT(data, dest, size, var, src)    \
{    \
    src = (u8 *)data;    \
    for(var = 0; var < (u32)size; var++)    \
        dest[var] = src[var];    \
}    \

typedef void (*BattleCmdFunc)(void);

extern u8 gBattleTextBuff1[];

//function declarations of buffer emits
void BtlController_EmitGetMonData(u8 buffID, u8 request, u8 c);    //0x0
void BtlController_EmitGetRawMonData(u8 a, u8 b, u8 c); //0x1
void BtlController_EmitSetMonData(u8 a, u8 request, u8 c, u8 bytes, void *data);  //0x2
void BtlController_EmitSwitchInAnim(u8 a, u8 b, u8 c); //0x5
void BtlController_EmitReturnMonToBall(u8 a, u8 b); //0x6
void BtlController_EmitTrainerSlide(u8 a); //0x8
void BtlController_EmitFaintAnimation(u8 a);  //0xA
void BtlController_EmitBallThrowAnim(u8 a, u8 shakes);  //0xD
//void BtlController_EmitMoveAnimation(u8 a, u16 move, u8 turn, u16 power, s32 dmg, u8 happiness, void *disable_struct); //0xF
void BtlController_EmitPrintString(u8 a, u16 stringID);  //0x10
//void BtlController_EmitPrintSelectionString(u8 a, u16 stringID); //0x11
void BtlController_EmitChoosePokemon(u8 a, u8 b, u8 c, u8 d, u8 *e); //0x16
//void BtlController_EmitHealthBarUpdate(u8 a, u16 b); //0x18; Had to declare the second arg as u16 because s16 wont match in atk0b
//void BtlController_EmitExpUpdate(u8 a, u8 b, u16 c); //0x19
void BtlController_EmitStatusIconUpdate(u8 a, u32 b, u32 c); //0x1A
void BtlController_EmitStatusAnimation(u8 a, u8 b, u32 c); //0x1B
void BtlController_EmitStatusXor(u8 a, u8 b); //0x1C
void BtlController_EmitHitAnimation(u8 a); //0x29
void BtlController_EmitPlaySE(u8 a, u16 sound); //0x2B
void BtlController_EmitPlayFanfareOrBGM(u8 a, u16 sound);    //0x2C
void BtlController_EmitFaintingCry(u8 a); //0x2D
void BtlController_EmitIntroSlide(u8 bufferId, u8 environmentId); //0x2E
void BtlController_EmitHidePartyStatusSummary(u8 a);  //0x31
void BtlController_EmitSpriteInvisibility(u8 a, u8 b); //0x33
void BtlController_EmitBattleAnimation(u8 a, u8 b, u16 c); //0x34
void BtlController_EmitResetActionMoveSelection(u8 a, u8 b); //0x36
void BtlController_EmitCmd55(u8 a, u8 b); //0x37

void MarkBattlerForControllerExec(u8 bank);

extern u8 gBattleTextBuff1[];

extern u16 gBattle_BG0_X;
extern u16 gBattle_BG0_Y;
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG2_Y;
extern u16 gBattle_BG3_X;
extern u16 gBattle_BG3_Y;
extern u16 gBattle_WIN0H;
extern u16 gBattle_WIN0V;
extern u16 gBattle_WIN1H;
extern u16 gBattle_WIN1V;

extern u8 gLastHitBy[MAX_BATTLERS_COUNT];

extern u8 gDisplayedStringBattle[];

extern u16 gBattleTypeFlags;
extern u8 gUnknown_02023A14_50;
extern u16 gTrainerBattleOpponent;

// src/battle_bg.o
void sub_800D6D4();
void ApplyPlayerChosenFrameToBattleMenu();
void DrawMainBattleBackground(void);
void LoadBattleTextboxAndBackground();
void InitLinkBattleVsScreen(u8);
void DrawBattleEntryBackground();

// src/battle_2.o
void CB2_InitBattle(void);
void CB2_InitBattleInternal(void);
void CB2_HandleStartBattle(void);
void sub_800F104(void);
void CB2_HandleStartMultiBattle(void);
void BattleMainCB2(void);
void sub_800F838(struct Sprite *);
u8 CreateNPCTrainerParty(struct Pokemon *, u16);
void sub_800FCFC(void);
void nullsub_36(struct Sprite *);
void c2_8011A1C(void);
void sub_80101B8(void);
void c2_081284E0(void);
void sub_8010278(struct Sprite *);
void sub_80102AC(struct Sprite *);
void nullsub_37(struct Sprite *);
void sub_8010320(struct Sprite *);
void sub_8010494(struct Sprite *);
void sub_801053C(struct Sprite *);
void oac_poke_ally_(struct Sprite *);
void nullsub_86(struct Sprite *);
void objc_dp11b_pingpong(struct Sprite *);
void nullsub_41(void);
void sub_8010800(void);
void BattleMainCB1(void);
void BattleStartClearSetData(void);
void bc_8012FAC(void);
void sub_8011384(void);
void bc_801333C(void);
void bc_battle_begin_message(void);
void bc_8013568(void);
void sub_8011800(void);
void sub_8011834(void);
void bc_801362C(void);
void sub_8011970(void);
void sub_80119B4(void);
void BattleBeginFirstTurn(void);
void BattleTurnPassed(void);
void RunBattleScriptCommands_PopCallbacksStack(void);
void RunBattleScriptCommands(void);
bool8 TryRunFromBattle(u8 bank);

// asm/battle_2.o
void sub_8012324(void);
void SwapTurnOrder(u8, u8);
u8 GetWhoStrikesFirst(u8, u8, u8);

void debug_sub_8010800(void);

// asm/battle_3.o
u8 CheckMoveLimitations(u8 bank, u8 unusableMoves, u8 check);
u8 DoFieldEndTurnEffects(void);
u8 TurnBasedEffects(void);
u8 HandleFaintedMonActions();
u8 AbilityBattleEffects(u8 caseID, u8 bank, u8 ability, u8 special, u16 move);
u8 ItemBattleEffects(u8 caseID, u8 bank, bool8 moveTurn);
u8 GetMoveTarget(u16 move, u8 useMoveTarget);

// asm/battle_4.o
void AI_CalcDmg(u8, u8);
u8 TypeCalc(u16 move, u8 bank_atk, u8 bank_def);
u8 GetBattlerTurnOrderNum(u8 bank);

// asm/battle_5.o
void BattleControllerDummy(void);
void SetBankFuncToPlayerBufferRunCommand(void);
void sub_802C098();
void Task_PlayerController_RestoreBgmAfterCry(u8);
void sub_802E3E4(u8, int);
void nullsub_8(u8);
void sub_802E414(void);
void sub_802E424(void);

// asm/battle_7.o
void InitAndLaunchSpecialAnimation(u8 a, u8 b, u8 c, u8 d);
void nullsub_9(u16);
void nullsub_10(int);
void LoadBattleBarGfx(u8);
u8 battle_load_something();
void sub_8031F88(u8);
void HandleLowHpMusicChange(struct Pokemon *, u8);
void sub_8032638();
void sub_8032AA8(u8, u8);
void SetBankFuncToOpponentBufferRunCommand(void);
void BattleStopLowHpSound(void);
void sub_8031FC4(u8, u8, bool8);
void sub_8032984(u8, u16);
void refresh_graphics_maybe(u8, u8, u8);
void sub_80324E0(u8 a);

void SetBankFuncToLinkOpponentBufferRunCommand(void);

void GameClear(void);

#endif // GUARD_BATTLE_H
