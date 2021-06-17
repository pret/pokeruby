#include "global.h"
#include "battle.h"
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
extern struct Window gUnknown_03004210;
extern const u8 BattleText_YesNo[];
extern u8 gPlayerPartyCount;
extern u16 gMoveToLearn; //move to learn
extern const u8 gTrainerMoney[];
extern u16 gRandomMove;
extern u8* gBattleScriptsForMoveEffects[];
extern u16 gChosenMove; //last used move in battle
extern u8 gBankInMenu;
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

#define HP_ON_SWITCHOUT (((u16*)(ewram_addr + 0x160BC)))

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
    if (!gBattleMons[gBattlerAttacker].pp[gCurrMovePos] && gCurrentMove != MOVE_STRUGGLE && !(gHitMarker & (HITMARKER_x800000 | HITMARKER_NO_ATTACKSTRING))
     && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
    {
        gBattlescriptCurrInstr = BattleScript_NoPPForMove;
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        return;
    }

    gHitMarker &= ~(HITMARKER_x800000);

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

    if ((WEATHER_HAS_EFFECT && (gBattleWeather & WEATHER_RAIN_ANY) && gBattleMoves[move].effect == EFFECT_THUNDER)
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
        if (WEATHER_HAS_EFFECT && gBattleWeather & WEATHER_SUN_ANY && gBattleMoves[move].effect == EFFECT_THUNDER)
            moveAcc = 50;

        calc = gAccuracyStageRatios[buff].dividend * moveAcc;
        calc /= gAccuracyStageRatios[buff].divisor;

        if (gBattleMons[gBattlerAttacker].ability == ABILITY_COMPOUND_EYES)
            calc = (calc * 130) / 100; // 1.3 compound eyes boost
        if (WEATHER_HAS_EFFECT && gBattleMons[gBattlerTarget].ability == ABILITY_SAND_VEIL && gBattleWeather & WEATHER_SANDSTORM_ANY)
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
                if (gHitMarker & HITMARKER_x20)
                {
                    gHitMarker &= ~(HITMARKER_x20);
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

                if (!gSpecialStatuses[gActiveBattler].dmg && !(gHitMarker & HITMARKER_x100000))
                    gSpecialStatuses[gActiveBattler].dmg = gHpDealt;

                if (IS_TYPE_PHYSICAL(moveType) && !(gHitMarker & HITMARKER_x100000) && gCurrentMove != MOVE_PAIN_SPLIT)
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
                else if (!IS_TYPE_PHYSICAL(moveType) && !(gHitMarker & HITMARKER_x100000))
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
            gHitMarker &= ~(HITMARKER_x100000);
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

//TODO Someone please decompile this monstrosity below...
#ifdef NONMATCHING
void SetMoveEffect(bool8 primary, u8 certainArg)
{
    #define EffectAffectsUser 0x40
    register u8 certain asm("r5") = certainArg;
    register bool32 StatusChanged asm("r10") = 0;
	register int AffectsUser asm("r6") = 0; //0x40 otherwise
    bool32 NoSunCanFreeze = 1;

    if (gBattleCommunication[MOVE_EFFECT_BYTE] & EffectAffectsUser)
    {
        gEffectBattler = gBattlerAttacker; //bank that effects get applied on
        gBattleCommunication[MOVE_EFFECT_BYTE] &= ~(EffectAffectsUser);
        AffectsUser = EffectAffectsUser;
        gBattleStruct->scriptingActive = gBattlerTarget; //theoretically the attacker
    }
    else
    {
        gEffectBattler = gBattlerTarget;
        gBattleStruct->scriptingActive = gBattlerAttacker;
    }

    if (gBattleMons[gEffectBattler].ability == ABILITY_SHIELD_DUST && !(gHitMarker & HITMARKER_IGNORE_SAFEGUARD) &&
        !primary && gBattleCommunication[MOVE_EFFECT_BYTE] <= 9)
        {gBattlescriptCurrInstr++; return;}

    if (gSideStatuses[GetBattlerPosition(gEffectBattler) & 1] & SIDE_STATUS_SAFEGUARD && !(gHitMarker & HITMARKER_IGNORE_SAFEGUARD) &&
        !primary && gBattleCommunication[MOVE_EFFECT_BYTE] <= 7)
        {gBattlescriptCurrInstr++; return;}

    //make sure at least ONE HP except payday and thief
    if (gBattleMons[gEffectBattler].hp == 0 && gBattleCommunication[MOVE_EFFECT_BYTE] != 0xB && gBattleCommunication[MOVE_EFFECT_BYTE] != 0x1F)
        {gBattlescriptCurrInstr++; return;}

    if (gBattleMons[gEffectBattler].status2 & STATUS2_SUBSTITUTE && AffectsUser != EffectAffectsUser)
        {gBattlescriptCurrInstr++; return;}

    if (gBattleCommunication[MOVE_EFFECT_BYTE] <= 6) //status change
    {
        switch (sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]])
        {
        case STATUS1_SLEEP:
            //check active uproar
            if (gBattleMons[gEffectBattler].ability != ABILITY_SOUNDPROOF)
            {
                for (gActiveBattler = 0; gActiveBattler < gBattlersCount && !(gBattleMons[gActiveBattler].status2 & STATUS2_UPROAR); gActiveBattler++) {}
            }
            else
                gActiveBattler = gBattlersCount;
            if (gBattleMons[gEffectBattler].status1) {break;}
            if (gActiveBattler != gBattlersCount) {break;} //nice way of checking uproar...
            if (gBattleMons[gEffectBattler].ability == ABILITY_VITAL_SPIRIT) {break;}
            if (gBattleMons[gEffectBattler].ability == ABILITY_INSOMNIA) {break;}

            CancelMultiTurnMoves(gEffectBattler);
            StatusChanged = 1;
            break;
        case STATUS1_POISON:
            if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY && (primary == 1 || certain == 0x80))
            {
                gLastUsedAbility = ABILITY_IMMUNITY;
                RecordAbilityBattle(gEffectBattler, ABILITY_IMMUNITY);
                BattleScriptPush(gBattlescriptCurrInstr + 1);
            //_0801E664:
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;
                if (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    gHitMarker &= ~(HITMARKER_IGNORE_SAFEGUARD);
                    return;
                }
                else
                    {gBattleCommunication[MULTISTRING_CHOOSER] = 0; return;}
            }
            if ((gBattleMons[gEffectBattler].type1 == TYPE_POISON || gBattleMons[gEffectBattler].type2 == TYPE_POISON || gBattleMons[gEffectBattler].type1 == TYPE_STEEL || gBattleMons[gEffectBattler].type2 == TYPE_STEEL)
                && !(gHitMarker & HITMARKER_IGNORE_SAFEGUARD) && (primary == 1 || certain == 0x80))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;
                gBattleCommunication[MULTISTRING_CHOOSER] = 2;
                return;
            }
            if (gBattleMons[gEffectBattler].type1 == TYPE_POISON) {break;}
            if (gBattleMons[gEffectBattler].type2 == TYPE_POISON) {break;}
            if (gBattleMons[gEffectBattler].type1 == TYPE_STEEL) {break;}
            if (gBattleMons[gEffectBattler].type2 == TYPE_STEEL) {break;}
            if (gBattleMons[gEffectBattler].status1) {break;}
            if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY) {break;}

            StatusChanged = 1;
            break;
        case STATUS1_BURN:
            if (gBattleMons[gEffectBattler].ability == ABILITY_WATER_VEIL && (primary == 1 || certain == 0x80))
            {
                gLastUsedAbility = ABILITY_WATER_VEIL;
                RecordAbilityBattle(gEffectBattler, ABILITY_WATER_VEIL);
                BattleScriptPush(gBattlescriptCurrInstr + 1);
            //_0801E664:
                gBattlescriptCurrInstr = BattleScript_BRNPrevention;
                if (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    gHitMarker &= ~(HITMARKER_IGNORE_SAFEGUARD);
                    return;
                }
                else
                    {gBattleCommunication[MULTISTRING_CHOOSER] = 0; return;}
            }
            if ((gBattleMons[gEffectBattler].type1 == TYPE_FIRE || gBattleMons[gEffectBattler].type2 == TYPE_FIRE)
                && !(gHitMarker & HITMARKER_IGNORE_SAFEGUARD) && (primary == 1 || certain == 0x80))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_BRNPrevention;
                gBattleCommunication[MULTISTRING_CHOOSER] = 2;
                return;
            }
            if (gBattleMons[gEffectBattler].type1 == TYPE_FIRE) {break;}
            if (gBattleMons[gEffectBattler].type2 == TYPE_FIRE) {break;}
            if (gBattleMons[gEffectBattler].ability == ABILITY_WATER_VEIL) {break;}
            if (gBattleMons[gEffectBattler].status1 == 0) {break;}
            StatusChanged = 1;
            break;
        case STATUS1_FREEZE:
            if (WEATHER_HAS_EFFECT && gBattleWeather & WEATHER_SUN_ANY) {NoSunCanFreeze = 0;}
            if (gBattleMons[gEffectBattler].type1 == TYPE_ICE) {break;}
            if (gBattleMons[gEffectBattler].type2 == TYPE_ICE) {break;}
            if (gBattleMons[gEffectBattler].status1) {break;}
            if (NoSunCanFreeze == 0) {break;}
            if (gBattleMons[gEffectBattler].ability == ABILITY_MAGMA_ARMOR) {break;}

            CancelMultiTurnMoves(gEffectBattler);
            StatusChanged = 1;
            break;
        case STATUS1_PARALYSIS:
            if (gBattleMons[gEffectBattler].ability == ABILITY_LIMBER)
            {
                if ((primary == 1 || certain == 0x80))
                {
                    gLastUsedAbility = ABILITY_LIMBER;
                    RecordAbilityBattle(gEffectBattler, ABILITY_LIMBER);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                //_0801E664:
                    gBattlescriptCurrInstr = BattleScript_PRLZPrevention;
                    if (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                        gHitMarker &= ~(HITMARKER_IGNORE_SAFEGUARD);
                        return;
                    }
                    else
                        {gBattleCommunication[MULTISTRING_CHOOSER] = 0; return;}
                }
                else {break;}
            }
            if (gBattleMons[gEffectBattler].status1) {break;}
            StatusChanged = 1;
            break;
        case STATUS1_TOXIC_POISON:
            if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY && (primary == 1 || certain == 0x80))
            {
                gLastUsedAbility = ABILITY_IMMUNITY;
                RecordAbilityBattle(gEffectBattler, ABILITY_IMMUNITY);
                BattleScriptPush(gBattlescriptCurrInstr + 1);
            //_0801E664:
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;
                if (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    gHitMarker &= ~(HITMARKER_IGNORE_SAFEGUARD);
                    return;
                }
                else
                    {gBattleCommunication[MULTISTRING_CHOOSER] = 0; return;}
            }
            if ((gBattleMons[gEffectBattler].type1 == TYPE_POISON || gBattleMons[gEffectBattler].type2 == TYPE_POISON || gBattleMons[gEffectBattler].type1 == TYPE_STEEL || gBattleMons[gEffectBattler].type2 == TYPE_STEEL)
                && !(gHitMarker & HITMARKER_IGNORE_SAFEGUARD) && (primary == 1 || certain == 0x80))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;
                gBattleCommunication[MULTISTRING_CHOOSER] = 2;
                return;
            }
            if (gBattleMons[gEffectBattler].status1) {break;}
            if (gBattleMons[gEffectBattler].type1 != TYPE_POISON &&
                gBattleMons[gEffectBattler].type2 != TYPE_POISON &&
                gBattleMons[gEffectBattler].type1 != TYPE_STEEL &&
                gBattleMons[gEffectBattler].type2 != TYPE_STEEL)
            {
                if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY) {break;}
                gBattleMons[gEffectBattler].status1 &= ~(0x9); //This gets (correctly) optimized out...
                StatusChanged = 1;
                break;
            }
            else
                gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
            break;
        }
        if (StatusChanged == 1)
        {
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            if (sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]] == STATUS1_SLEEP)
                gBattleMons[gEffectBattler].status1 |= ((Random() & 3) + 2);
            else
                gBattleMons[gEffectBattler].status1 |= sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]];
            gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
            gActiveBattler = gEffectBattler;
            BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gEffectBattler].status1);
            MarkBattlerForControllerExec(gActiveBattler);
            if (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                gHitMarker &= ~(HITMARKER_IGNORE_SAFEGUARD);
            }
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
            if (gBattleCommunication[MOVE_EFFECT_BYTE] == 2 || gBattleCommunication[MOVE_EFFECT_BYTE] == 6 || gBattleCommunication[MOVE_EFFECT_BYTE] == 5 || gBattleCommunication[MOVE_EFFECT_BYTE] == 3)
            {
                gBattleStruct->synchroniseEffect = gBattleCommunication[MOVE_EFFECT_BYTE];
                gHitMarker |= HITMARKER_SYNCHRONISE_EFFECT;
            }
            return;
        }
        else if (StatusChanged == 0)
            {gBattlescriptCurrInstr++; return;}
    }
    else
    {
        if (gBattleMons[gEffectBattler].status2 & sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]])
        {
            gBattlescriptCurrInstr++;
            return;
        }
        switch (sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]])
        {
        case 7: //confusion
            if (gBattleMons[gEffectBattler].ability == ABILITY_OWN_TEMPO)
                {gBattlescriptCurrInstr++; return;}
            if (gBattleMons[gEffectBattler].status2 & STATUS2_CONFUSION)
                {gBattlescriptCurrInstr++; return;}
            gBattleMons[gEffectBattler].status2 |= (((Random()) % 0x4)) + 2;
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
            break;
        case 8: //flinch
            if (gBattleMons[gEffectBattler].ability == ABILITY_INNER_FOCUS)
            {
                if (primary == 1 || certain == 0x80)
                {
                    gLastUsedAbility = ABILITY_INNER_FOCUS;
                    RecordAbilityBattle(gEffectBattler, ABILITY_INNER_FOCUS);
                    gBattlescriptCurrInstr = BattleScript_FlinchPrevention;
                    return;
                }
                else
                    {gBattlescriptCurrInstr++; return;}
            }
            else
            {
                if (GetBattlerTurnOrderNum(gEffectBattler) > gCurrentTurnActionNumber)
                    gBattleMons[gEffectBattler].status2 |= sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]];
                gBattlescriptCurrInstr++; return;
            }
            break;
        case 10: //uproar
            if (gBattleMons[gEffectBattler].status2 & STATUS2_UPROAR)
                {gBattlescriptCurrInstr++; return;}
            gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
            gLockedMoves[gEffectBattler] = gCurrentMove;
            gBattleMons[gEffectBattler].status2 |= ((Random() & 3) + 2) << 4;
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
            break;
        case 11: //pay day
            if (!(GetBattlerPosition(gBattlerAttacker) & 1))
            {
                u16 PayDay = gPaydayMoney;
                gPaydayMoney += (gBattleMons[gBattlerAttacker].level * 5);
                if (PayDay > gPaydayMoney)
                    gPaydayMoney = 0xFFFF;
            }
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
            break;
        case 9: //tri attack
            if (gBattleMons[gEffectBattler].status1)
                {gBattlescriptCurrInstr++; return;}
            gBattleCommunication[MOVE_EFFECT_BYTE] = Random() % 3 + 3;
            SetMoveEffect(0, 0);
            break;
        case 12: //charging move
            gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
            gLockedMoves[gEffectBattler] = gCurrentMove;
            gProtectStructs[gEffectBattler].chargingTurn = 1;
            gBattlescriptCurrInstr++;
            break;
        case 13: //wrap
            if (gBattleMons[gEffectBattler].status2 & STATUS2_WRAPPED)
                {gBattlescriptCurrInstr++; return;}
            gBattleMons[gEffectBattler].status2 |= ((Random() & 3) + 2) << 0xD;
            gBattleStruct->wrappedMove[gEffectBattler*2] = (u8)gCurrentMove;
            (1 + gBattleStruct->wrappedMove)[gEffectBattler*2] = gCurrentMove >> 8; //don't ask.
            gBattleStruct->wrappedBy[gEffectBattler] = gBattlerAttacker;
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
            gBattleCommunication[MULTISTRING_CHOOSER] = 0;
            while (gBattleCommunication[MULTISTRING_CHOOSER] <= 4
             && gCurrentMove != gTrappingMoves[gBattleCommunication[MULTISTRING_CHOOSER]])
                gBattleCommunication[MULTISTRING_CHOOSER]++;
            break;
        case 14: //25% recoil
            gBattleMoveDamage = (gHpDealt) / 4;
            if (gBattleMoveDamage == 0)
                gBattleMoveDamage = 1;
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
            break;
        case 15 ... 21: //stat + 1
            if (ChangeStatBuffs(0x10, gBattleCommunication[MOVE_EFFECT_BYTE] + 0xF2, certain, 0)) {gBattlescriptCurrInstr++;}
            else
            {
                gBattleStruct->animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & 0x3F; //TODO: the arg ptr is wrong by one
                gBattleStruct->animArg2 = 0;
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_StatUp;
            }
            break;
        case 22 ... 28: //stat - 1
            if (ChangeStatBuffs(~(0x6f), gBattleCommunication[MOVE_EFFECT_BYTE] + 0xEB, certain, 0)) {gBattlescriptCurrInstr++;} //TODO: negation doesnt work correctly
            else
            {
                gBattleStruct->animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & 0x3F;
                gBattleStruct->animArg2 = 0;
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_StatDown;
            }
            break;
        case 39 ... 45: //stat + 2
            if (ChangeStatBuffs(0x20, gBattleCommunication[MOVE_EFFECT_BYTE] + 0xDA, certain, 0)) {gBattlescriptCurrInstr++;}
            else
            {
                gBattleStruct->animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & 0x3F;
                gBattleStruct->animArg2 = 0;
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_StatUp;
            }
            break;
        case 46 ... 52: //stat - 2
            if (ChangeStatBuffs(~(0x5f), gBattleCommunication[MOVE_EFFECT_BYTE] + 0xD3, certain, 0)) {gBattlescriptCurrInstr++;}
            else
            {
                gBattleStruct->animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & 0x3F;
                gBattleStruct->animArg2 = 0;
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_StatDown;
            }
            break;
        case 29: //recharge
            gBattleMons[gEffectBattler].status2 |= STATUS2_RECHARGE;
            gDisableStructs[gEffectBattler].rechargeCounter = 2;
            gLockedMoves[gEffectBattler] = gCurrentMove;
            gBattlescriptCurrInstr++;
            break;
        case 30: //rage
            gBattleMons[gBattlerAttacker].status2 |= STATUS2_RAGE;
            gBattlescriptCurrInstr++;
            break;
        case 31: //item steal
            {
                u8 side = GetBattlerSide(gBattlerAttacker);
                if (GetBattlerSide(gBattlerAttacker) == 1 && !(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)) && gTrainerBattleOpponent != 0x400)
                        {gBattlescriptCurrInstr++; return;}
                if (!(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)) && gTrainerBattleOpponent != 0x400 && (gWishFutureKnock.knockedOffPokes[side] & gBitTable[gBattlerPartyIndexes[gBattlerAttacker]]))
                        {gBattlescriptCurrInstr++; return;}
                if (gBattleMons[gBattlerTarget].item && gBattleMons[gBattlerTarget].ability == ABILITY_STICKY_HOLD)
                {
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_NoItemSteal;
                    gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
                    RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
                    return;
                }
                if (gBattleMons[gBattlerAttacker].item)
                    {gBattlescriptCurrInstr++; return;}
                if (gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY)
                    {gBattlescriptCurrInstr++; return;}
                if (gBattleMons[gBattlerTarget].item == 0)
                    {gBattlescriptCurrInstr++; return;}

				gLastUsedItem = gBattleMons[gBattlerTarget].item;
                *USED_HELD_ITEM(gBattlerTarget) = gLastUsedItem;
                gBattleMons[gBattlerTarget].item = 0;

                gActiveBattler = gBattlerAttacker;
                BtlController_EmitSetMonData(0, REQUEST_HELDITEM_BATTLE, 0, 2, &gLastUsedItem);
                MarkBattlerForControllerExec(gBattlerAttacker);

                gActiveBattler = gBattlerTarget;
                BtlController_EmitSetMonData(0, REQUEST_HELDITEM_BATTLE, 0, 2, &gBattleMons[gBattlerTarget].item);
                MarkBattlerForControllerExec(gBattlerTarget);

                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_ItemSteal;

				*CHOICED_MOVE(gBattlerTarget) = 0;
            }
            break;
        case 32: //escape prevention
            gBattleMons[gBattlerTarget].status2 |= STATUS2_RECHARGE;
            gDisableStructs[gBattlerTarget].bankPreventingEscape = gBattlerAttacker;
            gBattlescriptCurrInstr++;
            break;
        case 33: //nightmare
            gBattleMons[gBattlerTarget].status2 |= STATUS2_NIGHTMARE;
            gBattlescriptCurrInstr++;
            break;
        case 34: //ancientpower
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = BattleScript_AllStatsUp;
            return;
        case 35: //break free rapidspin
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = BattleScript_RapidSpinAway;
            return;
        case 36: //paralysis removal
            if (gBattleMons[gBattlerTarget].status1 & STATUS1_PARALYSIS)
            {
                gBattleMons[gBattlerTarget].status1 &= ~(STATUS1_PARALYSIS);
                gActiveBattler = gBattlerTarget;
                BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gBattlerTarget].status1);
                MarkBattlerForControllerExec(gActiveBattler);
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_TargetPRLZHeal;
            }
            else
                {gBattlescriptCurrInstr++; return;}
            break;
        case 37: //superpower
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = BattleScript_AtkDefDown;
            return;
        case 38: //33% recoil
            gBattleMoveDamage = gHpDealt / 3;
            if (gBattleMoveDamage == 0)
                gBattleMoveDamage = 1;
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = gMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
            break;
        case 53: //thrash
            if (!(gBattleMons[gEffectBattler].status2 & STATUS2_LOCK_CONFUSE))
            {
                gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
                gLockedMoves[gEffectBattler] = gCurrentMove;
                gBattleMons[gEffectBattler].status2 |= (((Random() & 1) + 2) << 0xA);
            }
            else
                {gBattlescriptCurrInstr++; return;}
            break;
        case 54: //knock off
            if (gBattleMons[gEffectBattler].ability == ABILITY_STICKY_HOLD)
            {
                if (gBattleMons[gEffectBattler].item == 0)
                    {gBattlescriptCurrInstr++; return;}
                gLastUsedAbility = ABILITY_STICKY_HOLD;
                gBattlescriptCurrInstr = BattleScript_NoItemSteal;
                RecordAbilityBattle(gEffectBattler, ABILITY_STICKY_HOLD);
                return;
            }
            if (gBattleMons[gEffectBattler].item == 0)
                    {gBattlescriptCurrInstr++; return;}
            else
            {
                u8 side = GetBattlerSide(gEffectBattler);
                gLastUsedItem = gBattleMons[gEffectBattler].item;
                gBattleMons[gEffectBattler].item = 0;
                gWishFutureKnock.knockedOffPokes[side] |= gBitTable[gBattlerPartyIndexes[gEffectBattler]];
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_KnockedOff;

                *CHOICED_MOVE(gEffectBattler) = 0;
            }
            break;
        case 59: //overheat
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = BattleScript_SAtkDown2;
            return;
        }
    }
}
#else
NAKED
void SetMoveEffect(bool8 primary, u8 certainArg)
{
    asm(".syntax unified\n\
            push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x8\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    lsls r1, 24\n\
    lsrs r5, r1, 24\n\
    movs r0, 0\n\
    mov r10, r0\n\
    movs r6, 0\n\
    movs r1, 0x1\n\
    str r1, [sp, 0x4]\n\
    ldr r1, _0801E430 @ =gBattleCommunication\n\
    ldrb r3, [r1, 0x3]\n\
    movs r0, 0x40\n\
    ands r0, r3\n\
    adds r7, r1, 0\n\
    cmp r0, 0\n\
    beq _0801E444\n\
    ldr r2, _0801E434 @ =gEffectBattler\n\
    ldr r0, _0801E438 @ =gBattlerAttacker\n\
    ldrb r0, [r0]\n\
    strb r0, [r2]\n\
    movs r0, 0xBF\n\
    ands r0, r3\n\
    strb r0, [r7, 0x3]\n\
    movs r6, 0x40\n\
    ldr r0, _0801E43C @ =gSharedMem\n\
    ldr r1, _0801E440 @ =gBattlerTarget\n\
    b _0801E450\n\
    .align 2, 0\n\
_0801E430: .4byte gBattleCommunication\n\
_0801E434: .4byte gEffectBattler\n\
_0801E438: .4byte gBattlerAttacker\n\
_0801E43C: .4byte gSharedMem\n\
_0801E440: .4byte gBattlerTarget\n\
_0801E444:\n\
    ldr r2, _0801E538 @ =gEffectBattler\n\
    ldr r0, _0801E53C @ =gBattlerTarget\n\
    ldrb r0, [r0]\n\
    strb r0, [r2]\n\
    ldr r0, _0801E540 @ =gSharedMem\n\
    ldr r1, _0801E544 @ =gBattlerAttacker\n\
_0801E450:\n\
    ldrb r1, [r1]\n\
    ldr r3, _0801E548 @ =0x00016003\n\
    adds r0, r3\n\
    strb r1, [r0]\n\
    mov r8, r2\n\
    ldr r2, _0801E54C @ =gBattleMons\n\
    mov r0, r8\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r2\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x13\n\
    bne _0801E48A\n\
    ldr r0, _0801E550 @ =gHitMarker\n\
    ldr r0, [r0]\n\
    movs r1, 0x80\n\
    lsls r1, 6\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0801E48A\n\
    cmp r4, 0\n\
    bne _0801E48A\n\
    ldrb r0, [r7, 0x3]\n\
    cmp r0, 0x9\n\
    bhi _0801E48A\n\
    bl _0801F5DC\n\
_0801E48A:\n\
    mov r1, r8\n\
    ldrb r0, [r1]\n\
    bl GetBattlerPosition\n\
    ldr r2, _0801E554 @ =gSideStatuses\n\
    movs r1, 0x1\n\
    ands r1, r0\n\
    lsls r1, 1\n\
    adds r1, r2\n\
    ldrh r1, [r1]\n\
    movs r0, 0x20\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801E4C4\n\
    ldr r0, _0801E550 @ =gHitMarker\n\
    ldr r0, [r0]\n\
    movs r1, 0x80\n\
    lsls r1, 6\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0801E4C4\n\
    cmp r4, 0\n\
    bne _0801E4C4\n\
    ldr r0, _0801E558 @ =gBattleCommunication\n\
    ldrb r0, [r0, 0x3]\n\
    cmp r0, 0x7\n\
    bhi _0801E4C4\n\
    bl _0801F5DC\n\
_0801E4C4:\n\
    ldr r3, _0801E54C @ =gBattleMons\n\
    ldr r2, _0801E538 @ =gEffectBattler\n\
    ldrb r1, [r2]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r3\n\
    ldrh r0, [r0, 0x28]\n\
    mov r8, r2\n\
    mov r9, r3\n\
    cmp r0, 0\n\
    bne _0801E4EA\n\
    ldr r0, _0801E558 @ =gBattleCommunication\n\
    ldrb r0, [r0, 0x3]\n\
    cmp r0, 0xB\n\
    beq _0801E4EA\n\
    cmp r0, 0x1F\n\
    beq _0801E4EA\n\
    bl _0801F5DC\n\
_0801E4EA:\n\
    mov r2, r8\n\
    ldrb r1, [r2]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    mov r1, r9\n\
    adds r1, 0x50\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    movs r1, 0x80\n\
    lsls r1, 17\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801E50C\n\
    cmp r6, 0x40\n\
    beq _0801E50C\n\
    bl _0801F5DC\n\
_0801E50C:\n\
    ldr r0, _0801E558 @ =gBattleCommunication\n\
    ldrb r1, [r0, 0x3]\n\
    adds r7, r0, 0\n\
    cmp r1, 0x6\n\
    bls _0801E518\n\
    b _0801EB4A\n\
_0801E518:\n\
    ldr r1, _0801E55C @ =sStatusFlagsForMoveEffects\n\
    ldrb r0, [r7, 0x3]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    cmp r0, 0x10\n\
    bne _0801E528\n\
    b _0801E714\n\
_0801E528:\n\
    cmp r0, 0x10\n\
    bhi _0801E560\n\
    cmp r0, 0x7\n\
    beq _0801E57A\n\
    cmp r0, 0x8\n\
    bne _0801E536\n\
    b _0801E630\n\
_0801E536:\n\
    b _0801EA14\n\
    .align 2, 0\n\
_0801E538: .4byte gEffectBattler\n\
_0801E53C: .4byte gBattlerTarget\n\
_0801E540: .4byte gSharedMem\n\
_0801E544: .4byte gBattlerAttacker\n\
_0801E548: .4byte 0x00016003\n\
_0801E54C: .4byte gBattleMons\n\
_0801E550: .4byte gHitMarker\n\
_0801E554: .4byte gSideStatuses\n\
_0801E558: .4byte gBattleCommunication\n\
_0801E55C: .4byte sStatusFlagsForMoveEffects\n\
_0801E560:\n\
    cmp r0, 0x40\n\
    bne _0801E566\n\
    b _0801E888\n\
_0801E566:\n\
    cmp r0, 0x40\n\
    bhi _0801E572\n\
    cmp r0, 0x20\n\
    bne _0801E570\n\
    b _0801E7EA\n\
_0801E570:\n\
    b _0801EA14\n\
_0801E572:\n\
    cmp r0, 0x80\n\
    bne _0801E578\n\
    b _0801E8E4\n\
_0801E578:\n\
    b _0801EA14\n\
_0801E57A:\n\
    mov r3, r8\n\
    ldrb r1, [r3]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    add r0, r9\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x2B\n\
    beq _0801E5DC\n\
    ldr r0, _0801E5D4 @ =gActiveBattler\n\
    movs r1, 0\n\
    strb r1, [r0]\n\
    ldr r1, _0801E5D8 @ =gBattlersCount\n\
    ldrb r3, [r1]\n\
    adds r7, r0, 0\n\
    mov r12, r1\n\
    cmp r3, 0\n\
    beq _0801E5E8\n\
    mov r4, r9\n\
    ldr r0, [r4, 0x50]\n\
    movs r1, 0x70\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0801E5E8\n\
    adds r1, r7, 0\n\
    mov r6, r9\n\
    adds r6, 0x50\n\
    movs r5, 0x58\n\
    movs r4, 0x70\n\
_0801E5B4:\n\
    ldrb r0, [r1]\n\
    adds r0, 0x1\n\
    strb r0, [r1]\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, r3\n\
    bcs _0801E5E8\n\
    ldrb r0, [r7]\n\
    muls r0, r5\n\
    adds r0, r6\n\
    ldr r0, [r0]\n\
    ands r0, r4\n\
    cmp r0, 0\n\
    beq _0801E5B4\n\
    b _0801E5E8\n\
    .align 2, 0\n\
_0801E5D4: .4byte gActiveBattler\n\
_0801E5D8: .4byte gBattlersCount\n\
_0801E5DC:\n\
    ldr r0, _0801E628 @ =gActiveBattler\n\
    ldr r2, _0801E62C @ =gBattlersCount\n\
    ldrb r1, [r2]\n\
    strb r1, [r0]\n\
    adds r7, r0, 0\n\
    mov r12, r2\n\
_0801E5E8:\n\
    mov r0, r8\n\
    ldrb r2, [r0]\n\
    movs r0, 0x58\n\
    adds r1, r2, 0\n\
    muls r1, r0\n\
    mov r0, r9\n\
    adds r0, 0x4C\n\
    adds r0, r1, r0\n\
    ldr r0, [r0]\n\
    cmp r0, 0\n\
    beq _0801E600\n\
    b _0801EA14\n\
_0801E600:\n\
    ldrb r0, [r7]\n\
    mov r3, r12\n\
    ldrb r3, [r3]\n\
    cmp r0, r3\n\
    beq _0801E60C\n\
    b _0801EA14\n\
_0801E60C:\n\
    mov r4, r9\n\
    adds r0, r1, r4\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x48\n\
    bne _0801E61A\n\
    b _0801EA14\n\
_0801E61A:\n\
    cmp r0, 0xF\n\
    bne _0801E620\n\
    b _0801EA14\n\
_0801E620:\n\
    adds r0, r2, 0\n\
    bl CancelMultiTurnMoves\n\
    b _0801EA04\n\
    .align 2, 0\n\
_0801E628: .4byte gActiveBattler\n\
_0801E62C: .4byte gBattlersCount\n\
_0801E630:\n\
    mov r2, r8\n\
    ldrb r1, [r2]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    add r0, r9\n\
    adds r0, 0x20\n\
    ldrb r1, [r0]\n\
    cmp r1, 0x11\n\
    bne _0801E688\n\
    cmp r4, 0x1\n\
    beq _0801E64A\n\
    cmp r5, 0x80\n\
    bne _0801E688\n\
_0801E64A:\n\
    ldr r0, _0801E678 @ =gLastUsedAbility\n\
    strb r1, [r0]\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    movs r1, 0x11\n\
    bl RecordAbilityBattle\n\
    ldr r4, _0801E67C @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801E680 @ =BattleScript_PSNPrevention\n\
_0801E664:\n\
    str r0, [r4]\n\
    ldr r2, _0801E684 @ =gHitMarker\n\
    ldr r1, [r2]\n\
    movs r0, 0x80\n\
    lsls r0, 6\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801E676\n\
    b _0801E928\n\
_0801E676:\n\
    b _0801E94C\n\
    .align 2, 0\n\
_0801E678: .4byte gLastUsedAbility\n\
_0801E67C: .4byte gBattlescriptCurrInstr\n\
_0801E680: .4byte BattleScript_PSNPrevention\n\
_0801E684: .4byte gHitMarker\n\
_0801E688:\n\
    mov r1, r8\n\
    ldrb r0, [r1]\n\
    movs r1, 0x58\n\
    muls r0, r1\n\
    add r0, r9\n\
    adds r1, r0, 0\n\
    adds r1, 0x21\n\
    ldrb r1, [r1]\n\
    cmp r1, 0x3\n\
    beq _0801E6AC\n\
    adds r0, 0x22\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x3\n\
    beq _0801E6AC\n\
    cmp r1, 0x8\n\
    beq _0801E6AC\n\
    cmp r0, 0x8\n\
    bne _0801E6C6\n\
_0801E6AC:\n\
    ldr r0, _0801E710 @ =gHitMarker\n\
    ldr r0, [r0]\n\
    movs r1, 0x80\n\
    lsls r1, 6\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801E6C6\n\
    cmp r4, 0x1\n\
    bne _0801E6C0\n\
    b _0801E98C\n\
_0801E6C0:\n\
    cmp r5, 0x80\n\
    bne _0801E6C6\n\
    b _0801E98C\n\
_0801E6C6:\n\
    mov r2, r8\n\
    ldrb r1, [r2]\n\
    movs r0, 0x58\n\
    muls r1, r0\n\
    mov r4, r9\n\
    adds r3, r1, r4\n\
    adds r0, r3, 0\n\
    adds r0, 0x21\n\
    ldrb r4, [r0]\n\
    cmp r4, 0x3\n\
    bne _0801E6DE\n\
    b _0801EA14\n\
_0801E6DE:\n\
    adds r0, 0x1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x3\n\
    bne _0801E6E8\n\
    b _0801EA14\n\
_0801E6E8:\n\
    cmp r4, 0x8\n\
    bne _0801E6EE\n\
    b _0801EA14\n\
_0801E6EE:\n\
    cmp r0, 0x8\n\
    bne _0801E6F4\n\
    b _0801EA14\n\
_0801E6F4:\n\
    mov r0, r9\n\
    adds r0, 0x4C\n\
    adds r0, r1, r0\n\
    ldr r0, [r0]\n\
    cmp r0, 0\n\
    beq _0801E702\n\
    b _0801EA14\n\
_0801E702:\n\
    adds r0, r3, 0\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x11\n\
    bne _0801E70E\n\
    b _0801EA14\n\
_0801E70E:\n\
    b _0801EA04\n\
    .align 2, 0\n\
_0801E710: .4byte gHitMarker\n\
_0801E714:\n\
    mov r2, r8\n\
    ldrb r1, [r2]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    add r0, r9\n\
    adds r0, 0x20\n\
    ldrb r1, [r0]\n\
    cmp r1, 0x29\n\
    bne _0801E758\n\
    cmp r4, 0x1\n\
    beq _0801E72E\n\
    cmp r5, 0x80\n\
    bne _0801E758\n\
_0801E72E:\n\
    ldr r0, _0801E74C @ =gLastUsedAbility\n\
    strb r1, [r0]\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    movs r1, 0x29\n\
    bl RecordAbilityBattle\n\
    ldr r4, _0801E750 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801E754 @ =BattleScript_BRNPrevention\n\
    b _0801E664\n\
    .align 2, 0\n\
_0801E74C: .4byte gLastUsedAbility\n\
_0801E750: .4byte gBattlescriptCurrInstr\n\
_0801E754: .4byte BattleScript_BRNPrevention\n\
_0801E758:\n\
    mov r0, r8\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    mov r2, r9\n\
    adds r1, r0, r2\n\
    adds r0, r1, 0\n\
    adds r0, 0x21\n\
    ldrb r0, [r0]\n\
    cmp r0, 0xA\n\
    beq _0801E778\n\
    adds r0, r1, 0\n\
    adds r0, 0x22\n\
    ldrb r0, [r0]\n\
    cmp r0, 0xA\n\
    bne _0801E7A8\n\
_0801E778:\n\
    ldr r0, _0801E79C @ =gHitMarker\n\
    ldr r0, [r0]\n\
    movs r1, 0x80\n\
    lsls r1, 6\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801E7A8\n\
    cmp r4, 0x1\n\
    beq _0801E78E\n\
    cmp r5, 0x80\n\
    bne _0801E7A8\n\
_0801E78E:\n\
    ldr r4, _0801E7A0 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801E7A4 @ =BattleScript_BRNPrevention\n\
    b _0801E998\n\
    .align 2, 0\n\
_0801E79C: .4byte gHitMarker\n\
_0801E7A0: .4byte gBattlescriptCurrInstr\n\
_0801E7A4: .4byte BattleScript_BRNPrevention\n\
_0801E7A8:\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    movs r1, 0x58\n\
    adds r2, r0, 0\n\
    muls r2, r1\n\
    mov r4, r9\n\
    adds r1, r2, r4\n\
    adds r0, r1, 0\n\
    adds r0, 0x21\n\
    ldrb r0, [r0]\n\
    cmp r0, 0xA\n\
    bne _0801E7C2\n\
    b _0801EA14\n\
_0801E7C2:\n\
    adds r0, r1, 0\n\
    adds r0, 0x22\n\
    ldrb r0, [r0]\n\
    cmp r0, 0xA\n\
    bne _0801E7CE\n\
    b _0801EA14\n\
_0801E7CE:\n\
    adds r0, r1, 0\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x29\n\
    bne _0801E7DA\n\
    b _0801EA14\n\
_0801E7DA:\n\
    mov r0, r9\n\
    adds r0, 0x4C\n\
    adds r0, r2, r0\n\
    ldr r0, [r0]\n\
    cmp r0, 0\n\
    beq _0801E7E8\n\
    b _0801EA14\n\
_0801E7E8:\n\
    b _0801EA04\n\
_0801E7EA:\n\
    movs r0, 0\n\
    str r0, [sp]\n\
    movs r0, 0x13\n\
    movs r1, 0\n\
    movs r2, 0xD\n\
    movs r3, 0\n\
    bl AbilityBattleEffects\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0\n\
    bne _0801E826\n\
    str r0, [sp]\n\
    movs r0, 0x13\n\
    movs r1, 0\n\
    movs r2, 0x4D\n\
    movs r3, 0\n\
    bl AbilityBattleEffects\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0801E826\n\
    ldr r0, _0801E87C @ =gBattleWeather\n\
    ldrh r1, [r0]\n\
    movs r0, 0x60\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801E826\n\
    movs r1, 0\n\
    str r1, [sp, 0x4]\n\
_0801E826:\n\
    ldr r4, _0801E880 @ =gBattleMons\n\
    ldr r0, _0801E884 @ =gEffectBattler\n\
    ldrb r3, [r0]\n\
    movs r0, 0x58\n\
    adds r2, r3, 0\n\
    muls r2, r0\n\
    adds r1, r2, r4\n\
    adds r0, r1, 0\n\
    adds r0, 0x21\n\
    ldrb r0, [r0]\n\
    cmp r0, 0xF\n\
    bne _0801E840\n\
    b _0801EA14\n\
_0801E840:\n\
    adds r0, r1, 0\n\
    adds r0, 0x22\n\
    ldrb r0, [r0]\n\
    cmp r0, 0xF\n\
    bne _0801E84C\n\
    b _0801EA14\n\
_0801E84C:\n\
    adds r0, r4, 0\n\
    adds r0, 0x4C\n\
    adds r0, r2, r0\n\
    ldr r0, [r0]\n\
    cmp r0, 0\n\
    beq _0801E85A\n\
    b _0801EA14\n\
_0801E85A:\n\
    ldr r2, [sp, 0x4]\n\
    cmp r2, 0\n\
    bne _0801E862\n\
    b _0801EA14\n\
_0801E862:\n\
    adds r0, r1, 0\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x28\n\
    bne _0801E86E\n\
    b _0801EA14\n\
_0801E86E:\n\
    adds r0, r3, 0\n\
    bl CancelMultiTurnMoves\n\
    movs r3, 0x1\n\
    mov r10, r3\n\
    b _0801EA14\n\
    .align 2, 0\n\
_0801E87C: .4byte gBattleWeather\n\
_0801E880: .4byte gBattleMons\n\
_0801E884: .4byte gEffectBattler\n\
_0801E888:\n\
    mov r0, r8\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r1, r0\n\
    mov r2, r9\n\
    adds r0, r1, r2\n\
    adds r0, 0x20\n\
    ldrb r2, [r0]\n\
    cmp r2, 0x7\n\
    bne _0801E8D0\n\
    cmp r4, 0x1\n\
    beq _0801E8A6\n\
    cmp r5, 0x80\n\
    beq _0801E8A6\n\
    b _0801EA14\n\
_0801E8A6:\n\
    ldr r0, _0801E8C4 @ =gLastUsedAbility\n\
    strb r2, [r0]\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    movs r1, 0x7\n\
    bl RecordAbilityBattle\n\
    ldr r4, _0801E8C8 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801E8CC @ =BattleScript_PRLZPrevention\n\
    b _0801E664\n\
    .align 2, 0\n\
_0801E8C4: .4byte gLastUsedAbility\n\
_0801E8C8: .4byte gBattlescriptCurrInstr\n\
_0801E8CC: .4byte BattleScript_PRLZPrevention\n\
_0801E8D0:\n\
    mov r0, r9\n\
    adds r0, 0x4C\n\
    adds r0, r1, r0\n\
    ldr r0, [r0]\n\
    cmp r0, 0\n\
    beq _0801E8DE\n\
    b _0801EA14\n\
_0801E8DE:\n\
    movs r4, 0x1\n\
    mov r10, r4\n\
    b _0801EA14\n\
_0801E8E4:\n\
    mov r0, r8\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    add r0, r9\n\
    adds r0, 0x20\n\
    ldrb r1, [r0]\n\
    cmp r1, 0x11\n\
    bne _0801E952\n\
    cmp r4, 0x1\n\
    beq _0801E8FE\n\
    cmp r5, 0x80\n\
    bne _0801E952\n\
_0801E8FE:\n\
    ldr r0, _0801E938 @ =gLastUsedAbility\n\
    strb r1, [r0]\n\
    mov r1, r8\n\
    ldrb r0, [r1]\n\
    movs r1, 0x11\n\
    bl RecordAbilityBattle\n\
    ldr r4, _0801E93C @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801E940 @ =BattleScript_PSNPrevention\n\
    str r0, [r4]\n\
    ldr r2, _0801E944 @ =gHitMarker\n\
    ldr r1, [r2]\n\
    movs r0, 0x80\n\
    lsls r0, 6\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801E94C\n\
_0801E928:\n\
    movs r0, 0x1\n\
    strb r0, [r7, 0x5]\n\
    ldr r0, _0801E948 @ =0xffffdfff\n\
    ands r1, r0\n\
    str r1, [r2]\n\
    bl _0801F5FA\n\
    .align 2, 0\n\
_0801E938: .4byte gLastUsedAbility\n\
_0801E93C: .4byte gBattlescriptCurrInstr\n\
_0801E940: .4byte BattleScript_PSNPrevention\n\
_0801E944: .4byte gHitMarker\n\
_0801E948: .4byte 0xffffdfff\n\
_0801E94C:\n\
    strb r0, [r7, 0x5]\n\
    bl _0801F5FA\n\
_0801E952:\n\
    mov r2, r8\n\
    ldrb r0, [r2]\n\
    movs r1, 0x58\n\
    muls r0, r1\n\
    add r0, r9\n\
    adds r1, r0, 0\n\
    adds r1, 0x21\n\
    ldrb r1, [r1]\n\
    cmp r1, 0x3\n\
    beq _0801E976\n\
    adds r0, 0x22\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x3\n\
    beq _0801E976\n\
    cmp r1, 0x8\n\
    beq _0801E976\n\
    cmp r0, 0x8\n\
    bne _0801E9B4\n\
_0801E976:\n\
    ldr r0, _0801E9A4 @ =gHitMarker\n\
    ldr r0, [r0]\n\
    movs r1, 0x80\n\
    lsls r1, 6\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801E9B4\n\
    cmp r4, 0x1\n\
    beq _0801E98C\n\
    cmp r5, 0x80\n\
    bne _0801E9B4\n\
_0801E98C:\n\
    ldr r4, _0801E9A8 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801E9AC @ =BattleScript_PSNPrevention\n\
_0801E998:\n\
    str r0, [r4]\n\
    ldr r1, _0801E9B0 @ =gBattleCommunication\n\
    movs r0, 0x2\n\
    strb r0, [r1, 0x5]\n\
    bl _0801F5FA\n\
    .align 2, 0\n\
_0801E9A4: .4byte gHitMarker\n\
_0801E9A8: .4byte gBattlescriptCurrInstr\n\
_0801E9AC: .4byte BattleScript_PSNPrevention\n\
_0801E9B0: .4byte gBattleCommunication\n\
_0801E9B4:\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    movs r6, 0x58\n\
    muls r0, r6\n\
    mov r2, r9\n\
    adds r2, 0x4C\n\
    adds r5, r0, r2\n\
    ldr r4, [r5]\n\
    cmp r4, 0\n\
    bne _0801EA14\n\
    mov r3, r9\n\
    adds r1, r0, r3\n\
    adds r0, r1, 0\n\
    adds r0, 0x21\n\
    ldrb r3, [r0]\n\
    cmp r3, 0x3\n\
    beq _0801EA0A\n\
    adds r0, 0x1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x3\n\
    beq _0801EA0A\n\
    cmp r3, 0x8\n\
    beq _0801EA0A\n\
    cmp r0, 0x8\n\
    beq _0801EA0A\n\
    adds r0, r1, 0\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x11\n\
    beq _0801EA14\n\
    mov r4, r8\n\
    ldrb r0, [r4]\n\
    adds r1, r0, 0\n\
    muls r1, r6\n\
    adds r1, r2\n\
    ldr r0, [r1]\n\
    movs r2, 0x9\n\
    negs r2, r2\n\
    ands r0, r2\n\
    str r0, [r1]\n\
_0801EA04:\n\
    movs r0, 0x1\n\
    mov r10, r0\n\
    b _0801EA14\n\
_0801EA0A:\n\
    ldr r0, _0801EA58 @ =gMoveResultFlags\n\
    ldrb r1, [r0]\n\
    movs r2, 0x8\n\
    orrs r1, r2\n\
    strb r1, [r0]\n\
_0801EA14:\n\
    mov r1, r10\n\
    cmp r1, 0x1\n\
    beq _0801EA1C\n\
    b _0801EB3C\n\
_0801EA1C:\n\
    ldr r0, _0801EA5C @ =gBattlescriptCurrInstr\n\
    ldr r0, [r0]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r1, _0801EA60 @ =sStatusFlagsForMoveEffects\n\
    ldr r0, _0801EA64 @ =gBattleCommunication\n\
    ldrb r0, [r0, 0x3]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r3, [r0]\n\
    cmp r3, 0x7\n\
    bne _0801EA70\n\
    bl Random\n\
    ldr r2, _0801EA68 @ =gBattleMons\n\
    ldr r1, _0801EA6C @ =gEffectBattler\n\
    ldrb r3, [r1]\n\
    movs r1, 0x58\n\
    muls r3, r1\n\
    adds r2, 0x4C\n\
    adds r3, r2\n\
    movs r1, 0x3\n\
    ands r1, r0\n\
    adds r1, 0x2\n\
    ldr r0, [r3]\n\
    orrs r0, r1\n\
    str r0, [r3]\n\
    b _0801EA84\n\
    .align 2, 0\n\
_0801EA58: .4byte gMoveResultFlags\n\
_0801EA5C: .4byte gBattlescriptCurrInstr\n\
_0801EA60: .4byte sStatusFlagsForMoveEffects\n\
_0801EA64: .4byte gBattleCommunication\n\
_0801EA68: .4byte gBattleMons\n\
_0801EA6C: .4byte gEffectBattler\n\
_0801EA70:\n\
    ldr r2, _0801EAD4 @ =gBattleMons\n\
    ldr r0, _0801EAD8 @ =gEffectBattler\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r1, r0\n\
    adds r2, 0x4C\n\
    adds r1, r2\n\
    ldr r0, [r1]\n\
    orrs r0, r3\n\
    str r0, [r1]\n\
_0801EA84:\n\
    ldr r2, _0801EADC @ =gBattlescriptCurrInstr\n\
    ldr r1, _0801EAE0 @ =gMoveEffectBS_Ptrs\n\
    ldr r5, _0801EAE4 @ =gBattleCommunication\n\
    ldrb r0, [r5, 0x3]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    str r0, [r2]\n\
    ldr r4, _0801EAE8 @ =gActiveBattler\n\
    ldr r1, _0801EAD8 @ =gEffectBattler\n\
    ldrb r0, [r1]\n\
    strb r0, [r4]\n\
    ldrb r1, [r1]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    ldr r1, _0801EAEC @ =gBattleMons+0x4C @ gBattleMons.status1\n\
    adds r0, r1\n\
    str r0, [sp]\n\
    movs r0, 0\n\
    movs r1, 0x28\n\
    movs r2, 0\n\
    movs r3, 0x4\n\
    bl BtlController_EmitSetMonData\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
    ldr r2, _0801EAF0 @ =gHitMarker\n\
    ldr r1, [r2]\n\
    movs r0, 0x80\n\
    lsls r0, 6\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801EAF8\n\
    movs r0, 0x1\n\
    strb r0, [r5, 0x5]\n\
    ldr r0, _0801EAF4 @ =0xffffdfff\n\
    ands r1, r0\n\
    str r1, [r2]\n\
    b _0801EAFA\n\
    .align 2, 0\n\
_0801EAD4: .4byte gBattleMons\n\
_0801EAD8: .4byte gEffectBattler\n\
_0801EADC: .4byte gBattlescriptCurrInstr\n\
_0801EAE0: .4byte gMoveEffectBS_Ptrs\n\
_0801EAE4: .4byte gBattleCommunication\n\
_0801EAE8: .4byte gActiveBattler\n\
_0801EAEC: .4byte gBattleMons+0x4C @ gBattleMons.status1\n\
_0801EAF0: .4byte gHitMarker\n\
_0801EAF4: .4byte 0xffffdfff\n\
_0801EAF8:\n\
    strb r0, [r5, 0x5]\n\
_0801EAFA:\n\
    ldr r0, _0801EB2C @ =gBattleCommunication\n\
    ldrb r2, [r0, 0x3]\n\
    adds r7, r0, 0\n\
    cmp r2, 0x2\n\
    beq _0801EB14\n\
    cmp r2, 0x6\n\
    beq _0801EB14\n\
    cmp r2, 0x5\n\
    beq _0801EB14\n\
    cmp r2, 0x3\n\
    beq _0801EB14\n\
    bl _0801F5FA\n\
_0801EB14:\n\
    ldr r0, _0801EB30 @ =gSharedMem\n\
    ldrb r1, [r7, 0x3]\n\
    ldr r2, _0801EB34 @ =0x000160ca\n\
    adds r0, r2\n\
    strb r1, [r0]\n\
    ldr r2, _0801EB38 @ =gHitMarker\n\
    ldr r0, [r2]\n\
    movs r1, 0x80\n\
    lsls r1, 7\n\
    bl _0801F4F2\n\
    .align 2, 0\n\
_0801EB2C: .4byte gBattleCommunication\n\
_0801EB30: .4byte gSharedMem\n\
_0801EB34: .4byte 0x000160ca\n\
_0801EB38: .4byte gHitMarker\n\
_0801EB3C:\n\
    mov r3, r10\n\
    cmp r3, 0\n\
    beq _0801EB46\n\
    bl _0801F5FA\n\
_0801EB46:\n\
    bl _0801F5DC\n\
_0801EB4A:\n\
    mov r0, r8\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r1, r0\n\
    mov r0, r9\n\
    adds r0, 0x50\n\
    adds r1, r0\n\
    ldr r2, _0801EB84 @ =sStatusFlagsForMoveEffects\n\
    ldrb r3, [r7, 0x3]\n\
    lsls r0, r3, 2\n\
    adds r0, r2\n\
    ldr r1, [r1]\n\
    ldr r0, [r0]\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _0801EB6E\n\
    bl _0801F5DC\n\
_0801EB6E:\n\
    subs r0, r3, 0x7\n\
    cmp r0, 0x34\n\
    bls _0801EB78\n\
    bl _0801F5FA\n\
_0801EB78:\n\
    lsls r0, 2\n\
    ldr r1, _0801EB88 @ =_0801EB8C\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_0801EB84: .4byte sStatusFlagsForMoveEffects\n\
_0801EB88: .4byte _0801EB8C\n\
    .align 2, 0\n\
_0801EB8C:\n\
    .4byte _0801EC60\n\
    .4byte _0801ECD4\n\
    .4byte _0801EE4C\n\
    .4byte _0801ED60\n\
    .4byte _0801EDDC\n\
    .4byte _0801EE84\n\
    .4byte _0801EECC\n\
    .4byte _0801EFA8\n\
    .4byte _0801EFEC\n\
    .4byte _0801EFEC\n\
    .4byte _0801EFEC\n\
    .4byte _0801EFEC\n\
    .4byte _0801EFEC\n\
    .4byte _0801EFEC\n\
    .4byte _0801EFEC\n\
    .4byte _0801F040\n\
    .4byte _0801F040\n\
    .4byte _0801F040\n\
    .4byte _0801F040\n\
    .4byte _0801F040\n\
    .4byte _0801F040\n\
    .4byte _0801F040\n\
    .4byte _0801F13C\n\
    .4byte _0801F184\n\
    .4byte _0801F1A4\n\
    .4byte _0801F364\n\
    .4byte _0801F3A0\n\
    .4byte _0801F3BC\n\
    .4byte _0801F3D4\n\
    .4byte _0801F3EC\n\
    .4byte _0801F44C\n\
    .4byte _0801F464\n\
    .4byte _0801F094\n\
    .4byte _0801F094\n\
    .4byte _0801F094\n\
    .4byte _0801F094\n\
    .4byte _0801F094\n\
    .4byte _0801F094\n\
    .4byte _0801F094\n\
    .4byte _0801F0E8\n\
    .4byte _0801F0E8\n\
    .4byte _0801F0E8\n\
    .4byte _0801F0E8\n\
    .4byte _0801F0E8\n\
    .4byte _0801F0E8\n\
    .4byte _0801F0E8\n\
    .4byte _0801F4A8\n\
    .4byte _0801F500\n\
    .4byte _0801F5FA\n\
    .4byte _0801F5FA\n\
    .4byte _0801F5FA\n\
    .4byte _0801F5FA\n\
    .4byte _0801F5EC\n\
_0801EC60:\n\
    mov r1, r8\n\
    ldrb r0, [r1]\n\
    movs r5, 0x58\n\
    adds r1, r0, 0\n\
    muls r1, r5\n\
    mov r2, r9\n\
    adds r0, r1, r2\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x14\n\
    bne _0801EC7A\n\
    bl _0801F5DC\n\
_0801EC7A:\n\
    mov r4, r9\n\
    adds r4, 0x50\n\
    adds r0, r1, r4\n\
    ldr r0, [r0]\n\
    movs r1, 0x7\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801EC8E\n\
    bl _0801F5DC\n\
_0801EC8E:\n\
    bl Random\n\
    mov r3, r8\n\
    ldrb r1, [r3]\n\
    adds r2, r1, 0\n\
    muls r2, r5\n\
    adds r2, r4\n\
    lsls r0, 16\n\
    movs r1, 0xC0\n\
    lsls r1, 10\n\
    ands r1, r0\n\
    lsrs r1, 16\n\
    adds r1, 0x2\n\
    ldr r0, [r2]\n\
    orrs r0, r1\n\
    str r0, [r2]\n\
    ldr r4, _0801ECC8 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r1, _0801ECCC @ =gMoveEffectBS_Ptrs\n\
    ldr r0, _0801ECD0 @ =gBattleCommunication\n\
    ldrb r0, [r0, 0x3]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    bl _0801F5F8\n\
    .align 2, 0\n\
_0801ECC8: .4byte gBattlescriptCurrInstr\n\
_0801ECCC: .4byte gMoveEffectBS_Ptrs\n\
_0801ECD0: .4byte gBattleCommunication\n\
_0801ECD4:\n\
    mov r0, r8\n\
    ldrb r2, [r0]\n\
    movs r6, 0x58\n\
    adds r0, r2, 0\n\
    muls r0, r6\n\
    add r0, r9\n\
    adds r0, 0x20\n\
    ldrb r1, [r0]\n\
    cmp r1, 0x27\n\
    bne _0801ED18\n\
    cmp r4, 0x1\n\
    beq _0801ECF4\n\
    cmp r5, 0x80\n\
    beq _0801ECF4\n\
    bl _0801F5DC\n\
_0801ECF4:\n\
    ldr r0, _0801ED0C @ =gLastUsedAbility\n\
    strb r1, [r0]\n\
    mov r1, r8\n\
    ldrb r0, [r1]\n\
    movs r1, 0x27\n\
    bl RecordAbilityBattle\n\
    ldr r1, _0801ED10 @ =gBattlescriptCurrInstr\n\
    ldr r0, _0801ED14 @ =BattleScript_FlinchPrevention\n\
    str r0, [r1]\n\
    bl _0801F5FA\n\
    .align 2, 0\n\
_0801ED0C: .4byte gLastUsedAbility\n\
_0801ED10: .4byte gBattlescriptCurrInstr\n\
_0801ED14: .4byte BattleScript_FlinchPrevention\n\
_0801ED18:\n\
    adds r0, r2, 0\n\
    bl GetBattlerTurnOrderNum\n\
    ldr r1, _0801ED54 @ =gCurrentTurnActionNumber\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    bhi _0801ED2E\n\
    bl _0801F5DC\n\
_0801ED2E:\n\
    mov r2, r8\n\
    ldrb r0, [r2]\n\
    adds r2, r0, 0\n\
    muls r2, r6\n\
    mov r0, r9\n\
    adds r0, 0x50\n\
    adds r2, r0\n\
    ldr r1, _0801ED58 @ =sStatusFlagsForMoveEffects\n\
    ldr r0, _0801ED5C @ =gBattleCommunication\n\
    ldrb r0, [r0, 0x3]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r1, [r2]\n\
    ldr r0, [r0]\n\
    orrs r1, r0\n\
    str r1, [r2]\n\
    bl _0801F5DC\n\
    .align 2, 0\n\
_0801ED54: .4byte gCurrentTurnActionNumber\n\
_0801ED58: .4byte sStatusFlagsForMoveEffects\n\
_0801ED5C: .4byte gBattleCommunication\n\
_0801ED60:\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    movs r5, 0x58\n\
    muls r0, r5\n\
    mov r4, r9\n\
    adds r4, 0x50\n\
    adds r2, r0, r4\n\
    ldr r1, [r2]\n\
    movs r0, 0x70\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801ED7C\n\
    bl _0801F5DC\n\
_0801ED7C:\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    orrs r1, r0\n\
    str r1, [r2]\n\
    ldr r1, _0801EDC8 @ =gLockedMoves\n\
    ldrb r0, [r3]\n\
    lsls r0, 1\n\
    adds r0, r1\n\
    ldr r1, _0801EDCC @ =gCurrentMove\n\
    ldrh r1, [r1]\n\
    strh r1, [r0]\n\
    bl Random\n\
    mov r2, r8\n\
    ldrb r1, [r2]\n\
    adds r2, r1, 0\n\
    muls r2, r5\n\
    adds r2, r4\n\
    movs r1, 0x3\n\
    ands r1, r0\n\
    adds r1, 0x2\n\
    lsls r1, 4\n\
    ldr r0, [r2]\n\
    orrs r0, r1\n\
    str r0, [r2]\n\
    ldr r4, _0801EDD0 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r1, _0801EDD4 @ =gMoveEffectBS_Ptrs\n\
    ldr r0, _0801EDD8 @ =gBattleCommunication\n\
    ldrb r0, [r0, 0x3]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    bl _0801F5F8\n\
    .align 2, 0\n\
_0801EDC8: .4byte gLockedMoves\n\
_0801EDCC: .4byte gCurrentMove\n\
_0801EDD0: .4byte gBattlescriptCurrInstr\n\
_0801EDD4: .4byte gMoveEffectBS_Ptrs\n\
_0801EDD8: .4byte gBattleCommunication\n\
_0801EDDC:\n\
    ldr r5, _0801EE30 @ =gBattlerAttacker\n\
    ldrb r0, [r5]\n\
    bl GetBattlerPosition\n\
    movs r1, 0x1\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    bne _0801EE14\n\
    ldr r4, _0801EE34 @ =gPaydayMoney\n\
    ldrh r3, [r4]\n\
    ldr r2, _0801EE38 @ =gBattleMons\n\
    ldrb r1, [r5]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r2\n\
    adds r0, 0x2A\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    adds r0, r3, r0\n\
    strh r0, [r4]\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r3, r0\n\
    bls _0801EE14\n\
    ldr r3, _0801EE3C @ =0x0000ffff\n\
    adds r0, r3, 0\n\
    strh r0, [r4]\n\
_0801EE14:\n\
    ldr r4, _0801EE40 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r1, _0801EE44 @ =gMoveEffectBS_Ptrs\n\
    ldr r0, _0801EE48 @ =gBattleCommunication\n\
    ldrb r0, [r0, 0x3]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    bl _0801F5F8\n\
    .align 2, 0\n\
_0801EE30: .4byte gBattlerAttacker\n\
_0801EE34: .4byte gPaydayMoney\n\
_0801EE38: .4byte gBattleMons\n\
_0801EE3C: .4byte 0x0000ffff\n\
_0801EE40: .4byte gBattlescriptCurrInstr\n\
_0801EE44: .4byte gMoveEffectBS_Ptrs\n\
_0801EE48: .4byte gBattleCommunication\n\
_0801EE4C:\n\
    mov r4, r8\n\
    ldrb r1, [r4]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    mov r1, r9\n\
    adds r1, 0x4C\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    cmp r0, 0\n\
    beq _0801EE62\n\
    b _0801F5DC\n\
_0801EE62:\n\
    bl Random\n\
    ldr r4, _0801EE80 @ =gBattleCommunication\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0x3\n\
    bl __umodsi3\n\
    adds r0, 0x3\n\
    strb r0, [r4, 0x3]\n\
    movs r0, 0\n\
    movs r1, 0\n\
    bl SetMoveEffect\n\
    b _0801F5FA\n\
    .align 2, 0\n\
_0801EE80: .4byte gBattleCommunication\n\
_0801EE84:\n\
    mov r0, r8\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    adds r2, r1, 0\n\
    muls r2, r0\n\
    mov r0, r9\n\
    adds r0, 0x50\n\
    adds r2, r0\n\
    ldr r0, [r2]\n\
    movs r1, 0x80\n\
    lsls r1, 5\n\
    orrs r0, r1\n\
    str r0, [r2]\n\
    ldr r1, _0801EEC0 @ =gLockedMoves\n\
    mov r2, r8\n\
    ldrb r0, [r2]\n\
    lsls r0, 1\n\
    adds r0, r1\n\
    ldr r1, _0801EEC4 @ =gCurrentMove\n\
    ldrh r1, [r1]\n\
    strh r1, [r0]\n\
    ldr r0, _0801EEC8 @ =gProtectStructs\n\
    ldrb r1, [r2]\n\
    lsls r1, 4\n\
    adds r1, r0\n\
    ldrb r0, [r1, 0x1]\n\
    movs r2, 0x4\n\
    orrs r0, r2\n\
    strb r0, [r1, 0x1]\n\
    b _0801F5DC\n\
    .align 2, 0\n\
_0801EEC0: .4byte gLockedMoves\n\
_0801EEC4: .4byte gCurrentMove\n\
_0801EEC8: .4byte gProtectStructs\n\
_0801EECC:\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    movs r6, 0x58\n\
    muls r0, r6\n\
    mov r4, r9\n\
    adds r4, 0x50\n\
    adds r0, r4\n\
    ldr r5, [r0]\n\
    movs r0, 0xE0\n\
    lsls r0, 8\n\
    ands r5, r0\n\
    cmp r5, 0\n\
    beq _0801EEE8\n\
    b _0801F5DC\n\
_0801EEE8:\n\
    bl Random\n\
    mov r2, r8\n\
    ldrb r1, [r2]\n\
    adds r2, r1, 0\n\
    muls r2, r6\n\
    adds r2, r4\n\
    movs r1, 0x3\n\
    ands r1, r0\n\
    adds r1, 0x3\n\
    lsls r1, 13\n\
    ldr r0, [r2]\n\
    orrs r0, r1\n\
    str r0, [r2]\n\
    ldr r2, _0801EF80 @ =gSharedMem\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    lsls r0, 1\n\
    ldr r4, _0801EF84 @ =0x00016004\n\
    adds r0, r4\n\
    adds r0, r2\n\
    ldr r6, _0801EF88 @ =gCurrentMove\n\
    ldrh r1, [r6]\n\
    strb r1, [r0]\n\
    ldrb r0, [r3]\n\
    lsls r0, 1\n\
    ldr r1, _0801EF8C @ =0x00016005\n\
    adds r0, r1\n\
    adds r0, r2\n\
    ldrh r1, [r6]\n\
    lsrs r1, 8\n\
    strb r1, [r0]\n\
    ldrb r0, [r3]\n\
    ldr r3, _0801EF90 @ =0x00016020\n\
    adds r0, r3\n\
    adds r0, r2\n\
    ldr r1, _0801EF94 @ =gBattlerAttacker\n\
    ldrb r1, [r1]\n\
    strb r1, [r0]\n\
    ldr r4, _0801EF98 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r1, _0801EF9C @ =gMoveEffectBS_Ptrs\n\
    ldr r2, _0801EFA0 @ =gBattleCommunication\n\
    ldrb r0, [r2, 0x3]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    str r0, [r4]\n\
    strb r5, [r2, 0x5]\n\
    ldr r1, _0801EFA4 @ =gTrappingMoves\n\
    ldrh r0, [r1]\n\
    ldrh r4, [r6]\n\
    cmp r0, r4\n\
    bne _0801EF5C\n\
    b _0801F5FA\n\
_0801EF5C:\n\
    adds r3, r1, 0\n\
    adds r1, r6, 0\n\
_0801EF60:\n\
    ldrb r0, [r2, 0x5]\n\
    adds r0, 0x1\n\
    strb r0, [r2, 0x5]\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x4\n\
    bls _0801EF70\n\
    b _0801F5FA\n\
_0801EF70:\n\
    ldrb r0, [r2, 0x5]\n\
    lsls r0, 1\n\
    adds r0, r3\n\
    ldrh r0, [r0]\n\
    ldrh r4, [r1]\n\
    cmp r0, r4\n\
    bne _0801EF60\n\
    b _0801F5FA\n\
    .align 2, 0\n\
_0801EF80: .4byte gSharedMem\n\
_0801EF84: .4byte 0x00016004\n\
_0801EF88: .4byte gCurrentMove\n\
_0801EF8C: .4byte 0x00016005\n\
_0801EF90: .4byte 0x00016020\n\
_0801EF94: .4byte gBattlerAttacker\n\
_0801EF98: .4byte gBattlescriptCurrInstr\n\
_0801EF9C: .4byte gMoveEffectBS_Ptrs\n\
_0801EFA0: .4byte gBattleCommunication\n\
_0801EFA4: .4byte gTrappingMoves\n\
_0801EFA8:\n\
    ldr r1, _0801EFD8 @ =gBattleMoveDamage\n\
    ldr r0, _0801EFDC @ =gHpDealt\n\
    ldr r0, [r0]\n\
    cmp r0, 0\n\
    bge _0801EFB4\n\
    adds r0, 0x3\n\
_0801EFB4:\n\
    asrs r0, 2\n\
    str r0, [r1]\n\
    cmp r0, 0\n\
    bne _0801EFC0\n\
    movs r0, 0x1\n\
    str r0, [r1]\n\
_0801EFC0:\n\
    ldr r4, _0801EFE0 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r1, _0801EFE4 @ =gMoveEffectBS_Ptrs\n\
    ldr r0, _0801EFE8 @ =gBattleCommunication\n\
    ldrb r0, [r0, 0x3]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    b _0801F5F8\n\
    .align 2, 0\n\
_0801EFD8: .4byte gBattleMoveDamage\n\
_0801EFDC: .4byte gHpDealt\n\
_0801EFE0: .4byte gBattlescriptCurrInstr\n\
_0801EFE4: .4byte gMoveEffectBS_Ptrs\n\
_0801EFE8: .4byte gBattleCommunication\n\
_0801EFEC:\n\
    ldrb r1, [r7, 0x3]\n\
    adds r1, 0xF2\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    movs r0, 0x10\n\
    adds r2, r6, 0\n\
    movs r3, 0\n\
    bl ChangeStatBuffs\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0\n\
    beq _0801F008\n\
    b _0801F5DC\n\
_0801F008:\n\
    ldr r2, _0801F02C @ =gSharedMem\n\
    ldrb r1, [r7, 0x3]\n\
    movs r0, 0x3F\n\
    ands r0, r1\n\
    ldr r4, _0801F030 @ =0x000160a4\n\
    adds r1, r2, r4\n\
    strb r0, [r1]\n\
    ldr r0, _0801F034 @ =0x000160a5\n\
    adds r2, r0\n\
    strb r3, [r2]\n\
    ldr r4, _0801F038 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801F03C @ =BattleScript_StatUp\n\
    b _0801F5F8\n\
    .align 2, 0\n\
_0801F02C: .4byte gSharedMem\n\
_0801F030: .4byte 0x000160a4\n\
_0801F034: .4byte 0x000160a5\n\
_0801F038: .4byte gBattlescriptCurrInstr\n\
_0801F03C: .4byte BattleScript_StatUp\n\
_0801F040:\n\
    movs r0, 0x70\n\
    negs r0, r0\n\
    ldrb r1, [r7, 0x3]\n\
    adds r1, 0xEB\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    adds r2, r6, 0\n\
    movs r3, 0\n\
    bl ChangeStatBuffs\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0\n\
    beq _0801F05E\n\
    b _0801F5DC\n\
_0801F05E:\n\
    ldr r2, _0801F080 @ =gSharedMem\n\
    ldrb r1, [r7, 0x3]\n\
    movs r0, 0x3F\n\
    ands r0, r1\n\
    ldr r4, _0801F084 @ =0x000160a4\n\
    adds r1, r2, r4\n\
    strb r0, [r1]\n\
    ldr r0, _0801F088 @ =0x000160a5\n\
    adds r2, r0\n\
    strb r3, [r2]\n\
    ldr r4, _0801F08C @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801F090 @ =BattleScript_StatDown\n\
    b _0801F5F8\n\
    .align 2, 0\n\
_0801F080: .4byte gSharedMem\n\
_0801F084: .4byte 0x000160a4\n\
_0801F088: .4byte 0x000160a5\n\
_0801F08C: .4byte gBattlescriptCurrInstr\n\
_0801F090: .4byte BattleScript_StatDown\n\
_0801F094:\n\
    ldrb r1, [r7, 0x3]\n\
    adds r1, 0xDA\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    movs r0, 0x20\n\
    adds r2, r6, 0\n\
    movs r3, 0\n\
    bl ChangeStatBuffs\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0\n\
    beq _0801F0B0\n\
    b _0801F5DC\n\
_0801F0B0:\n\
    ldr r2, _0801F0D4 @ =gSharedMem\n\
    ldrb r1, [r7, 0x3]\n\
    movs r0, 0x3F\n\
    ands r0, r1\n\
    ldr r4, _0801F0D8 @ =0x000160a4\n\
    adds r1, r2, r4\n\
    strb r0, [r1]\n\
    ldr r0, _0801F0DC @ =0x000160a5\n\
    adds r2, r0\n\
    strb r3, [r2]\n\
    ldr r4, _0801F0E0 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801F0E4 @ =BattleScript_StatUp\n\
    b _0801F5F8\n\
    .align 2, 0\n\
_0801F0D4: .4byte gSharedMem\n\
_0801F0D8: .4byte 0x000160a4\n\
_0801F0DC: .4byte 0x000160a5\n\
_0801F0E0: .4byte gBattlescriptCurrInstr\n\
_0801F0E4: .4byte BattleScript_StatUp\n\
_0801F0E8:\n\
    movs r0, 0x60\n\
    negs r0, r0\n\
    ldrb r1, [r7, 0x3]\n\
    adds r1, 0xD3\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    adds r2, r6, 0\n\
    movs r3, 0\n\
    bl ChangeStatBuffs\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0\n\
    beq _0801F106\n\
    b _0801F5DC\n\
_0801F106:\n\
    ldr r2, _0801F128 @ =gSharedMem\n\
    ldrb r1, [r7, 0x3]\n\
    movs r0, 0x3F\n\
    ands r0, r1\n\
    ldr r4, _0801F12C @ =0x000160a4\n\
    adds r1, r2, r4\n\
    strb r0, [r1]\n\
    ldr r0, _0801F130 @ =0x000160a5\n\
    adds r2, r0\n\
    strb r3, [r2]\n\
    ldr r4, _0801F134 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801F138 @ =BattleScript_StatDown\n\
    b _0801F5F8\n\
    .align 2, 0\n\
_0801F128: .4byte gSharedMem\n\
_0801F12C: .4byte 0x000160a4\n\
_0801F130: .4byte 0x000160a5\n\
_0801F134: .4byte gBattlescriptCurrInstr\n\
_0801F138: .4byte BattleScript_StatDown\n\
_0801F13C:\n\
    mov r2, r8\n\
    ldrb r1, [r2]\n\
    movs r0, 0x58\n\
    adds r2, r1, 0\n\
    muls r2, r0\n\
    mov r0, r9\n\
    adds r0, 0x50\n\
    adds r2, r0\n\
    ldr r0, [r2]\n\
    movs r1, 0x80\n\
    lsls r1, 15\n\
    orrs r0, r1\n\
    str r0, [r2]\n\
    ldr r2, _0801F178 @ =gDisableStructs\n\
    mov r3, r8\n\
    ldrb r1, [r3]\n\
    lsls r0, r1, 3\n\
    subs r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    movs r1, 0x2\n\
    strb r1, [r0, 0x19]\n\
    ldr r1, _0801F17C @ =gLockedMoves\n\
    ldrb r0, [r3]\n\
    lsls r0, 1\n\
    adds r0, r1\n\
    ldr r1, _0801F180 @ =gCurrentMove\n\
    ldrh r1, [r1]\n\
    strh r1, [r0]\n\
    b _0801F5DC\n\
    .align 2, 0\n\
_0801F178: .4byte gDisableStructs\n\
_0801F17C: .4byte gLockedMoves\n\
_0801F180: .4byte gCurrentMove\n\
_0801F184:\n\
    ldr r0, _0801F1A0 @ =gBattlerAttacker\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    adds r2, r1, 0\n\
    muls r2, r0\n\
    mov r0, r9\n\
    adds r0, 0x50\n\
    adds r2, r0\n\
    ldr r0, [r2]\n\
    movs r1, 0x80\n\
    lsls r1, 16\n\
_0801F19A:\n\
    orrs r0, r1\n\
    str r0, [r2]\n\
    b _0801F5DC\n\
    .align 2, 0\n\
_0801F1A0: .4byte gBattlerAttacker\n\
_0801F1A4:\n\
    ldr r4, _0801F254 @ =gBattlerAttacker\n\
    ldrb r0, [r4]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    lsrs r6, r0, 24\n\
    ldrb r0, [r4]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    bne _0801F1D8\n\
    ldr r0, _0801F258 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    ldr r0, _0801F25C @ =0x00000902\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0801F214\n\
    ldr r0, _0801F260 @ =gTrainerBattleOpponent\n\
    ldrh r1, [r0]\n\
    movs r0, 0x80\n\
    lsls r0, 3\n\
    cmp r1, r0\n\
    beq _0801F1D8\n\
    b _0801F5DC\n\
_0801F1D8:\n\
    ldr r0, _0801F258 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    ldr r0, _0801F25C @ =0x00000902\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0801F214\n\
    ldr r0, _0801F260 @ =gTrainerBattleOpponent\n\
    ldrh r1, [r0]\n\
    movs r0, 0x80\n\
    lsls r0, 3\n\
    cmp r1, r0\n\
    beq _0801F214\n\
    ldr r0, _0801F264 @ =gWishFutureKnock\n\
    adds r0, 0x29\n\
    adds r0, r6, r0\n\
    ldrb r1, [r0]\n\
    ldr r3, _0801F268 @ =gBitTable\n\
    ldr r2, _0801F26C @ =gBattlerPartyIndexes\n\
    ldr r0, _0801F254 @ =gBattlerAttacker\n\
    ldrb r0, [r0]\n\
    lsls r0, 1\n\
    adds r0, r2\n\
    ldrh r0, [r0]\n\
    lsls r0, 2\n\
    adds r0, r3\n\
    ldr r0, [r0]\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _0801F214\n\
    b _0801F5DC\n\
_0801F214:\n\
    ldr r2, _0801F270 @ =gBattleMons\n\
    ldr r1, _0801F274 @ =gBattlerTarget\n\
    ldrb r0, [r1]\n\
    movs r3, 0x58\n\
    muls r0, r3\n\
    adds r4, r0, r2\n\
    ldrh r0, [r4, 0x2E]\n\
    adds r7, r1, 0\n\
    mov r9, r2\n\
    cmp r0, 0\n\
    beq _0801F284\n\
    adds r0, r4, 0\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x3C\n\
    bne _0801F284\n\
    ldr r1, _0801F278 @ =gBattlescriptCurrInstr\n\
    ldr r0, _0801F27C @ =BattleScript_NoItemSteal\n\
    str r0, [r1]\n\
    ldr r1, _0801F280 @ =gLastUsedAbility\n\
    ldrb r0, [r7]\n\
    muls r0, r3\n\
    add r0, r9\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    ldrb r0, [r7]\n\
    ldrb r1, [r1]\n\
    bl RecordAbilityBattle\n\
    b _0801F5FA\n\
    .align 2, 0\n\
_0801F254: .4byte gBattlerAttacker\n\
_0801F258: .4byte gBattleTypeFlags\n\
_0801F25C: .4byte 0x00000902\n\
_0801F260: .4byte gTrainerBattleOpponent\n\
_0801F264: .4byte gWishFutureKnock\n\
_0801F268: .4byte gBitTable\n\
_0801F26C: .4byte gBattlerPartyIndexes\n\
_0801F270: .4byte gBattleMons\n\
_0801F274: .4byte gBattlerTarget\n\
_0801F278: .4byte gBattlescriptCurrInstr\n\
_0801F27C: .4byte BattleScript_NoItemSteal\n\
_0801F280: .4byte gLastUsedAbility\n\
_0801F284:\n\
    ldr r4, _0801F340 @ =gBattlerAttacker\n\
    mov r10, r4\n\
    ldrb r1, [r4]\n\
    movs r0, 0x58\n\
    mov r8, r0\n\
    mov r0, r8\n\
    muls r0, r1\n\
    add r0, r9\n\
    ldrh r3, [r0, 0x2E]\n\
    cmp r3, 0\n\
    beq _0801F29C\n\
    b _0801F5DC\n\
_0801F29C:\n\
    ldrb r0, [r7]\n\
    mov r2, r8\n\
    muls r2, r0\n\
    adds r0, r2, 0\n\
    add r0, r9\n\
    ldrh r2, [r0, 0x2E]\n\
    adds r0, r2, 0\n\
    cmp r0, 0xAF\n\
    bne _0801F2B0\n\
    b _0801F5DC\n\
_0801F2B0:\n\
    cmp r0, 0\n\
    bne _0801F2B6\n\
    b _0801F5DC\n\
_0801F2B6:\n\
    lsls r0, r1, 1\n\
    ldr r5, _0801F344 @ =gSharedMem + 0x160F0\n\
    adds r0, r5\n\
    ldr r1, _0801F348 @ =gLastUsedItem\n\
    strh r2, [r0]\n\
    strh r2, [r1]\n\
    ldrb r0, [r7]\n\
    mov r4, r8\n\
    muls r4, r0\n\
    adds r0, r4, 0\n\
    add r0, r9\n\
    movs r6, 0\n\
    strh r3, [r0, 0x2E]\n\
    ldr r4, _0801F34C @ =gActiveBattler\n\
    mov r2, r10\n\
    ldrb r0, [r2]\n\
    strb r0, [r4]\n\
    str r1, [sp]\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    movs r2, 0\n\
    movs r3, 0x2\n\
    bl BtlController_EmitSetMonData\n\
    mov r3, r10\n\
    ldrb r0, [r3]\n\
    bl MarkBattlerForControllerExec\n\
    ldrb r0, [r7]\n\
    strb r0, [r4]\n\
    ldrb r0, [r7]\n\
    mov r4, r8\n\
    muls r4, r0\n\
    adds r0, r4, 0\n\
    mov r1, r9\n\
    adds r1, 0x2E\n\
    adds r0, r1\n\
    str r0, [sp]\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    movs r2, 0\n\
    movs r3, 0x2\n\
    bl BtlController_EmitSetMonData\n\
    ldrb r0, [r7]\n\
    bl MarkBattlerForControllerExec\n\
    ldr r4, _0801F350 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801F354 @ =BattleScript_ItemSteal\n\
    str r0, [r4]\n\
    ldr r0, _0801F358 @ =0xfffe9f10\n\
    adds r5, r0\n\
    ldrb r0, [r7]\n\
    lsls r0, 1\n\
    ldr r1, _0801F35C @ =0x000160e8\n\
    adds r0, r1\n\
    adds r0, r5\n\
    strb r6, [r0]\n\
    ldrb r0, [r7]\n\
    lsls r0, 1\n\
    ldr r2, _0801F360 @ =0x000160e9\n\
    adds r0, r2\n\
    adds r0, r5\n\
    strb r6, [r0]\n\
    b _0801F5FA\n\
    .align 2, 0\n\
_0801F340: .4byte gBattlerAttacker\n\
_0801F344: .4byte gSharedMem + 0x160F0\n\
_0801F348: .4byte gLastUsedItem\n\
_0801F34C: .4byte gActiveBattler\n\
_0801F350: .4byte gBattlescriptCurrInstr\n\
_0801F354: .4byte BattleScript_ItemSteal\n\
_0801F358: .4byte 0xfffe9f10\n\
_0801F35C: .4byte 0x000160e8\n\
_0801F360: .4byte 0x000160e9\n\
_0801F364:\n\
    ldr r3, _0801F394 @ =gBattlerTarget\n\
    ldrb r1, [r3]\n\
    movs r0, 0x58\n\
    adds r2, r1, 0\n\
    muls r2, r0\n\
    mov r0, r9\n\
    adds r0, 0x50\n\
    adds r2, r0\n\
    ldr r0, [r2]\n\
    movs r1, 0x80\n\
    lsls r1, 19\n\
    orrs r0, r1\n\
    str r0, [r2]\n\
    ldr r2, _0801F398 @ =gDisableStructs\n\
    ldrb r1, [r3]\n\
    lsls r0, r1, 3\n\
    subs r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    ldr r1, _0801F39C @ =gBattlerAttacker\n\
    ldrb r1, [r1]\n\
    strb r1, [r0, 0x14]\n\
    b _0801F5DC\n\
    .align 2, 0\n\
_0801F394: .4byte gBattlerTarget\n\
_0801F398: .4byte gDisableStructs\n\
_0801F39C: .4byte gBattlerAttacker\n\
_0801F3A0:\n\
    ldr r0, _0801F3B8 @ =gBattlerTarget\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    adds r2, r1, 0\n\
    muls r2, r0\n\
    mov r0, r9\n\
    adds r0, 0x50\n\
    adds r2, r0\n\
    ldr r0, [r2]\n\
    movs r1, 0x80\n\
    lsls r1, 20\n\
    b _0801F19A\n\
    .align 2, 0\n\
_0801F3B8: .4byte gBattlerTarget\n\
_0801F3BC:\n\
    ldr r4, _0801F3CC @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801F3D0 @ =BattleScript_AllStatsUp\n\
    b _0801F5F8\n\
    .align 2, 0\n\
_0801F3CC: .4byte gBattlescriptCurrInstr\n\
_0801F3D0: .4byte BattleScript_AllStatsUp\n\
_0801F3D4:\n\
    ldr r4, _0801F3E4 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801F3E8 @ =BattleScript_RapidSpinAway\n\
    b _0801F5F8\n\
    .align 2, 0\n\
_0801F3E4: .4byte gBattlescriptCurrInstr\n\
_0801F3E8: .4byte BattleScript_RapidSpinAway\n\
_0801F3EC:\n\
    ldr r6, _0801F43C @ =gBattlerTarget\n\
    ldrb r0, [r6]\n\
    movs r2, 0x58\n\
    muls r0, r2\n\
    mov r1, r9\n\
    adds r1, 0x4C\n\
    adds r5, r0, r1\n\
    ldr r4, [r5]\n\
    movs r0, 0x40\n\
    ands r0, r4\n\
    cmp r0, 0\n\
    bne _0801F406\n\
    b _0801F5DC\n\
_0801F406:\n\
    movs r0, 0x41\n\
    negs r0, r0\n\
    ands r4, r0\n\
    str r4, [r5]\n\
    ldr r4, _0801F440 @ =gActiveBattler\n\
    ldrb r0, [r6]\n\
    strb r0, [r4]\n\
    ldrb r0, [r4]\n\
    muls r0, r2\n\
    adds r0, r1\n\
    str r0, [sp]\n\
    movs r0, 0\n\
    movs r1, 0x28\n\
    movs r2, 0\n\
    movs r3, 0x4\n\
    bl BtlController_EmitSetMonData\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
    ldr r4, _0801F444 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801F448 @ =BattleScript_TargetPRLZHeal\n\
    b _0801F5F8\n\
    .align 2, 0\n\
_0801F43C: .4byte gBattlerTarget\n\
_0801F440: .4byte gActiveBattler\n\
_0801F444: .4byte gBattlescriptCurrInstr\n\
_0801F448: .4byte BattleScript_TargetPRLZHeal\n\
_0801F44C:\n\
    ldr r4, _0801F45C @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801F460 @ =BattleScript_AtkDefDown\n\
    b _0801F5F8\n\
    .align 2, 0\n\
_0801F45C: .4byte gBattlescriptCurrInstr\n\
_0801F460: .4byte BattleScript_AtkDefDown\n\
_0801F464:\n\
    ldr r4, _0801F494 @ =gBattleMoveDamage\n\
    ldr r0, _0801F498 @ =gHpDealt\n\
    ldr r0, [r0]\n\
    movs r1, 0x3\n\
    bl __divsi3\n\
    str r0, [r4]\n\
    cmp r0, 0\n\
    bne _0801F47A\n\
    movs r0, 0x1\n\
    str r0, [r4]\n\
_0801F47A:\n\
    ldr r4, _0801F49C @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r1, _0801F4A0 @ =gMoveEffectBS_Ptrs\n\
    ldr r0, _0801F4A4 @ =gBattleCommunication\n\
    ldrb r0, [r0, 0x3]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    b _0801F5F8\n\
    .align 2, 0\n\
_0801F494: .4byte gBattleMoveDamage\n\
_0801F498: .4byte gHpDealt\n\
_0801F49C: .4byte gBattlescriptCurrInstr\n\
_0801F4A0: .4byte gMoveEffectBS_Ptrs\n\
_0801F4A4: .4byte gBattleCommunication\n\
_0801F4A8:\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    movs r5, 0x58\n\
    muls r0, r5\n\
    mov r4, r9\n\
    adds r4, 0x50\n\
    adds r2, r0, r4\n\
    ldr r1, [r2]\n\
    movs r0, 0xC0\n\
    lsls r0, 4\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0801F4C4\n\
    b _0801F5DC\n\
_0801F4C4:\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    orrs r1, r0\n\
    str r1, [r2]\n\
    ldr r1, _0801F4F8 @ =gLockedMoves\n\
    ldrb r0, [r3]\n\
    lsls r0, 1\n\
    adds r0, r1\n\
    ldr r1, _0801F4FC @ =gCurrentMove\n\
    ldrh r1, [r1]\n\
    strh r1, [r0]\n\
    bl Random\n\
    mov r2, r8\n\
    ldrb r1, [r2]\n\
    adds r2, r1, 0\n\
    muls r2, r5\n\
    adds r2, r4\n\
    movs r1, 0x1\n\
    ands r1, r0\n\
    adds r1, 0x2\n\
    lsls r1, 10\n\
    ldr r0, [r2]\n\
_0801F4F2:\n\
    orrs r0, r1\n\
    str r0, [r2]\n\
    b _0801F5FA\n\
    .align 2, 0\n\
_0801F4F8: .4byte gLockedMoves\n\
_0801F4FC: .4byte gCurrentMove\n\
_0801F500:\n\
    mov r5, r8\n\
    ldrb r3, [r5]\n\
    movs r4, 0x58\n\
    adds r0, r3, 0\n\
    muls r0, r4\n\
    mov r2, r9\n\
    adds r1, r0, r2\n\
    adds r0, r1, 0\n\
    adds r0, 0x20\n\
    ldrb r2, [r0]\n\
    cmp r2, 0x3C\n\
    bne _0801F540\n\
    ldrh r0, [r1, 0x2E]\n\
    cmp r0, 0\n\
    beq _0801F5DC\n\
    ldr r0, _0801F534 @ =gLastUsedAbility\n\
    strb r2, [r0]\n\
    ldr r1, _0801F538 @ =gBattlescriptCurrInstr\n\
    ldr r0, _0801F53C @ =BattleScript_NoItemSteal\n\
    str r0, [r1]\n\
    ldrb r0, [r5]\n\
    movs r1, 0x3C\n\
    bl RecordAbilityBattle\n\
    b _0801F5FA\n\
    .align 2, 0\n\
_0801F534: .4byte gLastUsedAbility\n\
_0801F538: .4byte gBattlescriptCurrInstr\n\
_0801F53C: .4byte BattleScript_NoItemSteal\n\
_0801F540:\n\
    ldrh r0, [r1, 0x2E]\n\
    cmp r0, 0\n\
    beq _0801F5DC\n\
    adds r0, r3, 0\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    lsrs r6, r0, 24\n\
    ldr r1, _0801F5B8 @ =gLastUsedItem\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    muls r0, r4\n\
    add r0, r9\n\
    ldrh r0, [r0, 0x2E]\n\
    strh r0, [r1]\n\
    ldrb r0, [r3]\n\
    muls r0, r4\n\
    add r0, r9\n\
    movs r5, 0\n\
    movs r1, 0\n\
    strh r1, [r0, 0x2E]\n\
    ldr r2, _0801F5BC @ =gWishFutureKnock\n\
    adds r2, 0x29\n\
    adds r2, r6, r2\n\
    ldr r3, _0801F5C0 @ =gBitTable\n\
    ldr r1, _0801F5C4 @ =gBattlerPartyIndexes\n\
    mov r4, r8\n\
    ldrb r0, [r4]\n\
    lsls r0, 1\n\
    adds r0, r1\n\
    ldrh r0, [r0]\n\
    lsls r0, 2\n\
    adds r0, r3\n\
    ldr r0, [r0]\n\
    ldrb r1, [r2]\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldr r4, _0801F5C8 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801F5CC @ =BattleScript_KnockedOff\n\
    str r0, [r4]\n\
    ldr r1, _0801F5D0 @ =gSharedMem\n\
    mov r2, r8\n\
    ldrb r0, [r2]\n\
    lsls r0, 1\n\
    ldr r3, _0801F5D4 @ =0x000160e8\n\
    adds r0, r3\n\
    adds r0, r1\n\
    strb r5, [r0]\n\
    ldrb r0, [r2]\n\
    lsls r0, 1\n\
    ldr r4, _0801F5D8 @ =0x000160e9\n\
    adds r0, r4\n\
    adds r0, r1\n\
    strb r5, [r0]\n\
    b _0801F5FA\n\
    .align 2, 0\n\
_0801F5B8: .4byte gLastUsedItem\n\
_0801F5BC: .4byte gWishFutureKnock\n\
_0801F5C0: .4byte gBitTable\n\
_0801F5C4: .4byte gBattlerPartyIndexes\n\
_0801F5C8: .4byte gBattlescriptCurrInstr\n\
_0801F5CC: .4byte BattleScript_KnockedOff\n\
_0801F5D0: .4byte gSharedMem\n\
_0801F5D4: .4byte 0x000160e8\n\
_0801F5D8: .4byte 0x000160e9\n\
_0801F5DC:\n\
    ldr r1, _0801F5E8 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r1]\n\
    adds r0, 0x1\n\
    str r0, [r1]\n\
    b _0801F5FA\n\
    .align 2, 0\n\
_0801F5E8: .4byte gBattlescriptCurrInstr\n\
_0801F5EC:\n\
    ldr r4, _0801F60C @ =gBattlescriptCurrInstr\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    bl BattleScriptPush\n\
    ldr r0, _0801F610 @ =BattleScript_SAtkDown2\n\
_0801F5F8:\n\
    str r0, [r4]\n\
_0801F5FA:\n\
    add sp, 0x8\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0801F60C: .4byte gBattlescriptCurrInstr\n\
_0801F610: .4byte BattleScript_SAtkDown2\n\
        .syntax divided\n");
}
#endif // NONMATCHING

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
    gBattleStruct->unk16112 = 0;
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
    gBattleStruct->unk16112 = 0;
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
            ewram160ACarr2(0, battlerId) = 0;
            ewram160ACarr2(1, battlerId) = 0;
            ewram16100arr2(0, battlerId) = 0;
            ewram16100arr2(1, battlerId) = 0;
            ewram16100arr2(2, battlerId) = 0;
            ewram16100arr2(3, battlerId) = 0;

            gHitMarker |= HITMARKER_FAINTED(gActiveBattler);
            BattleScriptPush(gBattlescriptCurrInstr + 7);
            gBattlescriptCurrInstr = BS_ptr;
            if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            {
                gHitMarker |= HITMARKER_x400000;
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
                u8 moveIndex = ewram1608Carr(gBattlerAttacker);

                gBattleMons[gBattlerAttacker].pp[moveIndex] = 0;
                BattleScriptPush(gBattlescriptCurrInstr);
                gBattlescriptCurrInstr = BattleScript_GrudgeTakesPp;
                gActiveBattler = gBattlerAttacker;
                BtlController_EmitSetMonData(0, moveIndex + 9, 0, 1, &gBattleMons[gActiveBattler].pp[moveIndex]);
                MarkBattlerForControllerExec(gActiveBattler);

                gBattleTextBuff1[0] = 0xFD;
                gBattleTextBuff1[1] = 2;
                gBattleTextBuff1[2] = gBattleMons[gBattlerAttacker].moves[moveIndex];
                gBattleTextBuff1[3] = gBattleMons[gBattlerAttacker].moves[moveIndex] >> 8;
                gBattleTextBuff1[4] = EOS;
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
            ewram160F8 = battlerId - 1;
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
            ewram160F8 = battlerId - 1;
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
            ewram160F8 = battlerId;
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
                if ((gHitMarker & HITMARKER_UNK(i)) && !gSpecialStatuses[i].flag40)
                    found1++;
            }

            for (found2 = 0, i = 1; i < gBattlersCount; i += 2)
            {
                if ((gHitMarker & HITMARKER_UNK(i)) && !gSpecialStatuses[i].flag40)
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
    gHitMarker &= ~(HITMARKER_SYNCHRONISE_EFFECT);
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
    ewram16060(gBattlerAttacker) = 1;
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

#ifdef NONMATCHING
static void atk48_playstatchangeanimation(void)
{
    int curr_stat = 0;
    u16 stat_animID = 0;
    int changeable_stats = 0;
    u32 stats_to_check;
    u8 arg3;

    gActiveBattler = GetBattlerForBattleScript(T2_READ_8(gBattlescriptCurrInstr + 1));
    stats_to_check = T2_READ_8(gBattlescriptCurrInstr + 2);
    arg3 = T2_READ_8(gBattlescriptCurrInstr + 3);
    if (arg3 & 1)
    {
        u16 r1 = 0x15;
        if (arg3 & 0x2)
            r1 = 0x2D;
        while (stats_to_check != 0)
        {
            if (!(stats_to_check & 1))
                continue;
            if (!(T2_READ_8(gBattlescriptCurrInstr + 3)))
            {
                u8 ability;
                if (gSideTimers[GetBattlerPosition(gActiveBattler) & 1].mistTimer)
                    continue;
                ability = gBattleMons[gActiveBattler].ability;
                if (ability == ABILITY_CLEAR_BODY || ability == ABILITY_WHITE_SMOKE || (ability == ABILITY_KEEN_EYE && curr_stat == 6) || (ability == ABILITY_HYPER_CUTTER && curr_stat == 1))
                    continue;
            }
            if (gBattleMons[gActiveBattler].statStages[curr_stat] > 0)
            {
                stat_animID = r1;
                changeable_stats++;
            }

            stats_to_check >>= 1;
            r1 += 1;
            curr_stat++;
        }
        if (changeable_stats > 1 && T2_READ_8(gBattlescriptCurrInstr + 3) & 2)
            stat_animID = 0x39;
        else
            stat_animID = 0x3A;
    }
    else
    {
        u16 r1 = 0x15;
        if (arg3 & 0x2)
            r1 = 0x2D;
        while (stats_to_check != 0)
        {
            if (!(stats_to_check & 1))
                continue;
            if (gBattleMons[gActiveBattler].statStages[curr_stat] < 0xB)
            {
                stat_animID = r1;
                changeable_stats++;
            }

            stats_to_check >>= 1;
            r1 += 1;
            curr_stat++;
        }
        if (changeable_stats > 1 && T2_READ_8(gBattlescriptCurrInstr + 3) & 2)
            stat_animID = 0x37;
        else
            stat_animID = 0x38;
    }
    if ((T2_READ_8(gBattlescriptCurrInstr + 3) & 2 && changeable_stats <= 1)
        || changeable_stats == 0 || gBattleStruct->unk160DC != 0)
        gBattlescriptCurrInstr += 4;
    else
    {
        BtlController_EmitBattleAnimation(0, 1, stat_animID);
        MarkBattlerForControllerExec(gActiveBattler);
        if ((T2_READ_8(gBattlescriptCurrInstr + 3) & 4) && changeable_stats > 1)
            gBattleStruct->unk160DC = 1;
        gBattlescriptCurrInstr += 4;
    }
}

#else
NAKED
static void atk48_playstatchangeanimation(void)
{
    asm(".syntax unified\n\
push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    movs r7, 0\n\
    movs r0, 0\n\
    mov r8, r0\n\
    movs r3, 0\n\
    ldr r5, _08021670 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r5]\n\
    ldrb r0, [r0, 0x1]\n\
    str r3, [sp]\n\
    bl GetBattlerForBattleScript\n\
    ldr r2, _08021674 @ =gActiveBattler\n\
    strb r0, [r2]\n\
    ldr r0, [r5]\n\
    ldrb r4, [r0, 0x2]\n\
    ldrb r1, [r0, 0x3]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    ldr r3, [sp]\n\
    cmp r0, 0\n\
    beq _08021710\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    movs r1, 0x15\n\
    cmp r0, 0\n\
    beq _0802163C\n\
    movs r1, 0x2D\n\
_0802163C:\n\
    cmp r4, 0\n\
    beq _080216E4\n\
    movs r0, 0x1\n\
    mov r10, r0\n\
    ldr r0, _08021678 @ =gBattleMons+0x18 @ gBattleMons.statStages\n\
    mov r9, r0\n\
    lsls r5, r1, 16\n\
_0802164A:\n\
    adds r0, r4, 0\n\
    mov r1, r10\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080216D6\n\
    ldr r0, _08021670 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r0]\n\
    ldrb r1, [r0, 0x3]\n\
    movs r0, 0x8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0802167C\n\
    ldr r0, _08021674 @ =gActiveBattler\n\
    ldrb r1, [r0]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r7, r0\n\
    b _080216C4\n\
    .align 2, 0\n\
_08021670: .4byte gBattlescriptCurrInstr\n\
_08021674: .4byte gActiveBattler\n\
_08021678: .4byte gBattleMons+0x18 @ gBattleMons.statStages\n\
_0802167C:\n\
    ldr r6, _08021700 @ =gActiveBattler\n\
    ldrb r0, [r6]\n\
    str r3, [sp]\n\
    bl GetBattlerPosition\n\
    mov r1, r10\n\
    ands r1, r0\n\
    lsls r0, r1, 1\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    ldr r1, _08021704 @ =gSideTimers\n\
    adds r0, r1\n\
    ldrb r0, [r0, 0x2]\n\
    ldr r3, [sp]\n\
    cmp r0, 0\n\
    bne _080216D6\n\
    ldr r0, _08021708 @ =gBattleMons\n\
    ldrb r2, [r6]\n\
    movs r1, 0x58\n\
    muls r2, r1\n\
    adds r0, r2, r0\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x1D\n\
    beq _080216D6\n\
    cmp r0, 0x49\n\
    beq _080216D6\n\
    cmp r0, 0x33\n\
    bne _080216BA\n\
    cmp r7, 0x6\n\
    beq _080216D6\n\
_080216BA:\n\
    cmp r0, 0x34\n\
    bne _080216C2\n\
    cmp r7, 0x1\n\
    beq _080216D6\n\
_080216C2:\n\
    adds r0, r7, r2\n\
_080216C4:\n\
    add r0, r9\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0\n\
    ble _080216D6\n\
    lsrs r0, r5, 16\n\
    mov r8, r0\n\
    adds r3, 0x1\n\
_080216D6:\n\
    lsrs r4, 1\n\
    movs r1, 0x80\n\
    lsls r1, 9\n\
    adds r5, r1\n\
    adds r7, 0x1\n\
    cmp r4, 0\n\
    bne _0802164A\n\
_080216E4:\n\
    ldr r0, _0802170C @ =gBattlescriptCurrInstr\n\
    mov r9, r0\n\
    cmp r3, 0x1\n\
    ble _08021772\n\
    ldr r0, [r0]\n\
    ldrb r1, [r0, 0x3]\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    movs r1, 0x39\n\
    mov r8, r1\n\
    cmp r0, 0\n\
    beq _08021772\n\
    movs r0, 0x3A\n\
    b _08021770\n\
    .align 2, 0\n\
_08021700: .4byte gActiveBattler\n\
_08021704: .4byte gSideTimers\n\
_08021708: .4byte gBattleMons\n\
_0802170C: .4byte gBattlescriptCurrInstr\n\
_08021710:\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    movs r1, 0xE\n\
    cmp r0, 0\n\
    beq _0802171C\n\
    movs r1, 0x26\n\
_0802171C:\n\
    mov r9, r5\n\
    cmp r4, 0\n\
    beq _08021758\n\
    ldr r6, _0802178C @ =gBattleMons+0x18 @ gBattleMons.statStages\n\
    adds r5, r2, 0\n\
    lsls r2, r1, 16\n\
_08021728:\n\
    movs r0, 0x1\n\
    ands r0, r4\n\
    cmp r0, 0\n\
    beq _0802174A\n\
    ldrb r1, [r5]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r7, r0\n\
    adds r0, r6\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0xB\n\
    bgt _0802174A\n\
    lsrs r1, r2, 16\n\
    mov r8, r1\n\
    adds r3, 0x1\n\
_0802174A:\n\
    lsrs r4, 1\n\
    movs r0, 0x80\n\
    lsls r0, 9\n\
    adds r2, r0\n\
    adds r7, 0x1\n\
    cmp r4, 0\n\
    bne _08021728\n\
_08021758:\n\
    cmp r3, 0x1\n\
    ble _08021772\n\
    mov r1, r9\n\
    ldr r0, [r1]\n\
    ldrb r1, [r0, 0x3]\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    movs r1, 0x37\n\
    mov r8, r1\n\
    cmp r0, 0\n\
    beq _08021772\n\
    movs r0, 0x38\n\
_08021770:\n\
    mov r8, r0\n\
_08021772:\n\
    mov r1, r9\n\
    ldr r2, [r1]\n\
    ldrb r1, [r2, 0x3]\n\
    movs r0, 0x4\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08021790\n\
    cmp r3, 0x1\n\
    bgt _08021790\n\
    adds r0, r2, 0x4\n\
    mov r1, r9\n\
    b _080217E6\n\
    .align 2, 0\n\
_0802178C: .4byte gBattleMons+0x18 @ gBattleMons.statStages\n\
_08021790:\n\
    cmp r3, 0\n\
    beq _080217E0\n\
    ldr r0, _080217D0 @ =gSharedMem\n\
    ldr r1, _080217D4 @ =0x000160dc\n\
    adds r4, r0, r1\n\
    ldrb r0, [r4]\n\
    cmp r0, 0\n\
    bne _080217E0\n\
    movs r0, 0\n\
    movs r1, 0x1\n\
    mov r2, r8\n\
    str r3, [sp]\n\
    bl BtlController_EmitBattleAnimation\n\
    ldr r0, _080217D8 @ =gActiveBattler\n\
    ldrb r0, [r0]\n\
    bl MarkBattlerForControllerExec\n\
    ldr r0, _080217DC @ =gBattlescriptCurrInstr\n\
    ldr r0, [r0]\n\
    ldrb r1, [r0, 0x3]\n\
    movs r0, 0x4\n\
    ands r0, r1\n\
    ldr r3, [sp]\n\
    cmp r0, 0\n\
    beq _080217CC\n\
    cmp r3, 0x1\n\
    ble _080217CC\n\
    movs r0, 0x1\n\
    strb r0, [r4]\n\
_080217CC:\n\
    ldr r1, _080217DC @ =gBattlescriptCurrInstr\n\
    b _080217E2\n\
    .align 2, 0\n\
_080217D0: .4byte gSharedMem\n\
_080217D4: .4byte 0x000160dc\n\
_080217D8: .4byte gActiveBattler\n\
_080217DC: .4byte gBattlescriptCurrInstr\n\
_080217E0:\n\
    mov r1, r9\n\
_080217E2:\n\
    ldr r0, [r1]\n\
    adds r0, 0x4\n\
_080217E6:\n\
    str r0, [r1]\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
        .syntax divided");
}

#endif // NONMATCHING

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

    gBattlerPartyIndexes[gActiveBattler] = ewram16068arr(gActiveBattler);

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
    BATTLE_PARTY_ID(gActiveBattler) = gBattlerPartyIndexes[gActiveBattler];
    BtlController_EmitChoosePokemon(0, 1, unkown, 0, gBattleStruct->unk1606C[gActiveBattler]);
    MarkBattlerForControllerExec(gActiveBattler);
}

/*
static void atk50_openpartyscreen(void)
{
    int i = 0;
    int r9 = 0;
    u8* fail_loc = T1_READ_PTR(gBattlescriptCurrInstr + 2);

    if (T2_READ_8(gBattlescriptCurrInstr + 1) == 5)
    {
        if ((gBattleTypeFlags & (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI)) != BATTLE_TYPE_DOUBLE)
        {
            for (gActiveBattler = i; gActiveBattler < gBattlersCount; gActiveBattler++)
            {
                if (!(gHitMarker & HITMARKER_FAINTED(gActiveBattler)))
                {
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (sub_8018018(gActiveBattler, 6, 6) == 0
                         && !gSpecialStatuses[gActiveBattler].flag40)
                {
                    sub_8022A3C(6);
                    gSpecialStatuses[gActiveBattler].flag40 = 1;
                }
                else
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= (~HITMARKER_FAINTED(gActiveBattler));
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        {
            if (!(gHitMarker >> 0x1C & gBitTable[0]))
            {

            }
            else if (sub_8018018(gActiveBattler, 6, 6) == 0
                     && !gSpecialStatuses[gActiveBattler].flag40)
            {

            }
            else
            {

            }
        }
    }
}
*/

NAKED
static void atk50_openpartyscreen(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r9\n\
    mov r6, r8\n\
    push {r6,r7}\n\
    sub sp, 0x4\n\
    movs r7, 0\n\
    movs r0, 0\n\
    mov r9, r0\n\
    ldr r6, _08022B44 @ =gBattlescriptCurrInstr\n\
    ldr r1, [r6]\n\
    ldrb r2, [r1, 0x2]\n\
    ldrb r0, [r1, 0x3]\n\
    lsls r0, 8\n\
    orrs r2, r0\n\
    ldrb r0, [r1, 0x4]\n\
    lsls r0, 16\n\
    orrs r2, r0\n\
    ldrb r0, [r1, 0x5]\n\
    lsls r0, 24\n\
    orrs r2, r0\n\
    mov r8, r2\n\
    ldrb r2, [r1, 0x1]\n\
    adds r0, r2, 0\n\
    mov r12, r6\n\
    cmp r0, 0x5\n\
    beq _08022ACE\n\
    b _08022F74\n\
_08022ACE:\n\
    ldr r0, _08022B48 @ =gBattleTypeFlags\n\
    ldrh r0, [r0]\n\
    movs r1, 0x41\n\
    ands r1, r0\n\
    cmp r1, 0x1\n\
    beq _08022BBC\n\
    ldr r1, _08022B4C @ =gActiveBattler\n\
    strb r7, [r1]\n\
    ldr r0, _08022B50 @ =gBattlersCount\n\
    ldrb r0, [r0]\n\
    cmp r7, r0\n\
    bcc _08022AE8\n\
    b _08022F62\n\
_08022AE8:\n\
    ldr r7, _08022B54 @ =gHitMarker\n\
    ldr r6, _08022B58 @ =gBitTable\n\
    adds r4, r1, 0\n\
    ldr r0, _08022B5C @ =gAbsentBattlerFlags\n\
    mov r8, r0\n\
_08022AF2:\n\
    ldrb r2, [r4]\n\
    lsls r0, r2, 2\n\
    adds r0, r6\n\
    ldr r1, [r0]\n\
    lsls r1, 28\n\
    ldr r0, [r7]\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08022B94\n\
    adds r0, r2, 0\n\
    movs r1, 0x6\n\
    movs r2, 0x6\n\
    bl sub_8018018\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08022B60\n\
    ldrb r0, [r4]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r0, [r0]\n\
    mov r2, r8\n\
    ldrb r1, [r2]\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldrb r0, [r4]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r1, [r0]\n\
    lsls r1, 28\n\
    ldr r0, [r7]\n\
    bics r0, r1\n\
    str r0, [r7]\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    bl BtlController_EmitLinkStandbyMsg\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
    b _08022BA2\n\
    .align 2, 0\n\
_08022B44: .4byte gBattlescriptCurrInstr\n\
_08022B48: .4byte gBattleTypeFlags\n\
_08022B4C: .4byte gActiveBattler\n\
_08022B50: .4byte gBattlersCount\n\
_08022B54: .4byte gHitMarker\n\
_08022B58: .4byte gBitTable\n\
_08022B5C: .4byte gAbsentBattlerFlags\n\
_08022B60:\n\
    ldr r5, _08022B90 @ =gSpecialStatuses\n\
    ldrb r0, [r4]\n\
    lsls r1, r0, 2\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r5\n\
    ldrb r0, [r1]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    blt _08022BA2\n\
    movs r0, 0x6\n\
    bl sub_8022A3C\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    ldrb r1, [r0]\n\
    movs r2, 0x40\n\
    orrs r1, r2\n\
    strb r1, [r0]\n\
    b _08022BA2\n\
    .align 2, 0\n\
_08022B90: .4byte gSpecialStatuses\n\
_08022B94:\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    bl BtlController_EmitLinkStandbyMsg\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
_08022BA2:\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
    ldr r1, _08022BB8 @ =gBattlersCount\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    bcc _08022AF2\n\
    b _08022F62\n\
    .align 2, 0\n\
_08022BB8: .4byte gBattlersCount\n\
_08022BBC:\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    bne _08022BC4\n\
    b _08022F62\n\
_08022BC4:\n\
    ldr r0, _08022C1C @ =gHitMarker\n\
    mov r8, r0\n\
    ldr r0, [r0]\n\
    lsrs r5, r0, 28\n\
    ldr r6, _08022C20 @ =gBitTable\n\
    ldr r0, [r6]\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    beq _08022C7E\n\
    ldr r4, _08022C24 @ =gActiveBattler\n\
    strb r7, [r4]\n\
    movs r0, 0\n\
    movs r1, 0x6\n\
    movs r2, 0x6\n\
    bl sub_8018018\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08022C2C\n\
    ldr r2, _08022C28 @ =gAbsentBattlerFlags\n\
    ldrb r0, [r4]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r0, [r0]\n\
    ldrb r1, [r2]\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldrb r0, [r4]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r1, [r0]\n\
    lsls r1, 28\n\
    mov r2, r8\n\
    ldr r0, [r2]\n\
    bics r0, r1\n\
    str r0, [r2]\n\
    movs r0, 0\n\
    bl BtlController_EmitCmd42\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
    b _08022C7E\n\
    .align 2, 0\n\
_08022C1C: .4byte gHitMarker\n\
_08022C20: .4byte gBitTable\n\
_08022C24: .4byte gActiveBattler\n\
_08022C28: .4byte gAbsentBattlerFlags\n\
_08022C2C:\n\
    ldr r6, _08022C60 @ =gSpecialStatuses\n\
    ldrb r0, [r4]\n\
    lsls r1, r0, 2\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r6\n\
    ldrb r0, [r1]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    blt _08022C6C\n\
    ldr r0, _08022C64 @ =gSharedMem\n\
    ldr r1, _08022C68 @ =0x0001606a\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    bl sub_8022A3C\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldrb r1, [r0]\n\
    movs r2, 0x40\n\
    orrs r1, r2\n\
    strb r1, [r0]\n\
    b _08022C7E\n\
    .align 2, 0\n\
_08022C60: .4byte gSpecialStatuses\n\
_08022C64: .4byte gSharedMem\n\
_08022C68: .4byte 0x0001606a\n\
_08022C6C:\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    bl BtlController_EmitLinkStandbyMsg\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
    movs r2, 0x1\n\
    mov r9, r2\n\
_08022C7E:\n\
    ldr r6, _08022CD8 @ =gBitTable\n\
    ldr r0, [r6, 0x8]\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    beq _08022D40\n\
    ldr r0, [r6]\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    bne _08022D40\n\
    ldr r4, _08022CDC @ =gActiveBattler\n\
    movs r0, 0x2\n\
    strb r0, [r4]\n\
    movs r0, 0x2\n\
    movs r1, 0x6\n\
    movs r2, 0x6\n\
    bl sub_8018018\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08022CE8\n\
    ldr r2, _08022CE0 @ =gAbsentBattlerFlags\n\
    ldrb r0, [r4]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r0, [r0]\n\
    ldrb r1, [r2]\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldr r2, _08022CE4 @ =gHitMarker\n\
    ldrb r0, [r4]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r1, [r0]\n\
    lsls r1, 28\n\
    ldr r0, [r2]\n\
    bics r0, r1\n\
    str r0, [r2]\n\
    movs r0, 0\n\
    bl BtlController_EmitCmd42\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
    b _08022D40\n\
    .align 2, 0\n\
_08022CD8: .4byte gBitTable\n\
_08022CDC: .4byte gActiveBattler\n\
_08022CE0: .4byte gAbsentBattlerFlags\n\
_08022CE4: .4byte gHitMarker\n\
_08022CE8:\n\
    ldr r6, _08022D1C @ =gSpecialStatuses\n\
    ldrb r0, [r4]\n\
    lsls r1, r0, 2\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r6\n\
    ldrb r0, [r1]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    blt _08022D28\n\
    ldr r0, _08022D20 @ =gSharedMem\n\
    ldr r1, _08022D24 @ =0x00016068\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    bl sub_8022A3C\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldrb r1, [r0]\n\
    movs r2, 0x40\n\
    orrs r1, r2\n\
    strb r1, [r0]\n\
    b _08022D40\n\
    .align 2, 0\n\
_08022D1C: .4byte gSpecialStatuses\n\
_08022D20: .4byte gSharedMem\n\
_08022D24: .4byte 0x00016068\n\
_08022D28:\n\
    movs r0, 0x1\n\
    mov r2, r9\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    bne _08022D40\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    bl BtlController_EmitLinkStandbyMsg\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
_08022D40:\n\
    ldr r6, _08022D90 @ =gBitTable\n\
    ldr r0, [r6, 0x4]\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    beq _08022DF6\n\
    ldr r4, _08022D94 @ =gActiveBattler\n\
    movs r0, 0x1\n\
    strb r0, [r4]\n\
    movs r0, 0x1\n\
    movs r1, 0x6\n\
    movs r2, 0x6\n\
    bl sub_8018018\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08022DA0\n\
    ldr r2, _08022D98 @ =gAbsentBattlerFlags\n\
    ldrb r0, [r4]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r0, [r0]\n\
    ldrb r1, [r2]\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldr r2, _08022D9C @ =gHitMarker\n\
    ldrb r0, [r4]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r1, [r0]\n\
    lsls r1, 28\n\
    ldr r0, [r2]\n\
    bics r0, r1\n\
    str r0, [r2]\n\
    movs r0, 0\n\
    bl BtlController_EmitCmd42\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
    b _08022DF6\n\
    .align 2, 0\n\
_08022D90: .4byte gBitTable\n\
_08022D94: .4byte gActiveBattler\n\
_08022D98: .4byte gAbsentBattlerFlags\n\
_08022D9C: .4byte gHitMarker\n\
_08022DA0:\n\
    ldr r6, _08022DD4 @ =gSpecialStatuses\n\
    ldrb r0, [r4]\n\
    lsls r1, r0, 2\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r6\n\
    ldrb r0, [r1]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    blt _08022DE0\n\
    ldr r0, _08022DD8 @ =gSharedMem\n\
    ldr r1, _08022DDC @ =0x0001606b\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    bl sub_8022A3C\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldrb r1, [r0]\n\
    movs r2, 0x40\n\
    orrs r1, r2\n\
    strb r1, [r0]\n\
    b _08022DF6\n\
    .align 2, 0\n\
_08022DD4: .4byte gSpecialStatuses\n\
_08022DD8: .4byte gSharedMem\n\
_08022DDC: .4byte 0x0001606b\n\
_08022DE0:\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    bl BtlController_EmitLinkStandbyMsg\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
    movs r0, 0x2\n\
    mov r2, r9\n\
    orrs r2, r0\n\
    mov r9, r2\n\
_08022DF6:\n\
    ldr r6, _08022E50 @ =gBitTable\n\
    ldr r0, [r6, 0xC]\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    beq _08022EB8\n\
    ldr r0, [r6, 0x4]\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    bne _08022EB8\n\
    ldr r4, _08022E54 @ =gActiveBattler\n\
    movs r0, 0x3\n\
    strb r0, [r4]\n\
    movs r0, 0x3\n\
    movs r1, 0x6\n\
    movs r2, 0x6\n\
    bl sub_8018018\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08022E60\n\
    ldr r2, _08022E58 @ =gAbsentBattlerFlags\n\
    ldrb r0, [r4]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r0, [r0]\n\
    ldrb r1, [r2]\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldr r2, _08022E5C @ =gHitMarker\n\
    ldrb r0, [r4]\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldr r1, [r0]\n\
    lsls r1, 28\n\
    ldr r0, [r2]\n\
    bics r0, r1\n\
    str r0, [r2]\n\
    movs r0, 0\n\
    bl BtlController_EmitCmd42\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
    b _08022EB8\n\
    .align 2, 0\n\
_08022E50: .4byte gBitTable\n\
_08022E54: .4byte gActiveBattler\n\
_08022E58: .4byte gAbsentBattlerFlags\n\
_08022E5C: .4byte gHitMarker\n\
_08022E60:\n\
    ldr r6, _08022E94 @ =gSpecialStatuses\n\
    ldrb r0, [r4]\n\
    lsls r1, r0, 2\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r6\n\
    ldrb r0, [r1]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    blt _08022EA0\n\
    ldr r0, _08022E98 @ =gSharedMem\n\
    ldr r1, _08022E9C @ =0x00016069\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    bl sub_8022A3C\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldrb r1, [r0]\n\
    movs r2, 0x40\n\
    orrs r1, r2\n\
    strb r1, [r0]\n\
    b _08022EB8\n\
    .align 2, 0\n\
_08022E94: .4byte gSpecialStatuses\n\
_08022E98: .4byte gSharedMem\n\
_08022E9C: .4byte 0x00016069\n\
_08022EA0:\n\
    movs r0, 0x2\n\
    mov r2, r9\n\
    ands r2, r0\n\
    cmp r2, 0\n\
    bne _08022EB8\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    bl BtlController_EmitLinkStandbyMsg\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
_08022EB8:\n\
    ldr r1, _08022EE8 @ =gSpecialStatuses\n\
    ldrb r0, [r1]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    blt _08022F0C\n\
    adds r0, r1, 0\n\
    adds r0, 0x28\n\
    ldrb r0, [r0]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    blt _08022F0C\n\
    cmp r5, 0\n\
    beq _08022F0C\n\
    ldr r0, _08022EEC @ =gAbsentBattlerFlags\n\
    ldrb r1, [r0]\n\
    ldr r0, _08022EF0 @ =gBitTable\n\
    ldr r0, [r0]\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _08022EF8\n\
    ldr r1, _08022EF4 @ =gActiveBattler\n\
    movs r0, 0x2\n\
    strb r0, [r1]\n\
    b _08022EFC\n\
    .align 2, 0\n\
_08022EE8: .4byte gSpecialStatuses\n\
_08022EEC: .4byte gAbsentBattlerFlags\n\
_08022EF0: .4byte gBitTable\n\
_08022EF4: .4byte gActiveBattler\n\
_08022EF8:\n\
    ldr r0, _08022F3C @ =gActiveBattler\n\
    strb r1, [r0]\n\
_08022EFC:\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    bl BtlController_EmitLinkStandbyMsg\n\
    ldr r0, _08022F3C @ =gActiveBattler\n\
    ldrb r0, [r0]\n\
    bl MarkBattlerForControllerExec\n\
_08022F0C:\n\
    ldr r1, _08022F40 @ =gSpecialStatuses\n\
    ldrb r0, [r1, 0x14]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    blt _08022F62\n\
    adds r0, r1, 0\n\
    adds r0, 0x3C\n\
    ldrb r0, [r0]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    blt _08022F62\n\
    cmp r5, 0\n\
    beq _08022F62\n\
    ldr r0, _08022F44 @ =gAbsentBattlerFlags\n\
    ldrb r0, [r0]\n\
    ldr r1, _08022F48 @ =gBitTable\n\
    ldr r1, [r1, 0x4]\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08022F4C\n\
    ldr r1, _08022F3C @ =gActiveBattler\n\
    movs r0, 0x3\n\
    b _08022F50\n\
    .align 2, 0\n\
_08022F3C: .4byte gActiveBattler\n\
_08022F40: .4byte gSpecialStatuses\n\
_08022F44: .4byte gAbsentBattlerFlags\n\
_08022F48: .4byte gBitTable\n\
_08022F4C:\n\
    ldr r1, _08022F6C @ =gActiveBattler\n\
    movs r0, 0x1\n\
_08022F50:\n\
    strb r0, [r1]\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    bl BtlController_EmitLinkStandbyMsg\n\
    ldr r0, _08022F6C @ =gActiveBattler\n\
    ldrb r0, [r0]\n\
    bl MarkBattlerForControllerExec\n\
_08022F62:\n\
    ldr r1, _08022F70 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r1]\n\
    adds r0, 0x6\n\
    str r0, [r1]\n\
    b _08023302\n\
    .align 2, 0\n\
_08022F6C: .4byte gActiveBattler\n\
_08022F70: .4byte gBattlescriptCurrInstr\n\
_08022F74:\n\
    cmp r0, 0x6\n\
    beq _08022F7A\n\
    b _08023170\n\
_08022F7A:\n\
    ldr r0, _08022FF0 @ =gBattleTypeFlags\n\
    ldrh r2, [r0]\n\
    movs r0, 0x40\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    beq _08022F88\n\
    b _0802310C\n\
_08022F88:\n\
    movs r0, 0x1\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    bne _08022F92\n\
    b _0802310C\n\
_08022F92:\n\
    ldr r7, _08022FF4 @ =gHitMarker\n\
    ldr r0, [r7]\n\
    lsrs r5, r0, 28\n\
    ldr r4, _08022FF8 @ =gBitTable\n\
    ldr r0, [r4, 0x8]\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    beq _0802303A\n\
    ldr r0, [r4]\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    beq _0802303A\n\
    ldr r6, _08022FFC @ =gActiveBattler\n\
    movs r0, 0x2\n\
    strb r0, [r6]\n\
    ldr r0, _08023000 @ =gBattleBufferB\n\
    ldrb r1, [r0, 0x1]\n\
    movs r0, 0x2\n\
    movs r2, 0x6\n\
    bl sub_8018018\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08023008\n\
    ldr r2, _08023004 @ =gAbsentBattlerFlags\n\
    ldrb r0, [r6]\n\
    lsls r0, 2\n\
    adds r0, r4\n\
    ldr r0, [r0]\n\
    ldrb r1, [r2]\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldrb r0, [r6]\n\
    lsls r0, 2\n\
    adds r0, r4\n\
    ldr r1, [r0]\n\
    lsls r1, 28\n\
    ldr r0, [r7]\n\
    bics r0, r1\n\
    str r0, [r7]\n\
    movs r0, 0\n\
    bl BtlController_EmitCmd42\n\
    ldrb r0, [r6]\n\
    bl MarkBattlerForControllerExec\n\
    b _0802303A\n\
    .align 2, 0\n\
_08022FF0: .4byte gBattleTypeFlags\n\
_08022FF4: .4byte gHitMarker\n\
_08022FF8: .4byte gBitTable\n\
_08022FFC: .4byte gActiveBattler\n\
_08023000: .4byte gBattleBufferB\n\
_08023004: .4byte gAbsentBattlerFlags\n\
_08023008:\n\
    ldr r4, _08023098 @ =gSpecialStatuses\n\
    ldrb r0, [r6]\n\
    lsls r1, r0, 2\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r4\n\
    ldrb r0, [r1]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    blt _0802303A\n\
    ldr r0, _0802309C @ =gSharedMem\n\
    ldr r1, _080230A0 @ =0x00016068\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    bl sub_8022A3C\n\
    ldrb r1, [r6]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r4\n\
    ldrb r1, [r0]\n\
    movs r2, 0x40\n\
    orrs r1, r2\n\
    strb r1, [r0]\n\
_0802303A:\n\
    ldr r4, _080230A4 @ =gBitTable\n\
    ldr r0, [r4, 0xC]\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    beq _080230EE\n\
    ldr r0, [r4, 0x4]\n\
    ands r5, r0\n\
    cmp r5, 0\n\
    beq _080230EE\n\
    ldr r5, _080230A8 @ =gActiveBattler\n\
    movs r0, 0x3\n\
    strb r0, [r5]\n\
    ldr r0, _080230AC @ =gBattleBufferB\n\
    ldr r2, _080230B0 @ =0x00000201\n\
    adds r0, r2\n\
    ldrb r1, [r0]\n\
    movs r0, 0x3\n\
    movs r2, 0x6\n\
    bl sub_8018018\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080230BC\n\
    ldr r2, _080230B4 @ =gAbsentBattlerFlags\n\
    ldrb r0, [r5]\n\
    lsls r0, 2\n\
    adds r0, r4\n\
    ldr r0, [r0]\n\
    ldrb r1, [r2]\n\
    orrs r0, r1\n\
    strb r0, [r2]\n\
    ldr r2, _080230B8 @ =gHitMarker\n\
    ldrb r0, [r5]\n\
    lsls r0, 2\n\
    adds r0, r4\n\
    ldr r1, [r0]\n\
    lsls r1, 28\n\
    ldr r0, [r2]\n\
    bics r0, r1\n\
    str r0, [r2]\n\
    movs r0, 0\n\
    bl BtlController_EmitCmd42\n\
    ldrb r0, [r5]\n\
    bl MarkBattlerForControllerExec\n\
    b _080230EE\n\
    .align 2, 0\n\
_08023098: .4byte gSpecialStatuses\n\
_0802309C: .4byte gSharedMem\n\
_080230A0: .4byte 0x00016068\n\
_080230A4: .4byte gBitTable\n\
_080230A8: .4byte gActiveBattler\n\
_080230AC: .4byte gBattleBufferB\n\
_080230B0: .4byte 0x00000201\n\
_080230B4: .4byte gAbsentBattlerFlags\n\
_080230B8: .4byte gHitMarker\n\
_080230BC:\n\
    ldr r4, _080230FC @ =gSpecialStatuses\n\
    ldrb r0, [r5]\n\
    lsls r1, r0, 2\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r4\n\
    ldrb r0, [r1]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    blt _080230EE\n\
    ldr r0, _08023100 @ =gSharedMem\n\
    ldr r1, _08023104 @ =0x00016069\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    bl sub_8022A3C\n\
    ldrb r1, [r5]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r4\n\
    ldrb r1, [r0]\n\
    movs r2, 0x40\n\
    orrs r1, r2\n\
    strb r1, [r0]\n\
_080230EE:\n\
    ldr r1, _08023108 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r1]\n\
    adds r0, 0x6\n\
    str r0, [r1]\n\
    mov r12, r1\n\
    b _08023110\n\
    .align 2, 0\n\
