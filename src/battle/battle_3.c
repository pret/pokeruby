#include "global.h"
#include "constants/abilities.h"
#include "battle.h"
#include "constants/moves.h"
#include "item.h"
#include "constants/items.h"
#include "event_data.h"
#include "constants/hold_effects.h"
#include "constants/species.h"
#include "constants/weather.h"
#include "pokemon.h"
#include "data2.h"
#include "random.h"
#include "text.h"
#include "constants/battle_move_effects.h"
#include "string_util.h"
#include "constants/flags.h"
#include "ewram.h"

extern u8* gBattlescriptCurrInstr;
extern u8 gActiveBank;
extern u8 gBattleBufferB[4][0x200];
extern u8* gUnknown_02024C1C[4]; //battlescript location when you try to choose a move you're not allowed to
extern u16 gLastUsedMove[4];
extern struct BattlePokemon gBattleMons[4];
extern struct BattleEnigmaBerry gEnigmaBerries[4];
extern u8 gStringBank;
extern u16 gLastUsedItem;
extern u16 gCurrentMove;
extern const u32 gBitTable[];
extern u16 gBattleTypeFlags;
extern u8 gNoOfAllBanks;
extern u32 gStatuses3[4];
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u8 gTurnOrder[4];
extern u16 gSideAffecting[2];
extern u16 gBattleWeather;
extern void (*gBattleMainFunc)(void);
extern u8 gAbsentBankFlags;
extern u8 gBattleCommunication[];
extern u32 gHitMarker;
extern u8 gEffectBank;
extern u8 gBank1;
extern s32 gBattleMoveDamage;
extern u16 gBattlePartyID[4];
extern u16 gChosenMovesByBanks[4];
extern s32 gTakenDmg[4];
extern u8 gTakenDmgBanks[4];
extern u8 gBattleMoveFlags;
extern u8 gLastUsedAbility;
extern u8 gBattleTextBuff2[];
extern u8 gCurrentActionFuncId;
extern struct BattleEnigmaBerry gEnigmaBerries[4];
extern u8 gUnknown_02024BE5;
extern u8 gCurrMovePos;
extern u16 gRandomMove;
extern s32 gBattleMoveDamage;
extern u16 gDynamicBasePower;
extern u32 gBattleExecBuffer;
extern const u16 gSoundMovesTable[];
extern const u8 gStatusConditionString_PoisonJpn[];
extern const u8 gStatusConditionString_SleepJpn[];
extern const u8 gStatusConditionString_ParalysisJpn[];
extern const u8 gStatusConditionString_BurnJpn[];
extern const u8 gStatusConditionString_IceJpn[];
extern const u8 gStatusConditionString_ConfusionJpn[];
extern const u8 gStatusConditionString_LoveJpn[];
extern const BattleCmdFunc gBattleScriptingCommandsTable[];

u8 IsImprisoned(u8 bank, u16 move);
u8 GetBankByIdentity(u8 ID);
u8 GetBankIdentity(u8 bank);
u8 GetBankSide(u8 bank);
void b_call_bc_move_exec(u8* BS_ptr);
bool8 sub_8015660(u8 bank); //check if a move failed
void SetMoveEffect(bool8 primary, u8 certainArg);
bool8 UproarWakeUpCheck(u8 bank);
bool8 sub_8018018(u8 bank, u8, u8);
void sub_8015740(u8 bank);
s32 CalculateBaseDamage(struct BattlePokemon *attacker, struct BattlePokemon *defender, u32 move, u16 a4, u16 powerOverride, u8 typeOverride, u8 bank_atk, u8 bank_def);
u8 CountTrailingZeroBits(u32 a);
u8 GetMoveTarget(u16 move, u8 useMoveTarget);
u8 sub_803FC34(u8 bank);
u16 sub_803FBFC(u8 a);
u8 weather_get_current(void);
void b_push_move_exec(u8* BS_ptr);
void RecordAbilityBattle(u8 bank, u8 ability);
void RecordItemBattle(u8 bank, u8 holdEffect);
void sub_8013F54(void);
void sub_8013FBC(void);
s8 GetPokeFlavourRelation(u32 pid, u8 flavor);

extern u8 BattleScript_MoveSelectionDisabledMove[];
extern u8 BattleScript_MoveSelectionTormented[];
extern u8 BattleScript_MoveSelectionTaunted[];
extern u8 BattleScript_MoveSelectionImprisoned[];
extern u8 BattleScript_MoveSelectionChoiceBanded[];
extern u8 BattleScript_MoveSelectionNoPP[];
extern u8 BattleScript_NoMovesLeft[];
extern u8 BattleScript_WishComesTrue[];
extern u8 BattleScript_IngrainTurnHeal[];
extern u8 BattleScript_LeechSeedTurnDrain[];
extern u8 BattleScript_PoisonTurnDmg[];
extern u8 BattleScript_BurnTurnDmg[];
extern u8 BattleScript_NightmareTurnDmg[];
extern u8 BattleScript_CurseTurnDmg[];
extern u8 BattleScript_WrapTurnDmg[];
extern u8 BattleScript_WrapEnds[];
extern u8 BattleScript_DisabledNoMore[];
extern u8 BattleScript_EncoredNoMore[];

extern u8 BattleScript_SideStatusWoreOff[];
extern u8 BattleScript_RainContinuesOrEnds[];
extern u8 BattleScript_SandStormHailEnds[];
extern u8 BattleScript_DamagingWeatherContinues[];
extern u8 BattleScript_SunlightFaded[];
extern u8 BattleScript_SunlightContinues[];
extern u8 BattleScript_SafeguardEnds[];
extern u8 BattleScript_MonWokeUpInUproar[]; //uproar wakeup BS
extern u8 BattleScript_PrintUproarOverTurns[]; //uproar BS
extern u8 BattleScript_ThrashConfuses[];
extern u8 BattleScript_YawnMakesAsleep[];
extern u8 BattleScript_MonTookFutureAttack[];
extern u8 BattleScript_PerishSongHits[];
extern u8 BattleScript_PerishSongTimerGoesDown[];
extern u8 BattleScript_GiveExp[];
extern u8 BattleScript_HandleFaintedMon[];

extern u8 BattleScript_MoveUsedIsAsleep[];
extern u8 BattleScript_MoveUsedWokeUp[];
extern u8 BattleScript_MoveUsedIsFrozen[];
extern u8 BattleScript_MoveUsedUnfroze[];
extern u8 BattleScript_MoveUsedLoafingAround[];
extern u8 BattleScript_MoveUsedMustRecharge[];
extern u8 BattleScript_MoveUsedFlinched[];
extern u8 BattleScript_MoveUsedIsDisabled[];
extern u8 BattleScript_MoveUsedIsTaunted[];
extern u8 BattleScript_MoveUsedIsImprisoned[];
extern u8 BattleScript_MoveUsedIsConfused[];
extern u8 BattleScript_MoveUsedIsConfusedNoMore[];
extern u8 BattleScript_MoveUsedIsParalyzed[];
extern u8 BattleScript_MoveUsedIsParalyzedCantAttack[];
extern u8 BattleScript_MoveUsedIsInLove[];
extern u8 BattleScript_BideStoringEnergy[];
extern u8 BattleScript_BideAttack[];
extern u8 BattleScript_BideNoEnergyToAttack[];

extern u8 BattleScript_OverworldWeatherStarts[]; //load weather from overworld
extern u8 BattleScript_DrizzleActivates[];
extern u8 BattleScript_SandstreamActivates[];
extern u8 BattleScript_DroughtActivates[];
extern u8 BattleScript_CastformChange[];
extern u8 BattleScript_RainDishActivates[];
extern u8 BattleScript_ShedSkinActivates[];
extern u8 BattleScript_SpeedBoostActivates[];
extern u8 BattleScript_SoundproofProtected[];
extern u8 BattleScript_MoveHPDrain[];
extern u8 BattleScript_MoveHPDrain_PPLoss[];
extern u8 BattleScript_FlashFireBoost[];
extern u8 BattleScript_FlashFireBoost_PPLoss[];
extern u8 BattleScript_MoveHPDrain_FullHP[];
extern u8 BattleScript_MoveHPDrain_FullHP_PPLoss[];
extern u8 BattleScript_ColorChangeActivates[];
extern u8 BattleScript_RoughSkinActivates[];
extern u8 BattleScript_ApplySecondaryEffect[];
extern u8 BattleScript_CuteCharmActivates[];
extern u8 BattleScript_AbilityCuredStatus[]; //ability status clear
extern u8 BattleScript_SynchronizeActivates[];
extern u8 gUnknown_081D978C[]; //intimidate1
extern u8 gUnknown_081D9795[]; //intimidate2
extern u8 BattleScript_TraceActivates[];

extern u8 BattleScript_WhiteHerbEnd2[];
extern u8 BattleScript_WhiteHerbRet[];
extern u8 BattleScript_ItemHealHP_RemoveItem[];
extern u8 BattleScript_BerryPPHealEnd2[];
extern u8 BattleScript_ItemHealHP_End2[];
extern u8 BattleScript_BerryConfuseHealEnd2[];
extern u8 BattleScript_BerryStatRaiseEnd2[];
extern u8 BattleScript_BerryFocusEnergyEnd2[];
extern u8 BattleScript_BerryCurePrlzEnd2[];
extern u8 BattleScript_BerryCurePsnEnd2[];
extern u8 BattleScript_BerryCureBrnEnd2[];
extern u8 BattleScript_BerryCureFrzEnd2[];
extern u8 BattleScript_BerryCureSlpEnd2[];
extern u8 BattleScript_BerryCureConfusionEnd2[];
extern u8 BattleScript_BerryCureChosenStatusEnd2[]; //berry cure any status end2
extern u8 BattleScript_BerryCureParRet[];
extern u8 BattleScript_BerryCurePsnRet[];
extern u8 BattleScript_BerryCureBrnRet[];
extern u8 BattleScript_BerryCureFrzRet[];
extern u8 BattleScript_BerryCureSlpRet[];
extern u8 BattleScript_BerryCureConfusionRet[];
extern u8 BattleScript_BerryCureChosenStatusRet[]; //berry cure any status return

extern u8 BattleScript_ItemHealHP_Ret[];

extern u8 gUnknown_081D995F[]; //disobedient while asleep
extern u8 BattleScript_IgnoresAndUsesRandomMove[]; //disobedient, uses a random move
extern u8 BattleScript_IgnoresAndFallsAsleep[]; //disobedient, went to sleep
extern u8 gUnknown_081D99A0[]; //disobedient, hits itself

//array entries for battle communication
#define MOVE_EFFECT_BYTE    0x3
#define MULTISTRING_CHOOSER 0x5
#define MSG_DISPLAY         0x7

void b_movescr_stack_push(u8* BS_ptr)
{
    B_BATTLESCRIPTS_STACK->ptr[B_BATTLESCRIPTS_STACK->size++] = BS_ptr;
}

void b_movescr_stack_push_cursor(void)
{
    B_BATTLESCRIPTS_STACK->ptr[B_BATTLESCRIPTS_STACK->size++] = gBattlescriptCurrInstr;
}

void b_movescr_stack_pop_cursor(void)
{
    gBattlescriptCurrInstr = B_BATTLESCRIPTS_STACK->ptr[--B_BATTLESCRIPTS_STACK->size];
}

u8 sub_8015894(void) //msg can't select a move
{
    u8 limitations = 0;
    u16 move = gBattleMons[gActiveBank].moves[gBattleBufferB[gActiveBank][2]];
    u8 holdEffect;
    u16* choicedMove = CHOICED_MOVE(gActiveBank);
    if (gDisableStructs[gActiveBank].disabledMove == move && move)
    {
        BATTLE_STRUCT->scriptingActive = gActiveBank;
        gCurrentMove = move;
        gUnknown_02024C1C[gActiveBank] = BattleScript_MoveSelectionDisabledMove;
        limitations++;
    }
    if (move == gLastUsedMove[gActiveBank] && move != MOVE_STRUGGLE && gBattleMons[gActiveBank].status2 & STATUS2_TORMENT)
    {
        CancelMultiTurnMoves(gActiveBank);
        gUnknown_02024C1C[gActiveBank] = BattleScript_MoveSelectionTormented;
        limitations++;
    }
    if (gDisableStructs[gActiveBank].tauntTimer1 && gBattleMoves[move].power == 0)
    {
        gCurrentMove = move;
        gUnknown_02024C1C[gActiveBank] = BattleScript_MoveSelectionTaunted;
        limitations++;
    }
    if (IsImprisoned(gActiveBank, move))
    {
        gCurrentMove = move;
        gUnknown_02024C1C[gActiveBank] = BattleScript_MoveSelectionImprisoned;
        limitations++;
    }
    if (gBattleMons[gActiveBank].item == ITEM_ENIGMA_BERRY)
        holdEffect = gEnigmaBerries[gActiveBank].holdEffect;
    else
        holdEffect = ItemId_GetHoldEffect(gBattleMons[gActiveBank].item);
    gStringBank = gActiveBank;
    if (holdEffect == HOLD_EFFECT_CHOICE_BAND && *choicedMove != 0 && *choicedMove != 0xFFFF && *choicedMove != move)
    {
        gCurrentMove = *choicedMove;
        gLastUsedItem = gBattleMons[gActiveBank].item;
        gUnknown_02024C1C[gActiveBank] = BattleScript_MoveSelectionChoiceBanded;
        limitations++;
    }
    if (gBattleMons[gActiveBank].pp[gBattleBufferB[gActiveBank][2]] == 0)
    {
        gUnknown_02024C1C[gActiveBank] = BattleScript_MoveSelectionNoPP;
        limitations++;
    }
    return limitations;
}

#define MOVE_LIMITATION_ZEROMOVE    (1 << 0)
#define MOVE_LIMITATION_PP          (1 << 1)
#define MOVE_LIMITATION_DISABLED    (1 << 2)
#define MOVE_LIMITATION_TORMENTED   (1 << 3)
#define MOVE_LIMITATION_TAUNT       (1 << 4)
#define MOVE_LIMITATION_IMPRISION   (1 << 5)

u8 CheckMoveLimitations(u8 bank, u8 unusableMoves, u8 check)
{
    u8 holdEffect;
    u16* choicedMove = CHOICED_MOVE(bank);
    s32 i;
    if (gBattleMons[bank].item == ITEM_ENIGMA_BERRY)
        holdEffect = gEnigmaBerries[bank].holdEffect;
    else
        holdEffect = ItemId_GetHoldEffect(gBattleMons[bank].item);
    gStringBank = bank;
    for (i = 0; i < 4; i++)
    {
        if (gBattleMons[bank].moves[i] == 0 && check & MOVE_LIMITATION_ZEROMOVE)
            unusableMoves |= gBitTable[i];
        if (gBattleMons[bank].pp[i] == 0 && check & MOVE_LIMITATION_PP)
            unusableMoves |= gBitTable[i];
        if (gBattleMons[bank].moves[i] == gDisableStructs[bank].disabledMove && check & MOVE_LIMITATION_DISABLED)
            unusableMoves |= gBitTable[i];
        if (gBattleMons[bank].moves[i] == gLastUsedMove[bank] && check & MOVE_LIMITATION_TORMENTED && gBattleMons[bank].status2 & STATUS2_TORMENT)
            unusableMoves |= gBitTable[i];
        if (gDisableStructs[bank].tauntTimer1 && check & MOVE_LIMITATION_TAUNT && gBattleMoves[gBattleMons[bank].moves[i]].power == 0)
            unusableMoves |= gBitTable[i];
        if (IsImprisoned(bank, gBattleMons[bank].moves[i]) && check & MOVE_LIMITATION_IMPRISION)
            unusableMoves |= gBitTable[i];
        if (gDisableStructs[bank].encoreTimer1 && gDisableStructs[bank].encoredMove != gBattleMons[bank].moves[i])
            unusableMoves |= gBitTable[i];
        if (holdEffect == HOLD_EFFECT_CHOICE_BAND && *choicedMove != 0 && *choicedMove != 0xFFFF && *choicedMove != gBattleMons[bank].moves[i])
            unusableMoves |= gBitTable[i];
    }
    return unusableMoves;
}

