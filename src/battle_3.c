#include "global.h"
#include "abilities.h"
#include "battle.h"
#include "moves.h"
#include "item.h"
#include "items.h"
#include "hold_effects.h"
#include "species.h"
#include "pokemon.h"
#include "data2.h"
#include "rng.h"
#include "text.h"
#include "battle_move_effects.h"

extern u8* gBattlescriptCurrInstr;
extern u8 gActiveBank;
extern u8 gBattleBufferB[4][0x200];
extern u8* gUnknown_02024C1C[4]; //battlescript location when you try to use a move you're not allowed to
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

u8 IsImprisoned(u8 bank, u16 move);
u8 GetBankByPlayerAI(u8 ID);
u8 GetBankIdentity(u8 bank);
u8 GetBankSide(u8 bank);
void b_call_bc_move_exec(u8* BS_ptr);
bool8 sub_8015660(u8 bank); //check if a move failed
void SetMoveEffect(bool8 primary, u8 certainArg);
bool8 sub_8025A44(u8 bank); //uproar wakeup check
bool8 sub_8018018(u8 bank, u8, u8);
void sub_8015740(u8 bank);
s32 CalculateBaseDamage(struct BattlePokemon *attacker, struct BattlePokemon *defender, u32 move, u16 a4, u16 powerOverride, u8 typeOverride, u8 bank_atk, u8 bank_def);
u8 CountTrailingZeroBits(u32 a);
u8 sub_801B5C0(u16 move, u8 targetbyte); //get target of move

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

extern u8 gUnknown_081D9030[];
extern u8 gUnknown_081D8F62[];
extern u8 gUnknown_081D8FFF[];
extern u8 gUnknown_081D8F7D[];
extern u8 gUnknown_081D9016[];
extern u8 gUnknown_081D9008[];
extern u8 gUnknown_081D9041[];
extern u8 gUnknown_081D950F[]; //uproar wakeup BS
extern u8 gUnknown_081D957E[]; //uproar BS
extern u8 gUnknown_081D9587[]; //thrash confusion BS
extern u8 gUnknown_081D964C[]; //yawn sleep BS
extern u8 gUnknown_081D92D7[]; //future sight hit
extern u8 gUnknown_081D9202[]; //perish song hit
extern u8 gUnknown_081D921D[]; //perish song timer goes down
extern u8 gUnknown_081D8C72[];
extern u8 gUnknown_081D8C7B[];
extern u8 gUnknown_081D94FB[]; //uproar wakes you up when trying to use a move
extern u8 gUnknown_081D94EE[]; //poke is asleep
extern u8 gUnknown_081D94FB[]; //poke woke up
extern u8 gUnknown_081D9545[]; //poke is frozen
extern u8 gUnknown_081D9552[]; //poke is no longer frozen
extern u8 gUnknown_081D9977[]; //poke is loafing around
extern u8 gUnknown_081D7956[]; //poke must recharge
extern u8 gUnknown_081D9573[]; //poke flinched
extern u8 gUnknown_081D9139[]; //poke tries to use a disabled move
extern u8 gUnknown_081D938F[]; //taunt prevents from using the chosen move
extern u8 gUnknown_081D9459[]; //using imprisoned move
extern u8 gUnknown_081D9595[]; //poke is confused
extern u8 gUnknown_081D95D4[]; //poke is confused no more
extern u8 gUnknown_081D9566[]; //poke is paralyzed
extern u8 gUnknown_081D9608[]; //poke is infatuated, won't attack
extern u8 gUnknown_081D95FB[]; //poke is infatuated
extern u8 gUnknown_081D90A7[]; //bide storing energy
extern u8 gUnknown_081D90B2[]; //bide attack
extern u8 gUnknown_081D90F1[]; //bide no energy to attack