_080230FC: .4byte gSpecialStatuses\n\
_08023100: .4byte gSharedMem\n\
_08023104: .4byte 0x00016069\n\
_08023108: .4byte gBattlescriptCurrInstr\n\
_0802310C:\n\
    adds r0, r1, 0x6\n\
    str r0, [r6]\n\
_08023110:\n\
    ldr r0, _08023160 @ =gHitMarker\n\
    ldr r0, [r0]\n\
    lsrs r5, r0, 28\n\
    ldr r1, _08023164 @ =gBank1\n\
    movs r0, 0\n\
    strb r0, [r1]\n\
    ldr r4, _08023168 @ =gBitTable\n\
    ldr r2, [r4]\n\
    ands r2, r5\n\
    ldr r6, _0802316C @ =gBattlersCount\n\
    cmp r2, 0\n\
    bne _0802314C\n\
    adds r7, r6, 0\n\
    ldrb r0, [r6]\n\
    cmp r2, r0\n\
    bcs _0802314C\n\
    adds r3, r1, 0\n\
_08023132:\n\
    ldrb r0, [r3]\n\
    adds r0, 0x1\n\
    strb r0, [r3]\n\
    ldrb r2, [r3]\n\
    lsls r0, r2, 2\n\
    adds r0, r4\n\
    ldr r0, [r0]\n\
    ands r0, r5\n\
    cmp r0, 0\n\
    bne _0802314C\n\
    ldrb r0, [r7]\n\
    cmp r2, r0\n\
    bcc _08023132\n\