bool8 AreAllMovesUnusable(void)
{
    u8 unusable;
    unusable = CheckMoveLimitations(gActiveBank, 0, 0xFF);
    if (unusable == 0xF) //all moves are unusable
    {
        gProtectStructs[gActiveBank].onlyStruggle = 1;
        gUnknown_02024C1C[gActiveBank] = BattleScript_NoMovesLeft;
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            gBattleBufferB[gActiveBank][3] = GetBankByIdentity((GetBankIdentity(gActiveBank) ^ 1) | (Random() & 2));
        else
            gBattleBufferB[gActiveBank][3] = GetBankByIdentity(GetBankIdentity(gActiveBank) ^ 1);
    }
    else
        gProtectStructs[gActiveBank].onlyStruggle = 0;
    return (unusable == 0xF);
}

u8 IsImprisoned(u8 bank, u16 move)
{
    u8 imprisionedMoves = 0;
    u8 bankSide = GetBankSide(bank);
    s32 i;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (bankSide != GetBankSide(i) && gStatuses3[i] & STATUS3_IMPRISIONED)
        {
            s32 j;
            for (j = 0; j < 4; j++)
            {
                if (move == gBattleMons[i].moves[j])
                    break;
            }
            if (j < 4)
                imprisionedMoves++;
        }
    }
    return imprisionedMoves;
}

u8 UpdateTurnCounters(void)
{
    u8 effect = 0;
    s32 i;

    for (gBankAttacker = 0; gBankAttacker < gNoOfAllBanks && gAbsentBankFlags & gBitTable[gBankAttacker]; gBankAttacker++)
    {
    }
    for (gBankTarget = 0; gBankTarget < gNoOfAllBanks && gAbsentBankFlags & gBitTable[gBankTarget]; gBankTarget++)
    {
    }

    do
    {
        u8 sideBank;

        switch (BATTLE_STRUCT->turncountersTracker)
        {
        case 0:
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                gTurnOrder[i] = i;
            }
            for (i = 0; i < gNoOfAllBanks - 1; i++)
            {
                s32 j;
                for (j = i + 1; j < gNoOfAllBanks; j++)
                {
                    if (GetWhoStrikesFirst(gTurnOrder[i], gTurnOrder[j], 0))
                        SwapTurnOrder(i, j);
                }
            }
            BATTLE_STRUCT->turncountersTracker++;
            BATTLE_STRUCT->turnSideTracker = 0;
        case 1:
            while (BATTLE_STRUCT->turnSideTracker < 2)
            {
                gActiveBank = gBankAttacker = sideBank = BATTLE_STRUCT->turnSideTracker;

                if (gSideAffecting[sideBank] & SIDE_STATUS_REFLECT)
                {
                    if (--gSideTimers[sideBank].reflectTimer == 0)
                    {

                        gSideAffecting[sideBank] &= ~SIDE_STATUS_REFLECT;
                        b_call_bc_move_exec(BattleScript_SideStatusWoreOff);
                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 2;
                        gBattleTextBuff1[2] = MOVE_REFLECT;
                        gBattleTextBuff1[3] = MOVE_REFLECT >> 8;
                        gBattleTextBuff1[4] = EOS;
                        effect++;
                    }
                }
                BATTLE_STRUCT->turnSideTracker++;
                if (effect)
                    break;
            }
            if (!effect)
            {
                BATTLE_STRUCT->turncountersTracker++;
                BATTLE_STRUCT->turnSideTracker = 0;
            }
            break;
        case 2:
            while (BATTLE_STRUCT->turnSideTracker < 2)
            {
                gActiveBank = gBankAttacker = sideBank = BATTLE_STRUCT->turnSideTracker;
                if (gSideAffecting[sideBank] & SIDE_STATUS_LIGHTSCREEN)
                {
                    if (--gSideTimers[sideBank].lightscreenTimer == 0)
                    {
                        gSideAffecting[sideBank] &= ~SIDE_STATUS_LIGHTSCREEN;
                        b_call_bc_move_exec(BattleScript_SideStatusWoreOff);
                        gBattleCommunication[MULTISTRING_CHOOSER] = sideBank;
                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 2;
                        gBattleTextBuff1[2] = MOVE_LIGHT_SCREEN;
                        gBattleTextBuff1[3] = MOVE_LIGHT_SCREEN >> 8;
                        gBattleTextBuff1[4] = EOS;
                        effect++;
                    }
                }
                BATTLE_STRUCT->turnSideTracker++;
                if (effect)
                    break;
            }
            if (!effect)
            {
                BATTLE_STRUCT->turncountersTracker++;
                BATTLE_STRUCT->turnSideTracker = 0;
            }
            break;
        case 3:
            while (BATTLE_STRUCT->turnSideTracker < 2)
            {
                gActiveBank = gBankAttacker = sideBank = BATTLE_STRUCT->turnSideTracker;
                if (gSideTimers[sideBank].mistTimer && --gSideTimers[sideBank].mistTimer == 0)
                {
                    gSideAffecting[sideBank] &= ~SIDE_STATUS_MIST;
                    b_call_bc_move_exec(BattleScript_SideStatusWoreOff);
                    gBattleCommunication[MULTISTRING_CHOOSER] = sideBank;
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 2;
                    gBattleTextBuff1[2] = MOVE_MIST;
                    gBattleTextBuff1[3] = MOVE_MIST >> 8;
                    gBattleTextBuff1[4] = EOS;
                    effect++;
                }
                BATTLE_STRUCT->turnSideTracker++;
                if (effect)
                    break;
            }
            if (!effect)
            {
                BATTLE_STRUCT->turncountersTracker++;
                BATTLE_STRUCT->turnSideTracker = 0;
            }
            break;
        case 4:
            while (BATTLE_STRUCT->turnSideTracker < 2)
            {
                gActiveBank = gBankAttacker = sideBank = BATTLE_STRUCT->turnSideTracker;
                if (gSideAffecting[sideBank] & SIDE_STATUS_SAFEGUARD)
                {
                    if (--gSideTimers[sideBank].safeguardTimer == 0)
                    {
                        gSideAffecting[sideBank] &= ~SIDE_STATUS_SAFEGUARD;
                        b_call_bc_move_exec(BattleScript_SafeguardEnds);
                        effect++;
                    }
                }
                BATTLE_STRUCT->turnSideTracker++;
                if (effect)
                    break;
            }
            if (!effect)
            {
                BATTLE_STRUCT->turncountersTracker++;
                BATTLE_STRUCT->turnSideTracker = 0;
            }
            break;
        case 5:
            while (BATTLE_STRUCT->turnSideTracker < gNoOfAllBanks)
            {
                gActiveBank = gTurnOrder[BATTLE_STRUCT->turnSideTracker];
                if (gWishFutureKnock.wishCounter[gActiveBank] && --gWishFutureKnock.wishCounter[gActiveBank] == 0 && gBattleMons[gActiveBank].hp)
                {
                    gBankTarget = gActiveBank;
                    b_call_bc_move_exec(BattleScript_WishComesTrue);
                    effect++;
                }
                BATTLE_STRUCT->turnSideTracker++;
                if (effect)
                    break;
            }
            if (!effect)
            {
                BATTLE_STRUCT->turncountersTracker++;
            }
            break;
        case 6:
            if (gBattleWeather & WEATHER_RAIN_ANY)
            {
                if (!(gBattleWeather & WEATHER_RAIN_PERMANENT))
                {
                    if (--gWishFutureKnock.weatherDuration == 0)
                    {
                        gBattleWeather &= ~WEATHER_RAIN_TEMPORARY;
                        gBattleWeather &= ~WEATHER_RAIN_DOWNPOUR;
                        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
                    }
                    else if (gBattleWeather & WEATHER_RAIN_DOWNPOUR)
                        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    else
                        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                }
                else if (gBattleWeather & WEATHER_RAIN_DOWNPOUR)
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                else
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                b_call_bc_move_exec(BattleScript_RainContinuesOrEnds);
                effect++;
            }
            BATTLE_STRUCT->turncountersTracker++;
            break;
        case 7:
            if (gBattleWeather & WEATHER_SANDSTORM_ANY)
            {
                if (!(gBattleWeather & WEATHER_SANDSTORM_PERMANENT) && --gWishFutureKnock.weatherDuration == 0)
                {
                    gBattleWeather &= ~WEATHER_SANDSTORM_TEMPORARY;
                    gBattlescriptCurrInstr = BattleScript_SandStormHailEnds;
                }
                else
                    gBattlescriptCurrInstr = BattleScript_DamagingWeatherContinues;

                BATTLE_STRUCT->animArg1 = B_ANIM_SANDSTORM_CONTINUES;
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                b_call_bc_move_exec(gBattlescriptCurrInstr);
                effect++;
            }
            BATTLE_STRUCT->turncountersTracker++;
            break;
        case 8:
            if (gBattleWeather & WEATHER_SUN_ANY)
            {
                if (!(gBattleWeather & WEATHER_SUN_PERMANENT) && --gWishFutureKnock.weatherDuration == 0)
                {
                    gBattleWeather &= ~WEATHER_SUN_TEMPORARY;
                    gBattlescriptCurrInstr = BattleScript_SunlightFaded;
                }
                else
                    gBattlescriptCurrInstr = BattleScript_SunlightContinues;

                b_call_bc_move_exec(gBattlescriptCurrInstr);
                effect++;
            }
            BATTLE_STRUCT->turncountersTracker++;
            break;
        case 9:
            if (gBattleWeather & WEATHER_HAIL)
            {
                if (--gWishFutureKnock.weatherDuration == 0)
                {
                    gBattleWeather &= ~WEATHER_HAIL;
                    gBattlescriptCurrInstr = BattleScript_SandStormHailEnds;
                }
                else
                    gBattlescriptCurrInstr = BattleScript_DamagingWeatherContinues;

                BATTLE_STRUCT->animArg1 = B_ANIM_HAIL_CONTINUES;
                gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                b_call_bc_move_exec(gBattlescriptCurrInstr);
                effect++;
            }
            BATTLE_STRUCT->turncountersTracker++;
            break;
        case 10:
            effect++;
            break;
        }
    } while (effect == 0);
    return (gBattleMainFunc != BattleTurnPassed);
}

#define TURNBASED_MAX_CASE 19

