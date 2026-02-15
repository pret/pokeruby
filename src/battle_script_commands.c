#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_message.h"
#include "battle_string_ids.h"
#include "battle_script_commands.h"
#include "battle_util.h"
#include "constants/battle_move_effects.h"
#include "constants/moves.h"
#include "constants/abilities.h"
#include "item.h"
#include "constants/items.h"
#include "data2.h"
#include "constants/hold_effects.h"
#include "random.h"
#include "battle_controllers.h"
#include "constants/species.h"
#include "pokemon.h"
#include "text.h"
#include "palette.h"
#include "main.h"
#include "constants/songs.h"
#include "sound.h"
#include "task.h"
#include "decompress.h"
#include "string_util.h"
#include "pokemon_summary_screen.h"
#include "naming_screen.h"
#include "ewram.h"
#include "util.h"

// TODO: put this into battle_controllers.h

#define RET_VALUE_LEVELLED_UP   11

//extern needed variables
extern u8 gUnknown_02023A14_50;
extern u8 gCritMultiplier;
extern s32 gBattleMoveDamage;
extern u32 gStatuses3[MAX_BATTLERS_COUNT];
extern u16 gBattleTypeFlags;
extern const struct BaseStats gBaseStats[];
extern struct BattleEnigmaBerry gEnigmaBerries[MAX_BATTLERS_COUNT];
extern struct BattlePokemon gBattleMons[MAX_BATTLERS_COUNT];
extern u8 gActiveBattler;
extern u32 gBattleControllerExecFlags;
extern u8 gBattlersCount;
extern u16 gBattlerPartyIndexes[MAX_BATTLERS_COUNT];
extern u8 gBattlerByTurnOrder[MAX_BATTLERS_COUNT];
extern u8 gActionsByTurnOrder[MAX_BATTLERS_COUNT];
extern u16 gCurrentMove;
extern u8 gLastUsedAbility;
extern u16 gBattleWeather;
extern u8 gPotentialItemEffectBattler;
extern u8 gEffectBattler;
extern u8 gAbsentBattlerFlags;
extern u8 gMultiHitCounter;
extern u16 gLastMoves[4];
extern u16 gLockedMoves[4];
extern u16 gChosenMovesByBanks[4];
extern u16 gSideStatuses[2];
extern u16 gPauseCounterBattle;
extern u16 gPaydayMoney;
extern u16 gRandomTurnNumber;
extern u8 gBattleOutcome;
extern u8 gBattleTerrain;
extern u16 gTrainerBattleOpponent;
extern u8 gBattlerAttacker;
extern u8 gBattlerTarget;
extern const u8* gBattlescriptCurrInstr;
extern u8 gCurrMovePos;
extern u8 gCurrentActionFuncId;
extern u32 gHitMarker;
extern u8 gMoveResultFlags;
extern u8 gBattleCommunication[];
extern u16 gLastLandedMoves[4];
extern u16 gLastHitByType[4];
extern u8 gPotentialItemEffectBattler;
extern u16 gDynamicBasePower;
extern const u8 gTypeEffectiveness[];
extern u16 gLastUsedItem;
extern u16 gBattleMovePower;
extern s32 gHpDealt;
extern s32 gTakenDmg[MAX_BATTLERS_COUNT];
extern u8 gTakenDmgByBattler[MAX_BATTLERS_COUNT];
extern const u16 gMissStringIds[];
extern u8 gSentPokesToOpponent[2];
extern u8 gBank1;
extern u16 gExpShareExp;
extern u8 gBattleTextBuff1[];
extern u8 gBattleTextBuff2[];
extern u8 gBattleTextBuff3[];
extern u8 gLeveledUpInBattle;
extern void (*gBattleMainFunc)(void);
extern struct Window gWindowTemplate_Contest_MoveDescription;
extern const u8 BattleText_YesNo[];
extern u8 gPlayerPartyCount;
extern u16 gMoveToLearn; //move to learn

struct TrainerReward
{
    u8 trainerClass;
    u8 baseMoney;
};

extern const struct TrainerReward gTrainerMoney[];
extern u16 gRandomMove;
extern u8* gBattleScriptsForMoveEffects[];
extern u16 gChosenMove; //last used move in battle
extern u8 gBattlerInMenuId;
extern u8 gActionForBanks[4];
extern u16 gLastPrintedMoves[4]; //last used moves 2, used by sketch
extern u16 gLastResultingMoves[4]; //last used moves by banks, another one
extern u8 gCurrentTurnActionNumber;
extern u16 gTrappingMoves[];

extern u8 BattleScript_MoveEffectSleep[];
extern u8 BattleScript_MoveEffectPoison[];
extern u8 BattleScript_MoveEffectBurn[];
extern u8 BattleScript_MoveEffectFreeze[];
extern u8 BattleScript_MoveEffectParalysis[];
extern u8 BattleScript_MoveEffectToxic[];
extern u8 BattleScript_MoveEffectConfusion[];
extern u8 BattleScript_MoveEffectUproar[];
extern u8 BattleScript_MoveEffectWrap[];
extern u8 BattleScript_MoveEffectPayDay[];
extern u8 BattleScript_MoveEffectRecoil33[];

//extern functions
u8 AtkCanceller_UnableToUseMove(void);
void PressurePPLose(u8 bank_atk, u8 bank_def, u16 move);
void CancelMultiTurnMoves(u8 bank);
void BattleScriptPush(const u8* BS_ptr);
void BattleScriptPushCursor(void);
void RecordAbilityBattle(u8 bank, u8 ability);
void RecordItemEffectBattle(u8 bank, u8 holdEffect);
static bool8 IsTwoTurnsMove(u16 move);
static void TrySetDestinyBondToHappen(void);
static void CheckWonderGuardAndLevitate(void);
u8 GetBattlerPosition(u8 bank);
u8 GetBattlerSide(u8 bank);
u8 GetBattlerForBattleScript(u8 bankValue);
s32 CalculateBaseDamage(struct BattlePokemon *attacker, struct BattlePokemon *defender, u32 move, u16 a4, u16 powerOverride, u8 typeOverride, u8 bank_atk, u8 bank_def);
static u8 AttacksThisTurn(u8 bank, u16 move); //Note: returns 1 if it's a charging turn, otherwise 2
void UndoEffectsAfterFainting(void);
void BattleStopLowHpSound(void);
void PlayBGM(u16 songID);
void MonGainEVs(struct Pokemon*, u16 defeatedSpecies);
extern u8 gBattleBufferB[4][0x200];
void HandleLowHpMusicChange(struct Pokemon*, u8 bank);
bool8 IsTradedMon(struct Pokemon*);
void BattleScriptPop(void);
void SwitchInClearSetData(void);
u8 GetSetPokedexFlag(u16 nationalNum, u8 caseID);
u16 SpeciesToNationalPokedexNum(u16 species);
u8 sub_803FC34(u8 bank);
u16 sub_803FBFC(u8 a);
u8 GetBattlerAtPosition(u8 ID);
void sub_8012258(u8);
//MonTryLearningNewMove teach poke a move
u16 GiveMoveToBattleMon(struct BattlePokemon *mon, u16 move);
void IncrementGameStat(u8 index);
u8 GetScaledHPFraction(s16 hp, s16 maxhp, u8 scale);
u16 GetPokedexHeightWeight(u16 national_num, u8 heightweight);
u8 MenuCursor_Create814A5C0(u8 a1, u16 a2, u8 a3, u16 a4, u8 a5);
void DestroyMenuCursor(void);
void sub_802BC6C(void);
u8 sub_809FA30(void);
bool32 IsHMMove2(u16 move);
void sub_802BBD4(u8 r0, u8 r1, u8 r2, u8 r3, u8 sp0);
void nullsub_6(void);
void ReshowBattleScreenAfterMenu(void);
void BattleMainCB2(void);
void AddMoney(u32* moneySaveblock, u32 to_give);
u8 CountAliveMons(u8 caseID);
void PokemonUseItemEffects(struct Pokemon*, u16 item, u8 partyID, u8 r3, u8 sp);
u8 CanRunFromBattle(void);
u8 GetMoveTarget(u16 move, u8 targetbyte); //get target of move
u8 CastformDataTypeChange(u8 bank);
u8 Overworld_GetMapTypeOfSaveblockLocation(void);
u8 CalculatePlayerPartyCount(void);
u16 Sqrt(u32 num);
u8 sub_809070C(u16 nationalNum, u32 TiD, u32 PiD); //task prepare poke dex display
void MenuCursor_SetPos814A880(u8 a1, u8 a2);
u8 CheckMoveLimitations(u8 bank, u8 unusable_moves, u8 flags);
bool8 IsLinkDoubleBattle(void);
void sub_8094B6C(u8 bank, u8 partyID, u8 r2);

//extern BattleScripts
extern u8 BattleScript_MoveEnd[];
extern u8 BattleScript_NoPPForMove[];
extern u8 BattleScript_MagicCoatBounce[];
extern u8 BattleScript_TookAttack[];
extern u8 BattleScript_SnatchedMove[];
extern u8 BattleScript_Pausex20[];
extern u8 BattleScript_SubstituteFade[];
extern u8 BattleScript_HangedOnMsg[];
extern u8 BattleScript_OneHitKOMsg[];
extern u8 BattleScript_EnduredMsg[];
extern u8 BattleScript_PSNPrevention[];
extern u8 BattleScript_BRNPrevention[];
extern u8 BattleScript_PRLZPrevention[];
extern u8 BattleScript_FlinchPrevention[];
extern u8 BattleScript_StatUp[];
extern u8 BattleScript_StatDown[];
extern u8 BattleScript_NoItemSteal[];
extern u8 BattleScript_ItemSteal[];
extern u8 BattleScript_RapidSpinAway[];
extern u8 BattleScript_TargetPRLZHeal[];
extern u8 BattleScript_KnockedOff[];
extern u8 BattleScript_LevelUp[];
extern u8 BattleScript_WrapFree[];
extern u8 BattleScript_LeechSeedFree[];
extern u8 BattleScript_SpikesFree[];
extern u8 BattleScript_ButItFailed[];
extern u8 BattleScript_ObliviousPreventsAttraction[];
extern u8 BattleScript_MistProtected[];
extern u8 BattleScript_AbilityNoStatLoss[];
extern u8 BattleScript_AbilityNoSpecificStatLoss[];
extern u8 BattleScript_TrainerBallBlock[];
extern u8 BattleScript_WallyBallThrow[];
extern u8 BattleScript_SuccessBallThrow[];
extern u8 BattleScript_ShakeBallThrow[];
extern u8 BattleScript_AllStatsUp[];
extern u8 BattleScript_AtkDefDown[];
extern u8 BattleScript_SAtkDown2[];

extern u8 BattleScript_SpikesOnTarget[]; //spikes1
extern u8 BattleScript_SpikesOnAttacker[]; //spikes2
extern u8 BattleScript_SpikesOngBank1[]; //spikes3
extern u8 BattleScript_HitFromCritCalc[]; //present dmg
extern u8 BattleScript_AlreadyAtFullHp[]; //present full hp
extern u8 BattleScript_PresentHealTarget[]; //present hp heal
extern u8 BattleScript_MoveMissedPause[];
extern u8 BattleScript_CastformChange[];
extern u8 BattleScript_DampStopsExplosion[];
extern u8 BattleScript_SuccessForceOut[]; //bs random switchout
extern u8 BattleScript_PrintPayDayMoneyString[]; //bs payday money give
extern u8 BattleScript_FaintAttacker[];
extern u8 BattleScript_FaintTarget[];
extern u8 BattleScript_DestinyBondTakesLife[];
extern u8 BattleScript_GrudgeTakesPp[];

// read via orr
#define BSScriptRead32(ptr) ((ptr)[0] | (ptr)[1] << 8 | (ptr)[2] << 16 | (ptr)[3] << 24)
#define BSScriptRead16(ptr) ((ptr)[0] | ((ptr)[1] << 8))
#define BSScriptReadPtr(ptr) ((void *)BSScriptRead32(ptr))

// read via add
#define BS2ScriptRead32(ptr) ((ptr)[0] + ((ptr)[1] << 8) + ((ptr)[2] << 16) + ((ptr)[3] << 24))
#define BS2ScriptRead16(ptr) ((ptr)[0] + ((ptr)[1] << 8))
#define BS2ScriptReadPtr(ptr) ((void *)BS2ScriptRead32(ptr))

#define DEFENDER_IS_PROTECTED ((gProtectStructs[gBattlerTarget].protected && gBattleMoves[gCurrentMove].flags & F_AFFECTED_BY_PROTECT))

//array entries for battle communication
#define MOVE_EFFECT_BYTE    0x3
#define MULTISTRING_CHOOSER 0x5
#define MSG_DISPLAY         0x7

#define TARGET_SELECTED         0x0
#define TARGET_DEPENDS          0x1
#define MOVE_TARGET_BOTH             0x8
#define MOVE_TARGET_FOES_AND_ALLY    0x20
#define MOVE_TARGET_OPPONENTS_FIELD  0x40

#define TYPE_FORESIGHT  0xFE
#define TYPE_ENDTABLE   0xFF

#define CMP_EQUAL               0x0
#define CMP_NOT_EQUAL           0x1
#define CMP_GREATER_THAN        0x2
#define CMP_LESS_THAN           0x3
#define CMP_COMMON_BITS         0x4
#define CMP_NO_COMMON_BITS      0x5

#define uBYTE0_16(value)(( (u8) (((u16)(value) & (0x000000FF)) >> 0x00)))
#define uBYTE1_16(value)(( (u8) (((u16)(value) & (0x0000FF00)) >> 0x08)))

#define uBYTE0_32(value)(( (u8) (((u32)(value) & (0x000000FF)) >> 0x00)))
#define uBYTE1_32(value)(( (u8) (((u32)(value) & (0x0000FF00)) >> 0x08)))
#define uBYTE2_32(value)(( (u8) (((u32)(value) & (0x00FF0000)) >> 0x10)))
#define uBYTE3_32(value)(( (u8) (((u32)(value) & (0xFF000000)) >> 0x18)))

#define sBYTE0_16(value)(( (u8) (((s16)(value) & (0x000000FF)) >> 0x00)))
#define sBYTE1_16(value)(( (u8) (((s16)(value) & (0x0000FF00)) >> 0x08)))

#define sBYTE0_32(value)(( (u8) (((s32)(value) & (0x000000FF)) >> 0x00)))
#define sBYTE1_32(value)(( (u8) (((s32)(value) & (0x0000FF00)) >> 0x08)))
#define sBYTE2_32(value)(( (u8) (((s32)(value) & (0x00FF0000)) >> 0x10)))
#define sBYTE3_32(value)(( (u8) (((s32)(value) & (0xFF000000)) >> 0x18)))

#define RecordAbilitySetField6(ability, fieldValue) \
(gLastUsedAbility = ability, gBattleCommunication[6] = fieldValue, RecordAbilityBattle(gBattlerTarget, ability))

static void atk00_attackcanceler(void);
static void atk01_accuracycheck(void);
static void atk02_attackstring(void);
static void atk03_ppreduce(void);
static void atk04_critcalc(void);
static void atk05_damagecalc(void);
static void atk06_typecalc(void);
static void atk07_adjustnormaldamage(void);
static void atk08_adjustnormaldamage2(void);
static void atk09_attackanimation(void);
static void atk0A_waitanimation(void);
static void atk0B_healthbarupdate(void);
static void atk0C_datahpupdate(void);
static void atk0D_critmessage(void);
static void atk0E_effectivenesssound(void);
static void atk0F_resultmessage(void);
static void atk10_printstring(void);
static void atk11_printselectionstring(void);
static void atk12_waitmessage(void);
static void atk13_printfromtable(void);
static void atk14_printselectionstringfromtable(void);
static void atk15_seteffectwithchance(void);
static void atk16_seteffectprimary(void);
static void atk17_seteffectsecondary(void);
static void atk18_clearstatusfromeffect(void);
static void atk19_tryfaintmon(void);
static void atk1A_dofaintanimation(void);
static void atk1B_cleareffectsonfaint(void);
static void atk1C_jumpifstatus(void);
static void atk1D_jumpifstatus2(void);
static void atk1E_jumpifability(void);
static void atk1F_jumpifsideaffecting(void);
static void atk20_jumpifstat(void);
static void atk21_jumpifstatus3condition(void);
static void atk22_jumpiftype(void);
static void atk23_getexp(void);
static void atk24(void);
static void atk25_movevaluescleanup(void);
static void atk26_setmultihit(void);
static void atk27_decrementmultihit(void);
static void atk28_goto(void);
static void atk29_jumpifbyte(void);
static void atk2A_jumpifhalfword(void);
static void atk2B_jumpifword(void);
static void atk2C_jumpifarrayequal(void);
static void atk2D_jumpifarraynotequal(void);
static void atk2E_setbyte(void);
static void atk2F_addbyte(void);
static void atk30_subbyte(void);
static void atk31_copyarray(void);
static void atk32_copyarraywithindex(void);
static void atk33_orbyte(void);
static void atk34_orhalfword(void);
static void atk35_orword(void);
static void atk36_bicbyte(void);
static void atk37_bichalfword(void);
static void atk38_bicword(void);
static void atk39_pause(void);
static void atk3A_waitstate(void);
static void atk3B_healthbar_update(void);
static void atk3C_return(void);
static void atk3D_end(void);
static void atk3E_end2(void);
static void atk3F_end3(void);
static void atk40_jumpifaffectedbyprotect(void);
static void atk41_call(void);
static void atk42_jumpiftype2(void);
static void atk43_jumpifabilitypresent(void);
static void atk44_endselectionscript(void);
static void atk45_playanimation(void);
static void atk46_playanimation2(void);
static void atk47_setgraphicalstatchangevalues(void);
static void atk48_playstatchangeanimation(void);
void atk49_moveend(void);
static void atk4A_typecalc2(void);
static void atk4B_returnatktoball(void);
static void atk4C_getswitchedmondata(void);
static void atk4D_switchindataupdate(void);
static void atk4E_switchinanim(void);
static void atk4F_jumpifcantswitch(void);
static void atk50_openpartyscreen(void);
static void atk51_switchhandleorder(void);
static void atk52_switchineffects(void);
static void atk53_trainerslidein(void);
static void atk54_playse(void);
static void atk55_fanfare(void);
static void atk56_playfaintcry(void);
static void atk57(void);
static void atk58_returntoball(void);
void atk59_handlelearnnewmove(void);
static void atk5A_yesnoboxlearnmove(void);
static void atk5B_yesnoboxstoplearningmove(void);
static void atk5C_hitanimation(void);
static void atk5D_getmoneyreward(void);
static void atk5E(void);
static void atk5F_swapattackerwithtarget(void);
static void atk60_incrementgamestat(void);
static void atk61_drawpartystatussummary(void);
static void atk62_hidepartystatussummary(void);
static void atk63_jumptorandomattack(void);
static void atk64_statusanimation(void);
static void atk65_status2animation(void);
static void atk66_chosenstatusanimation(void);
static void atk67_yesnobox(void);
static void atk68_cancelallactions(void);
static void atk69_adjustsetdamage(void);
void atk6A_removeitem(void);
static void atk6B_atknameinbuff1(void);
static void atk6C_drawlvlupbox(void);
static void atk6D_resetsentmonsvalue(void);
static void atk6E_setatktoplayer0(void);
static void atk6F_makevisible(void);
static void atk70_recordlastability(void);
static void atk71_buffermovetolearn(void);
static void atk72_jumpifplayerran(void);
static void atk73_hpthresholds(void);
static void atk74_hpthresholds2(void);
static void atk75_useitemonopponent(void);
static void atk76_various(void);
static void atk77_setprotectlike(void);
static void atk78_faintifabilitynotdamp(void);
static void atk79_setatkhptozero(void);
static void atk7A_jumpifnexttargetvalid(void);
static void atk7B_tryhealhalfhealth(void);
static void atk7C_trymirrormove(void);
static void atk7D_setrain(void);
static void atk7E_setreflect(void);
static void atk7F_setseeded(void);
static void atk80_manipulatedamage(void);
static void atk81_trysetrest(void);
static void atk82_jumpifnotfirstturn(void);
static void atk83_nop(void);
static void atk84_jumpifcantmakeasleep(void);
static void atk85_stockpile(void);
static void atk86_stockpiletobasedamage(void);
static void atk87_stockpiletohpheal(void);
static void atk88_negativedamage(void);
static u8 ChangeStatBuffs(s8 statValue, u8 statId, u8 flags, const u8 *BS_ptr);
static void atk89_statbuffchange(void);
static void atk8A_normalisebuffs(void);
static void atk8B_setbide(void);
static void atk8C_confuseifrepeatingattackends(void);
static void atk8D_setmultihitcounter(void);
static void atk8E_initmultihitstring(void);
static void atk8F_forcerandomswitch(void);
static void atk90_tryconversiontypechange(void);
static void atk91_givepaydaymoney(void);
static void atk92_setlightscreen(void);
static void atk93_tryKO(void);
static void atk94_damagetohalftargethp(void);
static void atk95_setsandstorm(void);
static void atk96_weatherdamage(void);
static void atk97_tryinfatuating(void);
static void atk98_updatestatusicon(void);
static void atk99_setmist(void);
static void atk9A_setfocusenergy(void);
static void atk9B_transformdataexecution(void);
static void atk9C_setsubstitute(void);
static void atk9D_mimicattackcopy(void);
static void atk9E_metronome(void);
static void atk9F_dmgtolevel(void);
static void atkA0_psywavedamageeffect(void);
static void atkA1_counterdamagecalculator(void);
static void atkA2_mirrorcoatdamagecalculator(void);
static void atkA3_disablelastusedattack(void);
static void atkA4_trysetencore(void);
static void atkA5_painsplitdmgcalc(void);
static void atkA6_settypetorandomresistance(void);
static void atkA7_setalwayshitflag(void);
static void atkA8_copymovepermanently(void);
static void atkA9_trychoosesleeptalkmove(void);
static void atkAA_setdestinybond(void);
static void atkAB_trysetdestinybondtohappen(void);
static void atkAC_remaininghptopower(void);
static void atkAD_tryspiteppreduce(void);
static void atkAE_healpartystatus(void);
static void atkAF_cursetarget(void);
static void atkB0_trysetspikes(void);
static void atkB1_setforesight(void);
static void atkB2_trysetperishsong(void);
static void atkB3_rolloutdamagecalculation(void);
static void atkB4_jumpifconfusedandstatmaxed(void);
static void atkB5_furycuttercalc(void);
static void atkB6_happinesstodamagecalculation(void);
static void atkB7_presentdamagecalculation(void);
static void atkB8_setsafeguard(void);
static void atkB9_magnitudedamagecalculation(void);
static void atkBA_jumpifnopursuitswitchdmg(void);
static void atkBB_setsunny(void);
static void atkBC_maxattackhalvehp(void);
static void atkBD_copyfoestats(void);
static void atkBE_rapidspinfree(void);
static void atkBF_setdefensecurlbit(void);
static void atkC0_recoverbasedonsunlight(void);
static void atkC1_hiddenpowercalc(void);
static void atkC2_selectfirstvalidtarget(void);
static void atkC3_trysetfutureattack(void);
static void atkC4_trydobeatup(void);
static void atkC5_setsemiinvulnerablebit(void);
static void atkC6_clearsemiinvulnerablebit(void);
static void atkC7_setminimize(void);
static void atkC8_sethail(void);
static void atkC9_jumpifattackandspecialattackcannotfall(void);
static void atkCA_setforcedtarget(void);
static void atkCB_setcharge(void);
static void atkCC_callterrainattack(void);
static void atkCD_cureifburnedparalysedorpoisoned(void);
static void atkCE_settorment(void);
static void atkCF_jumpifnodamage(void);
static void atkD0_settaunt(void);
static void atkD1_trysethelpinghand(void);
static void atkD2_tryswapitems(void);
static void atkD3_trycopyability(void);
static void atkD4_trywish(void);
static void atkD5_trysetroots(void);
static void atkD6_doubledamagedealtifdamaged(void);
static void atkD7_setyawn(void);
static void atkD8_setdamagetohealthdifference(void);
static void atkD9_scaledamagebyhealthratio(void);
static void atkDA_tryswapabilities(void);
static void atkDB_tryimprison(void);
static void atkDC_trysetgrudge(void);
static void atkDD_weightdamagecalculation(void);
static void atkDE_assistattackselect(void);
static void atkDF_trysetmagiccoat(void);
static void atkE0_trysetsnatch(void);
static void atkE1_trygetintimidatetarget(void);
static void atkE2_switchoutabilities(void);
static void atkE3_jumpifhasnohp(void);
static void atkE4_getsecretpowereffect(void);
static void atkE5_pickup(void);
static void atkE6_docastformchangeanimation(void);
static void atkE7_trycastformdatachange(void);
static void atkE8_settypebasedhalvers(void);
static void atkE9_setweatherballtype(void);
static void atkEA_tryrecycleitem(void);
static void atkEB_settypetoterrain(void);
static void atkEC_pursuitrelated(void);
static void atkEF_snatchsetbattlers(void);
static void atkEE_removelightscreenreflect(void);
void atkEF_handleballthrow(void);
static void atkF0_givecaughtmon(void);
static void atkF1_trysetcaughtmondexflags(void);
static void atkF2_displaydexinfo(void);
static void atkF3_trygivecaughtmonnick(void);
static void atkF4_subattackerhpbydmg(void);
static void atkF5_removeattackerstatus1(void);
static void atkF6_finishaction(void);
static void atkF7_finishturn(void);

void (* const gBattleScriptingCommandsTable[])(void) =
{
    atk00_attackcanceler,
    atk01_accuracycheck,
    atk02_attackstring,
    atk03_ppreduce,
    atk04_critcalc,
    atk05_damagecalc,
    atk06_typecalc,
    atk07_adjustnormaldamage,
    atk08_adjustnormaldamage2,
    atk09_attackanimation,
    atk0A_waitanimation,
    atk0B_healthbarupdate,
    atk0C_datahpupdate,
    atk0D_critmessage,
    atk0E_effectivenesssound,
    atk0F_resultmessage,
    atk10_printstring,
    atk11_printselectionstring,
    atk12_waitmessage,
    atk13_printfromtable,
    atk14_printselectionstringfromtable,
    atk15_seteffectwithchance,
    atk16_seteffectprimary,
    atk17_seteffectsecondary,
    atk18_clearstatusfromeffect,
    atk19_tryfaintmon,
    atk1A_dofaintanimation,
    atk1B_cleareffectsonfaint,
    atk1C_jumpifstatus,
    atk1D_jumpifstatus2,
    atk1E_jumpifability,
    atk1F_jumpifsideaffecting,
    atk20_jumpifstat,
    atk21_jumpifstatus3condition,
    atk22_jumpiftype,
    atk23_getexp,
    atk24,
    atk25_movevaluescleanup,
    atk26_setmultihit,
    atk27_decrementmultihit,
    atk28_goto,
    atk29_jumpifbyte,
    atk2A_jumpifhalfword,
    atk2B_jumpifword,
    atk2C_jumpifarrayequal,
    atk2D_jumpifarraynotequal,
    atk2E_setbyte,
    atk2F_addbyte,
    atk30_subbyte,
    atk31_copyarray,
    atk32_copyarraywithindex,
    atk33_orbyte,
    atk34_orhalfword,
    atk35_orword,
    atk36_bicbyte,
    atk37_bichalfword,
    atk38_bicword,
    atk39_pause,
    atk3A_waitstate,
    atk3B_healthbar_update,
    atk3C_return,
    atk3D_end,
    atk3E_end2,
    atk3F_end3,
    atk40_jumpifaffectedbyprotect,
    atk41_call,
    atk42_jumpiftype2,
    atk43_jumpifabilitypresent,
    atk44_endselectionscript,
    atk45_playanimation,
    atk46_playanimation2,
    atk47_setgraphicalstatchangevalues,
    atk48_playstatchangeanimation,
    atk49_moveend,
    atk4A_typecalc2,
    atk4B_returnatktoball,
    atk4C_getswitchedmondata,
    atk4D_switchindataupdate,
    atk4E_switchinanim,
    atk4F_jumpifcantswitch,
    atk50_openpartyscreen,
    atk51_switchhandleorder,
    atk52_switchineffects,
    atk53_trainerslidein,
    atk54_playse,
    atk55_fanfare,
    atk56_playfaintcry,
    atk57,
    atk58_returntoball,
    atk59_handlelearnnewmove,
    atk5A_yesnoboxlearnmove,
    atk5B_yesnoboxstoplearningmove,
    atk5C_hitanimation,
    atk5D_getmoneyreward,
    atk5E,
    atk5F_swapattackerwithtarget,
    atk60_incrementgamestat,
    atk61_drawpartystatussummary,
    atk62_hidepartystatussummary,
    atk63_jumptorandomattack,
    atk64_statusanimation,
    atk65_status2animation,
    atk66_chosenstatusanimation,
    atk67_yesnobox,
    atk68_cancelallactions,
    atk69_adjustsetdamage,
    atk6A_removeitem,
    atk6B_atknameinbuff1,
    atk6C_drawlvlupbox,
    atk6D_resetsentmonsvalue,
    atk6E_setatktoplayer0,
    atk6F_makevisible,
    atk70_recordlastability,
    atk71_buffermovetolearn,
    atk72_jumpifplayerran,
    atk73_hpthresholds,
    atk74_hpthresholds2,
    atk75_useitemonopponent,
    atk76_various,
    atk77_setprotectlike,
    atk78_faintifabilitynotdamp,
    atk79_setatkhptozero,
    atk7A_jumpifnexttargetvalid,
    atk7B_tryhealhalfhealth,
    atk7C_trymirrormove,
    atk7D_setrain,
    atk7E_setreflect,
    atk7F_setseeded,
    atk80_manipulatedamage,
    atk81_trysetrest,
    atk82_jumpifnotfirstturn,
    atk83_nop,
    atk84_jumpifcantmakeasleep,
    atk85_stockpile,
    atk86_stockpiletobasedamage,
    atk87_stockpiletohpheal,
    atk88_negativedamage,
    atk89_statbuffchange,
    atk8A_normalisebuffs,
    atk8B_setbide,
    atk8C_confuseifrepeatingattackends,
    atk8D_setmultihitcounter,
    atk8E_initmultihitstring,
    atk8F_forcerandomswitch,
    atk90_tryconversiontypechange,
    atk91_givepaydaymoney,
    atk92_setlightscreen,
    atk93_tryKO,
    atk94_damagetohalftargethp,
    atk95_setsandstorm,
    atk96_weatherdamage,
    atk97_tryinfatuating,
    atk98_updatestatusicon,
    atk99_setmist,
    atk9A_setfocusenergy,
    atk9B_transformdataexecution,
    atk9C_setsubstitute,
    atk9D_mimicattackcopy,
    atk9E_metronome,
    atk9F_dmgtolevel,
    atkA0_psywavedamageeffect,
    atkA1_counterdamagecalculator,
    atkA2_mirrorcoatdamagecalculator,
    atkA3_disablelastusedattack,
    atkA4_trysetencore,
    atkA5_painsplitdmgcalc,
    atkA6_settypetorandomresistance,
    atkA7_setalwayshitflag,
    atkA8_copymovepermanently,
    atkA9_trychoosesleeptalkmove,
    atkAA_setdestinybond,
    atkAB_trysetdestinybondtohappen,
    atkAC_remaininghptopower,
    atkAD_tryspiteppreduce,
    atkAE_healpartystatus,
    atkAF_cursetarget,
    atkB0_trysetspikes,
    atkB1_setforesight,
    atkB2_trysetperishsong,
    atkB3_rolloutdamagecalculation,
    atkB4_jumpifconfusedandstatmaxed,
    atkB5_furycuttercalc,
    atkB6_happinesstodamagecalculation,
    atkB7_presentdamagecalculation,
    atkB8_setsafeguard,
    atkB9_magnitudedamagecalculation,
    atkBA_jumpifnopursuitswitchdmg,
    atkBB_setsunny,
    atkBC_maxattackhalvehp,
    atkBD_copyfoestats,
    atkBE_rapidspinfree,
    atkBF_setdefensecurlbit,
    atkC0_recoverbasedonsunlight,
    atkC1_hiddenpowercalc,
    atkC2_selectfirstvalidtarget,
    atkC3_trysetfutureattack,
    atkC4_trydobeatup,
    atkC5_setsemiinvulnerablebit,
    atkC6_clearsemiinvulnerablebit,
    atkC7_setminimize,
    atkC8_sethail,
    atkC9_jumpifattackandspecialattackcannotfall,
    atkCA_setforcedtarget,
    atkCB_setcharge,
    atkCC_callterrainattack,
    atkCD_cureifburnedparalysedorpoisoned,
    atkCE_settorment,
    atkCF_jumpifnodamage,
    atkD0_settaunt,
    atkD1_trysethelpinghand,
    atkD2_tryswapitems,
    atkD3_trycopyability,
    atkD4_trywish,
    atkD5_trysetroots,
    atkD6_doubledamagedealtifdamaged,
    atkD7_setyawn,
    atkD8_setdamagetohealthdifference,
    atkD9_scaledamagebyhealthratio,
    atkDA_tryswapabilities,
    atkDB_tryimprison,
    atkDC_trysetgrudge,
    atkDD_weightdamagecalculation,
    atkDE_assistattackselect,
    atkDF_trysetmagiccoat,
    atkE0_trysetsnatch,
    atkE1_trygetintimidatetarget,
    atkE2_switchoutabilities,
    atkE3_jumpifhasnohp,
    atkE4_getsecretpowereffect,
    atkE5_pickup,
    atkE6_docastformchangeanimation,
    atkE7_trycastformdatachange,
    atkE8_settypebasedhalvers,
    atkE9_setweatherballtype,
    atkEA_tryrecycleitem,
    atkEB_settypetoterrain,
    atkEC_pursuitrelated,
    atkEF_snatchsetbattlers,
    atkEE_removelightscreenreflect,
    atkEF_handleballthrow,
    atkF0_givecaughtmon,
    atkF1_trysetcaughtmondexflags,
    atkF2_displaydexinfo,
    atkF3_trygivecaughtmonnick,
    atkF4_subattackerhpbydmg,
    atkF5_removeattackerstatus1,
    atkF6_finishaction,
    atkF7_finishturn,
};

struct StatFractions
{
    u8 dividend;
    u8 divisor;
};

static const struct StatFractions gAccuracyStageRatios[] =
{
    { 33, 100}, // -6
    { 36, 100}, // -5
    { 43, 100}, // -4
    { 50, 100}, // -3
    { 60, 100}, // -2
    { 75, 100}, // -1
    {  1,   1}, //  0
    {133, 100}, // +1
    {166, 100}, // +2
    {  2,   1}, // +3
    {233, 100}, // +4
    {133,  50}, // +5
    {  3,   1}, // +6
};

// The chance is 1/N for each stage.
static const u16 sCriticalHitChance[] = {16, 8, 4, 3, 2};

static const u32 sStatusFlagsForMoveEffects[] =
{
    0x00000000,
    STATUS1_SLEEP,
    STATUS1_POISON,
    STATUS1_BURN,
    STATUS1_FREEZE,
    STATUS1_PARALYSIS,
    STATUS1_TOXIC_POISON,
    STATUS2_CONFUSION,
    STATUS2_FLINCHED,
    0x00000000,
    STATUS2_UPROAR,
    0x00000000,
    STATUS2_MULTIPLETURNS,
    STATUS2_WRAPPED,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    STATUS2_RECHARGE,
    0x00000000,
    0x00000000,
    STATUS2_ESCAPE_PREVENTION,
    STATUS2_NIGHTMARE,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    STATUS2_LOCK_CONFUSE,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000
};

u8* const gMoveEffectBS_Ptrs[] =
{
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectPoison,
    BattleScript_MoveEffectBurn,
    BattleScript_MoveEffectFreeze,
    BattleScript_MoveEffectParalysis,
    BattleScript_MoveEffectToxic,
    BattleScript_MoveEffectConfusion,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectUproar,
    BattleScript_MoveEffectPayDay,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectWrap,
    BattleScript_MoveEffectRecoil33,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectSleep,
    BattleScript_MoveEffectRecoil33
};

const u8 sUnreferencedBitMask1[] = {0, 1, 3, 7, 0xF, 0x1F, 0x3F};

const u8 gLevelUpStatBoxStats[] =
{
    MON_DATA_MAX_HP, MON_DATA_SPATK, MON_DATA_ATK,
    MON_DATA_SPDEF, MON_DATA_DEF, MON_DATA_SPEED
};

static const u16 sProtectSuccessRates[] = {0xFFFF, 0x7FFF, 0x3FFF, 0x1FFF};

#define MIMIC_FORBIDDEN_END             0xFFFE
#define METRONOME_FORBIDDEN_END         0xFFFF
#define ASSIST_FORBIDDEN_END            0xFFFF

static const u16 sMovesForbiddenToCopy[] =
{
    MOVE_METRONOME,
    MOVE_STRUGGLE,
    MOVE_SKETCH,
    MOVE_MIMIC,
    MIMIC_FORBIDDEN_END,
    MOVE_COUNTER,
    MOVE_MIRROR_COAT,
    MOVE_PROTECT,
    MOVE_DETECT,
    MOVE_ENDURE,
    MOVE_DESTINY_BOND,
    MOVE_SLEEP_TALK,
    MOVE_THIEF,
    MOVE_FOLLOW_ME,
    MOVE_SNATCH,
    MOVE_HELPING_HAND,
    MOVE_COVET,
    MOVE_TRICK,
    MOVE_FOCUS_PUNCH,
    METRONOME_FORBIDDEN_END
};

static const u8 sFlailHpScaleToPowerTable[] = //reversal+flail HP thresholds to power
{
    1, 200,
    4, 150,
    9, 100,
    16, 80,
    32, 40,
    48, 20
};

static const u16 sNaturePowerMoves[] =
{
    MOVE_STUN_SPORE,
    MOVE_RAZOR_LEAF,
    MOVE_EARTHQUAKE,
    MOVE_HYDRO_PUMP,
    MOVE_SURF,
    MOVE_BUBBLE_BEAM,
    MOVE_ROCK_SLIDE,
    MOVE_SHADOW_BALL,
    MOVE_SWIFT,
    MOVE_SWIFT
};

// weight-based damage table for Low Kick
// format: min. weight (hectograms), base power
static const u16 sWeightToDamageTable[] =
{
    100, 20,
    250, 40,
    500, 60,
    1000, 80,
    2000, 100,
    0xFFFF, 0xFFFF
};

static const u16 sPickupItems[] =
{
    ITEM_SUPER_POTION, 30,
    ITEM_FULL_HEAL, 40,
    ITEM_ULTRA_BALL, 50,
    ITEM_RARE_CANDY, 60,
    ITEM_FULL_RESTORE, 70,
    ITEM_REVIVE, 80,
    ITEM_NUGGET, 90,
    ITEM_PROTEIN, 95,
    ITEM_PP_UP, 99,
    ITEM_KINGS_ROCK, 1
};

static const u8 sTerrainToType[] =
{
    TYPE_GRASS, // tall grass
    TYPE_GRASS, // long grass
    TYPE_GROUND, // sand
    TYPE_WATER, // underwater
    TYPE_WATER, // water
    TYPE_WATER, // pond water
    TYPE_ROCK, // rock
    TYPE_ROCK, // cave
    TYPE_NORMAL, // building
    TYPE_NORMAL, // plain
};

static const u8 sBallCatchBonuses[] =
{
    20, 15, 10, 15 // Ultra, Great, Poke, Safari
};

static void atk00_attackcanceler(void)
{
    s32 i;

    if (gBattleOutcome != 0)
    {
        gCurrentActionFuncId = B_ACTION_FINISHED;
        return;
    }
    if (gBattleMons[gBattlerAttacker].hp == 0 && !(gHitMarker & HITMARKER_NO_ATTACKSTRING))
    {
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        gBattlescriptCurrInstr = BattleScript_MoveEnd;
        return;
    }
    if (AtkCanceller_UnableToUseMove())
        return;
    if (AbilityBattleEffects(ABILITYEFFECT_MOVES_BLOCK, gBattlerTarget, 0, 0, 0))
        return;
    if (!gBattleMons[gBattlerAttacker].pp[gCurrMovePos] && gCurrentMove != MOVE_STRUGGLE && !(gHitMarker & (HITMARKER_ALLOW_NO_PP | HITMARKER_NO_ATTACKSTRING))
     && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
    {
        gBattlescriptCurrInstr = BattleScript_NoPPForMove;
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        return;
    }

    gHitMarker &= ~(HITMARKER_ALLOW_NO_PP);

    if (!(gHitMarker & HITMARKER_OBEYS) && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
    {
        i = IsMonDisobedient(); // why use the 'i' variable...?
        switch (i)
        {
        case 0:
            break;
        case 2:
            gHitMarker |= HITMARKER_OBEYS;
            return;
        default:
            gMoveResultFlags |= MOVE_RESULT_MISSED;
            return;
        }
    }

    gHitMarker |= HITMARKER_OBEYS;

    if (gProtectStructs[gBattlerTarget].bounceMove && gBattleMoves[gCurrentMove].flags & F_AFFECTED_BY_MAGIC_COAT)
    {
        PressurePPLose(gBattlerAttacker, gBattlerTarget, MOVE_MAGIC_COAT);
        gProtectStructs[gBattlerTarget].bounceMove = 0;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_MagicCoatBounce;
        return;
    }

    for (i = 0; i < gBattlersCount; i++)
    {
        if ((gProtectStructs[gBattlerByTurnOrder[i]].stealMove) && gBattleMoves[gCurrentMove].flags & F_AFFECTED_BY_SNATCH)
        {
            PressurePPLose(gBattlerAttacker, gBattlerByTurnOrder[i], MOVE_SNATCH);
            gProtectStructs[gBattlerByTurnOrder[i]].stealMove = 0;
            gBattleStruct->scriptingActive = gBattlerByTurnOrder[i];
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_SnatchedMove;
            return;
        }
    }

    if (gSpecialStatuses[gBattlerTarget].lightningRodRedirected)
    {
        gSpecialStatuses[gBattlerTarget].lightningRodRedirected = 0;
        gLastUsedAbility = ABILITY_LIGHTNING_ROD;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_TookAttack;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    else if (DEFENDER_IS_PROTECTED
     && (gCurrentMove != MOVE_CURSE || IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_GHOST))
     && ((!IsTwoTurnsMove(gCurrentMove) || (gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))))
    {
        CancelMultiTurnMoves(gBattlerAttacker);
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gLastLandedMoves[gBattlerTarget] = 0;
        gLastHitByType[gBattlerTarget] = 0;
        gBattleCommunication[6] = 1;
        gBattlescriptCurrInstr++;
    }
    else
    {
        gBattlescriptCurrInstr++;
    }
}

static void JumpIfMoveFailed(u8 adder, u16 move)
{
    const u8 *BS_ptr = gBattlescriptCurrInstr + adder;
    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
    {
        gLastLandedMoves[gBattlerTarget] = 0;
        gLastHitByType[gBattlerTarget] = 0;
        BS_ptr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        TrySetDestinyBondToHappen();
        if (AbilityBattleEffects(ABILITYEFFECT_ABSORBING, gBattlerTarget, 0, 0, move))
            return;
    }
    gBattlescriptCurrInstr = BS_ptr;
}

static void atk40_jumpifaffectedbyprotect(void)
{
    if (DEFENDER_IS_PROTECTED)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(5, 0);
        gBattleCommunication[6] = 1;
    }
    else
    {
        gBattlescriptCurrInstr += 5;
    }
}

static bool8 JumpIfMoveAffectedByProtect(u16 move)
{
    bool8 affected = FALSE;
    if (DEFENDER_IS_PROTECTED)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(7, move);
        gBattleCommunication[6] = 1;
        affected = TRUE;
    }
    return affected;
}

static bool8 AccuracyCalcHelper(u16 move)
{
    if (gStatuses3[gBattlerTarget] & STATUS3_ALWAYS_HITS && gDisableStructs[gBattlerTarget].battlerWithSureHit == gBattlerAttacker)
    {
        JumpIfMoveFailed(7, move);
        return TRUE;
    }

    if (!(gHitMarker & HITMARKER_IGNORE_ON_AIR) && gStatuses3[gBattlerTarget] & STATUS3_ON_AIR)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(7, move);
        return TRUE;
    }

    gHitMarker &= ~HITMARKER_IGNORE_ON_AIR;

    if (!(gHitMarker & HITMARKER_IGNORE_UNDERGROUND) && gStatuses3[gBattlerTarget] & STATUS3_UNDERGROUND)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(7, move);
        return TRUE;
    }

    gHitMarker &= ~HITMARKER_IGNORE_UNDERGROUND;

    if (!(gHitMarker & HITMARKER_IGNORE_UNDERWATER) && gStatuses3[gBattlerTarget] & STATUS3_UNDERWATER)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(7, move);
        return TRUE;
    }

    gHitMarker &= ~HITMARKER_IGNORE_UNDERWATER;

    if ((WEATHER_HAS_EFFECT && (gBattleWeather & B_WEATHER_RAIN) && gBattleMoves[move].effect == EFFECT_THUNDER)
     || (gBattleMoves[move].effect == EFFECT_ALWAYS_HIT || gBattleMoves[move].effect == EFFECT_VITAL_THROW))
    {
        JumpIfMoveFailed(7, move);
        return TRUE;
    }

    return FALSE;
}

static void atk01_accuracycheck(void)
{
    u16 move = T2_READ_16(gBattlescriptCurrInstr + 5);

    if (move == 0xFFFE || move == 0xFFFF)
    {
        if (gStatuses3[gBattlerTarget] & STATUS3_ALWAYS_HITS && move == 0xFFFF && gDisableStructs[gBattlerTarget].battlerWithSureHit == gBattlerAttacker)
            gBattlescriptCurrInstr += 7;
        else if (gStatuses3[gBattlerTarget] & (STATUS3_ON_AIR | STATUS3_UNDERGROUND | STATUS3_UNDERWATER))
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        else if (!JumpIfMoveAffectedByProtect(0))
            gBattlescriptCurrInstr += 7;
    }
    else
    {
        u8 type, moveAcc, holdEffect, quality;
        s8 buff;
        u16 calc;

        if (move == 0)
            move = gCurrentMove;

        GET_MOVE_TYPE(move, type);

        if (JumpIfMoveAffectedByProtect(move))
            return;
        if (AccuracyCalcHelper(move))
            return;

        if (gBattleMons[gBattlerTarget].status2 & STATUS2_FORESIGHT)
        {
            u8 acc = gBattleMons[gBattlerAttacker].statStages[STAT_STAGE_ACC];
            buff = acc;
        }
        else
        {
            u8 acc = gBattleMons[gBattlerAttacker].statStages[STAT_STAGE_ACC];
            buff = acc + 6 - gBattleMons[gBattlerTarget].statStages[STAT_STAGE_EVASION];
        }

        if (buff < 0)
            buff = 0;
        if (buff > 0xC)
            buff = 0xC;

        moveAcc = gBattleMoves[move].accuracy;
        // check Thunder on sunny weather
        if (WEATHER_HAS_EFFECT && gBattleWeather & B_WEATHER_SUN && gBattleMoves[move].effect == EFFECT_THUNDER)
            moveAcc = 50;

        calc = gAccuracyStageRatios[buff].dividend * moveAcc;
        calc /= gAccuracyStageRatios[buff].divisor;

        if (gBattleMons[gBattlerAttacker].ability == ABILITY_COMPOUND_EYES)
            calc = (calc * 130) / 100; // 1.3 compound eyes boost
        if (WEATHER_HAS_EFFECT && gBattleMons[gBattlerTarget].ability == ABILITY_SAND_VEIL && gBattleWeather & B_WEATHER_SANDSTORM)
            calc = (calc * 80) / 100; // 1.2 sand veil loss;
        if (gBattleMons[gBattlerAttacker].ability == ABILITY_HUSTLE && type < 9)
            calc = (calc * 80) / 100; // 1.2 hustle loss;

        if (gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY)
        {
            holdEffect = gEnigmaBerries[gBattlerTarget].holdEffect;
            quality = gEnigmaBerries[gBattlerTarget].holdEffectParam;
        }
        else
        {
            holdEffect = ItemId_GetHoldEffect(gBattleMons[gBattlerTarget].item);
            quality = ItemId_GetHoldEffectParam(gBattleMons[gBattlerTarget].item);
        }

        gPotentialItemEffectBattler = gBattlerTarget;

        if (holdEffect == HOLD_EFFECT_EVASION_UP)
            calc = (calc * (100 - quality)) / 100;

        // final calculation
        if ((Random() % 100 + 1) > calc)
        {
            gMoveResultFlags |= MOVE_RESULT_MISSED;
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE &&
                (gBattleMoves[move].target == 0x8 || gBattleMoves[move].target == 0x20))
                gBattleCommunication[6] = 2;
            else
                gBattleCommunication[6] = 0;
            CheckWonderGuardAndLevitate();
        }
        JumpIfMoveFailed(7, move);
    }
}

static void atk02_attackstring(void)
{
    if (gBattleControllerExecFlags)
         return;
    if (!(gHitMarker & (HITMARKER_NO_ATTACKSTRING | HITMARKER_ATTACKSTRING_PRINTED)))
    {
        PrepareStringBattle(4, gBattlerAttacker);
        gHitMarker |= HITMARKER_ATTACKSTRING_PRINTED;
    }
    gBattlescriptCurrInstr++;
    gBattleCommunication[MSG_DISPLAY] = 0;
}

static void atk03_ppreduce(void)
{
    s32 ppToDeduct = 1;

    if (gBattleControllerExecFlags)
        return;

    if (!gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure)
    {
        switch (gBattleMoves[gCurrentMove].target)
        {
        case MOVE_TARGET_FOES_AND_ALLY:
            ppToDeduct += AbilityBattleEffects(ABILITYEFFECT_COUNT_ON_FIELD, gBattlerAttacker, ABILITY_PRESSURE, 0, 0);
            break;
        case MOVE_TARGET_BOTH:
        case MOVE_TARGET_OPPONENTS_FIELD:
            ppToDeduct += AbilityBattleEffects(ABILITYEFFECT_COUNT_OTHER_SIZE, gBattlerAttacker, ABILITY_PRESSURE, 0, 0);
            break;
        default:
            if (gBattlerAttacker != gBattlerTarget && gBattleMons[gBattlerTarget].ability == ABILITY_PRESSURE)
                ppToDeduct++;
            break;
        }
    }

    if (!(gHitMarker & (HITMARKER_NO_PPDEDUCT | HITMARKER_NO_ATTACKSTRING)) && gBattleMons[gBattlerAttacker].pp[gCurrMovePos])
    {
        gProtectStructs[gBattlerAttacker].notFirstStrike = 1;

        if (gBattleMons[gBattlerAttacker].pp[gCurrMovePos] > ppToDeduct)
            gBattleMons[gBattlerAttacker].pp[gCurrMovePos] -= ppToDeduct;
        else
            gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = 0;

        if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_TRANSFORMED)
            && !((gDisableStructs[gBattlerAttacker].mimickedMoves) & gBitTable[gCurrMovePos]))
        {
            gActiveBattler = gBattlerAttacker;
            BtlController_EmitSetMonData(0, REQUEST_PPMOVE1_BATTLE + gCurrMovePos, 0, 1, &gBattleMons[gBattlerAttacker].pp[gCurrMovePos]);
            MarkBattlerForControllerExec(gBattlerAttacker);
        }
    }

    gHitMarker &= ~(HITMARKER_NO_PPDEDUCT);
    gBattlescriptCurrInstr++;
}

static void atk04_critcalc(void)
{
    u8 holdEffect;
    u16 item, critChance;

    item = gBattleMons[gBattlerAttacker].item;

    if (item == ITEM_ENIGMA_BERRY)
        holdEffect = gEnigmaBerries[gBattlerAttacker].holdEffect;
    else
        holdEffect = ItemId_GetHoldEffect(item);

    gPotentialItemEffectBattler = gBattlerAttacker;

    critChance  = 2 * ((gBattleMons[gBattlerAttacker].status2 & STATUS2_FOCUS_ENERGY) != 0)
                + (gBattleMoves[gCurrentMove].effect == EFFECT_HIGH_CRITICAL)
                + (gBattleMoves[gCurrentMove].effect == EFFECT_SKY_ATTACK)
                + (gBattleMoves[gCurrentMove].effect == EFFECT_BLAZE_KICK)
                + (gBattleMoves[gCurrentMove].effect == EFFECT_POISON_TAIL)
                + (holdEffect == HOLD_EFFECT_SCOPE_LENS)
                + 2 * (holdEffect == HOLD_EFFECT_LUCKY_PUNCH && gBattleMons[gBattlerAttacker].species == SPECIES_CHANSEY)
                + 2 * (holdEffect == HOLD_EFFECT_STICK && gBattleMons[gBattlerAttacker].species == SPECIES_FARFETCHD);

    if (critChance >= ARRAY_COUNT(sCriticalHitChance))
        critChance = ARRAY_COUNT(sCriticalHitChance) - 1;

    if ((gBattleMons[gBattlerTarget].ability != ABILITY_BATTLE_ARMOR && gBattleMons[gBattlerTarget].ability != ABILITY_SHELL_ARMOR)
     && !(gStatuses3[gBattlerAttacker] & STATUS3_CANT_SCORE_A_CRIT)
     && !(gBattleTypeFlags & (BATTLE_TYPE_WALLY_TUTORIAL | BATTLE_TYPE_FIRST_BATTLE))
     && !(Random() % sCriticalHitChance[critChance]))
        gCritMultiplier = 2;
    else
        gCritMultiplier = 1;

    gBattlescriptCurrInstr++;
}

static void atk05_damagecalc(void)
{
    u16 sideStatus = gSideStatuses[GET_BATTLER_SIDE(gBattlerTarget)];
    gBattleMoveDamage = CalculateBaseDamage(&gBattleMons[gBattlerAttacker], &gBattleMons[gBattlerTarget], gCurrentMove,
                                            sideStatus, gDynamicBasePower,
                                            gBattleStruct->dynamicMoveType, gBattlerAttacker, gBattlerTarget);
    gBattleMoveDamage = gBattleMoveDamage * gCritMultiplier * gBattleStruct->dmgMultiplier;

    if (gStatuses3[gBattlerAttacker] & STATUS3_CHARGED_UP && gBattleMoves[gCurrentMove].type == TYPE_ELECTRIC)
        gBattleMoveDamage *= 2;
    if (gProtectStructs[gBattlerAttacker].helpingHand)
        gBattleMoveDamage = gBattleMoveDamage * 15 / 10;

    gBattlescriptCurrInstr++;
}

void AI_CalcDmg(u8 attacker, u8 defender)
{
    u16 sideStatus = gSideStatuses[GET_BATTLER_SIDE(defender)];
    gBattleMoveDamage = CalculateBaseDamage(&gBattleMons[attacker], &gBattleMons[defender], gCurrentMove,
                                            sideStatus, gDynamicBasePower,
                                            gBattleStruct->dynamicMoveType, attacker, defender);
    gDynamicBasePower = 0;
    gBattleMoveDamage = gBattleMoveDamage * gCritMultiplier * gBattleStruct->dmgMultiplier;

    if (gStatuses3[attacker] & STATUS3_CHARGED_UP && gBattleMoves[gCurrentMove].type == TYPE_ELECTRIC)
        gBattleMoveDamage *= 2;
    if (gProtectStructs[attacker].helpingHand)
        gBattleMoveDamage = gBattleMoveDamage * 15 / 10;
}

static void ModulateDmgByType(u8 multiplier)
{
    gBattleMoveDamage = gBattleMoveDamage * multiplier / 10;
    if (gBattleMoveDamage == 0 && multiplier != 0)
        gBattleMoveDamage = 1;

    switch (multiplier)
    {
    case TYPE_MUL_NO_EFFECT:
        gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
        gMoveResultFlags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
        gMoveResultFlags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
        break;
    case TYPE_MUL_NOT_EFFECTIVE:
        if (gBattleMoves[gCurrentMove].power && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            if (gMoveResultFlags & MOVE_RESULT_SUPER_EFFECTIVE)
                gMoveResultFlags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
            else
                gMoveResultFlags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
        }
        break;
    case TYPE_MUL_SUPER_EFFECTIVE:
        if (gBattleMoves[gCurrentMove].power && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            if (gMoveResultFlags & MOVE_RESULT_NOT_VERY_EFFECTIVE)
                gMoveResultFlags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
            else
                gMoveResultFlags |= MOVE_RESULT_SUPER_EFFECTIVE;
        }
        break;
    }
}

static void atk06_typecalc(void)
{
    int i = 0;
    u8 moveType;
    if (gCurrentMove != MOVE_STRUGGLE)
    {
        if (gBattleStruct->dynamicMoveType)
            moveType = gBattleStruct->dynamicMoveType & 0x3F;
        else
            moveType = gBattleMoves[gCurrentMove].type;

        //check stab
        if (gBattleMons[gBattlerAttacker].type1 == moveType || gBattleMons[gBattlerAttacker].type2 == moveType)
        {
            gBattleMoveDamage = gBattleMoveDamage * 15;
            gBattleMoveDamage = gBattleMoveDamage / 10;
        }

        if (gBattleMons[gBattlerTarget].ability == ABILITY_LEVITATE && moveType == TYPE_GROUND)
        {
            gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
            gMoveResultFlags |= (MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE);
            gLastLandedMoves[gBattlerTarget] = 0;
            gLastHitByType[gBattlerTarget] = 0;
            gBattleCommunication[6] = moveType;
            RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
        }
        else
        {
            while (gTypeEffectiveness[i]!= TYPE_ENDTABLE)
            {
                if (gTypeEffectiveness[i] == TYPE_FORESIGHT)
                {
                    if (gBattleMons[gBattlerTarget].status2 & STATUS2_FORESIGHT)
                        break;
                    i += 3;
                    continue;
                }

                else if (gTypeEffectiveness[i] == moveType)
                {
                    //check type1
                    if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type1)
                        ModulateDmgByType(gTypeEffectiveness[i + 2]);
                    //check type2
                    if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type2 &&
                        gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2)
                        ModulateDmgByType(gTypeEffectiveness[i + 2]);
                }
                i += 3;
            }
        }

        if (gBattleMons[gBattlerTarget].ability == ABILITY_WONDER_GUARD && AttacksThisTurn(gBattlerAttacker, gCurrentMove) == 2
         && (!(gMoveResultFlags & MOVE_RESULT_SUPER_EFFECTIVE) || ((gMoveResultFlags & (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)) == (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)))
         && gBattleMoves[gCurrentMove].power)
        {
            gLastUsedAbility = ABILITY_WONDER_GUARD;
            gMoveResultFlags |= MOVE_RESULT_MISSED;
            gLastLandedMoves[gBattlerTarget] = 0;
            gLastHitByType[gBattlerTarget] = 0;
            gBattleCommunication[6] = 3;
            RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
        }
        if (gMoveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE)
            gProtectStructs[gBattlerAttacker].targetNotAffected = 1;
    }
    gBattlescriptCurrInstr++;
}
static void CheckWonderGuardAndLevitate(void)
{
    u8 flags = 0;
    s32 i = 0;
    u8 moveType;

    if (gCurrentMove == MOVE_STRUGGLE || !gBattleMoves[gCurrentMove].power)
        return;

    GET_MOVE_TYPE(gCurrentMove, moveType);

    if (gBattleMons[gBattlerTarget].ability == ABILITY_LEVITATE && moveType == TYPE_GROUND)
    {
        RecordAbilitySetField6(ABILITY_LEVITATE, moveType);
        return;
    }

    while (gTypeEffectiveness[i] != TYPE_ENDTABLE)
    {
        if (gTypeEffectiveness[i] == TYPE_FORESIGHT)
        {
            if (gBattleMons[gBattlerTarget].status2 & STATUS2_FORESIGHT)
                break;
            i += 3;
            continue;
        }

        if (gTypeEffectiveness[i] == moveType)
        {
            // check no effect
            if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type1 && gTypeEffectiveness[i + 2] == 0)
            {
                gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
                gProtectStructs[gBattlerAttacker].targetNotAffected = 1;
            }
            if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type2 &&
                gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2 &&
                gTypeEffectiveness[i + 2] == 0)
            {
                gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
                gProtectStructs[gBattlerAttacker].targetNotAffected = 1;
            }

            // check super effective
            if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type1 && gTypeEffectiveness[i + 2] == 20)
                flags |= 1;
            if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type2
             && gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2
             && gTypeEffectiveness[i + 2] == 20)
                flags |= 1;

            // check not very effective
            if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type1 && gTypeEffectiveness[i + 2] == 5)
                flags |= 2;
            if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type2
             && gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2
             && gTypeEffectiveness[i + 2] == 5)
                flags |= 2;
        }
        i += 3;
    }

    if (gBattleMons[gBattlerTarget].ability == ABILITY_WONDER_GUARD && AttacksThisTurn(gBattlerAttacker, gCurrentMove) == 2)
    {
        if (((flags & 2) || !(flags & 1)) && gBattleMoves[gCurrentMove].power)
        {
            RecordAbilitySetField6(ABILITY_WONDER_GUARD, 3);
        }
    }
}

static void ModulateDmgByType2(u8 multiplier, u16 move, u8* flags) // same as ModulateDmgByType except different arguments
{
    gBattleMoveDamage = gBattleMoveDamage * multiplier / 10;
    if (gBattleMoveDamage == 0 && multiplier != 0)
        gBattleMoveDamage = 1;

    switch (multiplier)
    {
    case TYPE_MUL_NO_EFFECT:
        *flags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
        *flags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
        *flags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
        break;
    case TYPE_MUL_NOT_EFFECTIVE:
        if (gBattleMoves[move].power && !(*flags & MOVE_RESULT_NO_EFFECT))
        {
            if (*flags & MOVE_RESULT_SUPER_EFFECTIVE)
                *flags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
            else
                *flags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
        }
        break;
    case TYPE_MUL_SUPER_EFFECTIVE:
        if (gBattleMoves[move].power && !(*flags & MOVE_RESULT_NO_EFFECT))
        {
            if (*flags & MOVE_RESULT_NOT_VERY_EFFECTIVE)
                *flags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
            else
                *flags |= MOVE_RESULT_SUPER_EFFECTIVE;
        }
        break;
    }
}

u8 TypeCalc(u16 move, u8 attacker, u8 defender)
{
    s32 i = 0;
    u8 flags = 0;
    u8 moveType;

    if (move == MOVE_STRUGGLE)
        return 0;

    moveType = gBattleMoves[move].type;

    // check stab
    if (IS_BATTLER_OF_TYPE(attacker, moveType))
    {
        gBattleMoveDamage = gBattleMoveDamage * 15;
        gBattleMoveDamage = gBattleMoveDamage / 10;
    }

    if (gBattleMons[defender].ability == ABILITY_LEVITATE && moveType == TYPE_GROUND)
    {
        flags |= (MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE);
    }
    else
    {
        while (gTypeEffectiveness[i]!= TYPE_ENDTABLE)
        {
            if (gTypeEffectiveness[i] == TYPE_FORESIGHT)
            {
                if (gBattleMons[defender].status2 & STATUS2_FORESIGHT)
                    break;
                i += 3;
                continue;
            }

            else if (gTypeEffectiveness[i] == moveType)
            {
                // check type1
                if (gTypeEffectiveness[i + 1] == gBattleMons[defender].type1)
                    ModulateDmgByType2(gTypeEffectiveness[i + 2], move, &flags);
                // check type2
                if (gTypeEffectiveness[i + 1] == gBattleMons[defender].type2 &&
                    gBattleMons[gBattlerTarget /* what the christ */].type1 != gBattleMons[defender].type2)
                    ModulateDmgByType2(gTypeEffectiveness[i + 2], move, &flags);
            }
            i += 3;
        }
    }

    if (gBattleMons[defender].ability == ABILITY_WONDER_GUARD && !(flags & MOVE_RESULT_MISSED) &&
        AttacksThisTurn(attacker, move) == 2 &&
        (!(flags & MOVE_RESULT_SUPER_EFFECTIVE) || ((flags & (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)) == (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE))) &&
        gBattleMoves[move].power)
    {
        flags |= MOVE_RESULT_MISSED;
    }
    return flags;
}

u8 AI_TypeCalc(u16 move, u16 targetSpecies, u8 targetAbility)
{
    int i = 0;
    u8 flags = 0;
    u8 type1 = gBaseStats[targetSpecies].type1, type2 = gBaseStats[targetSpecies].type2, moveType;

    if (move == MOVE_STRUGGLE)
        return 0;

    moveType = gBattleMoves[move].type;

    if (targetAbility == ABILITY_LEVITATE && moveType == TYPE_GROUND)
    {
        flags = MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE;
    }
    else
    {
        while (TYPE_EFFECT_ATK_TYPE(i) != TYPE_ENDTABLE)
        {
            if (TYPE_EFFECT_ATK_TYPE(i) == TYPE_FORESIGHT)
            {
                i += 3;
                continue;
            }
            if (TYPE_EFFECT_ATK_TYPE(i) == moveType)
            {
                // check type1
                if (TYPE_EFFECT_DEF_TYPE(i) == type1)
                    ModulateDmgByType2(TYPE_EFFECT_MULTIPLIER(i), move, &flags);
                // check type2
                if (TYPE_EFFECT_DEF_TYPE(i) == type2 && gBattleMons[gBattlerTarget].type1 != type2) //gf you morons, you should check if (type1 != type2)...
                    ModulateDmgByType2(TYPE_EFFECT_MULTIPLIER(i), move, &flags);
            }
            i += 3;
        }
    }
    if (targetAbility == ABILITY_WONDER_GUARD
     && (!(flags & MOVE_RESULT_SUPER_EFFECTIVE) || ((flags & (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)) == (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)))
     && gBattleMoves[move].power)
        flags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
    return flags;
}

// Multiplies the damage by a random factor between 85% to 100% inclusive
static inline void ApplyRandomDmgMultiplier(void)
{
    u16 rand = Random();
    u16 randPercent = 100 - (rand % 16);

    if (gBattleMoveDamage != 0)
    {
        gBattleMoveDamage *= randPercent;
        gBattleMoveDamage /= 100;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
    }
}

void Unused_ApplyRandomDmgMultiplier(void)
{
    ApplyRandomDmgMultiplier();
}

static void atk07_adjustnormaldamage(void)
{
    u8 holdEffect, param;

    ApplyRandomDmgMultiplier();

    if (gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY)
    {
        holdEffect = gEnigmaBerries[gBattlerTarget].holdEffect;
        param = gEnigmaBerries[gBattlerTarget].holdEffectParam;
    }
    else
    {
        holdEffect = ItemId_GetHoldEffect(gBattleMons[gBattlerTarget].item);
        param = ItemId_GetHoldEffectParam(gBattleMons[gBattlerTarget].item);
    }

    gPotentialItemEffectBattler = gBattlerTarget;

    if (holdEffect == HOLD_EFFECT_FOCUS_BAND && (Random() % 100) < param)
    {
        RecordItemEffectBattle(gBattlerTarget, holdEffect);
        gSpecialStatuses[gBattlerTarget].focusBanded = 1;
    }
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_SUBSTITUTE)
        goto END;
    if (gBattleMoves[gCurrentMove].effect != EFFECT_FALSE_SWIPE && !gProtectStructs[gBattlerTarget].endured
     && !gSpecialStatuses[gBattlerTarget].focusBanded)
        goto END;

    if (gBattleMons[gBattlerTarget].hp > gBattleMoveDamage)
        goto END;

    gBattleMoveDamage = gBattleMons[gBattlerTarget].hp - 1;

    if (gProtectStructs[gBattlerTarget].endured)
    {
        gMoveResultFlags |= MOVE_RESULT_FOE_ENDURED;
    }
    else if (gSpecialStatuses[gBattlerTarget].focusBanded)
    {
        gMoveResultFlags |= MOVE_RESULT_FOE_HUNG_ON;
        gLastUsedItem = gBattleMons[gBattlerTarget].item;
    }

    END:
        gBattlescriptCurrInstr++;
}

static void atk08_adjustnormaldamage2(void) // The same as 0x7 except it doesn't check for false swipe move effect.
{
    u8 holdEffect, param;

    ApplyRandomDmgMultiplier();

    if (gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY)
    {
        holdEffect = gEnigmaBerries[gBattlerTarget].holdEffect;
        param = gEnigmaBerries[gBattlerTarget].holdEffectParam;
    }
    else
    {
        holdEffect = ItemId_GetHoldEffect(gBattleMons[gBattlerTarget].item);
        param = ItemId_GetHoldEffectParam(gBattleMons[gBattlerTarget].item);
    }

    gPotentialItemEffectBattler = gBattlerTarget;

    if (holdEffect == HOLD_EFFECT_FOCUS_BAND && (Random() % 100) < param)
    {
        RecordItemEffectBattle(gBattlerTarget, holdEffect);
        gSpecialStatuses[gBattlerTarget].focusBanded = 1;
    }
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_SUBSTITUTE)
        goto END;
    if (!gProtectStructs[gBattlerTarget].endured && !gSpecialStatuses[gBattlerTarget].focusBanded)
        goto END;
    if (gBattleMons[gBattlerTarget].hp > gBattleMoveDamage)
        goto END;

    gBattleMoveDamage = gBattleMons[gBattlerTarget].hp - 1;

    if (gProtectStructs[gBattlerTarget].endured)
    {
        gMoveResultFlags |= MOVE_RESULT_FOE_ENDURED;
    }
    else if (gSpecialStatuses[gBattlerTarget].focusBanded)
    {
        gMoveResultFlags |= MOVE_RESULT_FOE_HUNG_ON;
        gLastUsedItem = gBattleMons[gBattlerTarget].item;
    }

    END:
        gBattlescriptCurrInstr++;
}

static void atk09_attackanimation(void)
{
    if (gBattleControllerExecFlags)
        return;

    if ((gHitMarker & HITMARKER_NO_ANIMATIONS) && (gCurrentMove != MOVE_TRANSFORM && gCurrentMove != MOVE_SUBSTITUTE))
    {
        BattleScriptPush(gBattlescriptCurrInstr + 1);
        gBattlescriptCurrInstr = BattleScript_Pausex20;
        gBattleStruct->animTurn++;
        gBattleStruct->animTargetsHit++;
    }
    else
    {
        if ((gBattleMoves[gCurrentMove].target & MOVE_TARGET_BOTH || gBattleMoves[gCurrentMove].target & MOVE_TARGET_FOES_AND_ALLY || gBattleMoves[gCurrentMove].target & TARGET_DEPENDS) && gBattleStruct->animTargetsHit)
        {
            gBattlescriptCurrInstr++;
            return;
        }
        if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            gActiveBattler = gBattlerAttacker;

            BtlController_EmitMoveAnimation(0, gCurrentMove, gBattleStruct->animTurn, gBattleMovePower, gBattleMoveDamage, gBattleMons[gBattlerAttacker].friendship, &gDisableStructs[gBattlerAttacker]);
            gBattleStruct->animTurn += 1;
            gBattleStruct->animTargetsHit += 1;
            MarkBattlerForControllerExec(gBattlerAttacker);
            gBattlescriptCurrInstr++;
        }
        else
        {
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = BattleScript_Pausex20;
        }
    }
}

static void atk0A_waitanimation(void)
{
    if (gBattleControllerExecFlags == 0)
        gBattlescriptCurrInstr++;
}

static void atk0B_healthbarupdate(void)
{
    if (gBattleControllerExecFlags)
        return;

    if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

        if (gBattleMons[gActiveBattler].status2 & STATUS2_SUBSTITUTE && gDisableStructs[gActiveBattler].substituteHP && !(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE))
        {
            PrepareStringBattle(0x80, gActiveBattler);
        }
        else
        {
            // Emerald
            /*
            s16 healthValue;

            s32 currDmg = gBattleMoveDamage;
            s32 maxPossibleDmgValue = 10000; // not present in R/S, ensures that huge damage values don't change sign

            if (currDmg <= maxPossibleDmgValue)
                healthValue = currDmg;
            else
                healthValue = maxPossibleDmgValue;

            BtlController_EmitHealthBarUpdate(0, healthValue);
            */

            BtlController_EmitHealthBarUpdate(0, gBattleMoveDamage);
            MarkBattlerForControllerExec(gActiveBattler);

            if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER && gBattleMoveDamage > 0)
                gBattleResults.playerMonWasDamaged = TRUE;
        }
    }

    gBattlescriptCurrInstr += 2;
}

static void atk0C_datahpupdate(void)
{
    u32 moveType;

    if (gBattleControllerExecFlags)
        return;

    if (gBattleStruct->dynamicMoveType == 0)
        moveType = gBattleMoves[gCurrentMove].type;
    else if (!(gBattleStruct->dynamicMoveType & 0x40))
        moveType = gBattleStruct->dynamicMoveType & 0x3F;
    else
        moveType = gBattleMoves[gCurrentMove].type;

    if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        if (gBattleMons[gActiveBattler].status2 & STATUS2_SUBSTITUTE && gDisableStructs[gActiveBattler].substituteHP && !(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE))
        {
            if (gDisableStructs[gActiveBattler].substituteHP >= gBattleMoveDamage)
            {
                if (gSpecialStatuses[gActiveBattler].dmg == 0)
                    gSpecialStatuses[gActiveBattler].dmg = gBattleMoveDamage;
                gDisableStructs[gActiveBattler].substituteHP -= gBattleMoveDamage;
                gHpDealt = gBattleMoveDamage;
            }
            else
            {
                if (gSpecialStatuses[gActiveBattler].dmg == 0)
                    gSpecialStatuses[gActiveBattler].dmg = gDisableStructs[gActiveBattler].substituteHP;
                gHpDealt = gDisableStructs[gActiveBattler].substituteHP;
                gDisableStructs[gActiveBattler].substituteHP = 0;
            }
            // check substitute fading
            if (gDisableStructs[gActiveBattler].substituteHP == 0)
            {
                gBattlescriptCurrInstr += 2;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SubstituteFade;
                return;
            }
        }
        else
        {
            gHitMarker &= ~(HITMARKER_IGNORE_SUBSTITUTE);
            if (gBattleMoveDamage < 0) // hp goes up
            {
                gBattleMons[gActiveBattler].hp -= gBattleMoveDamage;
                if (gBattleMons[gActiveBattler].hp > gBattleMons[gActiveBattler].maxHP)
                    gBattleMons[gActiveBattler].hp = gBattleMons[gActiveBattler].maxHP;

            }
            else // hp goes down
            {
                if (gHitMarker & HITMARKER_IGNORE_BIDE)
                {
                    gHitMarker &= ~(HITMARKER_IGNORE_BIDE);
                }
                else
                {
                    gTakenDmg[gActiveBattler] += gBattleMoveDamage;
                    if (gBattlescriptCurrInstr[1] == BS_TARGET)
                        gTakenDmgByBattler[gActiveBattler] = gBattlerAttacker;
                    else
                        gTakenDmgByBattler[gActiveBattler] = gBattlerTarget;
                }

                if (gBattleMons[gActiveBattler].hp > gBattleMoveDamage)
                {
                    gBattleMons[gActiveBattler].hp -= gBattleMoveDamage;
                    gHpDealt = gBattleMoveDamage;
                }
                else
                {
                    gHpDealt = gBattleMons[gActiveBattler].hp;
                    gBattleMons[gActiveBattler].hp = 0;
                }

                if (!gSpecialStatuses[gActiveBattler].dmg && !(gHitMarker & HITMARKER_PASSIVE_HP_UPDATE))
                    gSpecialStatuses[gActiveBattler].dmg = gHpDealt;

                if (IS_TYPE_PHYSICAL(moveType) && !(gHitMarker & HITMARKER_PASSIVE_HP_UPDATE) && gCurrentMove != MOVE_PAIN_SPLIT)
                {
                    gProtectStructs[gActiveBattler].physicalDmg = gHpDealt;
                    gSpecialStatuses[gActiveBattler].physicalDmg = gHpDealt;
                    if (gBattlescriptCurrInstr[1] == BS_TARGET)
                    {
                        gProtectStructs[gActiveBattler].physicalBattlerId = gBattlerAttacker;
                        gSpecialStatuses[gActiveBattler].physicalBattlerId = gBattlerAttacker;
                    }
                    else
                    {
                        gProtectStructs[gActiveBattler].physicalBattlerId = gBattlerTarget;
                        gSpecialStatuses[gActiveBattler].physicalBattlerId = gBattlerTarget;
                    }
                }
                else if (!IS_TYPE_PHYSICAL(moveType) && !(gHitMarker & HITMARKER_PASSIVE_HP_UPDATE))
                {
                    gProtectStructs[gActiveBattler].specialDmg = gHpDealt;
                    gSpecialStatuses[gActiveBattler].specialDmg = gHpDealt;
                    if (gBattlescriptCurrInstr[1] == BS_TARGET)
                    {
                        gProtectStructs[gActiveBattler].specialBattlerId = gBattlerAttacker;
                        gSpecialStatuses[gActiveBattler].specialBattlerId = gBattlerAttacker;
                    }
                    else
                    {
                        gProtectStructs[gActiveBattler].specialBattlerId = gBattlerTarget;
                        gSpecialStatuses[gActiveBattler].specialBattlerId = gBattlerTarget;
                    }
                }
            }
            gHitMarker &= ~(HITMARKER_PASSIVE_HP_UPDATE);
            BtlController_EmitSetMonData(0, REQUEST_HP_BATTLE, 0, 2, &gBattleMons[gActiveBattler].hp);
            MarkBattlerForControllerExec(gActiveBattler);
        }
    }
    else
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        if (gSpecialStatuses[gActiveBattler].dmg == 0)
            gSpecialStatuses[gActiveBattler].dmg = 0xFFFF;
    }
    gBattlescriptCurrInstr += 2;
}

static void atk0D_critmessage(void)
{
    if (gBattleControllerExecFlags == 0)
    {
        if (gCritMultiplier == 2 && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            PrepareStringBattle(0xD9, gBattlerAttacker);
            gBattleCommunication[MSG_DISPLAY] = 1;
        }
        gBattlescriptCurrInstr++;
    }
}

static void atk0E_effectivenesssound(void)
{
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = gBattlerTarget;
    if (!(gMoveResultFlags & MOVE_RESULT_MISSED))
    {
        switch (gMoveResultFlags & (u8)(~(MOVE_RESULT_MISSED)))
        {
        case MOVE_RESULT_SUPER_EFFECTIVE:
            BtlController_EmitPlaySE(0, SE_SUPER_EFFECTIVE);
            MarkBattlerForControllerExec(gActiveBattler);
            break;
        case MOVE_RESULT_NOT_VERY_EFFECTIVE:
            BtlController_EmitPlaySE(0, SE_NOT_EFFECTIVE);
            MarkBattlerForControllerExec(gActiveBattler);
            break;
        case MOVE_RESULT_DOESNT_AFFECT_FOE:
        case MOVE_RESULT_FAILED:
            // no sound
            break;
        case MOVE_RESULT_FOE_ENDURED:
        case MOVE_RESULT_ONE_HIT_KO:
        case MOVE_RESULT_FOE_HUNG_ON:
        default:
            if (gMoveResultFlags & MOVE_RESULT_SUPER_EFFECTIVE)
            {
                BtlController_EmitPlaySE(0, SE_SUPER_EFFECTIVE);
                MarkBattlerForControllerExec(gActiveBattler);
            }
            else if (gMoveResultFlags & MOVE_RESULT_NOT_VERY_EFFECTIVE)
            {
                BtlController_EmitPlaySE(0, SE_NOT_EFFECTIVE);
                MarkBattlerForControllerExec(gActiveBattler);
            }
            else if (!(gMoveResultFlags & (MOVE_RESULT_DOESNT_AFFECT_FOE | MOVE_RESULT_FAILED)))
            {
                BtlController_EmitPlaySE(0, SE_EFFECTIVE);
                MarkBattlerForControllerExec(gActiveBattler);
            }
            break;
        }
    }
    gBattlescriptCurrInstr++;
}

static void atk0F_resultmessage(void)
{
    u32 stringId = 0;

    if (gBattleControllerExecFlags)
        return;

    if (gMoveResultFlags & MOVE_RESULT_MISSED && (!(gMoveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE) || gBattleCommunication[6] > 2))
    {
        stringId = gMissStringIds[gBattleCommunication[6]];
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
    else
    {
        gBattleCommunication[MSG_DISPLAY] = 1;
        switch (gMoveResultFlags & (u8)(~(MOVE_RESULT_MISSED)))
        {
        case MOVE_RESULT_SUPER_EFFECTIVE:
            stringId = STRINGID_SUPEREFFECTIVE;
            break;
        case MOVE_RESULT_NOT_VERY_EFFECTIVE:
            stringId = STRINGID_NOTVERYEFFECTIVE;
            break;
        case MOVE_RESULT_ONE_HIT_KO:
            stringId = STRINGID_ONEHITKO;
            break;
        case MOVE_RESULT_FOE_ENDURED:
            stringId = STRINGID_PKMNENDUREDHIT;
            break;
        case MOVE_RESULT_FAILED:
            stringId = STRINGID_BUTITFAILED;
            break;
        case MOVE_RESULT_DOESNT_AFFECT_FOE:
            stringId = STRINGID_ITDOESNTAFFECT;
            break;
        case MOVE_RESULT_FOE_HUNG_ON:
            gLastUsedItem = gBattleMons[gBattlerTarget].item;
            gPotentialItemEffectBattler = gBattlerTarget;
            gMoveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_HangedOnMsg;
            return;
        default:
            if (gMoveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE)
            {
                stringId = STRINGID_ITDOESNTAFFECT;
            }
            else if (gMoveResultFlags & MOVE_RESULT_ONE_HIT_KO)
            {
                gMoveResultFlags &= ~(MOVE_RESULT_ONE_HIT_KO);
                gMoveResultFlags &= ~(MOVE_RESULT_SUPER_EFFECTIVE);
                gMoveResultFlags &= ~(MOVE_RESULT_NOT_VERY_EFFECTIVE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_OneHitKOMsg;
                return;
            }
            else if (gMoveResultFlags & MOVE_RESULT_FOE_ENDURED)
            {
                gMoveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_EnduredMsg;
                return;
            }
            else if (gMoveResultFlags & MOVE_RESULT_FOE_HUNG_ON)
            {
                gLastUsedItem = gBattleMons[gBattlerTarget].item;
                gPotentialItemEffectBattler = gBattlerTarget;
                gMoveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_HangedOnMsg;
                return;
            }
            else if (gMoveResultFlags & MOVE_RESULT_FAILED)
            {
                stringId = STRINGID_BUTITFAILED;
            }
            else
            {
                gBattleCommunication[MSG_DISPLAY] = 0;
            }
        }
    }

    if (stringId)
        PrepareStringBattle(stringId, gBattlerAttacker);

    gBattlescriptCurrInstr++;
}

static void atk10_printstring(void)
{
    if (gBattleControllerExecFlags == 0)
    {
        u16 var = T2_READ_16(gBattlescriptCurrInstr + 1);
        PrepareStringBattle(var, gBattlerAttacker);
        gBattlescriptCurrInstr += 3;
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
}

static void atk11_printselectionstring(void)
{
    gActiveBattler = gBattlerAttacker;

    BtlController_EmitPrintSelectionString(0, T2_READ_16(gBattlescriptCurrInstr + 1));
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 3;
    gBattleCommunication[MSG_DISPLAY] = 1;
}

static void atk12_waitmessage(void)
{
    if (gBattleControllerExecFlags == 0)
    {
        if (!gBattleCommunication[MSG_DISPLAY])
        {
            gBattlescriptCurrInstr += 3;
        }
        else
        {
            u16 toWait = T2_READ_16(gBattlescriptCurrInstr + 1);
            if (++gPauseCounterBattle >= toWait)
            {
                gPauseCounterBattle = 0;
                gBattlescriptCurrInstr += 3;
                gBattleCommunication[MSG_DISPLAY] = 0;
            }
        }
    }
}

static void atk13_printfromtable(void)
{
    if (gBattleControllerExecFlags == 0)
    {
        u16 *ptr = (u16 *)T1_READ_PTR(gBattlescriptCurrInstr + 1);
        ptr += gBattleCommunication[MULTISTRING_CHOOSER];
        PrepareStringBattle(*(u16*)ptr, gBattlerAttacker);
        gBattlescriptCurrInstr += 5;
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
}

static void atk14_printselectionstringfromtable(void)
{
    if (gBattleControllerExecFlags == 0)
    {
        u16 *ptr = (u16 *)T1_READ_PTR(gBattlescriptCurrInstr + 1); // FIXME
        ptr += gBattleCommunication[MULTISTRING_CHOOSER];
        gActiveBattler = gBattlerAttacker;
        BtlController_EmitPrintSelectionString(0, *(u16*)ptr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 5;
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
}

u8 GetBattlerTurnOrderNum(u8 battlerId)
{
    int i;
    for (i = 0; i < gBattlersCount; i++)
    {
        if (gBattlerByTurnOrder[i] == battlerId)
            break;
    }
    return i;
}

void SetMoveEffect(bool8 primary, u8 certain)
{
    bool32 statusChanged = FALSE;
    u8 affectsUser = 0;
    bool32 noSunCanFreeze = TRUE;

    if (gBattleCommunication[MOVE_EFFECT_BYTE] & MOVE_EFFECT_AFFECTS_USER)
    {
        gEffectBattler = gBattlerAttacker; // battlerId that effects get applied on
        gBattleCommunication[MOVE_EFFECT_BYTE] &= ~(MOVE_EFFECT_AFFECTS_USER);
        affectsUser = MOVE_EFFECT_AFFECTS_USER;
        gBattleStruct->scriptingActive = gBattlerTarget; // theoretically the attacker
    }
    else
    {
        gEffectBattler = gBattlerTarget;
        gBattleStruct->scriptingActive = gBattlerAttacker;
    }

    if (gBattleMons[gEffectBattler].ability == ABILITY_SHIELD_DUST && !(gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
        && !primary && gBattleCommunication[MOVE_EFFECT_BYTE] <= 9)
    {
        gBattlescriptCurrInstr++;
        return;
    }

    if (gSideStatuses[GET_BATTLER_SIDE(gEffectBattler)] & SIDE_STATUS_SAFEGUARD && !(gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
    && !primary && gBattleCommunication[MOVE_EFFECT_BYTE] <= 7)
    {
        gBattlescriptCurrInstr++;
        return;
    }

    if (gBattleMons[gEffectBattler].hp == 0
    && gBattleCommunication[MOVE_EFFECT_BYTE] != MOVE_EFFECT_PAYDAY
    && gBattleCommunication[MOVE_EFFECT_BYTE] != MOVE_EFFECT_STEAL_ITEM)
    {
        gBattlescriptCurrInstr++;
        return;
    }

    if (gBattleMons[gEffectBattler].status2 & STATUS2_SUBSTITUTE && affectsUser != MOVE_EFFECT_AFFECTS_USER)
    {
        gBattlescriptCurrInstr++;
        return;
    }

    if (gBattleCommunication[MOVE_EFFECT_BYTE] <= PRIMARY_STATUS_MOVE_EFFECT)
    {
        switch (sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]])
        {
        case STATUS1_SLEEP:
            // check active uproar
            if (gBattleMons[gEffectBattler].ability != ABILITY_SOUNDPROOF)
            {
                for (gActiveBattler = 0;
                     gActiveBattler < gBattlersCount && !(gBattleMons[gActiveBattler].status2 & STATUS2_UPROAR);
                     gActiveBattler++)
                {}
            }
            else
                gActiveBattler = gBattlersCount;

            if (gBattleMons[gEffectBattler].status1)
                break;
            if (gActiveBattler != gBattlersCount)
                break;
            if (gBattleMons[gEffectBattler].ability == ABILITY_VITAL_SPIRIT)
                break;
            if (gBattleMons[gEffectBattler].ability == ABILITY_INSOMNIA)
                break;

            CancelMultiTurnMoves(gEffectBattler);
            statusChanged = TRUE;
            break;
        case STATUS1_POISON:
            if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY
                && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                gLastUsedAbility = ABILITY_IMMUNITY;
                RecordAbilityBattle(gEffectBattler, ABILITY_IMMUNITY);

                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;

                if (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_ABILITY_STATUS;
                    gHitMarker &= ~(HITMARKER_STATUS_ABILITY_EFFECT);
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_MOVE_STATUS;
                }
                return;
            }
            if ((IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_POISON) || IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_STEEL))
                && (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;

                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUS_HAD_NO_EFFECT;
                return;
            }
            if (IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_POISON))
                break;
            if (IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_STEEL))
                break;
            if (gBattleMons[gEffectBattler].status1)
                break;
            if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY)
                break;

            statusChanged = TRUE;
            break;
        case STATUS1_BURN:
            if (gBattleMons[gEffectBattler].ability == ABILITY_WATER_VEIL
                && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                gLastUsedAbility = ABILITY_WATER_VEIL;
                RecordAbilityBattle(gEffectBattler, ABILITY_WATER_VEIL);

                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_BRNPrevention;
                if (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_ABILITY_STATUS;
                    gHitMarker &= ~(HITMARKER_STATUS_ABILITY_EFFECT);
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_MOVE_STATUS;
                }
                return;
            }
            if (IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_FIRE)
                && (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_BRNPrevention;

                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUS_HAD_NO_EFFECT;
                return;
            }
            if (IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_FIRE))
                break;
            if (gBattleMons[gEffectBattler].ability == ABILITY_WATER_VEIL)
                break;
            if (gBattleMons[gEffectBattler].status1)
                break;

            statusChanged = TRUE;
            break;
        case STATUS1_FREEZE:
            if (WEATHER_HAS_EFFECT && gBattleWeather & B_WEATHER_SUN)
                noSunCanFreeze = FALSE;
            if (IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_ICE))
                break;
            if (gBattleMons[gEffectBattler].status1)
                break;
            if (noSunCanFreeze == 0)
                break;
            if (gBattleMons[gEffectBattler].ability == ABILITY_MAGMA_ARMOR)
                break;

            CancelMultiTurnMoves(gEffectBattler);
            statusChanged = TRUE;
            break;
        case STATUS1_PARALYSIS:
            if (gBattleMons[gEffectBattler].ability == ABILITY_LIMBER)
            {
                if (primary == TRUE || certain == MOVE_EFFECT_CERTAIN)
                {
                    gLastUsedAbility = ABILITY_LIMBER;
                    RecordAbilityBattle(gEffectBattler, ABILITY_LIMBER);

                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_PRLZPrevention;

                    if (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_ABILITY_STATUS;
                        gHitMarker &= ~(HITMARKER_STATUS_ABILITY_EFFECT);
                    }
                    else
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_MOVE_STATUS;
                    }
                    return;
                }
                else
                    break;
            }
            if (gBattleMons[gEffectBattler].status1)
                break;

            statusChanged = TRUE;
            break;
        case STATUS1_TOXIC_POISON:
            if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                gLastUsedAbility = ABILITY_IMMUNITY;
                RecordAbilityBattle(gEffectBattler, ABILITY_IMMUNITY);

                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;

                if (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_ABILITY_STATUS;
                    gHitMarker &= ~(HITMARKER_STATUS_ABILITY_EFFECT);
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_MOVE_STATUS;
                }
                return;
            }
            if ((IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_POISON) || IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_STEEL))
                && (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;

                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUS_HAD_NO_EFFECT;
                return;
            }
            if (gBattleMons[gEffectBattler].status1)
                break;
            if (!IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_POISON) && !IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_STEEL))
            {
                if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY)
                    break;

                // It's redundant, because at this point we know the status1 value is 0.
                gBattleMons[gEffectBattler].status1 &= ~(STATUS1_TOXIC_POISON);
                gBattleMons[gEffectBattler].status1 &= ~(STATUS1_POISON);
                statusChanged = TRUE;
                break;
            }
            else
            {
                gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
            }
            break;
        }
        if (statusChanged == TRUE)
        {
            BattleScriptPush(gBattlescriptCurrInstr + 1);

            if (sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]] == STATUS1_SLEEP)
                gBattleMons[gEffectBattler].status1 |= STATUS1_SLEEP_TURN((Random() & 3) + 2); // 2-5 turns
            else
                gBattleMons[gEffectBattler].status1 |= sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]];

            gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];

            gActiveBattler = gEffectBattler;
            BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gEffectBattler].status1);
            MarkBattlerForControllerExec(gActiveBattler);

            if (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUSED_BY_ABILITY;
                gHitMarker &= ~(HITMARKER_STATUS_ABILITY_EFFECT);
            }
            else
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUSED;
            }

            // for synchronize

            if (gBattleCommunication[MOVE_EFFECT_BYTE] == MOVE_EFFECT_POISON
                || gBattleCommunication[MOVE_EFFECT_BYTE] == MOVE_EFFECT_TOXIC
                || gBattleCommunication[MOVE_EFFECT_BYTE] == MOVE_EFFECT_PARALYSIS
                || gBattleCommunication[MOVE_EFFECT_BYTE] == MOVE_EFFECT_BURN)
            {
                gBattleStruct->synchroniseEffect = gBattleCommunication[MOVE_EFFECT_BYTE];
                gHitMarker |= HITMARKER_SYNCHRONIZE_EFFECT;
            }
            return;
        }
        else if (statusChanged == FALSE)
        {
//            gBattleCommunication[MOVE_EFFECT_BYTE] = 0;
            gBattlescriptCurrInstr++;
            return;
        }
        return;
    }
    else
    {
        if (gBattleMons[gEffectBattler].status2 & sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]])
        {
            gBattlescriptCurrInstr++;
        }
        else
        {
            u8 side;
            switch (gBattleCommunication[MOVE_EFFECT_BYTE])
            {
            case MOVE_EFFECT_CONFUSION:
                if (gBattleMons[gEffectBattler].ability == ABILITY_OWN_TEMPO
                    || gBattleMons[gEffectBattler].status2 & STATUS2_CONFUSION)
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleMons[gEffectBattler].status2 |= STATUS2_CONFUSION_TURN(((Random()) % 4) + 2); // 2-5 turns

                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
                }
                break;
            case MOVE_EFFECT_FLINCH:
                if (gBattleMons[gEffectBattler].ability == ABILITY_INNER_FOCUS)
                {
                    if (primary == TRUE || certain == MOVE_EFFECT_CERTAIN)
                    {
                        gLastUsedAbility = ABILITY_INNER_FOCUS;
                        RecordAbilityBattle(gEffectBattler, ABILITY_INNER_FOCUS);
                        gBattlescriptCurrInstr = BattleScript_FlinchPrevention;
                    }
                    else
                    {
                        gBattlescriptCurrInstr++;
                    }
                }
                else
                {
                    if (GetBattlerTurnOrderNum(gEffectBattler) > gCurrentTurnActionNumber)
                        gBattleMons[gEffectBattler].status2 |= sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]];
                    gBattlescriptCurrInstr++;
                }
                break;
            case MOVE_EFFECT_UPROAR:
                if (!(gBattleMons[gEffectBattler].status2 & STATUS2_UPROAR))
                {

                    gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
                    gLockedMoves[gEffectBattler] = gCurrentMove;
                    gBattleMons[gEffectBattler].status2 |= STATUS2_UPROAR_TURN((Random() & 3) + 2); // 2-5 turns

                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
                }
                else
                {
                    gBattlescriptCurrInstr++;
                }
                break;
            case MOVE_EFFECT_PAYDAY:
                if (GET_BATTLER_SIDE(gBattlerAttacker) == B_SIDE_PLAYER)
                {
                    u16 PayDay = gPaydayMoney;
                    gPaydayMoney += (gBattleMons[gBattlerAttacker].level * 5);
                    if (PayDay > gPaydayMoney)
                        gPaydayMoney = 0xFFFF;
                }
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
                break;
            case MOVE_EFFECT_TRI_ATTACK:
                if (gBattleMons[gEffectBattler].status1)
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleCommunication[MOVE_EFFECT_BYTE] = Random() % 3 + 3;
                    SetMoveEffect(FALSE, 0); // Recursive
                }
                break;
            case MOVE_EFFECT_CHARGING:
                gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
                gLockedMoves[gEffectBattler] = gCurrentMove;
                gProtectStructs[gEffectBattler].chargingTurn = 1;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_WRAP:
                if (gBattleMons[gEffectBattler].status2 & STATUS2_WRAPPED)
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleMons[gEffectBattler].status2 |= STATUS2_WRAPPED_TURN((Random() & 3) + 3); // 3-6 turns

                    gSharedMem[BSTRUCT_OFF(wrappedMove) + gEffectBattler * 2 + 0] = gCurrentMove;
                    gSharedMem[BSTRUCT_OFF(wrappedMove) + gEffectBattler * 2 + 1] = gCurrentMove >> 8;
                    gSharedMem[BSTRUCT_OFF(wrappedBy) + gEffectBattler] = gBattlerAttacker;

                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];

                    for (gBattleCommunication[MULTISTRING_CHOOSER] = 0; ; gBattleCommunication[MULTISTRING_CHOOSER]++)
                    {
                        if (gBattleCommunication[MULTISTRING_CHOOSER] > 4)
                            break;
                        if (gTrappingMoves[gBattleCommunication[MULTISTRING_CHOOSER]] == gCurrentMove)
                            break;
                    }
                }
                break;
            case MOVE_EFFECT_RECOIL_25: // 25% recoil
                gBattleMoveDamage = (gHpDealt) / 4;
                if (gBattleMoveDamage == 0)
                    gBattleMoveDamage = 1;

                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
                break;
            case MOVE_EFFECT_ATK_PLUS_1:
            case MOVE_EFFECT_DEF_PLUS_1:
            case MOVE_EFFECT_SPD_PLUS_1:
            case MOVE_EFFECT_SP_ATK_PLUS_1:
            case MOVE_EFFECT_SP_DEF_PLUS_1:
            case MOVE_EFFECT_ACC_PLUS_1:
            case MOVE_EFFECT_EVS_PLUS_1:
                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(1),
                                    gBattleCommunication[MOVE_EFFECT_BYTE] - MOVE_EFFECT_ATK_PLUS_1 + 1,
                                    affectsUser, 0))
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleStruct->animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                    gBattleStruct->animArg2 = 0;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_StatUp;
                }
                break;
            case MOVE_EFFECT_ATK_MINUS_1:
            case MOVE_EFFECT_DEF_MINUS_1:
            case MOVE_EFFECT_SPD_MINUS_1:
            case MOVE_EFFECT_SP_ATK_MINUS_1:
            case MOVE_EFFECT_SP_DEF_MINUS_1:
            case MOVE_EFFECT_ACC_MINUS_1:
            case MOVE_EFFECT_EVS_MINUS_1:
                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(1) | STAT_BUFF_NEGATIVE,
                                    gBattleCommunication[MOVE_EFFECT_BYTE] - MOVE_EFFECT_ATK_MINUS_1 + 1,
                                    affectsUser, 0))
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleStruct->animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                    gBattleStruct->animArg2 = 0;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_StatDown;
                }
                break;
            case MOVE_EFFECT_ATK_PLUS_2:
            case MOVE_EFFECT_DEF_PLUS_2:
            case MOVE_EFFECT_SPD_PLUS_2:
            case MOVE_EFFECT_SP_ATK_PLUS_2:
            case MOVE_EFFECT_SP_DEF_PLUS_2:
            case MOVE_EFFECT_ACC_PLUS_2:
            case MOVE_EFFECT_EVS_PLUS_2:
                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(2),
                                    gBattleCommunication[MOVE_EFFECT_BYTE] - MOVE_EFFECT_ATK_PLUS_2 + 1,
                                    affectsUser, 0))
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleStruct->animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                    gBattleStruct->animArg2 = 0;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_StatUp;
                }
                break;
            case MOVE_EFFECT_ATK_MINUS_2:
            case MOVE_EFFECT_DEF_MINUS_2:
            case MOVE_EFFECT_SPD_MINUS_2:
            case MOVE_EFFECT_SP_ATK_MINUS_2:
            case MOVE_EFFECT_SP_DEF_MINUS_2:
            case MOVE_EFFECT_ACC_MINUS_2:
            case MOVE_EFFECT_EVS_MINUS_2:
                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(2) | STAT_BUFF_NEGATIVE,
                                    gBattleCommunication[MOVE_EFFECT_BYTE] - MOVE_EFFECT_ATK_MINUS_2 + 1,
                                    affectsUser, 0))
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleStruct->animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                    gBattleStruct->animArg2 = 0;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_StatDown;
                }
                break;
            case MOVE_EFFECT_RECHARGE:
                gBattleMons[gEffectBattler].status2 |= STATUS2_RECHARGE;
                gDisableStructs[gEffectBattler].rechargeCounter = 2;
                gLockedMoves[gEffectBattler] = gCurrentMove;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_RAGE:
                gBattleMons[gBattlerAttacker].status2 |= STATUS2_RAGE;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_STEAL_ITEM:
            {
                side = GetBattlerSide(gBattlerAttacker);
                if (GetBattlerSide(gBattlerAttacker) == B_SIDE_OPPONENT
                    && !(gBattleTypeFlags &
                         (BATTLE_TYPE_EREADER_TRAINER
                          | BATTLE_TYPE_BATTLE_TOWER
                          | BATTLE_TYPE_LINK)
                        || gTrainerBattleOpponent == SECRET_BASE_OPPONENT))
                {
                    gBattlescriptCurrInstr++;
                }
                else if (!(gBattleTypeFlags &
                           (BATTLE_TYPE_EREADER_TRAINER
                            | BATTLE_TYPE_BATTLE_TOWER
                            | BATTLE_TYPE_LINK)
                           || gTrainerBattleOpponent == SECRET_BASE_OPPONENT)
                         && (gWishFutureKnock.knockedOffPokes[side] & gBitTable[gBattlerPartyIndexes[gBattlerAttacker]]))
                {
                    gBattlescriptCurrInstr++;
                }
                else if (gBattleMons[gBattlerTarget].item
                         && gBattleMons[gBattlerTarget].ability == ABILITY_STICKY_HOLD)
                {
                    gBattlescriptCurrInstr = BattleScript_NoItemSteal;

                    gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
                    RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
                }
                else if (gBattleMons[gBattlerAttacker].item == ITEM_NONE
                         && gBattleMons[gBattlerTarget].item != ITEM_ENIGMA_BERRY
                         && gBattleMons[gBattlerTarget].item != ITEM_NONE)
                {
                    u16* changedItem = &gBattleStruct->changedItems[gBattlerAttacker];
                    gLastUsedItem = *changedItem = gBattleMons[gBattlerTarget].item;
                    gBattleMons[gBattlerTarget].item = 0;

                    gActiveBattler = gBattlerAttacker;
                    BtlController_EmitSetMonData(0, REQUEST_HELDITEM_BATTLE, 0, 2, &gLastUsedItem);
                    MarkBattlerForControllerExec(gBattlerAttacker);

                    gActiveBattler = gBattlerTarget;
                    BtlController_EmitSetMonData(0, REQUEST_HELDITEM_BATTLE, 0, 2, &gBattleMons[gBattlerTarget].item);
                    MarkBattlerForControllerExec(gBattlerTarget);

                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_ItemSteal;

                    gSharedMem[BSTRUCT_OFF(choicedMove) + (2 * gBattlerTarget) + 0] = 0;
                    gSharedMem[BSTRUCT_OFF(choicedMove) + (2 * gBattlerTarget) + 1] = 0;
                }
                else
                {
                    gBattlescriptCurrInstr++;
                }

            }
                break;
            case MOVE_EFFECT_PREVENT_ESCAPE:
                gBattleMons[gBattlerTarget].status2 |= STATUS2_ESCAPE_PREVENTION;
                gDisableStructs[gBattlerTarget].bankPreventingEscape = gBattlerAttacker;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_NIGHTMARE:
                gBattleMons[gBattlerTarget].status2 |= STATUS2_NIGHTMARE;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_ALL_STATS_UP:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_AllStatsUp;
                break;
            case MOVE_EFFECT_RAPIDSPIN:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_RapidSpinAway;
                break;
            case MOVE_EFFECT_REMOVE_PARALYSIS: // Smelling salts
                if ((gBattleMons[gBattlerTarget].status1 & STATUS1_PARALYSIS))
                {
                    gBattleMons[gBattlerTarget].status1 &= ~(STATUS1_PARALYSIS);

                    gActiveBattler = gBattlerTarget;
                    BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBattler].status1);
                    MarkBattlerForControllerExec(gActiveBattler);

                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_TargetPRLZHeal;
                }
                else
                {
                    gBattlescriptCurrInstr++;
                }
                break;
            case MOVE_EFFECT_ATK_DEF_DOWN: // SuperPower
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_AtkDefDown;
                break;
            case MOVE_EFFECT_RECOIL_33: // Double Edge
                gBattleMoveDamage = gHpDealt / 3;
                if (gBattleMoveDamage == 0)
                    gBattleMoveDamage = 1;

                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
                break;
            case MOVE_EFFECT_THRASH:
                if (!(gBattleMons[gEffectBattler].status2 & STATUS2_LOCK_CONFUSE))
                {
                    gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
                    gLockedMoves[gEffectBattler] = gCurrentMove;
                    gBattleMons[gEffectBattler].status2 |= STATUS2_LOCK_CONFUSE_TURN((Random() & 1) + 2); // thrash for 2-3 turns
                }
                else
                {
                    gBattlescriptCurrInstr++;
                }
                break;
            case MOVE_EFFECT_KNOCK_OFF:
                if (gBattleMons[gEffectBattler].ability == ABILITY_STICKY_HOLD)
                {
                    if (gBattleMons[gEffectBattler].item == 0)
                    {
                        gBattlescriptCurrInstr++;
                    }
                    else
                    {
                        gLastUsedAbility = ABILITY_STICKY_HOLD;
                        gBattlescriptCurrInstr = BattleScript_NoItemSteal;
                        RecordAbilityBattle(gEffectBattler, ABILITY_STICKY_HOLD);
                    }
                    break;
                }
                if (gBattleMons[gEffectBattler].item)
                {
                    side = GetBattlerSide(gEffectBattler);

                    gLastUsedItem = gBattleMons[gEffectBattler].item;
                    gBattleMons[gEffectBattler].item = 0;
                    gWishFutureKnock.knockedOffPokes[side] |= gBitTable[gBattlerPartyIndexes[gEffectBattler]];

                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_KnockedOff;

                    gSharedMem[BSTRUCT_OFF(choicedMove) + (2 * gEffectBattler) + 0] = 0;
                    gSharedMem[BSTRUCT_OFF(choicedMove) + (2 * gEffectBattler) + 1] = 0;
                }
                else
                {
                    gBattlescriptCurrInstr++;
                }
                break;
            case MOVE_EFFECT_SP_ATK_TWO_DOWN: // Overheat
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_SAtkDown2;
                break;
            }
        }
    }

//    gBattleCommunication[MOVE_EFFECT_BYTE] = 0;
}

static void atk15_seteffectwithchance(void)
{
    u32 percentChance;

    if (gBattleMons[gBattlerAttacker].ability == ABILITY_SERENE_GRACE)
        percentChance = gBattleMoves[gCurrentMove].secondaryEffectChance * 2;
    else
        percentChance = gBattleMoves[gCurrentMove].secondaryEffectChance;

    if (DEBUG && (gUnknown_02023A14_50 & 4)
        && !(gBattleCommunication[MOVE_EFFECT_BYTE] & MOVE_EFFECT_CERTAIN)
        && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
    {
        SetMoveEffect(0, 0);
    }
    else if ((gBattleCommunication[MOVE_EFFECT_BYTE] & MOVE_EFFECT_CERTAIN)
        && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
    {
        gBattleCommunication[MOVE_EFFECT_BYTE] &= ~(MOVE_EFFECT_CERTAIN);
        SetMoveEffect(0, MOVE_EFFECT_CERTAIN);
    }
    else if (Random() % 100 <= percentChance  // Random() % 100 < percentChance in Emerald
             && gBattleCommunication[MOVE_EFFECT_BYTE]
             && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
    {
        if (percentChance >= 100)
            SetMoveEffect(0, MOVE_EFFECT_CERTAIN);
        else
            SetMoveEffect(0, 0);
    }
    else
    {
        gBattlescriptCurrInstr++;
    }

    gBattleCommunication[MOVE_EFFECT_BYTE] = 0;
    gBattleStruct->multihitMoveEffect = 0;
}

static void atk16_seteffectprimary(void)
{
    SetMoveEffect(1, 0);
}

static void atk17_seteffectsecondary(void)
{
    SetMoveEffect(0, 0);
}

static void atk18_clearstatusfromeffect(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    if (gBattleCommunication[MOVE_EFFECT_BYTE] <= MOVE_EFFECT_TOXIC)
        gBattleMons[gActiveBattler].status1 &= (~sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]]);
    else
        gBattleMons[gActiveBattler].status2 &= (~sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]]);

    gBattleCommunication[MOVE_EFFECT_BYTE] = 0;
    gBattlescriptCurrInstr += 2;
    gBattleStruct->multihitMoveEffect = 0;
}

static void atk19_tryfaintmon(void)
{
    const u8 *BS_ptr;

    if (gBattlescriptCurrInstr[2] != 0)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        if (gHitMarker & HITMARKER_FAINTED(gActiveBattler))
        {
            BS_ptr = T1_READ_PTR(gBattlescriptCurrInstr + 3);

            BattleScriptPop();
            gBattlescriptCurrInstr = BS_ptr;
            gSideStatuses[GetBattlerSide(gActiveBattler)] &= ~(SIDE_STATUS_SPIKES_DAMAGED);
        }
        else
        {
            gBattlescriptCurrInstr += 7;
        }
    }
    else
    {
        u8 battlerId;

        if (gBattlescriptCurrInstr[1] == 1)
        {
            gActiveBattler = gBattlerAttacker;
            battlerId = gBattlerTarget;
            BS_ptr = BattleScript_FaintAttacker;
        }
        else
        {
            gActiveBattler = gBattlerTarget;
            battlerId = gBattlerAttacker;
            BS_ptr = BattleScript_FaintTarget;
        }
        if (!(gAbsentBattlerFlags & gBitTable[gActiveBattler])
         && gBattleMons[gActiveBattler].hp == 0)
        {
            gSharedMem[BSTRUCT_OFF(lastTakenMove) + 2 * battlerId + 0] = 0;
            gSharedMem[BSTRUCT_OFF(lastTakenMove) + 2 * battlerId + 1] = 0;
            gSharedMem[BSTRUCT_OFF(lastTakenMoveFrom) + 4 * battlerId + 0] = 0;
            gSharedMem[BSTRUCT_OFF(lastTakenMoveFrom) + 4 * battlerId + 1] = 0;
            gSharedMem[BSTRUCT_OFF(lastTakenMoveFrom) + 4 * battlerId + 2] = 0;
            gSharedMem[BSTRUCT_OFF(lastTakenMoveFrom) + 4 * battlerId + 3] = 0;

            gHitMarker |= HITMARKER_FAINTED(gActiveBattler);
            BattleScriptPush(gBattlescriptCurrInstr + 7);
            gBattlescriptCurrInstr = BS_ptr;
            if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            {
                gHitMarker |= HITMARKER_PLAYER_FAINTED;
                if (gBattleResults.playerFaintCounter < 0xFF)
                    gBattleResults.playerFaintCounter++;
                if (gBattleMons[battlerId].level > gBattleMons[gActiveBattler].level)
                {
                    if (gBattleMons[battlerId].level - gBattleMons[gActiveBattler].level > 29)
                        AdjustFriendship(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], FRIENDSHIP_EVENT_FAINT_LARGE);
                    else
                        AdjustFriendship(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], FRIENDSHIP_EVENT_FAINT_SMALL);
                }
            }
            else
            {
                if (gBattleResults.opponentFaintCounter < 0xFF)
                    gBattleResults.opponentFaintCounter++;
                gBattleResults.lastOpponentSpecies = gBattleMons[gActiveBattler].species;
            }
            if ((gHitMarker & HITMARKER_DESTINYBOND) && gBattleMons[gBattlerAttacker].hp != 0)
            {
                BattleScriptPush(gBattlescriptCurrInstr);
                gBattleMoveDamage = gBattleMons[battlerId].hp;
                gBattlescriptCurrInstr = BattleScript_DestinyBondTakesLife;
            }
            if ((gStatuses3[gBattlerTarget] & STATUS3_GRUDGE)
             && !(gHitMarker & HITMARKER_GRUDGE)
             && GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gBattlerTarget)
             && gBattleMons[gBattlerAttacker].hp != 0
             && gCurrentMove != MOVE_STRUGGLE)
            {
                u8 moveIndex = gSharedMem[BSTRUCT_OFF(ChosenMoveID) + gBattlerAttacker];

                gBattleMons[gBattlerAttacker].pp[moveIndex] = 0;
                BattleScriptPush(gBattlescriptCurrInstr);
                gBattlescriptCurrInstr = BattleScript_GrudgeTakesPp;
                gActiveBattler = gBattlerAttacker;
                BtlController_EmitSetMonData(0, moveIndex + 9, 0, 1, &gBattleMons[gActiveBattler].pp[moveIndex]);
                MarkBattlerForControllerExec(gActiveBattler);

                PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerAttacker].moves[moveIndex]);
            }
        }
        else
        {
            gBattlescriptCurrInstr += 7;
        }
    }
}

static void atk1A_dofaintanimation(void)
{
    if (gBattleControllerExecFlags == 0)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        BtlController_EmitFaintAnimation(0);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 2;
    }
}

static void atk1B_cleareffectsonfaint(void)
{
    //Clears things like attraction or trapping to other banks
    if (gBattleControllerExecFlags == 0)
    {
        gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
        gBattleMons[gActiveBattler].status1 = 0;
        BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 0x4, &gBattleMons[gActiveBattler].status1);
        MarkBattlerForControllerExec(gActiveBattler);
        UndoEffectsAfterFainting();
        gBattlescriptCurrInstr += 2;
    }
}

static void atk1C_jumpifstatus(void)
{
    u8 bank = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    u32 flags = T2_READ_32(gBattlescriptCurrInstr + 2);
    void* jump_loc = T2_READ_PTR(gBattlescriptCurrInstr + 6);
    if (gBattleMons[bank].status1 & flags && gBattleMons[bank].hp)
        gBattlescriptCurrInstr = jump_loc;
    else
        gBattlescriptCurrInstr += 10;
}

static void atk1D_jumpifstatus2(void)
{
    u8 battlerId = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    u32 flags = T2_READ_32(gBattlescriptCurrInstr + 2);
    void* jump_loc = T2_READ_PTR(gBattlescriptCurrInstr + 6);
    if (gBattleMons[battlerId].status2 & flags && gBattleMons[battlerId].hp)
        gBattlescriptCurrInstr = jump_loc;
    else
        gBattlescriptCurrInstr += 10;
}

static void atk1E_jumpifability(void)
{
    u8 battlerId;
    u8 ability = gBattlescriptCurrInstr[2];
    void* jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 3);
    if (T2_READ_8(gBattlescriptCurrInstr + 1) == 8)
    {
        battlerId = AbilityBattleEffects(ABILITYEFFECT_CHECK_BANK_SIDE, gBattlerAttacker, ability, 0, 0);
        if (battlerId)
        {
            gLastUsedAbility = ability;
            gBattlescriptCurrInstr = jumpPtr;
            RecordAbilityBattle(battlerId -1, gLastUsedAbility);
            gBattleStruct->unk160F8 = battlerId - 1;
        }
        else
            gBattlescriptCurrInstr += 7;
    }
    else if (T2_READ_8(gBattlescriptCurrInstr + 1) == 9)
    {
        battlerId = AbilityBattleEffects(ABILITYEFFECT_CHECK_OTHER_SIDE, gBattlerAttacker, ability, 0, 0);
        if (battlerId)
        {
            gLastUsedAbility = ability;
            gBattlescriptCurrInstr = jumpPtr;
            RecordAbilityBattle(battlerId - 1, gLastUsedAbility);
            gBattleStruct->unk160F8 = battlerId - 1;
        }
        else
            gBattlescriptCurrInstr += 7;
    }
    else
    {
        battlerId = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
        if (gBattleMons[battlerId].ability == ability)
        {
            gLastUsedAbility = ability;
            gBattlescriptCurrInstr = jumpPtr;
            RecordAbilityBattle(battlerId, gLastUsedAbility);
            gBattleStruct->unk160F8 = battlerId;
        }
        else
            gBattlescriptCurrInstr += 7;
    }
}

static void atk1F_jumpifsideaffecting(void)
{
    u8 side;
    u16 flags;
    void* jump_loc;
    if (T2_READ_8(gBattlescriptCurrInstr + 1) == 1)
        side = GetBattlerPosition(gBattlerAttacker) & 1;
    else
        side = GetBattlerPosition(gBattlerTarget) & 1;

    flags = T2_READ_16(gBattlescriptCurrInstr + 2);
    jump_loc = T2_READ_PTR(gBattlescriptCurrInstr + 4);

    if (gSideStatuses[side] & flags)
        gBattlescriptCurrInstr = jump_loc;
    else
        gBattlescriptCurrInstr += 8;
}

static void atk20_jumpifstat(void)
{
    u8 ret = 0;
    u8 battlerId = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    u8 value = gBattleMons[battlerId].statStages[T2_READ_8(gBattlescriptCurrInstr + 3)];
    switch (T2_READ_8(gBattlescriptCurrInstr + 2))
    {
    case CMP_EQUAL:
        if (value == T2_READ_8(gBattlescriptCurrInstr + 4))
            ret++;
        break;
    case CMP_NOT_EQUAL:
        if (value != T2_READ_8(gBattlescriptCurrInstr + 4))
            ret++;
        break;
    case CMP_GREATER_THAN:
        if (value > T2_READ_8(gBattlescriptCurrInstr + 4))
            ret++;
        break;
    case CMP_LESS_THAN:
        if (value < T2_READ_8(gBattlescriptCurrInstr + 4))
            ret++;
        break;
    case CMP_COMMON_BITS:
        if (value & T2_READ_8(gBattlescriptCurrInstr + 4))
            ret++;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(value & T2_READ_8(gBattlescriptCurrInstr + 4)))
            ret++;
        break;
    }
    if (ret)
        gBattlescriptCurrInstr = T2_READ_PTR(gBattlescriptCurrInstr + 5);
    else
        gBattlescriptCurrInstr += 9;
}

static void atk21_jumpifstatus3condition(void)
{
    u32 flags;
    void* jump_loc;

    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    flags = T2_READ_32(gBattlescriptCurrInstr + 2);
    jump_loc = T2_READ_PTR(gBattlescriptCurrInstr + 7);
    if (T2_READ_8(gBattlescriptCurrInstr + 6))
    {
        if ((gStatuses3[gActiveBattler] & flags) != 0)
            gBattlescriptCurrInstr += 11;
        else
            gBattlescriptCurrInstr = jump_loc;
    }
    else
    {
        if ((gStatuses3[gActiveBattler] & flags) != 0)
            gBattlescriptCurrInstr = jump_loc;
        else
            gBattlescriptCurrInstr += 11;
    }
}

static void atk22_jumpiftype(void) //u8 battlerId, u8 type, *ptr
{
    u8 battlerId = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    u8 type = T2_READ_8(gBattlescriptCurrInstr + 2);
    void* jump_loc = T2_READ_PTR(gBattlescriptCurrInstr + 3);

    if (gBattleMons[battlerId].type1 == type || gBattleMons[battlerId].type2 == type)
        gBattlescriptCurrInstr = jump_loc;
    else
        gBattlescriptCurrInstr += 7;
}

static void atk23_getexp(void)
{
    u16 item;
    s32 i; // also used as stringId
    u8 holdEffect;
    s32 sentIn;

    s32 viaExpShare = 0;
    u16* exp = &gBattleStruct->exp;

    gBank1 = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    sentIn = gSentPokesToOpponent[(gBank1 & 2) >> 1];

    switch (gBattleStruct->getexpStateTracker)
    {
    case 0: // check if should receive exp at all
        if (GetBattlerSide(gBank1) != B_SIDE_OPPONENT || (gBattleTypeFlags &
             (BATTLE_TYPE_LINK
              | BATTLE_TYPE_SAFARI
              | BATTLE_TYPE_BATTLE_TOWER
              | BATTLE_TYPE_EREADER_TRAINER)))
        {
            gBattleStruct->getexpStateTracker = 6; // goto last case
        }
        else
        {
            gBattleStruct->getexpStateTracker++;
            gBattleStruct->givenExpMons |= gBitTable[gBattlerPartyIndexes[gBank1]];
        }
        break;
    case 1: // calculate experience points to redistribute
        {
            u16 calculatedExp;
            s32 viaSentIn;

            for (viaSentIn = 0, i = 0; i < PARTY_SIZE; i++)
            {
                if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) == SPECIES_NONE || GetMonData(&gPlayerParty[i], MON_DATA_HP) == 0)
                    continue;
                if (gBitTable[i] & sentIn)
                    viaSentIn++;

                item = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);

                if (item == ITEM_ENIGMA_BERRY)
                    holdEffect = gSaveBlock1.enigmaBerry.holdEffect;
                else
                    holdEffect = ItemId_GetHoldEffect(item);

                if (holdEffect == HOLD_EFFECT_EXP_SHARE)
                    viaExpShare++;
            }

            calculatedExp = gBaseStats[gBattleMons[gBank1].species].expYield * gBattleMons[gBank1].level / 7;

            if (viaExpShare) // at least one mon is getting exp via exp share
            {
                *exp = calculatedExp / 2 / viaSentIn;
                if (*exp == 0)
                    *exp = 1;

                gExpShareExp = calculatedExp / 2 / viaExpShare;
                if (gExpShareExp == 0)
                    gExpShareExp = 1;
            }
            else
            {
                *exp = calculatedExp / viaSentIn;
                if (*exp == 0)
                    *exp = 1;
                gExpShareExp = 0;
            }

            gBattleStruct->getexpStateTracker++;
            gBattleStruct->expGetterMonId = 0;
            gBattleStruct->sentInPokes = sentIn;
        }
        // fall through
    case 2: // set exp value to the poke in expgetter_id and print message
        if (gBattleControllerExecFlags == 0)
        {
            item = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_HELD_ITEM);

            if (item == ITEM_ENIGMA_BERRY)
                holdEffect = gSaveBlock1.enigmaBerry.holdEffect;
            else
                holdEffect = ItemId_GetHoldEffect(item);

            if (holdEffect != HOLD_EFFECT_EXP_SHARE && !(gBattleStruct->sentInPokes & 1))
            {
                gBattleStruct->sentInPokes >>= 1;
                gBattleStruct->getexpStateTracker = 5;
                gBattleMoveDamage = 0; // used for exp
            }
            else if (GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_LEVEL) == 100)
            {
                gBattleStruct->sentInPokes >>= 1;
                gBattleStruct->getexpStateTracker = 5;
                gBattleMoveDamage = 0; // used for exp
            }
            else
            {
                // music change in wild battle after fainting a poke
                if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER) && gBattleMons[0].hp && !gBattleStruct->wildVictorySong)
                {
                    BattleStopLowHpSound();
                    PlayBGM(MUS_VICTORY_WILD);
                    gBattleStruct->wildVictorySong++;
                }

                if (GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_HP))
                {
                    if (gBattleStruct->sentInPokes & 1)
                        gBattleMoveDamage = *exp;
                    else
                        gBattleMoveDamage = 0;

                    if (holdEffect == HOLD_EFFECT_EXP_SHARE)
                        gBattleMoveDamage += gExpShareExp;
                    if (holdEffect == HOLD_EFFECT_LUCKY_EGG)
                        gBattleMoveDamage = (gBattleMoveDamage * 150) / 100;
                    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                        gBattleMoveDamage = (gBattleMoveDamage * 150) / 100;

                    if (IsTradedMon(&gPlayerParty[gBattleStruct->expGetterMonId]))
                    {
                        gBattleMoveDamage = (gBattleMoveDamage * 150) / 100;
                        i = 0x14A;
                    }
                    else
                    {
                        i = 0x149;
                    }

                    // get exp getter bank
                    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                    {
                        if (!(gBattlerPartyIndexes[2] != gBattleStruct->expGetterMonId) && !(gAbsentBattlerFlags & gBitTable[2]))
                            gBattleStruct->expGetterBattlerId = 2;
                        else
                        {
                            if (!(gAbsentBattlerFlags & gBitTable[0]))
                                gBattleStruct->expGetterBattlerId = 0;
                            else
                                gBattleStruct->expGetterBattlerId = 2;
                        }
                    }
                    else
                        gBattleStruct->expGetterBattlerId = 0;

                    PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gBattleStruct->expGetterBattlerId, gBattleStruct->expGetterMonId)

					// buffer 'gained' or 'gained a boosted'
					PREPARE_STRING_BUFFER(gBattleTextBuff2, i)

                    PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff3, 5, gBattleMoveDamage)

                    PrepareStringBattle(STRINGID_PKMNGAINEDEXP, gBattleStruct->expGetterBattlerId);
                    MonGainEVs(&gPlayerParty[gBattleStruct->expGetterMonId], gBattleMons[gBank1].species);
                }
                gBattleStruct->sentInPokes >>= 1;
                gBattleStruct->getexpStateTracker++;
            }
        }
        break;
    case 3: // Set stats and give exp
        if (gBattleControllerExecFlags == 0)
        {
            gBattleBufferB[gBattleStruct->expGetterBattlerId][0] = 0;
            if (GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_HP) && GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_LEVEL) != 100)
            {
                gBattleResources_statsBeforeLvlUp->hp = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_MAX_HP);
                gBattleResources_statsBeforeLvlUp->atk = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_ATK);
                gBattleResources_statsBeforeLvlUp->def = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_DEF);
                gBattleResources_statsBeforeLvlUp->spd = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPEED);
                gBattleResources_statsBeforeLvlUp->spAtk = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPATK);
                gBattleResources_statsBeforeLvlUp->spDef = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPDEF);

                gActiveBattler = gBattleStruct->expGetterBattlerId;

                BtlController_EmitExpUpdate(0, gBattleStruct->expGetterMonId, gBattleMoveDamage);
                MarkBattlerForControllerExec(gActiveBattler);
            }
            gBattleStruct->getexpStateTracker++;
        }
        break;
    case 4: // lvl up if necessary
        if (gBattleControllerExecFlags == 0)
        {
            gActiveBattler = gBattleStruct->expGetterBattlerId;
            if (gBattleBufferB[gActiveBattler][0] == CONTROLLER_TWORETURNVALUES
             && gBattleBufferB[gActiveBattler][1] == RET_VALUE_LEVELLED_UP)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && gBattlerPartyIndexes[gActiveBattler] == gBattleStruct->expGetterMonId)
                    HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);

                PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gActiveBattler, gBattleStruct->expGetterMonId)

                PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff2, 3, GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_LEVEL))

                BattleScriptPushCursor();
                gLeveledUpInBattle |= gBitTable[gBattleStruct->expGetterMonId];
                gBattlescriptCurrInstr = BattleScript_LevelUp;
                gBattleMoveDamage = (gBattleBufferB[gActiveBattler][2] | (gBattleBufferB[gActiveBattler][3] << 8));
                AdjustFriendship(&gPlayerParty[gBattleStruct->expGetterMonId], FRIENDSHIP_EVENT_GROW_LEVEL);

                // update battle mon structure after level up
                if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId && gBattleMons[0].hp)
                {
                    gBattleMons[0].level = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_LEVEL);
                    gBattleMons[0].hp = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_HP);
                    gBattleMons[0].maxHP = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_MAX_HP);
                    gBattleMons[0].attack = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_ATK);
                    gBattleMons[0].defense = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_DEF);
                    // Why is this duplicated?
                    gBattleMons[0].speed = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPEED);
                    gBattleMons[0].speed = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPEED);
                    gBattleMons[0].spAttack = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPATK);
                    gBattleMons[0].spDefense = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPDEF);
                }
                // What is else if?
                if (gBattlerPartyIndexes[2] == gBattleStruct->expGetterMonId && gBattleMons[2].hp && (gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
                {
                    gBattleMons[2].level = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_LEVEL);
                    gBattleMons[2].hp = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_HP);
                    gBattleMons[2].maxHP = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_MAX_HP);
                    gBattleMons[2].attack = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_ATK);
                    gBattleMons[2].defense = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_DEF);
                    // Duplicated again, but this time there's no Sp Defense
                    gBattleMons[2].speed = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPEED);
                    gBattleMons[2].speed = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPEED);
                    gBattleMons[2].spAttack = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPATK);
                }
            }
            else
            {
                gBattleMoveDamage = 0;
            }
            gBattleStruct->getexpStateTracker = 5;
        }
        break;
    case 5: // looper increment
        if (gBattleMoveDamage) // there is exp to give, goto case 3 that gives exp
            gBattleStruct->getexpStateTracker = 3;
        else
        {
            gBattleStruct->expGetterMonId++;
            if (gBattleStruct->expGetterMonId <= 5)
                gBattleStruct->getexpStateTracker = 2; // loop again
            else
                gBattleStruct->getexpStateTracker = 6; // we're done
        }
        break;
    case 6: // increment instruction
        if (gBattleControllerExecFlags == 0)
        {
            // not sure why gf clears the item and ability here
            gBattleMons[gBank1].item = 0;
            gBattleMons[gBank1].ability = 0;
            gBattlescriptCurrInstr += 2;
        }
        break;
    }
}

static void atk24(void)
{
    u16 HP_count = 0;
    s32 i;
    s32 found1;
    s32 found2;

    if (gBattleControllerExecFlags == 0)
    {
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) && !GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
                HP_count += GetMonData(&gPlayerParty[i], MON_DATA_HP);
        }

        if (HP_count == 0)
            gBattleOutcome |= B_OUTCOME_LOST;

        for (HP_count = 0, i = 0; i < PARTY_SIZE; i++)
        {
            if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES) && !GetMonData(&gEnemyParty[i], MON_DATA_IS_EGG))
                HP_count += GetMonData(&gEnemyParty[i], MON_DATA_HP);
        }

        if (HP_count == 0)
            gBattleOutcome |= B_OUTCOME_WON;

        if (!gBattleOutcome && (gBattleTypeFlags & BATTLE_TYPE_LINK))
        {
            for (found1 = 0, i = 0; i < gBattlersCount; i += 2)
            {
                if ((gHitMarker & HITMARKER_FAINTED2(i)) && !gSpecialStatuses[i].flag40)
                    found1++;
            }

            for (found2 = 0, i = 1; i < gBattlersCount; i += 2)
            {
                if ((gHitMarker & HITMARKER_FAINTED2(i)) && !gSpecialStatuses[i].flag40)
                    found2++;
            }

            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                if (found2 + found1 > 1)
                    gBattlescriptCurrInstr = T2_READ_PTR(gBattlescriptCurrInstr + 1);
                else
                    gBattlescriptCurrInstr += 5;
            }
            else
            {
                if (found2 != 0 && found1 != 0)
                    gBattlescriptCurrInstr = T2_READ_PTR(gBattlescriptCurrInstr + 1);
                else
                    gBattlescriptCurrInstr += 5;
            }
        }
        else
        {
            gBattlescriptCurrInstr += 5;
        }
    }
}

static void MoveValuesCleanUp(void)
{
    gMoveResultFlags = 0;
    gBattleStruct->dmgMultiplier = 1;
    gCritMultiplier = 1;
    gBattleCommunication[MOVE_EFFECT_BYTE] = 0;
    gBattleCommunication[6] = 0;
    gHitMarker &= ~(HITMARKER_DESTINYBOND);
    gHitMarker &= ~(HITMARKER_SYNCHRONIZE_EFFECT);
}

static void atk25_movevaluescleanup(void)
{
    MoveValuesCleanUp();
    gBattlescriptCurrInstr += 1;
}

static void atk26_setmultihit(void)
{
    gMultiHitCounter = T2_READ_8(gBattlescriptCurrInstr + 1);
    gBattlescriptCurrInstr += 2;
}

static void atk27_decrementmultihit(void)
{
    if (--gMultiHitCounter == 0)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = T2_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atk28_goto(void)
{
    gBattlescriptCurrInstr = T2_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atk29_jumpifbyte(void)
{
    u8 caseID = T2_READ_8(gBattlescriptCurrInstr + 1);
    u8* ptr = T2_READ_PTR(gBattlescriptCurrInstr + 2);
    u8 value = T2_READ_8(gBattlescriptCurrInstr + 6);
    u8* jump_loc = T2_READ_PTR(gBattlescriptCurrInstr + 7);
    gBattlescriptCurrInstr += 11;
    switch (caseID)
    {
    case CMP_EQUAL:
        if (*ptr == value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_NOT_EQUAL:
        if (*ptr != value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_GREATER_THAN:
        if (*ptr > value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_LESS_THAN:
        if (*ptr < value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_COMMON_BITS:
        if (*ptr & value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(*ptr & value))
            gBattlescriptCurrInstr = jump_loc;
        break;
    }
}

static void atk2A_jumpifhalfword(void)
{
    u8 caseID = T2_READ_8(gBattlescriptCurrInstr + 1);
    u16* ptr = T2_READ_PTR(gBattlescriptCurrInstr + 2);
    u16 value = T2_READ_16(gBattlescriptCurrInstr + 6);
    u8* jump_loc = T2_READ_PTR(gBattlescriptCurrInstr + 8);
    gBattlescriptCurrInstr += 12;
    switch (caseID)
    {
    case CMP_EQUAL:
        if (*ptr == value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_NOT_EQUAL:
        if (*ptr != value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_GREATER_THAN:
        if (*ptr > value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_LESS_THAN:
        if (*ptr < value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_COMMON_BITS:
        if (*ptr & value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(*ptr & value))
            gBattlescriptCurrInstr = jump_loc;
        break;
    }
}

// Strange that there's an instance of T1_READ_32 in what seems to be a T2 function. see global.h for the distinction.
static void atk2B_jumpifword(void)
{
    u8 caseID = T2_READ_8(gBattlescriptCurrInstr + 1);
    u32* ptr = T2_READ_PTR(gBattlescriptCurrInstr + 2);
    u32 value = T1_READ_32(gBattlescriptCurrInstr + 6);
    u8* jump_loc = T2_READ_PTR(gBattlescriptCurrInstr + 10);
    gBattlescriptCurrInstr += 14;
    switch (caseID)
    {
    case CMP_EQUAL:
        if (*ptr == value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_NOT_EQUAL:
        if (*ptr != value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_GREATER_THAN:
        if (*ptr > value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_LESS_THAN:
        if (*ptr < value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_COMMON_BITS:
        if (*ptr & value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(*ptr & value))
            gBattlescriptCurrInstr = jump_loc;
        break;
    }
}

static void atk2C_jumpifarrayequal(void)
{
    //Mem1, Mem2, Size, Jump Loc
    u8* mem1 = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u8* mem2 = T2_READ_PTR(gBattlescriptCurrInstr + 5);
    u32 size = T2_READ_8(gBattlescriptCurrInstr + 9);
    u8* jump_loc = T2_READ_PTR(gBattlescriptCurrInstr + 10);

    u8 i;
    for (i = 0; i < size; i++)
    {
        if (*mem1 != *mem2)
        {
            gBattlescriptCurrInstr += 14;
            break;
        }
        mem1++, mem2++;
    }

    if (i == size)
        gBattlescriptCurrInstr = jump_loc;
}

static void atk2D_jumpifarraynotequal(void)
{
    //Mem1, Mem2, Size, Jump Loc
    u8 equal_bytes = 0;
    u8* mem1 = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u8* mem2 = T2_READ_PTR(gBattlescriptCurrInstr + 5);
    u32 size = T2_READ_8(gBattlescriptCurrInstr + 9);
    u8* jump_loc = T2_READ_PTR(gBattlescriptCurrInstr + 10);

    u8 i;
    for (i = 0; i < size; i++)
    {
        if (*mem1 == *mem2)
        {
            equal_bytes++;
        }
        mem1++, mem2++;
    }

    if (equal_bytes != size)
        gBattlescriptCurrInstr = jump_loc;
    else
        gBattlescriptCurrInstr += 14;
}

static void atk2E_setbyte(void)
{
    u8* mem = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    *mem = T2_READ_8(gBattlescriptCurrInstr + 5);
    gBattlescriptCurrInstr += 6;
}

static void atk2F_addbyte(void)
{
    u8* mem = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    *mem += T2_READ_8(gBattlescriptCurrInstr + 5);
    gBattlescriptCurrInstr += 6;
}

static void atk30_subbyte(void)
{
    u8* mem = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    *mem -= T2_READ_8(gBattlescriptCurrInstr + 5);
    gBattlescriptCurrInstr += 6;
}

static void atk31_copyarray(void)
{
    u8* mem1 = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u8* mem2 = T2_READ_PTR(gBattlescriptCurrInstr + 5);
    s32 size = T2_READ_8(gBattlescriptCurrInstr + 9);

    s32 i;
    for (i = 0; i < size; i++)
    {
        mem1[i] = mem2[i];
    }

    gBattlescriptCurrInstr += 10;
}

static void atk32_copyarraywithindex(void)
{
    u8* mem1 = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u8* mem2 = T2_READ_PTR(gBattlescriptCurrInstr + 5);
    u8* index = T2_READ_PTR(gBattlescriptCurrInstr + 9);
    s32 size = T2_READ_8(gBattlescriptCurrInstr + 13);

    s32 i;
    for (i = 0; i < size; i++)
    {
        mem1[i] = mem2[i + *index];
    }

    gBattlescriptCurrInstr += 14;
}

static void atk33_orbyte(void)
{
    u8* mem = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    *mem |= T2_READ_8(gBattlescriptCurrInstr + 5);
    gBattlescriptCurrInstr += 6;
}

static void atk34_orhalfword(void)
{
    u16* mem = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u16 val = T2_READ_16(gBattlescriptCurrInstr + 5);

    *mem |= val;
    gBattlescriptCurrInstr += 7;
}

static void atk35_orword(void)
{
    u32* mem = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u32 val = T2_READ_32(gBattlescriptCurrInstr + 5);

    *mem |= val;
    gBattlescriptCurrInstr += 9;
}

static void atk36_bicbyte(void)
{
    u8* mem = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    *mem &= ~(T2_READ_8(gBattlescriptCurrInstr + 5));
    gBattlescriptCurrInstr += 6;
}

static void atk37_bichalfword(void)
{
    u16* mem = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u16 val = T2_READ_16(gBattlescriptCurrInstr + 5);

    *mem &= ~val;
    gBattlescriptCurrInstr += 7;
}

static void atk38_bicword(void)
{
    u32* mem = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u32 val = T2_READ_32(gBattlescriptCurrInstr + 5);

    *mem &= ~val;
    gBattlescriptCurrInstr += 9;
}

static void atk39_pause(void)
{
    if (gBattleControllerExecFlags == 0)
    {
        u16 value = T2_READ_16(gBattlescriptCurrInstr + 1);
        if (++gPauseCounterBattle >= value)
        {
            gPauseCounterBattle = 0;
            gBattlescriptCurrInstr += 3;
        }
    }
}

static void atk3A_waitstate(void)
{
    if (gBattleControllerExecFlags == 0)
        gBattlescriptCurrInstr++;
}

static void atk3B_healthbar_update(void)
{
    if (!T2_READ_8(gBattlescriptCurrInstr + 1))
        gActiveBattler = gBattlerTarget;
    else
        gActiveBattler = gBattlerAttacker;

    BtlController_EmitHealthBarUpdate(0, gBattleMoveDamage);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

static void atk3C_return(void)
{
    BattleScriptPop();
}

static void atk3D_end(void)
{
    gMoveResultFlags = 0;
    gActiveBattler = 0;
    gCurrentActionFuncId = 0xB;
}

static void atk3E_end2(void)
{
    //not much difference between this and 3D. It's more apparent in Emerald
    gActiveBattler = 0;
    gCurrentActionFuncId = 0xB;
}

static void atk3F_end3(void) //pops the main function stack
{
    BattleScriptPop();
    if (B_FUNCTION_STACK->size)
        B_FUNCTION_STACK->size--;
    gBattleMainFunc = B_FUNCTION_STACK->ptr[B_FUNCTION_STACK->size];
}

static void atk41_call(void)
{
    BattleScriptPush(gBattlescriptCurrInstr + 5);
    gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atk42_jumpiftype2(void) //u8 bank, u8 type, *ptr
{
    u8 bank = GetBattlerForBattleScript(T1_READ_8(gBattlescriptCurrInstr + 1));

    if (T1_READ_8(gBattlescriptCurrInstr + 2) == gBattleMons[bank].type1 || T1_READ_8(gBattlescriptCurrInstr + 2) == gBattleMons[bank].type2)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 3);
    else
        gBattlescriptCurrInstr += 7;
}

static void atk43_jumpifabilitypresent(void)
{
    if (AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, T2_READ_8(gBattlescriptCurrInstr + 1), 0, 0))
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
    else
        gBattlescriptCurrInstr += 6;
}

static void atk44_endselectionscript(void)
{
    gSharedMem[BSTRUCT_OFF(selectionScriptFinished) + gBattlerAttacker] = 1;
}

static void atk45_playanimation(void)
{
    const u16* argumentPtr;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    argumentPtr = BS2ScriptReadPtr(gBattlescriptCurrInstr + 3);

    if (gBattlescriptCurrInstr[2] == B_ANIM_STATS_CHANGE
        || gBattlescriptCurrInstr[2] == B_ANIM_SNATCH_MOVE
        || gBattlescriptCurrInstr[2] == B_ANIM_SUBSTITUTE_FADE)
    {
        BtlController_EmitBattleAnimation(0, gBattlescriptCurrInstr[2], *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 7;
    }
    else if (gHitMarker & HITMARKER_NO_ANIMATIONS)
    {
        BattleScriptPush(gBattlescriptCurrInstr + 7);
        gBattlescriptCurrInstr = BattleScript_Pausex20;
    }
    else if (gBattlescriptCurrInstr[2] == B_ANIM_RAIN_CONTINUES
             || gBattlescriptCurrInstr[2] == B_ANIM_SUN_CONTINUES
             || gBattlescriptCurrInstr[2] == B_ANIM_SANDSTORM_CONTINUES
             || gBattlescriptCurrInstr[2] == B_ANIM_HAIL_CONTINUES)
    {
        BtlController_EmitBattleAnimation(0, gBattlescriptCurrInstr[2], *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 7;
    }
    else if (gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE)
    {
        gBattlescriptCurrInstr += 7;
    }
    else
    {
        BtlController_EmitBattleAnimation(0, gBattlescriptCurrInstr[2], *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 7;
    }
}

static void atk46_playanimation2(void) // animation Id is stored in the first pointer
{
    const u16* argumentPtr;
    const u8* animationIdPtr;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    animationIdPtr = BS2ScriptReadPtr(gBattlescriptCurrInstr + 2);
    argumentPtr = BS2ScriptReadPtr(gBattlescriptCurrInstr + 6);

    if (*animationIdPtr == B_ANIM_STATS_CHANGE
        || *animationIdPtr == B_ANIM_SNATCH_MOVE
        || *animationIdPtr == B_ANIM_SUBSTITUTE_FADE)
    {
        BtlController_EmitBattleAnimation(0, *animationIdPtr, *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 10;
    }
    else if (gHitMarker & HITMARKER_NO_ANIMATIONS)
    {
        gBattlescriptCurrInstr += 10;
    }
    else if (*animationIdPtr == B_ANIM_RAIN_CONTINUES
             || *animationIdPtr == B_ANIM_SUN_CONTINUES
             || *animationIdPtr == B_ANIM_SANDSTORM_CONTINUES
             || *animationIdPtr == B_ANIM_HAIL_CONTINUES)
    {
        BtlController_EmitBattleAnimation(0, *animationIdPtr, *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 10;
    }
    else if (gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE)
    {
        gBattlescriptCurrInstr += 10;
    }
    else
    {
        BtlController_EmitBattleAnimation(0, *animationIdPtr, *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 10;
    }
}

static void atk47_setgraphicalstatchangevalues(void)
{
    u8 to_add = 0;
    switch (gBattleStruct->statChanger & 0xF0)
    {
    case 0x10: //+1
        to_add = 0xF;
        break;
    case 0x20: //+2
        to_add = 0x27;
        break;
    case 0x90: //-1
        to_add = 0x16;
        break;
    case 0xA0: //-2
        to_add = 0x2E;
        break;
    }
    gBattleStruct->animArg1 = (gBattleStruct->statChanger & 0xF) + to_add - 1;
    gBattleStruct->animArg2 = 0;
    gBattlescriptCurrInstr++;
}

static void atk48_playstatchangeanimation(void)
{
    u32 currStat = 0;
    u16 statAnimId = 0;
    s32 changeableStatsCount = 0;
    u8 statsToCheck = 0;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    statsToCheck = gBattlescriptCurrInstr[2];

    if (gBattlescriptCurrInstr[3] & STAT_CHANGE_NEGATIVE) // goes down
    {
        s16 startingStatAnimId;
        if (gBattlescriptCurrInstr[3] & STAT_CHANGE_BY_TWO)
            startingStatAnimId = STAT_ANIM_MINUS2 - 1;
        else
            startingStatAnimId = STAT_ANIM_MINUS1 - 1;

        while (statsToCheck != 0)
        {
            if (statsToCheck & 1)
            {
                if (gBattlescriptCurrInstr[3] & STAT_CHANGE_CANT_PREVENT)
                {
                    if (gBattleMons[gActiveBattler].statStages[currStat] > MIN_STAT_STAGE)
                    {
                        statAnimId = startingStatAnimId + currStat;
                        changeableStatsCount++;
                    }
                }
                else if (!gSideTimers[GET_BATTLER_SIDE(gActiveBattler)].mistTimer
                         && gBattleMons[gActiveBattler].ability != ABILITY_CLEAR_BODY
                         && gBattleMons[gActiveBattler].ability != ABILITY_WHITE_SMOKE
                         && !(gBattleMons[gActiveBattler].ability == ABILITY_KEEN_EYE && currStat == STAT_ACC)
                         && !(gBattleMons[gActiveBattler].ability == ABILITY_HYPER_CUTTER && currStat == STAT_ATK))
                {
                    if (gBattleMons[gActiveBattler].statStages[currStat] > MIN_STAT_STAGE)
                    {
                        statAnimId = startingStatAnimId + currStat;
                        changeableStatsCount++;
                    }
                }
            }
            statsToCheck >>= 1, currStat++;
        }

        if (changeableStatsCount > 1) // more than one stat, so the color is gray
        {
            if (gBattlescriptCurrInstr[3] & STAT_CHANGE_BY_TWO)
                statAnimId = STAT_ANIM_MULTIPLE_MINUS2;
            else
                statAnimId = STAT_ANIM_MULTIPLE_MINUS1;
        }
    }
    else // goes up
    {
        s16 startingStatAnimId;
        if (gBattlescriptCurrInstr[3] & STAT_CHANGE_BY_TWO)
            startingStatAnimId = STAT_ANIM_PLUS2 - 1;
        else
            startingStatAnimId = STAT_ANIM_PLUS1 - 1;

        while (statsToCheck != 0)
        {
            if (statsToCheck & 1 && gBattleMons[gActiveBattler].statStages[currStat] < MAX_STAT_STAGE)
            {
                statAnimId = startingStatAnimId + currStat;
                changeableStatsCount++;
            }
            statsToCheck >>= 1, currStat++;
        }

        if (changeableStatsCount > 1) // more than one stat, so the color is gray
        {
            if (gBattlescriptCurrInstr[3] & STAT_CHANGE_BY_TWO)
                statAnimId = STAT_ANIM_MULTIPLE_PLUS2;
            else
                statAnimId = STAT_ANIM_MULTIPLE_PLUS1;
        }
    }

    if (gBattlescriptCurrInstr[3] & STAT_CHANGE_MULTIPLE_STATS && changeableStatsCount < 2)
    {
        gBattlescriptCurrInstr += 4;
    }
    else if (changeableStatsCount != 0 && !gBattleStruct->statAnimPlayed)
    {
        BtlController_EmitBattleAnimation(0, B_ANIM_STATS_CHANGE, statAnimId);
        MarkBattlerForControllerExec(gActiveBattler);
        if (gBattlescriptCurrInstr[3] & STAT_CHANGE_MULTIPLE_STATS && changeableStatsCount > 1)
            gBattleStruct->statAnimPlayed = TRUE;
        gBattlescriptCurrInstr += 4;
    }
    else
    {
        gBattlescriptCurrInstr += 4;
    }
}

#define BattleScript_FlushMessageBox gUnknown_081D9B2D

extern u8 BattleScript_RageIsBuilding[];
extern u8 BattleScript_DefrostedViaFireMove[];
extern u8 BattleScript_FlushMessageBox[];

// atk49, moveend cases
#define ATK49_RAGE                              0
#define ATK49_DEFROST                           1
#define ATK49_SYNCHRONIZE_TARGET                2
#define ATK49_MOVE_END_ABILITIES                3
#define ATK49_STATUS_IMMUNITY_ABILITIES         4
#define ATK49_SYNCHRONIZE_ATTACKER              5
#define ATK49_CHOICE_MOVE                       6
#define ATK49_CHANGED_ITEMS                     7
#define ATK49_ATTACKER_INVISIBLE                8
#define ATK49_ATTACKER_VISIBLE                  9
#define ATK49_TARGET_VISIBLE                    10
#define ATK49_ITEM_EFFECTS_ALL                  11
#define ATK49_KINGSROCK_SHELLBELL               12
#define ATK49_SUBSTITUTE                        13
#define ATK49_UPDATE_LAST_MOVES                 14
#define ATK49_MIRROR_MOVE                       15
#define ATK49_NEXT_TARGET                       16
#define ATK49_COUNT                             17

void atk49_moveend(void)
{
    int i;
    bool32 effect = FALSE;
    u16 moveType;
    u8 holdEffectAtk;
    u16 *choicedMoveAtk;
    u8 arg1, arg2;

    arg1 = T2_READ_8(gBattlescriptCurrInstr + 1);
    arg2 = T2_READ_8(gBattlescriptCurrInstr + 2);

    if (gBattleMons[gBattlerAttacker].item == ITEM_ENIGMA_BERRY)
        holdEffectAtk = gEnigmaBerries[gBattlerAttacker].holdEffect;
    else
        holdEffectAtk = ItemId_GetHoldEffect(gBattleMons[gBattlerAttacker].item);

    choicedMoveAtk = &((u16*)(gSharedMem + 0x160E8))[gBattlerAttacker];
    GET_MOVE_TYPE(gCurrentMove, moveType);

    do
    {
        switch (gBattleStruct->cmd49StateTracker)
        {
        case ATK49_RAGE: // rage check
            if (gBattleMons[gBattlerTarget].status2 & STATUS2_RAGE
                && gBattleMons[gBattlerTarget].hp != 0 && gBattlerAttacker != gBattlerTarget
                && GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gBattlerTarget)
                && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT) && (gProtectStructs[gBattlerTarget].physicalDmg != 0 || gProtectStructs[gBattlerTarget].specialDmg != 0)
                && gBattleMoves[gCurrentMove].power && gBattleMons[gBattlerTarget].statStages[STAT_STAGE_ATK] <= 0xB)
            {
                gBattleMons[gBattlerTarget].statStages[STAT_STAGE_ATK]++;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_RageIsBuilding;
                effect = TRUE;
            }
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_DEFROST: // defrosting check
            if (gBattleMons[gBattlerTarget].status1 & STATUS1_FREEZE
                && gBattleMons[gBattlerTarget].hp && gBattlerAttacker != gBattlerTarget
                && gSpecialStatuses[gBattlerTarget].specialDmg
                && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT) && moveType == TYPE_FIRE)
            {
                gBattleMons[gBattlerTarget].status1 &= ~(STATUS1_FREEZE);
                gActiveBattler = gBattlerTarget;
                BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gBattlerTarget].status1);
                MarkBattlerForControllerExec(gActiveBattler);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_DefrostedViaFireMove;
                effect = TRUE;
            }
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_SYNCHRONIZE_TARGET: // target synchronize
            if (AbilityBattleEffects(ABILITYEFFECT_SYNCHRONIZE, gBattlerTarget, 0, 0, 0))
                effect = TRUE;
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_MOVE_END_ABILITIES: // Such as abilities activating on contact(Poison Spore, Rough Skin, etc.).
            if (AbilityBattleEffects(ABILITYEFFECT_MOVE_END, gBattlerTarget, 0, 0, 0))
                effect = TRUE;
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_STATUS_IMMUNITY_ABILITIES: //status immunities
            if (AbilityBattleEffects(ABILITYEFFECT_IMMUNITY, 0, 0, 0, 0))
                effect = TRUE; //it loops through 4 banks, so we increment after its done with all banks
            else
                gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_SYNCHRONIZE_ATTACKER: //attacker synchronize
            if (AbilityBattleEffects(ABILITYEFFECT_ATK_SYNCHRONIZE, gBattlerAttacker, 0, 0, 0))
                effect = TRUE;
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_CHOICE_MOVE: //update choice band move
            if (!(gHitMarker & HITMARKER_OBEYS) || holdEffectAtk != HOLD_EFFECT_CHOICE_BAND
                || gChosenMove == MOVE_STRUGGLE || (*choicedMoveAtk != 0 && *choicedMoveAtk != 0xFFFF))
                    goto LOOP;
            if (gChosenMove == MOVE_BATON_PASS && !(gMoveResultFlags & MOVE_RESULT_FAILED))
            {
                gBattleStruct->cmd49StateTracker++;
                break;
            }
            *choicedMoveAtk = gChosenMove;
            LOOP:
            {
                for (i = 0; i < 4; i++)
                {
                    if (gBattleMons[gBattlerAttacker].moves[i] == *choicedMoveAtk)
                        break;
                }
                if (i == 4)
                    *choicedMoveAtk = 0;
                gBattleStruct->cmd49StateTracker++;
            }
            break;
        case ATK49_CHANGED_ITEMS: // changed held items
            for (i = 0; i < gBattlersCount; i++)
            {
                #define CHANGED_ITEM ((u16 *)(gSharedMem + 0x160F0))
                if (CHANGED_ITEM[i] != 0)
                {
                    gBattleMons[i].item = CHANGED_ITEM[i];
                    CHANGED_ITEM[i] = 0;
                }
                #undef CHANGED_ITEM
            }
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_ATTACKER_INVISIBLE: // make attacker sprite invisible
            if (ItemBattleEffects(ITEMEFFECT_MOVE_END, 0, FALSE))
                effect = TRUE;
            else
                gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_ATTACKER_VISIBLE: // make attacker sprite visible
            if (ItemBattleEffects(ITEMEFFECT_KINGSROCK_SHELLBELL, 0, FALSE))
                effect = TRUE;
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_TARGET_VISIBLE: // make target sprite visible
            if ((gStatuses3[gBattlerAttacker] & 0x400C0) && (gHitMarker & HITMARKER_NO_ANIMATIONS))
            {
                gActiveBattler = gBattlerAttacker;
                BtlController_EmitSpriteInvisibility(0, 1);
                MarkBattlerForControllerExec(gActiveBattler);
            }
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_ITEM_EFFECTS_ALL: // item effects for all battlers
            if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT
                || !(gStatuses3[gBattlerAttacker] & (STATUS3_SEMI_INVULNERABLE))
                || WasUnableToUseMove(gBattlerAttacker))
            {
                gActiveBattler = gBattlerAttacker;
                BtlController_EmitSpriteInvisibility(0, FALSE);
                MarkBattlerForControllerExec(gActiveBattler);
                gStatuses3[gBattlerAttacker] &= ~(STATUS3_SEMI_INVULNERABLE);
                gSpecialStatuses[gBattlerAttacker].restoredBattlerSprite = 1;
            }
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_KINGSROCK_SHELLBELL: // king's rock and shell bell
            if (!gSpecialStatuses[gBattlerTarget].restoredBattlerSprite && gBattlerTarget < gBattlersCount
                && !(gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE))
            {
                gActiveBattler = gBattlerTarget;
                BtlController_EmitSpriteInvisibility(0, FALSE);
                MarkBattlerForControllerExec(gActiveBattler);
                gStatuses3[gBattlerTarget] &= ~(STATUS3_SEMI_INVULNERABLE);
            }
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_SUBSTITUTE: // update substitute
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gDisableStructs[i].substituteHP == 0)
                    gBattleMons[i].status2 &= ~(STATUS2_SUBSTITUTE);
            }
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_UPDATE_LAST_MOVES:
            if (gHitMarker & HITMARKER_SWAP_ATTACKER_TARGET)
            {
                gActiveBattler = gBattlerAttacker;
                gBattlerAttacker = gBattlerTarget;
                gBattlerTarget = gActiveBattler;
                gHitMarker &= ~(HITMARKER_SWAP_ATTACKER_TARGET);
            }

            if (gBattleMoves[gChosenMove].effect != 0x7F || (gMoveResultFlags & 0x29))
                gLastPrintedMoves[gBattlerAttacker] = gChosenMove;

            if (!(gAbsentBattlerFlags & gBitTable[gBattlerAttacker])
                && !(gSharedMem[0x160A6] & gBitTable[gBattlerAttacker])
                && gBattleMoves[gChosenMove].effect != EFFECT_BATON_PASS)
            {
                if (gHitMarker & HITMARKER_OBEYS)
                {
                    gLastMoves[gBattlerAttacker] = gChosenMove;
                    gLastResultingMoves[gBattlerAttacker] = gCurrentMove;
                }
                else
                {
                    gLastMoves[gBattlerAttacker] = 0xFFFF;
                    gLastResultingMoves[gBattlerAttacker] = 0xFFFF;
                }

                if (!(gHitMarker & HITMARKER_FAINTED(gBattlerTarget)))
                    gLastHitBy[gBattlerTarget] = gBattlerAttacker;

                if (gHitMarker & HITMARKER_OBEYS && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
                {
                    if (gChosenMove == 0xFFFF)
                    {
                        gLastLandedMoves[gBattlerTarget] = gChosenMove;
                    }
                    else
                    {
                        gLastLandedMoves[gBattlerTarget] = gCurrentMove;
                        GET_MOVE_TYPE(gCurrentMove, gLastHitByType[gBattlerTarget]);
                    }
                }
                else
                {
                    gLastLandedMoves[gBattlerTarget] = 0xFFFF;
                }
            }
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_MIRROR_MOVE:
            if (!(gAbsentBattlerFlags & gBitTable[gBattlerAttacker]) && !(gSharedMem[0x160A6] & gBitTable[gBattlerAttacker]))
            {
                if (gBattleMoves[gChosenMove].flags & 0x10 && gHitMarker & HITMARKER_OBEYS
                 && gBattlerAttacker != gBattlerTarget && !(gHitMarker & HITMARKER_FAINTED(gBattlerTarget))
                 && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
                {
                    gSharedMem[0x160AC + gBattlerTarget * 2 + 0] = gChosenMove;
                    gSharedMem[0x160AC + gBattlerTarget * 2 + 1] = gChosenMove >> 8;

                    gSharedMem[0x16100 + gBattlerTarget * 4 + 0 + (gBattlerAttacker / 2) * 2] = gChosenMove;
                    gSharedMem[0x16100 + gBattlerTarget * 4 + 1 + (gBattlerAttacker / 2) * 2] = gChosenMove >> 8;
                }
                else if (gBattlerAttacker != gBattlerTarget)
                {
                    gSharedMem[0x160AC + gBattlerTarget * 2 + 0] = 0;
                    gSharedMem[0x160AC + gBattlerTarget * 2 + 1] = 0;

                    gSharedMem[0x16100 + gBattlerTarget * 4 + 0 + (gBattlerAttacker / 2) * 2] = 0;
                    gSharedMem[0x16100 + gBattlerTarget * 4 + 1 + (gBattlerAttacker / 2) * 2] = 0;
                }
            }
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_NEXT_TARGET:
            if (!(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE) && gBattleTypeFlags & BATTLE_TYPE_DOUBLE
                && !gProtectStructs[gBattlerAttacker].chargingTurn && gBattleMoves[gCurrentMove].target == MOVE_TARGET_BOTH
                && !(gHitMarker & HITMARKER_NO_ATTACKSTRING))
            {
                u8 battlerId = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerTarget)));
                if (gBattleMons[battlerId].hp != 0)
                {
                    gBattlerTarget = battlerId;
                    gHitMarker |= HITMARKER_NO_ATTACKSTRING;
                    gBattleStruct->cmd49StateTracker = 0;
                    MoveValuesCleanUp();
                    BattleScriptPush(gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect]);
                    gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
                    return;
                }
                else
                {
                    gHitMarker |= HITMARKER_NO_ATTACKSTRING;
                }
            }
            gBattleStruct->cmd49StateTracker++;
            break;
        case ATK49_COUNT:
            break;
        }

        if (arg1 == 1 && effect == FALSE)
            gBattleStruct->cmd49StateTracker = ATK49_COUNT;
        if (arg1 == 2 && arg2 == gBattleStruct->cmd49StateTracker)
            gBattleStruct->cmd49StateTracker = ATK49_COUNT;

    } while (gBattleStruct->cmd49StateTracker != ATK49_COUNT && effect == FALSE);

    if (gBattleStruct->cmd49StateTracker == ATK49_COUNT && effect == FALSE)
        gBattlescriptCurrInstr += 3;
}

static void atk4A_typecalc2(void)
{
    u8 flags = 0;
    int i = 0;
    u8 moveType = gBattleMoves[gCurrentMove].type;

    if (gBattleMons[gBattlerTarget].ability == ABILITY_LEVITATE && moveType == TYPE_GROUND)
    {
        gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
        gMoveResultFlags |= (MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE);
        gLastLandedMoves[gBattlerTarget] = 0;
        gBattleCommunication[6] = moveType;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    else
    {
        while (gTypeEffectiveness[i]!= TYPE_ENDTABLE)
        {
            if (gTypeEffectiveness[i] == TYPE_FORESIGHT)
            {
                if (gBattleMons[gBattlerTarget].status2 & STATUS2_FORESIGHT) {break;}
                else {i += 3; continue;}
            }

            if (gTypeEffectiveness[i] == moveType)
            {
                //check type1
                if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type1)
                {
                    if (gTypeEffectiveness[i + 2] == 0)
                    {
                        gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
                        break;
                    }
                    if (gTypeEffectiveness[i + 2] == 5)
                        flags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
                    if (gTypeEffectiveness[i + 2] == 20)
                        flags |= MOVE_RESULT_SUPER_EFFECTIVE;
                }
                //check type2
                if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type2)
                {
                    if (gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2
                        && gTypeEffectiveness[i + 2] == 0)
                    {
                        gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
                        break;
                    }
                    if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type2 && gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2 && gTypeEffectiveness[i + 2] == 5)
                        flags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
                    if (gTypeEffectiveness[i + 1] == gBattleMons[gBattlerTarget].type2
                        && gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2 && gTypeEffectiveness[i + 2] == 20)
                            flags |= MOVE_RESULT_SUPER_EFFECTIVE;
                }
            }
            i += 3;
        }
    }

    if (gBattleMons[gBattlerTarget].ability == ABILITY_WONDER_GUARD && !(flags & MOVE_RESULT_NO_EFFECT) && AttacksThisTurn(gBattlerAttacker, gCurrentMove) == 2 &&
        (!(flags & MOVE_RESULT_SUPER_EFFECTIVE) || ((flags & (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)) == (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE))) &&
        gBattleMoves[gCurrentMove].power)
    {
        gLastUsedAbility = ABILITY_WONDER_GUARD;
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gLastLandedMoves[gBattlerTarget] = 0;
        gBattleCommunication[6] = 3;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    if (gMoveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE)
        gProtectStructs[gBattlerAttacker].targetNotAffected = 1;

    gBattlescriptCurrInstr++;
}

static void atk4B_returnatktoball(void)
{
    gActiveBattler = gBattlerAttacker;
    if (!(gHitMarker & HITMARKER_FAINTED(gActiveBattler)))
    {
        BtlController_EmitReturnMonToBall(0, 0);
        MarkBattlerForControllerExec(gActiveBattler);
    }
    gBattlescriptCurrInstr++;
}

static void atk4C_getswitchedmondata(void)
{
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));

    gBattlerPartyIndexes[gActiveBattler] = gSharedMem[BSTRUCT_OFF(monToSwitchIntoId) + gActiveBattler];

    BtlController_EmitGetMonData(0, 0, gBitTable[gBattlerPartyIndexes[gActiveBattler]]);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

static void atk4D_switchindataupdate(void)
{
    struct BattlePokemon oldData;
    s32 i;
    u8 *monData;

    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    oldData = gBattleMons[gActiveBattler];
    monData = (u8*)(&gBattleMons[gActiveBattler]);

    for (i = 0; i < sizeof(struct BattlePokemon); i++)
    {
        monData[i] = gBattleBufferB[gActiveBattler][4 + i];
    }

    gBattleMons[gActiveBattler].type1 = gBaseStats[gBattleMons[gActiveBattler].species].type1;
    gBattleMons[gActiveBattler].type2 = gBaseStats[gBattleMons[gActiveBattler].species].type2;
    gBattleMons[gActiveBattler].ability = GetAbilityBySpecies(gBattleMons[gActiveBattler].species, gBattleMons[gActiveBattler].altAbility);

    // check knocked off item
    i = GetBattlerSide(gActiveBattler);
    if (gWishFutureKnock.knockedOffPokes[i] & gBitTable[gBattlerPartyIndexes[gActiveBattler]])
    {
        gBattleMons[gActiveBattler].item = 0;
    }

    if (gBattleMoves[gCurrentMove].effect == EFFECT_BATON_PASS)
    {
        for (i = 0; i < 8; i++)
        {
            gBattleMons[gActiveBattler].statStages[i] = oldData.statStages[i];
        }
        gBattleMons[gActiveBattler].status2 = oldData.status2;
    }

    SwitchInClearSetData();

    gBattleStruct->scriptingActive = gActiveBattler;

    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gActiveBattler, gBattlerPartyIndexes[gActiveBattler]);

    gBattlescriptCurrInstr += 2;
}

static void atk4E_switchinanim(void)
{
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    if (GetBattlerSide(gActiveBattler) == 1 && !(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER)))
    {
        GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gActiveBattler].species), 2);
    }
    gAbsentBattlerFlags &= ~(gBitTable[gActiveBattler]);
    BtlController_EmitSwitchInAnim(0, gBattlerPartyIndexes[gActiveBattler], T2_READ_8(gBattlescriptCurrInstr + 2));
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 3;
}

static void atk4F_jumpifcantswitch(void)
{
    int val, to_cmp;
    register struct Pokemon *party;
    u8 r7;
    //0x80 byte is used as a way of telling the function whether to not check status2/status3
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1) & 0x7F);
    if (!(T2_READ_8(gBattlescriptCurrInstr + 1) & 0x80)
        && ((gBattleMons[gActiveBattler].status2 & (STATUS2_WRAPPED | STATUS2_ESCAPE_PREVENTION))
            || (gStatuses3[gActiveBattler] & STATUS3_ROOTED)))
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
        return;
    }
    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if (GetBattlerSide(gActiveBattler) == 1)
            party = gEnemyParty;
        else
            party = gPlayerParty;
        val = 0;
        if (sub_803FBFC(sub_803FC34(gActiveBattler)) == 1)
            val = 3;
        for (to_cmp = val + 3; val < to_cmp; val++)
        {
            if (GetMonData(&party[val], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[val], MON_DATA_IS_EGG)
             && GetMonData(&party[val], MON_DATA_HP) != 0
             && gBattlerPartyIndexes[gActiveBattler] != val)
                break;
        }
        if (val == to_cmp)
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
        else
            gBattlescriptCurrInstr += 6;
    }
    else
    {
        if (GetBattlerSide(gActiveBattler) == 1)
        {
            r7 = GetBattlerAtPosition(1);
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                to_cmp = GetBattlerAtPosition(3);
            else
                to_cmp = r7;
            party = gEnemyParty;
        }
        else
        {
            r7 = GetBattlerAtPosition(0);
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                to_cmp = GetBattlerAtPosition(2);
            else
                to_cmp = r7;
            party = gPlayerParty;
        }
        for (val = 0; val < PARTY_SIZE; val++)
        {
            if (GetMonData(&party[val], MON_DATA_HP) != 0
             && GetMonData(&party[val], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[val], MON_DATA_IS_EGG)
             && val != gBattlerPartyIndexes[r7] && val != gBattlerPartyIndexes[to_cmp])
                break;
        }
        if (val == 6)
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
        else
            gBattlescriptCurrInstr += 6;
    }
}

void sub_8022A3C(u8 unkown)
{
    gSharedMem[BSTRUCT_OFF(unk16064) + gActiveBattler] = gBattlerPartyIndexes[gActiveBattler];
    BtlController_EmitChoosePokemon(0, 1, unkown, 0, gBattleStruct->unk1606C[gActiveBattler]);
    MarkBattlerForControllerExec(gActiveBattler);
}

bool8 sub_8018018(u8 bank, u8, u8);

static void atk50_openpartyscreen(void)
{
    u32 flags;
    u8 hitmarkerFaintBits;
    u8 battlerId;
    const u8 *jumpPtr;

    battlerId = 0;
    flags = 0;
    jumpPtr = T1_READ_PTR(gBattlescriptCurrInstr + 2);

    if (gBattlescriptCurrInstr[1] == 5)
    {
        if ((gBattleTypeFlags & (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI)) != BATTLE_TYPE_DOUBLE)
        {
            for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
            {
                if (gHitMarker & HITMARKER_FAINTED(gActiveBattler))
                {
                    if (sub_8018018(gActiveBattler, PARTY_SIZE, PARTY_SIZE))
                    {
                        gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                        gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                        BtlController_EmitLinkStandbyMsg(0, 2);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                    else if (!gSpecialStatuses[gActiveBattler].flag40)
                    {
                        sub_8022A3C(PARTY_SIZE);
                        gSpecialStatuses[gActiveBattler].flag40 = 1;
                    }
                }
                else
                {
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        {
            u8 flag40_0, flag40_1, flag40_2, flag40_3;

            hitmarkerFaintBits = gHitMarker >> 28;

            if (gBitTable[0] & hitmarkerFaintBits)
            {
                gActiveBattler = 0;
                if (sub_8018018(0, PARTY_SIZE, PARTY_SIZE))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                    BtlController_EmitCmd42(0);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].flag40)
                {
                    sub_8022A3C(gBattleStruct->monToSwitchIntoId[2]);
                    gSpecialStatuses[gActiveBattler].flag40 = 1;
                }
                else
                {
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                    flags |= 1;
                }
            }
            if (gBitTable[2] & hitmarkerFaintBits && !(gBitTable[0] & hitmarkerFaintBits))
            {
                gActiveBattler = 2;
                if (sub_8018018(2, PARTY_SIZE, PARTY_SIZE))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                    BtlController_EmitCmd42(0);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].flag40)
                {
                    sub_8022A3C(gBattleStruct->monToSwitchIntoId[0]);
                    gSpecialStatuses[gActiveBattler].flag40 = 1;
                }
                else if (!(flags & 1))
                {
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }
            if (gBitTable[1] & hitmarkerFaintBits)
            {
                gActiveBattler = 1;
                if (sub_8018018(1, PARTY_SIZE, PARTY_SIZE))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                    BtlController_EmitCmd42(0);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].flag40)
                {
                    sub_8022A3C(gBattleStruct->monToSwitchIntoId[3]);
                    gSpecialStatuses[gActiveBattler].flag40 = 1;
                }
                else
                {
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                    flags |= 2;
                }
            }
            if (gBitTable[3] & hitmarkerFaintBits && !(gBitTable[1] & hitmarkerFaintBits))
            {
                gActiveBattler = 3;
                if (sub_8018018(3, PARTY_SIZE, PARTY_SIZE))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                    BtlController_EmitCmd42(0);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].flag40)
                {
                    sub_8022A3C(gBattleStruct->monToSwitchIntoId[1]);
                    gSpecialStatuses[gActiveBattler].flag40 = 1;
                }
                else if (!(flags & 2))
                {
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }

            flag40_0 = gSpecialStatuses[0].flag40;
            if (!flag40_0)
            {
                flag40_2 = gSpecialStatuses[2].flag40;
                if (!flag40_2 && hitmarkerFaintBits != 0)
                {
                    if (gAbsentBattlerFlags & gBitTable[0])
                        gActiveBattler = 2;
                    else
                        gActiveBattler = 0;

                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }

            }
            flag40_1 = gSpecialStatuses[1].flag40;
            if (!flag40_1)
            {
                flag40_3 = gSpecialStatuses[3].flag40;
                if (!flag40_3 && hitmarkerFaintBits != 0)
                {
                    if (gAbsentBattlerFlags & gBitTable[1])
                        gActiveBattler = 3;
                    else
                        gActiveBattler = 1;

                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }
        }
        gBattlescriptCurrInstr += 6;
    }
    else if (gBattlescriptCurrInstr[1] == 6)
    {
        if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            {
                hitmarkerFaintBits = gHitMarker >> 28;
                if (gBitTable[2] & hitmarkerFaintBits && gBitTable[0] & hitmarkerFaintBits)
                {
                    gActiveBattler = 2;
                    if (sub_8018018(2, gBattleBufferB[0][1], PARTY_SIZE))
                    {
                        gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                        gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                        BtlController_EmitCmd42(0);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                    else if (!gSpecialStatuses[gActiveBattler].flag40)
                    {
                        sub_8022A3C(gBattleStruct->monToSwitchIntoId[0]);
                        gSpecialStatuses[gActiveBattler].flag40 = 1;
                    }
                }
                if (gBitTable[3] & hitmarkerFaintBits && hitmarkerFaintBits & gBitTable[1])
                {
                    gActiveBattler = 3;
                    if (sub_8018018(3, gBattleBufferB[1][1], PARTY_SIZE))
                    {
                        gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                        gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                        BtlController_EmitCmd42(0);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                    else if (!gSpecialStatuses[gActiveBattler].flag40)
                    {
                        sub_8022A3C(gBattleStruct->monToSwitchIntoId[1]);
                        gSpecialStatuses[gActiveBattler].flag40 = 1;
                    }
                }
                gBattlescriptCurrInstr += 6;
            }
            else
            {
                gBattlescriptCurrInstr += 6;
            }
        }
        else
        {
            gBattlescriptCurrInstr += 6;
        }

        hitmarkerFaintBits = gHitMarker >> 28;

        gBank1 = 0;
        while (!(gBitTable[gBank1] & hitmarkerFaintBits)
               && gBank1 < gBattlersCount)
            gBank1++;

        if (gBank1 == gBattlersCount)
            gBattlescriptCurrInstr = jumpPtr;
    }
    else
    {
        if (gBattlescriptCurrInstr[1] & 0x80)
            hitmarkerFaintBits = 0; // Used here as the caseId for the EmitChoose function.
        else
            hitmarkerFaintBits = 1;

        battlerId = GetBattlerForBattleScript(gBattlescriptCurrInstr[1] & ~(0x80));
        if (gSpecialStatuses[battlerId].flag40)
        {
            gBattlescriptCurrInstr += 6;
        }
        else if (sub_8018018(battlerId, PARTY_SIZE, PARTY_SIZE))
        {
            gActiveBattler = battlerId;
            gAbsentBattlerFlags |= gBitTable[gActiveBattler];
            gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
            gBattlescriptCurrInstr = jumpPtr;
        }
        else
        {
            gActiveBattler = battlerId;
            gSharedMem[BSTRUCT_OFF(unk16064) + gActiveBattler] = gBattlerPartyIndexes[gActiveBattler];
            BtlController_EmitChoosePokemon(0, hitmarkerFaintBits, gSharedMem[BSTRUCT_OFF(monToSwitchIntoId) + (gActiveBattler ^ 2)], ABILITY_NONE, gBattleStruct->unk1606C[gActiveBattler]);
            MarkBattlerForControllerExec(gActiveBattler);

            gBattlescriptCurrInstr += 6;

            if (GetBattlerPosition(gActiveBattler) == 0 && gBattleResults.totalMonSwitchCounter < 0xFF)
                gBattleResults.totalMonSwitchCounter++;

            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
                {
                    if (gActiveBattler != battlerId)
                    {
                        BtlController_EmitLinkStandbyMsg(0, 2);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                }
            }
            else
            {
                gActiveBattler = GetBattlerAtPosition(GetBattlerPosition(battlerId) ^ BIT_SIDE);
                if (gAbsentBattlerFlags & gBitTable[gActiveBattler])
                    gActiveBattler ^= BIT_FLANK;

                BtlController_EmitLinkStandbyMsg(0, 2);
                MarkBattlerForControllerExec(gActiveBattler);
            }
        }
    }
}

static void atk51_switchhandleorder(void)
{
    int i;
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    switch (T2_READ_8(gBattlescriptCurrInstr + 2))
    {
    case 0:
        for (i = 0; i < gBattlersCount; i++)
        {
            if (gBattleBufferB[i][0] == 0x22)
                gSharedMem[BSTRUCT_OFF(monToSwitchIntoId) + i] = gBattleBufferB[i][1];
        }
        break;
    case 1:
        if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
            sub_8012258(gActiveBattler);
        break;
    case 2:
        gBattleCommunication[0] = gBattleBufferB[gActiveBattler][1];
        gSharedMem[BSTRUCT_OFF(monToSwitchIntoId) + gActiveBattler] = gBattleBufferB[gActiveBattler][1];
        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            gSharedMem[BSTRUCT_OFF(unk1606C) + 3 * gActiveBattler + 0] &= 0xF;
            gSharedMem[BSTRUCT_OFF(unk1606C) + 3 * gActiveBattler + 0] |= (gBattleBufferB[gActiveBattler][2] & 0xF0);
            gSharedMem[BSTRUCT_OFF(unk1606C) + 3 * gActiveBattler + 1] = gBattleBufferB[gActiveBattler][3];
            gSharedMem[BSTRUCT_OFF(unk1606C) + 3 * (gActiveBattler ^ BIT_FLANK) + 0] &= (0xF0);
            gSharedMem[BSTRUCT_OFF(unk1606C) + 3 * (gActiveBattler ^ BIT_FLANK) + 0] |= (gBattleBufferB[gActiveBattler][2] & 0xF0) >> 4;
            gSharedMem[BSTRUCT_OFF(unk1606C) + 3 * (gActiveBattler ^ BIT_FLANK) + 2] = gBattleBufferB[gActiveBattler][3];
        }
        else
            sub_8012258(gActiveBattler);

        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 6;
        gBattleTextBuff1[2] = gBattleMons[gBattlerAttacker].species;
        gBattleTextBuff1[3] = gBattleMons[gBattlerAttacker].species >> 8;
        gBattleTextBuff1[4] = 0xFF;

        gBattleTextBuff2[0] = 0xFD;
        gBattleTextBuff2[1] = 7;
        gBattleTextBuff2[2] = gActiveBattler;
        gBattleTextBuff2[3] = gBattleBufferB[gActiveBattler][1];
        gBattleTextBuff2[4] = 0xFF;
        break;
    }
    gBattlescriptCurrInstr += 3;
}

static void atk52_switchineffects(void)
{
    int i;

    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    sub_80157C4(gActiveBattler);
    gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
    gSpecialStatuses[gActiveBattler].flag40 = 0;

    if (!(gSideStatuses[GetBattlerSide(gActiveBattler)] & SIDE_STATUS_SPIKES_DAMAGED) && (gSideStatuses[GetBattlerSide(gActiveBattler)] & SIDE_STATUS_SPIKES)
        && gBattleMons[gActiveBattler].type1 != TYPE_FLYING && gBattleMons[gActiveBattler].type2 != TYPE_FLYING && gBattleMons[gActiveBattler].ability != ABILITY_LEVITATE)
    {
        u8 spikesDmg;

        gSideStatuses[GetBattlerSide(gActiveBattler)] |= SIDE_STATUS_SPIKES_DAMAGED;

        spikesDmg = (5 - gSideTimers[GetBattlerSide(gActiveBattler)].spikesAmount) * 2;
        gBattleMoveDamage = gBattleMons[gActiveBattler].maxHP / (spikesDmg);
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;

        gBattleStruct->scriptingActive = gActiveBattler;
        BattleScriptPushCursor();

        if (T2_READ_8(gBattlescriptCurrInstr + 1) == 0)
            gBattlescriptCurrInstr = BattleScript_SpikesOnTarget;
        else if (T2_READ_8(gBattlescriptCurrInstr + 1) == 1)
            gBattlescriptCurrInstr = BattleScript_SpikesOnAttacker;
        else
            gBattlescriptCurrInstr = BattleScript_SpikesOngBank1;
    }
    else
    {
        if (gBattleMons[gActiveBattler].ability == ABILITY_TRUANT)
        {
            gDisableStructs[gActiveBattler].truantCounter = 1;
        }

        if (AbilityBattleEffects(0, gActiveBattler, 0, 0, 0) == 0 && ItemBattleEffects(0, gActiveBattler, 0) == 0)
        {
            gSideStatuses[GetBattlerSide(gActiveBattler)] &= ~(SIDE_STATUS_SPIKES_DAMAGED);

            for (i = 0; i < gBattlersCount; i++)
            {
                if (gBattlerByTurnOrder[i] == gActiveBattler)
                    gActionsByTurnOrder[i] = 0xC;
            }

            for (i = 0; i < gBattlersCount; i++)
            {
                *((u16 *)&gSharedMem[BSTRUCT_OFF(HP_OnSwitchout) + 2 * GetBattlerSide(i)]) = gBattleMons[i].hp;
            }

            if (T2_READ_8(gBattlescriptCurrInstr + 1) == 5)
            {
                u32 hitmark = gHitMarker >> 0x1C;
                gBank1++;
                while (1)
                {
                    if (hitmark & gBitTable[gBank1] && !(gAbsentBattlerFlags & gBitTable[gBank1]))
                        break;
                    if (gBank1 >= gBattlersCount)
                        break;
                    gBank1++;
                }
            }
            gBattlescriptCurrInstr += 2;
        }
    }
}

static void atk53_trainerslidein(void)
{
    if (!T2_READ_8(gBattlescriptCurrInstr + 1))
        gActiveBattler = GetBattlerAtPosition(0);
    else
        gActiveBattler = GetBattlerAtPosition(1);

    BtlController_EmitTrainerSlide(0);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

static void atk54_playse(void)
{
    gActiveBattler = gBattlerAttacker;
    BtlController_EmitPlaySE(0, T2_READ_16(gBattlescriptCurrInstr + 1));
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 3;
}

static void atk55_fanfare(void)
{
    gActiveBattler = gBattlerAttacker;
    BtlController_EmitPlayFanfareOrBGM(0, T2_READ_16(gBattlescriptCurrInstr + 1));
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 3;
}

static void atk56_playfaintcry(void)
{
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    BtlController_EmitFaintingCry(0);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

static void atk57(void)
{
    gActiveBattler = GetBattlerAtPosition(0);
    BtlController_EmitCmd55(0, gBattleOutcome);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 1;
}

static void atk58_returntoball(void)
{
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    BtlController_EmitReturnMonToBall(0, 1);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

void atk59_handlelearnnewmove(void)
{
    u8* loc1 = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    u8* loc2 = T1_READ_PTR(gBattlescriptCurrInstr + 5);

    u16 ret = MonTryLearningNewMove(&gPlayerParty[gBattleStruct->expGetterMonId], T2_READ_8(gBattlescriptCurrInstr + 9));
    while (ret == 0xFFFE)
        ret = MonTryLearningNewMove(&gPlayerParty[gBattleStruct->expGetterMonId], 0);

    if (ret == 0)
    {
        gBattlescriptCurrInstr = loc2;
    }
    else if (ret == 0xFFFF)
    {
        gBattlescriptCurrInstr += 10;
    }
    else
    {
        gActiveBattler = GetBattlerAtPosition(0);
        if (gBattlerPartyIndexes[gActiveBattler] == gBattleStruct->expGetterMonId && !(gBattleMons[gActiveBattler].status2 & STATUS2_TRANSFORMED))
            GiveMoveToBattleMon(&gBattleMons[gActiveBattler], ret);
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE) //what is else if
        {
            gActiveBattler = GetBattlerAtPosition(2);
            if (gBattlerPartyIndexes[gActiveBattler] == gBattleStruct->expGetterMonId && !(gBattleMons[gActiveBattler].status2 & STATUS2_TRANSFORMED))
                GiveMoveToBattleMon(&gBattleMons[gActiveBattler], ret);
        }
        gBattlescriptCurrInstr = loc1;
    }
}

void sub_8023A80(void)
{
    sub_802BBD4(0x18, 8, 0x1D, 0xD, 0);
    Text_InitWindow(&gWindowTemplate_Contest_MoveDescription, BattleText_YesNo, 0x100, 0x19, 0x9);
    Text_PrintWindow8002F44(&gWindowTemplate_Contest_MoveDescription);
    MenuCursor_Create814A5C0(0, 0xFFFF, 0xC, 0x2D9F, 0x20);
}

void sub_8023AD8(void)
{
    sub_802BBD4(0x18, 8, 0x1D, 0xD, 1);
    DestroyMenuCursor();
}

static void atk5A_yesnoboxlearnmove(void)
{
    gActiveBattler = 0;
    switch (gBattleStruct->atk5A_StateTracker)
    {
    case 0:
        sub_8023A80();
        gBattleStruct->atk5A_StateTracker++;
        gBattleCommunication[1] = 0;
        sub_802BC6C();
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            if (gBattleCommunication[1] == 0)
            {
                sub_8023AD8();
                BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
                gBattleStruct->atk5A_StateTracker++;
                return;
            }
            goto state_tracker_4;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
          state_tracker_4:
            gBattleStruct->atk5A_StateTracker = 4;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            ShowSelectMovePokemonSummaryScreen(gPlayerParty, gBattleStruct->expGetterMonId, gPlayerPartyCount - 1, ReshowBattleScreenAfterMenu, gMoveToLearn);
            gBattleStruct->atk5A_StateTracker++;
        }
        break;
    case 3:
        if (!gPaletteFade.active && gMain.callback2 == BattleMainCB2)
        {
            u8 move_pos = sub_809FA30();
            if (move_pos == 4)
            {
                gBattleStruct->atk5A_StateTracker = 4;
            }
            else
            {
                u16 move = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_MOVE1 + move_pos);
                if (IsHMMove2(move))
                {
                    PrepareStringBattle(0x13F, gActiveBattler);
                    gBattleStruct->atk5A_StateTracker = 5;
                }
                else
                {
                    u8 *ptr;

                    gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
                    ptr = gBattleTextBuff2;
                    {
                        ptr[0] = 0xFD;
                        ptr[1] = 2;
                        ptr[2] = move;
                        ptr[3] = ((move & 0xFF00) >> 8);
                        ptr += 4;
                    }
                    ptr[0] = 0xFF;
                    RemoveMonPPBonus(&gPlayerParty[gBattleStruct->expGetterMonId], move_pos);
                    SetMonMoveSlot(&gPlayerParty[gBattleStruct->expGetterMonId], gMoveToLearn, move_pos);
                    if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId && !(gBattleMons[0].status2 & STATUS2_TRANSFORMED)
                        && !(gDisableStructs[0].mimickedMoves & gBitTable[move_pos]))
                    {
                        RemoveBattleMonPPBonus(&gBattleMons[0], move_pos);
                        SetBattleMonMoveSlot(&gBattleMons[0], gMoveToLearn, move_pos);
                    }
                    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && gBattlerPartyIndexes[2] == gBattleStruct->expGetterMonId && !(gBattleMons[2].status2 & STATUS2_TRANSFORMED)
                        && !(gDisableStructs[2].mimickedMoves & gBitTable[move_pos]))
                    {
                        RemoveBattleMonPPBonus(&gBattleMons[2], move_pos);
                        SetBattleMonMoveSlot(&gBattleMons[2], gMoveToLearn, move_pos);
                    }
                }
            }
        }
        break;
    case 4:
        sub_8023AD8();
        gBattlescriptCurrInstr += 5;
        break;
    case 5:
        if (gBattleControllerExecFlags == 0)
        {
            gBattleStruct->atk5A_StateTracker = 2;
        }
        break;
    }
}

static void atk5B_yesnoboxstoplearningmove(void)
{
    switch (gBattleStruct->atk5A_StateTracker)
    {
    case 0:
        sub_8023A80();
        gBattleStruct->atk5A_StateTracker++;
        gBattleCommunication[1] = 0;
        sub_802BC6C();
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            if (gBattleCommunication[1] != 0)
                gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
            else
                gBattlescriptCurrInstr += 5;
            sub_8023AD8();
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
            sub_8023AD8();
        }
    }
}

static void atk5C_hitanimation(void)
{
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
        gBattlescriptCurrInstr += 2;
    else if (!(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE) || !(gBattleMons[gActiveBattler].status2 & STATUS2_SUBSTITUTE) || gDisableStructs[gActiveBattler].substituteHP == 0)
    {
        BtlController_EmitHitAnimation(0);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 2;
    }
    else
        gBattlescriptCurrInstr += 2;
}

static void atk5D_getmoneyreward(void)
{
    u32 i = 0;
    u8 lvl = 0;
    u32 money_to_give;

    const struct TrainerMonNoItemDefaultMoves * party1;
    const struct TrainerMonNoItemCustomMoves * party2;
    const struct TrainerMonItemDefaultMoves * party3;
    const struct TrainerMonItemCustomMoves * party4;

    if (gTrainerBattleOpponent == SECRET_BASE_OPPONENT)
    {
        money_to_give = 20 * eSecretBaseRecord->party.levels[0] * gBattleStruct->moneyMultiplier;
    }
    else
    {
        switch(gTrainers[gTrainerBattleOpponent].partyFlags)
        {
        case 0:
        {
            party1 = gTrainers[gTrainerBattleOpponent].party.NoItemDefaultMoves;
            lvl = party1[gTrainers[gTrainerBattleOpponent].partySize - 1].level;
        }
            break;
        case 1:
        {
            party2 = gTrainers[gTrainerBattleOpponent].party.NoItemCustomMoves;
            lvl = party2[gTrainers[gTrainerBattleOpponent].partySize - 1].level;
        }
            break;
        case 2:
        {
            party3 = gTrainers[gTrainerBattleOpponent].party.ItemDefaultMoves;
            lvl = party3[gTrainers[gTrainerBattleOpponent].partySize - 1].level;
        }
            break;
        case 3:
        {
            party4 = gTrainers[gTrainerBattleOpponent].party.ItemCustomMoves;
            lvl = party4[gTrainers[gTrainerBattleOpponent].partySize - 1].level;
        }
            break;
        }
        for (; gTrainerMoney[i].trainerClass != 0xFF; i++) {
            if (gTrainerMoney[i].trainerClass == gTrainers[gTrainerBattleOpponent].trainerClass)
                break;
        }
        party4 = gTrainers[gTrainerBattleOpponent].party.ItemCustomMoves; // Needed to match. Has no effect.
        money_to_give = 4 * lvl * gBattleStruct->moneyMultiplier * (gBattleTypeFlags & BATTLE_TYPE_DOUBLE ? 2 : 1) * gTrainerMoney[i].baseMoney;
    }

    AddMoney(&gSaveBlock1.money, money_to_give);
    PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff1, 5, money_to_give);
    gBattlescriptCurrInstr += 1;
}

static void atk5E(void)
{
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    switch (gBattleCommunication[0])
    {
    case 0:
        BtlController_EmitGetMonData(0, REQUEST_ALL_BATTLE, 0);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattleCommunication[0]++;
        break;
    case 1:
         if (gBattleControllerExecFlags == 0)
         {
            int i;
            struct BattlePokemon* bufferPoke = (struct BattlePokemon*) &gBattleBufferB[gActiveBattler][4];
            for (i = 0; i < 4; i++)
            {
                gBattleMons[gActiveBattler].moves[i] = bufferPoke->moves[i];
                gBattleMons[gActiveBattler].pp[i] = bufferPoke->pp[i];
            }
            gBattlescriptCurrInstr += 2;
         }
         break;
    }
}

static void atk5F_swapattackerwithtarget(void)
{
    gActiveBattler = gBattlerAttacker;
    gBattlerAttacker = gBattlerTarget;
    gBattlerTarget = gActiveBattler;
    //what is xor...
    if (gHitMarker & HITMARKER_SWAP_ATTACKER_TARGET)
        gHitMarker &= ~(HITMARKER_SWAP_ATTACKER_TARGET);
    else
        gHitMarker |= HITMARKER_SWAP_ATTACKER_TARGET;
    gBattlescriptCurrInstr++;
}

static void atk60_incrementgamestat(void)
{
    if (GetBattlerSide(gBattlerAttacker) == 0)
    {
        IncrementGameStat(T2_READ_8(gBattlescriptCurrInstr + 1));
    }
    gBattlescriptCurrInstr += 2;
}

static void atk61_drawpartystatussummary(void)
{
    int i;
    struct Pokemon* party;
    struct HpAndStatus hpStatus[6];
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    if (GetBattlerSide(gActiveBattler) == 0)
        party = gPlayerParty;
    else
        party = gEnemyParty;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&party[i], MON_DATA_SPECIES2) == 0 || GetMonData(&party[i], MON_DATA_SPECIES2) == SPECIES_EGG)
        {
            hpStatus[i].hp = 0xFFFF;
            hpStatus[i].status = 0;
        }
        else
        {
            hpStatus[i].hp = GetMonData(&party[i], MON_DATA_HP);
            hpStatus[i].status = GetMonData(&party[i], MON_DATA_STATUS);
        }
    }
    BtlController_EmitDrawPartyStatusSummary(0, hpStatus, 1);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

static void atk62_hidepartystatussummary(void)
{
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    BtlController_EmitHidePartyStatusSummary(0);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

static void atk63_jumptorandomattack(void)
{
    if (T2_READ_8(gBattlescriptCurrInstr + 1))
        gCurrentMove = gRandomMove;
    else
        gChosenMove = gCurrentMove = gRandomMove;
    gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect];
}

static void atk64_statusanimation(void)
{
    if (gBattleControllerExecFlags == 0)
    {
        gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
        if (!(gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE) && gDisableStructs[gActiveBattler].substituteHP == 0 && !(gHitMarker & HITMARKER_NO_ANIMATIONS))
        {
            BtlController_EmitStatusAnimation(0, 0, gBattleMons[gActiveBattler].status1);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        gBattlescriptCurrInstr += 2;
    }
}

static void atk65_status2animation(void)
{
    if (gBattleControllerExecFlags == 0)
    {
        u32 possible_to_anim;
        gActiveBattler = GetBattlerForBattleScript(T1_READ_8(gBattlescriptCurrInstr + 1));
        possible_to_anim = T1_READ_32(gBattlescriptCurrInstr + 2);
        if (!(gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE) && gDisableStructs[gActiveBattler].substituteHP == 0 && !(gHitMarker & HITMARKER_NO_ANIMATIONS))
        {
            BtlController_EmitStatusAnimation(0, 1, gBattleMons[gActiveBattler].status2 & possible_to_anim);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        gBattlescriptCurrInstr += 6;
    }
}

static void atk66_chosenstatusanimation(void)
{
    if (gBattleControllerExecFlags == 0)
    {
        u32 status;
        gActiveBattler = GetBattlerForBattleScript(T1_READ_8(gBattlescriptCurrInstr + 1));
        status = T1_READ_32(gBattlescriptCurrInstr + 3);
        if (!(gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE) && gDisableStructs[gActiveBattler].substituteHP == 0 && !(gHitMarker & HITMARKER_NO_ANIMATIONS))
        {
            BtlController_EmitStatusAnimation(0, T1_READ_8(gBattlescriptCurrInstr + 2), status);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        gBattlescriptCurrInstr += 7;
    }
}

static void atk67_yesnobox(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        sub_8023A80();
        gBattleCommunication[0]++;
        gBattleCommunication[1] = 0;
        sub_802BC6C();
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (JOY_NEW(B_BUTTON))
        {
            gBattleCommunication[1] = 1;
            PlaySE(SE_SELECT);
            sub_8023AD8();
            gBattlescriptCurrInstr++;
        }
        else if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            sub_8023AD8();
            gBattlescriptCurrInstr++;
        }
        break;
    }
}

static void atk68_cancelallactions(void)
{
    int i;
    for (i = 0; i < gBattlersCount; i++)
    {
        gActionsByTurnOrder[i] = 0xC;
    }
    gBattlescriptCurrInstr++;
}

static void atk69_adjustsetdamage(void) //literally a copy of atk07 except theres no rand dmg modifier...
{
    u8 holdEffect, param;
    if (gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY)
        holdEffect = gEnigmaBerries[gBattlerTarget].holdEffect, param = gEnigmaBerries[gBattlerTarget].holdEffectParam;
    else
    {
        holdEffect = ItemId_GetHoldEffect(gBattleMons[gBattlerTarget].item);
        param = ItemId_GetHoldEffectParam(gBattleMons[gBattlerTarget].item);
    }

    gPotentialItemEffectBattler = gBattlerTarget;

    if (holdEffect == HOLD_EFFECT_FOCUS_BAND && (Random() % 100) < param)
    {
        RecordItemEffectBattle(gBattlerTarget, holdEffect);
        gSpecialStatuses[gBattlerTarget].focusBanded = 1;
    }
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_SUBSTITUTE)
        goto END;
    if (gBattleMoves[gCurrentMove].effect != EFFECT_FALSE_SWIPE && !gProtectStructs[gBattlerTarget].endured
     && !gSpecialStatuses[gBattlerTarget].focusBanded)
        goto END;
    if (gBattleMons[gBattlerTarget].hp > gBattleMoveDamage)
        goto END;

    gBattleMoveDamage = gBattleMons[gBattlerTarget].hp - 1;

    if (gProtectStructs[gBattlerTarget].endured)
    {
        gMoveResultFlags |= MOVE_RESULT_FOE_ENDURED;
        goto END;
    }
    if (gSpecialStatuses[gBattlerTarget].focusBanded)
    {
        gMoveResultFlags |= MOVE_RESULT_FOE_HUNG_ON;
        gLastUsedItem = gBattleMons[gBattlerTarget].item;
    }

    END:
        gBattlescriptCurrInstr++;
}

void atk6A_removeitem(void)
{
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    *((u16 *)&gSharedMem[BSTRUCT_OFF(usedHeldItems) + gActiveBattler * 2]) = gBattleMons[gActiveBattler].item;

    gBattleMons[gActiveBattler].item = 0;
    BtlController_EmitSetMonData(0, REQUEST_HELDITEM_BATTLE, 0, 2, &gBattleMons[gActiveBattler].item);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

static void atk6B_atknameinbuff1(void)
{
    gBattleTextBuff1[0] = 0xFD;
    gBattleTextBuff1[1] = 7;
    gBattleTextBuff1[2] = gBattlerAttacker;
    gBattleTextBuff1[3] = gBattlerPartyIndexes[gBattlerAttacker];
    gBattleTextBuff1[4] = 0xFF;
    gBattlescriptCurrInstr++;
}

extern const u8 BattleText_Format2[];
extern const u8 BattleText_Dash[];
extern const u8 BattleText_Plus[];
extern const u8 *const gUnknown_0840165C[];

static void atk6C_drawlvlupbox(void)
{
    s16 r1 = 0;
    s16 r7 = 0;
    int i;
    u8 * r5;
    bool32 sign;
    switch (gBattleStruct->atk6C_statetracker)
    {
    case 0:
        sub_802BBD4(0xB, 0, 0x1D, 0x7, 0);
        r5 = StringCopy(gStringVar4, BattleText_Format2);
        for (i = 0; i < 6; i++)
        {
            sign = FALSE;
            r5 = StringAppend(r5, gUnknown_0840165C[i]);
            r1 = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], gLevelUpStatBoxStats[i]);
            switch (i)
            {
            case 0:
                r7 = r1 - gBattleResources_statsBeforeLvlUp->hp;
                break;
            case 1:
                r7 = r1 - gBattleResources_statsBeforeLvlUp->spAtk;
                break;
            case 2:
                r7 = r1 - gBattleResources_statsBeforeLvlUp->atk;
                break;
            case 3:
                r7 = r1 - gBattleResources_statsBeforeLvlUp->spDef;
                break;
            case 4:
                r7 = r1 - gBattleResources_statsBeforeLvlUp->def;
                break;
            case 5:
                r7 = r1 - gBattleResources_statsBeforeLvlUp->spd;
                break;
            }
            if (r7 < 0)
            {
                r7 = -r7;
                sign++;
            }
            r5[0] = EXT_CTRL_CODE_BEGIN;
            r5[1] = EXT_CTRL_CODE_CLEAR_TO;
            r5[2] = ((i & 1) * 9 + 5) * 8 + 6;
            r5 += 3;
            if (sign)
                r5 = StringCopy(r5, BattleText_Dash);
            else
                r5 = StringCopy(r5, BattleText_Plus);
            r5[0] = EXT_CTRL_CODE_BEGIN;
            r5[1] = EXT_CTRL_CODE_MIN_LETTER_SPACING;
            r5[2] = 6;
            r5 += 3;
            r5 = ConvertIntToDecimalStringN(r5, r7, STR_CONV_MODE_RIGHT_ALIGN, 2);
            r5[0] = EXT_CTRL_CODE_BEGIN;
            r5[1] = EXT_CTRL_CODE_MIN_LETTER_SPACING;
            r5[2] = 0;
            r5 += 3;
            if (i & 1)
            {
                r5[0] = CHAR_NEWLINE;
                r5[1] = EOS;
                r5 += 1;
            }
            else
            {
                r5[0] = EXT_CTRL_CODE_BEGIN;
                r5[1] = EXT_CTRL_CODE_CLEAR;
                r5[2] = 8;
                r5 += 3;
                *r5 = EOS;
            }
        }
        Text_InitWindow(&gWindowTemplate_Contest_MoveDescription, gStringVar4, 0x100, 12, 1);
        Text_PrintWindow8002F44(&gWindowTemplate_Contest_MoveDescription);
        gBattleStruct->atk6C_statetracker++;
        break;
    case 1:
        if (gMain.newKeys != 0)
        {
            PlaySE(SE_SELECT);
            r5 = StringCopy(gStringVar4, BattleText_Format2);
            for (i = 0; i < 6; i++)
            {
                sign = FALSE;
                r5 = StringAppend(r5, gUnknown_0840165C[i]);
                r1 = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], gLevelUpStatBoxStats[i]);
                r5[0] = EXT_CTRL_CODE_BEGIN;
                r5[1] = EXT_CTRL_CODE_CLEAR_TO;
                r5[2] = ((i & 1) * 9 + 5) * 8 + 6;
                r5 += 3;
                r5[0] = EXT_CTRL_CODE_BEGIN;
                r5[1] = EXT_CTRL_CODE_MIN_LETTER_SPACING;
                r5[2] = 6;
                r5 += 3;
                r5 = ConvertIntToDecimalStringN(r5, r1, STR_CONV_MODE_RIGHT_ALIGN, 3);
                r5[0] = EXT_CTRL_CODE_BEGIN;
                r5[1] = EXT_CTRL_CODE_MIN_LETTER_SPACING;
                r5[2] = 0;
                r5 += 3;
                if (i & 1)
                {
                    r5[0] = CHAR_NEWLINE;
                    r5[1] = EOS;
                    r5 += 1;
                }
                else
                {
                    r5[0] = EXT_CTRL_CODE_BEGIN;
                    r5[1] = EXT_CTRL_CODE_CLEAR;
                    r5[2] = 8;
                    r5 += 3;
                    *r5 = EOS;
                }
            }
            Text_InitWindow(&gWindowTemplate_Contest_MoveDescription, gStringVar4, 0x100, 12, 1);
            Text_PrintWindow8002F44(&gWindowTemplate_Contest_MoveDescription);
            gBattleStruct->atk6C_statetracker++;
        }
        break;
    case 2:
        if (gMain.newKeys != 0)
        {
            PlaySE(SE_SELECT);
            sub_802BBD4(11, 0, 29, 7, TRUE);
            gBattleStruct->atk6C_statetracker++;
        }
        break;
    case 3:
        gBattlescriptCurrInstr++;
        break;
    }
}

static void atk6D_resetsentmonsvalue(void)
{
    ResetSentPokesToOpponentValue();
    gBattlescriptCurrInstr++;
}

static void atk6E_setatktoplayer0(void)
{
    gBattlerAttacker = GetBattlerAtPosition(0);
    gBattlescriptCurrInstr++;
}

static void atk6F_makevisible(void)
{
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    BtlController_EmitSpriteInvisibility(0, 0);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

static void atk70_recordlastability(void)
{
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    RecordAbilityBattle(gActiveBattler, gLastUsedAbility);
    gBattlescriptCurrInstr += 1; //buggy, should be += 2, one byte for command, one byte for argument...
}

void sub_8024CEC(void)
{
    gBattleTextBuff2[0] = 0xFD;
    gBattleTextBuff2[1] = 2;
    gBattleTextBuff2[2] = (gMoveToLearn);
    gBattleTextBuff2[3] = uBYTE1_16(gMoveToLearn);
    gBattleTextBuff2[4] = 0xFF;
}

static void atk71_buffermovetolearn(void)
{
    sub_8024CEC();
    gBattlescriptCurrInstr++;
}

static void atk72_jumpifplayerran(void)
{
    if (TryRunFromBattle(gBank1))
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
        gBattlescriptCurrInstr += 5;
}

static void atk73_hpthresholds(void)
{
    u8 opposing_bank;
    s32 result;
    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
    {
        gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
        opposing_bank = gActiveBattler ^ 1;

        result = gBattleMons[opposing_bank].hp * 100 / gBattleMons[opposing_bank].maxHP;
        if (result == 0)
            result = 1;

        if (result >= 70 || !gBattleMons[opposing_bank].hp)
            gBattleStruct->hpScale = 0;
        else if (result >= 40)
            gBattleStruct->hpScale = 1;
        else if (result >= 10)
            gBattleStruct->hpScale = 2;
        else
            gBattleStruct->hpScale = 3;
    }

    gBattlescriptCurrInstr += 2;
}

static void atk74_hpthresholds2(void)
{
    u8 opposing_bank;
    u8 hp_switchout;
    s32 result;
    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
    {
        gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
        opposing_bank = gActiveBattler ^ 1;
        hp_switchout = gSharedMem[BSTRUCT_OFF(HP_OnSwitchout) + GetBattlerSide(opposing_bank) * 2];
        result = (hp_switchout - gBattleMons[opposing_bank].hp) * 100 / hp_switchout;

        if (gBattleMons[opposing_bank].hp >= hp_switchout)
            gBattleStruct->hpScale = 0;
        else if (result <= 29)
            gBattleStruct->hpScale = 1;
        else if (result <= 69)
            gBattleStruct->hpScale = 2;
        else
            gBattleStruct->hpScale = 3;
    }

    gBattlescriptCurrInstr += 2;
}

static void atk75_useitemonopponent(void)
{
    gBattlerInMenuId = gBattlerAttacker;
    PokemonUseItemEffects(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker]], gLastUsedItem, gBattlerPartyIndexes[gBattlerAttacker], 0, 1);
    gBattlescriptCurrInstr += 1;
}

static void atk76_various(void)
{
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    switch (T2_READ_8(gBattlescriptCurrInstr + 2))
    {
    case 0:
        CancelMultiTurnMoves(gActiveBattler);
        break;
    case 1:
        {
            u8 side;
            gBattlerAttacker = gBattlerTarget;
            side = GetBattlerSide(gBattlerAttacker) ^ 1;
            if (gSideTimers[side].followmeTimer && gBattleMons[gSideTimers[side].followmeTarget].hp)
                gBattlerTarget = gSideTimers[side].followmeTarget;
            else
                gBattlerTarget = gActiveBattler;
        }
        break;
    case 2:
        gBattleCommunication[0] = CanRunFromBattle();
        break;
    case 3:
        gBattlerTarget = GetMoveTarget(gCurrentMove, 0);
        break;
    case 4:
        if (gHitMarker & HITMARKER_FAINTED(gActiveBattler))
            gBattleCommunication[0] = 1;
        else
            gBattleCommunication[0] = 0;
        break;
    case 5:
        gSpecialStatuses[gActiveBattler].intimidatedMon = 0;
        gSpecialStatuses[gActiveBattler].traced = 0;
        break;
    case 6:
        {
            int i;
            u16* choiced_move;
            if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId)
                goto ACTIVE_0;
            if (gBattlerPartyIndexes[2] != gBattleStruct->expGetterMonId)
                break;
            if (gBattlerPartyIndexes[0] == gBattlerPartyIndexes[2])
            {
                ACTIVE_0:
                    gActiveBattler = 0;
            }
            else
                gActiveBattler = 2;

            choiced_move = &gBattleStruct->choicedMove[gActiveBattler];
            for (i = 0; i < 4; i++)
            {
                if (gBattleMons[gActiveBattler].moves[i] == *choiced_move)
                    break;
            }
            if (i == 4)
                *choiced_move = 0;
        }
        break;
    }

    gBattlescriptCurrInstr += 3;
}

static void atk77_setprotectlike(void) //protect and endure
{
    bool8 not_last_turn = 1;
    u16 last_move = gLastResultingMoves[gBattlerAttacker];

    if (last_move != MOVE_PROTECT && last_move != MOVE_DETECT && last_move != MOVE_ENDURE)
        gDisableStructs[gBattlerAttacker].protectUses = 0;
    if (gCurrentTurnActionNumber == (gBattlersCount - 1))
        not_last_turn = 0;

    if (sProtectSuccessRates[gDisableStructs[gBattlerAttacker].protectUses] > Random() && not_last_turn)
    {
        if (gBattleMoves[gCurrentMove].effect == EFFECT_PROTECT)
        {
            gProtectStructs[gBattlerAttacker].protected = 1;
            gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        }
        if (gBattleMoves[gCurrentMove].effect == EFFECT_ENDURE) //what is else if
        {
            gProtectStructs[gBattlerAttacker].endured = 1;
            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
        }
        gDisableStructs[gBattlerAttacker].protectUses++;
    }
    else
    {
        gDisableStructs[gBattlerAttacker].protectUses = 0;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
        gMoveResultFlags |= MOVE_RESULT_MISSED;
    }

    gBattlescriptCurrInstr++;
}

static void atk78_faintifabilitynotdamp(void)
{
    if (gBattleControllerExecFlags)
        return;

    for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (gBattleMons[gBattlerTarget].ability == ABILITY_DAMP)
            break;
    }

    if (gBattlerTarget == gBattlersCount)
    {
        gActiveBattler = gBattlerAttacker;
        gBattleMoveDamage = gBattleMons[gActiveBattler].hp;
        BtlController_EmitHealthBarUpdate(0, 0x7FFF);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr++;

        for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
        {
            if (gBattlerTarget == gBattlerAttacker)
                continue;
            if (!(gAbsentBattlerFlags & gBitTable[gBattlerTarget]))
                break;
        }
    }
    else
    {
        gLastUsedAbility = ABILITY_DAMP;
        RecordAbilityBattle(gBattlerTarget, gBattleMons[gBattlerTarget].ability);
        gBattlescriptCurrInstr = BattleScript_DampStopsExplosion;
    }
}

static void atk79_setatkhptozero(void)
{
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = gBattlerAttacker;
    gBattleMons[gActiveBattler].hp = 0;
    BtlController_EmitSetMonData(0, REQUEST_HP_BATTLE, 0, 2, &gBattleMons[gActiveBattler].hp);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr++;
}

static void atk7A_jumpifnexttargetvalid(void) //used by intimidate to loop through all targets
{
    u8* jump_loc = T1_READ_PTR(gBattlescriptCurrInstr + 1);

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        for (gBattlerTarget++; ; gBattlerTarget++)
        {
            if (gBattlerTarget == gBattlerAttacker)
                continue;
            if (!(gAbsentBattlerFlags & gBitTable[gBattlerTarget]))
                break;
        }

        if (gBattlerTarget >= gBattlersCount)
            gBattlescriptCurrInstr += 5;
        else
            gBattlescriptCurrInstr = jump_loc;
    }
    else
        gBattlescriptCurrInstr += 5;
}

static void atk7B_tryhealhalfhealth(void)
{
    u8* fail_loc = T1_READ_PTR(gBattlescriptCurrInstr + 1);

    if (T2_READ_8(gBattlescriptCurrInstr + 5) == 1)
        gBattlerTarget = gBattlerAttacker;

    gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP / 2;
    if (gBattleMoveDamage == 0)
        gBattleMoveDamage = 1;
    gBattleMoveDamage *= -1;

    if (gBattleMons[gBattlerTarget].hp == gBattleMons[gBattlerTarget].maxHP)
        gBattlescriptCurrInstr = fail_loc;
    else
        gBattlescriptCurrInstr += 6;
}

static void atk7C_trymirrormove(void)
{
    u16 r7 = gSharedMem[BSTRUCT_OFF(lastTakenMove) + 2 * gBattlerAttacker + 0] | (gSharedMem[BSTRUCT_OFF(lastTakenMove) + 2 * gBattlerAttacker + 1] << 8);
    u16 r6 = gSharedMem[BSTRUCT_OFF(lastTakenMoveFrom) + 4 * gBattlerAttacker + 0] | (gSharedMem[BSTRUCT_OFF(lastTakenMoveFrom) + 4 * gBattlerAttacker + 1] << 8);
    u16 r5 = gSharedMem[BSTRUCT_OFF(lastTakenMoveFrom) + 4 * gBattlerAttacker + 2] | (gSharedMem[BSTRUCT_OFF(lastTakenMoveFrom) + 4 * gBattlerAttacker + 3] << 8);

    if (r7 != 0 && r7 != 0xFFFF)
    {
        gHitMarker &= ~(HITMARKER_ATTACKSTRING_PRINTED);
        gCurrentMove = r7;
        gBattlerTarget = GetMoveTarget(gCurrentMove, 0);
        gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect];
    }
    else if (r6 != 0 && r5 != 0 && r6 != 0xFFFF && r5 != 0xFFFF)
    {
        gHitMarker &= ~(HITMARKER_ATTACKSTRING_PRINTED);
        if (Random() & 1)
            gCurrentMove = r6;
        else
            gCurrentMove = r5;
        gBattlerTarget = GetMoveTarget(gCurrentMove, 0);
        gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect];
    }
    else if (r6 != 0 && r6 != 0xFFFF)
    {
        gHitMarker &= ~(HITMARKER_ATTACKSTRING_PRINTED);
        gCurrentMove = r6;
        gBattlerTarget = GetMoveTarget(gCurrentMove, 0);
        gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect];
    }
    else if (r5 != 0 && r5 != 0xFFFF)
    {
        gHitMarker &= ~(HITMARKER_ATTACKSTRING_PRINTED);
        gCurrentMove = r5;
        gBattlerTarget = GetMoveTarget(gCurrentMove, 0);
        gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect];
    }
    else
    {
        gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = 1;
        gBattlescriptCurrInstr++;
    }
}

static void atk7D_setrain(void)
{
    if (gBattleWeather & B_WEATHER_RAIN)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
    }
    else
    {
        gBattleWeather = B_WEATHER_RAIN_TEMPORARY;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        gWishFutureKnock.weatherDuration = 5;
    }
    gBattlescriptCurrInstr++;
}

static void atk7E_setreflect(void)
{
    if (gSideStatuses[GetBattlerPosition(gBattlerAttacker) & 1] & SIDE_STATUS_REFLECT)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }
    else
    {
        gSideStatuses[GetBattlerPosition(gBattlerAttacker) & 1] |= SIDE_STATUS_REFLECT;
        gSideTimers[GetBattlerPosition(gBattlerAttacker) & 1].reflectTimer = 5;
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && CountAliveMons(1) == 2)
            gBattleCommunication[MULTISTRING_CHOOSER] = 2;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    }
    gBattlescriptCurrInstr++;
}

static void atk7F_setseeded(void)
{
    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT || gStatuses3[gBattlerTarget] & STATUS3_LEECHSEED)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    }
    else if (gBattleMons[gBattlerTarget].type1 == TYPE_GRASS || gBattleMons[gBattlerTarget].type2 == TYPE_GRASS)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
    }
    else
    {
        gStatuses3[gBattlerTarget] |= gBattlerAttacker;
        gStatuses3[gBattlerTarget] |= STATUS3_LEECHSEED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }

    gBattlescriptCurrInstr++;
}

static void atk80_manipulatedamage(void)
{
    switch (T2_READ_8(gBattlescriptCurrInstr + 1))
    {
    case 0:
        gBattleMoveDamage *= -1;
        break;
    case 1:
        gBattleMoveDamage /= 2;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        if ((gBattleMons[gBattlerTarget].maxHP / 2) < gBattleMoveDamage)
            gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP / 2;
        break;
    case 2:
        gBattleMoveDamage *= 2;
        break;
    }

    gBattlescriptCurrInstr += 2;
}

static void atk81_trysetrest(void)
{
    u8* fail_loc = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    gActiveBattler = gBattlerTarget = gBattlerAttacker;
    gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP * (-1);
    if (gBattleMons[gBattlerTarget].hp == gBattleMons[gBattlerTarget].maxHP)
        gBattlescriptCurrInstr = fail_loc;
    else
    {
        if (gBattleMons[gBattlerTarget].status1 & ((u8)(~STATUS1_SLEEP)))
            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = 0;

        gBattleMons[gBattlerTarget].status1 = 3;
        BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBattler].status1);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 5;
    }
}

static void atk82_jumpifnotfirstturn(void)
{
    u8* jump_loc = T1_READ_PTR(gBattlescriptCurrInstr + 1);

    if (gDisableStructs[gBattlerAttacker].isFirstTurn)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = jump_loc;
}

static void atk83_nop(void)
{
    gBattlescriptCurrInstr++;
}

bool8 UproarWakeUpCheck(u8 bank)
{
    int i;
    for (i = 0; i < gBattlersCount; i++)
    {
        if (!(gBattleMons[i].status2 & STATUS2_UPROAR) || gBattleMons[bank].ability == ABILITY_SOUNDPROOF) //wtf gamefreak, you should check this only once, not every time in a loop...
            continue;
        gBattleStruct->scriptingActive = i;
        if (gBattlerTarget == 0xFF)
            gBattlerTarget = i;
        else if (gBattlerTarget == i)
            gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
        break;
    }
    if (i == gBattlersCount)
        return 0;
    else
        return 1;
}

static void atk84_jumpifcantmakeasleep(void)
{
    u8* jump_loc = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    if (UproarWakeUpCheck(gBattlerTarget))
        gBattlescriptCurrInstr = jump_loc;
    else if (gBattleMons[gBattlerTarget].ability == ABILITY_INSOMNIA || gBattleMons[gBattlerTarget].ability == ABILITY_VITAL_SPIRIT)
    {
        gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
        gBattlescriptCurrInstr = jump_loc;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    else
    {
        gBattlescriptCurrInstr += 5;
    }
}

static void atk85_stockpile(void)
{
    if (gDisableStructs[gBattlerAttacker].stockpileCounter == 3)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    }
    else
    {
        gDisableStructs[gBattlerAttacker].stockpileCounter++;
        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 1;
        gBattleTextBuff1[2] = 1;
        gBattleTextBuff1[3] = 1;
        gBattleTextBuff1[4] = gDisableStructs[gBattlerAttacker].stockpileCounter;
        gBattleTextBuff1[5] = 0xFF;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }
    gBattlescriptCurrInstr++;
}

static void atk86_stockpiletobasedamage(void)
{
    u8* jump_loc = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    if (gDisableStructs[gBattlerAttacker].stockpileCounter == 0)
    {
        gBattlescriptCurrInstr = jump_loc;
    }
    else
    {
        if (gBattleCommunication[6] != 1)
        {
            gBattleMoveDamage = CalculateBaseDamage(&gBattleMons[gBattlerAttacker], &gBattleMons[gBattlerTarget], gCurrentMove,
                                                    gSideStatuses[GetBattlerPosition(gBattlerTarget) & 1], 0,
                                                    0, gBattlerAttacker, gBattlerTarget)
                                * gDisableStructs[gBattlerAttacker].stockpileCounter;
            gBattleStruct->animTurn = gDisableStructs[gBattlerAttacker].stockpileCounter;

            if (gProtectStructs[gBattlerAttacker].helpingHand)
                gBattleMoveDamage = gBattleMoveDamage * 15 / 10;
        }
        gDisableStructs[gBattlerAttacker].stockpileCounter = 0;
        gBattlescriptCurrInstr += 5;
    }
}

static void atk87_stockpiletohpheal(void)
{
    u8* jump_loc = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    if (gDisableStructs[gBattlerAttacker].stockpileCounter == 0)
    {
        gBattlescriptCurrInstr = jump_loc;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }
    else if (gBattleMons[gBattlerAttacker].maxHP == gBattleMons[gBattlerAttacker].hp)
    {
        gDisableStructs[gBattlerAttacker].stockpileCounter = 0;
        gBattlescriptCurrInstr = jump_loc;
        gBattlerTarget = gBattlerAttacker;
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    }
    else
    {
        gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / (1 << (3 - gDisableStructs[gBattlerAttacker].stockpileCounter));
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;
        gBattleStruct->animTurn = gDisableStructs[gBattlerAttacker].stockpileCounter;
        gDisableStructs[gBattlerAttacker].stockpileCounter = 0;
        gBattlescriptCurrInstr += 5;
        gBattlerTarget = gBattlerAttacker;
    }
}

static void atk88_negativedamage(void)
{
    gBattleMoveDamage = -(gHpDealt / 2);
    if (gBattleMoveDamage == 0)
        gBattleMoveDamage = -1;
    gBattlescriptCurrInstr++;
}

static u8 ChangeStatBuffs(s8 statValue, u8 statId, u8 flags, const u8 *BS_ptr)
{
    bool8 certain = FALSE;
    bool8 notProtectAffected = FALSE;
    u32 index;

    if (flags & MOVE_EFFECT_AFFECTS_USER)
        gActiveBattler = gBattlerAttacker;
    else
        gActiveBattler = gBattlerTarget;

    flags &= ~(MOVE_EFFECT_AFFECTS_USER);

    if (flags & MOVE_EFFECT_CERTAIN)
        certain++;
    flags &= ~(MOVE_EFFECT_CERTAIN);

    if (flags & STAT_CHANGE_NOT_PROTECT_AFFECTED)
        notProtectAffected++;
    flags &= ~(STAT_CHANGE_NOT_PROTECT_AFFECTED);

    PREPARE_STAT_BUFFER(gBattleTextBuff1, statId)

    if ((statValue << 0x18) < 0) // stat decrease
    {
        if (gSideTimers[GET_BATTLER_SIDE(gActiveBattler)].mistTimer
            && !certain && gCurrentMove != MOVE_CURSE)
        {
            if (flags == STAT_CHANGE_BS_PTR)
            {
                if (gSpecialStatuses[gActiveBattler].statLowered)
                {
                    gBattlescriptCurrInstr = BS_ptr;
                }
                else
                {
                    BattleScriptPush(BS_ptr);
                    gBattleStruct->scriptingActive = gActiveBattler;
                    gBattlescriptCurrInstr = BattleScript_MistProtected;
                    gSpecialStatuses[gActiveBattler].statLowered = 1;
                }
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if (gCurrentMove != MOVE_CURSE
                 && notProtectAffected != TRUE && JumpIfMoveAffectedByProtect(0))
        {
            gBattlescriptCurrInstr = BattleScript_ButItFailed;
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if ((gBattleMons[gActiveBattler].ability == ABILITY_CLEAR_BODY
                  || gBattleMons[gActiveBattler].ability == ABILITY_WHITE_SMOKE)
                 && !certain && gCurrentMove != MOVE_CURSE)
        {
            if (flags == STAT_CHANGE_BS_PTR)
            {
                if (gSpecialStatuses[gActiveBattler].statLowered)
                {
                    gBattlescriptCurrInstr = BS_ptr;
                }
                else
                {
                    BattleScriptPush(BS_ptr);
                    gBattleStruct->scriptingActive = gActiveBattler;
                    gBattlescriptCurrInstr = BattleScript_AbilityNoStatLoss;
                    gLastUsedAbility = gBattleMons[gActiveBattler].ability;
                    RecordAbilityBattle(gActiveBattler, gLastUsedAbility);
                    gSpecialStatuses[gActiveBattler].statLowered = 1;
                }
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if (gBattleMons[gActiveBattler].ability == ABILITY_KEEN_EYE
                 && !certain && statId == STAT_STAGE_ACC)
        {
            if (flags == STAT_CHANGE_BS_PTR)
            {
                BattleScriptPush(BS_ptr);
                gBattleStruct->scriptingActive = gActiveBattler;
                gBattlescriptCurrInstr = BattleScript_AbilityNoSpecificStatLoss;
                gLastUsedAbility = gBattleMons[gActiveBattler].ability;
                RecordAbilityBattle(gActiveBattler, gLastUsedAbility);
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if (gBattleMons[gActiveBattler].ability == ABILITY_HYPER_CUTTER
                 && !certain && statId == STAT_STAGE_ATK)
        {
            if (flags == STAT_CHANGE_BS_PTR)
            {
                BattleScriptPush(BS_ptr);
                gBattleStruct->scriptingActive = gActiveBattler;
                gBattlescriptCurrInstr = BattleScript_AbilityNoSpecificStatLoss;
                gLastUsedAbility = gBattleMons[gActiveBattler].ability;
                RecordAbilityBattle(gActiveBattler, gLastUsedAbility);
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if (gBattleMons[gActiveBattler].ability == ABILITY_SHIELD_DUST && flags == 0)
        {
            return STAT_CHANGE_DIDNT_WORK;
        }
        else // try to decrease
        {
            statValue = -GET_STAT_BUFF_VALUE(statValue);
            gBattleTextBuff2[0] = B_BUFF_PLACEHOLDER_BEGIN;
            index = 1;
            if (statValue == -2)
            {
                gBattleTextBuff2[1] = B_BUFF_STRING;
                gBattleTextBuff2[2] = STRINGID_STATHARSHLY;
                gBattleTextBuff2[3] = STRINGID_STATHARSHLY >> 8;
                index = 4;
            }
            gBattleTextBuff2[index] = B_BUFF_STRING;
            index++;
            gBattleTextBuff2[index] = STRINGID_STATFELL;
            index++;
            gBattleTextBuff2[index] = STRINGID_STATFELL >> 8;
            index++;
            gBattleTextBuff2[index] = B_BUFF_EOS;

            if (gBattleMons[gActiveBattler].statStages[statId] == 0)
                gBattleCommunication[MULTISTRING_CHOOSER] = 2;
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = (gBattlerTarget == gActiveBattler);

        }
    }
    else // stat increase
    {
        statValue = GET_STAT_BUFF_VALUE(statValue);
        gBattleTextBuff2[0] = B_BUFF_PLACEHOLDER_BEGIN;
        index = 1;
        if (statValue == 2)
        {
            gBattleTextBuff2[1] = B_BUFF_STRING;
            gBattleTextBuff2[2] = STRINGID_STATSHARPLY;
            gBattleTextBuff2[3] = STRINGID_STATSHARPLY >> 8;
            index = 4;
        }
        gBattleTextBuff2[index] = B_BUFF_STRING;
        index++;
        gBattleTextBuff2[index] = STRINGID_STATROSE;
        index++;
        gBattleTextBuff2[index] = STRINGID_STATROSE >> 8;
        index++;
        gBattleTextBuff2[index] = B_BUFF_EOS;

        if (gBattleMons[gActiveBattler].statStages[statId] == 0xC)
            gBattleCommunication[MULTISTRING_CHOOSER] = 2;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = (gBattlerTarget == gActiveBattler);
    }

    gBattleMons[gActiveBattler].statStages[statId] += statValue;
    if (gBattleMons[gActiveBattler].statStages[statId] < 0)
        gBattleMons[gActiveBattler].statStages[statId] = 0;
    if (gBattleMons[gActiveBattler].statStages[statId] > 0xC)
        gBattleMons[gActiveBattler].statStages[statId] = 0xC;

    if (gBattleCommunication[MULTISTRING_CHOOSER] == 2 && flags & STAT_CHANGE_BS_PTR)
        gMoveResultFlags |= MOVE_RESULT_MISSED;

    if (gBattleCommunication[MULTISTRING_CHOOSER] == 2 && !(flags & STAT_CHANGE_BS_PTR))
        return STAT_CHANGE_DIDNT_WORK;

    return STAT_CHANGE_WORKED;
}

static void atk89_statbuffchange(void)
{
    u8* jump_loc = T1_READ_PTR(gBattlescriptCurrInstr + 2);
    if (ChangeStatBuffs(gBattleStruct->statChanger & 0xF0, gBattleStruct->statChanger & 0xF, T2_READ_8(gBattlescriptCurrInstr + 1), jump_loc) == 0)
        gBattlescriptCurrInstr += 6;
}

static void atk8A_normalisebuffs(void) //haze
{
    int i, j;
    for (i = 0; i < gBattlersCount; i++)
    {
        for (j = 0; j < 8; j++)
        {
            gBattleMons[i].statStages[j] = 6;
        }
    }
    gBattlescriptCurrInstr++;
}

static void atk8B_setbide(void)
{
    gBattleMons[gBattlerAttacker].status2 |= STATUS2_MULTIPLETURNS;
    gLockedMoves[gBattlerAttacker] = gCurrentMove;
    gTakenDmg[gBattlerAttacker] = 0;
    gBattleMons[gBattlerAttacker].status2 |= (STATUS2_BIDE - 0x100); //2 turns
    gBattlescriptCurrInstr++;
}

static void atk8C_confuseifrepeatingattackends(void)
{
    if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_LOCK_CONFUSE))
        gBattleCommunication[MOVE_EFFECT_BYTE] = 0x75;
    gBattlescriptCurrInstr++;
}

static void atk8D_setmultihitcounter(void)
{
    if (T2_READ_8(gBattlescriptCurrInstr + 1))
        gMultiHitCounter = T2_READ_8(gBattlescriptCurrInstr + 1);
    else
    {
        gMultiHitCounter = Random() & 3;
        if (gMultiHitCounter > 1)
            gMultiHitCounter = (Random() & 3) + 2;
        else
            gMultiHitCounter += 2;
    }
    gBattlescriptCurrInstr += 2;
}

static void atk8E_initmultihitstring(void)
{
    PREPARE_BYTE_NUMBER_BUFFER(gBattleStruct->unk160E0, 1, 0);
    gBattlescriptCurrInstr++;
}

static bool8 sub_80264C0(void)
{
    if (gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
    {
        gSharedMem[BSTRUCT_OFF(unk16064) + gBattlerTarget] = gBattlerPartyIndexes[gBattlerTarget];
    }
    else
    {
        u16 random = Random() & 0xFF;
        if ((u32)((random * (gBattleMons[gBattlerAttacker].level + gBattleMons[gBattlerTarget].level) >> 8) + 1) <= (gBattleMons[gBattlerTarget].level / 4))
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
            return 0;
        }
        gSharedMem[BSTRUCT_OFF(unk16064) + gBattlerTarget] = gBattlerPartyIndexes[gBattlerTarget];
    }
    gBattlescriptCurrInstr = BattleScript_SuccessForceOut;
    return 1;
}

static void atk8F_forcerandomswitch(void)
{
    if ((gBattleTypeFlags & BATTLE_TYPE_TRAINER))
    {
        u8 i;
        struct Pokemon* party;
        u8 valid;
        u8 val;
        if (!GetBattlerSide(gBattlerTarget))
            party = gPlayerParty;
        else
            party = gEnemyParty;

        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            valid = 0;
            val = 0;
            if (sub_803FBFC(sub_803FC34(gBattlerTarget)) == 1)
                val = 3;
            for (i = val; i < val + 3; i++)
            {
                if (GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
                 && !GetMonData(&party[i], MON_DATA_IS_EGG)
                 && GetMonData(&party[i], MON_DATA_HP) != 0)
                    valid++;
            }
        }
        else
        {
            valid = 0;
            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
                 && !GetMonData(&party[i], MON_DATA_IS_EGG)
                 && GetMonData(&party[i], MON_DATA_HP) != 0)
                    valid++;
            }
        }

        if ((valid < 2 && (gBattleTypeFlags & (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI)) != BATTLE_TYPE_DOUBLE)
         || (valid < 3 && (gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && !(gBattleTypeFlags & BATTLE_TYPE_MULTI)))
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
        else if (sub_80264C0())
        {
#define MON_CAN_BATTLE(mon) (((GetMonData(mon, MON_DATA_SPECIES) && GetMonData(mon, MON_DATA_IS_EGG) != 1 && GetMonData(mon, MON_DATA_HP))))
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                do
                {
                    val = Random() % 3;
                    if (sub_803FBFC(sub_803FC34(gBattlerTarget)) == 1)
                        i = val + 3;
                    else
                        i = val;
                } while (i == gBattlerPartyIndexes[gBattlerTarget] || i == gBattlerPartyIndexes[gBattlerTarget ^ 2] || !MON_CAN_BATTLE(&party[i]));
            }
            else
            {
                if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                {
                    do
                    {
                        i = Random() % 6;
                    } while (i == gBattlerPartyIndexes[gBattlerTarget] || i == gBattlerPartyIndexes[gBattlerTarget ^ 2] || !MON_CAN_BATTLE(&party[i]));
                }
                else
                {
                    do
                    {
                        i = Random() % 6;
                    } while (i == gBattlerPartyIndexes[gBattlerTarget] || !MON_CAN_BATTLE(&party[i]));
                }
            }
            gSharedMem[BSTRUCT_OFF(monToSwitchIntoId) + gBattlerTarget] = i;
            if (!IsLinkDoubleBattle())
                sub_8012258(gBattlerTarget);
            sub_8094B6C(gBattlerTarget, i, 0);
            sub_8094B6C(gBattlerTarget ^ 2, i, 1);
#undef MON_CAN_BATTLE
        }
    }
    else
    {
        sub_80264C0();
    }
}

static void atk90_tryconversiontypechange(void)
{
    //randomly changes user's type to one of its moves' type
    u8 valid_moves = 0;
    u8 checked_move;
    u8 moveType;
    while (valid_moves < 4)
    {
        if (gBattleMons[gBattlerAttacker].moves[valid_moves] == 0)
            break;
        valid_moves++;
    }

    for (checked_move = 0; checked_move < valid_moves; checked_move++)
    {
        moveType = gBattleMoves[gBattleMons[gBattlerAttacker].moves[checked_move]].type;
        if (moveType == TYPE_MYSTERY)
        {
            if (gBattleMons[gBattlerAttacker].type1 == TYPE_GHOST || gBattleMons[gBattlerAttacker].type2 == TYPE_GHOST)
                moveType = TYPE_GHOST;
            else
                moveType = TYPE_NORMAL;
        }
        if (moveType != gBattleMons[gBattlerAttacker].type1 && moveType != gBattleMons[gBattlerAttacker].type2)
            break;
    }

    if (checked_move == valid_moves)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        do
        {

            while ((checked_move = Random() & 3) >= valid_moves);

            moveType = gBattleMoves[gBattleMons[gBattlerAttacker].moves[checked_move]].type;
            if (moveType == TYPE_MYSTERY)
            {
                if (gBattleMons[gBattlerAttacker].type1 == TYPE_GHOST || gBattleMons[gBattlerAttacker].type2 == TYPE_GHOST)
                    moveType = TYPE_GHOST;
                else
                    moveType = TYPE_NORMAL;
            }
        } while (moveType == gBattleMons[gBattlerAttacker].type1 || moveType == gBattleMons[gBattlerAttacker].type2);

        gBattleMons[gBattlerAttacker].type1 = moveType;
        gBattleMons[gBattlerAttacker].type2 = moveType;

        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 3;
        gBattleTextBuff1[2] = moveType;
        gBattleTextBuff1[3] = 0xFF;

        gBattlescriptCurrInstr += 5;
    }
}

static void atk91_givepaydaymoney(void)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK) && gPaydayMoney)
    {
        AddMoney(&gSaveBlock1.money, gPaydayMoney * gBattleStruct->moneyMultiplier);
        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 1;
        gBattleTextBuff1[2] = 2;
        gBattleTextBuff1[3] = 5;
        gBattleTextBuff1[4] = gPaydayMoney;
        gBattleTextBuff1[5] = uBYTE1_16(gPaydayMoney);
        gBattleTextBuff1[6] = 0xFF;
        BattleScriptPush(gBattlescriptCurrInstr + 1);
        gBattlescriptCurrInstr = BattleScript_PrintPayDayMoneyString;
    }
    else
        gBattlescriptCurrInstr++;
}

static void atk92_setlightscreen(void)
{
    if (gSideStatuses[GetBattlerPosition(gBattlerAttacker) & 1] & SIDE_STATUS_LIGHTSCREEN)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }
    else
    {
        gSideStatuses[GetBattlerPosition(gBattlerAttacker) & 1] |= SIDE_STATUS_LIGHTSCREEN;
        gSideTimers[GetBattlerPosition(gBattlerAttacker) & 1].lightscreenTimer = 5;
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && CountAliveMons(1) == 2)
            gBattleCommunication[MULTISTRING_CHOOSER] = 4;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = 3;
    }
    gBattlescriptCurrInstr++;
}

#ifdef NOTMATCHING
static void atk93_tryKO(void)
{
   if (gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY)
        holdEffect = gEnigmaBerries[gBattlerTarget].holdEffect, param = gEnigmaBerries[gBattlerTarget].holdEffectParam;
    else
    {
        holdEffect = ItemId_GetHoldEffect(gBattleMons[gBattlerTarget].item);
        param = ItemId_GetHoldEffectParam(gBattleMons[gBattlerTarget].item);
    }

    gPotentialItemEffectBattler = gBattlerTarget;

    if (holdEffect == HOLD_EFFECT_FOCUS_BAND && (Random() % 100) < param)
    {
        RecordItemEffectBattle(gBattlerTarget, holdEffect);
        gSpecialStatuses[gBattlerTarget].focusBanded = 1;
    }

    if (gBattleMons[gBattlerTarget].ability == ABILITY_STURDY)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gLastUsedAbility = ABILITY_STURDY;
        gBattlescriptCurrInstr = x;
        RecordAbilityBattle(gBattlerTarget, ABILITY_STURDY);
        return;
    }

    if (!(gStatuses3[gBattlerTarget] & STATUS3_ALWAYS_HITS))
    {
        u16 to_cmp = gBattleMons[gBattlerAttacker].level - gBattleMons[gBattlerTarget].level + gBattleMoves[gCurrentMove].accuracy;
        if (Random() % 0x64 + 1 < to_cmp || gBattleMons[gBattlerAttacker].level < gBattleMons[gBattlerTarget].level)
        {
            goto MOVE_RESULT_MISSED_LABEL;
        }
    }
    else
    {
        if (gDisableStructs[gBattlerTarget].battlerWithSureHit != gBattlerAttacker || gBattleMons[gBattlerAttacker].level < gBattleMons[gBattlerTarget].level)
        {

        }
    }

MOVE_RESULT_MISSED_LABEL:
    gBattleTypeFlags |= MOVE_RESULT_MISSED;
    if (gBattleMons[gBattlerAttacker].level < gBattleMons[gBattlerTarget].level)
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    else
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

#else
__attribute((naked))
static void atk93_tryKO(void)
{
    asm(".syntax unified\n\
        push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    ldr r7, _08026BA8 @ =gBattleMons\n\
    ldr r6, _08026BAC @ =gBattlerTarget\n\
    ldrb r2, [r6]\n\
    movs r5, 0x58\n\
    adds r0, r2, 0\n\
    muls r0, r5\n\
    adds r1, r0, r7\n\
    ldrh r0, [r1, 0x2E]\n\
    cmp r0, 0xAF\n\
    bne _08026BB4\n\
    ldr r1, _08026BB0 @ =gEnigmaBerries\n\
    lsls r0, r2, 3\n\
    subs r0, r2\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrb r4, [r0, 0x7]\n\
    ldrb r6, [r0, 0x1A]\n\
    b _08026BCE\n\
    .align 2, 0\n\
_08026BA8: .4byte gBattleMons\n\
_08026BAC: .4byte gBattlerTarget\n\
_08026BB0: .4byte gEnigmaBerries\n\
_08026BB4:\n\
    ldrh r0, [r1, 0x2E]\n\
    bl ItemId_GetHoldEffect\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    ldrb r0, [r6]\n\
    muls r0, r5\n\
    adds r0, r7\n\
    ldrh r0, [r0, 0x2E]\n\
    bl ItemId_GetHoldEffectParam\n\
    lsls r0, 24\n\
    lsrs r6, r0, 24\n\
_08026BCE:\n\
    ldr r1, _08026C4C @ =gPotentialItemEffectBattler\n\
    ldr r5, _08026C50 @ =gBattlerTarget\n\
    ldrb r0, [r5]\n\
    strb r0, [r1]\n\
    cmp r4, 0x27\n\
    bne _08026C0C\n\
    bl Random\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0x64\n\
    bl __umodsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, r6\n\
    bcs _08026C0C\n\
    ldrb r0, [r5]\n\
    movs r1, 0x27\n\
    bl RecordItemEffectBattle\n\
    ldr r2, _08026C54 @ =gSpecialStatuses\n\
    ldrb r1, [r5]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    ldrb r1, [r0]\n\
    movs r2, 0x80\n\
    orrs r1, r2\n\
    strb r1, [r0]\n\
_08026C0C:\n\
    ldr r0, _08026C58 @ =gBattleMons\n\
    mov r8, r0\n\
    ldr r1, _08026C50 @ =gBattlerTarget\n\
    ldrb r2, [r1]\n\
    movs r6, 0x58\n\
    adds r0, r2, 0\n\
    muls r0, r6\n\
    mov r3, r8\n\
    adds r5, r0, r3\n\
    adds r0, r5, 0\n\
    adds r0, 0x20\n\
    ldrb r3, [r0]\n\
    mov r10, r8\n\
    cmp r3, 0x5\n\
    bne _08026C6C\n\
    ldr r2, _08026C5C @ =gMoveResultFlags\n\
    ldrb r0, [r2]\n\
    movs r1, 0x1\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldr r0, _08026C60 @ =gLastUsedAbility\n\
    strb r3, [r0]\n\
    ldr r1, _08026C64 @ =gBattlescriptCurrInstr\n\
    ldr r0, _08026C68 @ =BattleScript_SturdyPreventsOHKO\n\
    str r0, [r1]\n\
    ldr r1, _08026C50 @ =gBattlerTarget\n\
    ldrb r0, [r1]\n\
    movs r1, 0x5\n\
    bl RecordAbilityBattle\n\
    b _08026E40\n\
    .align 2, 0\n\
_08026C4C: .4byte gPotentialItemEffectBattler\n\
_08026C50: .4byte gBattlerTarget\n\
_08026C54: .4byte gSpecialStatuses\n\
_08026C58: .4byte gBattleMons\n\
_08026C5C: .4byte gMoveResultFlags\n\
_08026C60: .4byte gLastUsedAbility\n\
_08026C64: .4byte gBattlescriptCurrInstr\n\
_08026C68: .4byte BattleScript_SturdyPreventsOHKO\n\
_08026C6C:\n\
    ldr r1, _08026CE0 @ =gStatuses3\n\
    lsls r0, r2, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    movs r1, 0x18\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _08026CF4\n\
    ldr r1, _08026CE4 @ =gBattleMoves\n\
    ldr r0, _08026CE8 @ =gCurrentMove\n\
    ldrh r0, [r0]\n\
    lsls r2, r0, 1\n\
    adds r2, r0\n\
    lsls r2, 2\n\
    adds r2, r1\n\
    ldr r7, _08026CEC @ =gBattlerAttacker\n\
    ldrb r0, [r7]\n\
    muls r0, r6\n\
    add r0, r10\n\
    adds r0, 0x2A\n\
    ldrb r0, [r0]\n\
    adds r1, r5, 0\n\
    adds r1, 0x2A\n\
    ldrb r1, [r1]\n\
    subs r0, r1\n\
    ldrb r2, [r2, 0x3]\n\
    adds r0, r2\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    bl Random\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0x64\n\
    bl __umodsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    adds r0, 0x1\n\
    cmp r0, r4\n\
    bge _08026CDC\n\
    ldrb r0, [r7]\n\
    adds r1, r0, 0\n\
    muls r1, r6\n\
    add r1, r10\n\
    adds r1, 0x2A\n\
    ldr r2, _08026CF0 @ =gBattlerTarget\n\
    ldrb r0, [r2]\n\
    muls r0, r6\n\
    add r0, r10\n\
    adds r0, 0x2A\n\
    ldrb r1, [r1]\n\
    movs r4, 0x1\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    bcs _08026D20\n\
_08026CDC:\n\
    mov r10, r8\n\
    b _08026DE0\n\
    .align 2, 0\n\
_08026CE0: .4byte gStatuses3\n\
_08026CE4: .4byte gBattleMoves\n\
_08026CE8: .4byte gCurrentMove\n\
_08026CEC: .4byte gBattlerAttacker\n\
_08026CF0: .4byte gBattlerTarget\n\
_08026CF4:\n\
    ldr r0, _08026D4C @ =gDisableStructs\n\
    lsls r1, r2, 3\n\
    subs r1, r2\n\
    lsls r1, 2\n\
    adds r1, r0\n\
    ldr r2, _08026D50 @ =gBattlerAttacker\n\
    ldrb r0, [r1, 0x15]\n\
    movs r4, 0\n\
    ldrb r3, [r2]\n\
    cmp r0, r3\n\
    bne _08026D20\n\
    ldrb r0, [r2]\n\
    muls r0, r6\n\
    add r0, r10\n\
    adds r0, 0x2A\n\
    adds r1, r5, 0\n\
    adds r1, 0x2A\n\
    ldrb r0, [r0]\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    bcc _08026D20\n\
    movs r4, 0x1\n\
_08026D20:\n\
    cmp r4, 0\n\
    beq _08026DE0\n\
    ldr r0, _08026D54 @ =gProtectStructs\n\
    ldr r1, _08026D58 @ =gBattlerTarget\n\
    ldrb r2, [r1]\n\
    lsls r1, r2, 4\n\
    adds r1, r0\n\
    ldrb r0, [r1]\n\
    lsls r0, 30\n\
    cmp r0, 0\n\
    bge _08026D64\n\
    ldr r1, _08026D5C @ =gBattleMoveDamage\n\
    movs r0, 0x58\n\
    muls r0, r2\n\
    add r0, r10\n\
    ldrh r0, [r0, 0x28]\n\
    subs r0, 0x1\n\
    str r0, [r1]\n\
    ldr r2, _08026D60 @ =gMoveResultFlags\n\
    ldrb r0, [r2]\n\
    movs r1, 0x40\n\
    b _08026DC6\n\
    .align 2, 0\n\
_08026D4C: .4byte gDisableStructs\n\
_08026D50: .4byte gBattlerAttacker\n\
_08026D54: .4byte gProtectStructs\n\
_08026D58: .4byte gBattlerTarget\n\
_08026D5C: .4byte gBattleMoveDamage\n\
_08026D60: .4byte gMoveResultFlags\n\
_08026D64:\n\
    ldr r0, _08026DA0 @ =gSpecialStatuses\n\
    lsls r1, r2, 2\n\
    adds r1, r2\n\
    lsls r1, 2\n\
    adds r1, r0\n\
    ldrb r0, [r1]\n\
    lsrs r0, 7\n\
    cmp r0, 0\n\
    beq _08026DB4\n\
    ldr r1, _08026DA4 @ =gBattleMoveDamage\n\
    movs r3, 0x58\n\
    adds r0, r2, 0\n\
    muls r0, r3\n\
    add r0, r10\n\
    ldrh r0, [r0, 0x28]\n\
    subs r0, 0x1\n\
    str r0, [r1]\n\
    ldr r2, _08026DA8 @ =gMoveResultFlags\n\
    ldrb r0, [r2]\n\
    movs r1, 0x80\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldr r1, _08026DAC @ =gLastUsedItem\n\
    ldr r2, _08026DB0 @ =gBattlerTarget\n\
    ldrb r0, [r2]\n\
    muls r0, r3\n\
    add r0, r10\n\
    ldrh r0, [r0, 0x2E]\n\
    strh r0, [r1]\n\
    b _08026DCA\n\
    .align 2, 0\n\
_08026DA0: .4byte gSpecialStatuses\n\
_08026DA4: .4byte gBattleMoveDamage\n\
_08026DA8: .4byte gMoveResultFlags\n\
_08026DAC: .4byte gLastUsedItem\n\
_08026DB0: .4byte gBattlerTarget\n\
_08026DB4:\n\
    ldr r1, _08026DD4 @ =gBattleMoveDamage\n\
    movs r0, 0x58\n\
    muls r0, r2\n\
    add r0, r10\n\
    ldrh r0, [r0, 0x28]\n\
    str r0, [r1]\n\
    ldr r2, _08026DD8 @ =gMoveResultFlags\n\
    ldrb r0, [r2]\n\
    movs r1, 0x10\n\
_08026DC6:\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
_08026DCA:\n\
    ldr r1, _08026DDC @ =gBattlescriptCurrInstr\n\
    ldr r0, [r1]\n\
    adds r0, 0x5\n\
    str r0, [r1]\n\
    b _08026E40\n\
    .align 2, 0\n\
_08026DD4: .4byte gBattleMoveDamage\n\
_08026DD8: .4byte gMoveResultFlags\n\
_08026DDC: .4byte gBattlescriptCurrInstr\n\
_08026DE0:\n\
    ldr r2, _08026E10 @ =gMoveResultFlags\n\
    ldrb r0, [r2]\n\
    movs r1, 0x1\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldr r0, _08026E14 @ =gBattlerAttacker\n\
    ldrb r0, [r0]\n\
    movs r2, 0x58\n\
    adds r1, r0, 0\n\
    muls r1, r2\n\
    add r1, r10\n\
    adds r1, 0x2A\n\
    ldr r3, _08026E18 @ =gBattlerTarget\n\
    ldrb r0, [r3]\n\
    muls r0, r2\n\
    add r0, r10\n\
    adds r0, 0x2A\n\
    ldrb r1, [r1]\n\
    ldrb r0, [r0]\n\
    cmp r1, r0\n\
    bcc _08026E20\n\
    ldr r1, _08026E1C @ =gBattleCommunication\n\
    movs r0, 0\n\
    b _08026E24\n\
    .align 2, 0\n\
_08026E10: .4byte gMoveResultFlags\n\
_08026E14: .4byte gBattlerAttacker\n\
_08026E18: .4byte gBattlerTarget\n\
_08026E1C: .4byte gBattleCommunication\n\
_08026E20:\n\
    ldr r1, _08026E50 @ =gBattleCommunication\n\
    movs r0, 0x1\n\
_08026E24:\n\
    strb r0, [r1, 0x5]\n\
    ldr r3, _08026E54 @ =gBattlescriptCurrInstr\n\
    ldr r2, [r3]\n\
    ldrb r1, [r2, 0x1]\n\
    ldrb r0, [r2, 0x2]\n\
    lsls r0, 8\n\
    orrs r1, r0\n\
    ldrb r0, [r2, 0x3]\n\
    lsls r0, 16\n\
    orrs r1, r0\n\
    ldrb r0, [r2, 0x4]\n\
    lsls r0, 24\n\
    orrs r1, r0\n\
    str r1, [r3]\n\
_08026E40:\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08026E50: .4byte gBattleCommunication\n\
_08026E54: .4byte gBattlescriptCurrInstr\n\
        .syntax divided");
}
#endif // NOTMATCHING

static void atk94_damagetohalftargethp(void) //super fang
{
    gBattleMoveDamage = gBattleMons[gBattlerTarget].hp / 2;
    if (gBattleMoveDamage == 0)
        gBattleMoveDamage = 1;
    gBattlescriptCurrInstr++;
}

static void atk95_setsandstorm(void)
{
    if (gBattleWeather & B_WEATHER_SANDSTORM)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
    }
    else
    {
        gBattleWeather = B_WEATHER_SANDSTORM_TEMPORARY;
        gBattleCommunication[MULTISTRING_CHOOSER] = 3;
        gWishFutureKnock.weatherDuration = 5;
    }
    gBattlescriptCurrInstr++;
}

static void atk96_weatherdamage(void)
{
    if (WEATHER_HAS_EFFECT)
    {
        if (gBattleWeather & B_WEATHER_SANDSTORM)
        {
            if (gBattleMons[gBattlerAttacker].type1 != TYPE_ROCK && gBattleMons[gBattlerAttacker].type1 != TYPE_STEEL && gBattleMons[gBattlerAttacker].type1 != TYPE_GROUND
             && gBattleMons[gBattlerAttacker].type2 != TYPE_ROCK && gBattleMons[gBattlerAttacker].type2 != TYPE_STEEL && gBattleMons[gBattlerAttacker].type2 != TYPE_GROUND
             && gBattleMons[gBattlerAttacker].ability != ABILITY_SAND_VEIL && !(gStatuses3[gBattlerAttacker] & STATUS3_UNDERGROUND) && !(gStatuses3[gBattlerAttacker] & STATUS3_UNDERWATER))
            {
                gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 16;
                if (gBattleMoveDamage == 0)
                    gBattleMoveDamage = 1;
            }
            else
            {
                gBattleMoveDamage = 0;
            }
        }
        if (gBattleWeather & B_WEATHER_HAIL_TEMPORARY)
        {
            if (gBattleMons[gBattlerAttacker].type1 != TYPE_ICE && gBattleMons[gBattlerAttacker].type2 != TYPE_ICE && !(gStatuses3[gBattlerAttacker] & STATUS3_UNDERGROUND) && !(gStatuses3[gBattlerAttacker] & STATUS3_UNDERWATER))
            {
                gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 16;
                if (gBattleMoveDamage == 0)
                    gBattleMoveDamage = 1;
            }
            else
            {
                gBattleMoveDamage = 0;
            }
        }
    }
    else
        gBattleMoveDamage = 0;

    if (gAbsentBattlerFlags & gBitTable[gBattlerAttacker])
        gBattleMoveDamage = 0;

    gBattlescriptCurrInstr++;
}

static void atk97_tryinfatuating(void)
{
    struct Pokemon *attacker, *target;
    u16 atk_species, def_species;
    u32 atk_pid, def_pid;
    if (!GetBattlerSide(gBattlerAttacker))
        attacker = &gPlayerParty[gBattlerPartyIndexes[gBattlerAttacker]];
    else
        attacker = &gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker]];

    if (!GetBattlerSide(gBattlerTarget))
        target = &gPlayerParty[gBattlerPartyIndexes[gBattlerTarget]];
    else
        target = &gEnemyParty[gBattlerPartyIndexes[gBattlerTarget]];

    atk_species = GetMonData(attacker, MON_DATA_SPECIES);
    atk_pid = GetMonData(attacker, MON_DATA_PERSONALITY);

    def_species = GetMonData(target, MON_DATA_SPECIES);
    def_pid = GetMonData(target, MON_DATA_PERSONALITY);

    if (gBattleMons[gBattlerTarget].ability == ABILITY_OBLIVIOUS)
    {
        gBattlescriptCurrInstr = BattleScript_ObliviousPreventsAttraction;
        gLastUsedAbility = ABILITY_OBLIVIOUS;
        RecordAbilityBattle(gBattlerTarget, ABILITY_OBLIVIOUS);
    }
    else
    {
        if (GetGenderFromSpeciesAndPersonality(atk_species, atk_pid) == GetGenderFromSpeciesAndPersonality(def_species, def_pid)
            || gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE || gBattleMons[gBattlerTarget].status2 & STATUS2_INFATUATION || GetGenderFromSpeciesAndPersonality(atk_species, atk_pid) == 0xFF
            || GetGenderFromSpeciesAndPersonality(def_species, def_pid) == 0xFF)
            {
                gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
            }
        else
        {
            gBattleMons[gBattlerTarget].status2 |= STATUS2_INFATUATED_WITH(gBattlerAttacker);
            gBattlescriptCurrInstr += 5;
        }
    }
}

static void atk98_updatestatusicon(void)
{
    if (gBattleControllerExecFlags)
        return;

    if (T2_READ_8(gBattlescriptCurrInstr + 1) != 4)
    {
        gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
        BtlController_EmitStatusIconUpdate(0, gBattleMons[gActiveBattler].status1, gBattleMons[gActiveBattler].status2);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 2;
    }
    else
    {
        gActiveBattler = gBattlerAttacker;
        if (!(gAbsentBattlerFlags & gBitTable[gActiveBattler]))
        {
            BtlController_EmitStatusIconUpdate(0, gBattleMons[gActiveBattler].status1, gBattleMons[gActiveBattler].status2);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
        {
            gActiveBattler = GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) ^ 2);
            if (!(gAbsentBattlerFlags & gBitTable[gActiveBattler]))
            {
                BtlController_EmitStatusIconUpdate(0, gBattleMons[gActiveBattler].status1, gBattleMons[gActiveBattler].status2);
                MarkBattlerForControllerExec(gActiveBattler);
            }
        }
        gBattlescriptCurrInstr += 2;
    }
}

static void atk99_setmist(void)
{
    if (gSideTimers[GetBattlerPosition(gBattlerAttacker) & 1].mistTimer)
    {
        gMoveResultFlags |= MOVE_RESULT_FAILED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    }
    else
    {
        gSideTimers[GetBattlerPosition(gBattlerAttacker) & 1].mistTimer = 5;
        gSideStatuses[GetBattlerPosition(gBattlerAttacker) & 1] |= SIDE_STATUS_MIST;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }
    gBattlescriptCurrInstr++;
}

static void atk9A_setfocusenergy(void)
{
    if (gBattleMons[gBattlerAttacker].status2 & STATUS2_FOCUS_ENERGY)
    {
        gMoveResultFlags |= MOVE_RESULT_FAILED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    }
    else
    {
        gBattleMons[gBattlerAttacker].status2 |= STATUS2_FOCUS_ENERGY;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }
    gBattlescriptCurrInstr++;
}

static void atk9B_transformdataexecution(void)
{
    gChosenMove = 0xFFFF;
    gBattlescriptCurrInstr++;
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_TRANSFORMED || gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE)
    {
        gMoveResultFlags |= MOVE_RESULT_FAILED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    }
    else
    {
        u32 i; s32 j;
        u8 *atk_data, *def_data;
        gBattleMons[gBattlerAttacker].status2 |= STATUS2_TRANSFORMED;
        gDisableStructs[gBattlerAttacker].disabledMove = 0;
        gDisableStructs[gBattlerAttacker].disableTimer1 = 0;
        gDisableStructs[gBattlerAttacker].transformedMonPersonality = gBattleMons[gBattlerTarget].personality;
        gDisableStructs[gBattlerAttacker].mimickedMoves = 0;

        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 6;
        gBattleTextBuff1[2] = (gBattleMons[gBattlerTarget].species);
        gBattleTextBuff1[3] = uBYTE1_16(gBattleMons[gBattlerTarget].species);
        gBattleTextBuff1[4] = 0xFF;

        atk_data = (u8*)(&gBattleMons[gBattlerAttacker]);
        def_data = (u8*)(&gBattleMons[gBattlerTarget]);

        for (i = 0; i < 0x24; i++)
            atk_data[i] = def_data[i];

        for (j = 0; j < 4; j++)
        {
            if (gBattleMoves[gBattleMons[gBattlerAttacker].moves[j]].pp < 5)
                gBattleMons[gBattlerAttacker].pp[j] = gBattleMoves[gBattleMons[gBattlerAttacker].moves[j]].pp;
            else
                gBattleMons[gBattlerAttacker].pp[j] = 5;
        }

        gActiveBattler = gBattlerAttacker;
        BtlController_EmitResetActionMoveSelection(0, 2);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }
}

static void atk9C_setsubstitute(void)
{
    u32 hp = gBattleMons[gBattlerAttacker].maxHP / 4;
    if (gBattleMons[gBattlerAttacker].maxHP / 4 == 0)
        hp = 1;
    if (gBattleMons[gBattlerAttacker].hp <= hp)
    {
        gBattleMoveDamage = 0;
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    }
    else
    {
        gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 4;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMons[gBattlerAttacker].status2 |= STATUS2_SUBSTITUTE;
        gBattleMons[gBattlerAttacker].status2 &= ~(STATUS2_WRAPPED);
        gDisableStructs[gBattlerAttacker].substituteHP = gBattleMoveDamage;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        gHitMarker |= HITMARKER_IGNORE_SUBSTITUTE;
    }
    gBattlescriptCurrInstr++;
}

static bool8 IsMoveUncopyable(u16 move)
{
    int i;
    for (i = 0; sMovesForbiddenToCopy[i] != 0xFFFE && sMovesForbiddenToCopy[i] != move; i++) {}
    return (sMovesForbiddenToCopy[i] != 0xFFFE);
}

static void atk9D_mimicattackcopy(void)
{
    gChosenMove = 0xFFFF;
    if (IsMoveUncopyable(gLastMoves[gBattlerTarget]) || gBattleMons[gBattlerAttacker].status2 & STATUS2_TRANSFORMED
        || gLastMoves[gBattlerTarget] == 0 || gLastMoves[gBattlerTarget] == 0xFFFF)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        int i;
        for (i = 0; i < 4; i++)
        {
            if (gBattleMons[gBattlerAttacker].moves[i] == gLastMoves[gBattlerTarget])
                break;
        }
        if (i == 4)
        {
            gBattleMons[gBattlerAttacker].moves[gCurrMovePos] = gLastMoves[gBattlerTarget];
            if (gBattleMoves[gLastMoves[gBattlerTarget]].pp < 5)
                gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = gBattleMoves[gLastMoves[gBattlerTarget]].pp;
            else
                gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = 5;

            gBattleTextBuff1[0] = 0xFD;
            gBattleTextBuff1[1] = 2;
            gBattleTextBuff1[2] = gLastMoves[gBattlerTarget];
            gBattleTextBuff1[3] = uBYTE1_16(gLastMoves[gBattlerTarget]);
            gBattleTextBuff1[4] = 0xFF;

            gDisableStructs[gBattlerAttacker].mimickedMoves |= gBitTable[gCurrMovePos];
            gBattlescriptCurrInstr += 5;
        }
        else
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

void atk9E_metronome(void)
{
#if DEBUG
    u16 * r3 = (u16 *)&gSharedMem[BSTRUCT_OFF(lastTakenMove) + 8 + (2 * gBattlerAttacker)];
    if (
        gBattleMons[gBattlerAttacker].moves[1] == MOVE_NONE
     && gBattleMons[gBattlerAttacker].moves[2] != MOVE_NONE
     && gBattleMons[gBattlerAttacker].moves[3] != MOVE_NONE
    )
    {
        if (*r3 == MOVE_NONE)
            *r3 = gBattleMons[gBattlerAttacker].moves[2];
        gCurrentMove = *r3;
        if (gBattleMons[gBattlerAttacker].moves[2] < gBattleMons[gBattlerAttacker].moves[3])
        {
            if (*r3 == gBattleMons[gBattlerAttacker].moves[3])
                *r3 = gBattleMons[gBattlerAttacker].moves[2];
            else
                (*r3)++;
        }
        else
        {
            asm("":::"r4"); // Force correct register use
            if (*r3 == NUM_MOVES - 1)
                *r3 = 1;
            else if (*r3 == gBattleMons[gBattlerAttacker].moves[3])
                *r3 = gBattleMons[gBattlerAttacker].moves[2];
            else
                (*r3)++;
        }
        gHitMarker &= ~(HITMARKER_ATTACKSTRING_PRINTED);
        asm("":::"r5"); // Force correct register use
        gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect];
        gHitMarker |= HITMARKER_NO_PPDEDUCT;
        gBattlerTarget = GetMoveTarget(gCurrentMove, 0);
        return;
    }
#endif //DEBUG
    while (1)
    {
        s32 i;

        gCurrentMove = (Random() & 0x1FF) + 1;
        if (gCurrentMove >= NUM_MOVES)
            continue;
        for (i = 0; i < MAX_MON_MOVES; ++i); // redundant
        i = -1;
        while (1)
        {
            ++i;
            if (sMovesForbiddenToCopy[i] == gCurrentMove)
                break;
            if (sMovesForbiddenToCopy[i] == METRONOME_FORBIDDEN_END)
                break;
        }
        if (sMovesForbiddenToCopy[i] == METRONOME_FORBIDDEN_END)
        {
            gHitMarker &= ~(HITMARKER_ATTACKSTRING_PRINTED);
            gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect];
            gBattlerTarget = GetMoveTarget(gCurrentMove, 0);
            return;
        }
    }
}

static void atk9F_dmgtolevel(void)
{
    gBattleMoveDamage = gBattleMons[gBattlerAttacker].level;
    gBattlescriptCurrInstr++;
}

static void atkA0_psywavedamageeffect(void)
{
    s32 rand_dmg;
    while ((rand_dmg = (Random() & 0xF)) > 0xA);
    rand_dmg *= 10;
    gBattleMoveDamage = gBattleMons[gBattlerAttacker].level * (rand_dmg + 50) / 100;
    gBattlescriptCurrInstr++;
}

static void atkA1_counterdamagecalculator(void)
{
    u8 atk_side = GetBattlerSide(gBattlerAttacker);
    u8 def_side = GetBattlerSide(gProtectStructs[gBattlerAttacker].physicalBattlerId);
    if (gProtectStructs[gBattlerAttacker].physicalDmg && atk_side != def_side && gBattleMons[gProtectStructs[gBattlerAttacker].physicalBattlerId].hp)
    {
        gBattleMoveDamage = gProtectStructs[gBattlerAttacker].physicalDmg * 2;
        if (gSideTimers[def_side].followmeTimer && gBattleMons[gSideTimers[def_side].followmeTarget].hp)
            gBattlerTarget = gSideTimers[def_side].followmeTarget;
        else
            gBattlerTarget = gProtectStructs[gBattlerAttacker].physicalBattlerId;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = 1;
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void atkA2_mirrorcoatdamagecalculator(void) //a copy of atkA1 with the physical -> special field changes
{
    u8 atk_side = GetBattlerSide(gBattlerAttacker);
    u8 def_side = GetBattlerSide(gProtectStructs[gBattlerAttacker].specialBattlerId);
    if (gProtectStructs[gBattlerAttacker].specialDmg && atk_side != def_side && gBattleMons[gProtectStructs[gBattlerAttacker].specialBattlerId].hp)
    {
        gBattleMoveDamage = gProtectStructs[gBattlerAttacker].specialDmg * 2;
        if (gSideTimers[def_side].followmeTimer && gBattleMons[gSideTimers[def_side].followmeTarget].hp)
            gBattlerTarget = gSideTimers[def_side].followmeTarget;
        else
            gBattlerTarget = gProtectStructs[gBattlerAttacker].specialBattlerId;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = 1;
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void atkA3_disablelastusedattack(void)
{
    int i;
    for (i = 0; i < 4; i++)
    {
        if (gBattleMons[gBattlerTarget].moves[i] == gLastMoves[gBattlerTarget])
            break;
    }
    if (gDisableStructs[gBattlerTarget].disabledMove == 0 && i != 4 && gBattleMons[gBattlerTarget].pp[i] != 0)
    {
        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 2;
        gBattleTextBuff1[2] = gBattleMons[gBattlerTarget].moves[i];
        gBattleTextBuff1[3] = uBYTE1_16(gBattleMons[gBattlerTarget].moves[i]);
        gBattleTextBuff1[4] = 0xFF;

        gDisableStructs[gBattlerTarget].disabledMove = gBattleMons[gBattlerTarget].moves[i];
        gDisableStructs[gBattlerTarget].disableTimer1 = (Random() & 3) + 2;
        gDisableStructs[gBattlerTarget].disableTimer2 = gDisableStructs[gBattlerTarget].disableTimer1; //that's interesting
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void atkA4_trysetencore(void)
{
    int i;
    for (i = 0; i < 4; i++)
    {
        if (gBattleMons[gBattlerTarget].moves[i] == gLastMoves[gBattlerTarget])
            break;
    }
    if (gLastMoves[gBattlerTarget] == MOVE_STRUGGLE || gLastMoves[gBattlerTarget] == MOVE_ENCORE || gLastMoves[gBattlerTarget] == MOVE_MIRROR_MOVE)
        i = 4;
    if (gDisableStructs[gBattlerTarget].encoredMove == 0 && i != 4 && gBattleMons[gBattlerTarget].pp[i] != 0)
    {
        gDisableStructs[gBattlerTarget].encoredMove = gBattleMons[gBattlerTarget].moves[i];
        gDisableStructs[gBattlerTarget].encoredMovePos = i;
        gDisableStructs[gBattlerTarget].encoreTimer1 = (Random() & 3) + 3;
        gDisableStructs[gBattlerTarget].encoreTimer2 = gDisableStructs[gBattlerTarget].encoreTimer1;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void atkA5_painsplitdmgcalc(void)
{
    if (!(gBattleMons[gBattlerTarget].status2 & STATUS2_SUBSTITUTE))
    {
        s32 hp_diff = (gBattleMons[gBattlerAttacker].hp + gBattleMons[gBattlerTarget].hp) / 2;
        s32 to_store = gBattleMoveDamage = gBattleMons[gBattlerTarget].hp - hp_diff;

        gSharedMem[BSTRUCT_OFF(painSplitHP) + 0] = sBYTE0_32(to_store);
        gSharedMem[BSTRUCT_OFF(painSplitHP) + 1] = sBYTE1_32(to_store);
        gSharedMem[BSTRUCT_OFF(painSplitHP) + 2] = sBYTE2_32(to_store);
        gSharedMem[BSTRUCT_OFF(painSplitHP) + 3] = sBYTE3_32(to_store);

        gBattleMoveDamage = gBattleMons[gBattlerAttacker].hp - hp_diff;
        gSpecialStatuses[gBattlerTarget].dmg = 0xFFFF;

        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkA6_settypetorandomresistance(void)
{
    if (gLastLandedMoves[gBattlerAttacker] == 0
        || gLastLandedMoves[gBattlerAttacker] == 0xFFFF)
    {
        // The attacker has not yet been hit with a move
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else if (IsTwoTurnsMove(gLastLandedMoves[gBattlerAttacker])
             && !(gProtectStructs[gBattlerAttacker].physicalDmg != 0 || gProtectStructs[gBattlerAttacker].specialDmg != 0))
    {
        // The attacker is about to be hit with the effects of a two-turn move
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        s32 i, j, rands;

        // Try up to 1000 times
        for (rands = 0; rands < 1000; rands++)
        {
            while (((i = (Random() & 0x7F)) > 0x150u / 3));

            i *= 3;

            if (TYPE_EFFECT_ATK_TYPE(i) == gLastHitByType[gBattlerAttacker]
                && TYPE_EFFECT_MULTIPLIER(i) <= TYPE_MUL_NOT_EFFECTIVE
                && !IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_EFFECT_DEF_TYPE(i)))
            {
                // Success
                SET_BATTLER_TYPE(gBattlerAttacker, TYPE_EFFECT_DEF_TYPE(i));
                PREPARE_TYPE_BUFFER(gBattleTextBuff1, TYPE_EFFECT_DEF_TYPE(i));

                gBattlescriptCurrInstr += 5;
                return;
            }
        }

        // Random selection failed, so go through linearly
        for (j = 0, rands = 0; rands < 0x150u; j += 3, rands += 3)
        {
            switch (TYPE_EFFECT_ATK_TYPE(j))
            {
            case TYPE_ENDTABLE:
            case TYPE_FORESIGHT:
                break;
            default:
                if (TYPE_EFFECT_ATK_TYPE(j) == gLastHitByType[gBattlerAttacker]
                    && TYPE_EFFECT_MULTIPLIER(j) <= TYPE_MUL_NOT_EFFECTIVE
                    && !IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_EFFECT_DEF_TYPE(i)))
                {
                    SET_BATTLER_TYPE(gBattlerAttacker, TYPE_EFFECT_DEF_TYPE(rands));
                    PREPARE_TYPE_BUFFER(gBattleTextBuff1, TYPE_EFFECT_DEF_TYPE(rands))

                    gBattlescriptCurrInstr += 5;
                    return;
                }
                break;
            }
        }

        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void atkA7_setalwayshitflag(void)
{
    gStatuses3[gBattlerTarget] &= ~(STATUS3_ALWAYS_HITS);
    gStatuses3[gBattlerTarget] |= STATUS3_ALWAYS_HITS_TURN(2);
    gDisableStructs[gBattlerTarget].battlerWithSureHit = gBattlerAttacker;
    gBattlescriptCurrInstr++;
}

struct move_pp
{
    u16 move[4];
    u8 pp[4];
    u8 ppBonuses;
};

static void atkA8_copymovepermanently(void)
{
    gChosenMove = 0xFFFF;
    if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_TRANSFORMED) && gLastPrintedMoves[gBattlerTarget] != MOVE_STRUGGLE && gLastPrintedMoves[gBattlerTarget] != 0 && gLastPrintedMoves[gBattlerTarget] != 0xFFFF && gLastPrintedMoves[gBattlerTarget] != MOVE_SKETCH)
    {
        int i;
        for (i = 0; i < 4; i++)
        {
            if (gBattleMons[gBattlerAttacker].moves[i] == MOVE_SKETCH)
                continue;
            if (gBattleMons[gBattlerAttacker].moves[i] == gLastPrintedMoves[gBattlerTarget])
                break;
        }
        if (i != 4) //sketch fail
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        else //sketch worked
        {
            struct move_pp moves_data;
            gBattleMons[gBattlerAttacker].moves[gCurrMovePos] = gLastPrintedMoves[gBattlerTarget];
            gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = gBattleMoves[gLastPrintedMoves[gBattlerTarget]].pp;
            gActiveBattler = gBattlerAttacker;
            for (i = 0; i < 4; i++)
            {
                moves_data.move[i] = gBattleMons[gBattlerAttacker].moves[i];
                moves_data.pp[i] = gBattleMons[gBattlerAttacker].pp[i];
            }
            moves_data.ppBonuses = gBattleMons[gBattlerAttacker].ppBonuses;
            BtlController_EmitSetMonData(0, REQUEST_MOVES_PP_BATTLE, 0, sizeof(struct move_pp), &moves_data);
            MarkBattlerForControllerExec(gActiveBattler);
            gBattleTextBuff1[0] = 0xFD;
            gBattleTextBuff1[1] = 2;
            gBattleTextBuff1[2] = gLastPrintedMoves[gBattlerTarget];
            gBattleTextBuff1[3] = gLastPrintedMoves[gBattlerTarget] >> 8;
            gBattleTextBuff1[4] = 0xFF;
            gBattlescriptCurrInstr += 5;
        }
    }
    else //sketch fail
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static bool8 IsTwoTurnsMove(u16 move)
{
    u8 effect = gBattleMoves[move].effect;
    if (effect == EFFECT_SKULL_BASH || effect == EFFECT_RAZOR_WIND || effect == EFFECT_SKY_ATTACK || effect == EFFECT_SOLARBEAM || effect == EFFECT_FLY || effect == EFFECT_BIDE)
        return 1;
    else
        return 0;
}

static bool8 IsMoveUnchoosable(u16 move)
{
    if (move == 0 || move == MOVE_SLEEP_TALK || move == MOVE_ASSIST || move == MOVE_MIRROR_MOVE || move == MOVE_METRONOME)
        return 1;
    else
        return 0;
}

static u8 AttacksThisTurn(u8 bank, u16 move) //Note: returns 1 if it's a charging turn, otherwise 2
{
    //first argument is unused
    u8 effect;
    if (gBattleMoves[move].effect == EFFECT_SOLARBEAM && (gBattleWeather & B_WEATHER_SUN))
        return 2;
    effect = gBattleMoves[move].effect;
    if (effect == EFFECT_SKULL_BASH || effect == EFFECT_RAZOR_WIND || effect == EFFECT_SKY_ATTACK || effect == EFFECT_SOLARBEAM || effect == EFFECT_FLY || effect == EFFECT_BIDE)
    {
        if ((gHitMarker & HITMARKER_CHARGING))
            return 1;
    }
    return 2;
}

static void atkA9_trychoosesleeptalkmove(void)
{
    u8 unusable_moves = 0;
    int i;

    for (i = 0; i < 4; i++)
    {
        if (IsMoveUnchoosable(gBattleMons[gBattlerAttacker].moves[i]) || gBattleMons[gBattlerAttacker].moves[i] == MOVE_FOCUS_PUNCH
            || gBattleMons[gBattlerAttacker].moves[i] == MOVE_UPROAR || IsTwoTurnsMove(gBattleMons[gBattlerAttacker].moves[i]))
                unusable_moves |= gBitTable[i];
    }
    unusable_moves = CheckMoveLimitations(gBattlerAttacker, unusable_moves, 0xFD);
    if (unusable_moves == 0xF) //all 4 moves cannot be chosen
        gBattlescriptCurrInstr += 5;
    else //at least one move can be chosen
    {
        u32 random_pos;
        do
        {
            random_pos = Random() & 3;
        } while ((gBitTable[random_pos] & unusable_moves));

        gRandomMove = gBattleMons[gBattlerAttacker].moves[random_pos];
        gCurrMovePos = random_pos;
        gHitMarker &= ~(HITMARKER_ATTACKSTRING_PRINTED);
        gBattlerTarget = GetMoveTarget(gRandomMove, 0);
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void atkAA_setdestinybond(void)
{
    gBattleMons[gBattlerAttacker].status2 |= STATUS2_DESTINY_BOND;
    gBattlescriptCurrInstr++;
}

static void TrySetDestinyBondToHappen(void)
{
    u8 atk_side = GetBattlerSide(gBattlerAttacker);
    u8 def_side = GetBattlerSide(gBattlerTarget);
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_DESTINY_BOND && atk_side != def_side && !(gHitMarker & HITMARKER_GRUDGE))
        gHitMarker |= HITMARKER_DESTINYBOND;
}

static void atkAB_trysetdestinybondtohappen(void)
{
    TrySetDestinyBondToHappen();
    gBattlescriptCurrInstr++;
}

static void atkAC_remaininghptopower(void)
{
    s32 hp_fraction = GetScaledHPFraction(gBattleMons[gBattlerAttacker].hp, gBattleMons[gBattlerAttacker].maxHP, 48);
    int i;
    for (i = 0; i < 12; i += 2)
    {
        if (hp_fraction <= sFlailHpScaleToPowerTable[i])
            break;
    }
    gDynamicBasePower = sFlailHpScaleToPowerTable[i + 1];
    gBattlescriptCurrInstr++;
}

static void atkAD_tryspiteppreduce(void)
{
    if (gLastMoves[gBattlerTarget] != 0 && gLastMoves[gBattlerTarget] != 0xFFFF && !(gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE))
    {
        int i;
        for (i = 0; i < 4; i++)
        {
            if (gLastMoves[gBattlerTarget] == gBattleMons[gBattlerTarget].moves[i])
                break;
        }
        if (i != 4 && gBattleMons[gBattlerTarget].pp[i] > 1)
        {
            s32 lost_pp = (Random() & 3) + 2;
            if (gBattleMons[gBattlerTarget].pp[i] < lost_pp)
                lost_pp = gBattleMons[gBattlerTarget].pp[i];

            gBattleTextBuff1[0] = 0xFD;
            gBattleTextBuff1[1] = 2;
            gBattleTextBuff1[2] = gLastMoves[gBattlerTarget];
            gBattleTextBuff1[3] = gLastMoves[gBattlerTarget] >> 8;
            gBattleTextBuff1[4] = 0xFF;
            ConvertIntToDecimalStringN(gBattleTextBuff2, lost_pp, 0, 1);
            gBattleTextBuff2[0] = 0xFD;
            gBattleTextBuff2[1] = 1;
            gBattleTextBuff2[2] = 1;
            gBattleTextBuff2[3] = 1;
            gBattleTextBuff2[4] = lost_pp;
            gBattleTextBuff2[5] = 0xFF;

            gBattleMons[gBattlerTarget].pp[i] -= lost_pp;
            gActiveBattler = gBattlerTarget;
            if (!(gDisableStructs[gActiveBattler].mimickedMoves & gBitTable[i])
                && !(gBattleMons[gActiveBattler].status2 & STATUS2_TRANSFORMED))
            {
                BtlController_EmitSetMonData(0, REQUEST_PPMOVE1_BATTLE + i, 0, 1, &gBattleMons[gActiveBattler].pp[i]);
                MarkBattlerForControllerExec(gActiveBattler);
            }
            gBattlescriptCurrInstr += 5;
            if (gBattleMons[gBattlerTarget].pp[i] == 0)
                CancelMultiTurnMoves(gBattlerTarget);
            return;
        }
    }
    gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkAE_healpartystatus(void)
{
    register u32 zero2 asm("r4") = 0;
    u32 zero = zero2;
    u8 to_heal = 0;
    if (gCurrentMove == MOVE_HEAL_BELL)
    {
        struct Pokemon* party;
        int i;

        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        if (GetBattlerSide(gBattlerAttacker) == 0)
            party = gPlayerParty;
        else
            party = gEnemyParty;

        if (gBattleMons[gBattlerAttacker].ability != ABILITY_SOUNDPROOF)
        {
            gBattleMons[gBattlerAttacker].status1 = 0;
        }
        else
        {
            RecordAbilityBattle(gBattlerAttacker, gBattleMons[gBattlerAttacker].ability);
            gBattleCommunication[MULTISTRING_CHOOSER] |= 1;
        }

        gActiveBattler = gBattleStruct->scriptingActive = GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) ^ 2);
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && !(gAbsentBattlerFlags & gBitTable[gActiveBattler]))
        {
            if (gBattleMons[gActiveBattler].ability != ABILITY_SOUNDPROOF)
            {
                gBattleMons[gActiveBattler].status1 = 0;
            }
            else
            {
                RecordAbilityBattle(gActiveBattler, gBattleMons[gActiveBattler].ability);
                gBattleCommunication[MULTISTRING_CHOOSER] |= 2;
            }
        }

        for (i = 0; i < PARTY_SIZE; i++)
        {
            u16 species = GetMonData(&party[i], MON_DATA_SPECIES2);
            u8 abilityBit = GetMonData(&party[i], MON_DATA_ALT_ABILITY);
            if (species != 0 && species != SPECIES_EGG)
            {
                u8 ability;
                if (gBattlerPartyIndexes[gBattlerAttacker] == i)
                    ability = gBattleMons[gBattlerAttacker].ability;
                else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && gBattlerPartyIndexes[gActiveBattler] == i && !(gAbsentBattlerFlags & gBitTable[gActiveBattler]))
                    ability = gBattleMons[gActiveBattler].ability;
                else
                    ability = GetAbilityBySpecies(species, abilityBit);
                if (ability != ABILITY_SOUNDPROOF)
                    to_heal |= (1 << i);
            }
        }
    }
    else //Aromatherapy
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = 4;
        to_heal = 0x3F;
        gBattleMons[gBattlerAttacker].status1 = zero2;

        gActiveBattler = GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) ^ 2);
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && !(gAbsentBattlerFlags & gBitTable[gActiveBattler]))
            gBattleMons[gActiveBattler].status1 = 0;

    }
    //missing check?
    gActiveBattler = gBattlerAttacker;
    BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, to_heal, 4, &zero);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr++;
}

static void atkAF_cursetarget(void)
{
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_CURSED || gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gBattleMons[gBattlerTarget].status2 |= STATUS2_CURSED;
        gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 2;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkB0_trysetspikes(void)
{
    u8 side = GetBattlerSide(gBattlerAttacker) ^ 1;
    if (gSideTimers[side].spikesAmount == 3)
    {
        gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = 1;
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gSideStatuses[side] |= SIDE_STATUS_SPIKES;
        gSideTimers[side].spikesAmount++;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkB1_setforesight(void)
{
    gBattleMons[gBattlerTarget].status2 |= STATUS2_FORESIGHT;
    gBattlescriptCurrInstr++;
}

static void atkB2_trysetperishsong(void)
{
    int not_affected_pokes = 0, i;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gStatuses3[i] & STATUS3_PERISH_SONG || gBattleMons[i].ability == ABILITY_SOUNDPROOF)
            not_affected_pokes++;
        else
        {
            gStatuses3[i] |= STATUS3_PERISH_SONG;
            gDisableStructs[i].perishSongTimer1 = 3;
            gDisableStructs[i].perishSongTimer2 = 3;
        }
    }

    PressurePPLoseOnUsingPerishSong(gBattlerAttacker);
    if (not_affected_pokes == gBattlersCount)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
        gBattlescriptCurrInstr += 5;
}

static void atkB3_rolloutdamagecalculation(void)
{
    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
    {
        CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveMissedPause;
    }
    else
    {
        int i;
        if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS)) //first hit
        {
            gDisableStructs[gBattlerAttacker].rolloutTimer1 = 5;
            gDisableStructs[gBattlerAttacker].rolloutTimer2 = 5;
            gBattleMons[gBattlerAttacker].status2 |= STATUS2_MULTIPLETURNS;
            gLockedMoves[gBattlerAttacker] = gCurrentMove;
        }
        if (--gDisableStructs[gBattlerAttacker].rolloutTimer1 == 0)
            gBattleMons[gBattlerAttacker].status2 &= ~(STATUS2_MULTIPLETURNS);

        gDynamicBasePower = gBattleMoves[gCurrentMove].power;
        for (i = 1; i < (5 - gDisableStructs[gBattlerAttacker].rolloutTimer1); i++)
            gDynamicBasePower *= 2;

        if (gBattleMons[gBattlerAttacker].status2 & STATUS2_DEFENSE_CURL)
            gDynamicBasePower *= 2;

        gBattlescriptCurrInstr++;
    }
}

static void atkB4_jumpifconfusedandstatmaxed(void)
{
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_CONFUSION && gBattleMons[gBattlerTarget].statStages[T2_READ_8(gBattlescriptCurrInstr + 1)] == 0xC)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
    else
        gBattlescriptCurrInstr += 6;
}

static void atkB5_furycuttercalc(void)
{
    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
    {
        gDisableStructs[gBattlerAttacker].furyCutterCounter = 0;
        gBattlescriptCurrInstr = BattleScript_MoveMissedPause;
    }
    else
    {
        int i;

        if (gDisableStructs[gBattlerAttacker].furyCutterCounter != 5)
            gDisableStructs[gBattlerAttacker].furyCutterCounter++;

        gDynamicBasePower = gBattleMoves[gCurrentMove].power;
        for (i = 1; i < gDisableStructs[gBattlerAttacker].furyCutterCounter; i++)
            gDynamicBasePower *= 2;

        gBattlescriptCurrInstr++;
    }
}

static void atkB6_happinesstodamagecalculation(void)
{
    if (gBattleMoves[gCurrentMove].effect == EFFECT_RETURN)
        gDynamicBasePower = 10 * (gBattleMons[gBattlerAttacker].friendship) / 25;
    else //EFFECT_FRUSTRATION
        gDynamicBasePower = 10 * (255 - gBattleMons[gBattlerAttacker].friendship) / 25;
    gBattlescriptCurrInstr++;
}

static void atkB7_presentdamagecalculation(void)
{
    s32 rand = Random() & 0xFF;
    if (rand < 102)
        gDynamicBasePower = 40;
    else if (rand < 178)
        gDynamicBasePower = 80;
    else if (rand < 204)
        gDynamicBasePower = 120;
    else
    {
        gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP / 4;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;
    }
    if (rand < 204)
        gBattlescriptCurrInstr = BattleScript_HitFromCritCalc;
    else if (gBattleMons[gBattlerTarget].maxHP == gBattleMons[gBattlerTarget].hp)
        gBattlescriptCurrInstr = BattleScript_AlreadyAtFullHp;
    else
    {
        //gMoveResultFlags &= ~(MOVE_RESULT_DOESNT_AFFECT_FOE); only in Emerald
        gBattlescriptCurrInstr = BattleScript_PresentHealTarget;
    }
}

static void atkB8_setsafeguard(void)
{
    if (gSideStatuses[GetBattlerPosition(gBattlerAttacker) & 1] & SIDE_STATUS_SAFEGUARD)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }
    else
    {
        gSideStatuses[GetBattlerPosition(gBattlerAttacker) & 1] |= SIDE_STATUS_SAFEGUARD;
        gSideTimers[GetBattlerPosition(gBattlerAttacker) & 1].safeguardTimer = 5;
        gBattleCommunication[MULTISTRING_CHOOSER] = 5;
    }
    gBattlescriptCurrInstr++;
}

static void atkB9_magnitudedamagecalculation(void)
{
    s32 magnitude = Random() % 100;
    if (magnitude < 5)
    {
        gDynamicBasePower = 10;
        magnitude = 4;
    }
    else if (magnitude < 15)
    {
        gDynamicBasePower = 30;
        magnitude = 5;
    }
    else if (magnitude < 35)
    {
        gDynamicBasePower = 50;
        magnitude = 6;
    }
    else if (magnitude < 65)
    {
        gDynamicBasePower = 70;
        magnitude = 7;
    }
    else if (magnitude < 85)
    {
        gDynamicBasePower = 90;
        magnitude = 8;
    }
    else if (magnitude < 95)
    {
        gDynamicBasePower = 110;
        magnitude = 9;
    }
    else
    {
        gDynamicBasePower = 150;
        magnitude = 10;
    }

    gBattleTextBuff1[0] = 0xFD;
    gBattleTextBuff1[1] = 1;
    gBattleTextBuff1[2] = 1;
    gBattleTextBuff1[3] = 2;
    gBattleTextBuff1[4] = magnitude;
    gBattleTextBuff1[5] = 0xFF;

    for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (gBattlerTarget == gBattlerAttacker)
            continue;
        if (!(gAbsentBattlerFlags & gBitTable[gBattlerTarget])) //a valid target was found
            break;
    }
    gBattlescriptCurrInstr++;
}

static void atkBA_jumpifnopursuitswitchdmg(void)
{
    if (gMultiHitCounter == 1)
    {
        if (GetBattlerSide(gBattlerAttacker) == 0)
            gBattlerTarget = GetBattlerAtPosition(1);
        else
            gBattlerTarget = GetBattlerAtPosition(0);
    }
    else
    {
        if (GetBattlerSide(gBattlerAttacker) == 0)
            gBattlerTarget = GetBattlerAtPosition(3);
        else
            gBattlerTarget = GetBattlerAtPosition(2);
    }

    if (gActionForBanks[gBattlerTarget] == 0 && gBattlerAttacker == gSharedMem[BSTRUCT_OFF(moveTarget) + gBattlerTarget] && !(gBattleMons[gBattlerTarget].status1 & (STATUS1_SLEEP | STATUS1_FREEZE))
        && gBattleMons[gBattlerAttacker].hp && !gDisableStructs[gBattlerTarget].truantCounter && gChosenMovesByBanks[gBattlerTarget] == MOVE_PURSUIT)
    {
        int i;
        for (i = 0; i < gBattlersCount; i++)
        {
            if (gBattlerByTurnOrder[i] == gBattlerTarget)
                gActionsByTurnOrder[i] = 11;
        }
        gCurrentMove = MOVE_PURSUIT;
        gBattlescriptCurrInstr += 5;
        gBattleStruct->animTurn = 1;
        gHitMarker &= ~(HITMARKER_ATTACKSTRING_PRINTED);
    }
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkBB_setsunny(void)
{
    if (gBattleWeather & B_WEATHER_SUN)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
    }
    else
    {
        gBattleWeather = B_WEATHER_SUN_TEMPORARY;
        gBattleCommunication[MULTISTRING_CHOOSER] = 4;
        gWishFutureKnock.weatherDuration = 5;
    }
    gBattlescriptCurrInstr++;
}

static void atkBC_maxattackhalvehp(void) //belly drum
{
    u32 half_hp = gBattleMons[gBattlerAttacker].maxHP / 2;
    if (!(gBattleMons[gBattlerAttacker].maxHP / 2))
        half_hp = 1;

    if (gBattleMons[gBattlerAttacker].statStages[STAT_STAGE_ATK] < 12 && gBattleMons[gBattlerAttacker].hp > half_hp)
    {
        gBattleMons[gBattlerAttacker].statStages[STAT_STAGE_ATK] = 12;
        gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 2;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void atkBD_copyfoestats(void) //psych up
{
    int i;
    for (i = 0; i < 8; i++)
    {
        gBattleMons[gBattlerAttacker].statStages[i] = gBattleMons[gBattlerTarget].statStages[i];
    }
    gBattlescriptCurrInstr += 5; //why not 1? possible unused fail possibility?
}

static void atkBE_rapidspinfree(void) //rapid spin
{
    if (gBattleMons[gBattlerAttacker].status2 & STATUS2_WRAPPED)
    {
        gBattleMons[gBattlerAttacker].status2 &= ~(STATUS2_WRAPPED);
        gBattlerTarget = gSharedMem[BSTRUCT_OFF(wrappedBy) + gBattlerAttacker];
        gBattleTextBuff1[0] = B_BUFF_PLACEHOLDER_BEGIN;
        gBattleTextBuff1[1] = B_BUFF_MOVE;
        gBattleTextBuff1[2] = gSharedMem[BSTRUCT_OFF(wrappedMove) + 2 * gBattlerAttacker + 0];
        gBattleTextBuff1[3] = gSharedMem[BSTRUCT_OFF(wrappedMove) + 2 * gBattlerAttacker + 1];
        gBattleTextBuff1[4] = B_BUFF_EOS;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_WrapFree;
    }
    else if (gStatuses3[gBattlerAttacker] & STATUS3_LEECHSEED)
    {
        gStatuses3[gBattlerAttacker] &= ~(STATUS3_LEECHSEED);
        gStatuses3[gBattlerAttacker] &= ~(STATUS3_LEECHSEED_BATTLER);
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_LeechSeedFree;
    }
    else if (gSideStatuses[GetBattlerSide(gBattlerAttacker)] & SIDE_STATUS_SPIKES)
    {
        gSideStatuses[GetBattlerSide(gBattlerAttacker)] &= ~(SIDE_STATUS_SPIKES);
        gSideTimers[GetBattlerSide(gBattlerAttacker)].spikesAmount = 0;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_SpikesFree;
    }
    else
        gBattlescriptCurrInstr++;
}

static void atkBF_setdefensecurlbit(void)
{
    gBattleMons[gBattlerAttacker].status2 |= STATUS2_DEFENSE_CURL;
    gBattlescriptCurrInstr++;
}

static void atkC0_recoverbasedonsunlight(void)
{
    gBattlerTarget = gBattlerAttacker;
    if (gBattleMons[gBattlerAttacker].hp != gBattleMons[gBattlerAttacker].maxHP)
    {
        if (!gBattleWeather || !WEATHER_HAS_EFFECT)
            gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 2;
        else if (gBattleWeather & B_WEATHER_SUN)
            gBattleMoveDamage = 20 * gBattleMons[gBattlerAttacker].maxHP / 30;
        else //not sunny weather
            gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 4;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void atkC1_hiddenpowercalc(void)
{
	u8 power = ((gBattleMons[gBattlerAttacker].hpIV & 2) >> 1) |
	           ((gBattleMons[gBattlerAttacker].attackIV & 2)) |
	           ((gBattleMons[gBattlerAttacker].defenseIV & 2) << 1) |
	           ((gBattleMons[gBattlerAttacker].speedIV & 2) << 2) |
	           ((gBattleMons[gBattlerAttacker].spAttackIV & 2) << 3) |
	           ((gBattleMons[gBattlerAttacker].spDefenseIV & 2) << 4);
	u8 type = ((gBattleMons[gBattlerAttacker].hpIV & 1)) |
	          ((gBattleMons[gBattlerAttacker].attackIV & 1) << 1) |
	          ((gBattleMons[gBattlerAttacker].defenseIV & 1) << 2) |
	          ((gBattleMons[gBattlerAttacker].speedIV & 1) << 3) |
	          ((gBattleMons[gBattlerAttacker].spAttackIV & 1) << 4) |
	          ((gBattleMons[gBattlerAttacker].spDefenseIV & 1) << 5);

	gDynamicBasePower = 30 + (power * 40 / 63);

	gBattleStruct->dynamicMoveType = ((type * 15) / 63) + 1;
	if (gBattleStruct->dynamicMoveType >= TYPE_MYSTERY)
		gBattleStruct->dynamicMoveType++;

	gBattleStruct->dynamicMoveType |= 0xC0;

	gBattlescriptCurrInstr++;
}

static void atkC2_selectfirstvalidtarget(void)
{
    for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (gBattlerTarget == gBattlerAttacker)
            continue;
        if (!(gAbsentBattlerFlags & gBitTable[gBattlerTarget]))
            break;
    }
    gBattlescriptCurrInstr++;
}

static void atkC3_trysetfutureattack(void)
{
    if (gWishFutureKnock.futureSightCounter[gBattlerTarget] != 0)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gWishFutureKnock.futureSightMove[gBattlerTarget] = gCurrentMove;
        gWishFutureKnock.futureSightAttacker[gBattlerTarget] = gBattlerAttacker;
        gWishFutureKnock.futureSightCounter[gBattlerTarget] = 3;
        gWishFutureKnock.futureSightDmg[gBattlerTarget] = CalculateBaseDamage(&gBattleMons[gBattlerAttacker], &gBattleMons[gBattlerTarget], gCurrentMove,
                                                    gSideStatuses[GetBattlerPosition(gBattlerTarget) & 1], 0,
                                                    0, gBattlerAttacker, gBattlerTarget);

        if (gProtectStructs[gBattlerAttacker].helpingHand)
            gWishFutureKnock.futureSightDmg[gBattlerTarget] = gWishFutureKnock.futureSightDmg[gBattlerTarget] * 15 / 10;

        if (gCurrentMove == MOVE_DOOM_DESIRE)
            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = 0;

        gBattlescriptCurrInstr += 5;
    }
}

static void atkC4_trydobeatup(void)
{
    struct Pokemon *party;

    if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
        party = gPlayerParty;
    else
        party = gEnemyParty;
    if (gBattleMons[gBattlerTarget].hp == 0)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        u8 beforeLoop = gBattleCommunication[0];

        for (;gBattleCommunication[0] < PARTY_SIZE; ++gBattleCommunication[0])
        {
            if (GetMonData(&party[gBattleCommunication[0]], MON_DATA_HP)
             && GetMonData(&party[gBattleCommunication[0]], MON_DATA_SPECIES2)
             && GetMonData(&party[gBattleCommunication[0]], MON_DATA_SPECIES2) != SPECIES_EGG
             && !GetMonData(&party[gBattleCommunication[0]], MON_DATA_STATUS))
                break;
        }
        if (gBattleCommunication[0] < PARTY_SIZE)
        {
            gBattleTextBuff1[0] = B_BUFF_PLACEHOLDER_BEGIN;
            gBattleTextBuff1[1] = B_BUFF_MON_NICK_WITH_PREFIX;
            gBattleTextBuff1[2] = gBattlerAttacker;
            gBattleTextBuff1[3] = gBattleCommunication[0];
            gBattleTextBuff1[4] = B_BUFF_EOS;
            gBattlescriptCurrInstr += 9;

            gBattleMoveDamage = gBaseStats[GetMonData(&party[gBattleCommunication[0]], MON_DATA_SPECIES)].baseAttack;
            gBattleMoveDamage *= gBattleMoves[gCurrentMove].power;
            gBattleMoveDamage *= (GetMonData(&party[gBattleCommunication[0]], MON_DATA_LEVEL) * 2 / 5 + 2);
            gBattleMoveDamage /= gBaseStats[gBattleMons[gBattlerTarget].species].baseDefense;
            gBattleMoveDamage = (gBattleMoveDamage / 50) + 2;
            if (gProtectStructs[gBattlerAttacker].helpingHand)
                gBattleMoveDamage = gBattleMoveDamage * 15 / 10;
            ++gBattleCommunication[0];
        }
        else if (beforeLoop != 0)
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        else
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 5);
    }
}

static void atkC5_setsemiinvulnerablebit(void)
{
    switch (gCurrentMove)
    {
    case MOVE_FLY:
    case MOVE_BOUNCE:
        gStatuses3[gBattlerAttacker] |= STATUS3_ON_AIR;
        break;
    case MOVE_DIG:
        gStatuses3[gBattlerAttacker] |= STATUS3_UNDERGROUND;
        break;
    case MOVE_DIVE:
        gStatuses3[gBattlerAttacker] |= STATUS3_UNDERWATER;
        break;
    }
    gBattlescriptCurrInstr++;
}

static void atkC6_clearsemiinvulnerablebit(void)
{
    switch (gCurrentMove)
    {
    case MOVE_FLY:
    case MOVE_BOUNCE:
        gStatuses3[gBattlerAttacker] &= ~STATUS3_ON_AIR;
        break;
    case MOVE_DIG:
        gStatuses3[gBattlerAttacker] &= ~STATUS3_UNDERGROUND;
        break;
    case MOVE_DIVE:
        gStatuses3[gBattlerAttacker] &= ~STATUS3_UNDERWATER;
        break;
    }
    gBattlescriptCurrInstr++;
}

static void atkC7_setminimize(void)
{
    if (gHitMarker & HITMARKER_OBEYS)
        gStatuses3[gBattlerAttacker] |= STATUS3_MINIMIZED;
    gBattlescriptCurrInstr++;
}

static void atkC8_sethail(void)
{
    if (gBattleWeather & B_WEATHER_HAIL_TEMPORARY)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
    }
    else
    {
        gBattleWeather = B_WEATHER_HAIL_TEMPORARY;
        gBattleCommunication[MULTISTRING_CHOOSER] = 5;
        gWishFutureKnock.weatherDuration = 5;
    }
    gBattlescriptCurrInstr++;
}

static void atkC9_jumpifattackandspecialattackcannotfall(void) //memento
{
    if (gBattleMons[gBattlerTarget].statStages[STAT_STAGE_ATK] == 0
        && gBattleMons[gBattlerTarget].statStages[STAT_STAGE_SPATK] == 0
        && gBattleCommunication[6] != 1)
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
    {
        gActiveBattler = gBattlerAttacker;
        gBattleMoveDamage = gBattleMons[gActiveBattler].hp;
        BtlController_EmitHealthBarUpdate(0, 0x7FFF);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 5;
    }
}

static void atkCA_setforcedtarget(void) //follow me
{
    gSideTimers[GetBattlerSide(gBattlerAttacker)].followmeTimer = 1;
    gSideTimers[GetBattlerSide(gBattlerAttacker)].followmeTarget = gBattlerAttacker;
    gBattlescriptCurrInstr++;
}

static void atkCB_setcharge(void)
{
    gStatuses3[gBattlerAttacker] |= STATUS3_CHARGED_UP;
    gDisableStructs[gBattlerAttacker].chargeTimer1 = 2;
    gDisableStructs[gBattlerAttacker].chargeTimer2 = 2;
    gBattlescriptCurrInstr++;
}

static void atkCC_callterrainattack(void) //nature power
{
    gHitMarker &= ~(HITMARKER_ATTACKSTRING_PRINTED);
    gCurrentMove = sNaturePowerMoves[gBattleTerrain];
    gBattlerTarget = GetMoveTarget(gCurrentMove, 0);
    BattleScriptPush(gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect]);
    gBattlescriptCurrInstr++;
}

static void atkCD_cureifburnedparalysedorpoisoned(void) //refresh
{
    if (gBattleMons[gBattlerAttacker].status1 & (STATUS1_POISON | STATUS1_BURN | STATUS1_PARALYSIS | STATUS1_TOXIC_POISON))
    {
        gBattleMons[gBattlerAttacker].status1 = 0;
        gBattlescriptCurrInstr += 5;
        gActiveBattler = gBattlerAttacker;
        BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBattler].status1);
        MarkBattlerForControllerExec(gActiveBattler);
    }
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkCE_settorment(void)
{
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_TORMENT)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
    {
        gBattleMons[gBattlerTarget].status2 |= STATUS2_TORMENT;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkCF_jumpifnodamage(void)
{
    if (gProtectStructs[gBattlerAttacker].physicalDmg || gProtectStructs[gBattlerAttacker].specialDmg)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkD0_settaunt(void)
{
    if (gDisableStructs[gBattlerTarget].tauntTimer1 == 0)
    {
        gDisableStructs[gBattlerTarget].tauntTimer1 = 2;
        gDisableStructs[gBattlerTarget].tauntTimer2 = 2;
        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkD1_trysethelpinghand(void)
{
    gBattlerTarget = GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) ^ 2);
    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && !(gAbsentBattlerFlags & gBitTable[gBattlerTarget])
        && !gProtectStructs[gBattlerAttacker].helpingHand && !gProtectStructs[gBattlerTarget].helpingHand)
    {
        gProtectStructs[gBattlerTarget].helpingHand = 1;
        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkD2_tryswapitems(void)
{
    // opponent can't swap items with player in regular battles
    if ((GetBattlerSide(gBattlerAttacker) == B_SIDE_OPPONENT
         && !(gBattleTypeFlags & (BATTLE_TYPE_LINK
                                  | BATTLE_TYPE_EREADER_TRAINER
                                  | BATTLE_TYPE_BATTLE_TOWER))
         && gTrainerBattleOpponent != SECRET_BASE_OPPONENT)) {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else {
        u8 sideAttacker = GetBattlerSide(gBattlerAttacker);

        // you can't swap items if they were knocked off in regular battles
        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK
                                  | BATTLE_TYPE_EREADER_TRAINER
                                  | BATTLE_TYPE_BATTLE_TOWER))
            && gTrainerBattleOpponent != SECRET_BASE_OPPONENT
            && (gWishFutureKnock.knockedOffPokes[sideAttacker] & gBitTable[gBattlerPartyIndexes[gBattlerAttacker]]
            )) {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
            // can't swap if two pokemon don't have an item
            // or if either of them is an enigma berry or a mail
        else if ((gBattleMons[gBattlerAttacker].item == 0 && gBattleMons[gBattlerTarget].item == 0)
                 || gBattleMons[gBattlerAttacker].item == ITEM_ENIGMA_BERRY
                 || gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY
                 || IS_ITEM_MAIL(gBattleMons[gBattlerAttacker].item)
                 || IS_ITEM_MAIL(gBattleMons[gBattlerTarget].item)) {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
            // check if ability prevents swapping
        else if (gBattleMons[gBattlerTarget].ability == ABILITY_STICKY_HOLD) {
            gBattlescriptCurrInstr = BattleScript_NoItemSteal;
            gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
            RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
        }
            // took a while, but all checks passed and items can be safely swapped
        else {
            u16 oldItemAtk, *newItemAtk;

            newItemAtk = (u16 *)(gBattleStruct->changedItems + gBattlerAttacker);
            oldItemAtk = gBattleMons[gBattlerAttacker].item;
            *newItemAtk = gBattleMons[gBattlerTarget].item;

            gBattleMons[gBattlerAttacker].item = 0;
            gBattleMons[gBattlerTarget].item = oldItemAtk;

            gActiveBattler = gBattlerAttacker;
            BtlController_EmitSetMonData(0, REQUEST_HELDITEM_BATTLE, 0, 2, newItemAtk);
            MarkBattlerForControllerExec(gBattlerAttacker);

            gActiveBattler = gBattlerTarget;
            BtlController_EmitSetMonData(0, REQUEST_HELDITEM_BATTLE, 0, 2, &gBattleMons[gBattlerTarget].item);
            MarkBattlerForControllerExec(gBattlerTarget);

            gSharedMem[BSTRUCT_OFF(choicedMove) + 2 * gBattlerTarget   + 0] = 0;
            gSharedMem[BSTRUCT_OFF(choicedMove) + 2 * gBattlerTarget   + 1] = 0;
            gSharedMem[BSTRUCT_OFF(choicedMove) + 2 * gBattlerAttacker + 0] = 0;
            gSharedMem[BSTRUCT_OFF(choicedMove) + 2 * gBattlerAttacker + 1] = 0;

            gBattlescriptCurrInstr += 5;

            PREPARE_ITEM_BUFFER(gBattleTextBuff1, *newItemAtk)
            PREPARE_ITEM_BUFFER(gBattleTextBuff2, oldItemAtk)

            if (oldItemAtk != 0 && *newItemAtk != 0)
                gBattleCommunication[MULTISTRING_CHOOSER] = 2; // attacker's item -> <- target's item
            else if (oldItemAtk == 0 && *newItemAtk != 0)
                gBattleCommunication[MULTISTRING_CHOOSER] = 0; // nothing -> <- target's item
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = 1; // attacker's item -> <- nothing
        }
    }
}

static void atkD3_trycopyability(void) //role play
{
    if (gBattleMons[gBattlerTarget].ability != 0 && gBattleMons[gBattlerTarget].ability != ABILITY_WONDER_GUARD)
    {
        gBattleMons[gBattlerAttacker].ability = gBattleMons[gBattlerTarget].ability;
        gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkD4_trywish(void)
{
    switch (T2_READ_8(gBattlescriptCurrInstr + 1))
    {
    case 0: //use wish
        if (gWishFutureKnock.wishCounter[gBattlerAttacker] == 0)
        {
            gWishFutureKnock.wishCounter[gBattlerAttacker] = 2;
            gWishFutureKnock.wishMonId[gBattlerAttacker] = gBattlerPartyIndexes[gBattlerAttacker];
            gBattlescriptCurrInstr += 6;
        }
        else
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
        break;
    case 1: //heal effect
        gBattleTextBuff1[0] = B_BUFF_PLACEHOLDER_BEGIN;
        gBattleTextBuff1[1] = 4;
        gBattleTextBuff1[2] = gBattlerTarget;
        gBattleTextBuff1[3] = gWishFutureKnock.wishMonId[gBattlerTarget];
        gBattleTextBuff1[4] = 0xFF;
        gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP / 2;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;
        if (gBattleMons[gBattlerTarget].hp == gBattleMons[gBattlerTarget].maxHP)
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
        else
            gBattlescriptCurrInstr += 6;
        break;
    }
}

static void atkD5_trysetroots(void) //ingrain
{
    if (gStatuses3[gBattlerAttacker] & STATUS3_ROOTED)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
    {
        gStatuses3[gBattlerAttacker] |= STATUS3_ROOTED;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkD6_doubledamagedealtifdamaged(void)
{
    if ((gProtectStructs[gBattlerAttacker].physicalDmg && gProtectStructs[gBattlerAttacker].physicalBattlerId == gBattlerTarget)
        || (gProtectStructs[gBattlerAttacker].specialDmg && gProtectStructs[gBattlerAttacker].specialBattlerId == gBattlerTarget))
            gBattleStruct->dmgMultiplier = 2;
    gBattlescriptCurrInstr++;
}

static void atkD7_setyawn(void)
{
    if (gStatuses3[gBattlerTarget] & STATUS3_YAWN || (u8) gBattleMons[gBattlerTarget].status1)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
    {
        gStatuses3[gBattlerTarget] |= STATUS3_YAWN_TURN(2);
        gBattlescriptCurrInstr += 5;
    }
}

static void atkD8_setdamagetohealthdifference(void)
{
    if (gBattleMons[gBattlerTarget].hp <= gBattleMons[gBattlerAttacker].hp)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gBattleMoveDamage = gBattleMons[gBattlerTarget].hp - gBattleMons[gBattlerAttacker].hp;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkD9_scaledamagebyhealthratio(void)
{
    if (gDynamicBasePower == 0)
    {
        u8 power = gBattleMoves[gCurrentMove].power;
        gDynamicBasePower = gBattleMons[gBattlerAttacker].hp * power / gBattleMons[gBattlerAttacker].maxHP;
        if (gDynamicBasePower == 0)
            gDynamicBasePower = 1;
    }
    gBattlescriptCurrInstr++;
}

static void atkDA_tryswapabilities(void)
{
    if ((gBattleMons[gBattlerAttacker].ability == 0 && gBattleMons[gBattlerTarget].ability == 0)
     || gBattleMons[gBattlerAttacker].ability == ABILITY_WONDER_GUARD || gBattleMons[gBattlerTarget].ability == ABILITY_WONDER_GUARD
     || gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
    {
        u8 atk_ability = gBattleMons[gBattlerAttacker].ability;
        gBattleMons[gBattlerAttacker].ability = gBattleMons[gBattlerTarget].ability;
        gBattleMons[gBattlerTarget].ability = atk_ability;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkDB_tryimprison(void)
{
    u8 r8 = 0;
    if ((gStatuses3[gBattlerAttacker] & STATUS3_IMPRISONED_OTHERS))
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        u8 bank;
        PressurePPLoseOnUsingImprision(gBattlerAttacker);
        for (bank = 0; bank < gBattlersCount; bank++)
        {
            if (r8 != GetBattlerSide(bank))
            {
                int j;
                for (j = 0; j < 4; j++)
                {
                    int k;
                    for (k = 0; k < 4; k++)
                    {
                        if (gBattleMons[gBattlerAttacker].moves[j] == gBattleMons[bank].moves[k] && gBattleMons[gBattlerAttacker].moves[j])
                            break;
                    }
                    if (k != 4)
                        break;
                }
                if (j != 4)
                {
                    gStatuses3[gBattlerAttacker] |= STATUS3_IMPRISONED_OTHERS;
                    gBattlescriptCurrInstr += 5;
                    break;
                }
            }
        }
        if (bank == gBattlersCount)
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void atkDC_trysetgrudge(void)
{
    if (gStatuses3[gBattlerAttacker] & STATUS3_GRUDGE)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
    {
        gStatuses3[gBattlerAttacker] |= STATUS3_GRUDGE;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkDD_weightdamagecalculation(void)
{
    int i;
    for (i = 0; sWeightToDamageTable[i] != 0xFFFF; i += 2)
    {
        if (sWeightToDamageTable[i] > GetPokedexHeightWeight(SpeciesToNationalPokedexNum(gBattleMons[gBattlerTarget].species), 1))
            break;
    }
    if (sWeightToDamageTable[i] != 0xFFFF)
        gDynamicBasePower = sWeightToDamageTable[i + 1];
    else
        gDynamicBasePower = 120;
    gBattlescriptCurrInstr++;
}

static void atkDE_assistattackselect(void)
{
    s32 chooseableMovesNo = 0;
    struct Pokemon *party;
    s32 monId, moveId;
    u16 *movesArray = (u16 *)&gBattleStruct->assistMove;

    if (GET_BATTLER_SIDE(gBattlerAttacker) != B_SIDE_PLAYER)
        party = gEnemyParty;
    else
        party = gPlayerParty;
    for (monId = 0; monId < PARTY_SIZE; ++monId)
    {
        if (monId == gBattlerPartyIndexes[gBattlerAttacker]
         || GetMonData(&party[monId], MON_DATA_SPECIES2) == SPECIES_NONE
         || GetMonData(&party[monId], MON_DATA_SPECIES2) == SPECIES_EGG)
            continue;
        for (moveId = 0; moveId < MAX_MON_MOVES; ++moveId)
        {
            s32 i = 0;
            u16 move = GetMonData(&party[monId], MON_DATA_MOVE1 + moveId);

            if (IsMoveUnchoosable(move))
                continue;
            for (; sMovesForbiddenToCopy[i] != ASSIST_FORBIDDEN_END && move != sMovesForbiddenToCopy[i]; ++i);
            if (sMovesForbiddenToCopy[i] != ASSIST_FORBIDDEN_END || move == MOVE_NONE)
                continue;
            movesArray[chooseableMovesNo] = move;
            ++chooseableMovesNo;
        }
    }
    if (chooseableMovesNo)
    {
        gHitMarker &= ~(HITMARKER_ATTACKSTRING_PRINTED);
        gRandomMove = movesArray[((Random() & 0xFF) * chooseableMovesNo) >> 8];
        gBattlerTarget = GetMoveTarget(gRandomMove, 0);
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void atkDF_trysetmagiccoat(void)
{
    gBattlerTarget = gBattlerAttacker;
    gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = 1;
    if (gCurrentTurnActionNumber == gBattlersCount - 1) //last turn
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
    {
        gProtectStructs[gBattlerAttacker].bounceMove = 1;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkE0_trysetsnatch(void)
{
    gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = 1;
    if (gCurrentTurnActionNumber == gBattlersCount - 1) //last turn
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
    {
        gProtectStructs[gBattlerAttacker].stealMove = 1;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkE1_trygetintimidatetarget(void)
{
    u8 side;

    gBattleStruct->scriptingActive = gBattleStruct->intimidateBank;
    side = GetBattlerSide(gBattleStruct->scriptingActive);
    gBattleTextBuff1[0] = 0xFD;
    gBattleTextBuff1[1] = 9;
    gBattleTextBuff1[2] = gBattleMons[gBattleStruct->scriptingActive].ability;
    gBattleTextBuff1[3] = 0xFF;

    for (;gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (GetBattlerSide(gBattlerTarget) == side)
            continue;
        if (!(gAbsentBattlerFlags & gBitTable[gBattlerTarget]))
            break;
    }

    if (gBattlerTarget >= gBattlersCount)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
        gBattlescriptCurrInstr += 5;
}

static void atkE2_switchoutabilities(void)
{
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    switch (gBattleMons[gActiveBattler].ability)
    {
    case ABILITY_NATURAL_CURE:
        gBattleMons[gActiveBattler].status1 = 0;
        BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, gBitTable[gSharedMem[BSTRUCT_OFF(unk16064) + gActiveBattler]], 4, &gBattleMons[gActiveBattler].status1);
        MarkBattlerForControllerExec(gActiveBattler);
        break;
    }
    gBattlescriptCurrInstr += 2;
}

static void atkE3_jumpifhasnohp(void)
{
    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    if (gBattleMons[gActiveBattler].hp == 0)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
    else
        gBattlescriptCurrInstr += 6;
}

static void atkE4_getsecretpowereffect(void)
{
    switch (gBattleTerrain)
    {
    case BATTLE_TERRAIN_GRASS:
        gBattleCommunication[MOVE_EFFECT_BYTE] = 2;
        break;
    case BATTLE_TERRAIN_LONG_GRASS:
        gBattleCommunication[MOVE_EFFECT_BYTE] = 1;
        break;
    case BATTLE_TERRAIN_SAND:
        gBattleCommunication[MOVE_EFFECT_BYTE] = 27;
        break;
    case BATTLE_TERRAIN_UNDERWATER:
        gBattleCommunication[MOVE_EFFECT_BYTE] = 23;
        break;
    case BATTLE_TERRAIN_WATER:
        gBattleCommunication[MOVE_EFFECT_BYTE] = 22;
        break;
    case BATTLE_TERRAIN_POND:
        gBattleCommunication[MOVE_EFFECT_BYTE] = 24;
        break;
    case BATTLE_TERRAIN_MOUNTAIN:
        gBattleCommunication[MOVE_EFFECT_BYTE] = 7;
        break;
    case BATTLE_TERRAIN_CAVE:
        gBattleCommunication[MOVE_EFFECT_BYTE] = 8;
        break;
    default:
        gBattleCommunication[MOVE_EFFECT_BYTE] = 5;
        break;
    }
    gBattlescriptCurrInstr++;
}

static void atkE5_pickup(void)
{
    int i;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        u16 species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
        u16 held_item = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
        u8 ability;
        if (GetMonData(&gPlayerParty[i], MON_DATA_ALT_ABILITY))
            ability = gBaseStats[species].ability2;
        else
            ability = gBaseStats[species].ability1;

        if (ability == ABILITY_PICKUP && species != 0 && species != SPECIES_EGG && held_item == 0 && (Random() % 10) == 0)
        {
            s32 chance = Random() % 100;
            s32 j;
            for (j = 0; j < 18; j += 2)
            {
                if (sPickupItems[j + 1] > chance)
                    break;
            }
            SetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM, (const void*) &sPickupItems[j]);
        }
    }
    gBattlescriptCurrInstr++;
}

static void atkE6_docastformchangeanimation(void)
{
    gActiveBattler = gBattleStruct->scriptingActive;
    if (gBattleMons[gActiveBattler].status2 & STATUS2_SUBSTITUTE)
        gBattleStruct->castformToChangeInto |= 0x80;
    BtlController_EmitBattleAnimation(0, B_ANIM_CASTFORM_CHANGE, gBattleStruct->castformToChangeInto);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr++;
}

static void atkE7_trycastformdatachange(void)
{
    u8 form;
    gBattlescriptCurrInstr++;
    form = CastformDataTypeChange(gBattleStruct->scriptingActive);
    if (form)
    {
        BattleScriptPushCursorAndCallback(BattleScript_CastformChange);
        gBattleStruct->castformToChangeInto = form - 1;
    }
}

static void atkE8_settypebasedhalvers(void) //water/mud sport
{
    bool8 worked = FALSE;
    if (gBattleMoves[gCurrentMove].effect == EFFECT_MUD_SPORT)
    {
        if (!(gStatuses3[gBattlerAttacker] & STATUS3_MUDSPORT))
        {
            gStatuses3[gBattlerAttacker] |= STATUS3_MUDSPORT;
            gBattleCommunication[MULTISTRING_CHOOSER] = 0;
            worked = TRUE;
        }
    }
    else //water sport
    {
        if (!(gStatuses3[gBattlerAttacker] & STATUS3_WATERSPORT))
        {
            gStatuses3[gBattlerAttacker] |= STATUS3_WATERSPORT;
            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
            worked = TRUE;
        }
    }
    if (worked)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkE9_setweatherballtype(void)
{
    if (WEATHER_HAS_EFFECT)
    {
        if ((u8)(gBattleWeather))
            gBattleStruct->dmgMultiplier = 2;
        if (gBattleWeather & B_WEATHER_RAIN)
            gBattleStruct->dynamicMoveType = TYPE_WATER | 0x80;
        else if (gBattleWeather & B_WEATHER_SANDSTORM)
            gBattleStruct->dynamicMoveType = TYPE_ROCK | 0x80;
        else if (gBattleWeather & B_WEATHER_SUN)
            gBattleStruct->dynamicMoveType = TYPE_FIRE | 0x80;
        else if (gBattleWeather & B_WEATHER_HAIL_TEMPORARY)
            gBattleStruct->dynamicMoveType = TYPE_ICE | 0x80;
        else
            gBattleStruct->dynamicMoveType = TYPE_NORMAL | 0x80;
    }
    gBattlescriptCurrInstr++;
}

static void atkEA_tryrecycleitem(void)
{
    u16* used_item;
    gActiveBattler = gBattlerAttacker;
    used_item = ((u16 *)&gSharedMem[BSTRUCT_OFF(usedHeldItems) + gActiveBattler * 2]);
    if (*used_item && gBattleMons[gActiveBattler].item == 0)
    {
        gLastUsedItem = *used_item;
        *used_item = 0;
        gBattleMons[gActiveBattler].item = gLastUsedItem;
        BtlController_EmitSetMonData(0, REQUEST_HELDITEM_BATTLE, 0, 2, &gBattleMons[gActiveBattler].item);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkEB_settypetoterrain(void)
{
    if (gBattleMons[gBattlerAttacker].type1 != sTerrainToType[gBattleTerrain] && gBattleMons[gBattlerAttacker].type2 != sTerrainToType[gBattleTerrain])
    {
        gBattleMons[gBattlerAttacker].type1 = sTerrainToType[gBattleTerrain];
        gBattleMons[gBattlerAttacker].type2 = sTerrainToType[gBattleTerrain];
        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 3;
        gBattleTextBuff1[2] = sTerrainToType[gBattleTerrain];
        gBattleTextBuff1[3] = 0xFF;
        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkEC_pursuitrelated(void)
{
    gActiveBattler = GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) ^ 2);
    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && !(gAbsentBattlerFlags & gBitTable[gActiveBattler]) && gActionForBanks[gActiveBattler] == 0 && gChosenMovesByBanks[gActiveBattler] == MOVE_PURSUIT)
    {
        gActionsByTurnOrder[gActiveBattler] = 11;
        gCurrentMove = MOVE_PURSUIT;
        gBattlescriptCurrInstr += 5;
        gBattleStruct->animTurn = 1;
        gBattleStruct->unk160A7 = gBattlerAttacker;
        gBattlerAttacker = gActiveBattler;
    }
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void atkEF_snatchsetbattlers(void)
{
    gEffectBattler = gBattlerAttacker;
    if (gBattlerAttacker == gBattlerTarget)
        gBattlerAttacker = gBattlerTarget = gBattleStruct->scriptingActive;
    else
        gBattlerTarget = gBattleStruct->scriptingActive;
    gBattleStruct->scriptingActive = gEffectBattler;
    gBattlescriptCurrInstr++;
}

static void atkEE_removelightscreenreflect(void) //brick break
{
    u8 side = GetBattlerSide(gBattlerAttacker) ^ 1;
    if (gSideTimers[side].reflectTimer || gSideTimers[side].lightscreenTimer)
    {
        gSideStatuses[side] &= ~(SIDE_STATUS_REFLECT);
        gSideStatuses[side] &= ~(SIDE_STATUS_LIGHTSCREEN);
        gSideTimers[side].reflectTimer = 0;
        gSideTimers[side].lightscreenTimer = 0;
        gBattleStruct->animTurn = 1;
        gBattleStruct->animTargetsHit = 1;
    }
    else
    {
        gBattleStruct->animTurn = 0;
        gBattleStruct->animTargetsHit = 0;
    }
    gBattlescriptCurrInstr++;
}

void atkEF_handleballthrow(void)
{
    u8 ball_multiplier = 0;
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = gBattlerAttacker;
    gBattlerTarget = gBattlerAttacker ^ 1;
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
    {
        BtlController_EmitBallThrowAnim(0, 5);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr = BattleScript_TrainerBallBlock;
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL)
    {
        BtlController_EmitBallThrowAnim(0, 4);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr = BattleScript_WallyBallThrow;
    }
    else
    {
        u32 odds;
        u8 catch_rate;
        if (gLastUsedItem == ITEM_SAFARI_BALL)
            catch_rate = gBattleStruct->safariCatchFactor * 1275 / 100; //correct the name to safariFleeRate
        else
            catch_rate = gBaseStats[gBattleMons[gBattlerTarget].species].catchRate;
        if (gLastUsedItem > 5)
        {
            switch (gLastUsedItem)
            {
            case ITEM_NET_BALL:
                if (gBattleMons[gBattlerTarget].type1 == TYPE_WATER || gBattleMons[gBattlerTarget].type2 == TYPE_WATER || gBattleMons[gBattlerTarget].type1 == TYPE_BUG || gBattleMons[gBattlerTarget].type2 == TYPE_BUG)
                    ball_multiplier = 30;
                else
                    ball_multiplier = 10;
                break;
            case ITEM_DIVE_BALL:
                if (Overworld_GetMapTypeOfSaveblockLocation() == 5)
                    ball_multiplier = 35;
                else
                    ball_multiplier = 10;
                break;
            case ITEM_NEST_BALL:
                if (gBattleMons[gBattlerTarget].level <= 39)
                {
                    ball_multiplier = 40 - gBattleMons[gBattlerTarget].level;
                    if (ball_multiplier <= 9)
                        ball_multiplier = 10;
                }
                else
                    ball_multiplier = 10;
                break;
            case ITEM_REPEAT_BALL:
                if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gBattlerTarget].species), 1))
                    ball_multiplier = 30;
                else
                    ball_multiplier = 10;
                break;
            case ITEM_TIMER_BALL:
                ball_multiplier = gBattleResults.battleTurnCounter + 10;
                if (ball_multiplier > 40)
                    ball_multiplier = 40;
                break;
            case ITEM_LUXURY_BALL:
            case ITEM_PREMIER_BALL:
                ball_multiplier = 10;
                break;
            }
        }
        else
            ball_multiplier = sBallCatchBonuses[gLastUsedItem - 2];

        odds = (catch_rate * ball_multiplier / 10) * (gBattleMons[gBattlerTarget].maxHP * 3 - gBattleMons[gBattlerTarget].hp * 2) / (3 * gBattleMons[gBattlerTarget].maxHP);
        if (gBattleMons[gBattlerTarget].status1 & (STATUS1_SLEEP | STATUS1_FREEZE))
            odds *= 2;
        if (gBattleMons[gBattlerTarget].status1 & (STATUS1_POISON | STATUS1_BURN | STATUS1_PARALYSIS /*| STATUS1_TOXIC_POISON */)) //nice one gf
            odds = (odds * 15) / 10;

        if (gLastUsedItem != ITEM_SAFARI_BALL)
        {
            if (gLastUsedItem == ITEM_MASTER_BALL)
            {
                gBattleResults.usedMasterBall = 1;
            }
            else
            {
                if (gBattleResults.usedBalls[gLastUsedItem - ITEM_ULTRA_BALL] < 0xFF)
                    gBattleResults.usedBalls[gLastUsedItem - ITEM_ULTRA_BALL]++;
            }
        }
        if (odds > 254) //poke caught
        {
            BtlController_EmitBallThrowAnim(0, 4);
            MarkBattlerForControllerExec(gActiveBattler);
            gBattlescriptCurrInstr = BattleScript_SuccessBallThrow;
            SetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerTarget]], MON_DATA_POKEBALL, (const void*) &gLastUsedItem);
            if (CalculatePlayerPartyCount() == 6)
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = 1;
        }
        else //poke may be caught, calculate shakes
        {
            u8 shakes;
            odds = Sqrt(Sqrt(16711680 / odds));
            odds = 1048560 / odds;
            for (shakes = 0; shakes < 4 && Random() < odds; shakes++) {}
            if (gLastUsedItem == ITEM_MASTER_BALL)
                shakes = 4; //why calculate the shakes before that check?
            BtlController_EmitBallThrowAnim(0, shakes);
            MarkBattlerForControllerExec(gActiveBattler);
            if (shakes == 4) //poke caught, copy of the code above
            {
                gBattlescriptCurrInstr = BattleScript_SuccessBallThrow;
                SetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerTarget]], MON_DATA_POKEBALL, (const void*) &gLastUsedItem);
                if (CalculatePlayerPartyCount() == 6)
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                else
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
            }
            else //rip
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = shakes;
                gBattlescriptCurrInstr = BattleScript_ShakeBallThrow;
            }
        }
    }
}

static void atkF0_givecaughtmon(void)
{
    GiveMonToPlayer(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ 1]]);
    gBattleResults.caughtPoke = gBattleMons[gBattlerAttacker ^ 1].species;
    GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ 1]], MON_DATA_NICKNAME, gBattleResults.caughtNick);
    gBattlescriptCurrInstr++;
}

static void atkF1_trysetcaughtmondexflags(void)
{
    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gBattlerTarget].species), 1))
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
    {
        GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gBattlerTarget].species), 3);
        if (gBattleMons[gBattlerTarget].species == SPECIES_UNOWN)
            gSaveBlock2.pokedex.unownPersonality = gBattleMons[gBattlerTarget].personality;
        if (gBattleMons[gBattlerTarget].species == SPECIES_SPINDA) //else if
            gSaveBlock2.pokedex.spindaPersonality = gBattleMons[gBattlerTarget].personality;
        gBattlescriptCurrInstr += 5;
    }
}

extern const u32 gBattleTerrainTiles_Building[];
extern const u32 gBattleTerrainTilemap_Building[];
extern const u32 gBattleTerrainPalette_BattleTower[];

static void atkF2_displaydexinfo(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gBattleCommunication[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            gBattleCommunication[1] = sub_809070C(SpeciesToNationalPokedexNum(gBattleMons[gBattlerTarget].species), gBattleMons[gBattlerTarget].otId, gBattleMons[gBattlerTarget].personality);
            gBattleCommunication[0]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active && gMain.callback2 == BattleMainCB2 && !gTasks[gBattleCommunication[1]].isActive)
        {
            LZDecompressVram(gBattleTerrainTiles_Building, (void*)(VRAM + 0x8000));
            LZDecompressVram(gBattleTerrainTilemap_Building, (void*)(VRAM + 0xD000));
            LoadCompressedPalette(gBattleTerrainPalette_BattleTower, 0x20, 0x60);
            REG_BG3CNT = 0x5a0b;
            gBattle_BG3_X = 0x100;
            BeginNormalPaletteFade(0xFFFC, 0, 16, 0, RGB(0, 0, 0));
            gBattleCommunication[0]++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
            gBattlescriptCurrInstr++;
        break;
    }
}

void sub_802BBD4(u8 r0, u8 r1, u8 r2, u8 r3, u8 sp0)
{
    int i;
    int j;
    int tile;

    for (i = r1; i <= r3; i++)
    {
        for (j = r0; j <= r2; j++)
        {
            u16 * dest = ((u16 *)(BG_VRAM + (24 * 0x800) + (0x2 * j) + (0x40 * i)));
            if (i == r1)
            {
                if (j == r0)
                    tile = 0x1022;
                else if (j == r2)
                    tile = 0x1024;
                else
                    tile = 0x1023;
            }
            else if (i == r3)
            {
                if (j == r0)
                    tile = 0x1028;
                else if (j == r2)
                    tile = 0x102A;
                else
                    tile = 0x1029;
            }
            else
            {
                if (j == r0)
                    tile = 0x1025;
                else if (j == r2)
                    tile = 0x1027;
                else
                    tile = 0x1026;
            }
            if (sp0)
                tile = 0;
            *dest = tile;
        }
    }
}

void sub_802BC6C(void)
{
    MenuCursor_SetPos814A880(0xC8, ((gBattleCommunication[1] << 28) + 1207959552) >> 24); //what could that be?
}

void nullsub_6(void)
{
    return;
}

static void atkF3_trygivecaughtmonnick(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        sub_8023A80();
        gBattleCommunication[0]++;
        gBattleCommunication[1] = 0;
        sub_802BC6C();
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            if (gBattleCommunication[1] == 0)
            {
                gBattleCommunication[0]++;
                BeginFastPaletteFade(3);
            }
            else
                gBattleCommunication[0] = 4;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gBattleCommunication[0] = 4;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ 1]], MON_DATA_NICKNAME, gBattleStruct->caughtNick);
            DoNamingScreen(2, gBattleStruct->caughtNick, GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ 1]], MON_DATA_SPECIES), GetMonGender(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ 1]]), GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ 1]], MON_DATA_PERSONALITY, 0), BattleMainCB2);
            gBattleCommunication[0]++;
        }
        break;
    case 3:
        if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active )
        {
            SetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ 1]], MON_DATA_NICKNAME, gBattleStruct->caughtNick);
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
        break;
    case 4:
        if (CalculatePlayerPartyCount() == 6)
            gBattlescriptCurrInstr += 5;
        else
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        break;
    }
}

static void atkF4_subattackerhpbydmg(void)
{
    gBattleMons[gBattlerAttacker].hp -= gBattleMoveDamage;
    gBattlescriptCurrInstr++;
}

static void atkF5_removeattackerstatus1(void)
{
    gBattleMons[gBattlerAttacker].status1 = 0;
    gBattlescriptCurrInstr++;
}

static void atkF6_finishaction(void)
{
    gCurrentActionFuncId = 0xC;
}

static void atkF7_finishturn(void)
{
    gCurrentActionFuncId = 0xC;
    gCurrentTurnActionNumber = gBattlersCount;
}