_0802314C:\n\
    ldrb r0, [r1]\n\
    ldrb r6, [r6]\n\
    cmp r0, r6\n\
    beq _08023156\n\
    b _08023302\n\
_08023156:\n\
    mov r1, r8\n\
    mov r2, r12\n\
    str r1, [r2]\n\
    b _08023302\n\
    .align 2, 0\n\
_08023160: .4byte gHitMarker\n\
_08023164: .4byte gBank1\n\
_08023168: .4byte gBitTable\n\
_0802316C: .4byte gBattlersCount\n\
_08023170:\n\
    movs r0, 0x80\n\
    ands r0, r2\n\
    movs r5, 0x1\n\
    cmp r0, 0\n\
    beq _0802317C\n\
    movs r5, 0\n\
_0802317C:\n\
    movs r0, 0x7F\n\
    ands r0, r2\n\
    bl GetBattlerForBattleScript\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    ldr r1, _080231A4 @ =gSpecialStatuses\n\
    lsls r0, r7, 2\n\
    adds r0, r7\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    lsls r0, 25\n\
    cmp r0, 0\n\
    bge _080231A8\n\
    ldr r0, [r6]\n\
    adds r0, 0x6\n\
    str r0, [r6]\n\
    b _08023302\n\
    .align 2, 0\n\