u8 TurnBasedEffects(void)
{
    u8 effect = 0;

    gHitMarker |= (HITMARKER_GRUDGE | HITMARKER_x20);
    while (BATTLE_STRUCT->turnEffectsBank < gNoOfAllBanks && BATTLE_STRUCT->turnEffectsTracker <= TURNBASED_MAX_CASE)
    {
        gActiveBank = gBankAttacker = gTurnOrder[BATTLE_STRUCT->turnEffectsBank];
        if (gAbsentBankFlags & gBitTable[gActiveBank])
        {
            BATTLE_STRUCT->turnEffectsBank++;
        }
        else
        {
            switch (BATTLE_STRUCT->turnEffectsTracker)
            {
            case 0:  // ingrain
                if ((gStatuses3[gActiveBank] & STATUS3_ROOTED)
                 && gBattleMons[gActiveBank].hp != gBattleMons[gActiveBank].maxHP
                 && gBattleMons[gActiveBank].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 16;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    gBattleMoveDamage *= -1;
                    b_call_bc_move_exec(BattleScript_IngrainTurnHeal);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 1:  // end turn abilities
                if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, gActiveBank, 0, 0, 0))
                    effect++;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 2:  // item effects
                if (ItemBattleEffects(1, gActiveBank, 0))
                    effect++;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 18:  // item effects again
                if (ItemBattleEffects(1, gActiveBank, 1))
                    effect++;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 3:  // leech seed
                if (gStatuses3[gActiveBank] & STATUS3_LEECHSEED && gBattleMons[gStatuses3[gActiveBank] & STATUS3_LEECHSEED_BANK].hp != 0 && gBattleMons[gActiveBank].hp != 0)
                {
                    gBankTarget = gStatuses3[gActiveBank] & STATUS3_LEECHSEED_BANK; //funny how the 'target' is actually the bank that receives HP
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 8;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    BATTLE_STRUCT->animArg1 = gBankTarget;
                    BATTLE_STRUCT->animArg2 = gBankAttacker;
                    b_call_bc_move_exec(BattleScript_LeechSeedTurnDrain);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 4:  // poison
                if ((gBattleMons[gActiveBank].status1 & STATUS_POISON) && gBattleMons[gActiveBank].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 8;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    b_call_bc_move_exec(BattleScript_PoisonTurnDmg);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 5:  // toxic poison
                if ((gBattleMons[gActiveBank].status1 & STATUS_TOXIC_POISON) && gBattleMons[gActiveBank].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 16;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    if ((gBattleMons[gActiveBank].status1 & 0xF00) != 0xF00) //not 16 turns
                        gBattleMons[gActiveBank].status1 += 0x100;
                    gBattleMoveDamage *= (gBattleMons[gActiveBank].status1 & 0xF00) >> 8;
                    b_call_bc_move_exec(BattleScript_PoisonTurnDmg);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 6:  // burn
                if ((gBattleMons[gActiveBank].status1 & STATUS_BURN) && gBattleMons[gActiveBank].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 8;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    b_call_bc_move_exec(BattleScript_BurnTurnDmg);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 7:  // spooky nightmares
                if ((gBattleMons[gActiveBank].status2 & STATUS2_NIGHTMARE) && gBattleMons[gActiveBank].hp != 0)
                {
                    // missing sleep check
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 4;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    b_call_bc_move_exec(BattleScript_NightmareTurnDmg);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 8:  // curse
                if ((gBattleMons[gActiveBank].status2 & STATUS2_CURSED) && gBattleMons[gActiveBank].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 4;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    b_call_bc_move_exec(BattleScript_CurseTurnDmg);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 9:  // wrap
                if ((gBattleMons[gActiveBank].status2 & STATUS2_WRAPPED) && gBattleMons[gActiveBank].hp != 0)
                {
                    gBattleMons[gActiveBank].status2 -= 0x2000;
                    if (gBattleMons[gActiveBank].status2 & STATUS2_WRAPPED)  // damaged by wrap
                    {
                        BATTLE_STRUCT->animArg1 = ewram16004arr(0, gActiveBank);
                        BATTLE_STRUCT->animArg2 = ewram16004arr(1, gActiveBank);
                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 2;
                        gBattleTextBuff1[2] = ewram16004arr(0, gActiveBank);
                        gBattleTextBuff1[3] = ewram16004arr(1, gActiveBank);
                        gBattleTextBuff1[4] = EOS;
                        gBattlescriptCurrInstr = BattleScript_WrapTurnDmg;
                        gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 16;
                        if (gBattleMoveDamage == 0)
                            gBattleMoveDamage = 1;
                    }
                    else  // broke free
                    {
                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 2;
                        gBattleTextBuff1[2] = ewram16004arr(0, gActiveBank);
                        gBattleTextBuff1[3] = ewram16004arr(1, gActiveBank);
                        gBattleTextBuff1[4] = EOS;
                        gBattlescriptCurrInstr = BattleScript_WrapEnds;
                    }
                    b_call_bc_move_exec(gBattlescriptCurrInstr);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 10:  // uproar
                if (gBattleMons[gActiveBank].status2 & STATUS2_UPROAR)
                {
                    for (gBankAttacker = 0; gBankAttacker < gNoOfAllBanks; gBankAttacker++)
                    {
                        if ((gBattleMons[gBankAttacker].status1 & STATUS_SLEEP)
                         && gBattleMons[gBankAttacker].ability != ABILITY_SOUNDPROOF)
                        {
                            gBattleMons[gBankAttacker].status1 &= ~(STATUS_SLEEP);
                            gBattleMons[gBankAttacker].status2 &= ~(STATUS2_NIGHTMARE);
                            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                            b_call_bc_move_exec(BattleScript_MonWokeUpInUproar);
                            gActiveBank = gBankAttacker;
                            EmitSetAttributes(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
                            MarkBufferBankForExecution(gActiveBank);
                            break;
                        }
                    }
                    if (gBankAttacker != gNoOfAllBanks)
                    {
                        effect = 2;  // a pokemon was awaken
                        break;
                    }
                    else
                    {
                        gBankAttacker = gActiveBank;
                        gBattleMons[gActiveBank].status2 -= 0x10;  // uproar timer goes down
                        if (sub_8015660(gActiveBank))
                        {
                            CancelMultiTurnMoves(gActiveBank);
                            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                        }
                        else if (gBattleMons[gActiveBank].status2 & STATUS2_UPROAR)
                        {
                            gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                            gBattleMons[gActiveBank].status2 |= STATUS2_MULTIPLETURNS;
                        }
                        else
                        {
                            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                            CancelMultiTurnMoves(gActiveBank);
                        }
                        b_call_bc_move_exec(BattleScript_PrintUproarOverTurns);
                        effect = 1;
                    }
                }
                if (effect != 2)
                    BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 11:  // thrash
                if (gBattleMons[gActiveBank].status2 & STATUS2_LOCK_CONFUSE)
                {
                    gBattleMons[gActiveBank].status2 -= 0x400;
                    if (sub_8015660(gActiveBank))
                        CancelMultiTurnMoves(gActiveBank);
                    else if (!(gBattleMons[gActiveBank].status2 & STATUS2_LOCK_CONFUSE)
                     && (gBattleMons[gActiveBank].status2 & STATUS2_MULTIPLETURNS))
                    {
                        gBattleMons[gActiveBank].status2 &= ~(STATUS2_MULTIPLETURNS);
                        if (!(gBattleMons[gActiveBank].status2 & STATUS2_CONFUSION))
                        {
                            gBattleCommunication[MOVE_EFFECT_BYTE] = 0x47;
                            SetMoveEffect(1, 0);
                            if (gBattleMons[gActiveBank].status2 & STATUS2_CONFUSION)
                                b_call_bc_move_exec(BattleScript_ThrashConfuses);
                            effect++;
                        }
                    }
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 12:  // disable
                if (gDisableStructs[gActiveBank].disableTimer1 != 0)
                {
                    int i;
                    for (i = 0; i < 4; i++)
                    {
                        if (gDisableStructs[gActiveBank].disabledMove == gBattleMons[gActiveBank].moves[i])
                            break;
                    }
                    if (i == 4)  // pokemon does not have the disabled move anymore
                    {
                        gDisableStructs[gActiveBank].disabledMove = 0;
                        gDisableStructs[gActiveBank].disableTimer1 = 0;
                    }
                    else if (--gDisableStructs[gActiveBank].disableTimer1 == 0)  // disable ends
                    {
                        gDisableStructs[gActiveBank].disabledMove = 0;
                        b_call_bc_move_exec(BattleScript_DisabledNoMore);
                        effect++;
                    }
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 13:  // encore
                if (gDisableStructs[gActiveBank].encoreTimer1 != 0)
                {
                    if (gBattleMons[gActiveBank].moves[gDisableStructs[gActiveBank].encoredMovePos] != gDisableStructs[gActiveBank].encoredMove)  // pokemon does not have the encored move anymore
                    {
                        gDisableStructs[gActiveBank].encoredMove = 0;
                        gDisableStructs[gActiveBank].encoreTimer1 = 0;
                    }
                    else if (--gDisableStructs[gActiveBank].encoreTimer1 == 0
                     || gBattleMons[gActiveBank].pp[gDisableStructs[gActiveBank].encoredMovePos] == 0)
                    {
                        gDisableStructs[gActiveBank].encoredMove = 0;
                        gDisableStructs[gActiveBank].encoreTimer1 = 0;
                        b_call_bc_move_exec(BattleScript_EncoredNoMore);
                        effect++;
                    }
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 14:  // lock-on decrement
                if (gStatuses3[gActiveBank] & STATUS3_ALWAYS_HITS)
                    gStatuses3[gActiveBank] -= 0x8;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 15:  // charge
                if (gDisableStructs[gActiveBank].chargeTimer1 && --gDisableStructs[gActiveBank].chargeTimer1 == 0)
                    gStatuses3[gActiveBank] &= ~STATUS3_CHARGED_UP;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 16:  // taunt
                if (gDisableStructs[gActiveBank].tauntTimer1)
                    gDisableStructs[gActiveBank].tauntTimer1--;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 17:  // yawn
                if (gStatuses3[gActiveBank] & STATUS3_YAWN)
                {
                    gStatuses3[gActiveBank] -= 0x800;
                    if (!(gStatuses3[gActiveBank] & STATUS3_YAWN) && !(gBattleMons[gActiveBank].status1 & STATUS_ANY)
                     && gBattleMons[gActiveBank].ability != ABILITY_VITAL_SPIRIT
                     && gBattleMons[gActiveBank].ability != ABILITY_INSOMNIA && !UproarWakeUpCheck(gActiveBank))
                    {
                        CancelMultiTurnMoves(gActiveBank);
                        gBattleMons[gActiveBank].status1 |= (Random() & 3) + 2;
                        EmitSetAttributes(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
                        MarkBufferBankForExecution(gActiveBank);
                        gEffectBank = gActiveBank;
                        b_call_bc_move_exec(BattleScript_YawnMakesAsleep);
                        effect++;
                    }
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 19:  // done
                BATTLE_STRUCT->turnEffectsTracker = 0;
                BATTLE_STRUCT->turnEffectsBank++;
                break;
            }
            if (effect != 0)
                return effect;
        }
    }
    gHitMarker &= ~(HITMARKER_GRUDGE | HITMARKER_x20);
    return 0;
}

bool8 sub_80170DC(void) // handle future sight and perish song
{
    gHitMarker |= (HITMARKER_GRUDGE | HITMARKER_x20);
    switch (BATTLE_STRUCT->sub80170DC_Tracker)
    {
    case 0: // future sight
        while (BATTLE_STRUCT->sub80170DC_Bank < gNoOfAllBanks)
        {
            gActiveBank = BATTLE_STRUCT->sub80170DC_Bank;
            if (gAbsentBankFlags & gBitTable[gActiveBank])
                BATTLE_STRUCT->sub80170DC_Bank++;
            else
            {
                BATTLE_STRUCT->sub80170DC_Bank++;
                if (gWishFutureKnock.futureSightCounter[gActiveBank] && --gWishFutureKnock.futureSightCounter[gActiveBank] == 0 && gBattleMons[gActiveBank].hp)
                {
                    if (gWishFutureKnock.futureSightMove[gActiveBank] == MOVE_FUTURE_SIGHT)
                        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                    else //Doom Desire
                        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 2;
                    gBattleTextBuff1[2] = gWishFutureKnock.futureSightMove[gActiveBank];
                    gBattleTextBuff1[3] = gWishFutureKnock.futureSightMove[gActiveBank] >> 8;
                    gBattleTextBuff1[4] = 0xFF;
                    gBankTarget = gActiveBank;
                    gBankAttacker = gWishFutureKnock.futureSightAttacker[gActiveBank];
                    gBattleMoveDamage = gWishFutureKnock.futureSightDmg[gActiveBank];
                    gSpecialStatuses[gBankTarget].moveturnLostHP = 0xFFFF;
                    b_call_bc_move_exec(BattleScript_MonTookFutureAttack);
                    return 1;
                }
            }
        }
        BATTLE_STRUCT->sub80170DC_Tracker = 1;
        BATTLE_STRUCT->sub80170DC_Bank = 0;
    case 1: // perish song
        while (BATTLE_STRUCT->sub80170DC_Bank < gNoOfAllBanks)
        {
            gActiveBank = gBankAttacker = gTurnOrder[BATTLE_STRUCT->sub80170DC_Bank];
            if (gAbsentBankFlags & gBitTable[gActiveBank])
                BATTLE_STRUCT->sub80170DC_Bank++;
            else
            {
                BATTLE_STRUCT->sub80170DC_Bank++;
                if (gStatuses3[gActiveBank] & STATUS3_PERISH_SONG)
                {
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 1;
                    gBattleTextBuff1[2] = 1;
                    gBattleTextBuff1[3] = 1;
                    gBattleTextBuff1[4] = gDisableStructs[gActiveBank].perishSong1;
                    gBattleTextBuff1[5] = 0xFF;
                    if (gDisableStructs[gActiveBank].perishSong1 == 0)
                    {
                        gStatuses3[gActiveBank] &= ~(STATUS3_PERISH_SONG);
                        gBattleMoveDamage = gBattleMons[gActiveBank].hp;
                        gBattlescriptCurrInstr = BattleScript_PerishSongHits;
                    }
                    else
                    {
                        gDisableStructs[gActiveBank].perishSong1--;
                        gBattlescriptCurrInstr = BattleScript_PerishSongTimerGoesDown;
                    }
                    b_call_bc_move_exec(gBattlescriptCurrInstr);
                    return 1;
                }
            }
        }
        break;
    }
    gHitMarker &= ~(HITMARKER_GRUDGE | HITMARKER_x20);
    return 0;
}

#define sub_80173A4_MAX_CASE 7

bool8 sub_80173A4(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
        return 0;
    do
    {
        int i;
        switch (BATTLE_STRUCT->sub80173A4_Tracker)
        {
        case 0:
            BATTLE_STRUCT->unk1605A = 0;
            BATTLE_STRUCT->sub80173A4_Tracker++;
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (gAbsentBankFlags & gBitTable[i] && !sub_8018018(i, 6, 6))
                    gAbsentBankFlags &= ~(gBitTable[i]);
            }
        case 1:
            do
            {
                gBank1 = gBankTarget = BATTLE_STRUCT->unk1605A;
                if (gBattleMons[BATTLE_STRUCT->unk1605A].hp == 0 && !(BATTLE_STRUCT->unk16113 & gBitTable[gBattlePartyID[BATTLE_STRUCT->unk1605A]]) && !(gAbsentBankFlags & gBitTable[BATTLE_STRUCT->unk1605A]))
                {
                    b_call_bc_move_exec(BattleScript_GiveExp);
                    BATTLE_STRUCT->sub80173A4_Tracker = 2;
                    return 1;
                }
            } while (++BATTLE_STRUCT->unk1605A != gNoOfAllBanks);
            BATTLE_STRUCT->sub80173A4_Tracker = 3;
            break;
        case 2:
            sub_8015740(gBank1);
            if (++BATTLE_STRUCT->unk1605A == gNoOfAllBanks)
                BATTLE_STRUCT->sub80173A4_Tracker = 3;
            else
                BATTLE_STRUCT->sub80173A4_Tracker = 1;
            break;
        case 3:
            BATTLE_STRUCT->unk1605A = 0;
            BATTLE_STRUCT->sub80173A4_Tracker++;
        case 4:
            do
            {
                gBank1 = gBankTarget = BATTLE_STRUCT->unk1605A; //or should banks be switched?
                if (gBattleMons[BATTLE_STRUCT->unk1605A].hp == 0 && !(gAbsentBankFlags & gBitTable[BATTLE_STRUCT->unk1605A]))
                {
                    b_call_bc_move_exec(BattleScript_HandleFaintedMon);
                    BATTLE_STRUCT->sub80173A4_Tracker = 5;
                    return 1;
                }
            } while (++BATTLE_STRUCT->unk1605A != gNoOfAllBanks);
            BATTLE_STRUCT->sub80173A4_Tracker = 6;
            break;
        case 5:
            if (++BATTLE_STRUCT->unk1605A == gNoOfAllBanks)
                BATTLE_STRUCT->sub80173A4_Tracker = 6;
            else
                BATTLE_STRUCT->sub80173A4_Tracker = 4;
            break;
        case 6:
            if (AbilityBattleEffects(9, 0, 0, 0, 0) || AbilityBattleEffects(0xB, 0, 0, 0, 0) || ItemBattleEffects(1, 0, 1) || AbilityBattleEffects(6, 0, 0, 0, 0))
                return 1;
            BATTLE_STRUCT->sub80173A4_Tracker++;
            break;
        case 7:
            break;
        }
    } while (BATTLE_STRUCT->sub80173A4_Tracker != sub_80173A4_MAX_CASE);
    return 0;
}

void b_clear_atk_up_if_hit_flag_unless_enraged(void)
{
    int i;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (gBattleMons[i].status2 & STATUS2_RAGE && gChosenMovesByBanks[i] != MOVE_RAGE)
            gBattleMons[i].status2 &= ~(STATUS2_RAGE);
    }
}

#define ATKCANCELLER_MAX_CASE 14

u8 AtkCanceller_UnableToUseMove(void)
{
    u8 effect = 0;
    s32* bideDmg = &BATTLE_STRUCT->bideDmg;
    do
    {
        switch (BATTLE_STRUCT->atkCancellerTracker)
        {
        case 0: // flags clear
            gBattleMons[gBankAttacker].status2 &= ~(STATUS2_DESTINY_BOND);
            gStatuses3[gBankAttacker] &= ~(STATUS3_GRUDGE);
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 1: // check being asleep
            if (gBattleMons[gBankAttacker].status1 & STATUS_SLEEP)
            {
                if (UproarWakeUpCheck(gBankAttacker))
                {
                    gBattleMons[gBankAttacker].status1 &= ~(STATUS_SLEEP);
                    gBattleMons[gBankAttacker].status2 &= ~(STATUS2_NIGHTMARE);
                    b_movescr_stack_push_cursor();
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    gBattlescriptCurrInstr = BattleScript_MoveUsedWokeUp;
                    effect = 2;
                }
                else
                {
                    u8 toSub;
                    if (gBattleMons[gBankAttacker].ability == ABILITY_EARLY_BIRD)
                        toSub = 2;
                    else
                        toSub = 1;
                    if ((gBattleMons[gBankAttacker].status1 & STATUS_SLEEP) < toSub)
                        gBattleMons[gBankAttacker].status1 &= ~(STATUS_SLEEP);
                    else
                        gBattleMons[gBankAttacker].status1 -= toSub;
                    if (gBattleMons[gBankAttacker].status1 & STATUS_SLEEP)
                    {
                        if (gCurrentMove != MOVE_SNORE && gCurrentMove != MOVE_SLEEP_TALK)
                        {
                            gBattlescriptCurrInstr = BattleScript_MoveUsedIsAsleep;
                            gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                            effect = 2;
                        }
                    }
                    else
                    {
                        gBattleMons[gBankAttacker].status2 &= ~(STATUS2_NIGHTMARE);
                        b_movescr_stack_push_cursor();
                        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                        gBattlescriptCurrInstr = BattleScript_MoveUsedWokeUp;
                        effect = 2;
                    }
                }
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 2: // check being frozen
            if (gBattleMons[gBankAttacker].status1 & STATUS_FREEZE)
            {
                if (Random() % 5)
                {
                    if (gBattleMoves[gCurrentMove].effect != EFFECT_THAW_HIT) // unfreezing via a move effect happens in case 13
                    {
                        gBattlescriptCurrInstr = BattleScript_MoveUsedIsFrozen;
                        gHitMarker |= HITMARKER_NO_ATTACKSTRING;
                    }
                    else
                    {
                        BATTLE_STRUCT->atkCancellerTracker++;
                        break;
                    }
                }
                else // unfreeze
                {
                    gBattleMons[gBankAttacker].status1 &= ~(STATUS_FREEZE);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_MoveUsedUnfroze;
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                }
                effect = 2;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 3: // truant
            if (gBattleMons[gBankAttacker].ability == ABILITY_TRUANT && gDisableStructs[gBankAttacker].truantCounter)
            {
                CancelMultiTurnMoves(gBankAttacker);
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                gBattlescriptCurrInstr = BattleScript_MoveUsedLoafingAround;
                gBattleMoveFlags |= MOVESTATUS_MISSED;
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 4: // recharge
            if (gBattleMons[gBankAttacker].status2 & STATUS2_RECHARGE)
            {
                gBattleMons[gBankAttacker].status2 &= ~(STATUS2_RECHARGE);
                gDisableStructs[gBankAttacker].rechargeCounter = 0;
                CancelMultiTurnMoves(gBankAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedMustRecharge;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 5: // flinch
            if (gBattleMons[gBankAttacker].status2 & STATUS2_FLINCHED)
            {
                gBattleMons[gBankAttacker].status2 &= ~(STATUS2_FLINCHED);
                gProtectStructs[gBankAttacker].flinchImmobility = 1;
                CancelMultiTurnMoves(gBankAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedFlinched;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 6: // disabled move
            if (gDisableStructs[gBankAttacker].disabledMove == gCurrentMove && gDisableStructs[gBankAttacker].disabledMove != 0)
            {
                gProtectStructs[gBankAttacker].usedDisabledMove = 1;
                BATTLE_STRUCT->scriptingActive = gBankAttacker;
                CancelMultiTurnMoves(gBankAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsDisabled;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 7: // taunt
            if (gDisableStructs[gBankAttacker].tauntTimer1 && gBattleMoves[gCurrentMove].power == 0)
            {
                gProtectStructs[gBankAttacker].usedTauntedMove = 1;
                CancelMultiTurnMoves(gBankAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsTaunted;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 8: // imprisoned
            if (IsImprisoned(gBankAttacker, gCurrentMove))
            {
                gProtectStructs[gBankAttacker].usedImprisionedMove = 1;
                CancelMultiTurnMoves(gBankAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsImprisoned;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 9: // confusion
            if (gBattleMons[gBankAttacker].status2 & STATUS2_CONFUSION)
            {
                gBattleMons[gBankAttacker].status2--;
                if (gBattleMons[gBankAttacker].status2 & STATUS2_CONFUSION)
                {
                    if (Random() & 1)
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                        b_movescr_stack_push_cursor();
                    }
                    else // confusion dmg
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                        gBankTarget = gBankAttacker;
                        gBattleMoveDamage = CalculateBaseDamage(&gBattleMons[gBankAttacker], &gBattleMons[gBankAttacker], MOVE_POUND, 0, 40, 0, gBankAttacker, gBankAttacker);
                        gProtectStructs[gBankAttacker].confusionSelfDmg = 1;
                        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                    }
                    gBattlescriptCurrInstr = BattleScript_MoveUsedIsConfused;
                }
                else // snapped out of confusion
                {
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_MoveUsedIsConfusedNoMore;
                }
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 10: // paralysis
            if (gBattleMons[gBankAttacker].status1 & STATUS_PARALYSIS && (Random() % 4) == 0)
            {
                gProtectStructs[gBankAttacker].prlzImmobility = 1;
                CancelMultiTurnMoves(gBankAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsParalyzed;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 11: // infatuation
            if (gBattleMons[gBankAttacker].status2 & STATUS2_INFATUATION)
            {
                BATTLE_STRUCT->scriptingActive = CountTrailingZeroBits((gBattleMons[gBankAttacker].status2 & STATUS2_INFATUATION) >> 0x10);
                if (Random() & 1)
                    b_movescr_stack_push_cursor();
                else
                {
                    b_movescr_stack_push(BattleScript_MoveUsedIsParalyzedCantAttack);
                    gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                    gProtectStructs[gBankAttacker].loveImmobility = 1;
                    CancelMultiTurnMoves(gBankAttacker);
                }
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsInLove;
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 12: // bide
            if (gBattleMons[gBankAttacker].status2 & STATUS2_BIDE)
            {
                gBattleMons[gBankAttacker].status2 -= 0x100;
                if (gBattleMons[gBankAttacker].status2 & STATUS2_BIDE)
                    gBattlescriptCurrInstr = BattleScript_BideStoringEnergy;
                else
                {
                    gBattleMons[gBankAttacker].status2 &= ~(STATUS2_MULTIPLETURNS);
                    if (gTakenDmg[gBankAttacker])
                    {
                        gCurrentMove = MOVE_BIDE;
                        *bideDmg = gTakenDmg[gBankAttacker] * 2;
                        gBankTarget = gTakenDmgBanks[gBankAttacker];
                        if (gAbsentBankFlags & gBitTable[gBankTarget])
                            gBankTarget = GetMoveTarget(MOVE_BIDE, 1);
                        gBattlescriptCurrInstr = BattleScript_BideAttack;
                    }
                    else
                        gBattlescriptCurrInstr = BattleScript_BideNoEnergyToAttack;
                }
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 13: // move thawing
            if (gBattleMons[gBankAttacker].status1 & STATUS_FREEZE)
            {
                if (gBattleMoves[gCurrentMove].effect == EFFECT_THAW_HIT)
                {
                    gBattleMons[gBankAttacker].status1 &= ~(STATUS_FREEZE);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_MoveUsedUnfroze;
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                }
                effect = 2;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 14: // last case
            break;
        }

    } while (BATTLE_STRUCT->atkCancellerTracker != ATKCANCELLER_MAX_CASE && effect == 0);

    if (effect == 2)
    {
        gActiveBank = gBankAttacker;
        EmitSetAttributes(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
        MarkBufferBankForExecution(gActiveBank);
    }
    return effect;
}

bool8 sub_8018018(u8 bank, u8 r1, u8 r2)
{
    struct Pokemon* party;
    u8 r7;
    u8 r6;
    s32 i;
    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
        return 0;
    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        r7 = sub_803FC34(bank);
        if (GetBankSide(bank) == 0)
            party = gPlayerParty;
        else
            party = gEnemyParty;
        r6 = sub_803FBFC(r7);
        for (i = r6 * 3; i < r6 * 3 + 3; i++)
        {
            if (GetMonData(&party[i], MON_DATA_HP) && GetMonData(&party[i], MON_DATA_SPECIES2) && GetMonData(&party[i], MON_DATA_SPECIES2) != SPECIES_EGG)
                break;
        }
        return (i == r6 * 3 + 3);
    }
    else
    {
        if (GetBankSide(bank) == 1)
        {
            r7 = GetBankByIdentity(1);
            r6 = GetBankByIdentity(3);
            party = gEnemyParty;
        }
        else
        {
            r7 = GetBankByIdentity(0);
            r6 = GetBankByIdentity(2);
            party = gPlayerParty;
        }
        if (r1 == 6)
            r1 = gBattlePartyID[r7];
        if (r2 == 6)
            r2 = gBattlePartyID[r6];
        for (i = 0; i < 6; i++)
        {
            if (GetMonData(&party[i], MON_DATA_HP) && GetMonData(&party[i], MON_DATA_SPECIES2) && GetMonData(&party[i], MON_DATA_SPECIES2) != SPECIES_EGG && i != r1 && i != r2 && i != ewram16068arr(r7) && i != ewram16068arr(r6))
                break;
        }
        return (i == 6);
    }
}

enum
{
    CASTFORM_NO_CHANGE, //0
    CASTFORM_TO_NORMAL, //1
    CASTFORM_TO_FIRE,   //2
    CASTFORM_TO_WATER,  //3
    CASTFORM_TO_ICE,    //4
};

u8 CastformDataTypeChange(u8 bank)
{
    u8 formChange = 0;
    if (gBattleMons[bank].species != SPECIES_CASTFORM || gBattleMons[bank].ability != ABILITY_FORECAST || gBattleMons[bank].hp == 0)
        return CASTFORM_NO_CHANGE;
    if (!WEATHER_HAS_EFFECT && gBattleMons[bank].type1 != TYPE_NORMAL && gBattleMons[bank].type2 != TYPE_NORMAL)
    {
        gBattleMons[bank].type1 = TYPE_NORMAL;
        gBattleMons[bank].type2 = TYPE_NORMAL;
        return CASTFORM_TO_NORMAL;
    }
    if (!WEATHER_HAS_EFFECT)
        return CASTFORM_NO_CHANGE;
    if (!(gBattleWeather & (WEATHER_RAIN_ANY | WEATHER_SUN_ANY | WEATHER_HAIL)) && gBattleMons[bank].type1 != TYPE_NORMAL && gBattleMons[bank].type2 != TYPE_NORMAL)
    {
        gBattleMons[bank].type1 = TYPE_NORMAL;
        gBattleMons[bank].type2 = TYPE_NORMAL;
        formChange = CASTFORM_TO_NORMAL;
    }
    if (gBattleWeather & WEATHER_SUN_ANY && gBattleMons[bank].type1 != TYPE_FIRE && gBattleMons[bank].type2 != TYPE_FIRE)
    {
        gBattleMons[bank].type1 = TYPE_FIRE;
        gBattleMons[bank].type2 = TYPE_FIRE;
        formChange = CASTFORM_TO_FIRE;
    }
    if (gBattleWeather & WEATHER_RAIN_ANY && gBattleMons[bank].type1 != TYPE_WATER && gBattleMons[bank].type2 != TYPE_WATER)
    {
        gBattleMons[bank].type1 = TYPE_WATER;
        gBattleMons[bank].type2 = TYPE_WATER;
        formChange = CASTFORM_TO_WATER;
    }
    if (gBattleWeather & WEATHER_HAIL && gBattleMons[bank].type1 != TYPE_ICE && gBattleMons[bank].type2 != TYPE_ICE)
    {
        gBattleMons[bank].type1 = TYPE_ICE;
        gBattleMons[bank].type2 = TYPE_ICE;
        formChange = CASTFORM_TO_ICE;
    }
    return formChange;
}

u8 AbilityBattleEffects(u8 caseID, u8 bank, u8 ability, u8 special, u16 moveArg)
{
    u8 effect = 0;
    struct Pokemon* pokeAtk;
    struct Pokemon* pokeDef;
    u16 speciesAtk;
    u16 speciesDef;
    u32 pidAtk;
    u32 pidDef;

    if (gBankAttacker >= gNoOfAllBanks)
        gBankAttacker = bank;
    if (GetBankSide(gBankAttacker) == 0)
        pokeAtk = &gPlayerParty[gBattlePartyID[gBankAttacker]];
    else
        pokeAtk = &gEnemyParty[gBattlePartyID[gBankAttacker]];

    if (gBankTarget >= gNoOfAllBanks)
        gBankTarget = bank;
    if (GetBankSide(gBankTarget) == 0)
        pokeDef = &gPlayerParty[gBattlePartyID[gBankTarget]];
    else
        pokeDef = &gEnemyParty[gBattlePartyID[gBankTarget]];

    speciesAtk = GetMonData(pokeAtk, MON_DATA_SPECIES);
    pidAtk = GetMonData(pokeAtk, MON_DATA_PERSONALITY);

    speciesDef = GetMonData(pokeDef, MON_DATA_SPECIES);
    pidDef = GetMonData(pokeDef, MON_DATA_PERSONALITY);

    if (!(gBattleTypeFlags & BATTLE_TYPE_SAFARI)) // why isn't that check done at the beginning?
    {
        u8 moveType;
        s32 i;
        u16 move;
        u8 side;
        u8 target1;

        if (special)
            gLastUsedAbility = special;
        else
            gLastUsedAbility = gBattleMons[bank].ability;

        if (moveArg)
            move = moveArg;
        else
            move = gCurrentMove;

        if (BATTLE_STRUCT->dynamicMoveType)
            moveType = BATTLE_STRUCT->dynamicMoveType & 0x3F;
        else
            moveType = gBattleMoves[move].type;

        //_080184AC
        switch (caseID)
        {
        case ABILITYEFFECT_ON_SWITCHIN: // 0
        //_08018518
            if (gBankAttacker >= gNoOfAllBanks)
                gBankAttacker = bank;
            switch (gLastUsedAbility)
            {
            case 0xFF: //weather from overworld
            //_08018586
                switch (weather_get_current())
                {
                case WEATHER_RAIN_LIGHT:
                case WEATHER_RAIN_MED:
                case WEATHER_RAIN_HEAVY:
                    if (!(gBattleWeather & WEATHER_RAIN_ANY))
                    {
                        gBattleWeather = (WEATHER_RAIN_TEMPORARY | WEATHER_RAIN_PERMANENT);
                        BATTLE_STRUCT->animArg1 = B_ANIM_RAIN_CONTINUES;
                        BATTLE_STRUCT->scriptingActive = bank;
                        effect++;
                    }
                    break;
                case WEATHER_SANDSTORM:
                    if (!(gBattleWeather & WEATHER_SANDSTORM_ANY))
                    {
                        gBattleWeather = (WEATHER_SANDSTORM_PERMANENT | WEATHER_SANDSTORM_TEMPORARY);
                        BATTLE_STRUCT->animArg1 = B_ANIM_SANDSTORM_CONTINUES;
                        BATTLE_STRUCT->scriptingActive = bank;
                        effect++;
                    }
                    break;
                case WEATHER_DROUGHT:
                    if (!(gBattleWeather & WEATHER_SUN_ANY))
                    {
                        gBattleWeather = (WEATHER_SUN_PERMANENT | WEATHER_SUN_TEMPORARY);
                        BATTLE_STRUCT->animArg1 = B_ANIM_SUN_CONTINUES;
                        BATTLE_STRUCT->scriptingActive = bank;
                        effect++;
                    }
                    break;
                }
                if (effect)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = weather_get_current();
                    b_push_move_exec(BattleScript_OverworldWeatherStarts);
                }
                break;
            case ABILITY_DRIZZLE:
            //_08018680
                if (!(gBattleWeather & WEATHER_RAIN_PERMANENT))
                {
                    gBattleWeather = (WEATHER_RAIN_PERMANENT | WEATHER_RAIN_TEMPORARY);
                    b_push_move_exec(BattleScript_DrizzleActivates);
                    BATTLE_STRUCT->scriptingActive = bank;
                    effect++;
                }
                break;
            case ABILITY_SAND_STREAM:
            //_080186B8
                if (!(gBattleWeather & WEATHER_SANDSTORM_PERMANENT))
                {
                    gBattleWeather = (WEATHER_SANDSTORM_PERMANENT | WEATHER_SANDSTORM_TEMPORARY);
                    b_push_move_exec(BattleScript_SandstreamActivates);
                    BATTLE_STRUCT->scriptingActive = bank;
                    effect++;
                }
                break;
            case ABILITY_DROUGHT:
            //_080186F0
                if (!(gBattleWeather & WEATHER_SUN_PERMANENT))
                {
                    gBattleWeather = (WEATHER_SUN_PERMANENT | WEATHER_SUN_TEMPORARY);
                    b_push_move_exec(BattleScript_DroughtActivates);
                    BATTLE_STRUCT->scriptingActive = bank;
                    effect++;
                }
                break;
            case ABILITY_INTIMIDATE:
            //_08018728
                if (!(gSpecialStatuses[bank].intimidatedPoke))
                {
                    gStatuses3[bank] |= STATUS3_INTIMIDATE_POKES;
                    gSpecialStatuses[bank].intimidatedPoke = 1;
                }
                break;
            case ABILITY_FORECAST:
            //_0801875C
                effect = CastformDataTypeChange(bank);
                if (effect != 0)
                {
                    b_push_move_exec(BattleScript_CastformChange);
                    BATTLE_STRUCT->scriptingActive = bank;
                    BATTLE_STRUCT->castformToChangeInto = effect - 1;
                }
                break;
            case ABILITY_TRACE:
            //_080187A0
                if (!(gSpecialStatuses[bank].traced))
                {
                    gStatuses3[bank] |= STATUS3_TRACE;
                    gSpecialStatuses[bank].traced = 1;
                }
                break;
            case ABILITY_CLOUD_NINE:
            case ABILITY_AIR_LOCK:
            //_080187DC
                {
                    // that's a weird choice for a variable, why not use i or bank?
                    for (target1 = 0; target1 < gNoOfAllBanks; target1++)
                    {
                        effect = CastformDataTypeChange(target1);
                        if (effect != 0)
                        {
                            b_push_move_exec(BattleScript_CastformChange);
                            BATTLE_STRUCT->scriptingActive = target1;
                            BATTLE_STRUCT->castformToChangeInto = effect - 1;
                            break;
                        }
                    }
                }
                break;
            }
            break;
        case ABILITYEFFECT_ENDTURN: // 1
        //_08018814
            if (gBattleMons[bank].hp != 0)
            {
                gBankAttacker = bank;
                switch (gLastUsedAbility)
                {
                case ABILITY_RAIN_DISH:
                    if (WEATHER_HAS_EFFECT && (gBattleWeather & WEATHER_RAIN_ANY)
                     && gBattleMons[bank].maxHP > gBattleMons[bank].hp)
                    {
                        gLastUsedAbility = ABILITY_RAIN_DISH; // why
                        b_push_move_exec(BattleScript_RainDishActivates);
                        gBattleMoveDamage = gBattleMons[bank].maxHP / 16;
                        if (gBattleMoveDamage == 0)
                            gBattleMoveDamage = 1;
                        gBattleMoveDamage *= -1;
                        effect++;
                    }
                    break;
                case ABILITY_SHED_SKIN:
                    if ((gBattleMons[bank].status1 & STATUS_ANY) && (Random() % 3) == 0)
                    {
                        if (gBattleMons[bank].status1 & (STATUS_POISON | STATUS_TOXIC_POISON))
                            StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);
                        if (gBattleMons[bank].status1 & STATUS_SLEEP)
                            StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                        if (gBattleMons[bank].status1 & STATUS_PARALYSIS)
                            StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);
                        if (gBattleMons[bank].status1 & STATUS_BURN)
                            StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
                        if (gBattleMons[bank].status1 & STATUS_FREEZE)
                            StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);
                        gBattleMons[bank].status1 = 0;
                        // BUG: The nightmare status does not get cleared here. This was fixed in Emerald.
                        //gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE);
                        BATTLE_STRUCT->scriptingActive = gActiveBank = bank;
                        b_push_move_exec(BattleScript_ShedSkinActivates);
                        EmitSetAttributes(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[bank].status1);
                        MarkBufferBankForExecution(gActiveBank);
                        effect++;
                    }
                    break;
                case ABILITY_SPEED_BOOST:
                    if (gBattleMons[bank].statStages[STAT_STAGE_SPEED] < 0xC && gDisableStructs[bank].isFirstTurn != 2)
                    {
                        gBattleMons[bank].statStages[STAT_STAGE_SPEED]++;
                        BATTLE_STRUCT->animArg1 = 0x11;
                        BATTLE_STRUCT->animArg2 = 0;
                        b_push_move_exec(BattleScript_SpeedBoostActivates);
                        BATTLE_STRUCT->scriptingActive = bank;
                        effect++;
                    }
                    break;
                case ABILITY_TRUANT:
                    gDisableStructs[gBankAttacker].truantCounter ^= 1;
                    break;
                }
            }
            break;
        case ABILITYEFFECT_MOVES_BLOCK: // 2
        //_08018A40
            if (gLastUsedAbility == ABILITY_SOUNDPROOF)
            {
                for (i = 0; gSoundMovesTable[i] != 0xFFFF; i++)
                {
                    if (gSoundMovesTable[i] == move)
                        break;
                }
                if (gSoundMovesTable[i] != 0xFFFF)
                {
                    if (gBattleMons[gBankAttacker].status2 & STATUS2_MULTIPLETURNS)
                        gHitMarker |= HITMARKER_NO_PPDEDUCT;
                    gBattlescriptCurrInstr = BattleScript_SoundproofProtected;
                    effect = 1;
                }
            }
            break;
        case ABILITYEFFECT_ABSORBING: // 3
        //_08018AD8
            if (move)
            {
                switch (gLastUsedAbility)
                {
                case ABILITY_VOLT_ABSORB:
                    if (moveType == TYPE_ELECTRIC && gBattleMoves[move].power != 0)
                    {
                        if (gProtectStructs[gBankAttacker].notFirstStrike)
                            gBattlescriptCurrInstr = BattleScript_MoveHPDrain;
                        else
                            gBattlescriptCurrInstr = BattleScript_MoveHPDrain_PPLoss;
                        effect = 1;
                    }
                    break;
                case ABILITY_WATER_ABSORB:
                    if (moveType == TYPE_WATER && gBattleMoves[move].power != 0)
                    {
                        if (gProtectStructs[gBankAttacker].notFirstStrike)
                            gBattlescriptCurrInstr = BattleScript_MoveHPDrain;
                        else
                            gBattlescriptCurrInstr = BattleScript_MoveHPDrain_PPLoss;
                        effect = 1;
                    }
                    break;
                case ABILITY_FLASH_FIRE:
                    if (moveType == TYPE_FIRE && !(gBattleMons[bank].status1 & STATUS_FREEZE))
                    {
                        if (!(eFlashFireArr.arr[bank] & 1))
                        {
                            gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                            if (gProtectStructs[gBankAttacker].notFirstStrike)
                                gBattlescriptCurrInstr = BattleScript_FlashFireBoost;
                            else
                                gBattlescriptCurrInstr = BattleScript_FlashFireBoost_PPLoss;
                            eFlashFireArr.arr[bank] |= 1;
                            effect = 2;
                        }
                        else
                        {
                            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                            if (gProtectStructs[gBankAttacker].notFirstStrike)
                                gBattlescriptCurrInstr = BattleScript_FlashFireBoost;
                            else
                                gBattlescriptCurrInstr = BattleScript_FlashFireBoost_PPLoss;
                            effect = 2;
                        }
                    }
                    break;
                }
                if (effect == 1)
                {
                    if (gBattleMons[bank].maxHP == gBattleMons[bank].hp)
                    {
                        if ((gProtectStructs[gBankAttacker].notFirstStrike))
                            gBattlescriptCurrInstr = BattleScript_MoveHPDrain_FullHP;
                        else
                            gBattlescriptCurrInstr = BattleScript_MoveHPDrain_FullHP_PPLoss;
                    }
                    else
                    {
                        gBattleMoveDamage = gBattleMons[bank].maxHP / 4;
                        if (gBattleMoveDamage == 0)
                            gBattleMoveDamage = 1;
                        gBattleMoveDamage *= -1;
                    }
                }
            }
            break;
        case ABILITYEFFECT_CONTACT: // 4
        //_08018CF0
            switch (gLastUsedAbility)
            {
            case ABILITY_COLOR_CHANGE:
            //_08018DCC
                if (!(gBattleMoveFlags & MOVESTATUS_NOEFFECT)
                 && move != MOVE_STRUGGLE
                 && gBattleMoves[move].power != 0
                 && (gSpecialStatuses[gBankTarget].moveturnLostHP_physical || gSpecialStatuses[gBankTarget].moveturnLostHP_special)
                 && gBattleMons[bank].type1 != moveType
                 && gBattleMons[bank].type2 != moveType
                 && gBattleMons[bank].hp != 0)
                {
                    gBattleMons[bank].type1 = moveType;
                    gBattleMons[bank].type2 = moveType;
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 3;
                    gBattleTextBuff1[2] = moveType;
                    gBattleTextBuff1[3] = 0xFF;
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_ColorChangeActivates;
                    effect++;
                }
                break;
            case ABILITY_ROUGH_SKIN:
            //_08018E94
                if (!(gBattleMoveFlags & MOVESTATUS_NOEFFECT)
                 && gBattleMons[gBankAttacker].hp != 0
                 && !gProtectStructs[gBankAttacker].confusionSelfDmg
                 && (gSpecialStatuses[gBankTarget].moveturnLostHP_physical || gSpecialStatuses[gBankTarget].moveturnLostHP_special)
                 && (gBattleMoves[move].flags & FLAG_MAKES_CONTACT))
                {
                    gBattleMoveDamage = gBattleMons[gBankAttacker].maxHP / 16;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_RoughSkinActivates;
                    effect++;
                }
                break;
            case ABILITY_EFFECT_SPORE:
            //_08018F54
                if (!(gBattleMoveFlags & MOVESTATUS_NOEFFECT)
                 && gBattleMons[gBankAttacker].hp != 0
                 && !gProtectStructs[gBankAttacker].confusionSelfDmg
                 && (gSpecialStatuses[gBankTarget].moveturnLostHP_physical || gSpecialStatuses[gBankTarget].moveturnLostHP_special)
                 && (gBattleMoves[move].flags & FLAG_MAKES_CONTACT)
                 && (Random() % 10) == 0)
                {
                    do
                    {
                        gBattleCommunication[MOVE_EFFECT_BYTE] = Random() & 3;
                    } while (gBattleCommunication[MOVE_EFFECT_BYTE] == 0);
                    if (gBattleCommunication[MOVE_EFFECT_BYTE] == 3)
                        gBattleCommunication[MOVE_EFFECT_BYTE] += 2;
                    gBattleCommunication[MOVE_EFFECT_BYTE] += 0x40;
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_ApplySecondaryEffect;
                    gHitMarker |= HITMARKER_IGNORE_SAFEGUARD;
                    effect++;
                }
                break;
            case ABILITY_POISON_POINT:
            //_0801904C
                if (!(gBattleMoveFlags & MOVESTATUS_NOEFFECT)
                 && gBattleMons[gBankAttacker].hp != 0
                 && !gProtectStructs[gBankAttacker].confusionSelfDmg
                 && (gSpecialStatuses[gBankTarget].moveturnLostHP_physical || gSpecialStatuses[gBankTarget].moveturnLostHP_special)
                 && (gBattleMoves[move].flags & FLAG_MAKES_CONTACT)
                 && (Random() % 3) == 0)
                {
                    gBattleCommunication[MOVE_EFFECT_BYTE] = 0x42;
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_ApplySecondaryEffect;
                    gHitMarker |= HITMARKER_IGNORE_SAFEGUARD;
                    effect++;
                }
                break;
            case ABILITY_STATIC:
            //_08019128
                if (!(gBattleMoveFlags & MOVESTATUS_NOEFFECT)
                 && gBattleMons[gBankAttacker].hp != 0
                 && !gProtectStructs[gBankAttacker].confusionSelfDmg
                 && (gSpecialStatuses[gBankTarget].moveturnLostHP_physical || gSpecialStatuses[gBankTarget].moveturnLostHP_special)
                 && (gBattleMoves[move].flags & FLAG_MAKES_CONTACT)
                 && (Random() % 3) == 0)
                {
                    gBattleCommunication[MOVE_EFFECT_BYTE] = 0x45;
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_ApplySecondaryEffect;
                    gHitMarker |= HITMARKER_IGNORE_SAFEGUARD;
                    effect++;
                }
                break;
            case ABILITY_FLAME_BODY:
            //_08019204
                if (!(gBattleMoveFlags & MOVESTATUS_NOEFFECT)
                 && gBattleMons[gBankAttacker].hp != 0
                 && !gProtectStructs[gBankAttacker].confusionSelfDmg
                 && (gBattleMoves[move].flags & FLAG_MAKES_CONTACT)
                 && (gSpecialStatuses[gBankTarget].moveturnLostHP_physical || gSpecialStatuses[gBankTarget].moveturnLostHP_special)
                 && (Random() % 3) == 0)
                {
                    gBattleCommunication[MOVE_EFFECT_BYTE] = 0x43;
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_ApplySecondaryEffect;
                    gHitMarker |= HITMARKER_IGNORE_SAFEGUARD;
                    effect++;
                }
                break;
            case ABILITY_CUTE_CHARM:
            //_080192E0
                if (!(gBattleMoveFlags & MOVESTATUS_NOEFFECT)
                 && gBattleMons[gBankAttacker].hp != 0
                 && !gProtectStructs[gBankAttacker].confusionSelfDmg
                 && (gBattleMoves[move].flags & FLAG_MAKES_CONTACT)
                 && (gSpecialStatuses[gBankTarget].moveturnLostHP_physical || gSpecialStatuses[gBankTarget].moveturnLostHP_special)
                 && gBattleMons[gBankTarget].hp != 0
                 && (Random() % 3) == 0
                 && gBattleMons[gBankAttacker].ability != ABILITY_OBLIVIOUS
                 && GetGenderFromSpeciesAndPersonality(speciesAtk, pidAtk) != GetGenderFromSpeciesAndPersonality(speciesDef, pidDef)
                 && !(gBattleMons[gBankAttacker].status2 & STATUS2_INFATUATION)
                 && GetGenderFromSpeciesAndPersonality(speciesAtk, pidAtk) != 0xFF
                 && GetGenderFromSpeciesAndPersonality(speciesDef, pidDef) != 0xFF)
                {
                    gBattleMons[gBankAttacker].status2 |= (gBitTable[gBankTarget] << 0x10);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_CuteCharmActivates;
                    effect++;
                }
                break;
            }
            break;
        case ABILITYEFFECT_IMMUNITY: // 5
        //_08019448
            {
                for (bank = 0; bank < gNoOfAllBanks; bank++)
                {
                    switch (gBattleMons[bank].ability)
                    {
                    case ABILITY_IMMUNITY:
                        if (gBattleMons[bank].status1 & (STATUS_POISON | STATUS_TOXIC_POISON | 0xF00))  // TODO: what is 0xF00?
                        {
                            StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);
                            effect = 1;
                        }
                        break;
                    case ABILITY_OWN_TEMPO:
                        if (gBattleMons[bank].status2 & STATUS2_CONFUSION)
                        {
                            StringCopy(gBattleTextBuff1, gStatusConditionString_ConfusionJpn);
                            effect = 2;
                        }
                        break;
                    case ABILITY_LIMBER:
                        if (gBattleMons[bank].status1 & STATUS_PARALYSIS)
                        {
                            StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);
                            effect = 1;
                        }
                        break;
                    case ABILITY_INSOMNIA:
                    case ABILITY_VITAL_SPIRIT:
                        if (gBattleMons[bank].status1 & STATUS_SLEEP)
                        {
                            gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE);
                            StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                            effect = 1;
                        }
                        break;
                    case ABILITY_WATER_VEIL:
                        if (gBattleMons[bank].status1 & STATUS_BURN)
                        {
                            StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
                            effect = 1;
                        }
                        break;
                    case ABILITY_MAGMA_ARMOR:
                        if (gBattleMons[bank].status1 & STATUS_FREEZE)
                        {
                            StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);
                            effect = 1;
                        }
                        break;
                    case ABILITY_OBLIVIOUS:
                        if (gBattleMons[bank].status2 & STATUS2_INFATUATION)
                        {
                            StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
                            effect = 3;
                        }
                        break;
                    }
                    if (effect)
                    {
                        switch (effect)
                        {
                        case 1: // status cleared
                            gBattleMons[bank].status1 = 0;
                            break;
                        case 2: // get rid of confusion
                            gBattleMons[bank].status2 &= ~(STATUS2_CONFUSION);
                            break;
                        case 3: // get rid of infatuation
                            gBattleMons[bank].status2 &= ~(STATUS2_INFATUATION);
                            break;
                        }
                        b_movescr_stack_push_cursor();
                        gBattlescriptCurrInstr = BattleScript_AbilityCuredStatus;
                        BATTLE_STRUCT->scriptingActive = bank;
                        gActiveBank = bank;
                        EmitSetAttributes(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
                        MarkBufferBankForExecution(gActiveBank);
                        return effect;
                    }
                }
            }
            break;
        case ABILITYEFFECT_FORECAST: // 6
        //_080197B4
            {
                for (bank = 0; bank < gNoOfAllBanks; bank++)
                {
                    if (gBattleMons[bank].ability == ABILITY_FORECAST)
                    {
                        effect = CastformDataTypeChange(bank);
                        if (effect)
                        {
                            b_push_move_exec(BattleScript_CastformChange);
                            BATTLE_STRUCT->scriptingActive = bank;
                            BATTLE_STRUCT->castformToChangeInto = effect - 1;
                            return effect;
                        }
                    }
                }
            }
            break;
        case ABILITYEFFECT_SYNCHRONIZE: // 7
        //_08019804
            if (gLastUsedAbility == ABILITY_SYNCHRONIZE && (gHitMarker & HITMARKER_SYNCHRONISE_EFFECT))
            {
                gHitMarker &= ~(HITMARKER_SYNCHRONISE_EFFECT);
                BATTLE_STRUCT->synchroniseEffect &= 0x3F;
                if (BATTLE_STRUCT->synchroniseEffect == 6)
                    BATTLE_STRUCT->synchroniseEffect = 2;
                gBattleCommunication[MOVE_EFFECT_BYTE] = BATTLE_STRUCT->synchroniseEffect + 0x40;
                BATTLE_STRUCT->scriptingActive = gBankTarget;
                b_movescr_stack_push_cursor();
                gBattlescriptCurrInstr = BattleScript_SynchronizeActivates;
                gHitMarker |= HITMARKER_IGNORE_SAFEGUARD;
                effect++;
            }
            break;
        case ABILITYEFFECT_ATK_SYNCHRONIZE: // 8
        //_08019880
            if (gLastUsedAbility == ABILITY_SYNCHRONIZE && (gHitMarker & HITMARKER_SYNCHRONISE_EFFECT))
            {
                gHitMarker &= ~(HITMARKER_SYNCHRONISE_EFFECT);
                BATTLE_STRUCT->synchroniseEffect &= 0x3F;
                if (BATTLE_STRUCT->synchroniseEffect == 6)
                    BATTLE_STRUCT->synchroniseEffect = 2;
                gBattleCommunication[MOVE_EFFECT_BYTE] = BATTLE_STRUCT->synchroniseEffect;
                BATTLE_STRUCT->scriptingActive = gBankAttacker;
                b_movescr_stack_push_cursor();
                gBattlescriptCurrInstr = BattleScript_SynchronizeActivates;
                gHitMarker |= HITMARKER_IGNORE_SAFEGUARD;
                effect++;
            }
            break;
        case ABILITYEFFECT_INTIMIDATE1: // 9
        //_080198FC
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (gBattleMons[i].ability == ABILITY_INTIMIDATE && gStatuses3[i] & STATUS3_INTIMIDATE_POKES)
                {
                    gLastUsedAbility = ABILITY_INTIMIDATE;
                    gStatuses3[i] &= ~(STATUS3_INTIMIDATE_POKES);
                    b_push_move_exec(gUnknown_081D978C);
                    BATTLE_STRUCT->intimidateBank = i;
                    effect++;
                    break;
                }
            }
            break;
        case ABILITYEFFECT_TRACE: // 11
        //_08019940
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (gBattleMons[i].ability == ABILITY_TRACE && (gStatuses3[i] & STATUS3_TRACE))
                {
                    u8 target2;
                    side = (GetBankIdentity(i) ^ 1) & 1;
                    target1 = GetBankByIdentity(side);
                    target2 = GetBankByIdentity(side + 2);
                    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                    {
                        if (gBattleMons[target1].ability != 0 && gBattleMons[target1].hp != 0
                         && gBattleMons[target2].ability != 0 && gBattleMons[target2].hp != 0)
                        {
                            //_080199AE
                            gActiveBank = GetBankByIdentity(((Random() & 1) * 2) | side);
                            gBattleMons[i].ability = gBattleMons[gActiveBank].ability;
                            gLastUsedAbility = gBattleMons[gActiveBank].ability;
                            effect++;
                        }
                        else if (gBattleMons[target1].ability != 0 && gBattleMons[target1].hp != 0)
                        {
                            //_08019A34
                            gActiveBank = target1;
                            gBattleMons[i].ability = gBattleMons[gActiveBank].ability;
                            gLastUsedAbility = gBattleMons[gActiveBank].ability;
                            effect++;
                        }
                        else if (gBattleMons[target2].ability != 0 && gBattleMons[target2].hp != 0)
                        {
                            //_08019A78
                            gActiveBank = target2;
                            gBattleMons[i].ability = gBattleMons[gActiveBank].ability;
                            gLastUsedAbility = gBattleMons[gActiveBank].ability;
                            effect++;
                        }
                    }
                    else
                    //_08019ABC
                    {
                        gActiveBank = target1;
                        if (gBattleMons[target1].ability && gBattleMons[target1].hp)
                        {
                            gBattleMons[i].ability = gBattleMons[target1].ability;
                            gLastUsedAbility = gBattleMons[target1].ability;
                            effect++;
                        }
                    }
                    if (effect)
                    {
                        b_push_move_exec(BattleScript_TraceActivates);
                        gStatuses3[i] &= ~(STATUS3_TRACE);
                        BATTLE_STRUCT->scriptingActive = i;

                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 4;
                        gBattleTextBuff1[2] = gActiveBank;
                        gBattleTextBuff1[3] = gBattlePartyID[gActiveBank];
                        gBattleTextBuff1[4] = EOS;

                        gBattleTextBuff2[0] = 0xFD;
                        gBattleTextBuff2[1] = 9;
                        gBattleTextBuff2[2] = gLastUsedAbility;
                        gBattleTextBuff2[3] = EOS;
                        break;
                    }
                }
            }
            break;
        case ABILITYEFFECT_INTIMIDATE2: // 10
        //_08019B1C
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (gBattleMons[i].ability == ABILITY_INTIMIDATE && (gStatuses3[i] & STATUS3_INTIMIDATE_POKES))
                {
                    gLastUsedAbility = ABILITY_INTIMIDATE;
                    gStatuses3[i] &= ~(STATUS3_INTIMIDATE_POKES);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = gUnknown_081D9795;
                    BATTLE_STRUCT->intimidateBank = i;
                    effect++;
                    break;
                }
            }
            break;
        case ABILITYEFFECT_CHECK_OTHER_SIDE: // 12
        //_08019B60
            side = GetBankSide(bank);
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (GetBankSide(i) != side && gBattleMons[i].ability == ability)
                {
                    gLastUsedAbility = ability;
                    effect = i + 1;
                }
            }
            break;
        case ABILITYEFFECT_CHECK_BANK_SIDE: // 13
        //_08019BBC
            side = GetBankSide(bank);
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (GetBankSide(i) == side && gBattleMons[i].ability == ability)
                {
                    gLastUsedAbility = ability;
                    effect = i + 1;
                }
            }
            break;
        case ABILITYEFFECT_FIELD_SPORT: // 14
        //_08019C18
            switch (gLastUsedAbility)
            {
            case 0xFD:
                for (i = 0; i < gNoOfAllBanks; i++)
                {
                    if (gStatuses3[i] & STATUS3_MUDSPORT)
                        effect = i + 1;
                }
                break;
            case 0xFE:
                for (i = 0; i < gNoOfAllBanks; i++)
                {
                    if (gStatuses3[i] & STATUS3_WATERSPORT)
                        effect = i + 1;
                }
                break;
            default:
                for (i = 0; i < gNoOfAllBanks; i++)
                {
                    if (gBattleMons[i].ability == ability)
                    {
                        gLastUsedAbility = ability;
                        effect = i + 1;
                    }
                }
                break;
            }
            break;
        case ABILITYEFFECT_CHECK_ON_FIELD: // 19
        //_08019CD4
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (gBattleMons[i].ability == ability && gBattleMons[i].hp != 0)
                {
                    gLastUsedAbility = ability;
                    effect = i + 1;
                }
            }
            break;
        case ABILITYEFFECT_CHECK_FIELD_EXCEPT_BANK: // 15
        //_08019D18
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (gBattleMons[i].ability == ability && i != bank)
                {
                    gLastUsedAbility = ability;
                    effect = i + 1;
                }
            }
            break;
        case ABILITYEFFECT_COUNT_OTHER_SIZE: // 16
        //_08019D5C
            side = GetBankSide(bank);
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (GetBankSide(i) != side && gBattleMons[i].ability == ability)
                {
                    gLastUsedAbility = ability;
                    effect++;
                }
            }
            break;
        case ABILITYEFFECT_COUNT_BANK_SIDE: // 17
        //_08019DB8
            side = GetBankSide(bank);
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (GetBankSide(i) == side && gBattleMons[i].ability == ability)
                {
                    gLastUsedAbility = ability;
                    effect++;
                }
            }
            break;
        case ABILITYEFFECT_COUNT_ON_FIELD: // 18
        //_08019F44
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (gBattleMons[i].ability == ability && i != bank)
                {
                    gLastUsedAbility = ability;
                    effect++;
                }
            }
            break;
        }
        //_08019F76
        if (effect && caseID < 0xC && gLastUsedAbility != 0xFF)
            RecordAbilityBattle(bank, gLastUsedAbility);
    }

    return effect;
}

void b_call_bc_move_exec(u8* BS_ptr)
{
    gBattlescriptCurrInstr = BS_ptr;
    B_FUNCTION_STACK->ptr[B_FUNCTION_STACK->size++] = gBattleMainFunc;
    gBattleMainFunc = sub_8013F54;
    gCurrentActionFuncId = 0;
}

void b_push_move_exec(u8* BS_ptr)
{
    b_movescr_stack_push_cursor();
    gBattlescriptCurrInstr = BS_ptr;
    B_FUNCTION_STACK->ptr[B_FUNCTION_STACK->size++] = gBattleMainFunc;
    gBattleMainFunc = sub_8013FBC;
}

enum
{
    ITEM_NO_EFFECT, // 0
    ITEM_STATUS_CHANGE, // 1
    ITEM_EFFECT_OTHER, // 2
    ITEM_PP_CHANGE, // 3
    ITEM_HP_CHANGE, // 4
    ITEM_STATS_CHANGE, // 5
};

enum
{
    FLAVOR_SPICY, // 0
    FLAVOR_DRY, // 1
    FLAVOR_SWEET, // 2
    FLAVOR_BITTER, // 3
    FLAVOR_SOUR, // 4
};

u8 ItemBattleEffects(u8 caseID, u8 bank, bool8 moveTurn)
{
    int i = 0;
    u8 effect = ITEM_NO_EFFECT;
    u8 changedPP = 0;
    u8 bankHoldEffect, atkHoldEffect, defHoldEffect;
    u8 bankQuality, atkQuality, defQuality;
    u16 atkItem, defItem;

    gLastUsedItem = gBattleMons[bank].item;
    if (gLastUsedItem == ITEM_ENIGMA_BERRY)
    {
        bankHoldEffect = gEnigmaBerries[bank].holdEffect;
        bankQuality = gEnigmaBerries[bank].holdEffectParam;
    }
    else
    {
        bankHoldEffect = ItemId_GetHoldEffect(gLastUsedItem);
        bankQuality = ItemId_GetHoldEffectParam(gLastUsedItem);
    }

    atkItem = gBattleMons[gBankAttacker].item;
    if (atkItem == ITEM_ENIGMA_BERRY)
    {
        atkHoldEffect = gEnigmaBerries[gBankAttacker].holdEffect;
        atkQuality = gEnigmaBerries[gBankAttacker].holdEffectParam;
    }
    else
    {
        atkHoldEffect = ItemId_GetHoldEffect(atkItem);
        atkQuality = ItemId_GetHoldEffectParam(atkItem);
    }

    // def variables are unused
    defItem = gBattleMons[gBankTarget].item;
    if (defItem == ITEM_ENIGMA_BERRY)
    {
        defHoldEffect = gEnigmaBerries[gBankTarget].holdEffect;
        defQuality = gEnigmaBerries[gBankTarget].holdEffectParam;
    }
    else
    {
        defHoldEffect = ItemId_GetHoldEffect(defItem);
        defQuality = ItemId_GetHoldEffectParam(defItem);
    }

    switch (caseID)
    {
    case 0:
        switch (bankHoldEffect)
        {
        case HOLD_EFFECT_DOUBLE_PRIZE:
            BATTLE_STRUCT->moneyMultiplier = 2;
            break;
        case HOLD_EFFECT_RESTORE_STATS:
            for (i = 0; i < 8; i++)
            {
                if (gBattleMons[bank].statStages[i] < 6)
                {
                    gBattleMons[bank].statStages[i] = 6;
                    effect = ITEM_STATS_CHANGE;
                }
            }
            if (effect)
            {
                BATTLE_STRUCT->scriptingActive = bank;
                gStringBank = bank;
                gActiveBank = gBankAttacker = bank;
                b_call_bc_move_exec(BattleScript_WhiteHerbEnd2);
            }
            break;
        }
        break;
    case 1:
        if (gBattleMons[bank].hp)
        {
            switch (bankHoldEffect)
            {
            case HOLD_EFFECT_RESTORE_HP:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / 2 && !moveTurn)
                {
                    gBattleMoveDamage = bankQuality;
                    if (gBattleMons[bank].hp + bankQuality > gBattleMons[bank].maxHP)
                        gBattleMoveDamage = gBattleMons[bank].maxHP - gBattleMons[bank].hp;
                    gBattleMoveDamage *= -1;
                    b_call_bc_move_exec(BattleScript_ItemHealHP_RemoveItem);
                    effect = 4;
                }
                break;
            case HOLD_EFFECT_RESTORE_PP:
                if (!moveTurn)
                {
                    struct Pokemon* poke;
                    u8 ppBonuses;
                    u16 move;

                    if (GetBankSide(bank) == 0)
                        poke = &gPlayerParty[gBattlePartyID[bank]];
                    else
                        poke = &gEnemyParty[gBattlePartyID[bank]];
                    for (i = 0; i < 4; i++)
                    {
                        move = GetMonData(poke, MON_DATA_MOVE1 + i);
                        changedPP = GetMonData(poke, MON_DATA_PP1 + i);
                        ppBonuses = GetMonData(poke, MON_DATA_PP_BONUSES);
                        if (move && changedPP == 0)
                            break;
                    }
                    if (i != 4)
                    {
                        u8 maxPP = CalculatePPWithBonus(move, ppBonuses, i);
                        if (changedPP + bankQuality > maxPP)
                            changedPP = maxPP;
                        else
                            changedPP = changedPP + bankQuality;
                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 2;
                        gBattleTextBuff1[2] = move;
                        gBattleTextBuff1[3] = move >> 8;
                        gBattleTextBuff1[4] = 0xFF;
                        b_call_bc_move_exec(BattleScript_BerryPPHealEnd2);
                        EmitSetAttributes(0, i + REQUEST_PPMOVE1_BATTLE, 0, 1, &changedPP);
                        MarkBufferBankForExecution(gActiveBank);
                        effect = ITEM_PP_CHANGE;
                    }
                }
                break;
            case HOLD_EFFECT_RESTORE_STATS:
                for (i = 0; i < 8; i++)
                {
                    if (gBattleMons[bank].statStages[i] < 6)
                    {
                        gBattleMons[bank].statStages[i] = 6;
                        effect = ITEM_STATS_CHANGE;
                    }
                }
                if (effect)
                {
                    BATTLE_STRUCT->scriptingActive = bank;
                    gStringBank = bank;
                    gActiveBank = gBankAttacker = bank;
                    b_call_bc_move_exec(BattleScript_WhiteHerbEnd2);
                }
                break;
            case HOLD_EFFECT_LEFTOVERS:
                if (gBattleMons[bank].hp < gBattleMons[bank].maxHP && !moveTurn)
                {
                    gBattleMoveDamage = gBattleMons[bank].maxHP / 16;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    if (gBattleMons[bank].hp + gBattleMoveDamage > gBattleMons[bank].maxHP)
                        gBattleMoveDamage = gBattleMons[bank].maxHP - gBattleMons[bank].hp;
                    gBattleMoveDamage *= -1;
                    b_call_bc_move_exec(BattleScript_ItemHealHP_End2);
                    effect = ITEM_HP_CHANGE;
                    RecordItemBattle(bank, bankHoldEffect);
                }
                break;
            // nice copy/paste there gamefreak, making a function for confuse berries was too much eh?
            case HOLD_EFFECT_CONFUSE_SPICY:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / 2 && !moveTurn)
                {
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 8;
                    gBattleTextBuff1[2] = FLAVOR_SPICY;
                    gBattleTextBuff1[3] = EOS;
                    gBattleMoveDamage = gBattleMons[bank].maxHP / bankQuality;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    if (gBattleMons[bank].hp + gBattleMoveDamage > gBattleMons[bank].maxHP)
                        gBattleMoveDamage = gBattleMons[bank].maxHP - gBattleMons[bank].hp;
                    gBattleMoveDamage *= -1;
                    if (GetPokeFlavourRelation(gBattleMons[bank].personality, FLAVOR_SPICY) < 0)
                        b_call_bc_move_exec(BattleScript_BerryConfuseHealEnd2);
                    else
                        b_call_bc_move_exec(BattleScript_ItemHealHP_RemoveItem);
                    effect = ITEM_HP_CHANGE;
                }
                break;
            case HOLD_EFFECT_CONFUSE_DRY:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / 2 && !moveTurn)
                {
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 8;
                    gBattleTextBuff1[2] = FLAVOR_DRY;
                    gBattleTextBuff1[3] = EOS;
                    gBattleMoveDamage = gBattleMons[bank].maxHP / bankQuality;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    if (gBattleMons[bank].hp + gBattleMoveDamage > gBattleMons[bank].maxHP)
                        gBattleMoveDamage = gBattleMons[bank].maxHP - gBattleMons[bank].hp;
                    gBattleMoveDamage *= -1;
                    if (GetPokeFlavourRelation(gBattleMons[bank].personality, FLAVOR_DRY) < 0)
                        b_call_bc_move_exec(BattleScript_BerryConfuseHealEnd2);
                    else
                        b_call_bc_move_exec(BattleScript_ItemHealHP_RemoveItem);
                    effect = ITEM_HP_CHANGE;
                }
                break;
            case HOLD_EFFECT_CONFUSE_SWEET:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / 2 && !moveTurn)
                {
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 8;
                    gBattleTextBuff1[2] = FLAVOR_SWEET;
                    gBattleTextBuff1[3] = EOS;
                    gBattleMoveDamage = gBattleMons[bank].maxHP / bankQuality;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    if (gBattleMons[bank].hp + gBattleMoveDamage > gBattleMons[bank].maxHP)
                        gBattleMoveDamage = gBattleMons[bank].maxHP - gBattleMons[bank].hp;
                    gBattleMoveDamage *= -1;
                    if (GetPokeFlavourRelation(gBattleMons[bank].personality, FLAVOR_SWEET) < 0)
                        b_call_bc_move_exec(BattleScript_BerryConfuseHealEnd2);
                    else
                        b_call_bc_move_exec(BattleScript_ItemHealHP_RemoveItem);
                    effect = ITEM_HP_CHANGE;
                }
                break;
            case HOLD_EFFECT_CONFUSE_BITTER:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / 2 && !moveTurn)
                {
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 8;
                    gBattleTextBuff1[2] = FLAVOR_BITTER;
                    gBattleTextBuff1[3] = EOS;
                    gBattleMoveDamage = gBattleMons[bank].maxHP / bankQuality;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    if (gBattleMons[bank].hp + gBattleMoveDamage > gBattleMons[bank].maxHP)
                        gBattleMoveDamage = gBattleMons[bank].maxHP - gBattleMons[bank].hp;
                    gBattleMoveDamage *= -1;
                    if (GetPokeFlavourRelation(gBattleMons[bank].personality, FLAVOR_BITTER) < 0)
                        b_call_bc_move_exec(BattleScript_BerryConfuseHealEnd2);
                    else
                        b_call_bc_move_exec(BattleScript_ItemHealHP_RemoveItem);
                    effect = ITEM_HP_CHANGE;
                }
                break;
            case HOLD_EFFECT_CONFUSE_SOUR:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / 2 && !moveTurn)
                {
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 8;
                    gBattleTextBuff1[2] = FLAVOR_SOUR;
                    gBattleTextBuff1[3] = EOS;
                    gBattleMoveDamage = gBattleMons[bank].maxHP / bankQuality;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    if (gBattleMons[bank].hp + gBattleMoveDamage > gBattleMons[bank].maxHP)
                        gBattleMoveDamage = gBattleMons[bank].maxHP - gBattleMons[bank].hp;
                    gBattleMoveDamage *= -1;
                    if (GetPokeFlavourRelation(gBattleMons[bank].personality, FLAVOR_SOUR) < 0)
                        b_call_bc_move_exec(BattleScript_BerryConfuseHealEnd2);
                    else
                        b_call_bc_move_exec(BattleScript_ItemHealHP_RemoveItem);
                    effect = ITEM_HP_CHANGE;
                }
                break;
            // copy/paste again, smh
            case HOLD_EFFECT_ATTACK_UP:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / bankQuality && !moveTurn && gBattleMons[bank].statStages[STAT_STAGE_ATK] < 0xC)
                {
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 5;
                    gBattleTextBuff1[2] = STAT_STAGE_ATK;
                    gBattleTextBuff1[3] = EOS;

                    gBattleTextBuff2[0] = 0xFD;
                    gBattleTextBuff2[1] = 0;
                    gBattleTextBuff2[2] = 0xD2;
                    gBattleTextBuff2[3] = 0xD2 >> 8;
                    gBattleTextBuff2[4] = EOS;

                    gEffectBank = bank;
                    BATTLE_STRUCT->statChanger = 0x10 + STAT_STAGE_ATK;
                    BATTLE_STRUCT->animArg1 = 0xE + STAT_STAGE_ATK;
                    BATTLE_STRUCT->animArg2 = 0;
                    b_call_bc_move_exec(BattleScript_BerryStatRaiseEnd2);
                    effect = ITEM_STATS_CHANGE;
                }
                break;
            case HOLD_EFFECT_DEFENSE_UP:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / bankQuality && !moveTurn && gBattleMons[bank].statStages[STAT_STAGE_DEF] < 0xC)
                {
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 5;
                    gBattleTextBuff1[2] = STAT_STAGE_DEF;
                    gBattleTextBuff1[3] = EOS;

                    gEffectBank = bank;
                    BATTLE_STRUCT->statChanger = 0x10 + STAT_STAGE_DEF;
                    BATTLE_STRUCT->animArg1 = 0xE + STAT_STAGE_DEF;
                    BATTLE_STRUCT->animArg2 = 0;
                    b_call_bc_move_exec(BattleScript_BerryStatRaiseEnd2);
                    effect = ITEM_STATS_CHANGE;
                }
                break;
            case HOLD_EFFECT_SPEED_UP:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / bankQuality && !moveTurn && gBattleMons[bank].statStages[STAT_STAGE_SPEED] < 0xC)
                {
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 5;
                    gBattleTextBuff1[2] = STAT_STAGE_SPEED;
                    gBattleTextBuff1[3] = EOS;

                    gEffectBank = bank;
                    BATTLE_STRUCT->statChanger = 0x10 + STAT_STAGE_SPEED;
                    BATTLE_STRUCT->animArg1 = 0xE + STAT_STAGE_SPEED;
                    BATTLE_STRUCT->animArg2 = 0;
                    b_call_bc_move_exec(BattleScript_BerryStatRaiseEnd2);
                    effect = ITEM_STATS_CHANGE;
                }
                break;
            case HOLD_EFFECT_SP_ATTACK_UP:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / bankQuality && !moveTurn && gBattleMons[bank].statStages[STAT_STAGE_SPATK] < 0xC)
                {
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 5;
                    gBattleTextBuff1[2] = STAT_STAGE_SPATK;
                    gBattleTextBuff1[3] = EOS;

                    gEffectBank = bank;
                    BATTLE_STRUCT->statChanger = 0x10 + STAT_STAGE_SPATK;
                    BATTLE_STRUCT->animArg1 = 0xE + STAT_STAGE_SPATK;
                    BATTLE_STRUCT->animArg2 = 0;
                    b_call_bc_move_exec(BattleScript_BerryStatRaiseEnd2);
                    effect = ITEM_STATS_CHANGE;
                }
                break;
            case HOLD_EFFECT_SP_DEFENSE_UP:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / bankQuality && !moveTurn && gBattleMons[bank].statStages[STAT_STAGE_SPDEF] < 0xC)
                {
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 5;
                    gBattleTextBuff1[2] = STAT_STAGE_SPDEF;
                    gBattleTextBuff1[3] = EOS;

                    gEffectBank = bank;
                    BATTLE_STRUCT->statChanger = 0x10 + STAT_STAGE_SPDEF;
                    BATTLE_STRUCT->animArg1 = 0xE + STAT_STAGE_SPDEF;
                    BATTLE_STRUCT->animArg2 = 0;
                    b_call_bc_move_exec(BattleScript_BerryStatRaiseEnd2);
                    effect = ITEM_STATS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CRITICAL_UP:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / bankQuality && !moveTurn && !(gBattleMons[bank].status2 & STATUS2_FOCUS_ENERGY))
                {
                    gBattleMons[bank].status2 |= STATUS2_FOCUS_ENERGY;
                    b_call_bc_move_exec(BattleScript_BerryFocusEnergyEnd2);
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_RANDOM_STAT_UP:
                if (!moveTurn && gBattleMons[bank].hp <= gBattleMons[bank].maxHP / bankQuality)
                {
                    for (i = 0; i < 5; i++)
                    {
                        if (gBattleMons[bank].statStages[STAT_STAGE_ATK + i] < 0xC)
                            break;
                    }
                    if (i != 5)
                    {
                        do
                        {
                            i = Random() % 5;
                        } while (gBattleMons[bank].statStages[STAT_STAGE_ATK + i] == 0xC);

                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 5;
                        gBattleTextBuff1[2] = i + 1;
                        gBattleTextBuff1[3] = EOS;

                        gBattleTextBuff2[0] = 0xFD;
                        gBattleTextBuff2[1] = 0;
                        gBattleTextBuff2[2] = 0xD1;
                        gBattleTextBuff2[3] = 0xD1 >> 8;
                        gBattleTextBuff2[4] = 0;
                        gBattleTextBuff2[5] = 0xD2;
                        gBattleTextBuff2[6] = 0xD2 >> 8;
                        gBattleTextBuff2[7] = EOS;

                        gEffectBank = bank;
                        BATTLE_STRUCT->statChanger = 0x21 + i;
                        BATTLE_STRUCT->animArg1 = 0x21 + i + 6;
                        BATTLE_STRUCT->animArg2 = 0;
                        b_call_bc_move_exec(BattleScript_BerryStatRaiseEnd2);
                        effect = ITEM_STATS_CHANGE;
                    }
                }
                break;
            case HOLD_EFFECT_CURE_PAR:
                if (gBattleMons[bank].status1 & STATUS_PARALYSIS)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_PARALYSIS);
                    b_call_bc_move_exec(BattleScript_BerryCurePrlzEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_PSN:
                if (gBattleMons[bank].status1 & STATUS_PSN_ANY)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_PSN_ANY | STATUS_TOXIC_COUNTER);
                    b_call_bc_move_exec(BattleScript_BerryCurePsnEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_BRN:
                if (gBattleMons[bank].status1 & STATUS_BURN)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_BURN);
                    b_call_bc_move_exec(BattleScript_BerryCureBrnEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_FRZ:
                if (gBattleMons[bank].status1 & STATUS_FREEZE)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_FREEZE);
                    b_call_bc_move_exec(BattleScript_BerryCureFrzEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_SLP:
                if (gBattleMons[bank].status1 & STATUS_SLEEP)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_SLEEP);
                    gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE);
                    b_call_bc_move_exec(BattleScript_BerryCureSlpEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_CONFUSION:
                if (gBattleMons[bank].status2 & STATUS2_CONFUSION)
                {
                    gBattleMons[bank].status2 &= ~(STATUS2_CONFUSION);
                    b_call_bc_move_exec(BattleScript_BerryCureConfusionEnd2);
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_CURE_STATUS:
                if (gBattleMons[bank].status1 & STATUS_ANY || gBattleMons[bank].status2 & STATUS2_CONFUSION)
                {
                    i = 0;
                    if (gBattleMons[bank].status1 & STATUS_PSN_ANY)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);
                        i++;
                    }
                    if (gBattleMons[bank].status1 & STATUS_SLEEP)
                    {
                        gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE);
                        StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                        i++;
                    }
                    if (gBattleMons[bank].status1 & STATUS_PARALYSIS)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);
                        i++;
                    }
                    if (gBattleMons[bank].status1 & STATUS_BURN)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
                        i++;
                    }
                    if (gBattleMons[bank].status1 & STATUS_FREEZE)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);
                        i++;
                    }
                    if (gBattleMons[bank].status2 & STATUS2_CONFUSION)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_ConfusionJpn);
                        i++;
                    }
                    if (!(i > 1))
                        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                    else
                        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    gBattleMons[bank].status1 = 0;
                    gBattleMons[bank].status2 &= ~(STATUS2_CONFUSION);
                    b_call_bc_move_exec(BattleScript_BerryCureChosenStatusEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_ATTRACT:
                if (gBattleMons[bank].status2 & STATUS2_INFATUATION)
                {
                    gBattleMons[bank].status2 &= ~(STATUS2_INFATUATION);
                    StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
                    b_call_bc_move_exec(BattleScript_BerryCureChosenStatusEnd2);
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            }
            if (effect)
            {
                BATTLE_STRUCT->scriptingActive = bank;
                gStringBank = bank;
                gActiveBank = gBankAttacker = bank;
                switch (effect)
                {
                case ITEM_STATUS_CHANGE:
                    EmitSetAttributes(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[bank].status1);
                    MarkBufferBankForExecution(gActiveBank);
                    break;
                case ITEM_PP_CHANGE:
                    if (!(gBattleMons[bank].status2 & STATUS2_TRANSFORMED) && !(gDisableStructs[bank].unk18_b & gBitTable[i]))
                        gBattleMons[bank].pp[i] = changedPP;
                    break;
                }
            }
        }
        break;
    case 2:
        break;
    case 3:
        for (bank = 0; bank < gNoOfAllBanks; bank++)
        {
            gLastUsedItem = gBattleMons[bank].item;
            if (gBattleMons[bank].item == ITEM_ENIGMA_BERRY)
            {
                bankHoldEffect = gEnigmaBerries[bank].holdEffect;
                bankQuality = gEnigmaBerries[bank].holdEffectParam;
            }
            else
            {
                bankHoldEffect = ItemId_GetHoldEffect(gLastUsedItem);
                bankQuality = ItemId_GetHoldEffectParam(gLastUsedItem);
            }
            switch (bankHoldEffect)
            {
            case HOLD_EFFECT_CURE_PAR:
                if (gBattleMons[bank].status1 & STATUS_PARALYSIS)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_PARALYSIS);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureParRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_PSN:
                if (gBattleMons[bank].status1 & STATUS_PSN_ANY)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_PSN_ANY | STATUS_TOXIC_COUNTER);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCurePsnRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_BRN:
                if (gBattleMons[bank].status1 & STATUS_BURN)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_BURN);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureBrnRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_FRZ:
                if (gBattleMons[bank].status1 & STATUS_FREEZE)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_FREEZE);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureFrzRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_SLP:
                if (gBattleMons[bank].status1 & STATUS_SLEEP)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_SLEEP);
                    gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureSlpRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_CONFUSION:
                if (gBattleMons[bank].status2 & STATUS2_CONFUSION)
                {
                    gBattleMons[bank].status2 &= ~(STATUS2_CONFUSION);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureConfusionRet;
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_CURE_ATTRACT:
                if (gBattleMons[bank].status2 & STATUS2_INFATUATION)
                {
                    gBattleMons[bank].status2 &= ~(STATUS2_INFATUATION);
                    StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
                    b_movescr_stack_push_cursor();
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                    gBattlescriptCurrInstr = BattleScript_BerryCureChosenStatusRet;
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_CURE_STATUS:
                if (gBattleMons[bank].status1 & STATUS_ANY || gBattleMons[bank].status2 & STATUS2_CONFUSION)
                {
                    if (gBattleMons[bank].status1 & STATUS_PSN_ANY)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);
                    }
                    if (gBattleMons[bank].status1 & STATUS_SLEEP)
                    {
                        gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE);
                        StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                    }
                    if (gBattleMons[bank].status1 & STATUS_PARALYSIS)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);
                    }
                    if (gBattleMons[bank].status1 & STATUS_BURN)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
                    }
                    if (gBattleMons[bank].status1 & STATUS_FREEZE)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);
                    }
                    if (gBattleMons[bank].status2 & STATUS2_CONFUSION)
                    {
                        StringCopy(gBattleTextBuff1, gStatusConditionString_ConfusionJpn);
                    }
                    gBattleMons[bank].status1 = 0;
                    gBattleMons[bank].status2 &= ~(STATUS2_CONFUSION);
                    b_movescr_stack_push_cursor();
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                    gBattlescriptCurrInstr = BattleScript_BerryCureChosenStatusRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_RESTORE_STATS:
                for (i = 0; i < 8; i++)
                {
                    if (gBattleMons[bank].statStages[i] < 6)
                    {
                        gBattleMons[bank].statStages[i] = 6;
                        effect = ITEM_STATS_CHANGE;
                    }
                }
                if (effect)
                {
                    BATTLE_STRUCT->scriptingActive = bank;
                    gStringBank = bank;
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_WhiteHerbRet;
                    return effect; // unnecessary return
                }
                break;
            }
            if (effect)
            {
                BATTLE_STRUCT->scriptingActive = bank;
                gStringBank = bank;
                gActiveBank = bank;
                EmitSetAttributes(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
                MarkBufferBankForExecution(gActiveBank);
                break;
            }
        }
        break;
    case 4:
        if (gBattleMoveDamage)
        {
            switch (atkHoldEffect)
            {
            case HOLD_EFFECT_FLINCH:
                if (!(gBattleMoveFlags & MOVESTATUS_NOEFFECT)
                    && (gSpecialStatuses[gBankTarget].moveturnLostHP_physical || gSpecialStatuses[gBankTarget].moveturnLostHP_special)
                    && (Random() % 100) < bankQuality
                    && gBattleMoves[gCurrentMove].flags & FLAG_KINGSROCK_AFFECTED
                    && gBattleMons[gBankTarget].hp)
                {
                    gBattleCommunication[MOVE_EFFECT_BYTE] = 8;
                    b_movescr_stack_push_cursor();
                    SetMoveEffect(0, 0);
                    b_movescr_stack_pop_cursor();
                }
                break;
            case HOLD_EFFECT_SHELL_BELL:
                if (!(gBattleMoveFlags & MOVESTATUS_NOEFFECT)
                    && gSpecialStatuses[gBankTarget].moveturnLostHP != 0
                    && gSpecialStatuses[gBankTarget].moveturnLostHP != 0xFFFF
                    && gBankAttacker != gBankTarget
                    && gBattleMons[gBankAttacker].hp != gBattleMons[gBankAttacker].maxHP
                    && gBattleMons[gBankAttacker].hp != 0)
                {
                    gLastUsedItem = atkItem;
                    gStringBank = gBankAttacker;
                    BATTLE_STRUCT->scriptingActive = gBankAttacker;
                    gBattleMoveDamage = (gSpecialStatuses[gBankTarget].moveturnLostHP / atkQuality) * -1;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = -1;
                    gSpecialStatuses[gBankTarget].moveturnLostHP = 0;
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = BattleScript_ItemHealHP_Ret;
                    effect++;
                }
                break;
            }
        }
        break;
    }

    return effect;
}

