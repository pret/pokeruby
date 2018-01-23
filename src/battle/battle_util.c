#include "global.h"
#include "battle.h"
#include "battle_util.h"
#include "data2.h"
#include "event_data.h"
#include "ewram.h"
#include "field_weather.h"
#include "item.h"
#include "link.h"
#include "pokemon.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "string_util.h"
#include "text.h"
#include "util.h"
#include "constants/abilities.h"
#include "constants/battle_move_effects.h"
#include "constants/flags.h"
#include "constants/hold_effects.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/species.h"
#include "constants/weather.h"

extern const u8* gBattlescriptCurrInstr;
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
extern u8 gBanksByTurnOrder[4];
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
extern u8 gSentPokesToOpponent[2];
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
void SetMoveEffect(bool8 primary, u8 certainArg);
bool8 UproarWakeUpCheck(u8 bank);
bool8 sub_8018018(u8 bank, u8, u8);
s32 CalculateBaseDamage(struct BattlePokemon *attacker, struct BattlePokemon *defender, u32 move, u16 a4, u16 powerOverride, u8 typeOverride, u8 bank_atk, u8 bank_def);
u8 CountTrailingZeroBits(u32 a);
u8 GetMoveTarget(u16 move, u8 useMoveTarget);
u8 sub_803FC34(u8 bank);
u16 sub_803FBFC(u8 a);
void RecordAbilityBattle(u8 bank, u8 ability);
void RecordItemBattle(u8 bank, u8 holdEffect);
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

u8 GetBattleBank(u8 caseId)
{
    u8 ret = 0;
    switch (caseId)
    {
    case BS_GET_TARGET:
        ret = gBankTarget;
        break;
    case BS_GET_ATTACKER:
        ret = gBankAttacker;
        break;
    case BS_GET_EFFECT_BANK:
        ret = gEffectBank;
        break;
    case BS_GET_BANK_0:
        ret = 0;
        break;
    case BS_GET_SCRIPTING_BANK:
        ret = ewram16003;
        break;
    case BS_GET_gBank1:
        ret = gBank1;
        break;
    case 5:
        ret = gBank1;
        break;
    }
    return ret;
}

void PressurePPLose(u8 bankDef, u8 bankAtk, u16 move)
{
    s32 i;

    if (gBattleMons[bankDef].ability != ABILITY_PRESSURE)
        return;

    for (i = 0; i < 4; i++)
    {
        if (gBattleMons[bankAtk].moves[i] == move)
            break;
    }

    if (i == 4) // mons don't share any moves
        return;

    if (gBattleMons[bankAtk].pp[i] != 0)
        gBattleMons[bankAtk].pp[i]--;

    if (!(gBattleMons[bankAtk].status2 & STATUS2_TRANSFORMED)
        && !(gDisableStructs[bankAtk].unk18_b & gBitTable[i]))
    {
        gActiveBank = bankAtk;
        EmitSetMonData(0, REQUEST_PPMOVE1_BATTLE + i, 0, 1, &gBattleMons[gActiveBank].pp[i]);
        MarkBufferBankForExecution(gActiveBank);
    }
}

void PressurePPLoseOnUsingImprision(u8 bankAtk)
{
    s32 i, j;
    s32 imprisionPos = 4;
    u8 atkSide = GetBankSide(bankAtk);

    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (atkSide != GetBankSide(i) && gBattleMons[i].ability == ABILITY_PRESSURE)
        {
            for (j = 0; j < 4; j++)
            {
                if (gBattleMons[bankAtk].moves[j] == MOVE_IMPRISON)
                    break;
            }
            if (j != 4)
            {
                imprisionPos = j;
                if (gBattleMons[bankAtk].pp[j] != 0)
                    gBattleMons[bankAtk].pp[j]--;
            }
        }
    }

    if (imprisionPos != 4
        && !(gBattleMons[bankAtk].status2 & STATUS2_TRANSFORMED)
        && !(gDisableStructs[bankAtk].unk18_b & gBitTable[imprisionPos]))
    {
        gActiveBank = bankAtk;
        EmitSetMonData(0, REQUEST_PPMOVE1_BATTLE + imprisionPos, 0, 1, &gBattleMons[gActiveBank].pp[imprisionPos]);
        MarkBufferBankForExecution(gActiveBank);
    }
}

void PressurePPLoseOnUsingPerishSong(u8 bankAtk)
{
    s32 i, j;
    s32 perishSongPos = 4;

    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (gBattleMons[i].ability == ABILITY_PRESSURE && i != bankAtk)
        {
            for (j = 0; j < 4; j++)
            {
                if (gBattleMons[bankAtk].moves[j] == MOVE_PERISH_SONG)
                    break;
            }
            if (j != 4)
            {
                perishSongPos = j;
                if (gBattleMons[bankAtk].pp[j] != 0)
                    gBattleMons[bankAtk].pp[j]--;
            }
        }
    }

    if (perishSongPos != 4
        && !(gBattleMons[bankAtk].status2 & STATUS2_TRANSFORMED)
        && !(gDisableStructs[bankAtk].unk18_b & gBitTable[perishSongPos]))
    {
        gActiveBank = bankAtk;
        EmitSetMonData(0, REQUEST_PPMOVE1_BATTLE + perishSongPos, 0, 1, &gBattleMons[gActiveBank].pp[perishSongPos]);
        MarkBufferBankForExecution(gActiveBank);
    }
}


void MarkAllBufferBanksForExecution(void) // unused
{
    s32 i;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        for (i = 0; i < gNoOfAllBanks; i++)
            gBattleExecBuffer |= gBitTable[i] << 0x1C;
    }
    else
    {
        for (i = 0; i < gNoOfAllBanks; i++)
            gBattleExecBuffer |= gBitTable[i];
    }
}

void MarkBufferBankForExecution(u8 bank)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        gBattleExecBuffer |= gBitTable[bank] << 0x1C;
    }
    else
    {
        gBattleExecBuffer |= gBitTable[bank];
    }
}

void sub_80155A4(u8 arg0)
{
    s32 i;

    for (i = 0; i < GetLinkPlayerCount(); i++)
        gBattleExecBuffer |= gBitTable[arg0] << (i << 2);

    gBattleExecBuffer &= ~(0x10000000 << arg0);
}

void CancelMultiTurnMoves(u8 bank)
{
    gBattleMons[bank].status2 &= ~(STATUS2_MULTIPLETURNS);
    gBattleMons[bank].status2 &= ~(STATUS2_LOCK_CONFUSE);
    gBattleMons[bank].status2 &= ~(STATUS2_UPROAR);
    gBattleMons[bank].status2 &= ~(STATUS2_BIDE);

    gStatuses3[bank] &= ~(STATUS3_SEMI_INVULNERABLE);

    gDisableStructs[bank].rolloutTimer1 = 0;
    gDisableStructs[bank].furyCutterCounter = 0;
}

bool8 WasUnableToUseMove(u8 bank)
{
    if (gProtectStructs[bank].prlzImmobility
        || gProtectStructs[bank].notEffective
        || gProtectStructs[bank].usedImprisionedMove
        || gProtectStructs[bank].loveImmobility
        || gProtectStructs[bank].usedDisabledMove
        || gProtectStructs[bank].usedTauntedMove
        || gProtectStructs[bank].flag2Unknown
        || gProtectStructs[bank].flinchImmobility
        || gProtectStructs[bank].confusionSelfDmg)
        return TRUE;
    else
        return FALSE;
}

void PrepareStringBattle(u16 stringId, u8 bank)
{
    gActiveBank = bank;
    EmitPrintString(0, stringId);
    MarkBufferBankForExecution(gActiveBank);
}

void ResetSentPokesToOpponentValue(void)
{
    s32 i;
    u32 bits = 0;

    gSentPokesToOpponent[0] = 0;
    gSentPokesToOpponent[1] = 0;

    for (i = 0; i < gNoOfAllBanks; i += 2)
        bits |= gBitTable[gBattlePartyID[i]];

    for (i = 1; i < gNoOfAllBanks; i += 2)
        gSentPokesToOpponent[(i & BIT_MON) >> 1] = bits;
}

void sub_8015740(u8 bank)
{
    s32 i = 0;
    u32 bits = 0;

    if (GetBankSide(bank) == SIDE_OPPONENT)
    {
        u8 id = ((bank & BIT_MON) >> 1);
        gSentPokesToOpponent[id] = 0;

        for (i = 0; i < gNoOfAllBanks; i += 2)
        {
            if (!(gAbsentBankFlags & gBitTable[i]))
                bits |= gBitTable[gBattlePartyID[i]];
        }

        gSentPokesToOpponent[id] = bits;
    }
}

void sub_80157C4(u8 bank)
{
    if (GetBankSide(bank) == SIDE_OPPONENT)
    {
        sub_8015740(bank);
    }
    else
    {
        s32 i;
        for (i = 1; i < gNoOfAllBanks; i++)
            gSentPokesToOpponent[(i & BIT_MON) >> 1] |= gBitTable[gBattlePartyID[bank]];
    }
}

void BattleScriptPush(const u8* BS_ptr)
{
    B_BATTLESCRIPTS_STACK->ptr[B_BATTLESCRIPTS_STACK->size++] = BS_ptr;
}

void BattleScriptPushCursor(void)
{
    B_BATTLESCRIPTS_STACK->ptr[B_BATTLESCRIPTS_STACK->size++] = gBattlescriptCurrInstr;
}

void BattleScriptPop(void)
{
    gBattlescriptCurrInstr = B_BATTLESCRIPTS_STACK->ptr[--B_BATTLESCRIPTS_STACK->size];
}

u8 TrySetCantSelectMoveBattleScript(void) //msg can't select a move
{
    u8 limitations = 0;
    u16 move = gBattleMons[gActiveBank].moves[gBattleBufferB[gActiveBank][2]];
    u8 holdEffect;
    u16* choicedMove = CHOICED_MOVE(gActiveBank);
    if (gDisableStructs[gActiveBank].disabledMove == move && move)
    {
        gBattleStruct->scriptingActive = gActiveBank;
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

        switch (gBattleStruct->turncountersTracker)
        {
        case 0:
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                gBanksByTurnOrder[i] = i;
            }
            for (i = 0; i < gNoOfAllBanks - 1; i++)
            {
                s32 j;
                for (j = i + 1; j < gNoOfAllBanks; j++)
                {
                    if (GetWhoStrikesFirst(gBanksByTurnOrder[i], gBanksByTurnOrder[j], 0))
                        SwapTurnOrder(i, j);
                }
            }
            gBattleStruct->turncountersTracker++;
            gBattleStruct->turnSideTracker = 0;
        case 1:
            while (gBattleStruct->turnSideTracker < 2)
            {
                gActiveBank = gBankAttacker = sideBank = gBattleStruct->turnSideTracker;

                if (gSideAffecting[sideBank] & SIDE_STATUS_REFLECT)
                {
                    if (--gSideTimers[sideBank].reflectTimer == 0)
                    {

                        gSideAffecting[sideBank] &= ~SIDE_STATUS_REFLECT;
                        BattleScriptExecute(BattleScript_SideStatusWoreOff);
                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 2;
                        gBattleTextBuff1[2] = MOVE_REFLECT;
                        gBattleTextBuff1[3] = MOVE_REFLECT >> 8;
                        gBattleTextBuff1[4] = EOS;
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turncountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case 2:
            while (gBattleStruct->turnSideTracker < 2)
            {
                gActiveBank = gBankAttacker = sideBank = gBattleStruct->turnSideTracker;
                if (gSideAffecting[sideBank] & SIDE_STATUS_LIGHTSCREEN)
                {
                    if (--gSideTimers[sideBank].lightscreenTimer == 0)
                    {
                        gSideAffecting[sideBank] &= ~SIDE_STATUS_LIGHTSCREEN;
                        BattleScriptExecute(BattleScript_SideStatusWoreOff);
                        gBattleCommunication[MULTISTRING_CHOOSER] = sideBank;
                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 2;
                        gBattleTextBuff1[2] = MOVE_LIGHT_SCREEN;
                        gBattleTextBuff1[3] = MOVE_LIGHT_SCREEN >> 8;
                        gBattleTextBuff1[4] = EOS;
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turncountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case 3:
            while (gBattleStruct->turnSideTracker < 2)
            {
                gActiveBank = gBankAttacker = sideBank = gBattleStruct->turnSideTracker;
                if (gSideTimers[sideBank].mistTimer && --gSideTimers[sideBank].mistTimer == 0)
                {
                    gSideAffecting[sideBank] &= ~SIDE_STATUS_MIST;
                    BattleScriptExecute(BattleScript_SideStatusWoreOff);
                    gBattleCommunication[MULTISTRING_CHOOSER] = sideBank;
                    gBattleTextBuff1[0] = 0xFD;
                    gBattleTextBuff1[1] = 2;
                    gBattleTextBuff1[2] = MOVE_MIST;
                    gBattleTextBuff1[3] = MOVE_MIST >> 8;
                    gBattleTextBuff1[4] = EOS;
                    effect++;
                }
                gBattleStruct->turnSideTracker++;
                if (effect)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turncountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case 4:
            while (gBattleStruct->turnSideTracker < 2)
            {
                gActiveBank = gBankAttacker = sideBank = gBattleStruct->turnSideTracker;
                if (gSideAffecting[sideBank] & SIDE_STATUS_SAFEGUARD)
                {
                    if (--gSideTimers[sideBank].safeguardTimer == 0)
                    {
                        gSideAffecting[sideBank] &= ~SIDE_STATUS_SAFEGUARD;
                        BattleScriptExecute(BattleScript_SafeguardEnds);
                        effect++;
                    }
                }
                gBattleStruct->turnSideTracker++;
                if (effect)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turncountersTracker++;
                gBattleStruct->turnSideTracker = 0;
            }
            break;
        case 5:
            while (gBattleStruct->turnSideTracker < gNoOfAllBanks)
            {
                gActiveBank = gBanksByTurnOrder[gBattleStruct->turnSideTracker];
                if (gWishFutureKnock.wishCounter[gActiveBank] && --gWishFutureKnock.wishCounter[gActiveBank] == 0 && gBattleMons[gActiveBank].hp)
                {
                    gBankTarget = gActiveBank;
                    BattleScriptExecute(BattleScript_WishComesTrue);
                    effect++;
                }
                gBattleStruct->turnSideTracker++;
                if (effect)
                    break;
            }
            if (!effect)
            {
                gBattleStruct->turncountersTracker++;
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
                BattleScriptExecute(BattleScript_RainContinuesOrEnds);
                effect++;
            }
            gBattleStruct->turncountersTracker++;
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

                gBattleStruct->animArg1 = B_ANIM_SANDSTORM_CONTINUES;
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                BattleScriptExecute(gBattlescriptCurrInstr);
                effect++;
            }
            gBattleStruct->turncountersTracker++;
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

                BattleScriptExecute(gBattlescriptCurrInstr);
                effect++;
            }
            gBattleStruct->turncountersTracker++;
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

                gBattleStruct->animArg1 = B_ANIM_HAIL_CONTINUES;
                gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                BattleScriptExecute(gBattlescriptCurrInstr);
                effect++;
            }
            gBattleStruct->turncountersTracker++;
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
    while (gBattleStruct->turnEffectsBank < gNoOfAllBanks && gBattleStruct->turnEffectsTracker <= TURNBASED_MAX_CASE)
    {
        gActiveBank = gBankAttacker = gBanksByTurnOrder[gBattleStruct->turnEffectsBank];
        if (gAbsentBankFlags & gBitTable[gActiveBank])
        {
            gBattleStruct->turnEffectsBank++;
        }
        else
        {
            switch (gBattleStruct->turnEffectsTracker)
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
                    BattleScriptExecute(BattleScript_IngrainTurnHeal);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case 1:  // end turn abilities
                if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, gActiveBank, 0, 0, 0))
                    effect++;
                gBattleStruct->turnEffectsTracker++;
                break;
            case 2:  // item effects
                if (ItemBattleEffects(1, gActiveBank, 0))
                    effect++;
                gBattleStruct->turnEffectsTracker++;
                break;
            case 18:  // item effects again
                if (ItemBattleEffects(1, gActiveBank, 1))
                    effect++;
                gBattleStruct->turnEffectsTracker++;
                break;
            case 3:  // leech seed
                if (gStatuses3[gActiveBank] & STATUS3_LEECHSEED && gBattleMons[gStatuses3[gActiveBank] & STATUS3_LEECHSEED_BANK].hp != 0 && gBattleMons[gActiveBank].hp != 0)
                {
                    gBankTarget = gStatuses3[gActiveBank] & STATUS3_LEECHSEED_BANK; //funny how the 'target' is actually the bank that receives HP
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 8;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    gBattleStruct->animArg1 = gBankTarget;
                    gBattleStruct->animArg2 = gBankAttacker;
                    BattleScriptExecute(BattleScript_LeechSeedTurnDrain);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case 4:  // poison
                if ((gBattleMons[gActiveBank].status1 & STATUS_POISON) && gBattleMons[gActiveBank].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 8;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    BattleScriptExecute(BattleScript_PoisonTurnDmg);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
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
                    BattleScriptExecute(BattleScript_PoisonTurnDmg);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case 6:  // burn
                if ((gBattleMons[gActiveBank].status1 & STATUS_BURN) && gBattleMons[gActiveBank].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 8;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    BattleScriptExecute(BattleScript_BurnTurnDmg);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case 7:  // spooky nightmares
                if ((gBattleMons[gActiveBank].status2 & STATUS2_NIGHTMARE) && gBattleMons[gActiveBank].hp != 0)
                {
                    // missing sleep check
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 4;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    BattleScriptExecute(BattleScript_NightmareTurnDmg);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case 8:  // curse
                if ((gBattleMons[gActiveBank].status2 & STATUS2_CURSED) && gBattleMons[gActiveBank].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 4;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    BattleScriptExecute(BattleScript_CurseTurnDmg);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case 9:  // wrap
                if ((gBattleMons[gActiveBank].status2 & STATUS2_WRAPPED) && gBattleMons[gActiveBank].hp != 0)
                {
                    gBattleMons[gActiveBank].status2 -= 0x2000;
                    if (gBattleMons[gActiveBank].status2 & STATUS2_WRAPPED)  // damaged by wrap
                    {
                        gBattleStruct->animArg1 = ewram16004arr(0, gActiveBank);
                        gBattleStruct->animArg2 = ewram16004arr(1, gActiveBank);
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
                    BattleScriptExecute(gBattlescriptCurrInstr);
                    effect++;
                }
                gBattleStruct->turnEffectsTracker++;
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
                            BattleScriptExecute(BattleScript_MonWokeUpInUproar);
                            gActiveBank = gBankAttacker;
                            EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
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
                        if (WasUnableToUseMove(gActiveBank))
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
                        BattleScriptExecute(BattleScript_PrintUproarOverTurns);
                        effect = 1;
                    }
                }
                if (effect != 2)
                    gBattleStruct->turnEffectsTracker++;
                break;
            case 11:  // thrash
                if (gBattleMons[gActiveBank].status2 & STATUS2_LOCK_CONFUSE)
                {
                    gBattleMons[gActiveBank].status2 -= 0x400;
                    if (WasUnableToUseMove(gActiveBank))
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
                                BattleScriptExecute(BattleScript_ThrashConfuses);
                            effect++;
                        }
                    }
                }
                gBattleStruct->turnEffectsTracker++;
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
                        BattleScriptExecute(BattleScript_DisabledNoMore);
                        effect++;
                    }
                }
                gBattleStruct->turnEffectsTracker++;
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
                        BattleScriptExecute(BattleScript_EncoredNoMore);
                        effect++;
                    }
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case 14:  // lock-on decrement
                if (gStatuses3[gActiveBank] & STATUS3_ALWAYS_HITS)
                    gStatuses3[gActiveBank] -= 0x8;
                gBattleStruct->turnEffectsTracker++;
                break;
            case 15:  // charge
                if (gDisableStructs[gActiveBank].chargeTimer1 && --gDisableStructs[gActiveBank].chargeTimer1 == 0)
                    gStatuses3[gActiveBank] &= ~STATUS3_CHARGED_UP;
                gBattleStruct->turnEffectsTracker++;
                break;
            case 16:  // taunt
                if (gDisableStructs[gActiveBank].tauntTimer1)
                    gDisableStructs[gActiveBank].tauntTimer1--;
                gBattleStruct->turnEffectsTracker++;
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
                        EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
                        MarkBufferBankForExecution(gActiveBank);
                        gEffectBank = gActiveBank;
                        BattleScriptExecute(BattleScript_YawnMakesAsleep);
                        effect++;
                    }
                }
                gBattleStruct->turnEffectsTracker++;
                break;
            case 19:  // done
                gBattleStruct->turnEffectsTracker = 0;
                gBattleStruct->turnEffectsBank++;
                break;
            }
            if (effect != 0)
                return effect;
        }
    }
    gHitMarker &= ~(HITMARKER_GRUDGE | HITMARKER_x20);
    return 0;
}