_080231A4: .4byte gSpecialStatuses\n\
_080231A8:\n\
    adds r0, r7, 0\n\
    movs r1, 0x6\n\
    movs r2, 0x6\n\
    bl sub_8018018\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080231F8\n\
    ldr r2, _080231E8 @ =gActiveBattler\n\
    strb r7, [r2]\n\
    ldr r3, _080231EC @ =gAbsentBattlerFlags\n\
    ldr r4, _080231F0 @ =gBitTable\n\
    ldrb r0, [r2]\n\
    lsls r0, 2\n\
    adds r0, r4\n\
    ldr r0, [r0]\n\
    ldrb r1, [r3]\n\
    orrs r0, r1\n\
    strb r0, [r3]\n\
    ldr r3, _080231F4 @ =gHitMarker\n\
    ldrb r0, [r2]\n\
    lsls r0, 2\n\
    adds r0, r4\n\
    ldr r1, [r0]\n\
    lsls r1, 28\n\
    ldr r0, [r3]\n\
    bics r0, r1\n\
    str r0, [r3]\n\
    mov r0, r8\n\
    str r0, [r6]\n\
    b _08023302\n\
    .align 2, 0\n\
_080231E8: .4byte gActiveBattler\n\
_080231EC: .4byte gAbsentBattlerFlags\n\
_080231F0: .4byte gBitTable\n\
_080231F4: .4byte gHitMarker\n\
_080231F8:\n\
    ldr r4, _080232A0 @ =gActiveBattler\n\
    strb r7, [r4]\n\
    ldr r3, _080232A4 @ =gSharedMem\n\
    ldrb r0, [r4]\n\
    ldr r2, _080232A8 @ =0x00016064\n\
    adds r1, r0, r2\n\
    adds r1, r3\n\
    ldr r2, _080232AC @ =gBattlerPartyIndexes\n\
    lsls r0, 1\n\
    adds r0, r2\n\
    ldrh r0, [r0]\n\
    strb r0, [r1]\n\
    ldrb r1, [r4]\n\
    movs r0, 0x2\n\
    eors r0, r1\n\
    ldr r1, _080232B0 @ =0x00016068\n\
    adds r0, r1\n\
    adds r0, r3\n\
    ldrb r2, [r0]\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 1\n\
    adds r0, r1\n\
    ldr r1, _080232B4 @ =0x0001606c\n\
    adds r3, r1\n\
    adds r0, r3\n\
    str r0, [sp]\n\
    movs r0, 0\n\
    adds r1, r5, 0\n\
    movs r3, 0\n\
    bl BtlController_EmitChoosePokemon\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
    ldr r0, [r6]\n\
    adds r0, 0x6\n\
    str r0, [r6]\n\
    ldrb r0, [r4]\n\
    bl GetBattlerPosition\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0802325A\n\
    ldr r1, _080232B8 @ =gBattleResults\n\
    ldrb r0, [r1, 0x2]\n\
    cmp r0, 0xFE\n\
    bhi _0802325A\n\
    adds r0, 0x1\n\
    strb r0, [r1, 0x2]\n\