struct CombinedMove
{
    u16 move1;
    u16 move2;
    u16 newMove;
};

static const struct CombinedMove sCombinedMoves[2] =
{
    {MOVE_EMBER, MOVE_GUST, MOVE_HEAT_WAVE},
    {0xFFFF, 0xFFFF, 0xFFFF}
};

void unref_sub_801B40C(void)
{
    int i = 0;
    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        do
        {
            u8 bank = 0;
            do
            {
                u8 absent = gAbsentBankFlags;
                if (gBitTable[bank] & absent || absent & gBitTable[bank + 2])
                    bank++;
                else
                {
                    if (sCombinedMoves[i].move1 == gChosenMovesByBanks[bank] && sCombinedMoves[i].move2 == gChosenMovesByBanks[bank + 2])
                    {
                        gSideTimers[GetBankIdentity(bank) & 1].field3 = (bank) | ((bank + 2) << 4);
                        gSideTimers[GetBankIdentity(bank) & 1].field4 = sCombinedMoves[i].newMove;
                        gSideAffecting[GetBankIdentity(bank) & 1] |= SIDE_STATUS_X4;
                    }
                    if (sCombinedMoves[i].move1 == gChosenMovesByBanks[bank + 2] && sCombinedMoves[i].move2 == gChosenMovesByBanks[bank])
                    {
                        gSideTimers[GetBankIdentity(bank) & 1].field3 = (bank + 2) | ((bank) << 4);
                        gSideTimers[GetBankIdentity(bank) & 1].field4 = sCombinedMoves[i].newMove;
                        gSideAffecting[GetBankIdentity(bank) & 1] |= SIDE_STATUS_X4;
                    }
                    bank++;
                }
            } while (bank < 2);
            i++;
        } while (sCombinedMoves[i].move1 != 0xFFFF);
    }
}