bool8 HandleWishPerishSongOnTurnEnd(void)
{
    gHitMarker |= (HITMARKER_GRUDGE | HITMARKER_x20);
    switch (gBattleStruct->sub80170DC_Tracker)
    {
    case 0: // future sight
        while (gBattleStruct->sub80170DC_Bank < gNoOfAllBanks)
        {
            gActiveBank = gBattleStruct->sub80170DC_Bank;
            if (gAbsentBankFlags & gBitTable[gActiveBank])
                gBattleStruct->sub80170DC_Bank++;
            else
            {
                gBattleStruct->sub80170DC_Bank++;
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
                    BattleScriptExecute(BattleScript_MonTookFutureAttack);
                    return 1;
                }
            }
        }
        gBattleStruct->sub80170DC_Tracker = 1;
        gBattleStruct->sub80170DC_Bank = 0;
    case 1: // perish song
        while (gBattleStruct->sub80170DC_Bank < gNoOfAllBanks)
        {
            gActiveBank = gBankAttacker = gBanksByTurnOrder[gBattleStruct->sub80170DC_Bank];
            if (gAbsentBankFlags & gBitTable[gActiveBank])
                gBattleStruct->sub80170DC_Bank++;
            else
            {
                gBattleStruct->sub80170DC_Bank++;
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
                    BattleScriptExecute(gBattlescriptCurrInstr);
                    return 1;
                }
            }
        }
        break;
    }
    gHitMarker &= ~(HITMARKER_GRUDGE | HITMARKER_x20);
    return 0;
}

#define HandleFaintedMonActions_MAX_CASE 7

bool8 HandleFaintedMonActions(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
        return 0;
    do
    {
        int i;
        switch (gBattleStruct->sub80173A4_Tracker)
        {
        case 0:
            gBattleStruct->unk1605A = 0;
            gBattleStruct->sub80173A4_Tracker++;
            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (gAbsentBankFlags & gBitTable[i] && !sub_8018018(i, 6, 6))
                    gAbsentBankFlags &= ~(gBitTable[i]);
            }
        case 1:
            do
            {
                gBank1 = gBankTarget = gBattleStruct->unk1605A;
                if (gBattleMons[gBattleStruct->unk1605A].hp == 0 && !(gBattleStruct->unk16113 & gBitTable[gBattlePartyID[gBattleStruct->unk1605A]]) && !(gAbsentBankFlags & gBitTable[gBattleStruct->unk1605A]))
                {
                    BattleScriptExecute(BattleScript_GiveExp);
                    gBattleStruct->sub80173A4_Tracker = 2;
                    return 1;
                }
            } while (++gBattleStruct->unk1605A != gNoOfAllBanks);
            gBattleStruct->sub80173A4_Tracker = 3;
            break;
        case 2:
            sub_8015740(gBank1);
            if (++gBattleStruct->unk1605A == gNoOfAllBanks)
                gBattleStruct->sub80173A4_Tracker = 3;
            else
                gBattleStruct->sub80173A4_Tracker = 1;
            break;
        case 3:
            gBattleStruct->unk1605A = 0;
            gBattleStruct->sub80173A4_Tracker++;
        case 4:
            do
            {
                gBank1 = gBankTarget = gBattleStruct->unk1605A; //or should banks be switched?
                if (gBattleMons[gBattleStruct->unk1605A].hp == 0 && !(gAbsentBankFlags & gBitTable[gBattleStruct->unk1605A]))
                {
                    BattleScriptExecute(BattleScript_HandleFaintedMon);
                    gBattleStruct->sub80173A4_Tracker = 5;
                    return 1;
                }
            } while (++gBattleStruct->unk1605A != gNoOfAllBanks);
            gBattleStruct->sub80173A4_Tracker = 6;
            break;
        case 5:
            if (++gBattleStruct->unk1605A == gNoOfAllBanks)
                gBattleStruct->sub80173A4_Tracker = 6;
            else
                gBattleStruct->sub80173A4_Tracker = 4;
            break;
        case 6:
            if (AbilityBattleEffects(9, 0, 0, 0, 0) || AbilityBattleEffects(0xB, 0, 0, 0, 0) || ItemBattleEffects(1, 0, 1) || AbilityBattleEffects(6, 0, 0, 0, 0))
                return 1;
            gBattleStruct->sub80173A4_Tracker++;
            break;
        case 7:
            break;
        }
    } while (gBattleStruct->sub80173A4_Tracker != HandleFaintedMonActions_MAX_CASE);
    return 0;
}