_0802325A:\n\
    ldr r0, _080232BC @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080232C4\n\
    ldr r1, _080232A0 @ =gActiveBattler\n\
    movs r0, 0\n\
    strb r0, [r1]\n\
    ldr r0, _080232C0 @ =gBattlersCount\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    beq _08023302\n\
    adds r4, r1, 0\n\
_08023276:\n\
    ldrb r0, [r4]\n\
    cmp r0, r7\n\
    beq _0802328A\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    bl BtlController_EmitLinkStandbyMsg\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
_0802328A:\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
    ldr r1, _080232C0 @ =gBattlersCount\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    bcc _08023276\n\
    b _08023302\n\
    .align 2, 0\n\
_080232A0: .4byte gActiveBattler\n\
_080232A4: .4byte gSharedMem\n\
_080232A8: .4byte 0x00016064\n\
_080232AC: .4byte gBattlerPartyIndexes\n\
_080232B0: .4byte 0x00016068\n\
_080232B4: .4byte 0x0001606c\n\
_080232B8: .4byte gBattleResults\n\
_080232BC: .4byte gBattleTypeFlags\n\
_080232C0: .4byte gBattlersCount\n\
_080232C4:\n\
    adds r0, r7, 0\n\
    bl GetBattlerPosition\n\
    movs r1, 0x1\n\
    eors r0, r1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    bl GetBattlerAtPosition\n\
    ldr r4, _08023310 @ =gActiveBattler\n\
    strb r0, [r4]\n\
    ldr r0, _08023314 @ =gAbsentBattlerFlags\n\
    ldrb r1, [r0]\n\
    ldr r2, _08023318 @ =gBitTable\n\
    ldrb r3, [r4]\n\
    lsls r0, r3, 2\n\
    adds r0, r2\n\
    ldr r0, [r0]\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _080232F4\n\
    movs r0, 0x2\n\
    eors r3, r0\n\
    strb r3, [r4]\n\