#define CHOICED_MOVE(bank)(((u16*)(&ewram[bank * 2 + 0x160e8])))

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
            gBattleBufferB[gActiveBank][3] = GetBankByPlayerAI((GetBankIdentity(gActiveBank) ^ 1) | (Random() & 2));
        else
            gBattleBufferB[gActiveBank][3] = GetBankByPlayerAI(GetBankIdentity(gActiveBank) ^ 1);
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
                    if (b_first_side(gTurnOrder[i], gTurnOrder[j], 0))
                        sub_8012FBC(i, j);
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
                    if (--gSideTimer[sideBank].reflectTimer == 0)
                    {

                        gSideAffecting[sideBank] &= ~SIDE_STATUS_REFLECT;
                        b_call_bc_move_exec(gUnknown_081D9030);
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
                    if (--gSideTimer[sideBank].lightscreenTimer == 0)
                    {
                        gSideAffecting[sideBank] &= ~SIDE_STATUS_LIGHTSCREEN;
                        b_call_bc_move_exec(gUnknown_081D9030);
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
                if (gSideTimer[sideBank].mistTimer && --gSideTimer[sideBank].mistTimer == 0)
                {
                    gSideAffecting[sideBank] &= ~SIDE_STATUS_MIST;
                    b_call_bc_move_exec(gUnknown_081D9030);
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
                    if (--gSideTimer[sideBank].safeguardTimer == 0)
                    {
                        gSideAffecting[sideBank] &= ~SIDE_STATUS_SAFEGUARD;
                        b_call_bc_move_exec(gUnknown_081D9041);
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
                b_call_bc_move_exec(gUnknown_081D8F62);
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
                    gBattlescriptCurrInstr = gUnknown_081D8FFF;
                }
                else
                    gBattlescriptCurrInstr = gUnknown_081D8F7D;

                BATTLE_STRUCT->animArg1 = 0xC;
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
                    gBattlescriptCurrInstr = gUnknown_081D9016;
                }
                else
                    gBattlescriptCurrInstr = gUnknown_081D9008;

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
                    gBattlescriptCurrInstr = gUnknown_081D8FFF;
                }
                else
                    gBattlescriptCurrInstr = gUnknown_081D8F7D;

                BATTLE_STRUCT->animArg1 = 0xD;
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
                        BATTLE_STRUCT->animArg1 = ewram[gActiveBank * 2 + 0x16004];
                        BATTLE_STRUCT->animArg2 = ewram[gActiveBank * 2 + 0x16005];
                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 2;
                        gBattleTextBuff1[2] = ewram[gActiveBank * 2 + 0x16004];
                        gBattleTextBuff1[3] = ewram[gActiveBank * 2 + 0x16005];
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
                        gBattleTextBuff1[2] = ewram[gActiveBank * 2 + 0x16004];
                        gBattleTextBuff1[3] = ewram[gActiveBank * 2 + 0x16005];
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
                            b_call_bc_move_exec(gUnknown_081D950F);
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
                        b_call_bc_move_exec(gUnknown_081D957E);
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
                                b_call_bc_move_exec(gUnknown_081D9587);
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
                     && gBattleMons[gActiveBank].ability != ABILITY_INSOMNIA && !sub_8025A44(gActiveBank))
                    {
                        CancelMultiTurnMoves(gActiveBank);
                        gBattleMons[gActiveBank].status1 |= (Random() & 3) + 2;
                        EmitSetAttributes(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
                        MarkBufferBankForExecution(gActiveBank);
                        gEffectBank = gActiveBank;
                        b_call_bc_move_exec(gUnknown_081D964C);
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
                    b_call_bc_move_exec(gUnknown_081D92D7);
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
                        gBattlescriptCurrInstr = gUnknown_081D9202;
                    }
                    else
                    {
                        gDisableStructs[gActiveBank].perishSong1--;
                        gBattlescriptCurrInstr = gUnknown_081D921D;
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
                    b_call_bc_move_exec(gUnknown_081D8C72);
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
                    b_call_bc_move_exec(gUnknown_081D8C7B);
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
/*
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
                if (sub_8025A44(gBankAttacker))
                {
                    gBattleMons[gBankAttacker].status1 &= ~(STATUS_SLEEP);
                    gBattleMons[gBankAttacker].status2 &= ~(STATUS2_NIGHTMARE);
                    b_movescr_stack_push_cursor();
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    gBattlescriptCurrInstr = gUnknown_081D94FB;
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
                            gBattlescriptCurrInstr = gUnknown_081D94EE;
                            gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                            effect = 2;
                        }
                    }
                    else
                    {
                        gBattleMons[gBankAttacker].status2 &= ~(STATUS2_NIGHTMARE);
                        b_movescr_stack_push_cursor();
                        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                        gBattlescriptCurrInstr = gUnknown_081D94FB;
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
                        gBattlescriptCurrInstr = gUnknown_081D9545;
                        gHitMarker |= HITMARKER_NO_ATTACKSTRING;
                        effect = 2;
                    }
                }
                else // unfreeze
                {
                    gBattleMons[gBankAttacker].status1 &= ~(STATUS_FREEZE);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = gUnknown_081D9552;
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                    effect = 2;
                }
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 3: // truant
            if (gBattleMons[gBankAttacker].ability == ABILITY_TRUANT && gDisableStructs[gBankAttacker].truantCounter)
            {
                CancelMultiTurnMoves(gBankAttacker);
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                gBattlescriptCurrInstr = gUnknown_081D9977;
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
                gBattlescriptCurrInstr = gUnknown_081D7956;
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
                gBattlescriptCurrInstr = gUnknown_081D9573;
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
                gBattlescriptCurrInstr = gUnknown_081D9139;
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
                gBattlescriptCurrInstr = gUnknown_081D938F;
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
                gBattlescriptCurrInstr = gUnknown_081D9459;
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
                    gBattlescriptCurrInstr = gUnknown_081D9595;
                }
                else // snapped out of confusion
                {
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = gUnknown_081D95D4;
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
                gBattlescriptCurrInstr = gUnknown_081D9566;
                gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 11: // infatuation
            if (gBattleMons[gBankAttacker].status2 & STATUS2_INFATUATION)
            {
                BATTLE_STRUCT->scriptingActive = CountTrailingZeroBits(gBattleMons[gBankAttacker].status2 >> 0x10);
                if (Random() & 1)
                    b_movescr_stack_push_cursor();
                else
                {
                    b_movescr_stack_push(gUnknown_081D9608);
                    gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
                    gProtectStructs[gBankAttacker].loveImmobility = 1;
                    CancelMultiTurnMoves(gBankAttacker);
                }
                gBattlescriptCurrInstr = gUnknown_081D95FB;
                effect = 1;
            }
            BATTLE_STRUCT->atkCancellerTracker++;
            break;
        case 12: // bide
            if (gBattleMons[gBankAttacker].status2 & STATUS2_BIDE)
            {
                gBattleMons[gBankAttacker].status2 -= 0x100;
                if (gBattleMons[gBankAttacker].status2 & STATUS2_BIDE)
                    gBattlescriptCurrInstr = gUnknown_081D90A7;
                else
                {
                    gBattleMons[gBankAttacker].status2 &= ~(STATUS2_BIDE);
                    if (gTakenDmg[gBankAttacker])
                    {
                        gCurrentMove = MOVE_BIDE;
                        *bideDmg = gTakenDmg[gBankAttacker] * 2;
                        gBankTarget = gTakenDmgBanks[gBankAttacker];
                        if (gAbsentBankFlags & gBitTable[gBankTarget])
                            gBankTarget = sub_801B5C0(MOVE_BIDE, 1);
                        gBattlescriptCurrInstr = gUnknown_081D90B2;
                    }
                    else
                        gBattlescriptCurrInstr = gUnknown_081D90F1;
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
                    gBattlescriptCurrInstr = gUnknown_081D9552;
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

*/