void sub_801B594(void)
{
    if (gBattleExecBuffer == 0)
        gBattleScriptingCommandsTable[*gBattlescriptCurrInstr]();
}

u8 GetMoveTarget(u16 move, u8 useMoveTarget) //get move target
{
    u8 targetBank = 0;
    u8 moveTarget;
    u8 side;

    if (useMoveTarget)
        moveTarget = useMoveTarget - 1;
    else
        moveTarget = gBattleMoves[move].target;

    switch (moveTarget)
    {
    case 0:
        side = GetBankSide(gBankAttacker) ^ 1;
        if (gSideTimers[side].followmeTimer && gBattleMons[gSideTimers[side].followmeTarget].hp)
            targetBank = gSideTimers[side].followmeTarget;
        else
        {
            side = GetBankSide(gBankAttacker);
            do
            {
                targetBank = Random() % gNoOfAllBanks;
            } while (targetBank == gBankAttacker || side == GetBankSide(targetBank) || gAbsentBankFlags & gBitTable[targetBank]);
            if (gBattleMoves[move].type == TYPE_ELECTRIC
                && AbilityBattleEffects(ABILITYEFFECT_COUNT_OTHER_SIZE, gBankAttacker, ABILITY_LIGHTNING_ROD, 0, 0)
                && gBattleMons[targetBank].ability != ABILITY_LIGHTNING_ROD)
            {
                targetBank ^= 2;
                RecordAbilityBattle(targetBank, gBattleMons[targetBank].ability);
                gSpecialStatuses[targetBank].lightningRodRedirected = 1;
            }
        }
        break;
    case 1:
    case 8:
    case 32:
    case 64:
        targetBank = GetBankByIdentity((GetBankIdentity(gBankAttacker) & 1) ^ 1);
        if (gAbsentBankFlags & gBitTable[targetBank])
            targetBank ^= 2;
        break;
    case 4:
        side = GetBankSide(gBankAttacker) ^ 1;
        if (gSideTimers[side].followmeTimer && gBattleMons[gSideTimers[side].followmeTarget].hp)
            targetBank = gSideTimers[side].followmeTarget;
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && moveTarget & 4)
        {
            if (GetBankSide(gBankAttacker) == 0)
            {
                if (Random() & 1)
                    targetBank = GetBankByIdentity(1);
                else
                    targetBank = GetBankByIdentity(3);
            }
            else
            {
                if (Random() & 1)
                    targetBank = GetBankByIdentity(0);
                else
                    targetBank = GetBankByIdentity(2);
            }
            if (gAbsentBankFlags & gBitTable[targetBank])
                targetBank ^= 2;
        }
        else
            targetBank = GetBankByIdentity((GetBankIdentity(gBankAttacker) & 1) ^ 1);
        break;
    case 2:
    case 16:
        targetBank = gBankAttacker;
        break;
    }
    ewram16010arr(gBankAttacker) = targetBank;
    return targetBank;
}