_080232F4:\n\
    movs r0, 0\n\
    movs r1, 0x2\n\
    bl BtlController_EmitLinkStandbyMsg\n\
    ldrb r0, [r4]\n\
    bl MarkBattlerForControllerExec\n\
_08023302:\n\
    add sp, 0x4\n\
    pop {r3,r4}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08023310: .4byte gActiveBattler\n\
_08023314: .4byte gAbsentBattlerFlags\n\
_08023318: .4byte gBitTable\n\
        .syntax divided");
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
                ewram16068arr(i) = gBattleBufferB[i][1];
        }
        break;
    case 1:
        if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
            sub_8012258(gActiveBattler);
        break;
    case 2:
        gBattleCommunication[0] = gBattleBufferB[gActiveBattler][1];
        ewram16068arr(gActiveBattler) = gBattleBufferB[gActiveBattler][1];
        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            ewram1606Carr(0, gActiveBattler) &= 0xF;
            ewram1606Carr(0, gActiveBattler) |= (gBattleBufferB[gActiveBattler][2] & 0xF0);
            ewram1606Carr(1, gActiveBattler) = gBattleBufferB[gActiveBattler][3];
            ewram1606Carr(0, (gActiveBattler ^ 2)) &= (0xF0);
            ewram1606Carr(0, (gActiveBattler ^ 2)) |= (gBattleBufferB[gActiveBattler][2] & 0xF0) >> 4;
            ewram1606Carr(2, (gActiveBattler ^ 2)) = gBattleBufferB[gActiveBattler][3];
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
                *(HP_ON_SWITCHOUT + GetBattlerSide(i)) = gBattleMons[i].hp;
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
    Text_InitWindow(&gUnknown_03004210, BattleText_YesNo, 0x100, 0x19, 0x9);
    Text_PrintWindow8002F44(&gUnknown_03004210);
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
        if (gMain.newKeys & DPAD_UP && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (gMain.newKeys & DPAD_DOWN && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (gMain.newKeys & A_BUTTON)
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
        else if (gMain.newKeys & B_BUTTON)
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
        if (gMain.newKeys & DPAD_UP && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (gMain.newKeys & DPAD_DOWN && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            if (gBattleCommunication[1] != 0)
                gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
            else
                gBattlescriptCurrInstr += 5;
            sub_8023AD8();
        }
        else if (gMain.newKeys & B_BUTTON)
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

#define MONEY_UNKNOWN ((*(u8*)(ewram_addr + 0x17000 + 0x94)))

#ifdef NONMATCHING
static void atk5D_getmoneyreward(void)
{
    int i = 0;
    u8 r5 = 0;
    u32 money_to_give;
    if (gTrainerBattleOpponent == SECRET_BASE_OPPONENT)
    {
        money_to_give = 2 * gBattleStruct->moneyMultiplier * MONEY_UNKNOWN;
    }
    else
    {
        switch(gTrainers[gTrainerBattleOpponent].partyFlags)
        {
        case 0:
            {
                const struct TrainerMonNoItemDefaultMoves *data = gTrainers[gTrainerBattleOpponent].party.NoItemDefaultMoves;
                r5 = data[gTrainers[gTrainerBattleOpponent].partySize - 1].level;
            }
            break;
        case 2:
            {
                const struct TrainerMonItemDefaultMoves *data = gTrainers[gTrainerBattleOpponent].party.ItemDefaultMoves;
                r5 = data[gTrainers[gTrainerBattleOpponent].partySize - 1].level;
            }
            break;
        case 1:
        case 3:
            {
                const struct TrainerMonItemCustomMoves *data = gTrainers[gTrainerBattleOpponent].party.ItemCustomMoves;
                r5 = data[gTrainers[gTrainerBattleOpponent].partySize - 1].level;
            }
            break;
        }
        for (; gTrainerMoney[i * 4] != 0xFF && gTrainerMoney[i * 4 + 1] != gTrainers[gTrainerBattleOpponent].trainerClass ; i++) {}

        money_to_give = (r5 << 2) * gBattleStruct->moneyMultiplier;
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            money_to_give = 2 * gTrainerMoney[i * 4 + 1] * money_to_give;
        else
            money_to_give = 1 * gTrainerMoney[i * 4 + 1] * money_to_give;
    }

    AddMoney(&gSaveBlock1.money, money_to_give);
    gBattleTextBuff1[0] = 0xFD;
    gBattleTextBuff1[1] = 1;
    gBattleTextBuff1[2] = 4;
    gBattleTextBuff1[3] = 5;
    T2_WRITE_32(&gBattleTextBuff1[4], money_to_give);
    gBattleTextBuff1[8] = 0xFF;

    gBattlescriptCurrInstr += 1;
}
#else
NAKED
static void atk5D_getmoneyreward(void)
{
    asm(".syntax unified\n\
        push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    movs r6, 0\n\
    movs r5, 0\n\
    ldr r0, _08024048 @ =gTrainerBattleOpponent\n\
    ldrh r2, [r0]\n\
    movs r1, 0x80\n\
    lsls r1, 3\n\
    cmp r2, r1\n\
    bne _08024058\n\
    ldr r0, _0802404C @ =gSharedMem + 0x17000\n\
    adds r1, r0, 0\n\
    adds r1, 0x94\n\
    ldrb r2, [r1]\n\
    ldr r1, _08024050 @ =0xfffff056\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r4, r2, 0\n\
    muls r4, r0\n\
    ldr r0, _08024054 @ =gSaveBlock1 + 0x490\n\
    mov r8, r0\n\
    b _08024140\n\
    .align 2, 0\n\
_08024048: .4byte gTrainerBattleOpponent\n\
_0802404C: .4byte gSharedMem + 0x17000\n\
_08024050: .4byte 0xfffff056\n\
_08024054: .4byte gSaveBlock1 + 0x490\n\
_08024058:\n\
    ldr r2, _08024074 @ =gTrainers\n\
    ldrh r1, [r0]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r3, r0, 3\n\
    adds r4, r3, r2\n\
    ldrb r1, [r4]\n\
    cmp r1, 0x1\n\
    beq _080240AE\n\
    cmp r1, 0x1\n\
    bgt _08024078\n\
    cmp r1, 0\n\
    beq _08024082\n\
    b _080240C4\n\
    .align 2, 0\n\
_08024074: .4byte gTrainers\n\
_08024078:\n\
    cmp r1, 0x2\n\
    beq _08024098\n\
    cmp r1, 0x3\n\
    beq _080240AE\n\
    b _080240C4\n\
_08024082:\n\
    adds r0, r2, 0\n\
    adds r0, 0x24\n\
    adds r0, r3, r0\n\
    ldr r1, [r0]\n\
    adds r0, r4, 0\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    subs r0, 0x8\n\
    b _080240C2\n\
_08024098:\n\
    adds r0, r2, 0\n\
    adds r0, 0x24\n\
    adds r0, r3, r0\n\
    ldr r1, [r0]\n\
    adds r0, r4, 0\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    subs r0, 0x8\n\
    b _080240C2\n\
_080240AE:\n\
    adds r0, r2, 0\n\
    adds r0, 0x24\n\
    adds r0, r3, r0\n\
    ldr r1, [r0]\n\
    adds r0, r4, 0\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    lsls r0, 4\n\
    adds r0, r1\n\
    subs r0, 0x10\n\
_080240C2:\n\
    ldrb r5, [r0, 0x2]\n\
_080240C4:\n\
    ldr r0, _08024120 @ =gTrainerMoney\n\
    lsls r1, r6, 2\n\
    adds r3, r1, r0\n\
    ldrb r1, [r3]\n\
    mov r12, r0\n\
    lsls r4, r5, 2\n\
    ldr r5, _08024124 @ =gSharedMem\n\
    ldr r7, _08024128 @ =gBattleTypeFlags\n\
    ldr r0, _0802412C @ =gSaveBlock1 + 0x490\n\
    mov r8, r0\n\
    cmp r1, 0xFF\n\
    beq _080240FE\n\
    ldr r2, _08024130 @ =gTrainers\n\
    ldr r0, _08024134 @ =gTrainerBattleOpponent\n\
    ldrh r1, [r0]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 3\n\
    adds r0, r2\n\
    ldrb r2, [r0, 0x1]\n\
    adds r1, r3, 0\n\
_080240EE:\n\
    ldrb r0, [r1]\n\
    cmp r0, r2\n\
    beq _080240FE\n\
    adds r1, 0x4\n\
    adds r6, 0x1\n\
    ldrb r0, [r1]\n\
    cmp r0, 0xFF\n\
    bne _080240EE\n\
_080240FE:\n\
    ldr r1, _08024138 @ =0x00016056\n\
    adds r0, r5, r1\n\
    ldrb r0, [r0]\n\
    adds r3, r4, 0\n\
    muls r3, r0\n\
    lsls r0, r6, 2\n\
    add r0, r12\n\
    ldrb r2, [r0, 0x1]\n\
    ldrh r1, [r7]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0802413C\n\
    lsls r0, r2, 1\n\
    adds r4, r3, 0\n\
    muls r4, r0\n\
    b _08024140\n\
    .align 2, 0\n\
_08024120: .4byte gTrainerMoney\n\
_08024124: .4byte gSharedMem\n\
_08024128: .4byte gBattleTypeFlags\n\
_0802412C: .4byte gSaveBlock1 + 0x490\n\
_08024130: .4byte gTrainers\n\
_08024134: .4byte gTrainerBattleOpponent\n\
_08024138: .4byte 0x00016056\n\
_0802413C:\n\
    adds r4, r3, 0\n\
    muls r4, r2\n\
_08024140:\n\
    mov r0, r8\n\
    adds r1, r4, 0\n\
    bl AddMoney\n\
    ldr r1, _0802418C @ =gBattleTextBuff1\n\
    movs r0, 0xFD\n\
    strb r0, [r1]\n\
    movs r0, 0x1\n\
    strb r0, [r1, 0x1]\n\
    movs r0, 0x4\n\
    strb r0, [r1, 0x2]\n\
    movs r0, 0x5\n\
    strb r0, [r1, 0x3]\n\
    strb r4, [r1, 0x4]\n\
    movs r0, 0xFF\n\
    lsls r0, 8\n\
    ands r0, r4\n\
    lsrs r0, 8\n\
    strb r0, [r1, 0x5]\n\
    movs r0, 0xFF\n\
    lsls r0, 16\n\
    ands r0, r4\n\
    lsrs r0, 16\n\
    strb r0, [r1, 0x6]\n\
    lsrs r0, r4, 24\n\
    strb r0, [r1, 0x7]\n\
    movs r0, 0xFF\n\
    strb r0, [r1, 0x8]\n\
    ldr r1, _08024190 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r1]\n\
    adds r0, 0x1\n\
    str r0, [r1]\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0802418C: .4byte gBattleTextBuff1\n\
_08024190: .4byte gBattlescriptCurrInstr\n\
        .syntax divided");
}
#endif //NONMATCHING

/*
static u32 GetTrainerMoneyToGive(u16 trainerId)
{
    u32 i = 0;
    u32 lastMonLevel = 0;
    u32 moneyReward = 0;

    if (trainerId == SECRET_BASE_OPPONENT)
    {
        moneyReward = 20 * eSecretBaseRecord->partyLevels[0] * gBattleStruct->moneyMultiplier;
    }
    else
    {
        switch (gTrainers[trainerId].partyFlags)
        {
        case 0:
            {
                const struct TrainerMonNoItemDefaultMoves *party = gTrainers[trainerId].party.NoItemDefaultMoves;
                lastMonLevel = party[gTrainers[trainerId].partySize - 1].lvl;
            }
            break;
        case F_TRAINER_PARTY_CUSTOM_MOVESET:
            {
                const struct TrainerMonNoItemCustomMoves *party = gTrainers[trainerId].party.NoItemCustomMoves;
                lastMonLevel = party[gTrainers[trainerId].partySize - 1].lvl;
            }
            break;
        case F_TRAINER_PARTY_HELD_ITEM:
            {
                const struct TrainerMonItemDefaultMoves *party = gTrainers[trainerId].party.ItemDefaultMoves;
                lastMonLevel = party[gTrainers[trainerId].partySize - 1].lvl;
            }
            break;
        case F_TRAINER_PARTY_CUSTOM_MOVESET | F_TRAINER_PARTY_HELD_ITEM:
            {
                const struct TrainerMonItemCustomMoves *party = gTrainers[trainerId].party.ItemCustomMoves;
                lastMonLevel = party[gTrainers[trainerId].partySize - 1].lvl;
            }
            break;
        }

        for (; gTrainerMoneyTable[i].classId != 0xFF; i++)
        {
            if (gTrainerMoneyTable[i].classId == gTrainers[trainerId].trainerClass)
                break;
        }

        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            moneyReward = 4 * lastMonLevel * gBattleStruct->moneyMultiplier * 2 * gTrainerMoneyTable[i].value;
        else
            moneyReward = 4 * lastMonLevel * gBattleStruct->moneyMultiplier * gTrainerMoneyTable[i].value;
    }

    return moneyReward;
}

static void atk5D_getmoneyreward(void)
{
    u32 moneyReward = GetTrainerMoneyToGive(gTrainerBattleOpponent_A);
    if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)
        moneyReward += GetTrainerMoneyToGive(gTrainerBattleOpponent_B);

    AddMoney(&gSaveBlock1Ptr->money, moneyReward);

    PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff1, 5, moneyReward)

    gBattlescriptCurrInstr++;
}
*/

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
        if (gMain.newKeys & DPAD_UP && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (gMain.newKeys & DPAD_DOWN && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (gMain.newKeys & B_BUTTON)
        {
            gBattleCommunication[1] = 1;
            PlaySE(SE_SELECT);
            sub_8023AD8();
            gBattlescriptCurrInstr++;
        }
        else if (gMain.newKeys & A_BUTTON)
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
    USED_HELD_ITEMS(gActiveBattler) = gBattleMons[gActiveBattler].item;

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

#ifdef NONMATCHING
extern const u8 BattleText_Format2[];

// TODO: finish
static void atk6C_drawlvlupbox(void)
{
    UNUSED u8 r1 = 0;
    UNUSED u8 r7 = 0;
    switch (gBattleStruct->atk6C_statetracker)
    {
    case 0:
        sub_802BBD4(0xB, 0, 0x1D, 0x7, r1);
        StringCopy(gStringVar4, BattleText_Format2);

    }
}

#else
NAKED
static void atk6C_drawlvlupbox(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    movs r1, 0\n\
    movs r7, 0\n\
    ldr r0, _08024928 @ =gSharedMem\n\
    mov r10, r0\n\
    ldr r4, _0802492C @ =0x0001609c\n\
    add r4, r10\n\
    ldrb r0, [r4]\n\
    cmp r0, 0x1\n\
    bne _0802491C\n\
    b _08024AF4\n\
_0802491C:\n\
    cmp r0, 0x1\n\
    bgt _08024930\n\
    cmp r0, 0\n\
    beq _0802493E\n\
    b _08024C38\n\
    .align 2, 0\n\
_08024928: .4byte gSharedMem\n\
_0802492C: .4byte 0x0001609c\n\
_08024930:\n\
    cmp r0, 0x2\n\
    bne _08024936\n\
    b _08024C04\n\
_08024936:\n\
    cmp r0, 0x3\n\
    bne _0802493C\n\
    b _08024C30\n\
_0802493C:\n\
    b _08024C38\n\
_0802493E:\n\
    str r1, [sp]\n\
    movs r0, 0xB\n\
    movs r1, 0\n\
    movs r2, 0x1D\n\
    movs r3, 0x7\n\
    bl sub_802BBD4\n\
    ldr r0, _0802499C @ =gStringVar4\n\
    ldr r1, _080249A0 @ =BattleText_Format2\n\
    bl StringCopy\n\
    adds r5, r0, 0\n\
    movs r1, 0\n\
    mov r8, r1\n\
_0802495A:\n\
    movs r2, 0\n\
    mov r9, r2\n\
    ldr r0, _080249A4 @ =gUnknown_0840165C\n\
    mov r1, r8\n\
    lsls r4, r1, 2\n\
    adds r0, r4, r0\n\
    ldr r1, [r0]\n\
    adds r0, r5, 0\n\
    bl StringAppend\n\
    adds r5, r0, 0\n\
    ldr r0, _080249A8 @ =gSharedMem\n\
    ldr r2, _080249AC @ =0x00016018\n\
    adds r0, r2\n\
    ldrb r1, [r0]\n\
    movs r0, 0x64\n\
    muls r0, r1\n\
    ldr r1, _080249B0 @ =gPlayerParty\n\
    adds r0, r1\n\
    ldr r1, _080249B4 @ =gLevelUpStatBoxStats\n\
    add r1, r8\n\
    ldrb r1, [r1]\n\
    bl GetMonData\n\
    lsls r0, 16\n\
    lsrs r1, r0, 16\n\
    mov r0, r8\n\
    cmp r0, 0x5\n\
    bhi _08024A1A\n\
    ldr r0, _080249B8 @ =_080249BC\n\
    adds r0, r4, r0\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_0802499C: .4byte gStringVar4\n\
_080249A0: .4byte BattleText_Format2\n\
_080249A4: .4byte gUnknown_0840165C\n\
_080249A8: .4byte gSharedMem\n\
_080249AC: .4byte 0x00016018\n\
_080249B0: .4byte gPlayerParty\n\
_080249B4: .4byte gLevelUpStatBoxStats\n\
_080249B8: .4byte _080249BC\n\
    .align 2, 0\n\
_080249BC:\n\
    .4byte _080249D4\n\
    .4byte _080249E0\n\
    .4byte _080249EC\n\
    .4byte _080249F8\n\
    .4byte _08024A04\n\
    .4byte _08024A10\n\
_080249D4:\n\
    ldr r0, _080249DC @ =gSharedMem + 0x17180\n\
    ldrh r0, [r0]\n\
    b _08024A14\n\
    .align 2, 0\n\
_080249DC: .4byte gSharedMem + 0x17180\n\
_080249E0:\n\
    ldr r0, _080249E8 @ =gSharedMem + 0x17180\n\
    ldrh r0, [r0, 0x8]\n\
    b _08024A14\n\
    .align 2, 0\n\
_080249E8: .4byte gSharedMem + 0x17180\n\
_080249EC:\n\
    ldr r0, _080249F4 @ =gSharedMem + 0x17180\n\
    ldrh r0, [r0, 0x2]\n\
    b _08024A14\n\
    .align 2, 0\n\
_080249F4: .4byte gSharedMem + 0x17180\n\
_080249F8:\n\
    ldr r0, _08024A00 @ =gSharedMem + 0x17180\n\
    ldrh r0, [r0, 0xA]\n\
    b _08024A14\n\
    .align 2, 0\n\
_08024A00: .4byte gSharedMem + 0x17180\n\
_08024A04:\n\
    ldr r0, _08024A0C @ =gSharedMem + 0x17180\n\
    ldrh r0, [r0, 0x4]\n\
    b _08024A14\n\
    .align 2, 0\n\
_08024A0C: .4byte gSharedMem + 0x17180\n\
_08024A10:\n\
    ldr r0, _08024A54 @ =gSharedMem + 0x17180\n\
    ldrh r0, [r0, 0x6]\n\
_08024A14:\n\
    subs r0, r1, r0\n\
    lsls r0, 16\n\
    lsrs r7, r0, 16\n\
_08024A1A:\n\
    lsls r0, r7, 16\n\
    asrs r0, 16\n\
    cmp r0, 0\n\
    bge _08024A2C\n\
    negs r0, r0\n\
    lsls r0, 16\n\
    lsrs r7, r0, 16\n\
    movs r1, 0x1\n\
    add r9, r1\n\
_08024A2C:\n\
    movs r0, 0xFC\n\
    strb r0, [r5]\n\
    movs r0, 0x13\n\
    strb r0, [r5, 0x1]\n\
    movs r1, 0x1\n\
    mov r2, r8\n\
    ands r1, r2\n\
    lsls r0, r1, 3\n\
    adds r0, r1\n\
    adds r0, 0x5\n\
    lsls r0, 3\n\
    adds r0, 0x6\n\
    strb r0, [r5, 0x2]\n\
    adds r5, 0x3\n\
    mov r0, r9\n\
    cmp r0, 0\n\
    beq _08024A5C\n\
    ldr r1, _08024A58 @ =BattleText_Dash\n\
    b _08024A5E\n\
    .align 2, 0\n\
_08024A54: .4byte gSharedMem + 0x17180\n\
_08024A58: .4byte BattleText_Dash\n\
_08024A5C:\n\
    ldr r1, _08024AA4 @ =BattleText_Plus\n\
_08024A5E:\n\
    adds r0, r5, 0\n\
    bl StringCopy\n\
    adds r5, r0, 0\n\
    movs r6, 0xFC\n\
    strb r6, [r5]\n\
    movs r4, 0x14\n\
    strb r4, [r5, 0x1]\n\
    movs r0, 0x6\n\
    strb r0, [r5, 0x2]\n\
    adds r5, 0x3\n\
    lsls r1, r7, 16\n\
    asrs r1, 16\n\
    adds r0, r5, 0\n\
    movs r2, 0x1\n\
    movs r3, 0x2\n\
    bl ConvertIntToDecimalStringN\n\
    adds r5, r0, 0\n\
    strb r6, [r5]\n\
    strb r4, [r5, 0x1]\n\
    movs r0, 0\n\
    strb r0, [r5, 0x2]\n\
    adds r5, 0x3\n\
    movs r0, 0x1\n\
    mov r1, r8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08024AA8\n\
    movs r0, 0xFE\n\
    strb r0, [r5]\n\
    movs r0, 0xFF\n\
    strb r0, [r5, 0x1]\n\
    adds r5, 0x1\n\
    b _08024AB8\n\
    .align 2, 0\n\
_08024AA4: .4byte BattleText_Plus\n\
_08024AA8:\n\
    strb r6, [r5]\n\
    movs r0, 0x11\n\
    strb r0, [r5, 0x1]\n\
    movs r0, 0x8\n\
    strb r0, [r5, 0x2]\n\
    adds r5, 0x3\n\
    movs r0, 0xFF\n\
    strb r0, [r5]\n\
_08024AB8:\n\
    movs r2, 0x1\n\
    add r8, r2\n\
    mov r0, r8\n\
    cmp r0, 0x5\n\
    bgt _08024AC4\n\
    b _0802495A\n\
_08024AC4:\n\
    ldr r4, _08024AE4 @ =gUnknown_03004210\n\
    ldr r1, _08024AE8 @ =gStringVar4\n\
    adds r2, 0xFF\n\
    movs r0, 0x1\n\
    str r0, [sp]\n\
    adds r0, r4, 0\n\
    movs r3, 0xC\n\
    bl Text_InitWindow\n\
    adds r0, r4, 0\n\
    bl Text_PrintWindow8002F44\n\
    ldr r1, _08024AEC @ =gSharedMem\n\
    ldr r2, _08024AF0 @ =0x0001609c\n\
    adds r1, r2\n\
    b _08024BEA\n\
    .align 2, 0\n\
_08024AE4: .4byte gUnknown_03004210\n\
_08024AE8: .4byte gStringVar4\n\
_08024AEC: .4byte gSharedMem\n\
_08024AF0: .4byte 0x0001609c\n\
_08024AF4:\n\
    ldr r0, _08024B94 @ =gMain\n\
    ldrh r0, [r0, 0x2E]\n\
    cmp r0, 0\n\
    bne _08024AFE\n\
    b _08024C38\n\
_08024AFE:\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    ldr r0, _08024B98 @ =gStringVar4\n\
    ldr r1, _08024B9C @ =BattleText_Format2\n\
    bl StringCopy\n\
    adds r5, r0, 0\n\
    movs r0, 0\n\
    mov r8, r0\n\
    mov r9, r0\n\
    movs r6, 0xFC\n\
    movs r7, 0x14\n\
    ldr r1, _08024BA0 @ =0x00016018\n\
    add r10, r1\n\
_08024B1C:\n\
    ldr r1, _08024BA4 @ =gUnknown_0840165C\n\
    mov r2, r8\n\
    lsls r0, r2, 2\n\
    adds r0, r1\n\
    ldr r1, [r0]\n\
    adds r0, r5, 0\n\
    bl StringAppend\n\
    adds r5, r0, 0\n\
    mov r0, r10\n\
    ldrb r1, [r0]\n\
    movs r0, 0x64\n\
    muls r0, r1\n\
    ldr r1, _08024BA8 @ =gPlayerParty\n\
    adds r0, r1\n\
    ldr r1, _08024BAC @ =gLevelUpStatBoxStats\n\
    add r1, r8\n\
    ldrb r1, [r1]\n\
    bl GetMonData\n\
    adds r1, r0, 0\n\
    strb r6, [r5]\n\
    movs r0, 0x13\n\
    strb r0, [r5, 0x1]\n\
    movs r4, 0x1\n\
    mov r2, r8\n\
    ands r4, r2\n\
    lsls r0, r4, 3\n\
    adds r0, r4\n\
    adds r0, 0x5\n\
    lsls r0, 3\n\
    adds r0, 0x6\n\
    strb r0, [r5, 0x2]\n\
    adds r5, 0x3\n\
    strb r6, [r5]\n\
    strb r7, [r5, 0x1]\n\
    movs r0, 0x6\n\
    strb r0, [r5, 0x2]\n\
    adds r5, 0x3\n\
    lsls r1, 16\n\
    asrs r1, 16\n\
    adds r0, r5, 0\n\
    movs r2, 0x1\n\
    movs r3, 0x3\n\
    bl ConvertIntToDecimalStringN\n\
    adds r5, r0, 0\n\
    strb r6, [r5]\n\
    strb r7, [r5, 0x1]\n\
    mov r0, r9\n\
    strb r0, [r5, 0x2]\n\
    adds r5, 0x3\n\
    cmp r4, 0\n\
    beq _08024BB0\n\
    movs r0, 0xFE\n\
    strb r0, [r5]\n\
    movs r0, 0xFF\n\
    strb r0, [r5, 0x1]\n\
    adds r5, 0x1\n\
    b _08024BC0\n\
    .align 2, 0\n\
_08024B94: .4byte gMain\n\
_08024B98: .4byte gStringVar4\n\
_08024B9C: .4byte BattleText_Format2\n\
_08024BA0: .4byte 0x00016018\n\
_08024BA4: .4byte gUnknown_0840165C\n\
_08024BA8: .4byte gPlayerParty\n\
_08024BAC: .4byte gLevelUpStatBoxStats\n\
_08024BB0:\n\
    strb r6, [r5]\n\
    movs r0, 0x11\n\
    strb r0, [r5, 0x1]\n\
    movs r0, 0x8\n\
    strb r0, [r5, 0x2]\n\
    adds r5, 0x3\n\
    movs r0, 0xFF\n\
    strb r0, [r5]\n\
_08024BC0:\n\
    movs r1, 0x1\n\
    add r8, r1\n\
    mov r2, r8\n\
    cmp r2, 0x5\n\
    ble _08024B1C\n\
    ldr r4, _08024BF4 @ =gUnknown_03004210\n\
    ldr r1, _08024BF8 @ =gStringVar4\n\
    movs r2, 0x80\n\
    lsls r2, 1\n\
    movs r0, 0x1\n\
    str r0, [sp]\n\
    adds r0, r4, 0\n\
    movs r3, 0xC\n\
    bl Text_InitWindow\n\
    adds r0, r4, 0\n\
    bl Text_PrintWindow8002F44\n\
    ldr r1, _08024BFC @ =gSharedMem\n\
    ldr r0, _08024C00 @ =0x0001609c\n\
    adds r1, r0\n\
_08024BEA:\n\
    ldrb r0, [r1]\n\
    adds r0, 0x1\n\
    strb r0, [r1]\n\
    b _08024C38\n\
    .align 2, 0\n\
_08024BF4: .4byte gUnknown_03004210\n\
_08024BF8: .4byte gStringVar4\n\
_08024BFC: .4byte gSharedMem\n\
_08024C00: .4byte 0x0001609c\n\
_08024C04:\n\
    ldr r0, _08024C2C @ =gMain\n\
    ldrh r0, [r0, 0x2E]\n\
    cmp r0, 0\n\
    beq _08024C38\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0x1\n\
    str r0, [sp]\n\
    movs r0, 0xB\n\
    movs r1, 0\n\
    movs r2, 0x1D\n\
    movs r3, 0x7\n\
    bl sub_802BBD4\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
    b _08024C38\n\
    .align 2, 0\n\
_08024C2C: .4byte gMain\n\
_08024C30:\n\
    ldr r1, _08024C48 @ =gBattlescriptCurrInstr\n\
    ldr r0, [r1]\n\
    adds r0, 0x1\n\
    str r0, [r1]\n\
_08024C38:\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08024C48: .4byte gBattlescriptCurrInstr\n\
        .syntax divided");
}

#endif // NONMATCHING

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
        hp_switchout = ewram160BCarr(GetBattlerSide(opposing_bank)); //gBattleStruct->HP_OnSwitchout[GetBattlerSide(opposing_bank)];
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
    gBankInMenu = gBattlerAttacker;
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

            choiced_move = CHOICED_MOVE(gActiveBattler);
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
    u16 r7 = ewram160ACarr2(0, gBattlerAttacker) | (ewram160ACarr2(1, gBattlerAttacker) << 8);
    u16 r6 = ewram16100arr2(0, gBattlerAttacker) | (ewram16100arr2(1, gBattlerAttacker) << 8);
    u16 r5 = ewram16100arr2(2, gBattlerAttacker) | (ewram16100arr2(3, gBattlerAttacker) << 8);

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
    if (gBattleWeather & WEATHER_RAIN_ANY)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
    }
    else
    {
        gBattleWeather = WEATHER_RAIN_TEMPORARY;
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
    ewram160E0(0) = 0xFD;
    ewram160E0(1) = 1;
    ewram160E0(2) = 1;
    ewram160E0(3) = 1;
    ewram160E0(4) = 0;
    ewram160E0(5) = 0xFF;
    gBattlescriptCurrInstr++;
}

static bool8 sub_80264C0(void)
{
    if (gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
    {
        ewram16064arr(gBattlerTarget) = gBattlerPartyIndexes[gBattlerTarget];
    }
    else
    {
        u16 random = Random() & 0xFF;
        if ((u32)((random * (gBattleMons[gBattlerAttacker].level + gBattleMons[gBattlerTarget].level) >> 8) + 1) <= (gBattleMons[gBattlerTarget].level / 4))
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
            return 0;
        }
        ewram16064arr(gBattlerTarget) = gBattlerPartyIndexes[gBattlerTarget];
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
            ewram16068arr(gBattlerTarget) = i;
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
    if (gBattleWeather & WEATHER_SANDSTORM_ANY)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
    }
    else
    {
        gBattleWeather = WEATHER_SANDSTORM_TEMPORARY;
        gBattleCommunication[MULTISTRING_CHOOSER] = 3;
        gWishFutureKnock.weatherDuration = 5;
    }
    gBattlescriptCurrInstr++;
}

static void atk96_weatherdamage(void)
{
    if (WEATHER_HAS_EFFECT)
    {
        if (gBattleWeather & WEATHER_SANDSTORM_ANY)
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
        if (gBattleWeather & WEATHER_HAIL)
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
            gBattleMons[gBattlerTarget].status2 |=  (gBitTable[gBattlerAttacker] << 16);
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

#if DEBUG
NAKED
static void atk9E_metronome(void)
{
    asm("\
	push	{r4, r5, r6, r7, lr}\n\
	mov	r7, r8\n\
	push	{r7}\n\
	ldr	r6, ._3076      @ gBattlerAttacker\n\
	ldrb	r2, [r6]\n\
	lsl	r1, r2, #0x1\n\
	ldr	r0, ._3076 + 4  @ \n\
	add	r3, r1, r0\n\
	ldr	r5, ._3076 + 8  @ \n\
	mov	r4, #0x58\n\
	add	r0, r2, #0\n\
	mul	r0, r0, r4\n\
	add	r1, r0, r5\n\
	ldrh	r0, [r1, #0xe]\n\
	cmp	r0, #0\n\
	bne	._3071	@cond_branch\n\
	ldrh	r2, [r1, #0x10]\n\
	cmp	r2, #0\n\
	beq	._3071	@cond_branch\n\
	ldrh	r0, [r1, #0x12]\n\
	cmp	r0, #0\n\
	beq	._3071	@cond_branch\n\
	ldrh	r0, [r3]\n\
	cmp	r0, #0\n\
	bne	._3072	@cond_branch\n\
	strh	r2, [r3]\n\
._3072:\n\
	ldr	r1, ._3076 + 12 @ \n\
	ldrh	r0, [r3]\n\
	strh	r0, [r1]\n\
	ldrb	r0, [r6]\n\
	mul	r0, r0, r4\n\
	add	r0, r0, r5\n\
	ldrh	r5, [r0, #0x10]\n\
	ldrh	r2, [r0, #0x12]\n\
	add	r7, r1, #0\n\
	cmp	r5, r2\n\
	bcs	._3073	@cond_branch\n\
	ldrh	r0, [r3]\n\
	cmp	r0, r2\n\
	beq	._3074	@cond_branch\n\
	add	r0, r0, #0x1\n\
	b	._3079\n\
._3077:\n\
	.align	2, 0\n\
._3076:\n\
	.word	gBattlerAttacker\n\
	.word	+0x20160b4\n\
	.word	gBattleMons\n\
	.word	gCurrentMove\n\
._3073:\n\
	ldrh	r4, [r3]\n\
	add	r1, r4, #0\n\
	mov	r0, #0xb1\n\
	lsl	r0, r0, #0x1\n\
	cmp	r1, r0\n\
	bne	._3078	@cond_branch\n\
	mov	r0, #0x1\n\
	b	._3079\n\
._3078:\n\
	cmp	r1, r2\n\
	bne	._3080	@cond_branch\n\
._3074:\n\
	strh	r5, [r3]\n\
	b	._3081\n\
._3080:\n\
	add	r0, r4, #1\n\
._3079:\n\
	strh	r0, [r3]\n\
._3081:\n\
	ldr	r4, ._3083      @ gHitMarker\n\
	ldr	r2, [r4]\n\
	ldr	r0, ._3083 + 4  @ 0xfffffbff\n\
	and	r2, r2, r0\n\
	str	r2, [r4]\n\
	ldr	r6, ._3083 + 8  @ gBattlescriptCurrInstr\n\
	ldr	r5, ._3083 + 12 @ gBattleScriptsForMoveEffects\n\
	ldr	r3, ._3083 + 16 @ gBattleMoves\n\
	ldrh	r1, [r7]\n\
	lsl	r0, r1, #0x1\n\
	add	r0, r0, r1\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r3\n\
	ldrb	r0, [r0]\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r5\n\
	ldr	r0, [r0]\n\
	str	r0, [r6]\n\
	mov	r0, #0x80\n\
	lsl	r0, r0, #0x4\n\
	orr	r2, r2, r0\n\
	str	r2, [r4]\n\
	ldrh	r0, [r7]\n\
	b	._3082\n\
._3084:\n\
	.align	2, 0\n\
._3083:\n\
	.word	gHitMarker\n\
	.word	0xfffffbff\n\
	.word	gBattlescriptCurrInstr\n\
	.word	gBattleScriptsForMoveEffects\n\
	.word	gBattleMoves\n\
._3071:\n\
	ldr	r7, ._3090      @ gCurrentMove\n\
	mov	r6, #0xb1\n\
	lsl	r6, r6, #0x1\n\
	ldr	r5, ._3090 + 4  @ sMovesForbiddenToCopy\n\
	ldr	r0, ._3090 + 8  @ gBattlescriptCurrInstr\n\
	mov	r8, r0\n\
._3089:\n\
	bl	Random\n\
	ldr	r2, ._3090 + 12 @ 0x1ff\n\
	add	r1, r2, #0\n\
	and	r0, r0, r1\n\
	add	r0, r0, #0x1\n\
	strh	r0, [r7]\n\
	cmp	r0, r6\n\
	bhi	._3089	@cond_branch\n\
	mov	r0, #0x3\n\
._3086:\n\
	sub	r0, r0, #0x1\n\
	cmp	r0, #0\n\
	bge	._3086	@cond_branch\n\
	ldr	r4, ._3090      @ gCurrentMove\n\
	ldrh	r2, [r4]\n\
	ldr	r3, ._3090 + 16 @ 0xffff\n\
	sub	r0, r5, #2\n\
._3088:\n\
	add	r0, r0, #0x2\n\
	ldrh	r1, [r0]\n\
	cmp	r1, r2\n\
	beq	._3087	@cond_branch\n\
	cmp	r1, r3\n\
	bne	._3088	@cond_branch\n\
._3087:\n\
	ldr	r0, ._3090 + 16 @ 0xffff\n\
	cmp	r1, r0\n\
	bne	._3089	@cond_branch\n\
	ldr	r2, ._3090 + 20 @ gHitMarker\n\
	ldr	r0, [r2]\n\
	ldr	r1, ._3090 + 24 @ 0xfffffbff\n\
	and	r0, r0, r1\n\
	str	r0, [r2]\n\
	ldr	r3, ._3090 + 28 @ gBattleScriptsForMoveEffects\n\
	ldr	r2, ._3090 + 32 @ gBattleMoves\n\
	ldrh	r1, [r4]\n\
	lsl	r0, r1, #0x1\n\
	add	r0, r0, r1\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r2\n\
	ldrb	r0, [r0]\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r3\n\
	ldr	r0, [r0]\n\
	mov	r1, r8\n\
	str	r0, [r1]\n\
	ldrh	r0, [r4]\n\
._3082:\n\
	mov	r1, #0x0\n\
	bl	GetMoveTarget\n\
	ldr	r1, ._3090 + 36 @ gBattlerTarget\n\
	strb	r0, [r1]\n\
	pop	{r3}\n\
	mov	r8, r3\n\
	pop	{r4, r5, r6, r7}\n\
	pop	{r0}\n\
	bx	r0\n\
._3091:\n\
	.align	2, 0\n\
._3090:\n\
	.word	gCurrentMove\n\
	.word	sMovesForbiddenToCopy\n\
	.word	gBattlescriptCurrInstr\n\
	.word	0x1ff\n\
	.word	0xffff\n\
	.word	gHitMarker\n\
	.word	0xfffffbff\n\
	.word	gBattleScriptsForMoveEffects\n\
	.word	gBattleMoves\n\
	.word	gBattlerTarget");
}
#else
static void atk9E_metronome(void)
{
    while (1)
    {
        s32 i;

        gCurrentMove = (Random() & 0x1FF) + 1;
        if (gCurrentMove >= 355)
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
#endif

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
        gBattleStruct->unk16014 = sBYTE0_32(to_store);
        gBattleStruct->unk16015 = sBYTE1_32(to_store);
        gBattleStruct->unk16016 = sBYTE2_32(to_store);
        gBattleStruct->unk16017 = sBYTE3_32(to_store);

        gBattleMoveDamage = gBattleMons[gBattlerAttacker].hp - hp_diff;
        gSpecialStatuses[gBattlerTarget].dmg = 0xFFFF;

        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

#ifdef NONMATCHING
static void atkA6_settypetorandomresistance(void)
{
    if (gLastLandedMoves[gBattlerAttacker] == 0 || gLastLandedMoves[gBattlerAttacker] == 0xFFFF || (IsTwoTurnsMove(gLastLandedMoves[gBattlerAttacker]) && !gProtectStructs[gBattlerAttacker].physicalDmg && !gProtectStructs[gBattlerAttacker].specialDmg))
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
    {
        int type = 0, rands = 0;
        do
        {
            while (((type = (Random() & 0x7F)) > 0x70));
            type *= 3;
            if (gTypeEffectiveness[type] == gLastHitByType[gBattlerAttacker] && gTypeEffectiveness[type + 2] <= 5 && gBattleMons[gBattlerAttacker].type1 != gTypeEffectiveness[type + 1] && gBattleMons[gBattlerAttacker].type2 != gTypeEffectiveness[type + 1])
            {
                gBattleMons[gBattlerAttacker].type1 = type;
                gBattleMons[gBattlerAttacker].type2 = type;
                gBattleTextBuff1[0] = 0xFD;
                gBattleTextBuff1[1] = 3;
                gBattleTextBuff1[2] = type;
                gBattleTextBuff1[3] = 0xFF;
                gBattlescriptCurrInstr += 5;
                return;
            }
            rands++;
        } while (rands <= 999);

        type = 0, rands = 0;
        do
        {
            if (gTypeEffectiveness[type] == 0xFE || gTypeEffectiveness[type] != 0xFF)
            {
                if (gTypeEffectiveness[type] == gLastHitByType[gBattlerAttacker] && gTypeEffectiveness[type + 2] <= 5 && gBattleMons[gBattlerAttacker].type1 != gTypeEffectiveness[type + 1] && gBattleMons[gBattlerAttacker].type2 != gTypeEffectiveness[type + 1])
                {
                    gBattleMons[gBattlerAttacker].type1 = gTypeEffectiveness[rands + 1];
                    gBattleMons[gBattlerAttacker].type2 = gTypeEffectiveness[rands + 1];
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 3;
                    gBattleTextBuff1[2] = gTypeEffectiveness[rands + 1];
                    gBattleTextBuff1[3] = 0xFF;
                    gBattlescriptCurrInstr += 5;
                    return;
                }
            }
            type += 3, rands += 3;
        } while (rands < 336);

        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

#else
NAKED
static void atkA6_settypetorandomresistance(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    ldr r1, _08027FA8 @ =gLastLandedMoves\n\
    ldr r4, _08027FAC @ =gBattlerAttacker\n\
    ldrb r0, [r4]\n\
    lsls r0, 1\n\
    adds r2, r0, r1\n\
    ldrh r1, [r2]\n\
    cmp r1, 0\n\
    beq _08027F8C\n\
    ldr r0, _08027FB0 @ =0x0000ffff\n\
    cmp r1, r0\n\
    beq _08027F8C\n\
    ldrh r0, [r2]\n\
    bl IsTwoTurnsMove\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08028024\n\
    ldr r2, _08027FB4 @ =gProtectStructs\n\
    ldrb r0, [r4]\n\
    lsls r1, r0, 4\n\
    adds r0, r2, 0x4\n\
    adds r0, r1, r0\n\
    ldr r0, [r0]\n\
    cmp r0, 0\n\
    bne _08028024\n\
    adds r0, r2, 0\n\
    adds r0, 0x8\n\
    adds r0, r1, r0\n\
    ldr r0, [r0]\n\
    cmp r0, 0\n\
    bne _08028024\n\
_08027F8C:\n\
    ldr r3, _08027FB8 @ =gBattlescriptCurrInstr\n\
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
    b _08028110\n\
    .align 2, 0\n\
_08027FA8: .4byte gLastLandedMoves\n\
_08027FAC: .4byte gBattlerAttacker\n\
_08027FB0: .4byte 0x0000ffff\n\
_08027FB4: .4byte gProtectStructs\n\
_08027FB8: .4byte gBattlescriptCurrInstr\n\
_08027FBC:\n\
    mov r0, r12\n\
    strb r5, [r0]\n\
    mov r1, r10\n\
    ldrb r0, [r1]\n\
    muls r0, r2\n\
    adds r0, r7\n\
    adds r0, 0x22\n\
    strb r5, [r0]\n\
    ldr r1, _08027FE0 @ =gBattleTextBuff1\n\
    movs r0, 0xFD\n\
    strb r0, [r1]\n\
    movs r0, 0x3\n\
    strb r0, [r1, 0x1]\n\
    strb r5, [r1, 0x2]\n\
    movs r0, 0xFF\n\
    strb r0, [r1, 0x3]\n\
    ldr r1, _08027FE4 @ =gBattlescriptCurrInstr\n\
    b _08028012\n\
    .align 2, 0\n\
_08027FE0: .4byte gBattleTextBuff1\n\
_08027FE4: .4byte gBattlescriptCurrInstr\n\
_08027FE8:\n\
    mov r0, r8\n\
    adds r0, 0x1\n\
    adds r0, r3\n\
    ldrb r2, [r0]\n\
    strb r2, [r4]\n\
    mov r4, r10\n\
    ldrb r0, [r4]\n\
    muls r0, r6\n\
    ldr r7, _0802801C @ =gBattleMons\n\
    adds r0, r7\n\
    adds r0, 0x22\n\
    strb r2, [r0]\n\
    ldr r1, _08028020 @ =gBattleTextBuff1\n\
    movs r0, 0xFD\n\
    strb r0, [r1]\n\
    movs r0, 0x3\n\
    strb r0, [r1, 0x1]\n\
    strb r2, [r1, 0x2]\n\
    movs r0, 0xFF\n\
    strb r0, [r1, 0x3]\n\
    mov r1, r12\n\
_08028012:\n\
    ldr r0, [r1]\n\
    adds r0, 0x5\n\
    str r0, [r1]\n\
    b _08028110\n\
    .align 2, 0\n\
_0802801C: .4byte gBattleMons\n\
_08028020: .4byte gBattleTextBuff1\n\
_08028024:\n\
    movs r4, 0\n\
    mov r8, r4\n\
    movs r7, 0x7F\n\
    mov r9, r7\n\
_0802802C:\n\
    bl Random\n\
    mov r4, r9\n\
    ands r4, r0\n\
    cmp r4, 0x70\n\
    bhi _0802802C\n\
    lsls r0, r4, 1\n\
    adds r4, r0, r4\n\
    ldr r6, _08028120 @ =gTypeEffectiveness\n\
    adds r3, r4, r6\n\
    ldr r1, _08028124 @ =gLastHitByType\n\
    ldr r2, _08028128 @ =gBattlerAttacker\n\
    ldrb r5, [r2]\n\
    lsls r0, r5, 1\n\
    adds r0, r1\n\
    ldrb r1, [r3]\n\
    mov r10, r2\n\
    ldrh r0, [r0]\n\
    cmp r1, r0\n\
    bne _08028088\n\
    adds r0, r4, 0x2\n\
    adds r0, r6\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x5\n\
    bhi _08028088\n\
    ldr r7, _0802812C @ =gBattleMons\n\
    movs r2, 0x58\n\
    adds r0, r5, 0\n\
    muls r0, r2\n\
    adds r3, r0, r7\n\
    movs r0, 0x21\n\
    adds r0, r3\n\
    mov r12, r0\n\
    adds r0, r4, 0x1\n\
    adds r0, r6\n\
    ldrb r5, [r0]\n\
    mov r1, r12\n\
    ldrb r0, [r1]\n\
    adds r1, r5, 0\n\
    cmp r0, r1\n\
    beq _08028088\n\
    adds r0, r3, 0\n\
    adds r0, 0x22\n\
    ldrb r0, [r0]\n\
    cmp r0, r1\n\
    bne _08027FBC\n\
_08028088:\n\
    movs r7, 0x1\n\
    add r8, r7\n\
    ldr r0, _08028130 @ =0x000003e7\n\
    cmp r8, r0\n\
    ble _0802802C\n\
    movs r0, 0\n\
    mov r8, r0\n\
    ldr r1, _08028134 @ =gBattlescriptCurrInstr\n\
    mov r12, r1\n\
    ldr r3, _08028120 @ =gTypeEffectiveness\n\
    adds r0, r4, 0x1\n\
    adds r0, r3\n\
    mov r9, r0\n\
    adds r5, r3, 0\n\
_080280A4:\n\
    ldrb r1, [r5]\n\
    cmp r1, 0xFF\n\
    bgt _080280AE\n\
    cmp r1, 0xFE\n\
    bge _080280E8\n\
_080280AE:\n\
    mov r4, r10\n\
    ldrb r2, [r4]\n\
    lsls r0, r2, 1\n\
    ldr r7, _08028124 @ =gLastHitByType\n\
    adds r0, r7\n\
    ldrh r0, [r0]\n\
    cmp r1, r0\n\
    bne _080280E8\n\
    ldrb r0, [r5, 0x2]\n\
    cmp r0, 0x5\n\
    bhi _080280E8\n\
    movs r6, 0x58\n\
    adds r0, r2, 0\n\
    muls r0, r6\n\
    ldr r1, _0802812C @ =gBattleMons\n\
    adds r2, r0, r1\n\
    adds r4, r2, 0\n\
    adds r4, 0x21\n\
    ldrb r0, [r4]\n\
    mov r7, r9\n\
    ldrb r1, [r7]\n\
    cmp r0, r1\n\
    beq _080280E8\n\
    adds r0, r2, 0\n\
    adds r0, 0x22\n\
    ldrb r0, [r0]\n\
    cmp r0, r1\n\
    beq _080280E8\n\
    b _08027FE8\n\
_080280E8:\n\
    adds r5, 0x3\n\
    movs r0, 0x3\n\
    add r8, r0\n\
    ldr r0, _08028138 @ =0x0000014f\n\
    cmp r8, r0\n\
    bls _080280A4\n\
    mov r1, r12\n\
    ldr r2, [r1]\n\
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
    mov r4, r12\n\
    str r1, [r4]\n\
_08028110:\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08028120: .4byte gTypeEffectiveness\n\
_08028124: .4byte gLastHitByType\n\
_08028128: .4byte gBattlerAttacker\n\
_0802812C: .4byte gBattleMons\n\
_08028130: .4byte 0x000003e7\n\
_08028134: .4byte gBattlescriptCurrInstr\n\
_08028138: .4byte 0x0000014f\n\
        .syntax divided");
}
#endif // NONMATCHING

static void atkA7_setalwayshitflag(void)
{
    gStatuses3[gBattlerTarget] &= ~(STATUS3_ALWAYS_HITS);
    gStatuses3[gBattlerTarget] |= 0x10;
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
    if (gBattleMoves[move].effect == EFFECT_SOLARBEAM && (gBattleWeather & WEATHER_SUN_ANY))
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

    if (gActionForBanks[gBattlerTarget] == 0 && gBattlerAttacker == ewram16010arr(gBattlerTarget) && !(gBattleMons[gBattlerTarget].status1 & (STATUS1_SLEEP | STATUS1_FREEZE))
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
    if (gBattleWeather & WEATHER_SUN_ANY)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
    }
    else
    {
        gBattleWeather = WEATHER_SUN_TEMPORARY;
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
        gBattlerTarget = ewram16020arr(gBattlerAttacker);
        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 2;
        gBattleTextBuff1[2] = ewram16004arr(0, gBattlerAttacker);
        gBattleTextBuff1[3] = ewram16004arr(1, gBattlerAttacker);
        gBattleTextBuff1[4] = 0xFF;
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
        else if (gBattleWeather & WEATHER_SUN_ANY)
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
            gBattleTextBuff1[0] = 0xFD;
            gBattleTextBuff1[1] = 4;
            gBattleTextBuff1[2] = gBattlerAttacker;
            gBattleTextBuff1[3] = gBattleCommunication[0];
            gBattleTextBuff1[4] = 0xFF;
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
    if (gBattleWeather & WEATHER_HAIL)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
    }
    else
    {
        gBattleWeather = WEATHER_HAIL;
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

            newItemAtk = (u16 *)(ewram160F0 + 2 * gBattlerAttacker);
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

            ewram160E8arr2(0, gBattlerTarget) = 0;
            ewram160E8arr2(1, gBattlerTarget) = 0;
            ewram160E8arr2(0, gBattlerAttacker) = 0;
            ewram160E8arr2(1, gBattlerAttacker) = 0;

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
        gBattleTextBuff1[0] = 0xFD;
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
        gStatuses3[gBattlerTarget] |= 0x1000;
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

    gBattleStruct->scriptingActive = ewram160DD;
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
        BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, gBitTable[ewram16064arr(gActiveBattler)], 4, &gBattleMons[gActiveBattler].status1);
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
        if (gBattleWeather & WEATHER_RAIN_ANY)
            gBattleStruct->dynamicMoveType = TYPE_WATER | 0x80;
        else if (gBattleWeather & WEATHER_SANDSTORM_ANY)
            gBattleStruct->dynamicMoveType = TYPE_ROCK | 0x80;
        else if (gBattleWeather & WEATHER_SUN_ANY)
            gBattleStruct->dynamicMoveType = TYPE_FIRE | 0x80;
        else if (gBattleWeather & WEATHER_HAIL)
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
    used_item = USED_HELD_ITEM(gActiveBattler);
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
                gBattleResults.unk5_1 = 1;
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

NAKED
void sub_802BBD4(u8 r0, u8 r1, u8 r2, u8 r3, u8 sp0)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    ldr r4, [sp, 0x20]\n\
    lsls r0, 24\n\
    lsrs r6, r0, 24\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    mov r12, r1\n\
    lsls r2, 24\n\
    lsrs r5, r2, 24\n\
    lsls r3, 24\n\
    lsrs r7, r3, 24\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    mov r8, r4\n\
    mov r2, r12\n\
    cmp r2, r7\n\
    bgt _0802BC5A\n\
    lsls r1, r6, 1\n\
    ldr r0, _0802BC20 @ =0x0600c000\n\
    adds r1, r0\n\
    mov r9, r1\n\
_0802BC06:\n\
    adds r1, r6, 0\n\
    adds r0, r2, 0x1\n\
    mov r10, r0\n\
    cmp r1, r5\n\
    bgt _0802BC54\n\
    lsls r0, r2, 6\n\
    mov r4, r9\n\
    adds r3, r4, r0\n\
_0802BC16:\n\
    cmp r2, r12\n\
    bne _0802BC28\n\
    ldr r0, _0802BC24 @ =0x00001022\n\
    b _0802BC36\n\
    .align 2, 0\n\
_0802BC20: .4byte 0x0600c000\n\
_0802BC24: .4byte 0x00001022\n\
_0802BC28:\n\
    cmp r2, r7\n\
    bne _0802BC34\n\
    ldr r0, _0802BC30 @ =0x00001028\n\
    b _0802BC36\n\
    .align 2, 0\n\
_0802BC30: .4byte 0x00001028\n\
_0802BC34:\n\
    ldr r0, _0802BC68 @ =0x00001025\n\
_0802BC36:\n\
    cmp r1, r6\n\
    beq _0802BC42\n\
    adds r0, 0x1\n\
    cmp r1, r5\n\
    bne _0802BC42\n\
    adds r0, 0x1\n\
_0802BC42:\n\
    mov r4, r8\n\
    cmp r4, 0\n\
    beq _0802BC4A\n\
    movs r0, 0\n\
_0802BC4A:\n\
    strh r0, [r3]\n\
    adds r3, 0x2\n\
    adds r1, 0x1\n\
    cmp r1, r5\n\
    ble _0802BC16\n\
_0802BC54:\n\
    mov r2, r10\n\
    cmp r2, r7\n\
    ble _0802BC06\n\
_0802BC5A:\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0802BC68: .4byte 0x00001025\n\
        .syntax divided");
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
        if (gMain.newKeys & DPAD_UP && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (gMain.newKeys & DPAD_DOWN && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (gMain.newKeys & A_BUTTON)
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
        else if (gMain.newKeys & B_BUTTON)
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