void TryClearRageStatuses(void)
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
    s32* bideDmg = &gBattleStruct->bideDmg;
    do
    {
        switch (gBattleStruct->atkCancellerTracker)
        {
        case 0: // flags clear
            gBattleMons[gBankAttacker].status2 &= ~(STATUS2_DESTINY_BOND);
            gStatuses3[gBankAttacker] &= ~(STATUS3_GRUDGE);
            gBattleStruct->atkCancellerTracker++;
            break;
        case 1: // check being asleep
            if (gBattleMons[gBankAttacker].status1 & STATUS_SLEEP)
            {
                if (UproarWakeUpCheck(gBankAttacker))
                {
                    gBattleMons[gBankAttacker].status1 &= ~(STATUS_SLEEP);
                    gBattleMons[gBankAttacker].status2 &= ~(STATUS2_NIGHTMARE);
                    BattleScriptPushCursor();
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
                        BattleScriptPushCursor();
                        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                        gBattlescriptCurrInstr = BattleScript_MoveUsedWokeUp;
                        effect = 2;
                    }
                }
            }
            gBattleStruct->atkCancellerTracker++;
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
                        gBattleStruct->atkCancellerTracker++;
                        break;
                    }
                }
                else // unfreeze
                {
                    gBattleMons[gBankAttacker].status1 &= ~(STATUS_FREEZE);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_MoveUsedUnfroze;
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                }
                effect = 2;
            }
            gBattleStruct->atkCancellerTracker++;
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
            gBattleStruct->atkCancellerTracker++;
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
            gBattleStruct->atkCancellerTracker++;
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
            gBattleStruct->atkCancellerTracker++;
            break;
        case 6: // disabled move
            if (gDisableStructs[gBankAttacker].disabledMove == gCurrentMove && gDisableStructs[gBankAttacker].disabledMove != 0)
            {
                gProtectStructs[gBankAttacker].usedDisabledMove = 1;
                gBattleStruct->scriptingActive = gBankAttacker;
                CancelMultiTurnMoves(gBankAttacker);
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsDisabled;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
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
            gBattleStruct->atkCancellerTracker++;
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
            gBattleStruct->atkCancellerTracker++;
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
                        BattleScriptPushCursor();
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
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_MoveUsedIsConfusedNoMore;
                }
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
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
            gBattleStruct->atkCancellerTracker++;
            break;
        case 11: // infatuation
            if (gBattleMons[gBankAttacker].status2 & STATUS2_INFATUATION)
            {
                gBattleStruct->scriptingActive = CountTrailingZeroBits((gBattleMons[gBankAttacker].status2 & STATUS2_INFATUATION) >> 0x10);
                if (Random() & 1)
                    BattleScriptPushCursor();
                else
                {
                    BattleScriptPush(BattleScript_MoveUsedIsParalyzedCantAttack);
                    gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                    gProtectStructs[gBankAttacker].loveImmobility = 1;
                    CancelMultiTurnMoves(gBankAttacker);
                }
                gBattlescriptCurrInstr = BattleScript_MoveUsedIsInLove;
                effect = 1;
            }
            gBattleStruct->atkCancellerTracker++;
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
            gBattleStruct->atkCancellerTracker++;
            break;
        case 13: // move thawing
            if (gBattleMons[gBankAttacker].status1 & STATUS_FREEZE)
            {
                if (gBattleMoves[gCurrentMove].effect == EFFECT_THAW_HIT)
                {
                    gBattleMons[gBankAttacker].status1 &= ~(STATUS_FREEZE);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_MoveUsedUnfroze;
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                }
                effect = 2;
            }
            gBattleStruct->atkCancellerTracker++;
            break;
        case 14: // last case
            break;
        }

    } while (gBattleStruct->atkCancellerTracker != ATKCANCELLER_MAX_CASE && effect == 0);

    if (effect == 2)
    {
        gActiveBank = gBankAttacker;
        EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
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

#if DEBUG
__attribute__((naked))
u8 AbilityBattleEffects(u8 caseID, u8 bank, u8 ability, u8 special, u16 moveArg)
{
    asm("\
	push	{r4, r5, r6, r7, lr}\n\
	mov	r7, sl\n\
	mov	r6, r9\n\
	mov	r5, r8\n\
	push	{r5, r6, r7}\n\
	add	sp, sp, #0xffffffd8\n\
	ldr	r4, [sp, #0x48]\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	str	r0, [sp, #0x4]\n\
	lsl	r1, r1, #0x18\n\
	lsr	r1, r1, #0x18\n\
	mov	sl, r1\n\
	lsl	r2, r2, #0x18\n\
	lsr	r6, r2, #0x18\n\
	lsl	r3, r3, #0x18\n\
	lsr	r3, r3, #0x18\n\
	mov	r8, r3\n\
	lsl	r4, r4, #0x10\n\
	lsr	r4, r4, #0x10\n\
	mov	r0, #0x0\n\
	mov	r9, r0\n\
	ldr	r5, ._718\n\
	ldr	r1, ._718 + 4\n\
	ldrb	r0, [r5]\n\
	ldrb	r1, [r1]\n\
	cmp	r0, r1\n\
	bcc	._715	@cond_branch\n\
	mov	r1, sl\n\
	strb	r1, [r5]\n\
._715:\n\
	ldrb	r0, [r5]\n\
	bl	GetBankSide\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	bne	._716	@cond_branch\n\
	ldr	r1, ._718 + 8\n\
	ldrb	r0, [r5]\n\
	lsl	r0, r0, #0x1\n\
	add	r0, r0, r1\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x64\n\
	mul	r1, r1, r0\n\
	ldr	r0, ._718 + 12\n\
	b	._717\n\
._719:\n\
	.align	2, 0\n\
._718:\n\
	.word	gBankAttacker\n\
	.word	gNoOfAllBanks\n\
	.word	gBattlePartyID\n\
	.word	gPlayerParty\n\
._716:\n\
	ldr	r1, ._723\n\
	ldrb	r0, [r5]\n\
	lsl	r0, r0, #0x1\n\
	add	r0, r0, r1\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x64\n\
	mul	r1, r1, r0\n\
	ldr	r0, ._723 + 4\n\
._717:\n\
	add	r7, r1, r0\n\
	ldr	r5, ._723 + 8\n\
	ldr	r1, ._723 + 12\n\
	ldrb	r0, [r5]\n\
	ldrb	r1, [r1]\n\
	cmp	r0, r1\n\
	bcc	._720	@cond_branch\n\
	mov	r2, sl\n\
	strb	r2, [r5]\n\
._720:\n\
	ldrb	r0, [r5]\n\
	bl	GetBankSide\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	bne	._721	@cond_branch\n\
	ldr	r1, ._723\n\
	ldrb	r0, [r5]\n\
	lsl	r0, r0, #0x1\n\
	add	r0, r0, r1\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x64\n\
	mul	r1, r1, r0\n\
	ldr	r0, ._723 + 16\n\
	b	._722\n\
._724:\n\
	.align	2, 0\n\
._723:\n\
	.word	gBattlePartyID\n\
	.word	gEnemyParty\n\
	.word	gBankTarget\n\
	.word	gNoOfAllBanks\n\
	.word	gPlayerParty\n\
._721:\n\
	ldr	r1, ._729\n\
	ldrb	r0, [r5]\n\
	lsl	r0, r0, #0x1\n\
	add	r0, r0, r1\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x64\n\
	mul	r1, r1, r0\n\
	ldr	r0, ._729 + 4\n\
._722:\n\
	add	r5, r1, r0\n\
	add	r0, r7, #0\n\
	mov	r1, #0xb\n\
	bl	GetMonData\n\
	lsl	r0, r0, #0x10\n\
	lsr	r0, r0, #0x10\n\
	str	r0, [sp, #0x8]\n\
	add	r0, r7, #0\n\
	mov	r1, #0x0\n\
	bl	GetMonData\n\
	str	r0, [sp, #0x10]\n\
	add	r0, r5, #0\n\
	mov	r1, #0xb\n\
	bl	GetMonData\n\
	lsl	r0, r0, #0x10\n\
	lsr	r0, r0, #0x10\n\
	str	r0, [sp, #0xc]\n\
	add	r0, r5, #0\n\
	mov	r1, #0x0\n\
	bl	GetMonData\n\
	str	r0, [sp, #0x14]\n\
	ldr	r0, ._729 + 8\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x80\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._725	@cond_branch\n\
	bl	._1540\n\
._725:\n\
	mov	r3, r8\n\
	cmp	r3, #0\n\
	beq	._727	@cond_branch\n\
	ldr	r0, ._729 + 12\n\
	strb	r3, [r0]\n\
	mov	r8, r0\n\
	b	._728\n\
._730:\n\
	.align	2, 0\n\
._729:\n\
	.word	gBattlePartyID\n\
	.word	gEnemyParty\n\
	.word	gBattleTypeFlags\n\
	.word	gLastUsedAbility\n\
._727:\n\
	ldr	r2, ._733\n\
	ldr	r1, ._733 + 4\n\
	mov	r0, #0x58\n\
	mov	r5, sl\n\
	mul	r5, r5, r0\n\
	add	r0, r5, #0\n\
	add	r0, r0, r1\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	strb	r0, [r2]\n\
	mov	r8, r2\n\
._728:\n\
	cmp	r4, #0\n\
	beq	._731	@cond_branch\n\
	add	r3, r4, #0\n\
	b	._732\n\
._734:\n\
	.align	2, 0\n\
._733:\n\
	.word	gLastUsedAbility\n\
	.word	gBattleMons\n\
._731:\n\
	ldr	r0, ._737\n\
	ldrh	r3, [r0]\n\
._732:\n\
	ldr	r1, ._737 + 4\n\
	ldr	r2, ._737 + 8\n\
	add	r0, r1, r2\n\
	ldrb	r0, [r0]\n\
	add	r7, r1, #0\n\
	cmp	r0, #0\n\
	beq	._735	@cond_branch\n\
	mov	r4, #0x3f\n\
	and	r4, r4, r0\n\
	b	._736\n\
._738:\n\
	.align	2, 0\n\
._737:\n\
	.word	gCurrentMove\n\
	.word	+0x2000000\n\
	.word	0x1601c\n\
._735:\n\
	ldr	r1, ._741\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r4, [r0, #0x2]\n\
._736:\n\
	ldr	r5, [sp, #0x4]\n\
	cmp	r5, #0x13\n\
	bls	._739	@cond_branch\n\
	bl	._1534\n\
._739:\n\
	lsl	r0, r5, #0x2\n\
	ldr	r1, ._741 + 4\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	pc, r0\n\
._742:\n\
	.align	2, 0\n\
._741:\n\
	.word	gBattleMoves\n\
	.word	._743\n\
._743:\n\
	.word	._744\n\
	.word	._745\n\
	.word	._746\n\
	.word	._747\n\
	.word	._748\n\
	.word	._749\n\
	.word	._750\n\
	.word	._751\n\
	.word	._752\n\
	.word	._753\n\
	.word	._754\n\
	.word	._755\n\
	.word	._756\n\
	.word	._757\n\
	.word	._758\n\
	.word	._759\n\
	.word	._760\n\
	.word	._761\n\
	.word	._762\n\
	.word	._763\n\
._744:\n\
	ldr	r2, ._774\n\
	ldr	r0, ._774 + 4\n\
	ldrb	r1, [r2]\n\
	add	r5, r0, #0\n\
	ldrb	r0, [r5]\n\
	cmp	r1, r0\n\
	bcc	._764	@cond_branch\n\
	mov	r1, sl\n\
	strb	r1, [r2]\n\
._764:\n\
	mov	r2, r8\n\
	ldrb	r0, [r2]\n\
	cmp	r0, #0x2d\n\
	bne	._765	@cond_branch\n\
	b	._766\n\
._765:\n\
	cmp	r0, #0x2d\n\
	bgt	._767	@cond_branch\n\
	cmp	r0, #0xd\n\
	bne	._768	@cond_branch\n\
	b	._788\n\
._768:\n\
	cmp	r0, #0xd\n\
	bgt	._770	@cond_branch\n\
	cmp	r0, #0x2\n\
	bne	._771	@cond_branch\n\
	b	._772\n\
._771:\n\
	bl	._1534\n\
._775:\n\
	.align	2, 0\n\
._774:\n\
	.word	gBankAttacker\n\
	.word	gNoOfAllBanks\n\
._770:\n\
	cmp	r0, #0x16\n\
	bne	._776	@cond_branch\n\
	b	._777\n\
._776:\n\
	cmp	r0, #0x24\n\
	bne	._778	@cond_branch\n\
	b	._779\n\
._778:\n\
	bl	._1534\n\
._767:\n\
	cmp	r0, #0x46\n\
	bne	._781	@cond_branch\n\
	b	._782\n\
._781:\n\
	cmp	r0, #0x46\n\
	bgt	._783	@cond_branch\n\
	cmp	r0, #0x3b\n\
	bne	._784	@cond_branch\n\
	b	._785\n\
._784:\n\
	bl	._1534\n\
._783:\n\
	cmp	r0, #0x4d\n\
	bne	._787	@cond_branch\n\
	b	._788\n\
._787:\n\
	cmp	r0, #0xff\n\
	beq	._789	@cond_branch\n\
	bl	._1534\n\
._789:\n\
	bl	GetCurrentWeather\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	sub	r0, r0, #0x3\n\
	cmp	r0, #0xa\n\
	bhi	._814	@cond_branch\n\
	lsl	r0, r0, #0x2\n\
	ldr	r1, ._793\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	pc, r0\n\
._794:\n\
	.align	2, 0\n\
._793:\n\
	.word	._792\n\
._792:\n\
	.word	._805\n\
	.word	._814\n\
	.word	._805\n\
	.word	._814\n\
	.word	._814\n\
	.word	._800\n\
	.word	._814\n\
	.word	._814\n\
	.word	._814\n\
	.word	._804\n\
	.word	._805\n\
._805:\n\
	ldr	r2, ._808\n\
	ldrh	r1, [r2]\n\
	mov	r0, #0x7\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._814	@cond_branch\n\
	mov	r0, #0x5\n\
	strh	r0, [r2]\n\
	ldr	r0, ._808 + 4\n\
	ldr	r3, ._808 + 8\n\
	add	r2, r0, r3\n\
	mov	r1, #0xa\n\
	b	._811\n\
._809:\n\
	.align	2, 0\n\
._808:\n\
	.word	gBattleWeather\n\
	.word	+0x2000000\n\
	.word	0x160a4\n\
._800:\n\
	ldr	r3, ._812\n\
	ldrh	r1, [r3]\n\
	mov	r2, #0x18\n\
	add	r0, r2, #0\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._814	@cond_branch\n\
	strh	r2, [r3]\n\
	ldr	r0, ._812 + 4\n\
	ldr	r3, ._812 + 8\n\
	add	r2, r0, r3\n\
	mov	r1, #0xc\n\
	b	._811\n\
._813:\n\
	.align	2, 0\n\
._812:\n\
	.word	gBattleWeather\n\
	.word	+0x2000000\n\
	.word	0x160a4\n\
._804:\n\
	ldr	r3, ._818\n\
	ldrh	r1, [r3]\n\
	mov	r2, #0x60\n\
	add	r0, r2, #0\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._814	@cond_branch\n\
	strh	r2, [r3]\n\
	ldr	r0, ._818 + 4\n\
	ldr	r3, ._818 + 8\n\
	add	r2, r0, r3\n\
	mov	r1, #0xb\n\
._811:\n\
	strb	r1, [r2]\n\
	ldr	r5, ._818 + 12\n\
	add	r0, r0, r5\n\
	mov	r1, sl\n\
	strb	r1, [r0]\n\
	mov	r0, r9\n\
	add	r0, r0, #0x1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._814:\n\
	mov	r2, r9\n\
	cmp	r2, #0\n\
	bne	._815	@cond_branch\n\
	bl	._1540\n\
._815:\n\
	bl	GetCurrentWeather\n\
	ldr	r1, ._818 + 16\n\
	strb	r0, [r1, #0x5]\n\
	ldr	r0, ._818 + 20\n\
	bl	BattleScriptPushCursorAndCallback\n\
	bl	._1534\n\
._819:\n\
	.align	2, 0\n\
._818:\n\
	.word	gBattleWeather\n\
	.word	+0x2000000\n\
	.word	0x160a4\n\
	.word	0x16003\n\
	.word	gBattleCommunication\n\
	.word	BattleScript_OverworldWeatherStarts\n\
._772:\n\
	ldr	r2, ._823\n\
	ldrh	r1, [r2]\n\
	mov	r0, #0x4\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._820	@cond_branch\n\
	bl	._1534\n\
._820:\n\
	mov	r0, #0x5\n\
	strh	r0, [r2]\n\
	ldr	r0, ._823 + 4\n\
	bl	BattleScriptPushCursorAndCallback\n\
	ldr	r0, ._823 + 8\n\
	ldr	r3, ._823 + 12\n\
	add	r0, r0, r3\n\
	mov	r5, sl\n\
	strb	r5, [r0]\n\
	bl	._1392\n\
._824:\n\
	.align	2, 0\n\
._823:\n\
	.word	gBattleWeather\n\
	.word	BattleScript_DrizzleActivates\n\
	.word	+0x2000000\n\
	.word	0x16003\n\
._766:\n\
	ldr	r2, ._828\n\
	ldrh	r1, [r2]\n\
	mov	r0, #0x10\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._825	@cond_branch\n\
	bl	._1534\n\
._825:\n\
	mov	r0, #0x18\n\
	strh	r0, [r2]\n\
	ldr	r0, ._828 + 4\n\
	bl	BattleScriptPushCursorAndCallback\n\
	ldr	r0, ._828 + 8\n\
	ldr	r1, ._828 + 12\n\
	add	r0, r0, r1\n\
	mov	r2, sl\n\
	strb	r2, [r0]\n\
	bl	._1392\n\
._829:\n\
	.align	2, 0\n\
._828:\n\
	.word	gBattleWeather\n\
	.word	BattleScript_SandstreamActivates\n\
	.word	+0x2000000\n\
	.word	0x16003\n\
._782:\n\
	ldr	r2, ._833\n\
	ldrh	r1, [r2]\n\
	mov	r0, #0x40\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._830	@cond_branch\n\
	bl	._1534\n\
._830:\n\
	mov	r0, #0x60\n\
	strh	r0, [r2]\n\
	ldr	r0, ._833 + 4\n\
	bl	BattleScriptPushCursorAndCallback\n\
	ldr	r0, ._833 + 8\n\
	ldr	r3, ._833 + 12\n\
	add	r0, r0, r3\n\
	mov	r5, sl\n\
	strb	r5, [r0]\n\
	bl	._1392\n\
._834:\n\
	.align	2, 0\n\
._833:\n\
	.word	gBattleWeather\n\
	.word	BattleScript_DroughtActivates\n\
	.word	+0x2000000\n\
	.word	0x16003\n\
._777:\n\
	ldr	r0, ._838\n\
	mov	r1, sl\n\
	lsl	r2, r1, #0x2\n\
	add	r1, r2, r1\n\
	lsl	r1, r1, #0x2\n\
	add	r3, r1, r0\n\
	ldrb	r0, [r3]\n\
	lsl	r0, r0, #0x1c\n\
	cmp	r0, #0\n\
	bge	._835	@cond_branch\n\
	bl	._1534\n\
._835:\n\
	ldr	r1, ._838 + 4\n\
	add	r1, r2, r1\n\
	ldr	r0, [r1]\n\
	mov	r2, #0x80\n\
	lsl	r2, r2, #0xc\n\
	orr	r0, r0, r2\n\
	str	r0, [r1]\n\
	ldrb	r0, [r3]\n\
	mov	r1, #0x8\n\
	b	._837\n\
._839:\n\
	.align	2, 0\n\
._838:\n\
	.word	gSpecialStatuses\n\
	.word	gStatuses3\n\
._785:\n\
	mov	r0, sl\n\
	bl	CastformDataTypeChange\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
	cmp	r0, #0\n\
	bne	._840	@cond_branch\n\
	bl	._1540\n\
._840:\n\
	ldr	r0, ._843\n\
	bl	BattleScriptPushCursorAndCallback\n\
	ldr	r0, ._843 + 4\n\
	ldr	r2, ._843 + 8\n\
	add	r1, r0, r2\n\
	mov	r3, sl\n\
	strb	r3, [r1]\n\
	mov	r1, r9\n\
	sub	r1, r1, #0x1\n\
	ldr	r5, ._843 + 12\n\
	add	r0, r0, r5\n\
	strb	r1, [r0]\n\
	bl	._1534\n\
._844:\n\
	.align	2, 0\n\
._843:\n\
	.word	BattleScript_CastformChange\n\
	.word	+0x2000000\n\
	.word	0x16003\n\
	.word	0x1609b\n\
._779:\n\
	ldr	r0, ._848\n\
	mov	r1, sl\n\
	lsl	r2, r1, #0x2\n\
	add	r1, r2, r1\n\
	lsl	r1, r1, #0x2\n\
	add	r3, r1, r0\n\
	ldrb	r0, [r3]\n\
	lsl	r0, r0, #0x1b\n\
	cmp	r0, #0\n\
	bge	._845	@cond_branch\n\
	bl	._1534\n\
._845:\n\
	ldr	r1, ._848 + 4\n\
	add	r1, r2, r1\n\
	ldr	r0, [r1]\n\
	mov	r2, #0x80\n\
	lsl	r2, r2, #0xd\n\
	orr	r0, r0, r2\n\
	str	r0, [r1]\n\
	ldrb	r0, [r3]\n\
	mov	r1, #0x10\n\
._837:\n\
	orr	r0, r0, r1\n\
	strb	r0, [r3]\n\
	bl	._1534\n\
._849:\n\
	.align	2, 0\n\
._848:\n\
	.word	gSpecialStatuses\n\
	.word	gStatuses3\n\
._788:\n\
	mov	r6, #0x0\n\
	ldrb	r5, [r5]\n\
	cmp	r6, r5\n\
	bcc	._854	@cond_branch\n\
	bl	._1534\n\
._854:\n\
	add	r0, r6, #0\n\
	bl	CastformDataTypeChange\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
	cmp	r0, #0\n\
	beq	._852	@cond_branch\n\
	bl	._853\n\
._852:\n\
	add	r0, r6, #1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r6, r0, #0x18\n\
	ldr	r0, ._856\n\
	ldrb	r0, [r0]\n\
	cmp	r6, r0\n\
	bcc	._854	@cond_branch\n\
	bl	._1534\n\
._857:\n\
	.align	2, 0\n\
._856:\n\
	.word	gNoOfAllBanks\n\
._745:\n\
	ldr	r2, ._865\n\
	mov	r0, #0x58\n\
	mov	r1, sl\n\
	mul	r1, r1, r0\n\
	add	r4, r1, r2\n\
	ldrh	r0, [r4, #0x28]\n\
	cmp	r0, #0\n\
	bne	._858	@cond_branch\n\
	bl	._1534\n\
._858:\n\
	ldr	r0, ._865 + 4\n\
	mov	r3, sl\n\
	strb	r3, [r0]\n\
	mov	r3, r8\n\
	ldrb	r5, [r3]\n\
	cmp	r5, #0x2c\n\
	beq	._860	@cond_branch\n\
	cmp	r5, #0x2c\n\
	bgt	._861	@cond_branch\n\
	cmp	r5, #0x3\n\
	bne	._862	@cond_branch\n\
	b	._863\n\
._862:\n\
	bl	._1534\n\
._866:\n\
	.align	2, 0\n\
._865:\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
._861:\n\
	cmp	r5, #0x36\n\
	bne	._867	@cond_branch\n\
	b	._868\n\
._867:\n\
	cmp	r5, #0x3d\n\
	beq	._869	@cond_branch\n\
	bl	._1534\n\
._860:\n\
	mov	r0, #0x0\n\
	str	r0, [sp]\n\
	mov	r0, #0x13\n\
	mov	r1, #0x0\n\
	mov	r2, #0xd\n\
	mov	r3, #0x0\n\
	bl	AbilityBattleEffects\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._871	@cond_branch\n\
	bl	._1534\n\
._871:\n\
	str	r0, [sp]\n\
	mov	r0, #0x13\n\
	mov	r1, #0x0\n\
	mov	r2, #0x4d\n\
	mov	r3, #0x0\n\
	bl	AbilityBattleEffects\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._873	@cond_branch\n\
	bl	._1534\n\
._873:\n\
	ldr	r0, ._881\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x7\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._875	@cond_branch\n\
	bl	._1534\n\
._875:\n\
	ldrh	r0, [r4, #0x2c]\n\
	ldrh	r1, [r4, #0x28]\n\
	cmp	r0, r1\n\
	bhi	._877	@cond_branch\n\
	bl	._1534\n\
._877:\n\
	mov	r2, r8\n\
	strb	r5, [r2]\n\
	ldr	r0, ._881 + 4\n\
	bl	BattleScriptPushCursorAndCallback\n\
	ldr	r1, ._881 + 8\n\
	ldrh	r0, [r4, #0x2c]\n\
	lsr	r0, r0, #0x4\n\
	str	r0, [r1]\n\
	cmp	r0, #0\n\
	bne	._879	@cond_branch\n\
	mov	r0, #0x1\n\
	str	r0, [r1]\n\
._879:\n\
	ldr	r0, [r1]\n\
	neg	r0, r0\n\
	str	r0, [r1]\n\
	bl	._1392\n\
._882:\n\
	.align	2, 0\n\
._881:\n\
	.word	gBattleWeather\n\
	.word	BattleScript_RainDishActivates\n\
	.word	gBattleMoveDamage\n\
._869:\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x4c\n\
	add	r5, r1, r0\n\
	ldrb	r0, [r5]\n\
	cmp	r0, #0\n\
	bne	._883	@cond_branch\n\
	bl	._1534\n\
._883:\n\
	bl	Random\n\
	lsl	r0, r0, #0x10\n\
	lsr	r0, r0, #0x10\n\
	mov	r1, #0x3\n\
	bl	__umodsi3\n\
	lsl	r0, r0, #0x10\n\
	lsr	r4, r0, #0x10\n\
	cmp	r4, #0\n\
	beq	._885	@cond_branch\n\
	bl	._1534\n\
._885:\n\
	ldr	r0, [r5]\n\
	mov	r1, #0x88\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._887	@cond_branch\n\
	ldr	r0, ._893\n\
	ldr	r1, ._893 + 4\n\
	bl	StringCopy\n\
._887:\n\
	ldr	r0, [r5]\n\
	mov	r1, #0x7\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._888	@cond_branch\n\
	ldr	r0, ._893\n\
	ldr	r1, ._893 + 8\n\
	bl	StringCopy\n\
._888:\n\
	ldr	r0, [r5]\n\
	mov	r1, #0x40\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._889	@cond_branch\n\
	ldr	r0, ._893\n\
	ldr	r1, ._893 + 12\n\
	bl	StringCopy\n\
._889:\n\
	ldr	r0, [r5]\n\
	mov	r1, #0x10\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._890	@cond_branch\n\
	ldr	r0, ._893\n\
	ldr	r1, ._893 + 16\n\
	bl	StringCopy\n\
._890:\n\
	ldr	r0, [r5]\n\
	mov	r1, #0x20\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._891	@cond_branch\n\
	ldr	r0, ._893\n\
	ldr	r1, ._893 + 20\n\
	bl	StringCopy\n\
._891:\n\
	str	r4, [r5]\n\
	ldr	r0, ._893 + 24\n\
	ldr	r4, ._893 + 28\n\
	mov	r3, sl\n\
	strb	r3, [r4]\n\
	ldr	r1, ._893 + 32\n\
	add	r0, r0, r1\n\
	strb	r3, [r0]\n\
	ldr	r0, ._893 + 36\n\
	bl	BattleScriptPushCursorAndCallback\n\
	str	r5, [sp]\n\
	mov	r0, #0x0\n\
	mov	r1, #0x28\n\
	mov	r2, #0x0\n\
	mov	r3, #0x4\n\
	bl	EmitSetMonData\n\
	ldrb	r0, [r4]\n\
	bl	MarkBufferBankForExecution\n\
	bl	._1392\n\
._894:\n\
	.align	2, 0\n\
._893:\n\
	.word	gBattleTextBuff1\n\
	.word	gStatusConditionString_PoisonJpn\n\
	.word	gStatusConditionString_SleepJpn\n\
	.word	gStatusConditionString_ParalysisJpn\n\
	.word	gStatusConditionString_BurnJpn\n\
	.word	gStatusConditionString_IceJpn\n\
	.word	+0x2000000\n\
	.word	gActiveBank\n\
	.word	0x16003\n\
	.word	BattleScript_ShedSkinActivates\n\
._863:\n\
	ldrb	r2, [r4, #0x1b]\n\
	mov	r0, #0x1b\n\
	ldsb	r0, [r4, r0]\n\
	cmp	r0, #0xb\n\
	ble	._895	@cond_branch\n\
	bl	._1534\n\
._895:\n\
	ldr	r0, ._900\n\
	mov	r3, sl\n\
	lsl	r1, r3, #0x3\n\
	sub	r1, r1, r3\n\
	lsl	r1, r1, #0x2\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x16]\n\
	cmp	r0, #0x2\n\
	bne	._897	@cond_branch\n\
	bl	._1534\n\
._897:\n\
	add	r0, r2, #1\n\
	mov	r2, #0x0\n\
	strb	r0, [r4, #0x1b]\n\
	ldr	r5, ._900 + 4\n\
	add	r1, r7, r5\n\
	mov	r0, #0x11\n\
	strb	r0, [r1]\n\
	ldr	r1, ._900 + 8\n\
	add	r0, r7, r1\n\
	strb	r2, [r0]\n\
	ldr	r0, ._900 + 12\n\
	bl	BattleScriptPushCursorAndCallback\n\
	ldr	r2, ._900 + 16\n\
	add	r0, r7, r2\n\
	mov	r3, sl\n\
	strb	r3, [r0]\n\
	bl	._1392\n\
._901:\n\
	.align	2, 0\n\
._900:\n\
	.word	gDisableStructs\n\
	.word	0x160a4\n\
	.word	0x160a5\n\
	.word	BattleScript_SpeedBoostActivates\n\
	.word	0x16003\n\
._868:\n\
	ldr	r2, ._903\n\
	ldrb	r0, [r0]\n\
	lsl	r1, r0, #0x3\n\
	sub	r1, r1, r0\n\
	lsl	r1, r1, #0x2\n\
	add	r1, r1, r2\n\
	ldrb	r3, [r1, #0x18]\n\
	lsl	r0, r3, #0x1f\n\
	lsr	r0, r0, #0x1f\n\
	mov	r2, #0x1\n\
	eor	r2, r2, r0\n\
	mov	r0, #0x2\n\
	neg	r0, r0\n\
	and	r0, r0, r3\n\
	orr	r0, r0, r2\n\
	strb	r0, [r1, #0x18]\n\
	bl	._1534\n\
._904:\n\
	.align	2, 0\n\
._903:\n\
	.word	gDisableStructs\n\
._746:\n\
	mov	r5, r8\n\
	ldrb	r0, [r5]\n\
	cmp	r0, #0x2b\n\
	beq	._905	@cond_branch\n\
	bl	._1534\n\
._905:\n\
	mov	r4, #0x0\n\
	ldr	r0, ._917\n\
	ldrh	r2, [r0]\n\
	ldr	r5, ._917 + 4\n\
	add	r1, r0, #0\n\
	cmp	r2, r5\n\
	bne	._907	@cond_branch\n\
	bl	._1534\n\
._907:\n\
	cmp	r2, r3\n\
	beq	._909	@cond_branch\n\
	add	r2, r1, #0\n\
._912:\n\
	add	r2, r2, #0x2\n\
	add	r4, r4, #0x1\n\
	ldrh	r0, [r2]\n\
	cmp	r0, r5\n\
	bne	._910	@cond_branch\n\
	bl	._1534\n\
._910:\n\
	cmp	r0, r3\n\
	bne	._912	@cond_branch\n\
._909:\n\
	lsl	r0, r4, #0x1\n\
	add	r0, r0, r1\n\
	ldrh	r1, [r0]\n\
	ldr	r0, ._917 + 4\n\
	cmp	r1, r0\n\
	bne	._913	@cond_branch\n\
	bl	._1534\n\
._913:\n\
	ldr	r1, ._917 + 8\n\
	ldr	r0, ._917 + 12\n\
	ldrb	r2, [r0]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r2\n\
	add	r1, r1, #0x50\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x5\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._915	@cond_branch\n\
	ldr	r0, ._917 + 16\n\
	ldr	r1, [r0]\n\
	mov	r2, #0x80\n\
	lsl	r2, r2, #0x4\n\
	orr	r1, r1, r2\n\
	str	r1, [r0]\n\
._915:\n\
	ldr	r1, ._917 + 20\n\
	ldr	r0, ._917 + 24\n\
	str	r0, [r1]\n\
	mov	r0, #0x1\n\
	mov	r9, r0\n\
	bl	._916\n\
._918:\n\
	.align	2, 0\n\
._917:\n\
	.word	gSoundMovesTable\n\
	.word	0xffff\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gHitMarker\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_SoundproofProtected\n\
._747:\n\
	cmp	r3, #0\n\
	bne	._919	@cond_branch\n\
	bl	._1534\n\
._919:\n\
	mov	r1, r8\n\
	ldrb	r0, [r1]\n\
	cmp	r0, #0xb\n\
	beq	._921	@cond_branch\n\
	cmp	r0, #0xb\n\
	bgt	._922	@cond_branch\n\
	cmp	r0, #0xa\n\
	beq	._923	@cond_branch\n\
	b	._956\n\
._922:\n\
	cmp	r0, #0x12\n\
	beq	._925	@cond_branch\n\
	b	._956\n\
._923:\n\
	cmp	r4, #0xd\n\
	beq	._927	@cond_branch\n\
	b	._956\n\
._927:\n\
	ldr	r0, ._933\n\
	lsl	r1, r3, #0x1\n\
	add	r1, r1, r3\n\
	lsl	r1, r1, #0x2\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	cmp	r0, #0\n\
	bne	._929	@cond_branch\n\
	b	._956\n\
._929:\n\
	ldr	r1, ._933 + 4\n\
	ldr	r0, ._933 + 8\n\
	ldrb	r0, [r0]\n\
	lsl	r0, r0, #0x4\n\
	add	r0, r0, r1\n\
	ldrb	r0, [r0, #0x2]\n\
	lsl	r0, r0, #0x1c\n\
	cmp	r0, #0\n\
	bge	._931	@cond_branch\n\
	ldr	r1, ._933 + 12\n\
	ldr	r0, ._933 + 16\n\
	b	._932\n\
._934:\n\
	.align	2, 0\n\
._933:\n\
	.word	gBattleMoves\n\
	.word	gProtectStructs\n\
	.word	gBankAttacker\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_MoveHPDrain\n\
._931:\n\
	ldr	r1, ._936\n\
	ldr	r0, ._936 + 4\n\
._932:\n\
	str	r0, [r1]\n\
	mov	r2, #0x1\n\
	b	._935\n\
._937:\n\
	.align	2, 0\n\
._936:\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_MoveHPDrain_PPLoss\n\
._921:\n\
	cmp	r4, #0xb\n\
	beq	._938	@cond_branch\n\
	b	._956\n\
._938:\n\
	ldr	r0, ._944\n\
	lsl	r1, r3, #0x1\n\
	add	r1, r1, r3\n\
	lsl	r1, r1, #0x2\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	cmp	r0, #0\n\
	bne	._940	@cond_branch\n\
	b	._956\n\
._940:\n\
	ldr	r1, ._944 + 4\n\
	ldr	r0, ._944 + 8\n\
	ldrb	r0, [r0]\n\
	lsl	r0, r0, #0x4\n\
	add	r0, r0, r1\n\
	ldrb	r0, [r0, #0x2]\n\
	lsl	r0, r0, #0x1c\n\
	cmp	r0, #0\n\
	bge	._942	@cond_branch\n\
	ldr	r1, ._944 + 12\n\
	ldr	r0, ._944 + 16\n\
	b	._943\n\
._945:\n\
	.align	2, 0\n\
._944:\n\
	.word	gBattleMoves\n\
	.word	gProtectStructs\n\
	.word	gBankAttacker\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_MoveHPDrain\n\
._942:\n\
	ldr	r1, ._947\n\
	ldr	r0, ._947 + 4\n\
._943:\n\
	str	r0, [r1]\n\
	mov	r3, #0x1\n\
	mov	r9, r3\n\
	b	._956\n\
._948:\n\
	.align	2, 0\n\
._947:\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_MoveHPDrain_PPLoss\n\
._925:\n\
	cmp	r4, #0xa\n\
	bne	._956	@cond_branch\n\
	ldr	r1, ._954\n\
	mov	r0, #0x58\n\
	mov	r5, sl\n\
	mul	r5, r5, r0\n\
	add	r0, r5, #0\n\
	add	r1, r1, #0x4c\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	r1, #0x20\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._956	@cond_branch\n\
	ldr	r2, ._954 + 4\n\
	mov	r0, sl\n\
	lsl	r1, r0, #0x2\n\
	add	r0, r1, r2\n\
	ldr	r3, [r0]\n\
	mov	r4, #0x1\n\
	and	r3, r3, r4\n\
	add	r5, r1, #0\n\
	cmp	r3, #0\n\
	bne	._951	@cond_branch\n\
	ldr	r0, ._954 + 8\n\
	strb	r3, [r0, #0x5]\n\
	ldr	r1, ._954 + 12\n\
	ldr	r0, ._954 + 16\n\
	ldrb	r0, [r0]\n\
	lsl	r0, r0, #0x4\n\
	add	r0, r0, r1\n\
	ldrb	r0, [r0, #0x2]\n\
	lsl	r0, r0, #0x1c\n\
	cmp	r0, #0\n\
	bge	._952	@cond_branch\n\
	ldr	r1, ._954 + 20\n\
	ldr	r0, ._954 + 24\n\
	b	._953\n\
._955:\n\
	.align	2, 0\n\
._954:\n\
	.word	gBattleMons\n\
	.word	+0x2017100\n\
	.word	gBattleCommunication\n\
	.word	gProtectStructs\n\
	.word	gBankAttacker\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_FlashFireBoost\n\
._952:\n\
	ldr	r1, ._957\n\
	ldr	r0, ._957 + 4\n\
._953:\n\
	str	r0, [r1]\n\
	add	r0, r5, r2\n\
	ldr	r1, [r0]\n\
	mov	r2, #0x1\n\
	orr	r1, r1, r2\n\
	str	r1, [r0]\n\
	mov	r1, #0x2\n\
	mov	r9, r1\n\
	b	._956\n\
._958:\n\
	.align	2, 0\n\
._957:\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_FlashFireBoost_PPLoss\n\
._951:\n\
	ldr	r0, ._961\n\
	strb	r4, [r0, #0x5]\n\
	ldr	r1, ._961 + 4\n\
	ldr	r0, ._961 + 8\n\
	ldrb	r0, [r0]\n\
	lsl	r0, r0, #0x4\n\
	add	r0, r0, r1\n\
	ldrb	r0, [r0, #0x2]\n\
	lsl	r0, r0, #0x1c\n\
	cmp	r0, #0\n\
	bge	._959	@cond_branch\n\
	ldr	r1, ._961 + 12\n\
	ldr	r0, ._961 + 16\n\
	b	._960\n\
._962:\n\
	.align	2, 0\n\
._961:\n\
	.word	gBattleCommunication\n\
	.word	gProtectStructs\n\
	.word	gBankAttacker\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_FlashFireBoost\n\
._959:\n\
	ldr	r1, ._968\n\
	ldr	r0, ._968 + 4\n\
._960:\n\
	str	r0, [r1]\n\
	mov	r2, #0x2\n\
._935:\n\
	mov	r9, r2\n\
._956:\n\
	mov	r3, r9\n\
	cmp	r3, #0x1\n\
	beq	._963	@cond_branch\n\
	bl	._1534\n\
._963:\n\
	ldr	r1, ._968 + 8\n\
	mov	r0, #0x58\n\
	mov	r5, sl\n\
	mul	r5, r5, r0\n\
	add	r0, r5, #0\n\
	add	r1, r0, r1\n\
	ldrh	r0, [r1, #0x2c]\n\
	ldrh	r2, [r1, #0x28]\n\
	cmp	r0, r2\n\
	bne	._965	@cond_branch\n\
	ldr	r1, ._968 + 12\n\
	ldr	r0, ._968 + 16\n\
	ldrb	r0, [r0]\n\
	lsl	r0, r0, #0x4\n\
	add	r0, r0, r1\n\
	ldrb	r0, [r0, #0x2]\n\
	lsl	r0, r0, #0x1c\n\
	cmp	r0, #0\n\
	bge	._966	@cond_branch\n\
	ldr	r1, ._968\n\
	ldr	r0, ._968 + 20\n\
	str	r0, [r1]\n\
	bl	._1534\n\
._969:\n\
	.align	2, 0\n\
._968:\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_FlashFireBoost_PPLoss\n\
	.word	gBattleMons\n\
	.word	gProtectStructs\n\
	.word	gBankAttacker\n\
	.word	BattleScript_MoveHPDrain_FullHP\n\
._966:\n\
	ldr	r1, ._971\n\
	ldr	r0, ._971 + 4\n\
	str	r0, [r1]\n\
	bl	._1534\n\
._972:\n\
	.align	2, 0\n\
._971:\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_MoveHPDrain_FullHP_PPLoss\n\
._965:\n\
	ldr	r2, ._975\n\
	ldrh	r0, [r1, #0x2c]\n\
	lsr	r0, r0, #0x2\n\
	str	r0, [r2]\n\
	cmp	r0, #0\n\
	bne	._973	@cond_branch\n\
	mov	r3, r9\n\
	str	r3, [r2]\n\
._973:\n\
	ldr	r0, [r2]\n\
	neg	r0, r0\n\
	str	r0, [r2]\n\
	bl	._1534\n\
._976:\n\
	.align	2, 0\n\
._975:\n\
	.word	gBattleMoveDamage\n\
._748:\n\
	mov	r5, r8\n\
	ldrb	r0, [r5]\n\
	sub	r0, r0, #0x9\n\
	cmp	r0, #0x2f\n\
	bls	._977	@cond_branch\n\
	bl	._1534\n\
._977:\n\
	lsl	r0, r0, #0x2\n\
	ldr	r1, ._980\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	pc, r0\n\
._981:\n\
	.align	2, 0\n\
._980:\n\
	.word	._979\n\
._979:\n\
	.word	._982\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._989\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._997\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1000\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1011\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1022\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1534\n\
	.word	._1029\n\
._989:\n\
	ldr	r0, ._1046\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1030	@cond_branch\n\
	bl	._1534\n\
._1030:\n\
	cmp	r3, #0xa5\n\
	bne	._1032	@cond_branch\n\
	bl	._1534\n\
._1032:\n\
	ldr	r0, ._1046 + 4\n\
	lsl	r1, r3, #0x1\n\
	add	r1, r1, r3\n\
	lsl	r1, r1, #0x2\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	cmp	r0, #0\n\
	bne	._1034	@cond_branch\n\
	bl	._1534\n\
._1034:\n\
	ldr	r2, ._1046 + 8\n\
	ldr	r0, ._1046 + 12\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r1, r0, #0x2\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1037	@cond_branch\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1037	@cond_branch\n\
	bl	._1534\n\
._1037:\n\
	ldr	r1, ._1046 + 16\n\
	mov	r0, #0x58\n\
	mov	r2, sl\n\
	mul	r2, r2, r0\n\
	add	r0, r2, #0\n\
	add	r1, r0, r1\n\
	add	r3, r1, #0\n\
	add	r3, r3, #0x21\n\
	ldrb	r0, [r3]\n\
	cmp	r0, r4\n\
	bne	._1039	@cond_branch\n\
	bl	._1534\n\
._1039:\n\
	add	r2, r1, #0\n\
	add	r2, r2, #0x22\n\
	ldrb	r0, [r2]\n\
	cmp	r0, r4\n\
	bne	._1041	@cond_branch\n\
	bl	._1534\n\
._1041:\n\
	ldrh	r0, [r1, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1043	@cond_branch\n\
	bl	._1534\n\
._1043:\n\
	strb	r4, [r3]\n\
	strb	r4, [r2]\n\
	ldr	r1, ._1046 + 20\n\
	mov	r0, #0xfd\n\
	strb	r0, [r1]\n\
	mov	r0, #0x3\n\
	strb	r0, [r1, #0x1]\n\
	strb	r4, [r1, #0x2]\n\
	mov	r0, #0xff\n\
	strb	r0, [r1, #0x3]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1046 + 24\n\
	ldr	r0, ._1046 + 28\n\
	str	r0, [r1]\n\
	bl	._1392\n\
._1047:\n\
	.align	2, 0\n\
._1046:\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMoves\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBattleMons\n\
	.word	gBattleTextBuff1\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_ColorChangeActivates\n\
._997:\n\
	ldr	r0, ._1061\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1048	@cond_branch\n\
	bl	._1534\n\
._1048:\n\
	ldr	r1, ._1061 + 4\n\
	ldr	r0, ._1061 + 8\n\
	ldrb	r2, [r0]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r2\n\
	add	r4, r0, r1\n\
	ldrh	r0, [r4, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1050	@cond_branch\n\
	bl	._1534\n\
._1050:\n\
	ldr	r0, ._1061 + 12\n\
	lsl	r1, r2, #0x4\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._1052	@cond_branch\n\
	bl	._1534\n\
._1052:\n\
	ldr	r2, ._1061 + 16\n\
	ldr	r0, ._1061 + 20\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r1, r0, #0x2\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1055	@cond_branch\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1055	@cond_branch\n\
	bl	._1534\n\
._1055:\n\
	ldr	r1, ._1061 + 24\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r1, [r0, #0x8]\n\
	mov	r2, #0x1\n\
	add	r0, r2, #0\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1057	@cond_branch\n\
	bl	._1534\n\
._1057:\n\
	ldr	r1, ._1061 + 28\n\
	ldrh	r0, [r4, #0x2c]\n\
	lsr	r0, r0, #0x4\n\
	str	r0, [r1]\n\
	cmp	r0, #0\n\
	bne	._1059	@cond_branch\n\
	str	r2, [r1]\n\
._1059:\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1061 + 32\n\
	ldr	r0, ._1061 + 36\n\
	str	r0, [r1]\n\
	bl	._1392\n\
._1062:\n\
	.align	2, 0\n\
._1061:\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gProtectStructs\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBattleMoves\n\
	.word	gBattleMoveDamage\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_RoughSkinActivates\n\
._1000:\n\
	ldr	r0, ._1078\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x4\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1063	@cond_branch\n\
	ldr	r0, ._1078 + 4\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1064	@cond_branch\n\
	bl	._1534\n\
._1064:\n\
	ldr	r1, ._1078 + 8\n\
	ldr	r0, ._1078 + 12\n\
	ldrb	r2, [r0]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r1\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1066	@cond_branch\n\
	bl	._1534\n\
._1066:\n\
	ldr	r0, ._1078 + 16\n\
	lsl	r1, r2, #0x4\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._1068	@cond_branch\n\
	bl	._1534\n\
._1068:\n\
	ldr	r2, ._1078 + 20\n\
	ldr	r0, ._1078 + 24\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r1, r0, #0x2\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1071	@cond_branch\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1071	@cond_branch\n\
	bl	._1534\n\
._1071:\n\
	ldr	r1, ._1078 + 28\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r1, [r0, #0x8]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1073	@cond_branch\n\
	bl	._1534\n\
._1073:\n\
	ldr	r5, ._1078 + 32\n\
	mov	r4, #0x3\n\
._1075:\n\
	bl	Random\n\
	and	r0, r0, r4\n\
	strb	r0, [r5, #0x3]\n\
	cmp	r0, #0\n\
	beq	._1075	@cond_branch\n\
	ldr	r1, ._1078 + 32\n\
	ldrb	r0, [r1, #0x3]\n\
	cmp	r0, #0x3\n\
	bne	._1076	@cond_branch\n\
	add	r0, r0, #0x2\n\
	strb	r0, [r1, #0x3]\n\
._1076:\n\
	ldrb	r0, [r1, #0x3]\n\
	add	r0, r0, #0x40\n\
	strb	r0, [r1, #0x3]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1078 + 36\n\
	ldr	r0, ._1078 + 40\n\
	str	r0, [r1]\n\
	ldr	r2, ._1078 + 44\n\
	ldr	r0, [r2]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x6\n\
	orr	r0, r0, r1\n\
	str	r0, [r2]\n\
	bl	._1392\n\
._1079:\n\
	.align	2, 0\n\
._1078:\n\
	.word	gUnknown_02023A14+0x50\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gProtectStructs\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBattleMoves\n\
	.word	gBattleCommunication\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_ApplySecondaryEffect\n\
	.word	gHitMarker\n\
._1063:\n\
	ldr	r0, ._1096\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1080	@cond_branch\n\
	bl	._1534\n\
._1080:\n\
	ldr	r1, ._1096 + 4\n\
	ldr	r0, ._1096 + 8\n\
	ldrb	r2, [r0]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r1\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1082	@cond_branch\n\
	bl	._1534\n\
._1082:\n\
	ldr	r0, ._1096 + 12\n\
	lsl	r1, r2, #0x4\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._1084	@cond_branch\n\
	bl	._1534\n\
._1084:\n\
	ldr	r2, ._1096 + 16\n\
	ldr	r0, ._1096 + 20\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r1, r0, #0x2\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1087	@cond_branch\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1087	@cond_branch\n\
	bl	._1534\n\
._1087:\n\
	ldr	r1, ._1096 + 24\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r1, [r0, #0x8]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1089	@cond_branch\n\
	bl	._1534\n\
._1089:\n\
	bl	Random\n\
	lsl	r0, r0, #0x10\n\
	lsr	r0, r0, #0x10\n\
	mov	r1, #0xa\n\
	bl	__umodsi3\n\
	lsl	r0, r0, #0x10\n\
	cmp	r0, #0\n\
	beq	._1091	@cond_branch\n\
	bl	._1534\n\
._1091:\n\
	ldr	r5, ._1096 + 28\n\
	mov	r4, #0x3\n\
._1093:\n\
	bl	Random\n\
	and	r0, r0, r4\n\
	strb	r0, [r5, #0x3]\n\
	cmp	r0, #0\n\
	beq	._1093	@cond_branch\n\
	ldr	r1, ._1096 + 28\n\
	ldrb	r0, [r1, #0x3]\n\
	cmp	r0, #0x3\n\
	bne	._1094	@cond_branch\n\
	add	r0, r0, #0x2\n\
	strb	r0, [r1, #0x3]\n\
._1094:\n\
	ldrb	r0, [r1, #0x3]\n\
	add	r0, r0, #0x40\n\
	strb	r0, [r1, #0x3]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1096 + 32\n\
	ldr	r0, ._1096 + 36\n\
	str	r0, [r1]\n\
	ldr	r2, ._1096 + 40\n\
	ldr	r0, [r2]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x6\n\
	orr	r0, r0, r1\n\
	str	r0, [r2]\n\
	bl	._1392\n\
._1097:\n\
	.align	2, 0\n\
._1096:\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gProtectStructs\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBattleMoves\n\
	.word	gBattleCommunication\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_ApplySecondaryEffect\n\
	.word	gHitMarker\n\
._1011:\n\
	ldr	r0, ._1111\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x4\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1098	@cond_branch\n\
	ldr	r0, ._1111 + 4\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1099	@cond_branch\n\
	bl	._1534\n\
._1099:\n\
	ldr	r1, ._1111 + 8\n\
	ldr	r0, ._1111 + 12\n\
	ldrb	r2, [r0]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r1\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1101	@cond_branch\n\
	bl	._1534\n\
._1101:\n\
	ldr	r0, ._1111 + 16\n\
	lsl	r1, r2, #0x4\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._1103	@cond_branch\n\
	bl	._1534\n\
._1103:\n\
	ldr	r2, ._1111 + 20\n\
	ldr	r0, ._1111 + 24\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r1, r0, #0x2\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1106	@cond_branch\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1106	@cond_branch\n\
	bl	._1534\n\
._1106:\n\
	ldr	r1, ._1111 + 28\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r1, [r0, #0x8]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1108	@cond_branch\n\
	bl	._1534\n\
._1108:\n\
	ldr	r1, ._1111 + 32\n\
	mov	r0, #0x42\n\
	strb	r0, [r1, #0x3]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1111 + 36\n\
	ldr	r0, ._1111 + 40\n\
	str	r0, [r1]\n\
	ldr	r2, ._1111 + 44\n\
	ldr	r0, [r2]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x6\n\
	orr	r0, r0, r1\n\
	str	r0, [r2]\n\
	bl	._1392\n\
._1112:\n\
	.align	2, 0\n\
._1111:\n\
	.word	gUnknown_02023A14+0x50\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gProtectStructs\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBattleMoves\n\
	.word	gBattleCommunication\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_ApplySecondaryEffect\n\
	.word	gHitMarker\n\
._1098:\n\
	ldr	r0, ._1127\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1113	@cond_branch\n\
	bl	._1534\n\
._1113:\n\
	ldr	r1, ._1127 + 4\n\
	ldr	r0, ._1127 + 8\n\
	ldrb	r2, [r0]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r1\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1115	@cond_branch\n\
	bl	._1534\n\
._1115:\n\
	ldr	r0, ._1127 + 12\n\
	lsl	r1, r2, #0x4\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._1117	@cond_branch\n\
	bl	._1534\n\
._1117:\n\
	ldr	r2, ._1127 + 16\n\
	ldr	r0, ._1127 + 20\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r1, r0, #0x2\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1120	@cond_branch\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1120	@cond_branch\n\
	bl	._1534\n\
._1120:\n\
	ldr	r1, ._1127 + 24\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r1, [r0, #0x8]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1122	@cond_branch\n\
	bl	._1534\n\
._1122:\n\
	bl	Random\n\
	lsl	r0, r0, #0x10\n\
	lsr	r0, r0, #0x10\n\
	mov	r1, #0x3\n\
	bl	__umodsi3\n\
	lsl	r0, r0, #0x10\n\
	cmp	r0, #0\n\
	beq	._1124	@cond_branch\n\
	bl	._1534\n\
._1124:\n\
	ldr	r1, ._1127 + 28\n\
	mov	r0, #0x42\n\
	strb	r0, [r1, #0x3]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1127 + 32\n\
	ldr	r0, ._1127 + 36\n\
	str	r0, [r1]\n\
	ldr	r2, ._1127 + 40\n\
	ldr	r0, [r2]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x6\n\
	orr	r0, r0, r1\n\
	str	r0, [r2]\n\
	bl	._1392\n\
._1128:\n\
	.align	2, 0\n\
._1127:\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gProtectStructs\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBattleMoves\n\
	.word	gBattleCommunication\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_ApplySecondaryEffect\n\
	.word	gHitMarker\n\
._982:\n\
	ldr	r0, ._1142\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x4\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1129	@cond_branch\n\
	ldr	r0, ._1142 + 4\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1130	@cond_branch\n\
	bl	._1534\n\
._1130:\n\
	ldr	r1, ._1142 + 8\n\
	ldr	r0, ._1142 + 12\n\
	ldrb	r2, [r0]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r1\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1132	@cond_branch\n\
	bl	._1534\n\
._1132:\n\
	ldr	r0, ._1142 + 16\n\
	lsl	r1, r2, #0x4\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._1134	@cond_branch\n\
	bl	._1534\n\
._1134:\n\
	ldr	r2, ._1142 + 20\n\
	ldr	r0, ._1142 + 24\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r1, r0, #0x2\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1137	@cond_branch\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1137	@cond_branch\n\
	bl	._1534\n\
._1137:\n\
	ldr	r1, ._1142 + 28\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r1, [r0, #0x8]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1139	@cond_branch\n\
	bl	._1534\n\
._1139:\n\
	ldr	r1, ._1142 + 32\n\
	mov	r0, #0x45\n\
	strb	r0, [r1, #0x3]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1142 + 36\n\
	ldr	r0, ._1142 + 40\n\
	str	r0, [r1]\n\
	ldr	r2, ._1142 + 44\n\
	ldr	r0, [r2]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x6\n\
	orr	r0, r0, r1\n\
	str	r0, [r2]\n\
	bl	._1392\n\
._1143:\n\
	.align	2, 0\n\
._1142:\n\
	.word	gUnknown_02023A14+0x50\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gProtectStructs\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBattleMoves\n\
	.word	gBattleCommunication\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_ApplySecondaryEffect\n\
	.word	gHitMarker\n\
._1129:\n\
	ldr	r0, ._1158\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1144	@cond_branch\n\
	bl	._1534\n\
._1144:\n\
	ldr	r1, ._1158 + 4\n\
	ldr	r0, ._1158 + 8\n\
	ldrb	r2, [r0]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r1\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1146	@cond_branch\n\
	bl	._1534\n\
._1146:\n\
	ldr	r0, ._1158 + 12\n\
	lsl	r1, r2, #0x4\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._1148	@cond_branch\n\
	bl	._1534\n\
._1148:\n\
	ldr	r2, ._1158 + 16\n\
	ldr	r0, ._1158 + 20\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r1, r0, #0x2\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1151	@cond_branch\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1151	@cond_branch\n\
	bl	._1534\n\
._1151:\n\
	ldr	r1, ._1158 + 24\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r1, [r0, #0x8]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1153	@cond_branch\n\
	bl	._1534\n\
._1153:\n\
	bl	Random\n\
	lsl	r0, r0, #0x10\n\
	lsr	r0, r0, #0x10\n\
	mov	r1, #0x3\n\
	bl	__umodsi3\n\
	lsl	r0, r0, #0x10\n\
	cmp	r0, #0\n\
	beq	._1155	@cond_branch\n\
	bl	._1534\n\
._1155:\n\
	ldr	r1, ._1158 + 28\n\
	mov	r0, #0x45\n\
	strb	r0, [r1, #0x3]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1158 + 32\n\
	ldr	r0, ._1158 + 36\n\
	str	r0, [r1]\n\
	ldr	r2, ._1158 + 40\n\
	ldr	r0, [r2]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x6\n\
	orr	r0, r0, r1\n\
	str	r0, [r2]\n\
	bl	._1392\n\
._1159:\n\
	.align	2, 0\n\
._1158:\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gProtectStructs\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBattleMoves\n\
	.word	gBattleCommunication\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_ApplySecondaryEffect\n\
	.word	gHitMarker\n\
._1022:\n\
	ldr	r0, ._1173\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x4\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1160	@cond_branch\n\
	ldr	r0, ._1173 + 4\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1161	@cond_branch\n\
	bl	._1534\n\
._1161:\n\
	ldr	r1, ._1173 + 8\n\
	ldr	r0, ._1173 + 12\n\
	ldrb	r2, [r0]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r1\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1163	@cond_branch\n\
	bl	._1534\n\
._1163:\n\
	ldr	r0, ._1173 + 16\n\
	lsl	r1, r2, #0x4\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._1165	@cond_branch\n\
	bl	._1534\n\
._1165:\n\
	ldr	r1, ._1173 + 20\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r1, [r0, #0x8]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1167	@cond_branch\n\
	bl	._1534\n\
._1167:\n\
	ldr	r2, ._1173 + 24\n\
	ldr	r0, ._1173 + 28\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r1, r0, #0x2\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1170	@cond_branch\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1170	@cond_branch\n\
	bl	._1534\n\
._1170:\n\
	ldr	r1, ._1173 + 32\n\
	mov	r0, #0x43\n\
	strb	r0, [r1, #0x3]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1173 + 36\n\
	ldr	r0, ._1173 + 40\n\
	str	r0, [r1]\n\
	ldr	r2, ._1173 + 44\n\
	ldr	r0, [r2]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x6\n\
	orr	r0, r0, r1\n\
	str	r0, [r2]\n\
	bl	._1392\n\
._1174:\n\
	.align	2, 0\n\
._1173:\n\
	.word	gUnknown_02023A14+0x50\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gProtectStructs\n\
	.word	gBattleMoves\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBattleCommunication\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_ApplySecondaryEffect\n\
	.word	gHitMarker\n\
._1160:\n\
	ldr	r0, ._1189\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1175	@cond_branch\n\
	bl	._1534\n\
._1175:\n\
	ldr	r1, ._1189 + 4\n\
	ldr	r0, ._1189 + 8\n\
	ldrb	r2, [r0]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r1\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1177	@cond_branch\n\
	bl	._1534\n\
._1177:\n\
	ldr	r0, ._1189 + 12\n\
	lsl	r1, r2, #0x4\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._1179	@cond_branch\n\
	bl	._1534\n\
._1179:\n\
	ldr	r1, ._1189 + 16\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r1, [r0, #0x8]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1181	@cond_branch\n\
	bl	._1534\n\
._1181:\n\
	ldr	r2, ._1189 + 20\n\
	ldr	r0, ._1189 + 24\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r1, r0, #0x2\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1184	@cond_branch\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1184	@cond_branch\n\
	bl	._1534\n\
._1184:\n\
	bl	Random\n\
	lsl	r0, r0, #0x10\n\
	lsr	r0, r0, #0x10\n\
	mov	r1, #0x3\n\
	bl	__umodsi3\n\
	lsl	r0, r0, #0x10\n\
	cmp	r0, #0\n\
	beq	._1186	@cond_branch\n\
	bl	._1534\n\
._1186:\n\
	ldr	r1, ._1189 + 28\n\
	mov	r0, #0x43\n\
	strb	r0, [r1, #0x3]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1189 + 32\n\
	ldr	r0, ._1189 + 36\n\
	str	r0, [r1]\n\
	ldr	r2, ._1189 + 40\n\
	ldr	r0, [r2]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x6\n\
	orr	r0, r0, r1\n\
	str	r0, [r2]\n\
	bl	._1392\n\
._1190:\n\
	.align	2, 0\n\
._1189:\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gProtectStructs\n\
	.word	gBattleMoves\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBattleCommunication\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_ApplySecondaryEffect\n\
	.word	gHitMarker\n\
._1029:\n\
	ldr	r0, ._1217\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x4\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1191	@cond_branch\n\
	b	._1192\n\
._1191:\n\
	ldr	r0, ._1217 + 4\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1193	@cond_branch\n\
	bl	._1534\n\
._1193:\n\
	ldr	r5, ._1217 + 8\n\
	ldr	r7, ._1217 + 12\n\
	ldrb	r1, [r7]\n\
	mov	r6, #0x58\n\
	add	r0, r1, #0\n\
	mul	r0, r0, r6\n\
	add	r4, r0, r5\n\
	ldrh	r0, [r4, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1195	@cond_branch\n\
	bl	._1534\n\
._1195:\n\
	ldr	r0, ._1217 + 16\n\
	lsl	r1, r1, #0x4\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._1197	@cond_branch\n\
	bl	._1534\n\
._1197:\n\
	ldr	r1, ._1217 + 20\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r1, [r0, #0x8]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1199	@cond_branch\n\
	bl	._1534\n\
._1199:\n\
	ldr	r3, ._1217 + 24\n\
	ldr	r0, ._1217 + 28\n\
	mov	r8, r0\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r2, r0, #0x2\n\
	add	r0, r3, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r2, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1202	@cond_branch\n\
	add	r0, r3, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r2, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1202	@cond_branch\n\
	bl	._1534\n\
._1202:\n\
	add	r0, r1, #0\n\
	mul	r0, r0, r6\n\
	add	r0, r0, r5\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1204	@cond_branch\n\
	bl	._1534\n\
._1204:\n\
	add	r0, r4, #0\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0xc\n\
	bne	._1206	@cond_branch\n\
	bl	._1534\n\
._1206:\n\
	ldr	r0, [sp, #0x8]\n\
	ldr	r1, [sp, #0x10]\n\
	bl	GetGenderFromSpeciesAndPersonality\n\
	add	r4, r0, #0\n\
	ldr	r0, [sp, #0xc]\n\
	ldr	r1, [sp, #0x14]\n\
	bl	GetGenderFromSpeciesAndPersonality\n\
	lsl	r4, r4, #0x18\n\
	lsl	r0, r0, #0x18\n\
	cmp	r4, r0\n\
	bne	._1208	@cond_branch\n\
	bl	._1534\n\
._1208:\n\
	ldrb	r0, [r7]\n\
	mul	r0, r0, r6\n\
	add	r4, r5, #0\n\
	add	r4, r4, #0x50\n\
	add	r0, r0, r4\n\
	ldr	r0, [r0]\n\
	mov	r1, #0xf0\n\
	lsl	r1, r1, #0xc\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1210	@cond_branch\n\
	bl	._1534\n\
._1210:\n\
	ldr	r0, [sp, #0x8]\n\
	ldr	r1, [sp, #0x10]\n\
	bl	GetGenderFromSpeciesAndPersonality\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0xff\n\
	bne	._1212	@cond_branch\n\
	bl	._1534\n\
._1212:\n\
	ldr	r0, [sp, #0xc]\n\
	ldr	r1, [sp, #0x14]\n\
	bl	GetGenderFromSpeciesAndPersonality\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0xff\n\
	bne	._1214	@cond_branch\n\
	bl	._1534\n\
._1214:\n\
	ldrb	r0, [r7]\n\
	add	r2, r0, #0\n\
	mul	r2, r2, r6\n\
	add	r2, r2, r4\n\
	ldr	r1, ._1217 + 32\n\
	mov	r3, r8\n\
	ldrb	r0, [r3]\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldr	r1, [r0]\n\
	lsl	r1, r1, #0x10\n\
	ldr	r0, [r2]\n\
	orr	r0, r0, r1\n\
	str	r0, [r2]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1217 + 36\n\
	ldr	r0, ._1217 + 40\n\
	str	r0, [r1]\n\
	bl	._1392\n\
._1218:\n\
	.align	2, 0\n\
._1217:\n\
	.word	gUnknown_02023A14+0x50\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gProtectStructs\n\
	.word	gBattleMoves\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBitTable\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_CuteCharmActivates\n\
._1192:\n\
	ldr	r0, ._1245\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x29\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1219	@cond_branch\n\
	bl	._1534\n\
._1219:\n\
	ldr	r5, ._1245 + 4\n\
	ldr	r7, ._1245 + 8\n\
	ldrb	r1, [r7]\n\
	mov	r6, #0x58\n\
	add	r0, r1, #0\n\
	mul	r0, r0, r6\n\
	add	r0, r0, r5\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1221	@cond_branch\n\
	bl	._1534\n\
._1221:\n\
	ldr	r0, ._1245 + 12\n\
	lsl	r1, r1, #0x4\n\
	add	r1, r1, r0\n\
	ldrb	r0, [r1, #0x1]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._1223	@cond_branch\n\
	bl	._1534\n\
._1223:\n\
	ldr	r1, ._1245 + 16\n\
	lsl	r0, r3, #0x1\n\
	add	r0, r0, r3\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldrb	r1, [r0, #0x8]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1225	@cond_branch\n\
	bl	._1534\n\
._1225:\n\
	ldr	r3, ._1245 + 20\n\
	ldr	r0, ._1245 + 24\n\
	mov	r8, r0\n\
	ldrb	r1, [r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r2, r0, #0x2\n\
	add	r0, r3, #0\n\
	add	r0, r0, #0x8\n\
	add	r0, r2, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1228	@cond_branch\n\
	add	r0, r3, #0\n\
	add	r0, r0, #0xc\n\
	add	r0, r2, r0\n\
	ldr	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._1228	@cond_branch\n\
	bl	._1534\n\
._1228:\n\
	add	r0, r1, #0\n\
	mul	r0, r0, r6\n\
	add	r0, r0, r5\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	bne	._1230	@cond_branch\n\
	bl	._1534\n\
._1230:\n\
	bl	Random\n\
	lsl	r0, r0, #0x10\n\
	lsr	r0, r0, #0x10\n\
	mov	r1, #0x3\n\
	bl	__umodsi3\n\
	lsl	r0, r0, #0x10\n\
	cmp	r0, #0\n\
	beq	._1232	@cond_branch\n\
	bl	._1534\n\
._1232:\n\
	ldrb	r0, [r7]\n\
	mul	r0, r0, r6\n\
	add	r0, r0, r5\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0xc\n\
	bne	._1234	@cond_branch\n\
	bl	._1534\n\
._1234:\n\
	ldr	r0, [sp, #0x8]\n\
	ldr	r1, [sp, #0x10]\n\
	bl	GetGenderFromSpeciesAndPersonality\n\
	add	r4, r0, #0\n\
	ldr	r0, [sp, #0xc]\n\
	ldr	r1, [sp, #0x14]\n\
	bl	GetGenderFromSpeciesAndPersonality\n\
	lsl	r4, r4, #0x18\n\
	lsl	r0, r0, #0x18\n\
	cmp	r4, r0\n\
	bne	._1236	@cond_branch\n\
	bl	._1534\n\
._1236:\n\
	ldrb	r0, [r7]\n\
	mul	r0, r0, r6\n\
	add	r4, r5, #0\n\
	add	r4, r4, #0x50\n\
	add	r0, r0, r4\n\
	ldr	r0, [r0]\n\
	mov	r1, #0xf0\n\
	lsl	r1, r1, #0xc\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1238	@cond_branch\n\
	bl	._1534\n\
._1238:\n\
	ldr	r0, [sp, #0x8]\n\
	ldr	r1, [sp, #0x10]\n\
	bl	GetGenderFromSpeciesAndPersonality\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0xff\n\
	bne	._1240	@cond_branch\n\
	bl	._1534\n\
._1240:\n\
	ldr	r0, [sp, #0xc]\n\
	ldr	r1, [sp, #0x14]\n\
	bl	GetGenderFromSpeciesAndPersonality\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0xff\n\
	bne	._1242	@cond_branch\n\
	bl	._1534\n\
._1242:\n\
	ldrb	r0, [r7]\n\
	add	r2, r0, #0\n\
	mul	r2, r2, r6\n\
	add	r2, r2, r4\n\
	ldr	r1, ._1245 + 28\n\
	mov	r3, r8\n\
	ldrb	r0, [r3]\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldr	r1, [r0]\n\
	lsl	r1, r1, #0x10\n\
	ldr	r0, [r2]\n\
	orr	r0, r0, r1\n\
	str	r0, [r2]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1245 + 32\n\
	ldr	r0, ._1245 + 36\n\
	str	r0, [r1]\n\
	bl	._1392\n\
._1246:\n\
	.align	2, 0\n\
._1245:\n\
	.word	gBattleMoveFlags\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gProtectStructs\n\
	.word	gBattleMoves\n\
	.word	gSpecialStatuses\n\
	.word	gBankTarget\n\
	.word	gBitTable\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_CuteCharmActivates\n\
._749:\n\
	mov	r5, #0x0\n\
	mov	sl, r5\n\
	ldr	r0, ._1251\n\
	ldrb	r0, [r0]\n\
	cmp	sl, r0\n\
	bcc	._1366	@cond_branch\n\
	bl	._1534\n\
._1366:\n\
	ldr	r1, ._1251 + 4\n\
	mov	r0, #0x58\n\
	mov	r2, sl\n\
	mul	r2, r2, r0\n\
	add	r0, r2, #0\n\
	add	r0, r0, r1\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	sub	r0, r0, #0x7\n\
	add	r2, r1, #0\n\
	cmp	r0, #0x41\n\
	bls	._1249	@cond_branch\n\
	b	._1346\n\
._1249:\n\
	lsl	r0, r0, #0x2\n\
	ldr	r1, ._1251 + 8\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	pc, r0\n\
._1252:\n\
	.align	2, 0\n\
._1251:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
	.word	._1253\n\
._1253:\n\
	.word	._1254\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1259\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1319\n\
	.word	._1346\n\
	.word	._1264\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1267\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1287\n\
	.word	._1288\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1346\n\
	.word	._1319\n\
._1264:\n\
	mov	r0, #0x58\n\
	mov	r3, sl\n\
	mul	r3, r3, r0\n\
	add	r0, r3, #0\n\
	add	r1, r2, #0\n\
	add	r1, r1, #0x4c\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	ldr	r1, ._1323\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1320	@cond_branch\n\
	b	._1346\n\
._1320:\n\
	ldr	r0, ._1323 + 4\n\
	ldr	r1, ._1323 + 8\n\
	b	._1331\n\
._1324:\n\
	.align	2, 0\n\
._1323:\n\
	.word	0xf88\n\
	.word	gBattleTextBuff1\n\
	.word	gStatusConditionString_PoisonJpn\n\
._1267:\n\
	mov	r0, #0x58\n\
	mov	r1, sl\n\
	mul	r1, r1, r0\n\
	add	r0, r1, #0\n\
	add	r1, r2, #0\n\
	add	r1, r1, #0x50\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	r1, #0x7\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1325	@cond_branch\n\
	b	._1346\n\
._1325:\n\
	ldr	r0, ._1328\n\
	ldr	r1, ._1328 + 4\n\
	bl	StringCopy\n\
	mov	r2, #0x2\n\
	mov	r9, r2\n\
	b	._1343\n\
._1329:\n\
	.align	2, 0\n\
._1328:\n\
	.word	gBattleTextBuff1\n\
	.word	gStatusConditionString_ConfusionJpn\n\
._1254:\n\
	mov	r0, #0x58\n\
	mov	r3, sl\n\
	mul	r3, r3, r0\n\
	add	r0, r3, #0\n\
	add	r1, r2, #0\n\
	add	r1, r1, #0x4c\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	r1, #0x40\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1346	@cond_branch\n\
	ldr	r0, ._1332\n\
	ldr	r1, ._1332 + 4\n\
	b	._1331\n\
._1333:\n\
	.align	2, 0\n\
._1332:\n\
	.word	gBattleTextBuff1\n\
	.word	gStatusConditionString_ParalysisJpn\n\
._1319:\n\
	mov	r0, #0x58\n\
	mov	r3, sl\n\
	mul	r3, r3, r0\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x4c\n\
	add	r0, r3, r0\n\
	ldr	r0, [r0]\n\
	mov	r1, #0x7\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1346	@cond_branch\n\
	add	r2, r2, #0x50\n\
	add	r2, r3, r2\n\
	ldr	r0, [r2]\n\
	ldr	r1, ._1336\n\
	and	r0, r0, r1\n\
	str	r0, [r2]\n\
	ldr	r0, ._1336 + 4\n\
	ldr	r1, ._1336 + 8\n\
	bl	StringCopy\n\
	mov	r0, #0x1\n\
	mov	r9, r0\n\
	b	._1343\n\
._1337:\n\
	.align	2, 0\n\
._1336:\n\
	.word	0xf7ffffff\n\
	.word	gBattleTextBuff1\n\
	.word	gStatusConditionString_SleepJpn\n\
._1288:\n\
	mov	r0, #0x58\n\
	mov	r1, sl\n\
	mul	r1, r1, r0\n\
	add	r0, r1, #0\n\
	add	r1, r2, #0\n\
	add	r1, r1, #0x4c\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	r1, #0x10\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1346	@cond_branch\n\
	ldr	r0, ._1340\n\
	ldr	r1, ._1340 + 4\n\
	bl	StringCopy\n\
	mov	r2, #0x1\n\
	mov	r9, r2\n\
	b	._1343\n\
._1341:\n\
	.align	2, 0\n\
._1340:\n\
	.word	gBattleTextBuff1\n\
	.word	gStatusConditionString_BurnJpn\n\
._1287:\n\
	mov	r0, #0x58\n\
	mov	r3, sl\n\
	mul	r3, r3, r0\n\
	add	r0, r3, #0\n\
	add	r1, r2, #0\n\
	add	r1, r1, #0x4c\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	r1, #0x20\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1346	@cond_branch\n\
	ldr	r0, ._1344\n\
	ldr	r1, ._1344 + 4\n\
._1331:\n\
	bl	StringCopy\n\
	mov	r5, #0x1\n\
	mov	r9, r5\n\
	b	._1343\n\
._1345:\n\
	.align	2, 0\n\
._1344:\n\
	.word	gBattleTextBuff1\n\
	.word	gStatusConditionString_IceJpn\n\
._1259:\n\
	mov	r0, #0x58\n\
	mov	r1, sl\n\
	mul	r1, r1, r0\n\
	add	r0, r1, #0\n\
	add	r1, r2, #0\n\
	add	r1, r1, #0x50\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	r1, #0xf0\n\
	lsl	r1, r1, #0xc\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1346	@cond_branch\n\
	ldr	r0, ._1352\n\
	ldr	r1, ._1352 + 4\n\
	bl	StringCopy\n\
	mov	r2, #0x3\n\
	mov	r9, r2\n\
._1346:\n\
	mov	r3, r9\n\
	cmp	r3, #0\n\
	beq	._1347	@cond_branch\n\
._1343:\n\
	mov	r5, r9\n\
	cmp	r5, #0x2\n\
	beq	._1348	@cond_branch\n\
	cmp	r5, #0x2\n\
	bgt	._1349	@cond_branch\n\
	cmp	r5, #0x1\n\
	beq	._1350	@cond_branch\n\
	b	._1355\n\
._1353:\n\
	.align	2, 0\n\
._1352:\n\
	.word	gBattleTextBuff1\n\
	.word	gStatusConditionString_LoveJpn\n\
._1349:\n\
	mov	r0, r9\n\
	cmp	r0, #0x3\n\
	beq	._1354	@cond_branch\n\
	b	._1355\n\
._1350:\n\
	ldr	r1, ._1357\n\
	mov	r0, #0x58\n\
	mov	r2, sl\n\
	mul	r2, r2, r0\n\
	add	r1, r1, #0x4c\n\
	add	r2, r2, r1\n\
	mov	r0, #0x0\n\
	b	._1356\n\
._1358:\n\
	.align	2, 0\n\
._1357:\n\
	.word	gBattleMons\n\
._1348:\n\
	ldr	r1, ._1360\n\
	mov	r0, #0x58\n\
	mov	r2, sl\n\
	mul	r2, r2, r0\n\
	add	r1, r1, #0x50\n\
	add	r2, r2, r1\n\
	ldr	r0, [r2]\n\
	mov	r1, #0x8\n\
	neg	r1, r1\n\
	b	._1359\n\
._1361:\n\
	.align	2, 0\n\
._1360:\n\
	.word	gBattleMons\n\
._1354:\n\
	ldr	r1, ._1363\n\
	mov	r0, #0x58\n\
	mov	r2, sl\n\
	mul	r2, r2, r0\n\
	add	r1, r1, #0x50\n\
	add	r2, r2, r1\n\
	ldr	r0, [r2]\n\
	ldr	r1, ._1363 + 4\n\
._1359:\n\
	and	r0, r0, r1\n\
._1356:\n\
	str	r0, [r2]\n\
._1355:\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1363 + 8\n\
	ldr	r0, ._1363 + 12\n\
	str	r0, [r1]\n\
	ldr	r0, ._1363 + 16\n\
	ldr	r1, ._1363 + 20\n\
	add	r0, r0, r1\n\
	mov	r2, sl\n\
	strb	r2, [r0]\n\
	ldr	r4, ._1363 + 24\n\
	strb	r2, [r4]\n\
	ldrb	r1, [r4]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r1\n\
	ldr	r1, ._1363 + 28\n\
	add	r0, r0, r1\n\
	str	r0, [sp]\n\
	mov	r0, #0x0\n\
	mov	r1, #0x28\n\
	mov	r2, #0x0\n\
	mov	r3, #0x4\n\
	bl	EmitSetMonData\n\
	ldrb	r0, [r4]\n\
	bl	MarkBufferBankForExecution\n\
	bl	._1540\n\
._1364:\n\
	.align	2, 0\n\
._1363:\n\
	.word	gBattleMons\n\
	.word	0xfff0ffff\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_AbilityCuredStatus\n\
	.word	+0x2000000\n\
	.word	0x16003\n\
	.word	gActiveBank\n\
	.word	gUnknown_02024ACC\n\
._1347:\n\
	mov	r0, sl\n\
	add	r0, r0, #0x1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	sl, r0\n\
	ldr	r0, ._1368\n\
	ldrb	r0, [r0]\n\
	cmp	sl, r0\n\
	bcs	._1365	@cond_branch\n\
	b	._1366\n\
._1365:\n\
	bl	._1534\n\
._1369:\n\
	.align	2, 0\n\
._1368:\n\
	.word	gNoOfAllBanks\n\
._750:\n\
	mov	r3, #0x0\n\
	mov	sl, r3\n\
	ldr	r0, ._1377\n\
	ldrb	r0, [r0]\n\
	cmp	sl, r0\n\
	bcc	._1370	@cond_branch\n\
	b	._1534\n\
._1370:\n\
	ldr	r4, ._1377 + 4\n\
._1375:\n\
	mov	r0, #0x58\n\
	mov	r5, sl\n\
	mul	r5, r5, r0\n\
	add	r0, r5, #0\n\
	add	r0, r0, r4\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0x3b\n\
	bne	._1373	@cond_branch\n\
	mov	r0, sl\n\
	bl	CastformDataTypeChange\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
	cmp	r0, #0\n\
	beq	._1373	@cond_branch\n\
	b	._1374\n\
._1373:\n\
	mov	r0, sl\n\
	add	r0, r0, #0x1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	sl, r0\n\
	ldr	r0, ._1377\n\
	ldrb	r0, [r0]\n\
	cmp	sl, r0\n\
	bcc	._1375	@cond_branch\n\
	b	._1534\n\
._1378:\n\
	.align	2, 0\n\
._1377:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
._751:\n\
	mov	r1, r8\n\
	ldrb	r0, [r1]\n\
	cmp	r0, #0x1c\n\
	beq	._1379	@cond_branch\n\
	b	._1534\n\
._1379:\n\
	ldr	r4, ._1385\n\
	ldr	r1, [r4]\n\
	mov	r0, #0x80\n\
	lsl	r0, r0, #0x7\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1381	@cond_branch\n\
	b	._1534\n\
._1381:\n\
	ldr	r0, ._1385 + 4\n\
	and	r1, r1, r0\n\
	str	r1, [r4]\n\
	ldr	r3, ._1385 + 8\n\
	add	r2, r7, r3\n\
	ldrb	r1, [r2]\n\
	mov	r0, #0x3f\n\
	and	r0, r0, r1\n\
	strb	r0, [r2]\n\
	cmp	r0, #0x6\n\
	bne	._1383	@cond_branch\n\
	mov	r0, #0x2\n\
	strb	r0, [r2]\n\
._1383:\n\
	ldr	r1, ._1385 + 12\n\
	ldrb	r0, [r2]\n\
	add	r0, r0, #0x40\n\
	strb	r0, [r1, #0x3]\n\
	ldr	r0, ._1385 + 16\n\
	ldrb	r1, [r0]\n\
	ldr	r5, ._1385 + 20\n\
	add	r0, r7, r5\n\
	strb	r1, [r0]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1385 + 24\n\
	ldr	r0, ._1385 + 28\n\
	str	r0, [r1]\n\
	ldr	r0, [r4]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x6\n\
	orr	r0, r0, r1\n\
	str	r0, [r4]\n\
	b	._1392\n\
._1386:\n\
	.align	2, 0\n\
._1385:\n\
	.word	gHitMarker\n\
	.word	0xffffbfff\n\
	.word	0x160ca\n\
	.word	gBattleCommunication\n\
	.word	gBankTarget\n\
	.word	0x16003\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_SynchronizeActivates\n\
._752:\n\
	mov	r1, r8\n\
	ldrb	r0, [r1]\n\
	cmp	r0, #0x1c\n\
	beq	._1387	@cond_branch\n\
	b	._1534\n\
._1387:\n\
	ldr	r4, ._1393\n\
	ldr	r1, [r4]\n\
	mov	r0, #0x80\n\
	lsl	r0, r0, #0x7\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1389	@cond_branch\n\
	b	._1534\n\
._1389:\n\
	ldr	r0, ._1393 + 4\n\
	and	r1, r1, r0\n\
	str	r1, [r4]\n\
	ldr	r3, ._1393 + 8\n\
	add	r2, r7, r3\n\
	ldrb	r1, [r2]\n\
	mov	r0, #0x3f\n\
	and	r0, r0, r1\n\
	strb	r0, [r2]\n\
	cmp	r0, #0x6\n\
	bne	._1391	@cond_branch\n\
	mov	r0, #0x2\n\
	strb	r0, [r2]\n\
._1391:\n\
	ldr	r1, ._1393 + 12\n\
	ldrb	r0, [r2]\n\
	strb	r0, [r1, #0x3]\n\
	ldr	r0, ._1393 + 16\n\
	ldrb	r1, [r0]\n\
	ldr	r5, ._1393 + 20\n\
	add	r0, r7, r5\n\
	strb	r1, [r0]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1393 + 24\n\
	ldr	r0, ._1393 + 28\n\
	str	r0, [r1]\n\
	ldr	r0, [r4]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x6\n\
	orr	r0, r0, r1\n\
	str	r0, [r4]\n\
	b	._1392\n\
._1394:\n\
	.align	2, 0\n\
._1393:\n\
	.word	gHitMarker\n\
	.word	0xffffbfff\n\
	.word	0x160ca\n\
	.word	gBattleCommunication\n\
	.word	gBankAttacker\n\
	.word	0x16003\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_SynchronizeActivates\n\
._753:\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1402\n\
	ldrb	r1, [r0]\n\
	cmp	r4, r1\n\
	blt	._1395	@cond_branch\n\
	b	._1534\n\
._1395:\n\
	ldr	r0, ._1402 + 4\n\
	add	r5, r1, #0\n\
	ldr	r2, ._1402 + 8\n\
	add	r3, r0, #0\n\
	add	r3, r3, #0x20\n\
	mov	r6, #0x80\n\
	lsl	r6, r6, #0xc\n\
._1400:\n\
	ldrb	r1, [r3]\n\
	cmp	r1, #0x16\n\
	bne	._1398	@cond_branch\n\
	ldr	r0, [r2]\n\
	and	r0, r0, r6\n\
	cmp	r0, #0\n\
	beq	._1398	@cond_branch\n\
	b	._1399\n\
._1398:\n\
	add	r2, r2, #0x4\n\
	add	r3, r3, #0x58\n\
	add	r4, r4, #0x1\n\
	cmp	r4, r5\n\
	blt	._1400	@cond_branch\n\
	b	._1534\n\
._1403:\n\
	.align	2, 0\n\
._1402:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
	.word	gStatuses3\n\
._755:\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1417\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1404	@cond_branch\n\
	b	._1534\n\
._1404:\n\
	ldr	r0, ._1417 + 4\n\
	mov	r8, r0\n\
	ldr	r1, ._1417 + 8\n\
	add	r1, r1, #0x20\n\
	str	r1, [sp, #0x1c]\n\
	mov	r2, #0x0\n\
	str	r2, [sp, #0x20]\n\
._1434:\n\
	ldr	r3, [sp, #0x1c]\n\
	ldrb	r0, [r3]\n\
	cmp	r0, #0x24\n\
	beq	._1406	@cond_branch\n\
	b	._1431\n\
._1406:\n\
	ldr	r0, ._1417 + 12\n\
	ldr	r5, [sp, #0x20]\n\
	add	r0, r5, r0\n\
	ldr	r1, [r0]\n\
	mov	r0, #0x80\n\
	lsl	r0, r0, #0xd\n\
	and	r1, r1, r0\n\
	str	r5, [sp, #0x18]\n\
	cmp	r1, #0\n\
	bne	._1408	@cond_branch\n\
	b	._1431\n\
._1408:\n\
	lsl	r0, r4, #0x18\n\
	lsr	r0, r0, #0x18\n\
	bl	GetBankIdentity\n\
	mov	r1, #0x1\n\
	add	r5, r0, #0\n\
	eor	r5, r5, r1\n\
	and	r5, r5, r1\n\
	add	r0, r5, #0\n\
	bl	GetBankByIdentity\n\
	lsl	r0, r0, #0x18\n\
	lsr	r6, r0, #0x18\n\
	add	r0, r5, #2\n\
	bl	GetBankByIdentity\n\
	lsl	r0, r0, #0x18\n\
	lsr	r7, r0, #0x18\n\
	ldr	r0, ._1417 + 16\n\
	ldrh	r1, [r0]\n\
	mov	r2, #0x1\n\
	add	r0, r2, #0\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1410	@cond_branch\n\
	b	._1411\n\
._1410:\n\
	mov	r1, #0x58\n\
	add	r0, r6, #0\n\
	mul	r0, r0, r1\n\
	ldr	r3, ._1417 + 8\n\
	add	r1, r0, r3\n\
	add	r0, r1, #0\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	beq	._1420	@cond_branch\n\
	ldrh	r0, [r1, #0x28]\n\
	cmp	r0, #0\n\
	beq	._1415	@cond_branch\n\
	mov	r1, #0x58\n\
	add	r0, r7, #0\n\
	mul	r0, r0, r1\n\
	add	r1, r0, r3\n\
	add	r0, r1, #0\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	beq	._1415	@cond_branch\n\
	ldrh	r0, [r1, #0x28]\n\
	cmp	r0, #0\n\
	beq	._1415	@cond_branch\n\
	str	r2, [sp, #0x24]\n\
	bl	Random\n\
	ldr	r2, [sp, #0x24]\n\
	add	r1, r2, #0\n\
	and	r1, r1, r0\n\
	lsl	r1, r1, #0x1\n\
	orr	r5, r5, r1\n\
	add	r0, r5, #0\n\
	bl	GetBankByIdentity\n\
	mov	r2, r8\n\
	strb	r0, [r2]\n\
	ldrb	r0, [r2]\n\
	mov	r3, #0x58\n\
	mul	r0, r0, r3\n\
	ldr	r5, ._1417 + 8\n\
	add	r0, r0, r5\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	ldr	r1, [sp, #0x1c]\n\
	strb	r0, [r1]\n\
	ldrb	r0, [r2]\n\
	mul	r0, r0, r3\n\
	add	r0, r0, r5\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	ldr	r2, ._1417 + 20\n\
	strb	r0, [r2]\n\
	b	._1416\n\
._1418:\n\
	.align	2, 0\n\
._1417:\n\
	.word	gNoOfAllBanks\n\
	.word	gActiveBank\n\
	.word	gBattleMons\n\
	.word	gStatuses3\n\
	.word	gBattleTypeFlags\n\
	.word	gLastUsedAbility\n\
._1415:\n\
	ldr	r3, ._1422\n\
	mov	r2, #0x58\n\
	add	r0, r6, #0\n\
	mul	r0, r0, r2\n\
	add	r1, r0, r3\n\
	add	r0, r1, #0\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	beq	._1420	@cond_branch\n\
	ldrh	r0, [r1, #0x28]\n\
	cmp	r0, #0\n\
	beq	._1420	@cond_branch\n\
	mov	r5, r8\n\
	strb	r6, [r5]\n\
	add	r1, r4, #0\n\
	mul	r1, r1, r2\n\
	add	r1, r1, r3\n\
	ldrb	r0, [r5]\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r3\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	add	r1, r1, #0x20\n\
	strb	r0, [r1]\n\
	ldrb	r0, [r5]\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r3\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	b	._1426\n\
._1423:\n\
	.align	2, 0\n\
._1422:\n\
	.word	gBattleMons\n\
._1420:\n\
	ldr	r3, ._1427\n\
	mov	r2, #0x58\n\
	add	r0, r7, #0\n\
	mul	r0, r0, r2\n\
	add	r1, r0, r3\n\
	add	r0, r1, #0\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	beq	._1430	@cond_branch\n\
	ldrh	r0, [r1, #0x28]\n\
	cmp	r0, #0\n\
	beq	._1430	@cond_branch\n\
	mov	r5, r8\n\
	strb	r7, [r5]\n\
	add	r1, r4, #0\n\
	mul	r1, r1, r2\n\
	add	r1, r1, r3\n\
	ldrb	r0, [r5]\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r3\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	add	r1, r1, #0x20\n\
	strb	r0, [r1]\n\
	ldrb	r0, [r5]\n\
	mul	r0, r0, r2\n\
	add	r0, r0, r3\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	b	._1426\n\
._1428:\n\
	.align	2, 0\n\
._1427:\n\
	.word	gBattleMons\n\
._1411:\n\
	mov	r2, r8\n\
	strb	r6, [r2]\n\
	mov	r3, #0x58\n\
	add	r0, r6, #0\n\
	mul	r0, r0, r3\n\
	ldr	r5, ._1436\n\
	add	r0, r0, r5\n\
	add	r2, r0, #0\n\
	add	r2, r2, #0x20\n\
	ldrb	r1, [r2]\n\
	cmp	r1, #0\n\
	beq	._1430	@cond_branch\n\
	ldrh	r0, [r0, #0x28]\n\
	cmp	r0, #0\n\
	beq	._1430	@cond_branch\n\
	ldr	r0, [sp, #0x1c]\n\
	strb	r1, [r0]\n\
	ldrb	r0, [r2]\n\
._1426:\n\
	ldr	r1, ._1436 + 4\n\
	strb	r0, [r1]\n\
._1416:\n\
	mov	r0, r9\n\
	add	r0, r0, #0x1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._1430:\n\
	mov	r2, r9\n\
	cmp	r2, #0\n\
	beq	._1431	@cond_branch\n\
	b	._1432\n\
._1431:\n\
	ldr	r3, [sp, #0x1c]\n\
	add	r3, r3, #0x58\n\
	str	r3, [sp, #0x1c]\n\
	ldr	r5, [sp, #0x20]\n\
	add	r5, r5, #0x4\n\
	str	r5, [sp, #0x20]\n\
	add	r4, r4, #0x1\n\
	ldr	r0, ._1436 + 8\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	bge	._1433	@cond_branch\n\
	b	._1434\n\
._1433:\n\
	b	._1534\n\
._1437:\n\
	.align	2, 0\n\
._1436:\n\
	.word	gBattleMons\n\
	.word	gLastUsedAbility\n\
	.word	gNoOfAllBanks\n\
._754:\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1445\n\
	ldrb	r1, [r0]\n\
	cmp	r4, r1\n\
	blt	._1438	@cond_branch\n\
	b	._1534\n\
._1438:\n\
	ldr	r0, ._1445 + 4\n\
	add	r5, r1, #0\n\
	ldr	r2, ._1445 + 8\n\
	add	r3, r0, #0\n\
	add	r3, r3, #0x20\n\
	mov	r6, #0x80\n\
	lsl	r6, r6, #0xc\n\
._1443:\n\
	ldrb	r1, [r3]\n\
	cmp	r1, #0x16\n\
	bne	._1441	@cond_branch\n\
	ldr	r0, [r2]\n\
	and	r0, r0, r6\n\
	cmp	r0, #0\n\
	beq	._1441	@cond_branch\n\
	b	._1442\n\
._1441:\n\
	add	r2, r2, #0x4\n\
	add	r3, r3, #0x58\n\
	add	r4, r4, #0x1\n\
	cmp	r4, r5\n\
	blt	._1443	@cond_branch\n\
	b	._1534\n\
._1446:\n\
	.align	2, 0\n\
._1445:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
	.word	gStatuses3\n\
._756:\n\
	mov	r0, sl\n\
	bl	GetBankSide\n\
	lsl	r0, r0, #0x18\n\
	lsr	r5, r0, #0x18\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1453\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1447	@cond_branch\n\
	b	._1534\n\
._1447:\n\
	ldr	r7, ._1453 + 4\n\
._1451:\n\
	lsl	r0, r4, #0x18\n\
	lsr	r0, r0, #0x18\n\
	bl	GetBankSide\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	add	r3, r4, #1\n\
	cmp	r0, r5\n\
	beq	._1450	@cond_branch\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r4\n\
	add	r0, r0, r7\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, r6\n\
	bne	._1450	@cond_branch\n\
	ldr	r0, ._1453 + 8\n\
	strb	r6, [r0]\n\
	lsl	r0, r3, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._1450:\n\
	add	r4, r3, #0\n\
	ldr	r0, ._1453\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1451	@cond_branch\n\
	b	._1534\n\
._1454:\n\
	.align	2, 0\n\
._1453:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
	.word	gLastUsedAbility\n\
._757:\n\
	mov	r0, sl\n\
	bl	GetBankSide\n\
	lsl	r0, r0, #0x18\n\
	lsr	r5, r0, #0x18\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1461\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1455	@cond_branch\n\
	b	._1534\n\
._1455:\n\
	ldr	r7, ._1461 + 4\n\
._1459:\n\
	lsl	r0, r4, #0x18\n\
	lsr	r0, r0, #0x18\n\
	bl	GetBankSide\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	add	r3, r4, #1\n\
	cmp	r0, r5\n\
	bne	._1458	@cond_branch\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r4\n\
	add	r0, r0, r7\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, r6\n\
	bne	._1458	@cond_branch\n\
	ldr	r0, ._1461 + 8\n\
	strb	r6, [r0]\n\
	lsl	r0, r3, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._1458:\n\
	add	r4, r3, #0\n\
	ldr	r0, ._1461\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1459	@cond_branch\n\
	b	._1534\n\
._1462:\n\
	.align	2, 0\n\
._1461:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
	.word	gLastUsedAbility\n\
._758:\n\
	mov	r1, r8\n\
	ldrb	r0, [r1]\n\
	cmp	r0, #0xfd\n\
	beq	._1463	@cond_branch\n\
	cmp	r0, #0xfe\n\
	beq	._1464	@cond_branch\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1468\n\
	add	r5, r0, #0\n\
	ldrb	r2, [r5]\n\
	cmp	r4, r2\n\
	blt	._1465	@cond_branch\n\
	b	._1534\n\
._1465:\n\
	ldr	r2, ._1468 + 4\n\
	b	._1485\n\
._1469:\n\
	.align	2, 0\n\
._1468:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
._1463:\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1475\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1470	@cond_branch\n\
	b	._1534\n\
._1470:\n\
	ldr	r5, ._1475 + 4\n\
	mov	r2, #0x80\n\
	lsl	r2, r2, #0x9\n\
	add	r1, r0, #0\n\
._1473:\n\
	lsl	r0, r4, #0x2\n\
	add	r0, r0, r5\n\
	ldr	r0, [r0]\n\
	and	r0, r0, r2\n\
	add	r3, r4, #1\n\
	cmp	r0, #0\n\
	beq	._1472	@cond_branch\n\
	lsl	r0, r3, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._1472:\n\
	add	r4, r3, #0\n\
	cmp	r4, r1\n\
	blt	._1473	@cond_branch\n\
	b	._1534\n\
._1476:\n\
	.align	2, 0\n\
._1475:\n\
	.word	gNoOfAllBanks\n\
	.word	gStatuses3\n\
._1464:\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1482\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1477	@cond_branch\n\
	b	._1534\n\
._1477:\n\
	ldr	r5, ._1482 + 4\n\
	mov	r2, #0x80\n\
	lsl	r2, r2, #0xa\n\
	add	r1, r0, #0\n\
._1480:\n\
	lsl	r0, r4, #0x2\n\
	add	r0, r0, r5\n\
	ldr	r0, [r0]\n\
	and	r0, r0, r2\n\
	add	r3, r4, #1\n\
	cmp	r0, #0\n\
	beq	._1479	@cond_branch\n\
	lsl	r0, r3, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._1479:\n\
	add	r4, r3, #0\n\
	cmp	r4, r1\n\
	blt	._1480	@cond_branch\n\
	b	._1534\n\
._1483:\n\
	.align	2, 0\n\
._1482:\n\
	.word	gNoOfAllBanks\n\
	.word	gStatuses3\n\
._1485:\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r4\n\
	add	r0, r0, r2\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	add	r3, r4, #1\n\
	cmp	r0, r6\n\
	bne	._1484	@cond_branch\n\
	mov	r0, r8\n\
	strb	r6, [r0]\n\
	lsl	r0, r3, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._1484:\n\
	add	r4, r3, #0\n\
	ldrb	r1, [r5]\n\
	cmp	r4, r1\n\
	blt	._1485	@cond_branch\n\
	b	._1534\n\
._763:\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1493\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1487	@cond_branch\n\
	b	._1534\n\
._1487:\n\
	ldr	r7, ._1493 + 4\n\
	add	r2, r0, #0\n\
	mov	r5, #0x58\n\
._1491:\n\
	add	r0, r4, #0\n\
	mul	r0, r0, r5\n\
	add	r1, r0, r7\n\
	add	r0, r1, #0\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	add	r3, r4, #1\n\
	cmp	r0, r6\n\
	bne	._1490	@cond_branch\n\
	ldrh	r0, [r1, #0x28]\n\
	cmp	r0, #0\n\
	beq	._1490	@cond_branch\n\
	mov	r0, r8\n\
	strb	r6, [r0]\n\
	lsl	r0, r3, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._1490:\n\
	add	r4, r3, #0\n\
	cmp	r4, r2\n\
	blt	._1491	@cond_branch\n\
	b	._1534\n\
._1494:\n\
	.align	2, 0\n\
._1493:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
._759:\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1501\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1495	@cond_branch\n\
	b	._1534\n\
._1495:\n\
	ldr	r7, ._1501 + 4\n\
	add	r1, r0, #0\n\
	mov	r5, #0x58\n\
	ldr	r2, ._1501 + 8\n\
._1499:\n\
	add	r0, r4, #0\n\
	mul	r0, r0, r5\n\
	add	r0, r0, r7\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	add	r3, r4, #1\n\
	cmp	r0, r6\n\
	bne	._1498	@cond_branch\n\
	cmp	r4, sl\n\
	beq	._1498	@cond_branch\n\
	strb	r6, [r2]\n\
	lsl	r0, r3, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._1498:\n\
	add	r4, r3, #0\n\
	cmp	r4, r1\n\
	blt	._1499	@cond_branch\n\
	b	._1534\n\
._1502:\n\
	.align	2, 0\n\
._1501:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
	.word	gLastUsedAbility\n\
._760:\n\
	mov	r0, sl\n\
	bl	GetBankSide\n\
	lsl	r0, r0, #0x18\n\
	lsr	r5, r0, #0x18\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1509\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1503	@cond_branch\n\
	b	._1534\n\
._1503:\n\
	ldr	r7, ._1509 + 4\n\
._1507:\n\
	lsl	r0, r4, #0x18\n\
	lsr	r0, r0, #0x18\n\
	bl	GetBankSide\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, r5\n\
	beq	._1506	@cond_branch\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r4\n\
	add	r0, r0, r7\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, r6\n\
	bne	._1506	@cond_branch\n\
	ldr	r0, ._1509 + 8\n\
	strb	r6, [r0]\n\
	mov	r0, r9\n\
	add	r0, r0, #0x1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._1506:\n\
	add	r4, r4, #0x1\n\
	ldr	r0, ._1509\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1507	@cond_branch\n\
	b	._1534\n\
._1510:\n\
	.align	2, 0\n\
._1509:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
	.word	gLastUsedAbility\n\
._761:\n\
	mov	r0, sl\n\
	bl	GetBankSide\n\
	lsl	r0, r0, #0x18\n\
	lsr	r5, r0, #0x18\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1517\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1511	@cond_branch\n\
	b	._1534\n\
._1511:\n\
	ldr	r7, ._1517 + 4\n\
._1515:\n\
	lsl	r0, r4, #0x18\n\
	lsr	r0, r0, #0x18\n\
	bl	GetBankSide\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, r5\n\
	bne	._1514	@cond_branch\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r4\n\
	add	r0, r0, r7\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, r6\n\
	bne	._1514	@cond_branch\n\
	ldr	r0, ._1517 + 8\n\
	strb	r6, [r0]\n\
	mov	r0, r9\n\
	add	r0, r0, #0x1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._1514:\n\
	add	r4, r4, #0x1\n\
	ldr	r0, ._1517\n\
	ldrb	r0, [r0]\n\
	cmp	r4, r0\n\
	blt	._1515	@cond_branch\n\
	b	._1534\n\
._1518:\n\
	.align	2, 0\n\
._1517:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
	.word	gLastUsedAbility\n\
._853:\n\
	ldr	r0, ._1520\n\
	bl	BattleScriptPushCursorAndCallback\n\
	ldr	r0, ._1520 + 4\n\
	ldr	r2, ._1520 + 8\n\
	add	r1, r0, r2\n\
	strb	r6, [r1]\n\
	mov	r1, r9\n\
	sub	r1, r1, #0x1\n\
	ldr	r3, ._1520 + 12\n\
	add	r0, r0, r3\n\
	strb	r1, [r0]\n\
	b	._1534\n\
._1521:\n\
	.align	2, 0\n\
._1520:\n\
	.word	BattleScript_CastformChange\n\
	.word	+0x2000000\n\
	.word	0x16003\n\
	.word	0x1609b\n\
._1374:\n\
	ldr	r0, ._1523\n\
	bl	BattleScriptPushCursorAndCallback\n\
	ldr	r0, ._1523 + 4\n\
	ldr	r5, ._1523 + 8\n\
	add	r1, r0, r5\n\
	mov	r2, sl\n\
	strb	r2, [r1]\n\
	mov	r1, r9\n\
	sub	r1, r1, #0x1\n\
	ldr	r3, ._1523 + 12\n\
	add	r0, r0, r3\n\
	strb	r1, [r0]\n\
	b	._1540\n\
._1524:\n\
	.align	2, 0\n\
._1523:\n\
	.word	BattleScript_CastformChange\n\
	.word	+0x2000000\n\
	.word	0x16003\n\
	.word	0x1609b\n\
._1399:\n\
	mov	r5, r8\n\
	strb	r1, [r5]\n\
	ldr	r0, [r2]\n\
	ldr	r1, ._1526\n\
	and	r0, r0, r1\n\
	str	r0, [r2]\n\
	ldr	r0, ._1526 + 4\n\
	bl	BattleScriptPushCursorAndCallback\n\
	b	._1525\n\
._1527:\n\
	.align	2, 0\n\
._1526:\n\
	.word	0xfff7ffff\n\
	.word	gUnknown_081D978C\n\
._1432:\n\
	ldr	r0, ._1529\n\
	bl	BattleScriptPushCursorAndCallback\n\
	ldr	r1, ._1529 + 4\n\
	ldr	r2, [sp, #0x18]\n\
	add	r1, r2, r1\n\
	ldr	r0, [r1]\n\
	ldr	r2, ._1529 + 8\n\
	and	r0, r0, r2\n\
	str	r0, [r1]\n\
	ldr	r0, ._1529 + 12\n\
	ldr	r3, ._1529 + 16\n\
	add	r0, r0, r3\n\
	strb	r4, [r0]\n\
	ldr	r1, ._1529 + 20\n\
	mov	r4, #0xfd\n\
	strb	r4, [r1]\n\
	mov	r0, #0x4\n\
	strb	r0, [r1, #0x1]\n\
	ldr	r2, ._1529 + 24\n\
	ldrb	r0, [r2]\n\
	strb	r0, [r1, #0x2]\n\
	ldr	r3, ._1529 + 28\n\
	ldrb	r0, [r2]\n\
	lsl	r0, r0, #0x1\n\
	add	r0, r0, r3\n\
	ldrh	r0, [r0]\n\
	strb	r0, [r1, #0x3]\n\
	mov	r0, #0xff\n\
	strb	r0, [r1, #0x4]\n\
	ldr	r1, ._1529 + 32\n\
	strb	r4, [r1]\n\
	mov	r0, #0x9\n\
	strb	r0, [r1, #0x1]\n\
	ldr	r0, ._1529 + 36\n\
	ldrb	r0, [r0]\n\
	strb	r0, [r1, #0x2]\n\
	mov	r0, #0x1\n\
	neg	r0, r0\n\
	strb	r0, [r1, #0x3]\n\
	b	._1534\n\
._1530:\n\
	.align	2, 0\n\
._1529:\n\
	.word	BattleScript_TraceActivates\n\
	.word	gStatuses3\n\
	.word	0xffefffff\n\
	.word	+0x2000000\n\
	.word	0x16003\n\
	.word	gBattleTextBuff1\n\
	.word	gActiveBank\n\
	.word	gBattlePartyID\n\
	.word	gBattleTextBuff2\n\
	.word	gLastUsedAbility\n\
._1442:\n\
	mov	r5, r8\n\
	strb	r1, [r5]\n\
	ldr	r0, [r2]\n\
	ldr	r1, ._1532\n\
	and	r0, r0, r1\n\
	str	r0, [r2]\n\
	bl	BattleScriptPushCursor\n\
	ldr	r1, ._1532 + 4\n\
	ldr	r0, ._1532 + 8\n\
	str	r0, [r1]\n\
._1525:\n\
	ldr	r0, ._1532 + 12\n\
	ldr	r1, ._1532 + 16\n\
	add	r0, r0, r1\n\
	strb	r4, [r0]\n\
._1392:\n\
	mov	r0, r9\n\
	add	r0, r0, #0x1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
	b	._1534\n\
._1533:\n\
	.align	2, 0\n\
._1532:\n\
	.word	0xfff7ffff\n\
	.word	gBattlescriptCurrInstr\n\
	.word	gUnknown_081D9795\n\
	.word	+0x2000000\n\
	.word	0x160dd\n\
._762:\n\
	mov	r4, #0x0\n\
	ldr	r0, ._1541\n\
	ldrb	r1, [r0]\n\
	cmp	r4, r1\n\
	bge	._1534	@cond_branch\n\
	ldr	r0, ._1541 + 4\n\
	add	r2, r1, #0\n\
	add	r1, r0, #0\n\
	add	r1, r1, #0x20\n\
	ldr	r3, ._1541 + 8\n\
._1537:\n\
	ldrb	r0, [r1]\n\
	cmp	r0, r6\n\
	bne	._1536	@cond_branch\n\
	cmp	r4, sl\n\
	beq	._1536	@cond_branch\n\
	strb	r6, [r3]\n\
	mov	r0, r9\n\
	add	r0, r0, #0x1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r9, r0\n\
._1536:\n\
	add	r1, r1, #0x58\n\
	add	r4, r4, #0x1\n\
	cmp	r4, r2\n\
	blt	._1537	@cond_branch\n\
._1534:\n\
	mov	r2, r9\n\
	cmp	r2, #0\n\
	beq	._1540	@cond_branch\n\
._916:\n\
	ldr	r3, [sp, #0x4]\n\
	cmp	r3, #0xb\n\
	bhi	._1540	@cond_branch\n\
	ldr	r1, ._1541 + 8\n\
	ldrb	r0, [r1]\n\
	cmp	r0, #0xff\n\
	beq	._1540	@cond_branch\n\
	add	r1, r0, #0\n\
	mov	r0, sl\n\
	bl	RecordAbilityBattle\n\
._1540:\n\
	mov	r0, r9\n\
	add	sp, sp, #0x28\n\
	pop	{r3, r4, r5}\n\
	mov	r8, r3\n\
	mov	r9, r4\n\
	mov	sl, r5\n\
	pop	{r4, r5, r6, r7}\n\
	pop	{r1}\n\
	bx	r1\n\
._1542:\n\
	.align	2, 0\n\
._1541:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattleMons\n\
	.word	gLastUsedAbility");
}
#else
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

        if (gBattleStruct->dynamicMoveType)
            moveType = gBattleStruct->dynamicMoveType & 0x3F;
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
                switch (GetCurrentWeather())
                {
                case WEATHER_RAIN_LIGHT:
                case WEATHER_RAIN_MED:
                case WEATHER_RAIN_HEAVY:
                    if (!(gBattleWeather & WEATHER_RAIN_ANY))
                    {
                        gBattleWeather = (WEATHER_RAIN_TEMPORARY | WEATHER_RAIN_PERMANENT);
                        gBattleStruct->animArg1 = B_ANIM_RAIN_CONTINUES;
                        gBattleStruct->scriptingActive = bank;
                        effect++;
                    }
                    break;
                case WEATHER_SANDSTORM:
                    if (!(gBattleWeather & WEATHER_SANDSTORM_ANY))
                    {
                        gBattleWeather = (WEATHER_SANDSTORM_PERMANENT | WEATHER_SANDSTORM_TEMPORARY);
                        gBattleStruct->animArg1 = B_ANIM_SANDSTORM_CONTINUES;
                        gBattleStruct->scriptingActive = bank;
                        effect++;
                    }
                    break;
                case WEATHER_DROUGHT:
                    if (!(gBattleWeather & WEATHER_SUN_ANY))
                    {
                        gBattleWeather = (WEATHER_SUN_PERMANENT | WEATHER_SUN_TEMPORARY);
                        gBattleStruct->animArg1 = B_ANIM_SUN_CONTINUES;
                        gBattleStruct->scriptingActive = bank;
                        effect++;
                    }
                    break;
                }
                if (effect)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = GetCurrentWeather();
                    BattleScriptPushCursorAndCallback(BattleScript_OverworldWeatherStarts);
                }
                break;
            case ABILITY_DRIZZLE:
            //_08018680
                if (!(gBattleWeather & WEATHER_RAIN_PERMANENT))
                {
                    gBattleWeather = (WEATHER_RAIN_PERMANENT | WEATHER_RAIN_TEMPORARY);
                    BattleScriptPushCursorAndCallback(BattleScript_DrizzleActivates);
                    gBattleStruct->scriptingActive = bank;
                    effect++;
                }
                break;
            case ABILITY_SAND_STREAM:
            //_080186B8
                if (!(gBattleWeather & WEATHER_SANDSTORM_PERMANENT))
                {
                    gBattleWeather = (WEATHER_SANDSTORM_PERMANENT | WEATHER_SANDSTORM_TEMPORARY);
                    BattleScriptPushCursorAndCallback(BattleScript_SandstreamActivates);
                    gBattleStruct->scriptingActive = bank;
                    effect++;
                }
                break;
            case ABILITY_DROUGHT:
            //_080186F0
                if (!(gBattleWeather & WEATHER_SUN_PERMANENT))
                {
                    gBattleWeather = (WEATHER_SUN_PERMANENT | WEATHER_SUN_TEMPORARY);
                    BattleScriptPushCursorAndCallback(BattleScript_DroughtActivates);
                    gBattleStruct->scriptingActive = bank;
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
                    BattleScriptPushCursorAndCallback(BattleScript_CastformChange);
                    gBattleStruct->scriptingActive = bank;
                    gBattleStruct->castformToChangeInto = effect - 1;
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
                            BattleScriptPushCursorAndCallback(BattleScript_CastformChange);
                            gBattleStruct->scriptingActive = target1;
                            gBattleStruct->castformToChangeInto = effect - 1;
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
                        BattleScriptPushCursorAndCallback(BattleScript_RainDishActivates);
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
                        gBattleStruct->scriptingActive = gActiveBank = bank;
                        BattleScriptPushCursorAndCallback(BattleScript_ShedSkinActivates);
                        EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[bank].status1);
                        MarkBufferBankForExecution(gActiveBank);
                        effect++;
                    }
                    break;
                case ABILITY_SPEED_BOOST:
                    if (gBattleMons[bank].statStages[STAT_STAGE_SPEED] < 0xC && gDisableStructs[bank].isFirstTurn != 2)
                    {
                        gBattleMons[bank].statStages[STAT_STAGE_SPEED]++;
                        gBattleStruct->animArg1 = 0x11;
                        gBattleStruct->animArg2 = 0;
                        BattleScriptPushCursorAndCallback(BattleScript_SpeedBoostActivates);
                        gBattleStruct->scriptingActive = bank;
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
                    BattleScriptPushCursor();
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
                    BattleScriptPushCursor();
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
                    BattleScriptPushCursor();
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
                    BattleScriptPushCursor();
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
                    BattleScriptPushCursor();
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
                    BattleScriptPushCursor();
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
                    BattleScriptPushCursor();
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
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_AbilityCuredStatus;
                        gBattleStruct->scriptingActive = bank;
                        gActiveBank = bank;
                        EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
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
                            BattleScriptPushCursorAndCallback(BattleScript_CastformChange);
                            gBattleStruct->scriptingActive = bank;
                            gBattleStruct->castformToChangeInto = effect - 1;
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
                gBattleStruct->synchroniseEffect &= 0x3F;
                if (gBattleStruct->synchroniseEffect == 6)
                    gBattleStruct->synchroniseEffect = 2;
                gBattleCommunication[MOVE_EFFECT_BYTE] = gBattleStruct->synchroniseEffect + 0x40;
                gBattleStruct->scriptingActive = gBankTarget;
                BattleScriptPushCursor();
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
                gBattleStruct->synchroniseEffect &= 0x3F;
                if (gBattleStruct->synchroniseEffect == 6)
                    gBattleStruct->synchroniseEffect = 2;
                gBattleCommunication[MOVE_EFFECT_BYTE] = gBattleStruct->synchroniseEffect;
                gBattleStruct->scriptingActive = gBankAttacker;
                BattleScriptPushCursor();
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
                    BattleScriptPushCursorAndCallback(gUnknown_081D978C);
                    gBattleStruct->intimidateBank = i;
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
                        BattleScriptPushCursorAndCallback(BattleScript_TraceActivates);
                        gStatuses3[i] &= ~(STATUS3_TRACE);
                        gBattleStruct->scriptingActive = i;

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
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = gUnknown_081D9795;
                    gBattleStruct->intimidateBank = i;
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
#endif

void BattleScriptExecute(const u8* BS_ptr)
{
    gBattlescriptCurrInstr = BS_ptr;
    B_FUNCTION_STACK->ptr[B_FUNCTION_STACK->size++] = gBattleMainFunc;
    gBattleMainFunc = RunBattleScriptCommands_PopCallbacksStack;
    gCurrentActionFuncId = 0;
}

void BattleScriptPushCursorAndCallback(u8* BS_ptr)
{
    BattleScriptPushCursor();
    gBattlescriptCurrInstr = BS_ptr;
    B_FUNCTION_STACK->ptr[B_FUNCTION_STACK->size++] = gBattleMainFunc;
    gBattleMainFunc = RunBattleScriptCommands;
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
            gBattleStruct->moneyMultiplier = 2;
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
                gBattleStruct->scriptingActive = bank;
                gStringBank = bank;
                gActiveBank = gBankAttacker = bank;
                BattleScriptExecute(BattleScript_WhiteHerbEnd2);
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
                    BattleScriptExecute(BattleScript_ItemHealHP_RemoveItem);
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
                        BattleScriptExecute(BattleScript_BerryPPHealEnd2);
                        EmitSetMonData(0, i + REQUEST_PPMOVE1_BATTLE, 0, 1, &changedPP);
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
                    gBattleStruct->scriptingActive = bank;
                    gStringBank = bank;
                    gActiveBank = gBankAttacker = bank;
                    BattleScriptExecute(BattleScript_WhiteHerbEnd2);
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
                    BattleScriptExecute(BattleScript_ItemHealHP_End2);
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
                        BattleScriptExecute(BattleScript_BerryConfuseHealEnd2);
                    else
                        BattleScriptExecute(BattleScript_ItemHealHP_RemoveItem);
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
                        BattleScriptExecute(BattleScript_BerryConfuseHealEnd2);
                    else
                        BattleScriptExecute(BattleScript_ItemHealHP_RemoveItem);
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
                        BattleScriptExecute(BattleScript_BerryConfuseHealEnd2);
                    else
                        BattleScriptExecute(BattleScript_ItemHealHP_RemoveItem);
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
                        BattleScriptExecute(BattleScript_BerryConfuseHealEnd2);
                    else
                        BattleScriptExecute(BattleScript_ItemHealHP_RemoveItem);
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
                        BattleScriptExecute(BattleScript_BerryConfuseHealEnd2);
                    else
                        BattleScriptExecute(BattleScript_ItemHealHP_RemoveItem);
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
                    gBattleStruct->statChanger = 0x10 + STAT_STAGE_ATK;
                    gBattleStruct->animArg1 = 0xE + STAT_STAGE_ATK;
                    gBattleStruct->animArg2 = 0;
                    BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
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
                    gBattleStruct->statChanger = 0x10 + STAT_STAGE_DEF;
                    gBattleStruct->animArg1 = 0xE + STAT_STAGE_DEF;
                    gBattleStruct->animArg2 = 0;
                    BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
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
                    gBattleStruct->statChanger = 0x10 + STAT_STAGE_SPEED;
                    gBattleStruct->animArg1 = 0xE + STAT_STAGE_SPEED;
                    gBattleStruct->animArg2 = 0;
                    BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
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
                    gBattleStruct->statChanger = 0x10 + STAT_STAGE_SPATK;
                    gBattleStruct->animArg1 = 0xE + STAT_STAGE_SPATK;
                    gBattleStruct->animArg2 = 0;
                    BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
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
                    gBattleStruct->statChanger = 0x10 + STAT_STAGE_SPDEF;
                    gBattleStruct->animArg1 = 0xE + STAT_STAGE_SPDEF;
                    gBattleStruct->animArg2 = 0;
                    BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
                    effect = ITEM_STATS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CRITICAL_UP:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / bankQuality && !moveTurn && !(gBattleMons[bank].status2 & STATUS2_FOCUS_ENERGY))
                {
                    gBattleMons[bank].status2 |= STATUS2_FOCUS_ENERGY;
                    BattleScriptExecute(BattleScript_BerryFocusEnergyEnd2);
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
                        gBattleStruct->statChanger = 0x21 + i;
                        gBattleStruct->animArg1 = 0x21 + i + 6;
                        gBattleStruct->animArg2 = 0;
                        BattleScriptExecute(BattleScript_BerryStatRaiseEnd2);
                        effect = ITEM_STATS_CHANGE;
                    }
                }
                break;
            case HOLD_EFFECT_CURE_PAR:
                if (gBattleMons[bank].status1 & STATUS_PARALYSIS)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_PARALYSIS);
                    BattleScriptExecute(BattleScript_BerryCurePrlzEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_PSN:
                if (gBattleMons[bank].status1 & STATUS_PSN_ANY)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_PSN_ANY | STATUS_TOXIC_COUNTER);
                    BattleScriptExecute(BattleScript_BerryCurePsnEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_BRN:
                if (gBattleMons[bank].status1 & STATUS_BURN)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_BURN);
                    BattleScriptExecute(BattleScript_BerryCureBrnEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_FRZ:
                if (gBattleMons[bank].status1 & STATUS_FREEZE)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_FREEZE);
                    BattleScriptExecute(BattleScript_BerryCureFrzEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_SLP:
                if (gBattleMons[bank].status1 & STATUS_SLEEP)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_SLEEP);
                    gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE);
                    BattleScriptExecute(BattleScript_BerryCureSlpEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_CONFUSION:
                if (gBattleMons[bank].status2 & STATUS2_CONFUSION)
                {
                    gBattleMons[bank].status2 &= ~(STATUS2_CONFUSION);
                    BattleScriptExecute(BattleScript_BerryCureConfusionEnd2);
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
                    BattleScriptExecute(BattleScript_BerryCureChosenStatusEnd2);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_ATTRACT:
                if (gBattleMons[bank].status2 & STATUS2_INFATUATION)
                {
                    gBattleMons[bank].status2 &= ~(STATUS2_INFATUATION);
                    StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
                    BattleScriptExecute(BattleScript_BerryCureChosenStatusEnd2);
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            }
            if (effect)
            {
                gBattleStruct->scriptingActive = bank;
                gStringBank = bank;
                gActiveBank = gBankAttacker = bank;
                switch (effect)
                {
                case ITEM_STATUS_CHANGE:
                    EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[bank].status1);
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
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureParRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_PSN:
                if (gBattleMons[bank].status1 & STATUS_PSN_ANY)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_PSN_ANY | STATUS_TOXIC_COUNTER);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCurePsnRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_BRN:
                if (gBattleMons[bank].status1 & STATUS_BURN)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_BURN);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureBrnRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_FRZ:
                if (gBattleMons[bank].status1 & STATUS_FREEZE)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_FREEZE);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureFrzRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_SLP:
                if (gBattleMons[bank].status1 & STATUS_SLEEP)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_SLEEP);
                    gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureSlpRet;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_CONFUSION:
                if (gBattleMons[bank].status2 & STATUS2_CONFUSION)
                {
                    gBattleMons[bank].status2 &= ~(STATUS2_CONFUSION);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BerryCureConfusionRet;
                    effect = ITEM_EFFECT_OTHER;
                }
                break;
            case HOLD_EFFECT_CURE_ATTRACT:
                if (gBattleMons[bank].status2 & STATUS2_INFATUATION)
                {
                    gBattleMons[bank].status2 &= ~(STATUS2_INFATUATION);
                    StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
                    BattleScriptPushCursor();
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
                    BattleScriptPushCursor();
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
                    gBattleStruct->scriptingActive = bank;
                    gStringBank = bank;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_WhiteHerbRet;
                    return effect; // unnecessary return
                }
                break;
            }
            if (effect)
            {
                gBattleStruct->scriptingActive = bank;
                gStringBank = bank;
                gActiveBank = bank;
                EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
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
                    BattleScriptPushCursor();
                    SetMoveEffect(0, 0);
                    BattleScriptPop();
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
                    gBattleStruct->scriptingActive = gBankAttacker;
                    gBattleMoveDamage = (gSpecialStatuses[gBankTarget].moveturnLostHP / atkQuality) * -1;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = -1;
                    gSpecialStatuses[gBankTarget].moveturnLostHP = 0;
                    BattleScriptPushCursor();
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

#if DEBUG
__attribute__((naked))
u8 IsMonDisobedient(void)
{
    asm("\
	push	{r4, r5, r6, r7, lr}\n\
	mov	r7, r9\n\
	mov	r6, r8\n\
	push	{r6, r7}\n\
	add	sp, sp, #0xfffffff0\n\
	ldr	r0, ._1785\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x2\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1791	@cond_branch\n\
	ldr	r4, ._1785 + 4\n\
	ldrb	r0, [r4]\n\
	bl	GetBankSide\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0x1\n\
	beq	._1791	@cond_branch\n\
	ldr	r2, ._1785 + 8\n\
	ldrb	r1, [r4]\n\
	mov	r0, #0x58\n\
	mul	r1, r1, r0\n\
	add	r0, r2, #0\n\
	add	r0, r0, #0x54\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	add	r2, r2, #0x3c\n\
	add	r1, r1, r2\n\
	bl	IsOtherTrainer\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._1791	@cond_branch\n\
	ldr	r0, ._1785 + 12\n\
	ldrb	r1, [r0]\n\
	mov	r0, #0x40\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1783	@cond_branch\n\
	mov	r0, #0xa\n\
	b	._1784\n\
._1786:\n\
	.align	2, 0\n\
._1785:\n\
	.word	gBattleTypeFlags\n\
	.word	gBankAttacker\n\
	.word	gBattleMons\n\
	.word	gUnknown_02023A14+0x50\n\
._1783:\n\
	ldr	r0, ._1794\n\
	bl	FlagGet\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	bne	._1791	@cond_branch\n\
	mov	r1, #0xa\n\
	mov	r8, r1\n\
	ldr	r0, ._1794 + 4\n\
	bl	FlagGet\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._1788	@cond_branch\n\
	mov	r2, #0x1e\n\
	mov	r8, r2\n\
._1788:\n\
	ldr	r0, ._1794 + 8\n\
	bl	FlagGet\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._1789	@cond_branch\n\
	mov	r4, #0x32\n\
	mov	r8, r4\n\
._1789:\n\
	ldr	r0, ._1794 + 12\n\
	bl	FlagGet\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._1790	@cond_branch\n\
	mov	r0, #0x46\n\
._1784:\n\
	mov	r8, r0\n\
._1790:\n\
	ldr	r5, ._1794 + 16\n\
	ldr	r7, ._1794 + 20\n\
	ldrb	r0, [r7]\n\
	mov	r6, #0x58\n\
	mul	r0, r0, r6\n\
	add	r0, r0, r5\n\
	add	r0, r0, #0x2a\n\
	ldrb	r0, [r0]\n\
	cmp	r0, r8\n\
	bls	._1791	@cond_branch\n\
	bl	Random\n\
	mov	r1, #0xff\n\
	and	r1, r1, r0\n\
	ldrb	r0, [r7]\n\
	add	r2, r0, #0\n\
	mul	r2, r2, r6\n\
	add	r0, r2, r5\n\
	add	r0, r0, #0x2a\n\
	ldrb	r0, [r0]\n\
	add r0, r0, r8\n\
	mul	r0, r0, r1\n\
	asr	r4, r0, #0x8\n\
	cmp	r4, r8\n\
	bge	._1792	@cond_branch\n\
._1791:\n\
	mov	r0, #0x0\n\
	b	._1823\n\
._1795:\n\
	.align	2, 0\n\
._1794:\n\
	.word	0x80e\n\
	.word	0x808\n\
	.word	0x80a\n\
	.word	0x80c\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
._1792:\n\
	ldr	r3, ._1801\n\
	ldrh	r0, [r3]\n\
	cmp	r0, #0x63\n\
	bne	._1796	@cond_branch\n\
	add	r0, r5, #0\n\
	add	r0, r0, #0x50\n\
	add	r0, r2, r0\n\
	ldr	r1, [r0]\n\
	ldr	r2, ._1801 + 4\n\
	and	r1, r1, r2\n\
	str	r1, [r0]\n\
._1796:\n\
	ldrb	r0, [r7]\n\
	mul	r0, r0, r6\n\
	add	r1, r5, #0\n\
	add	r1, r1, #0x4c\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	r1, #0x7\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._1799	@cond_branch\n\
	ldrh	r0, [r3]\n\
	cmp	r0, #0xad\n\
	beq	._1798	@cond_branch\n\
	cmp	r0, #0xd6\n\
	bne	._1799	@cond_branch\n\
._1798:\n\
	ldr	r1, ._1801 + 8\n\
	ldr	r0, ._1801 + 12\n\
	b	._1819\n\
._1802:\n\
	.align	2, 0\n\
._1801:\n\
	.word	gCurrentMove\n\
	.word	0xff7fffff\n\
	.word	gBattlescriptCurrInstr\n\
	.word	gUnknown_081D995F\n\
._1799:\n\
	bl	Random\n\
	mov	r5, #0xff\n\
	add	r1, r5, #0\n\
	and	r1, r1, r0\n\
	ldr	r6, ._1808\n\
	ldr	r2, ._1808 + 4\n\
	mov	r9, r2\n\
	ldrb	r3, [r2]\n\
	mov	r7, #0x58\n\
	add	r0, r3, #0\n\
	mul	r0, r0, r7\n\
	add	r0, r0, r6\n\
	add	r0, r0, #0x2a\n\
	ldrb	r2, [r0]\n\
	mov	r4, r8\n\
	add	r0, r2, r4\n\
	mul	r0, r0, r1\n\
	asr	r4, r0, #0x8\n\
	cmp	r4, r8\n\
	bge	._1803	@cond_branch\n\
	ldr	r7, ._1808 + 8\n\
	ldr	r5, ._1808 + 12\n\
	ldrb	r0, [r5]\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r7\n\
	ldrb	r1, [r0]\n\
	add	r0, r3, #0\n\
	mov	r2, #0xff\n\
	bl	CheckMoveLimitations\n\
	lsl	r0, r0, #0x18\n\
	lsr	r4, r0, #0x18\n\
	cmp	r4, #0xf\n\
	bne	._1804	@cond_branch\n\
	b	._1805\n\
._1804:\n\
	add	r6, r5, #0\n\
	ldr	r0, ._1808 + 16\n\
	mov	r9, r0\n\
	mov	r1, #0x3\n\
	mov	r8, r1\n\
._1806:\n\
	bl	Random\n\
	mov	r2, r8\n\
	and	r0, r0, r2\n\
	mov	r1, r9\n\
	strb	r0, [r1]\n\
	strb	r0, [r6]\n\
	ldrb	r0, [r6]\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r7\n\
	ldr	r5, [r0]\n\
	and	r5, r5, r4\n\
	cmp	r5, #0\n\
	bne	._1806	@cond_branch\n\
	ldr	r4, ._1808 + 20\n\
	ldr	r3, ._1808\n\
	ldr	r0, ._1808 + 12\n\
	ldrb	r0, [r0]\n\
	lsl	r0, r0, #0x1\n\
	ldr	r1, ._1808 + 4\n\
	ldrb	r2, [r1]\n\
	mov	r1, #0x58\n\
	mul	r1, r1, r2\n\
	add	r0, r0, r1\n\
	add	r3, r3, #0xc\n\
	add	r0, r0, r3\n\
	ldrh	r0, [r0]\n\
	strh	r0, [r4]\n\
	ldr	r0, ._1808 + 24\n\
	strb	r5, [r0, #0x3]\n\
	ldr	r0, ._1808 + 28\n\
	mov	r1, #0x0\n\
	strh	r5, [r0]\n\
	ldr	r0, ._1808 + 32\n\
	ldr	r2, ._1808 + 36\n\
	add	r0, r0, r2\n\
	strb	r1, [r0]\n\
	ldr	r1, ._1808 + 40\n\
	ldr	r0, ._1808 + 44\n\
	str	r0, [r1]\n\
	ldrh	r0, [r4]\n\
	mov	r1, #0x0\n\
	bl	GetMoveTarget\n\
	ldr	r1, ._1808 + 48\n\
	strb	r0, [r1]\n\
	ldr	r2, ._1808 + 52\n\
	ldr	r0, [r2]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0xe\n\
	b	._1807\n\
._1809:\n\
	.align	2, 0\n\
._1808:\n\
	.word	gBattleMons\n\
	.word	gBankAttacker\n\
	.word	gBitTable\n\
	.word	gCurrMovePos\n\
	.word	gUnknown_02024BE5\n\
	.word	gRandomMove\n\
	.word	gBattleCommunication\n\
	.word	gDynamicBasePower\n\
	.word	+0x2000000\n\
	.word	0x1601c\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_IgnoresAndUsesRandomMove\n\
	.word	gBankTarget\n\
	.word	gHitMarker\n\
._1803:\n\
	mov	r4, r8\n\
	sub	r0, r2, r4\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r8, r0\n\
	bl	Random\n\
	add	r4, r5, #0\n\
	and	r4, r4, r0\n\
	cmp	r4, r8\n\
	bge	._1818	@cond_branch\n\
	mov	r1, r9\n\
	ldrb	r0, [r1]\n\
	add	r1, r0, #0\n\
	mul	r1, r1, r7\n\
	add	r0, r6, #0\n\
	add	r0, r0, #0x4c\n\
	add	r0, r1, r0\n\
	ldr	r0, [r0]\n\
	and	r0, r0, r5\n\
	cmp	r0, #0\n\
	bne	._1818	@cond_branch\n\
	add	r0, r1, r6\n\
	add	r0, r0, #0x20\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0x48\n\
	beq	._1818	@cond_branch\n\
	cmp	r0, #0xf\n\
	beq	._1818	@cond_branch\n\
	mov	r2, #0x0\n\
	ldr	r0, ._1820\n\
	ldrb	r3, [r0]\n\
	add	r7, r0, #0\n\
	cmp	r2, r3\n\
	bge	._1816	@cond_branch\n\
	ldr	r0, [r6, #0x50]\n\
	mov	r1, #0x70\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._1816	@cond_branch\n\
	add	r1, r6, #0\n\
	add	r1, r1, #0x50\n\
	mov	r5, #0x70\n\
._1817:\n\
	add	r1, r1, #0x58\n\
	add	r2, r2, #0x1\n\
	cmp	r2, r3\n\
	bge	._1816	@cond_branch\n\
	ldr	r0, [r1]\n\
	and	r0, r0, r5\n\
	cmp	r0, #0\n\
	beq	._1817	@cond_branch\n\
._1816:\n\
	ldrb	r7, [r7]\n\
	cmp	r2, r7\n\
	bne	._1818	@cond_branch\n\
	ldr	r1, ._1820 + 4\n\
	ldr	r0, ._1820 + 8\n\
	b	._1819\n\
._1821:\n\
	.align	2, 0\n\
._1820:\n\
	.word	gNoOfAllBanks\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_IgnoresAndFallsAsleep\n\
._1818:\n\
	mov	r2, r8\n\
	sub	r4, r4, r2\n\
	cmp	r4, r8\n\
	blt	._1822	@cond_branch\n\
._1805:\n\
	bl	Random\n\
	ldr	r2, ._1824\n\
	mov	r1, #0x3\n\
	and	r1, r1, r0\n\
	strb	r1, [r2, #0x5]\n\
	ldr	r1, ._1824 + 4\n\
	ldr	r0, ._1824 + 8\n\
._1819:\n\
	str	r0, [r1]\n\
	mov	r0, #0x1\n\
	b	._1823\n\
._1825:\n\
	.align	2, 0\n\
._1824:\n\
	.word	gBattleCommunication\n\
	.word	gBattlescriptCurrInstr\n\
	.word	BattleScript_MoveUsedLoafingAround\n\
._1822:\n\
	ldr	r4, ._1826\n\
	ldrb	r1, [r4]\n\
	mov	r0, #0x58\n\
	mul	r1, r1, r0\n\
	ldr	r0, ._1826 + 4\n\
	add	r1, r1, r0\n\
	mov	r0, #0x28\n\
	str	r0, [sp]\n\
	mov	r0, #0x0\n\
	str	r0, [sp, #0x4]\n\
	ldrb	r0, [r4]\n\
	str	r0, [sp, #0x8]\n\
	ldrb	r0, [r4]\n\
	str	r0, [sp, #0xc]\n\
	add	r0, r1, #0\n\
	mov	r2, #0x1\n\
	mov	r3, #0x0\n\
	bl	CalculateBaseDamage\n\
	ldr	r1, ._1826 + 8\n\
	str	r0, [r1]\n\
	ldr	r1, ._1826 + 12\n\
	ldrb	r0, [r4]\n\
	strb	r0, [r1]\n\
	ldr	r1, ._1826 + 16\n\
	ldr	r0, ._1826 + 20\n\
	str	r0, [r1]\n\
	ldr	r2, ._1826 + 24\n\
	ldr	r0, [r2]\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0xc\n\
._1807:\n\
	orr	r0, r0, r1\n\
	str	r0, [r2]\n\
	mov	r0, #0x2\n\
._1823:\n\
	add	sp, sp, #0x10\n\
	pop	{r3, r4}\n\
	mov	r8, r3\n\
	mov	r9, r4\n\
	pop	{r4, r5, r6, r7}\n\
	pop	{r1}\n\
	bx	r1\n\
._1827:\n\
	.align	2, 0\n\
._1826:\n\
	.word	gBankAttacker\n\
	.word	gBattleMons\n\
	.word	gBattleMoveDamage\n\
	.word	gBankTarget\n\
	.word	gBattlescriptCurrInstr\n\
	.word	gUnknown_081D99A0\n\
	.word	gHitMarker");
}
#else
u8 IsMonDisobedient(void)
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
            gBattleStruct->dynamicMoveType = 0;
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
#endif