u8 IsPokeDisobedient(void)
{
    u8 obedienceLevel;
    s32 rnd;
    s32 calc;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK
     || GetBankSide(gBankAttacker) == 1
     || !IsOtherTrainer(gBattleMons[gBankAttacker].otId, gBattleMons[gBankAttacker].otName)
     || FlagGet(FLAG_BADGE08_GET))
        return 0;

    obedienceLevel = 10;
    if (FlagGet(FLAG_BADGE02_GET))
        obedienceLevel = 30;
    if (FlagGet(FLAG_BADGE04_GET))
        obedienceLevel = 50;
    if (FlagGet(FLAG_BADGE06_GET))
        obedienceLevel = 70;

    if (gBattleMons[gBankAttacker].level <= obedienceLevel)
        return 0;
    rnd = (Random() & 255);
    calc = (gBattleMons[gBankAttacker].level + obedienceLevel) * rnd >> 8;
    if (calc < obedienceLevel)
        return 0;

    // is not obedient
    if (gCurrentMove == MOVE_RAGE)
        gBattleMons[gBankAttacker].status2 &= ~(STATUS2_RAGE);
    if (gBattleMons[gBankAttacker].status1 & STATUS_SLEEP && (gCurrentMove == MOVE_SNORE || gCurrentMove == MOVE_SLEEP_TALK))
    {
        gBattlescriptCurrInstr = gUnknown_081D995F;
        return 1;
    }

    rnd = (Random() & 255);
    calc = (gBattleMons[gBankAttacker].level + obedienceLevel) * rnd >> 8;
    if (calc < obedienceLevel)
    {
        calc = CheckMoveLimitations(gBankAttacker, gBitTable[gCurrMovePos], 0xFF);
        if (calc == 0xF) // all moves cannot be used
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = Random() & 3;
            gBattlescriptCurrInstr = BattleScript_MoveUsedLoafingAround;
            return 1;
        }
        else // use a random move
        {
            do
            {
                gCurrMovePos = gUnknown_02024BE5 = Random() & 3;
            } while (gBitTable[gCurrMovePos] & calc);
            gRandomMove = gBattleMons[gBankAttacker].moves[gCurrMovePos];
            gBattleCommunication[3] = 0;
            gDynamicBasePower = 0;
            BATTLE_STRUCT->dynamicMoveType = 0;
            gBattlescriptCurrInstr = BattleScript_IgnoresAndUsesRandomMove;
            gBankTarget = GetMoveTarget(gRandomMove, 0);
            gHitMarker |= HITMARKER_x200000;
            return 2;
        }
    }
    else
    {
        obedienceLevel = gBattleMons[gBankAttacker].level - obedienceLevel;

        calc = (Random() & 255);
        if (calc < obedienceLevel && !(gBattleMons[gBankAttacker].status1 & STATUS_ANY) && gBattleMons[gBankAttacker].ability != ABILITY_VITAL_SPIRIT && gBattleMons[gBankAttacker].ability != ABILITY_INSOMNIA)
        {
            // try putting asleep
            int i;
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (gBattleMons[i].status2 & STATUS2_UPROAR)
                    break;
            }
            if (i == gNoOfAllBanks)
            {
                gBattlescriptCurrInstr = BattleScript_IgnoresAndFallsAsleep;
                return 1;
            }
        }
        calc -= obedienceLevel;
        if (calc < obedienceLevel)
        {
            gBattleMoveDamage = CalculateBaseDamage(&gBattleMons[gBankAttacker], &gBattleMons[gBankAttacker], MOVE_POUND, 0, 40, 0, gBankAttacker, gBankAttacker);
            gBankTarget = gBankAttacker;
            gBattlescriptCurrInstr = gUnknown_081D99A0;
            gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
            return 2;
        }
        else
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = Random() & 3;
            gBattlescriptCurrInstr = BattleScript_MoveUsedLoafingAround;
            return 1;
        }
    }
}
