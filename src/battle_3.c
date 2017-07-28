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
#include "string_util.h"

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
extern u8 gFightStateTracker;
extern struct BattleEnigmaBerry gEnigmaBerries[4];

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
u8 sub_803FC34(u8 bank);
u16 sub_803FBFC(u8 a);
u8 weather_get_current(void);
void b_push_move_exec(u8* BS_ptr);
void RecordAbilityBattle(u8 bank, u8 ability);
void RecordItemBattle(u8 bank, u8 holdEffect);
void sub_8013F54(void);
void sub_8013FBC(void);

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
                    gBattlescriptCurrInstr = gUnknown_081D9552;
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
                BATTLE_STRUCT->scriptingActive = CountTrailingZeroBits((gBattleMons[gBankAttacker].status2 & STATUS2_INFATUATION) >> 0x10);
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
                    gBattleMons[gBankAttacker].status2 &= ~(STATUS2_MULTIPLETURNS);
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
            r7 = GetBankByPlayerAI(1);
            r6 = GetBankByPlayerAI(3);
            party = gEnemyParty;
        }
        else
        {
            r7 = GetBankByPlayerAI(0);
            r6 = GetBankByPlayerAI(2);
            party = gPlayerParty;
        }
        if (r1 == 6)
            r1 = gBattlePartyID[r7];
        if (r2 == 6)
            r2 = gBattlePartyID[r6];
        for (i = 0; i < 6; i++)
        {
            if (GetMonData(&party[i], MON_DATA_HP) && GetMonData(&party[i], MON_DATA_SPECIES2) && GetMonData(&party[i], MON_DATA_SPECIES2) != SPECIES_EGG && i != r1 && i != r2 && i != ewram[r7 + 0x16068] && i != ewram[r6 + 0x16068])
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

extern const u8 gStatusConditionString_PoisonJpn[];
extern const u8 gStatusConditionString_SleepJpn[];
extern const u8 gStatusConditionString_ParalysisJpn[];
extern const u8 gStatusConditionString_BurnJpn[];
extern const u8 gStatusConditionString_IceJpn[];
extern const u8 gStatusConditionString_ConfusionJpn[];
extern const u8 gStatusConditionString_LoveJpn[];

extern const u16 gUnknown_081FA724[]; //sound moves table

extern u8 gUnknown_081D901D[]; //load weather from overworld
extern u8 gUnknown_081D9704[]; //Drizzle activates
extern u8 gUnknown_081D9744[]; //Sandstream activates
extern u8 gUnknown_081D97FE[]; //Drought activates
extern u8 gUnknown_081D977D[]; //castform change
extern u8 gUnknown_081D9730[]; //rain dish hp heal
extern u8 gUnknown_081D9758[]; //shed skin status heal
extern u8 gUnknown_081D9718[]; //speed boost bs
extern u8 gUnknown_081D98F3[]; //soundproof protection
extern u8 gUnknown_081D9843[]; //volt/water absorb no pp loss
extern u8 gUnknown_081D9842[]; //volt/water absorb pp loss
extern u8 gUnknown_081D987C[]; //flash fire boost no pp loss
extern u8 gUnknown_081D987B[]; //flash fire boost pp loss
extern u8 gUnknown_081D9866[]; //volt/water absorb no pp loss full hp
extern u8 gUnknown_081D9865[]; //volt/water absorb pp loss full hp
extern u8 gUnknown_081D9921[]; //color change type change
extern u8 gUnknown_081D9928[]; //rough skin damage
extern u8 gUnknown_081D9950[]; //secondary effect applier
extern u8 gUnknown_081D9943[]; //cute charm activates
extern u8 gUnknown_081D9956[]; //ability status clear
extern u8 gUnknown_081D9953[]; //synchronize effect
extern u8 gUnknown_081D978C[]; //intimidate1
extern u8 gUnknown_081D9795[]; //intimidate2
extern u8 gUnknown_081D9726[]; //trace effect

extern u8 gUnknown_081D9A5E[]; //white herb end2
extern u8 gUnknown_081D9A64[]; //white herb return
extern u8 gUnknown_081D9A74[]; //item hp heal end2
extern u8 gUnknown_081D9A91[]; //berry pp heal end2
extern u8 gUnknown_081D9AA1[]; //leftovers heal end2
extern u8 gUnknown_081D9AD4[]; //berry heal/confuse end2
extern u8 gUnknown_081D9AFE[]; //berry stat raise end2
extern u8 gUnknown_081D9B19[]; //berry focus energy end2
extern u8 gUnknown_081D99B6[]; //berry cure par end2
extern u8 gUnknown_081D99CE[]; //berry cure psn end2
extern u8 gUnknown_081D99E6[]; //berry cure brn end2
extern u8 gUnknown_081D99FE[]; //berry cure frz end2
extern u8 gUnknown_081D9A16[]; //berry cure slp end2
extern u8 gUnknown_081D9A2E[]; //berry cure confusion end2
extern u8 gUnknown_081D9A44[]; //berry cure any status end2
extern u8 gUnknown_081D99BC[]; //berry cure par return
extern u8 gUnknown_081D99D4[]; //berry cure psn return
extern u8 gUnknown_081D99EC[]; //berry cure brn return
extern u8 gUnknown_081D9A04[]; //berry cure frz return
extern u8 gUnknown_081D9A1C[]; //berry cure slp return
extern u8 gUnknown_081D9A34[]; //berry cure confusion return
extern u8 gUnknown_081D9A4A[]; //berry cure any status return

extern u8 gUnknown_081D9AA7[]; //shell bell hp heal

#ifdef NONMATCHING

struct Struct2017100
{
    u32 arr[4];
};

#define ewram17100 (*(struct Struct2017100 *)(ewram + 0x17100))

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
        //_08018436
        int i;  // r4
        u16 move;
        // Hmm...
        #define moveType moveArg
        //u16 moveType;
        u8 side;

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
                case 3:
                case 5:
                case 13:
                    if (!(gBattleWeather & WEATHER_RAIN_ANY))
                    {
                        gBattleWeather = (WEATHER_RAIN_TEMPORARY | WEATHER_RAIN_PERMANENT);
                        BATTLE_STRUCT->animArg1 = 0xA;
                        BATTLE_STRUCT->scriptingActive = bank;
                        effect++;
                    }
                    break;
                case 8:
                    if (!(gBattleWeather & WEATHER_SANDSTORM_ANY))
                    {
                        gBattleWeather = (WEATHER_SANDSTORM_PERMANENT | WEATHER_SANDSTORM_TEMPORARY);
                        BATTLE_STRUCT->animArg1 = 0xC;
                        BATTLE_STRUCT->scriptingActive = bank;
                        effect++;
                    }
                    break;
                case 12:
                    if (!(gBattleWeather & WEATHER_SUN_ANY))
                    {
                        gBattleWeather = (WEATHER_SUN_PERMANENT | WEATHER_SUN_TEMPORARY);
                        BATTLE_STRUCT->animArg1 = 0xB;
                        BATTLE_STRUCT->scriptingActive = bank;
                        effect++;
                    }
                    break;
				}
				if (effect)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = weather_get_current();
                    b_push_move_exec(gUnknown_081D901D);
                }
				break;
			case ABILITY_DRIZZLE:
            //_08018680
			    if (!(gBattleWeather & WEATHER_RAIN_PERMANENT))
                {
                    gBattleWeather = (WEATHER_RAIN_PERMANENT | WEATHER_RAIN_TEMPORARY);
                    b_push_move_exec(gUnknown_081D9704);
                    BATTLE_STRUCT->scriptingActive = bank;
                    effect++;
                }
				break;
			case ABILITY_SAND_STREAM:
            //_080186B8
			    if (!(gBattleWeather & WEATHER_SANDSTORM_PERMANENT))
                {
                    gBattleWeather = (WEATHER_SANDSTORM_PERMANENT | WEATHER_SANDSTORM_TEMPORARY);
                    b_push_move_exec(gUnknown_081D9744);
                    BATTLE_STRUCT->scriptingActive = bank;
                    effect++;
                }
				break;
			case ABILITY_DROUGHT:
            //_080186F0
                if (!(gBattleWeather & WEATHER_SUN_PERMANENT))
                {
                    gBattleWeather = (WEATHER_SUN_PERMANENT | WEATHER_SUN_TEMPORARY);
                    b_push_move_exec(gUnknown_081D97FE);
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
                    b_push_move_exec(gUnknown_081D977D);
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
			        u8 i;

			        for (i = 0; i < gNoOfAllBanks; i++)
                    {
                        // TODO: i should be in r6 here
                        //asm("":::"r4","r5");
                        effect = CastformDataTypeChange(i);
                        if (effect != 0)
                        {
                            b_push_move_exec(gUnknown_081D977D);
                            BATTLE_STRUCT->scriptingActive = i;
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
                        gLastUsedAbility = ABILITY_RAIN_DISH; //why
                        b_push_move_exec(gUnknown_081D9730);
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
                        //gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE); fixed in Emerald
                        BATTLE_STRUCT->scriptingActive = gActiveBank = bank;
                        b_push_move_exec(gUnknown_081D9758);
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
                        b_push_move_exec(gUnknown_081D9718);
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
                for (i = 0; gUnknown_081FA724[i] != 0xFFFF; i++)
                {
                    if (gUnknown_081FA724[i] == move)
                        break;
                }
                if (gUnknown_081FA724[i] != 0xFFFF)
                {
                    if (gBattleMons[gBankAttacker].status2 & STATUS2_MULTIPLETURNS)
                        gHitMarker |= HITMARKER_NO_PPDEDUCT;
                    gBattlescriptCurrInstr = gUnknown_081D98F3;
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
                            gBattlescriptCurrInstr = gUnknown_081D9843;
                        else
                            gBattlescriptCurrInstr = gUnknown_081D9842;
                        effect = 1;
                    }
                    break;
                case ABILITY_WATER_ABSORB:
                    if (moveType == TYPE_WATER && gBattleMoves[move].power != 0)
                    {
                        if (gProtectStructs[gBankAttacker].notFirstStrike)
                            gBattlescriptCurrInstr = gUnknown_081D9843;
                        else
                            gBattlescriptCurrInstr = gUnknown_081D9842;
                        effect = 1;
                    }
                    break;
                case ABILITY_FLASH_FIRE:
                    if (moveType == TYPE_FIRE && !(gBattleMons[bank].status1 & STATUS_FREEZE))
                    {
                        if (!(ewram17100.arr[bank] & 1))
                        {
                            gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                            if (gProtectStructs[gBankAttacker].notFirstStrike)
                                gBattlescriptCurrInstr = gUnknown_081D987C;
                            else
                                gBattlescriptCurrInstr = gUnknown_081D987B;
                            ewram17100.arr[bank] |= 1;
                            effect = 2;
                        }
                        else
                        {
                            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                            if (gProtectStructs[gBankAttacker].notFirstStrike)
                                gBattlescriptCurrInstr = gUnknown_081D987C;
                            else
                                gBattlescriptCurrInstr = gUnknown_081D987B;
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
                            gBattlescriptCurrInstr = gUnknown_081D9843;
                        else
                            gBattlescriptCurrInstr = gUnknown_081D9842;
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
                    gBattlescriptCurrInstr = gUnknown_081D9921;
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
                    gBattlescriptCurrInstr = gUnknown_081D9928;
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
                    gBattlescriptCurrInstr = gUnknown_081D9950;
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
                    gBattlescriptCurrInstr = gUnknown_081D9950;
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
                    gBattlescriptCurrInstr = gUnknown_081D9950;
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
                    gBattlescriptCurrInstr = gUnknown_081D9950;
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
                    gBattlescriptCurrInstr = gUnknown_081D9943;
                    effect++;
                }
                break;
            }
            break;
        case ABILITYEFFECT_IMMUNITY: // 5
        //_08019448
            {
            #define i bank
                for (i = 0; i < gNoOfAllBanks; i++)
                {
                    switch (gBattleMons[i].ability)
                    {
                    case ABILITY_IMMUNITY:
                        if (gBattleMons[i].status1 & (STATUS_POISON | STATUS_TOXIC_POISON | 0xF00))  // TODO: what is 0xF00?
                        {
                            StringCopy(gBattleTextBuff1, gStatusConditionString_PoisonJpn);
                            effect = 1;
                        }
                        break;
                    case ABILITY_OWN_TEMPO:
                        if (gBattleMons[i].status2 & STATUS2_CONFUSION)
                        {
                            StringCopy(gBattleTextBuff1, gStatusConditionString_ConfusionJpn);
                            effect = 2;
                        }
                        break;
                    case ABILITY_LIMBER:
                        if (gBattleMons[i].status1 & STATUS_PARALYSIS)
                        {
                            StringCopy(gBattleTextBuff1, gStatusConditionString_ParalysisJpn);
                            effect = 1;
                        }
                        break;
                    case ABILITY_INSOMNIA:
                    case ABILITY_VITAL_SPIRIT:
                        if (gBattleMons[i].status1 & STATUS_SLEEP)
                        {
                            gBattleMons[i].status2 &= ~(STATUS2_NIGHTMARE);
                            StringCopy(gBattleTextBuff1, gStatusConditionString_SleepJpn);
                            effect = 1;
                        }
                        break;
                    case ABILITY_WATER_VEIL:
                        if (gBattleMons[i].status1 & STATUS_BURN)
                        {
                            StringCopy(gBattleTextBuff1, gStatusConditionString_BurnJpn);
                            effect = 1;
                        }
                        break;
                    case ABILITY_MAGMA_ARMOR:
                        if (gBattleMons[i].status1 & STATUS_FREEZE)
                        {
                            StringCopy(gBattleTextBuff1, gStatusConditionString_IceJpn);
                            effect = 1;
                        }
                        break;
                    case ABILITY_OBLIVIOUS:
                        if (gBattleMons[i].status2 & STATUS2_INFATUATION)
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
                            gBattleMons[i].status1 = 0;
                            break;
                        case 2: // get rid of confusion
                            gBattleMons[i].status2 &= ~(STATUS2_CONFUSION);
                            break;
                        case 3: // get rid of infatuation
                            gBattleMons[i].status2 &= ~(STATUS2_INFATUATION);
                            break;
                        }
                        b_movescr_stack_push_cursor();
                        gBattlescriptCurrInstr = gUnknown_081D9956;
                        BATTLE_STRUCT->scriptingActive = i;
                        gActiveBank = i;
                        EmitSetAttributes(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBank].status1);
                        MarkBufferBankForExecution(gActiveBank);
                        return effect;
                    }
                }
            #undef i
            }
            break;
        case ABILITYEFFECT_FORECAST: // 6
        //_080197B4
            {
            #define i bank
                for (i = 0; i < gNoOfAllBanks; i++)
                {
                    if (gBattleMons[i].ability == ABILITY_FORECAST)
                    {
                        effect = CastformDataTypeChange(i);
                        if (effect)
                        {
                            b_push_move_exec(gUnknown_081D977D);
                            BATTLE_STRUCT->scriptingActive = i;
                            BATTLE_STRUCT->castformToChangeInto = effect - 1;
                            return effect;
                        }
                    }
                }
            #undef i
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
                gBattlescriptCurrInstr = gUnknown_081D9953;
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
                gBattlescriptCurrInstr = gUnknown_081D9953;
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
                    u8 opposite = (GetBankIdentity(i) ^ 1) & 1;
                    u8 target1 = GetBankByPlayerAI(opposite);
                    u8 target2 = GetBankByPlayerAI(opposite + 2);
                    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                    {
                        if (gBattleMons[target1].ability != 0 && gBattleMons[target1].hp != 0
                         && gBattleMons[target2].ability != 0 && gBattleMons[target2].hp != 0)
                        {
                            //_080199AE
                            gActiveBank = GetBankByPlayerAI(((Random() & 1) * 2) | opposite);
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
                        b_push_move_exec(gUnknown_081D9726);
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

#else
__attribute__((naked))
u8 AbilityBattleEffects(u8 caseID, u8 bank, u8 ability, u8 special, u16 moveArg)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x28\n\
	ldr r4, [sp, 0x48]\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	str r0, [sp, 0x4]\n\
	lsls r1, 24\n\
	lsrs r1, 24\n\
	mov r10, r1\n\
	lsls r2, 24\n\
	lsrs r6, r2, 24\n\
	lsls r3, 24\n\
	lsrs r3, 24\n\
	mov r8, r3\n\
	lsls r4, 16\n\
	lsrs r4, 16\n\
	movs r0, 0\n\
	mov r9, r0\n\
	ldr r5, _08018380 @ =gBankAttacker\n\
	ldr r1, _08018384 @ =gNoOfAllBanks\n\
	ldrb r0, [r5]\n\
	ldrb r1, [r1]\n\
	cmp r0, r1\n\
	bcc _08018360\n\
	mov r1, r10\n\
	strb r1, [r5]\n\
_08018360:\n\
	ldrb r0, [r5]\n\
	bl GetBankSide\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _08018390\n\
	ldr r1, _08018388 @ =gBattlePartyID\n\
	ldrb r0, [r5]\n\
	lsls r0, 1\n\
	adds r0, r1\n\
	ldrh r1, [r0]\n\
	movs r0, 0x64\n\
	muls r1, r0\n\
	ldr r0, _0801838C @ =gPlayerParty\n\
	b _080183A0\n\
	.align 2, 0\n\
_08018380: .4byte gBankAttacker\n\
_08018384: .4byte gNoOfAllBanks\n\
_08018388: .4byte gBattlePartyID\n\
_0801838C: .4byte gPlayerParty\n\
_08018390:\n\
	ldr r1, _080183D0 @ =gBattlePartyID\n\
	ldrb r0, [r5]\n\
	lsls r0, 1\n\
	adds r0, r1\n\
	ldrh r1, [r0]\n\
	movs r0, 0x64\n\
	muls r1, r0\n\
	ldr r0, _080183D4 @ =gEnemyParty\n\
_080183A0:\n\
	adds r7, r1, r0\n\
	ldr r5, _080183D8 @ =gBankTarget\n\
	ldr r1, _080183DC @ =gNoOfAllBanks\n\
	ldrb r0, [r5]\n\
	ldrb r1, [r1]\n\
	cmp r0, r1\n\
	bcc _080183B2\n\
	mov r2, r10\n\
	strb r2, [r5]\n\
_080183B2:\n\
	ldrb r0, [r5]\n\
	bl GetBankSide\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080183E4\n\
	ldr r1, _080183D0 @ =gBattlePartyID\n\
	ldrb r0, [r5]\n\
	lsls r0, 1\n\
	adds r0, r1\n\
	ldrh r1, [r0]\n\
	movs r0, 0x64\n\
	muls r1, r0\n\
	ldr r0, _080183E0 @ =gPlayerParty\n\
	b _080183F4\n\
	.align 2, 0\n\
_080183D0: .4byte gBattlePartyID\n\
_080183D4: .4byte gEnemyParty\n\
_080183D8: .4byte gBankTarget\n\
_080183DC: .4byte gNoOfAllBanks\n\
_080183E0: .4byte gPlayerParty\n\
_080183E4:\n\
	ldr r1, _08018444 @ =gBattlePartyID\n\
	ldrb r0, [r5]\n\
	lsls r0, 1\n\
	adds r0, r1\n\
	ldrh r1, [r0]\n\
	movs r0, 0x64\n\
	muls r1, r0\n\
	ldr r0, _08018448 @ =gEnemyParty\n\
_080183F4:\n\
	adds r5, r1, r0\n\
	adds r0, r7, 0\n\
	movs r1, 0xB\n\
	bl GetMonData\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	str r0, [sp, 0x8]\n\
	adds r0, r7, 0\n\
	movs r1, 0\n\
	bl GetMonData\n\
	str r0, [sp, 0x10]\n\
	adds r0, r5, 0\n\
	movs r1, 0xB\n\
	bl GetMonData\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	str r0, [sp, 0xC]\n\
	adds r0, r5, 0\n\
	movs r1, 0\n\
	bl GetMonData\n\
	str r0, [sp, 0x14]\n\
	ldr r0, _0801844C @ =gBattleTypeFlags\n\
	ldrh r1, [r0]\n\
	movs r0, 0x80\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08018436\n\
	bl _08019F92\n\
_08018436:\n\
	mov r3, r8\n\
	cmp r3, 0\n\
	beq _08018454\n\
	ldr r0, _08018450 @ =gLastUsedAbility\n\
	strb r3, [r0]\n\
	mov r8, r0\n\
	b _0801846A\n\
	.align 2, 0\n\
_08018444: .4byte gBattlePartyID\n\
_08018448: .4byte gEnemyParty\n\
_0801844C: .4byte gBattleTypeFlags\n\
_08018450: .4byte gLastUsedAbility\n\
_08018454:\n\
	ldr r2, _08018474 @ =gLastUsedAbility\n\
	ldr r1, _08018478 @ =gBattleMons\n\
	movs r0, 0x58\n\
	mov r5, r10\n\
	muls r5, r0\n\
	adds r0, r5, 0\n\
	adds r0, r1\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	strb r0, [r2]\n\
	mov r8, r2\n\
_0801846A:\n\
	cmp r4, 0\n\
	beq _0801847C\n\
	adds r3, r4, 0\n\
	b _08018480\n\
	.align 2, 0\n\
_08018474: .4byte gLastUsedAbility\n\
_08018478: .4byte gBattleMons\n\
_0801847C:\n\
	ldr r0, _08018494 @ =gCurrentMove\n\
	ldrh r3, [r0]\n\
_08018480:\n\
	ldr r1, _08018498 @ =0x02000000\n\
	ldr r2, _0801849C @ =0x0001601c\n\
	adds r0, r1, r2\n\
	ldrb r0, [r0]\n\
	adds r7, r1, 0\n\
	cmp r0, 0\n\
	beq _080184A0\n\
	movs r4, 0x3F\n\
	ands r4, r0\n\
	b _080184AC\n\
	.align 2, 0\n\
_08018494: .4byte gCurrentMove\n\
_08018498: .4byte 0x02000000\n\
_0801849C: .4byte 0x0001601c\n\
_080184A0:\n\
	ldr r1, _080184C0 @ =gBattleMoves\n\
	lsls r0, r3, 1\n\
	adds r0, r3\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	ldrb r4, [r0, 0x2]\n\
_080184AC:\n\
	ldr r5, [sp, 0x4]\n\
	cmp r5, 0x13\n\
	bls _080184B6\n\
	bl _08019F76\n\
_080184B6:\n\
	lsls r0, r5, 2\n\
	ldr r1, _080184C4 @ =_080184C8\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	mov pc, r0\n\
	.align 2, 0\n\
_080184C0: .4byte gBattleMoves\n\
_080184C4: .4byte _080184C8\n\
	.align 2, 0\n\
_080184C8:\n\
	.4byte _08018518\n\
	.4byte _08018814\n\
	.4byte _08018A40\n\
	.4byte _08018AD8\n\
	.4byte _08018CF0\n\
	.4byte _08019448\n\
	.4byte _080197B4\n\
	.4byte _08019804\n\
	.4byte _08019880\n\
	.4byte _080198FC\n\
	.4byte _08019B1C\n\
	.4byte _08019940\n\
	.4byte _08019B60\n\
	.4byte _08019BBC\n\
	.4byte _08019C18\n\
	.4byte _08019D18\n\
	.4byte _08019D5C\n\
	.4byte _08019DB8\n\
	.4byte _08019F44\n\
	.4byte _08019CD4\n\
_08018518:\n\
	ldr r2, _0801854C @ =gBankAttacker\n\
	ldr r0, _08018550 @ =gNoOfAllBanks\n\
	ldrb r1, [r2]\n\
	adds r5, r0, 0\n\
	ldrb r0, [r5]\n\
	cmp r1, r0\n\
	bcc _0801852A\n\
	mov r1, r10\n\
	strb r1, [r2]\n\
_0801852A:\n\
	mov r2, r8\n\
	ldrb r0, [r2]\n\
	cmp r0, 0x2D\n\
	bne _08018534\n\
	b _080186B8\n\
_08018534:\n\
	cmp r0, 0x2D\n\
	bgt _08018564\n\
	cmp r0, 0xD\n\
	bne _0801853E\n\
	b _080187DC\n\
_0801853E:\n\
	cmp r0, 0xD\n\
	bgt _08018554\n\
	cmp r0, 0x2\n\
	bne _08018548\n\
	b _08018680\n\
_08018548:\n\
	bl _08019F76\n\
	.align 2, 0\n\
_0801854C: .4byte gBankAttacker\n\
_08018550: .4byte gNoOfAllBanks\n\
_08018554:\n\
	cmp r0, 0x16\n\
	bne _0801855A\n\
	b _08018728\n\
_0801855A:\n\
	cmp r0, 0x24\n\
	bne _08018560\n\
	b _080187A0\n\
_08018560:\n\
	bl _08019F76\n\
_08018564:\n\
	cmp r0, 0x46\n\
	bne _0801856A\n\
	b _080186F0\n\
_0801856A:\n\
	cmp r0, 0x46\n\
	bgt _08018578\n\
	cmp r0, 0x3B\n\
	bne _08018574\n\
	b _0801875C\n\
_08018574:\n\
	bl _08019F76\n\
_08018578:\n\
	cmp r0, 0x4D\n\
	bne _0801857E\n\
	b _080187DC\n\
_0801857E:\n\
	cmp r0, 0xFF\n\
	beq _08018586\n\
	bl _08019F76\n\
_08018586:\n\
	bl weather_get_current\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	subs r0, 0x3\n\
	cmp r0, 0xA\n\
	bhi _0801864C\n\
	lsls r0, 2\n\
	ldr r1, _080185A0 @ =_080185A4\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	mov pc, r0\n\
	.align 2, 0\n\
_080185A0: .4byte _080185A4\n\
	.align 2, 0\n\
_080185A4:\n\
	.4byte _080185D0\n\
	.4byte _0801864C\n\
	.4byte _080185D0\n\
	.4byte _0801864C\n\
	.4byte _0801864C\n\
	.4byte _080185F8\n\
	.4byte _0801864C\n\
	.4byte _0801864C\n\
	.4byte _0801864C\n\
	.4byte _08018620\n\
	.4byte _080185D0\n\
_080185D0:\n\
	ldr r2, _080185EC @ =gBattleWeather\n\
	ldrh r1, [r2]\n\
	movs r0, 0x7\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _0801864C\n\
	movs r0, 0x5\n\
	strh r0, [r2]\n\
	ldr r0, _080185F0 @ =0x02000000\n\
	ldr r3, _080185F4 @ =0x000160a4\n\
	adds r2, r0, r3\n\
	movs r1, 0xA\n\
	b _08018638\n\
	.align 2, 0\n\
_080185EC: .4byte gBattleWeather\n\
_080185F0: .4byte 0x02000000\n\
_080185F4: .4byte 0x000160a4\n\
_080185F8:\n\
	ldr r3, _08018614 @ =gBattleWeather\n\
	ldrh r1, [r3]\n\
	movs r2, 0x18\n\
	adds r0, r2, 0\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _0801864C\n\
	strh r2, [r3]\n\
	ldr r0, _08018618 @ =0x02000000\n\
	ldr r3, _0801861C @ =0x000160a4\n\
	adds r2, r0, r3\n\
	movs r1, 0xC\n\
	b _08018638\n\
	.align 2, 0\n\
_08018614: .4byte gBattleWeather\n\
_08018618: .4byte 0x02000000\n\
_0801861C: .4byte 0x000160a4\n\
_08018620:\n\
	ldr r3, _08018668 @ =gBattleWeather\n\
	ldrh r1, [r3]\n\
	movs r2, 0x60\n\
	adds r0, r2, 0\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _0801864C\n\
	strh r2, [r3]\n\
	ldr r0, _0801866C @ =0x02000000\n\
	ldr r3, _08018670 @ =0x000160a4\n\
	adds r2, r0, r3\n\
	movs r1, 0xB\n\
_08018638:\n\
	strb r1, [r2]\n\
	ldr r5, _08018674 @ =0x00016003\n\
	adds r0, r5\n\
	mov r1, r10\n\
	strb r1, [r0]\n\
	mov r0, r9\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_0801864C:\n\
	mov r2, r9\n\
	cmp r2, 0\n\
	bne _08018656\n\
	bl _08019F92\n\
_08018656:\n\
	bl weather_get_current\n\
	ldr r1, _08018678 @ =gBattleCommunication\n\
	strb r0, [r1, 0x5]\n\
	ldr r0, _0801867C @ =gUnknown_081D901D\n\
	bl b_push_move_exec\n\
	bl _08019F76\n\
	.align 2, 0\n\
_08018668: .4byte gBattleWeather\n\
_0801866C: .4byte 0x02000000\n\
_08018670: .4byte 0x000160a4\n\
_08018674: .4byte 0x00016003\n\
_08018678: .4byte gBattleCommunication\n\
_0801867C: .4byte gUnknown_081D901D\n\
_08018680:\n\
	ldr r2, _080186A8 @ =gBattleWeather\n\
	ldrh r1, [r2]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08018690\n\
	bl _08019F76\n\
_08018690:\n\
	movs r0, 0x5\n\
	strh r0, [r2]\n\
	ldr r0, _080186AC @ =gUnknown_081D9704\n\
	bl b_push_move_exec\n\
	ldr r0, _080186B0 @ =0x02000000\n\
	ldr r3, _080186B4 @ =0x00016003\n\
	adds r0, r3\n\
	mov r5, r10\n\
	strb r5, [r0]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_080186A8: .4byte gBattleWeather\n\
_080186AC: .4byte gUnknown_081D9704\n\
_080186B0: .4byte 0x02000000\n\
_080186B4: .4byte 0x00016003\n\
_080186B8:\n\
	ldr r2, _080186E0 @ =gBattleWeather\n\
	ldrh r1, [r2]\n\
	movs r0, 0x10\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080186C8\n\
	bl _08019F76\n\
_080186C8:\n\
	movs r0, 0x18\n\
	strh r0, [r2]\n\
	ldr r0, _080186E4 @ =gUnknown_081D9744\n\
	bl b_push_move_exec\n\
	ldr r0, _080186E8 @ =0x02000000\n\
	ldr r1, _080186EC @ =0x00016003\n\
	adds r0, r1\n\
	mov r2, r10\n\
	strb r2, [r0]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_080186E0: .4byte gBattleWeather\n\
_080186E4: .4byte gUnknown_081D9744\n\
_080186E8: .4byte 0x02000000\n\
_080186EC: .4byte 0x00016003\n\
_080186F0:\n\
	ldr r2, _08018718 @ =gBattleWeather\n\
	ldrh r1, [r2]\n\
	movs r0, 0x40\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08018700\n\
	bl _08019F76\n\
_08018700:\n\
	movs r0, 0x60\n\
	strh r0, [r2]\n\
	ldr r0, _0801871C @ =gUnknown_081D97FE\n\
	bl b_push_move_exec\n\
	ldr r0, _08018720 @ =0x02000000\n\
	ldr r3, _08018724 @ =0x00016003\n\
	adds r0, r3\n\
	mov r5, r10\n\
	strb r5, [r0]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_08018718: .4byte gBattleWeather\n\
_0801871C: .4byte gUnknown_081D97FE\n\
_08018720: .4byte 0x02000000\n\
_08018724: .4byte 0x00016003\n\
_08018728:\n\
	ldr r0, _08018754 @ =gSpecialStatuses\n\
	mov r1, r10\n\
	lsls r2, r1, 2\n\
	adds r1, r2, r1\n\
	lsls r1, 2\n\
	adds r3, r1, r0\n\
	ldrb r0, [r3]\n\
	lsls r0, 28\n\
	cmp r0, 0\n\
	bge _08018740\n\
	bl _08019F76\n\
_08018740:\n\
	ldr r1, _08018758 @ =gStatuses3\n\
	adds r1, r2, r1\n\
	ldr r0, [r1]\n\
	movs r2, 0x80\n\
	lsls r2, 12\n\
	orrs r0, r2\n\
	str r0, [r1]\n\
	ldrb r0, [r3]\n\
	movs r1, 0x8\n\
	b _080187CA\n\
	.align 2, 0\n\
_08018754: .4byte gSpecialStatuses\n\
_08018758: .4byte gStatuses3\n\
_0801875C:\n\
	mov r0, r10\n\
	bl CastformDataTypeChange\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
	cmp r0, 0\n\
	bne _08018770\n\
	bl _08019F92\n\
_08018770:\n\
	ldr r0, _08018790 @ =gUnknown_081D977D\n\
	bl b_push_move_exec\n\
	ldr r0, _08018794 @ =0x02000000\n\
	ldr r2, _08018798 @ =0x00016003\n\
	adds r1, r0, r2\n\
	mov r3, r10\n\
	strb r3, [r1]\n\
	mov r1, r9\n\
	subs r1, 0x1\n\
	ldr r5, _0801879C @ =0x0001609b\n\
	adds r0, r5\n\
	strb r1, [r0]\n\
	bl _08019F76\n\
	.align 2, 0\n\
_08018790: .4byte gUnknown_081D977D\n\
_08018794: .4byte 0x02000000\n\
_08018798: .4byte 0x00016003\n\
_0801879C: .4byte 0x0001609b\n\
_080187A0:\n\
	ldr r0, _080187D4 @ =gSpecialStatuses\n\
	mov r1, r10\n\
	lsls r2, r1, 2\n\
	adds r1, r2, r1\n\
	lsls r1, 2\n\
	adds r3, r1, r0\n\
	ldrb r0, [r3]\n\
	lsls r0, 27\n\
	cmp r0, 0\n\
	bge _080187B8\n\
	bl _08019F76\n\
_080187B8:\n\
	ldr r1, _080187D8 @ =gStatuses3\n\
	adds r1, r2, r1\n\
	ldr r0, [r1]\n\
	movs r2, 0x80\n\
	lsls r2, 13\n\
	orrs r0, r2\n\
	str r0, [r1]\n\
	ldrb r0, [r3]\n\
	movs r1, 0x10\n\
_080187CA:\n\
	orrs r0, r1\n\
	strb r0, [r3]\n\
	bl _08019F76\n\
	.align 2, 0\n\
_080187D4: .4byte gSpecialStatuses\n\
_080187D8: .4byte gStatuses3\n\
_080187DC:\n\
	movs r6, 0\n\
	ldrb r5, [r5]\n\
	cmp r6, r5\n\
	bcc _080187E8\n\
	bl _08019F76\n\
_080187E8:\n\
	adds r0, r6, 0\n\
	bl CastformDataTypeChange\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
	cmp r0, 0\n\
	beq _080187FC\n\
	bl _08019E14\n\
_080187FC:\n\
	adds r0, r6, 0x1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	ldr r0, _08018810 @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r6, r0\n\
	bcc _080187E8\n\
	bl _08019F76\n\
	.align 2, 0\n\
_08018810: .4byte gNoOfAllBanks\n\
_08018814:\n\
	ldr r2, _08018844 @ =gBattleMons\n\
	movs r0, 0x58\n\
	mov r1, r10\n\
	muls r1, r0\n\
	adds r4, r1, r2\n\
	ldrh r0, [r4, 0x28]\n\
	cmp r0, 0\n\
	bne _08018828\n\
	bl _08019F76\n\
_08018828:\n\
	ldr r0, _08018848 @ =gBankAttacker\n\
	mov r3, r10\n\
	strb r3, [r0]\n\
	mov r3, r8\n\
	ldrb r5, [r3]\n\
	cmp r5, 0x2C\n\
	beq _0801885A\n\
	cmp r5, 0x2C\n\
	bgt _0801884C\n\
	cmp r5, 0x3\n\
	bne _08018840\n\
	b _080189B8\n\
_08018840:\n\
	bl _08019F76\n\
	.align 2, 0\n\
_08018844: .4byte gBattleMons\n\
_08018848: .4byte gBankAttacker\n\
_0801884C:\n\
	cmp r5, 0x36\n\
	bne _08018852\n\
	b _08018A18\n\
_08018852:\n\
	cmp r5, 0x3D\n\
	beq _080188DC\n\
	bl _08019F76\n\
_0801885A:\n\
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
	beq _08018876\n\
	bl _08019F76\n\
_08018876:\n\
	str r0, [sp]\n\
	movs r0, 0x13\n\
	movs r1, 0\n\
	movs r2, 0x4D\n\
	movs r3, 0\n\
	bl AbilityBattleEffects\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _0801888E\n\
	bl _08019F76\n\
_0801888E:\n\
	ldr r0, _080188D0 @ =gBattleWeather\n\
	ldrh r1, [r0]\n\
	movs r0, 0x7\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _0801889E\n\
	bl _08019F76\n\
_0801889E:\n\
	ldrh r0, [r4, 0x2C]\n\
	ldrh r1, [r4, 0x28]\n\
	cmp r0, r1\n\
	bhi _080188AA\n\
	bl _08019F76\n\
_080188AA:\n\
	mov r2, r8\n\
	strb r5, [r2]\n\
	ldr r0, _080188D4 @ =gUnknown_081D9730\n\
	bl b_push_move_exec\n\
	ldr r1, _080188D8 @ =gBattleMoveDamage\n\
	ldrh r0, [r4, 0x2C]\n\
	lsrs r0, 4\n\
	str r0, [r1]\n\
	cmp r0, 0\n\
	bne _080188C4\n\
	movs r0, 0x1\n\
	str r0, [r1]\n\
_080188C4:\n\
	ldr r0, [r1]\n\
	negs r0, r0\n\
	str r0, [r1]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_080188D0: .4byte gBattleWeather\n\
_080188D4: .4byte gUnknown_081D9730\n\
_080188D8: .4byte gBattleMoveDamage\n\
_080188DC:\n\
	adds r0, r2, 0\n\
	adds r0, 0x4C\n\
	adds r5, r1, r0\n\
	ldrb r0, [r5]\n\
	cmp r0, 0\n\
	bne _080188EC\n\
	bl _08019F76\n\
_080188EC:\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0x3\n\
	bl __umodsi3\n\
	lsls r0, 16\n\
	lsrs r4, r0, 16\n\
	cmp r4, 0\n\
	beq _08018906\n\
	bl _08019F76\n\
_08018906:\n\
	ldr r0, [r5]\n\
	movs r1, 0x88\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08018918\n\
	ldr r0, _08018990 @ =gBattleTextBuff1\n\
	ldr r1, _08018994 @ =gStatusConditionString_PoisonJpn\n\
	bl StringCopy\n\
_08018918:\n\
	ldr r0, [r5]\n\
	movs r1, 0x7\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _0801892A\n\
	ldr r0, _08018990 @ =gBattleTextBuff1\n\
	ldr r1, _08018998 @ =gStatusConditionString_SleepJpn\n\
	bl StringCopy\n\
_0801892A:\n\
	ldr r0, [r5]\n\
	movs r1, 0x40\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _0801893C\n\
	ldr r0, _08018990 @ =gBattleTextBuff1\n\
	ldr r1, _0801899C @ =gStatusConditionString_ParalysisJpn\n\
	bl StringCopy\n\
_0801893C:\n\
	ldr r0, [r5]\n\
	movs r1, 0x10\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _0801894E\n\
	ldr r0, _08018990 @ =gBattleTextBuff1\n\
	ldr r1, _080189A0 @ =gStatusConditionString_BurnJpn\n\
	bl StringCopy\n\
_0801894E:\n\
	ldr r0, [r5]\n\
	movs r1, 0x20\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08018960\n\
	ldr r0, _08018990 @ =gBattleTextBuff1\n\
	ldr r1, _080189A4 @ =gStatusConditionString_IceJpn\n\
	bl StringCopy\n\
_08018960:\n\
	str r4, [r5]\n\
	ldr r0, _080189A8 @ =0x02000000\n\
	ldr r4, _080189AC @ =gActiveBank\n\
	mov r3, r10\n\
	strb r3, [r4]\n\
	ldr r1, _080189B0 @ =0x00016003\n\
	adds r0, r1\n\
	strb r3, [r0]\n\
	ldr r0, _080189B4 @ =gUnknown_081D9758\n\
	bl b_push_move_exec\n\
	str r5, [sp]\n\
	movs r0, 0\n\
	movs r1, 0x28\n\
	movs r2, 0\n\
	movs r3, 0x4\n\
	bl EmitSetAttributes\n\
	ldrb r0, [r4]\n\
	bl MarkBufferBankForExecution\n\
	bl _08019F22\n\
	.align 2, 0\n\
_08018990: .4byte gBattleTextBuff1\n\
_08018994: .4byte gStatusConditionString_PoisonJpn\n\
_08018998: .4byte gStatusConditionString_SleepJpn\n\
_0801899C: .4byte gStatusConditionString_ParalysisJpn\n\
_080189A0: .4byte gStatusConditionString_BurnJpn\n\
_080189A4: .4byte gStatusConditionString_IceJpn\n\
_080189A8: .4byte 0x02000000\n\
_080189AC: .4byte gActiveBank\n\
_080189B0: .4byte 0x00016003\n\
_080189B4: .4byte gUnknown_081D9758\n\
_080189B8:\n\
	ldrb r2, [r4, 0x1B]\n\
	movs r0, 0x1B\n\
	ldrsb r0, [r4, r0]\n\
	cmp r0, 0xB\n\
	ble _080189C6\n\
	bl _08019F76\n\
_080189C6:\n\
	ldr r0, _08018A04 @ =gDisableStructs\n\
	mov r3, r10\n\
	lsls r1, r3, 3\n\
	subs r1, r3\n\
	lsls r1, 2\n\
	adds r1, r0\n\
	ldrb r0, [r1, 0x16]\n\
	cmp r0, 0x2\n\
	bne _080189DC\n\
	bl _08019F76\n\
_080189DC:\n\
	adds r0, r2, 0x1\n\
	movs r2, 0\n\
	strb r0, [r4, 0x1B]\n\
	ldr r5, _08018A08 @ =0x000160a4\n\
	adds r1, r7, r5\n\
	movs r0, 0x11\n\
	strb r0, [r1]\n\
	ldr r1, _08018A0C @ =0x000160a5\n\
	adds r0, r7, r1\n\
	strb r2, [r0]\n\
	ldr r0, _08018A10 @ =gUnknown_081D9718\n\
	bl b_push_move_exec\n\
	ldr r2, _08018A14 @ =0x00016003\n\
	adds r0, r7, r2\n\
	mov r3, r10\n\
	strb r3, [r0]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_08018A04: .4byte gDisableStructs\n\
_08018A08: .4byte 0x000160a4\n\
_08018A0C: .4byte 0x000160a5\n\
_08018A10: .4byte gUnknown_081D9718\n\
_08018A14: .4byte 0x00016003\n\
_08018A18:\n\
	ldr r2, _08018A3C @ =gDisableStructs\n\
	ldrb r0, [r0]\n\
	lsls r1, r0, 3\n\
	subs r1, r0\n\
	lsls r1, 2\n\
	adds r1, r2\n\
	ldrb r3, [r1, 0x18]\n\
	lsls r0, r3, 31\n\
	lsrs r0, 31\n\
	movs r2, 0x1\n\
	eors r2, r0\n\
	movs r0, 0x2\n\
	negs r0, r0\n\
	ands r0, r3\n\
	orrs r0, r2\n\
	strb r0, [r1, 0x18]\n\
	bl _08019F76\n\
	.align 2, 0\n\
_08018A3C: .4byte gDisableStructs\n\
_08018A40:\n\
	mov r5, r8\n\
	ldrb r0, [r5]\n\
	cmp r0, 0x2B\n\
	beq _08018A4C\n\
	bl _08019F76\n\
_08018A4C:\n\
	movs r4, 0\n\
	ldr r0, _08018ABC @ =gUnknown_081FA724\n\
	ldrh r2, [r0]\n\
	ldr r5, _08018AC0 @ =0x0000ffff\n\
	adds r1, r0, 0\n\
	cmp r2, r5\n\
	bne _08018A5E\n\
	bl _08019F76\n\
_08018A5E:\n\
	cmp r2, r3\n\
	beq _08018A76\n\
	adds r2, r1, 0\n\
_08018A64:\n\
	adds r2, 0x2\n\
	adds r4, 0x1\n\
	ldrh r0, [r2]\n\
	cmp r0, r5\n\
	bne _08018A72\n\
	bl _08019F76\n\
_08018A72:\n\
	cmp r0, r3\n\
	bne _08018A64\n\
_08018A76:\n\
	lsls r0, r4, 1\n\
	adds r0, r1\n\
	ldrh r1, [r0]\n\
	ldr r0, _08018AC0 @ =0x0000ffff\n\
	cmp r1, r0\n\
	bne _08018A86\n\
	bl _08019F76\n\
_08018A86:\n\
	ldr r1, _08018AC4 @ =gBattleMons\n\
	ldr r0, _08018AC8 @ =gBankAttacker\n\
	ldrb r2, [r0]\n\
	movs r0, 0x58\n\
	muls r0, r2\n\
	adds r1, 0x50\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	movs r1, 0x80\n\
	lsls r1, 5\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08018AAC\n\
	ldr r0, _08018ACC @ =gHitMarker\n\
	ldr r1, [r0]\n\
	movs r2, 0x80\n\
	lsls r2, 4\n\
	orrs r1, r2\n\
	str r1, [r0]\n\
_08018AAC:\n\
	ldr r1, _08018AD0 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018AD4 @ =gUnknown_081D98F3\n\
	str r0, [r1]\n\
	movs r0, 0x1\n\
	mov r9, r0\n\
	bl _08019F7C\n\
	.align 2, 0\n\
_08018ABC: .4byte gUnknown_081FA724\n\
_08018AC0: .4byte 0x0000ffff\n\
_08018AC4: .4byte gBattleMons\n\
_08018AC8: .4byte gBankAttacker\n\
_08018ACC: .4byte gHitMarker\n\
_08018AD0: .4byte gBattlescriptCurrInstr\n\
_08018AD4: .4byte gUnknown_081D98F3\n\
_08018AD8:\n\
	cmp r3, 0\n\
	bne _08018AE0\n\
	bl _08019F76\n\
_08018AE0:\n\
	mov r1, r8\n\
	ldrb r0, [r1]\n\
	cmp r0, 0xB\n\
	beq _08018B50\n\
	cmp r0, 0xB\n\
	bgt _08018AF2\n\
	cmp r0, 0xA\n\
	beq _08018AF8\n\
	b _08018C6A\n\
_08018AF2:\n\
	cmp r0, 0x12\n\
	beq _08018BA8\n\
	b _08018C6A\n\
_08018AF8:\n\
	cmp r4, 0xD\n\
	beq _08018AFE\n\
	b _08018C6A\n\
_08018AFE:\n\
	ldr r0, _08018B28 @ =gBattleMoves\n\
	lsls r1, r3, 1\n\
	adds r1, r3\n\
	lsls r1, 2\n\
	adds r1, r0\n\
	ldrb r0, [r1, 0x1]\n\
	cmp r0, 0\n\
	bne _08018B10\n\
	b _08018C6A\n\
_08018B10:\n\
	ldr r1, _08018B2C @ =gProtectStructs\n\
	ldr r0, _08018B30 @ =gBankAttacker\n\
	ldrb r0, [r0]\n\
	lsls r0, 4\n\
	adds r0, r1\n\
	ldrb r0, [r0, 0x2]\n\
	lsls r0, 28\n\
	cmp r0, 0\n\
	bge _08018B3C\n\
	ldr r1, _08018B34 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018B38 @ =gUnknown_081D9843\n\
	b _08018B40\n\
	.align 2, 0\n\
_08018B28: .4byte gBattleMoves\n\
_08018B2C: .4byte gProtectStructs\n\
_08018B30: .4byte gBankAttacker\n\
_08018B34: .4byte gBattlescriptCurrInstr\n\
_08018B38: .4byte gUnknown_081D9843\n\
_08018B3C:\n\
	ldr r1, _08018B48 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018B4C @ =gUnknown_081D9842\n\
_08018B40:\n\
	str r0, [r1]\n\
	movs r2, 0x1\n\
	b _08018C68\n\
	.align 2, 0\n\
_08018B48: .4byte gBattlescriptCurrInstr\n\
_08018B4C: .4byte gUnknown_081D9842\n\
_08018B50:\n\
	cmp r4, 0xB\n\
	beq _08018B56\n\
	b _08018C6A\n\
_08018B56:\n\
	ldr r0, _08018B80 @ =gBattleMoves\n\
	lsls r1, r3, 1\n\
	adds r1, r3\n\
	lsls r1, 2\n\
	adds r1, r0\n\
	ldrb r0, [r1, 0x1]\n\
	cmp r0, 0\n\
	bne _08018B68\n\
	b _08018C6A\n\
_08018B68:\n\
	ldr r1, _08018B84 @ =gProtectStructs\n\
	ldr r0, _08018B88 @ =gBankAttacker\n\
	ldrb r0, [r0]\n\
	lsls r0, 4\n\
	adds r0, r1\n\
	ldrb r0, [r0, 0x2]\n\
	lsls r0, 28\n\
	cmp r0, 0\n\
	bge _08018B94\n\
	ldr r1, _08018B8C @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018B90 @ =gUnknown_081D9843\n\
	b _08018B98\n\
	.align 2, 0\n\
_08018B80: .4byte gBattleMoves\n\
_08018B84: .4byte gProtectStructs\n\
_08018B88: .4byte gBankAttacker\n\
_08018B8C: .4byte gBattlescriptCurrInstr\n\
_08018B90: .4byte gUnknown_081D9843\n\
_08018B94:\n\
	ldr r1, _08018BA0 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018BA4 @ =gUnknown_081D9842\n\
_08018B98:\n\
	str r0, [r1]\n\
	movs r3, 0x1\n\
	mov r9, r3\n\
	b _08018C6A\n\
	.align 2, 0\n\
_08018BA0: .4byte gBattlescriptCurrInstr\n\
_08018BA4: .4byte gUnknown_081D9842\n\
_08018BA8:\n\
	cmp r4, 0xA\n\
	bne _08018C6A\n\
	ldr r1, _08018BF4 @ =gBattleMons\n\
	movs r0, 0x58\n\
	mov r5, r10\n\
	muls r5, r0\n\
	adds r0, r5, 0\n\
	adds r1, 0x4C\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	movs r1, 0x20\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _08018C6A\n\
	ldr r2, _08018BF8 @ =0x02017100\n\
	mov r0, r10\n\
	lsls r1, r0, 2\n\
	adds r0, r1, r2\n\
	ldr r3, [r0]\n\
	movs r4, 0x1\n\
	ands r3, r4\n\
	adds r5, r1, 0\n\
	cmp r3, 0\n\
	bne _08018C30\n\
	ldr r0, _08018BFC @ =gBattleCommunication\n\
	strb r3, [r0, 0x5]\n\
	ldr r1, _08018C00 @ =gProtectStructs\n\
	ldr r0, _08018C04 @ =gBankAttacker\n\
	ldrb r0, [r0]\n\
	lsls r0, 4\n\
	adds r0, r1\n\
	ldrb r0, [r0, 0x2]\n\
	lsls r0, 28\n\
	cmp r0, 0\n\
	bge _08018C10\n\
	ldr r1, _08018C08 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018C0C @ =gUnknown_081D987C\n\
	b _08018C14\n\
	.align 2, 0\n\
_08018BF4: .4byte gBattleMons\n\
_08018BF8: .4byte 0x02017100\n\
_08018BFC: .4byte gBattleCommunication\n\
_08018C00: .4byte gProtectStructs\n\
_08018C04: .4byte gBankAttacker\n\
_08018C08: .4byte gBattlescriptCurrInstr\n\
_08018C0C: .4byte gUnknown_081D987C\n\
_08018C10:\n\
	ldr r1, _08018C28 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018C2C @ =gUnknown_081D987B\n\
_08018C14:\n\
	str r0, [r1]\n\
	adds r0, r5, r2\n\
	ldr r1, [r0]\n\
	movs r2, 0x1\n\
	orrs r1, r2\n\
	str r1, [r0]\n\
	movs r1, 0x2\n\
	mov r9, r1\n\
	b _08018C6A\n\
	.align 2, 0\n\
_08018C28: .4byte gBattlescriptCurrInstr\n\
_08018C2C: .4byte gUnknown_081D987B\n\
_08018C30:\n\
	ldr r0, _08018C4C @ =gBattleCommunication\n\
	strb r4, [r0, 0x5]\n\
	ldr r1, _08018C50 @ =gProtectStructs\n\
	ldr r0, _08018C54 @ =gBankAttacker\n\
	ldrb r0, [r0]\n\
	lsls r0, 4\n\
	adds r0, r1\n\
	ldrb r0, [r0, 0x2]\n\
	lsls r0, 28\n\
	cmp r0, 0\n\
	bge _08018C60\n\
	ldr r1, _08018C58 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018C5C @ =gUnknown_081D987C\n\
	b _08018C64\n\
	.align 2, 0\n\
_08018C4C: .4byte gBattleCommunication\n\
_08018C50: .4byte gProtectStructs\n\
_08018C54: .4byte gBankAttacker\n\
_08018C58: .4byte gBattlescriptCurrInstr\n\
_08018C5C: .4byte gUnknown_081D987C\n\
_08018C60:\n\
	ldr r1, _08018CA4 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018CA8 @ =gUnknown_081D987B\n\
_08018C64:\n\
	str r0, [r1]\n\
	movs r2, 0x2\n\
_08018C68:\n\
	mov r9, r2\n\
_08018C6A:\n\
	mov r3, r9\n\
	cmp r3, 0x1\n\
	beq _08018C74\n\
	bl _08019F76\n\
_08018C74:\n\
	ldr r1, _08018CAC @ =gBattleMons\n\
	movs r0, 0x58\n\
	mov r5, r10\n\
	muls r5, r0\n\
	adds r0, r5, 0\n\
	adds r1, r0, r1\n\
	ldrh r0, [r1, 0x2C]\n\
	ldrh r2, [r1, 0x28]\n\
	cmp r0, r2\n\
	bne _08018CD0\n\
	ldr r1, _08018CB0 @ =gProtectStructs\n\
	ldr r0, _08018CB4 @ =gBankAttacker\n\
	ldrb r0, [r0]\n\
	lsls r0, 4\n\
	adds r0, r1\n\
	ldrb r0, [r0, 0x2]\n\
	lsls r0, 28\n\
	cmp r0, 0\n\
	bge _08018CBC\n\
	ldr r1, _08018CA4 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018CB8 @ =gUnknown_081D9866\n\
	str r0, [r1]\n\
	bl _08019F76\n\
	.align 2, 0\n\
_08018CA4: .4byte gBattlescriptCurrInstr\n\
_08018CA8: .4byte gUnknown_081D987B\n\
_08018CAC: .4byte gBattleMons\n\
_08018CB0: .4byte gProtectStructs\n\
_08018CB4: .4byte gBankAttacker\n\
_08018CB8: .4byte gUnknown_081D9866\n\
_08018CBC:\n\
	ldr r1, _08018CC8 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018CCC @ =gUnknown_081D9865\n\
	str r0, [r1]\n\
	bl _08019F76\n\
	.align 2, 0\n\
_08018CC8: .4byte gBattlescriptCurrInstr\n\
_08018CCC: .4byte gUnknown_081D9865\n\
_08018CD0:\n\
	ldr r2, _08018CEC @ =gBattleMoveDamage\n\
	ldrh r0, [r1, 0x2C]\n\
	lsrs r0, 2\n\
	str r0, [r2]\n\
	cmp r0, 0\n\
	bne _08018CE0\n\
	mov r3, r9\n\
	str r3, [r2]\n\
_08018CE0:\n\
	ldr r0, [r2]\n\
	negs r0, r0\n\
	str r0, [r2]\n\
	bl _08019F76\n\
	.align 2, 0\n\
_08018CEC: .4byte gBattleMoveDamage\n\
_08018CF0:\n\
	mov r5, r8\n\
	ldrb r0, [r5]\n\
	subs r0, 0x9\n\
	cmp r0, 0x2F\n\
	bls _08018CFE\n\
	bl _08019F76\n\
_08018CFE:\n\
	lsls r0, 2\n\
	ldr r1, _08018D08 @ =_08018D0C\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	mov pc, r0\n\
	.align 2, 0\n\
_08018D08: .4byte _08018D0C\n\
	.align 2, 0\n\
_08018D0C:\n\
	.4byte _08019128\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08018DCC\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08018E94\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08018F54\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _0801904C\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019204\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _08019F76\n\
	.4byte _080192E0\n\
_08018DCC:\n\
	ldr r0, _08018E74 @ =gBattleMoveFlags\n\
	ldrb r1, [r0]\n\
	movs r0, 0x29\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08018DDC\n\
	bl _08019F76\n\
_08018DDC:\n\
	cmp r3, 0xA5\n\
	bne _08018DE4\n\
	bl _08019F76\n\
_08018DE4:\n\
	ldr r0, _08018E78 @ =gBattleMoves\n\
	lsls r1, r3, 1\n\
	adds r1, r3\n\
	lsls r1, 2\n\
	adds r1, r0\n\
	ldrb r0, [r1, 0x1]\n\
	cmp r0, 0\n\
	bne _08018DF8\n\
	bl _08019F76\n\
_08018DF8:\n\
	ldr r2, _08018E7C @ =gSpecialStatuses\n\
	ldr r0, _08018E80 @ =gBankTarget\n\
	ldrb r1, [r0]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r1, r0, 2\n\
	adds r0, r2, 0\n\
	adds r0, 0x8\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _08018E20\n\
	adds r0, r2, 0\n\
	adds r0, 0xC\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _08018E20\n\
	bl _08019F76\n\
_08018E20:\n\
	ldr r1, _08018E84 @ =gBattleMons\n\
	movs r0, 0x58\n\
	mov r2, r10\n\
	muls r2, r0\n\
	adds r0, r2, 0\n\
	adds r1, r0, r1\n\
	adds r3, r1, 0\n\
	adds r3, 0x21\n\
	ldrb r0, [r3]\n\
	cmp r0, r4\n\
	bne _08018E3A\n\
	bl _08019F76\n\
_08018E3A:\n\
	adds r2, r1, 0\n\
	adds r2, 0x22\n\
	ldrb r0, [r2]\n\
	cmp r0, r4\n\
	bne _08018E48\n\
	bl _08019F76\n\
_08018E48:\n\
	ldrh r0, [r1, 0x28]\n\
	cmp r0, 0\n\
	bne _08018E52\n\
	bl _08019F76\n\
_08018E52:\n\
	strb r4, [r3]\n\
	strb r4, [r2]\n\
	ldr r1, _08018E88 @ =gBattleTextBuff1\n\
	movs r0, 0xFD\n\
	strb r0, [r1]\n\
	movs r0, 0x3\n\
	strb r0, [r1, 0x1]\n\
	strb r4, [r1, 0x2]\n\
	movs r0, 0xFF\n\
	strb r0, [r1, 0x3]\n\
	bl b_movescr_stack_push_cursor\n\
	ldr r1, _08018E8C @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018E90 @ =gUnknown_081D9921\n\
	str r0, [r1]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_08018E74: .4byte gBattleMoveFlags\n\
_08018E78: .4byte gBattleMoves\n\
_08018E7C: .4byte gSpecialStatuses\n\
_08018E80: .4byte gBankTarget\n\
_08018E84: .4byte gBattleMons\n\
_08018E88: .4byte gBattleTextBuff1\n\
_08018E8C: .4byte gBattlescriptCurrInstr\n\
_08018E90: .4byte gUnknown_081D9921\n\
_08018E94:\n\
	ldr r0, _08018F2C @ =gBattleMoveFlags\n\
	ldrb r1, [r0]\n\
	movs r0, 0x29\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08018EA4\n\
	bl _08019F76\n\
_08018EA4:\n\
	ldr r1, _08018F30 @ =gBattleMons\n\
	ldr r0, _08018F34 @ =gBankAttacker\n\
	ldrb r2, [r0]\n\
	movs r0, 0x58\n\
	muls r0, r2\n\
	adds r4, r0, r1\n\
	ldrh r0, [r4, 0x28]\n\
	cmp r0, 0\n\
	bne _08018EBA\n\
	bl _08019F76\n\
_08018EBA:\n\
	ldr r0, _08018F38 @ =gProtectStructs\n\
	lsls r1, r2, 4\n\
	adds r1, r0\n\
	ldrb r0, [r1, 0x1]\n\
	lsls r0, 31\n\
	cmp r0, 0\n\
	beq _08018ECC\n\
	bl _08019F76\n\
_08018ECC:\n\
	ldr r2, _08018F3C @ =gSpecialStatuses\n\
	ldr r0, _08018F40 @ =gBankTarget\n\
	ldrb r1, [r0]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r1, r0, 2\n\
	adds r0, r2, 0\n\
	adds r0, 0x8\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _08018EF4\n\
	adds r0, r2, 0\n\
	adds r0, 0xC\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _08018EF4\n\
	bl _08019F76\n\
_08018EF4:\n\
	ldr r1, _08018F44 @ =gBattleMoves\n\
	lsls r0, r3, 1\n\
	adds r0, r3\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x8]\n\
	movs r2, 0x1\n\
	adds r0, r2, 0\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _08018F0E\n\
	bl _08019F76\n\
_08018F0E:\n\
	ldr r1, _08018F48 @ =gBattleMoveDamage\n\
	ldrh r0, [r4, 0x2C]\n\
	lsrs r0, 4\n\
	str r0, [r1]\n\
	cmp r0, 0\n\
	bne _08018F1C\n\
	str r2, [r1]\n\
_08018F1C:\n\
	bl b_movescr_stack_push_cursor\n\
	ldr r1, _08018F4C @ =gBattlescriptCurrInstr\n\
	ldr r0, _08018F50 @ =gUnknown_081D9928\n\
	str r0, [r1]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_08018F2C: .4byte gBattleMoveFlags\n\
_08018F30: .4byte gBattleMons\n\
_08018F34: .4byte gBankAttacker\n\
_08018F38: .4byte gProtectStructs\n\
_08018F3C: .4byte gSpecialStatuses\n\
_08018F40: .4byte gBankTarget\n\
_08018F44: .4byte gBattleMoves\n\
_08018F48: .4byte gBattleMoveDamage\n\
_08018F4C: .4byte gBattlescriptCurrInstr\n\
_08018F50: .4byte gUnknown_081D9928\n\
_08018F54:\n\
	ldr r0, _08019020 @ =gBattleMoveFlags\n\
	ldrb r1, [r0]\n\
	movs r0, 0x29\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08018F64\n\
	bl _08019F76\n\
_08018F64:\n\
	ldr r1, _08019024 @ =gBattleMons\n\
	ldr r0, _08019028 @ =gBankAttacker\n\
	ldrb r2, [r0]\n\
	movs r0, 0x58\n\
	muls r0, r2\n\
	adds r0, r1\n\
	ldrh r0, [r0, 0x28]\n\
	cmp r0, 0\n\
	bne _08018F7A\n\
	bl _08019F76\n\
_08018F7A:\n\
	ldr r0, _0801902C @ =gProtectStructs\n\
	lsls r1, r2, 4\n\
	adds r1, r0\n\
	ldrb r0, [r1, 0x1]\n\
	lsls r0, 31\n\
	cmp r0, 0\n\
	beq _08018F8C\n\
	bl _08019F76\n\
_08018F8C:\n\
	ldr r2, _08019030 @ =gSpecialStatuses\n\
	ldr r0, _08019034 @ =gBankTarget\n\
	ldrb r1, [r0]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r1, r0, 2\n\
	adds r0, r2, 0\n\
	adds r0, 0x8\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _08018FB4\n\
	adds r0, r2, 0\n\
	adds r0, 0xC\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _08018FB4\n\
	bl _08019F76\n\
_08018FB4:\n\
	ldr r1, _08019038 @ =gBattleMoves\n\
	lsls r0, r3, 1\n\
	adds r0, r3\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x8]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _08018FCC\n\
	bl _08019F76\n\
_08018FCC:\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0xA\n\
	bl __umodsi3\n\
	lsls r0, 16\n\
	cmp r0, 0\n\
	beq _08018FE4\n\
	bl _08019F76\n\
_08018FE4:\n\
	ldr r5, _0801903C @ =gBattleCommunication\n\
	movs r4, 0x3\n\
_08018FE8:\n\
	bl Random\n\
	ands r0, r4\n\
	strb r0, [r5, 0x3]\n\
	cmp r0, 0\n\
	beq _08018FE8\n\
	ldr r1, _0801903C @ =gBattleCommunication\n\
	ldrb r0, [r1, 0x3]\n\
	cmp r0, 0x3\n\
	bne _08019000\n\
	adds r0, 0x2\n\
	strb r0, [r1, 0x3]\n\
_08019000:\n\
	ldrb r0, [r1, 0x3]\n\
	adds r0, 0x40\n\
	strb r0, [r1, 0x3]\n\
	bl b_movescr_stack_push_cursor\n\
	ldr r1, _08019040 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08019044 @ =gUnknown_081D9950\n\
	str r0, [r1]\n\
	ldr r2, _08019048 @ =gHitMarker\n\
	ldr r0, [r2]\n\
	movs r1, 0x80\n\
	lsls r1, 6\n\
	orrs r0, r1\n\
	str r0, [r2]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_08019020: .4byte gBattleMoveFlags\n\
_08019024: .4byte gBattleMons\n\
_08019028: .4byte gBankAttacker\n\
_0801902C: .4byte gProtectStructs\n\
_08019030: .4byte gSpecialStatuses\n\
_08019034: .4byte gBankTarget\n\
_08019038: .4byte gBattleMoves\n\
_0801903C: .4byte gBattleCommunication\n\
_08019040: .4byte gBattlescriptCurrInstr\n\
_08019044: .4byte gUnknown_081D9950\n\
_08019048: .4byte gHitMarker\n\
_0801904C:\n\
	ldr r0, _080190FC @ =gBattleMoveFlags\n\
	ldrb r1, [r0]\n\
	movs r0, 0x29\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _0801905C\n\
	bl _08019F76\n\
_0801905C:\n\
	ldr r1, _08019100 @ =gBattleMons\n\
	ldr r0, _08019104 @ =gBankAttacker\n\
	ldrb r2, [r0]\n\
	movs r0, 0x58\n\
	muls r0, r2\n\
	adds r0, r1\n\
	ldrh r0, [r0, 0x28]\n\
	cmp r0, 0\n\
	bne _08019072\n\
	bl _08019F76\n\
_08019072:\n\
	ldr r0, _08019108 @ =gProtectStructs\n\
	lsls r1, r2, 4\n\
	adds r1, r0\n\
	ldrb r0, [r1, 0x1]\n\
	lsls r0, 31\n\
	cmp r0, 0\n\
	beq _08019084\n\
	bl _08019F76\n\
_08019084:\n\
	ldr r2, _0801910C @ =gSpecialStatuses\n\
	ldr r0, _08019110 @ =gBankTarget\n\
	ldrb r1, [r0]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r1, r0, 2\n\
	adds r0, r2, 0\n\
	adds r0, 0x8\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _080190AC\n\
	adds r0, r2, 0\n\
	adds r0, 0xC\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _080190AC\n\
	bl _08019F76\n\
_080190AC:\n\
	ldr r1, _08019114 @ =gBattleMoves\n\
	lsls r0, r3, 1\n\
	adds r0, r3\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x8]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080190C4\n\
	bl _08019F76\n\
_080190C4:\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0x3\n\
	bl __umodsi3\n\
	lsls r0, 16\n\
	cmp r0, 0\n\
	beq _080190DC\n\
	bl _08019F76\n\
_080190DC:\n\
	ldr r1, _08019118 @ =gBattleCommunication\n\
	movs r0, 0x42\n\
	strb r0, [r1, 0x3]\n\
	bl b_movescr_stack_push_cursor\n\
	ldr r1, _0801911C @ =gBattlescriptCurrInstr\n\
	ldr r0, _08019120 @ =gUnknown_081D9950\n\
	str r0, [r1]\n\
	ldr r2, _08019124 @ =gHitMarker\n\
	ldr r0, [r2]\n\
	movs r1, 0x80\n\
	lsls r1, 6\n\
	orrs r0, r1\n\
	str r0, [r2]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_080190FC: .4byte gBattleMoveFlags\n\
_08019100: .4byte gBattleMons\n\
_08019104: .4byte gBankAttacker\n\
_08019108: .4byte gProtectStructs\n\
_0801910C: .4byte gSpecialStatuses\n\
_08019110: .4byte gBankTarget\n\
_08019114: .4byte gBattleMoves\n\
_08019118: .4byte gBattleCommunication\n\
_0801911C: .4byte gBattlescriptCurrInstr\n\
_08019120: .4byte gUnknown_081D9950\n\
_08019124: .4byte gHitMarker\n\
_08019128:\n\
	ldr r0, _080191D8 @ =gBattleMoveFlags\n\
	ldrb r1, [r0]\n\
	movs r0, 0x29\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08019138\n\
	bl _08019F76\n\
_08019138:\n\
	ldr r1, _080191DC @ =gBattleMons\n\
	ldr r0, _080191E0 @ =gBankAttacker\n\
	ldrb r2, [r0]\n\
	movs r0, 0x58\n\
	muls r0, r2\n\
	adds r0, r1\n\
	ldrh r0, [r0, 0x28]\n\
	cmp r0, 0\n\
	bne _0801914E\n\
	bl _08019F76\n\
_0801914E:\n\
	ldr r0, _080191E4 @ =gProtectStructs\n\
	lsls r1, r2, 4\n\
	adds r1, r0\n\
	ldrb r0, [r1, 0x1]\n\
	lsls r0, 31\n\
	cmp r0, 0\n\
	beq _08019160\n\
	bl _08019F76\n\
_08019160:\n\
	ldr r2, _080191E8 @ =gSpecialStatuses\n\
	ldr r0, _080191EC @ =gBankTarget\n\
	ldrb r1, [r0]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r1, r0, 2\n\
	adds r0, r2, 0\n\
	adds r0, 0x8\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _08019188\n\
	adds r0, r2, 0\n\
	adds r0, 0xC\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _08019188\n\
	bl _08019F76\n\
_08019188:\n\
	ldr r1, _080191F0 @ =gBattleMoves\n\
	lsls r0, r3, 1\n\
	adds r0, r3\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x8]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080191A0\n\
	bl _08019F76\n\
_080191A0:\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0x3\n\
	bl __umodsi3\n\
	lsls r0, 16\n\
	cmp r0, 0\n\
	beq _080191B8\n\
	bl _08019F76\n\
_080191B8:\n\
	ldr r1, _080191F4 @ =gBattleCommunication\n\
	movs r0, 0x45\n\
	strb r0, [r1, 0x3]\n\
	bl b_movescr_stack_push_cursor\n\
	ldr r1, _080191F8 @ =gBattlescriptCurrInstr\n\
	ldr r0, _080191FC @ =gUnknown_081D9950\n\
	str r0, [r1]\n\
	ldr r2, _08019200 @ =gHitMarker\n\
	ldr r0, [r2]\n\
	movs r1, 0x80\n\
	lsls r1, 6\n\
	orrs r0, r1\n\
	str r0, [r2]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_080191D8: .4byte gBattleMoveFlags\n\
_080191DC: .4byte gBattleMons\n\
_080191E0: .4byte gBankAttacker\n\
_080191E4: .4byte gProtectStructs\n\
_080191E8: .4byte gSpecialStatuses\n\
_080191EC: .4byte gBankTarget\n\
_080191F0: .4byte gBattleMoves\n\
_080191F4: .4byte gBattleCommunication\n\
_080191F8: .4byte gBattlescriptCurrInstr\n\
_080191FC: .4byte gUnknown_081D9950\n\
_08019200: .4byte gHitMarker\n\
_08019204:\n\
	ldr r0, _080192B4 @ =gBattleMoveFlags\n\
	ldrb r1, [r0]\n\
	movs r0, 0x29\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08019214\n\
	bl _08019F76\n\
_08019214:\n\
	ldr r1, _080192B8 @ =gBattleMons\n\
	ldr r0, _080192BC @ =gBankAttacker\n\
	ldrb r2, [r0]\n\
	movs r0, 0x58\n\
	muls r0, r2\n\
	adds r0, r1\n\
	ldrh r0, [r0, 0x28]\n\
	cmp r0, 0\n\
	bne _0801922A\n\
	bl _08019F76\n\
_0801922A:\n\
	ldr r0, _080192C0 @ =gProtectStructs\n\
	lsls r1, r2, 4\n\
	adds r1, r0\n\
	ldrb r0, [r1, 0x1]\n\
	lsls r0, 31\n\
	cmp r0, 0\n\
	beq _0801923C\n\
	bl _08019F76\n\
_0801923C:\n\
	ldr r1, _080192C4 @ =gBattleMoves\n\
	lsls r0, r3, 1\n\
	adds r0, r3\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x8]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _08019254\n\
	bl _08019F76\n\
_08019254:\n\
	ldr r2, _080192C8 @ =gSpecialStatuses\n\
	ldr r0, _080192CC @ =gBankTarget\n\
	ldrb r1, [r0]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r1, r0, 2\n\
	adds r0, r2, 0\n\
	adds r0, 0x8\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _0801927C\n\
	adds r0, r2, 0\n\
	adds r0, 0xC\n\
	adds r0, r1, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _0801927C\n\
	bl _08019F76\n\
_0801927C:\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0x3\n\
	bl __umodsi3\n\
	lsls r0, 16\n\
	cmp r0, 0\n\
	beq _08019294\n\
	bl _08019F76\n\
_08019294:\n\
	ldr r1, _080192D0 @ =gBattleCommunication\n\
	movs r0, 0x43\n\
	strb r0, [r1, 0x3]\n\
	bl b_movescr_stack_push_cursor\n\
	ldr r1, _080192D4 @ =gBattlescriptCurrInstr\n\
	ldr r0, _080192D8 @ =gUnknown_081D9950\n\
	str r0, [r1]\n\
	ldr r2, _080192DC @ =gHitMarker\n\
	ldr r0, [r2]\n\
	movs r1, 0x80\n\
	lsls r1, 6\n\
	orrs r0, r1\n\
	str r0, [r2]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_080192B4: .4byte gBattleMoveFlags\n\
_080192B8: .4byte gBattleMons\n\
_080192BC: .4byte gBankAttacker\n\
_080192C0: .4byte gProtectStructs\n\
_080192C4: .4byte gBattleMoves\n\
_080192C8: .4byte gSpecialStatuses\n\
_080192CC: .4byte gBankTarget\n\
_080192D0: .4byte gBattleCommunication\n\
_080192D4: .4byte gBattlescriptCurrInstr\n\
_080192D8: .4byte gUnknown_081D9950\n\
_080192DC: .4byte gHitMarker\n\
_080192E0:\n\
	ldr r0, _08019420 @ =gBattleMoveFlags\n\
	ldrb r1, [r0]\n\
	movs r0, 0x29\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080192F0\n\
	bl _08019F76\n\
_080192F0:\n\
	ldr r5, _08019424 @ =gBattleMons\n\
	ldr r7, _08019428 @ =gBankAttacker\n\
	ldrb r1, [r7]\n\
	movs r6, 0x58\n\
	adds r0, r1, 0\n\
	muls r0, r6\n\
	adds r0, r5\n\
	ldrh r0, [r0, 0x28]\n\
	cmp r0, 0\n\
	bne _08019308\n\
	bl _08019F76\n\
_08019308:\n\
	ldr r0, _0801942C @ =gProtectStructs\n\
	lsls r1, 4\n\
	adds r1, r0\n\
	ldrb r0, [r1, 0x1]\n\
	lsls r0, 31\n\
	cmp r0, 0\n\
	beq _0801931A\n\
	bl _08019F76\n\
_0801931A:\n\
	ldr r1, _08019430 @ =gBattleMoves\n\
	lsls r0, r3, 1\n\
	adds r0, r3\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	ldrb r1, [r0, 0x8]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _08019332\n\
	bl _08019F76\n\
_08019332:\n\
	ldr r3, _08019434 @ =gSpecialStatuses\n\
	ldr r0, _08019438 @ =gBankTarget\n\
	mov r8, r0\n\
	ldrb r1, [r0]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r2, r0, 2\n\
	adds r0, r3, 0\n\
	adds r0, 0x8\n\
	adds r0, r2, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _0801935C\n\
	adds r0, r3, 0\n\
	adds r0, 0xC\n\
	adds r0, r2, r0\n\
	ldr r0, [r0]\n\
	cmp r0, 0\n\
	bne _0801935C\n\
	bl _08019F76\n\
_0801935C:\n\
	adds r0, r1, 0\n\
	muls r0, r6\n\
	adds r0, r5\n\
	ldrh r0, [r0, 0x28]\n\
	cmp r0, 0\n\
	bne _0801936C\n\
	bl _08019F76\n\
_0801936C:\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0x3\n\
	bl __umodsi3\n\
	lsls r0, 16\n\
	cmp r0, 0\n\
	beq _08019384\n\
	bl _08019F76\n\
_08019384:\n\
	ldrb r0, [r7]\n\
	muls r0, r6\n\
	adds r0, r5\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	cmp r0, 0xC\n\
	bne _08019396\n\
	bl _08019F76\n\
_08019396:\n\
	ldr r0, [sp, 0x8]\n\
	ldr r1, [sp, 0x10]\n\
	bl GetGenderFromSpeciesAndPersonality\n\
	adds r4, r0, 0\n\
	ldr r0, [sp, 0xC]\n\
	ldr r1, [sp, 0x14]\n\
	bl GetGenderFromSpeciesAndPersonality\n\
	lsls r4, 24\n\
	lsls r0, 24\n\
	cmp r4, r0\n\
	bne _080193B4\n\
	bl _08019F76\n\
_080193B4:\n\
	ldrb r0, [r7]\n\
	muls r0, r6\n\
	adds r4, r5, 0\n\
	adds r4, 0x50\n\
	adds r0, r4\n\
	ldr r0, [r0]\n\
	movs r1, 0xF0\n\
	lsls r1, 12\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080193CE\n\
	bl _08019F76\n\
_080193CE:\n\
	ldr r0, [sp, 0x8]\n\
	ldr r1, [sp, 0x10]\n\
	bl GetGenderFromSpeciesAndPersonality\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0xFF\n\
	bne _080193E2\n\
	bl _08019F76\n\
_080193E2:\n\
	ldr r0, [sp, 0xC]\n\
	ldr r1, [sp, 0x14]\n\
	bl GetGenderFromSpeciesAndPersonality\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0xFF\n\
	bne _080193F6\n\
	bl _08019F76\n\
_080193F6:\n\
	ldrb r0, [r7]\n\
	adds r2, r0, 0\n\
	muls r2, r6\n\
	adds r2, r4\n\
	ldr r1, _0801943C @ =gBitTable\n\
	mov r3, r8\n\
	ldrb r0, [r3]\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	ldr r1, [r0]\n\
	lsls r1, 16\n\
	ldr r0, [r2]\n\
	orrs r0, r1\n\
	str r0, [r2]\n\
	bl b_movescr_stack_push_cursor\n\
	ldr r1, _08019440 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08019444 @ =gUnknown_081D9943\n\
	str r0, [r1]\n\
	bl _08019F22\n\
	.align 2, 0\n\
_08019420: .4byte gBattleMoveFlags\n\
_08019424: .4byte gBattleMons\n\
_08019428: .4byte gBankAttacker\n\
_0801942C: .4byte gProtectStructs\n\
_08019430: .4byte gBattleMoves\n\
_08019434: .4byte gSpecialStatuses\n\
_08019438: .4byte gBankTarget\n\
_0801943C: .4byte gBitTable\n\
_08019440: .4byte gBattlescriptCurrInstr\n\
_08019444: .4byte gUnknown_081D9943\n\
_08019448:\n\
	movs r5, 0\n\
	mov r10, r5\n\
	ldr r0, _0801947C @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r10, r0\n\
	bcc _08019458\n\
	bl _08019F76\n\
_08019458:\n\
	ldr r1, _08019480 @ =gBattleMons\n\
	movs r0, 0x58\n\
	mov r2, r10\n\
	muls r2, r0\n\
	adds r0, r2, 0\n\
	adds r0, r1\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	subs r0, 0x7\n\
	adds r2, r1, 0\n\
	cmp r0, 0x41\n\
	bls _08019472\n\
	b _080196D6\n\
_08019472:\n\
	lsls r0, 2\n\
	ldr r1, _08019484 @ =_08019488\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	mov pc, r0\n\
	.align 2, 0\n\
_0801947C: .4byte gNoOfAllBanks\n\
_08019480: .4byte gBattleMons\n\
_08019484: .4byte _08019488\n\
	.align 2, 0\n\
_08019488:\n\
	.4byte _080195EC\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196B0\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _08019614\n\
	.4byte _080196D6\n\
	.4byte _08019590\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080195BC\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _08019680\n\
	.4byte _08019650\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _080196D6\n\
	.4byte _08019614\n\
_08019590:\n\
	movs r0, 0x58\n\
	mov r3, r10\n\
	muls r3, r0\n\
	adds r0, r3, 0\n\
	adds r1, r2, 0\n\
	adds r1, 0x4C\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	ldr r1, _080195B0 @ =0x00000f88\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080195AA\n\
	b _080196D6\n\
_080195AA:\n\
	ldr r0, _080195B4 @ =gBattleTextBuff1\n\
	ldr r1, _080195B8 @ =gStatusConditionString_PoisonJpn\n\
	b _0801969C\n\
	.align 2, 0\n\
_080195B0: .4byte 0x00000f88\n\
_080195B4: .4byte gBattleTextBuff1\n\
_080195B8: .4byte gStatusConditionString_PoisonJpn\n\
_080195BC:\n\
	movs r0, 0x58\n\
	mov r1, r10\n\
	muls r1, r0\n\
	adds r0, r1, 0\n\
	adds r1, r2, 0\n\
	adds r1, 0x50\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	movs r1, 0x7\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080195D6\n\
	b _080196D6\n\
_080195D6:\n\
	ldr r0, _080195E4 @ =gBattleTextBuff1\n\
	ldr r1, _080195E8 @ =gStatusConditionString_ConfusionJpn\n\
	bl StringCopy\n\
	movs r2, 0x2\n\
	mov r9, r2\n\
	b _080196DC\n\
	.align 2, 0\n\
_080195E4: .4byte gBattleTextBuff1\n\
_080195E8: .4byte gStatusConditionString_ConfusionJpn\n\
_080195EC:\n\
	movs r0, 0x58\n\
	mov r3, r10\n\
	muls r3, r0\n\
	adds r0, r3, 0\n\
	adds r1, r2, 0\n\
	adds r1, 0x4C\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	movs r1, 0x40\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080196D6\n\
	ldr r0, _0801960C @ =gBattleTextBuff1\n\
	ldr r1, _08019610 @ =gStatusConditionString_ParalysisJpn\n\
	b _0801969C\n\
	.align 2, 0\n\
_0801960C: .4byte gBattleTextBuff1\n\
_08019610: .4byte gStatusConditionString_ParalysisJpn\n\
_08019614:\n\
	movs r0, 0x58\n\
	mov r3, r10\n\
	muls r3, r0\n\
	adds r0, r2, 0\n\
	adds r0, 0x4C\n\
	adds r0, r3, r0\n\
	ldr r0, [r0]\n\
	movs r1, 0x7\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080196D6\n\
	adds r2, 0x50\n\
	adds r2, r3, r2\n\
	ldr r0, [r2]\n\
	ldr r1, _08019644 @ =0xf7ffffff\n\
	ands r0, r1\n\
	str r0, [r2]\n\
	ldr r0, _08019648 @ =gBattleTextBuff1\n\
	ldr r1, _0801964C @ =gStatusConditionString_SleepJpn\n\
	bl StringCopy\n\
	movs r0, 0x1\n\
	mov r9, r0\n\
	b _080196DC\n\
	.align 2, 0\n\
_08019644: .4byte 0xf7ffffff\n\
_08019648: .4byte gBattleTextBuff1\n\
_0801964C: .4byte gStatusConditionString_SleepJpn\n\
_08019650:\n\
	movs r0, 0x58\n\
	mov r1, r10\n\
	muls r1, r0\n\
	adds r0, r1, 0\n\
	adds r1, r2, 0\n\
	adds r1, 0x4C\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	movs r1, 0x10\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080196D6\n\
	ldr r0, _08019678 @ =gBattleTextBuff1\n\
	ldr r1, _0801967C @ =gStatusConditionString_BurnJpn\n\
	bl StringCopy\n\
	movs r2, 0x1\n\
	mov r9, r2\n\
	b _080196DC\n\
	.align 2, 0\n\
_08019678: .4byte gBattleTextBuff1\n\
_0801967C: .4byte gStatusConditionString_BurnJpn\n\
_08019680:\n\
	movs r0, 0x58\n\
	mov r3, r10\n\
	muls r3, r0\n\
	adds r0, r3, 0\n\
	adds r1, r2, 0\n\
	adds r1, 0x4C\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	movs r1, 0x20\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080196D6\n\
	ldr r0, _080196A8 @ =gBattleTextBuff1\n\
	ldr r1, _080196AC @ =gStatusConditionString_IceJpn\n\
_0801969C:\n\
	bl StringCopy\n\
	movs r5, 0x1\n\
	mov r9, r5\n\
	b _080196DC\n\
	.align 2, 0\n\
_080196A8: .4byte gBattleTextBuff1\n\
_080196AC: .4byte gStatusConditionString_IceJpn\n\
_080196B0:\n\
	movs r0, 0x58\n\
	mov r1, r10\n\
	muls r1, r0\n\
	adds r0, r1, 0\n\
	adds r1, r2, 0\n\
	adds r1, 0x50\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	movs r1, 0xF0\n\
	lsls r1, 12\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080196D6\n\
	ldr r0, _080196EC @ =gBattleTextBuff1\n\
	ldr r1, _080196F0 @ =gStatusConditionString_LoveJpn\n\
	bl StringCopy\n\
	movs r2, 0x3\n\
	mov r9, r2\n\
_080196D6:\n\
	mov r3, r9\n\
	cmp r3, 0\n\
	beq _08019798\n\
_080196DC:\n\
	mov r5, r9\n\
	cmp r5, 0x2\n\
	beq _08019710\n\
	cmp r5, 0x2\n\
	bgt _080196F4\n\
	cmp r5, 0x1\n\
	beq _080196FC\n\
	b _0801973C\n\
	.align 2, 0\n\
_080196EC: .4byte gBattleTextBuff1\n\
_080196F0: .4byte gStatusConditionString_LoveJpn\n\
_080196F4:\n\
	mov r0, r9\n\
	cmp r0, 0x3\n\
	beq _08019728\n\
	b _0801973C\n\
_080196FC:\n\
	ldr r1, _0801970C @ =gBattleMons\n\
	movs r0, 0x58\n\
	mov r2, r10\n\
	muls r2, r0\n\
	adds r1, 0x4C\n\
	adds r2, r1\n\
	movs r0, 0\n\
	b _0801973A\n\
	.align 2, 0\n\
_0801970C: .4byte gBattleMons\n\
_08019710:\n\
	ldr r1, _08019724 @ =gBattleMons\n\
	movs r0, 0x58\n\
	mov r2, r10\n\
	muls r2, r0\n\
	adds r1, 0x50\n\
	adds r2, r1\n\
	ldr r0, [r2]\n\
	movs r1, 0x8\n\
	negs r1, r1\n\
	b _08019738\n\
	.align 2, 0\n\
_08019724: .4byte gBattleMons\n\
_08019728:\n\
	ldr r1, _08019778 @ =gBattleMons\n\
	movs r0, 0x58\n\
	mov r2, r10\n\
	muls r2, r0\n\
	adds r1, 0x50\n\
	adds r2, r1\n\
	ldr r0, [r2]\n\
	ldr r1, _0801977C @ =0xfff0ffff\n\
_08019738:\n\
	ands r0, r1\n\
_0801973A:\n\
	str r0, [r2]\n\
_0801973C:\n\
	bl b_movescr_stack_push_cursor\n\
	ldr r1, _08019780 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08019784 @ =gUnknown_081D9956\n\
	str r0, [r1]\n\
	ldr r0, _08019788 @ =0x02000000\n\
	ldr r1, _0801978C @ =0x00016003\n\
	adds r0, r1\n\
	mov r2, r10\n\
	strb r2, [r0]\n\
	ldr r4, _08019790 @ =gActiveBank\n\
	strb r2, [r4]\n\
	ldrb r1, [r4]\n\
	movs r0, 0x58\n\
	muls r0, r1\n\
	ldr r1, _08019794 @ =gUnknown_02024ACC\n\
	adds r0, r1\n\
	str r0, [sp]\n\
	movs r0, 0\n\
	movs r1, 0x28\n\
	movs r2, 0\n\
	movs r3, 0x4\n\
	bl EmitSetAttributes\n\
	ldrb r0, [r4]\n\
	bl MarkBufferBankForExecution\n\
	bl _08019F92\n\
	.align 2, 0\n\
_08019778: .4byte gBattleMons\n\
_0801977C: .4byte 0xfff0ffff\n\
_08019780: .4byte gBattlescriptCurrInstr\n\
_08019784: .4byte gUnknown_081D9956\n\
_08019788: .4byte 0x02000000\n\
_0801978C: .4byte 0x00016003\n\
_08019790: .4byte gActiveBank\n\
_08019794: .4byte gUnknown_02024ACC\n\
_08019798:\n\
	mov r0, r10\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r10, r0\n\
	ldr r0, _080197B0 @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r10, r0\n\
	bcs _080197AC\n\
	b _08019458\n\
_080197AC:\n\
	bl _08019F76\n\
	.align 2, 0\n\
_080197B0: .4byte gNoOfAllBanks\n\
_080197B4:\n\
	movs r3, 0\n\
	mov r10, r3\n\
	ldr r0, _080197FC @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r10, r0\n\
	bcc _080197C2\n\
	b _08019F76\n\
_080197C2:\n\
	ldr r4, _08019800 @ =gBattleMons\n\
_080197C4:\n\
	movs r0, 0x58\n\
	mov r5, r10\n\
	muls r5, r0\n\
	adds r0, r5, 0\n\
	adds r0, r4\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	cmp r0, 0x3B\n\
	bne _080197E8\n\
	mov r0, r10\n\
	bl CastformDataTypeChange\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
	cmp r0, 0\n\
	beq _080197E8\n\
	b _08019E40\n\
_080197E8:\n\
	mov r0, r10\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r10, r0\n\
	ldr r0, _080197FC @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r10, r0\n\
	bcc _080197C4\n\
	b _08019F76\n\
	.align 2, 0\n\
_080197FC: .4byte gNoOfAllBanks\n\
_08019800: .4byte gBattleMons\n\
_08019804:\n\
	mov r1, r8\n\
	ldrb r0, [r1]\n\
	cmp r0, 0x1C\n\
	beq _0801980E\n\
	b _08019F76\n\
_0801980E:\n\
	ldr r4, _08019860 @ =gHitMarker\n\
	ldr r1, [r4]\n\
	movs r0, 0x80\n\
	lsls r0, 7\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _0801981E\n\
	b _08019F76\n\
_0801981E:\n\
	ldr r0, _08019864 @ =0xffffbfff\n\
	ands r1, r0\n\
	str r1, [r4]\n\
	ldr r3, _08019868 @ =0x000160ca\n\
	adds r2, r7, r3\n\
	ldrb r1, [r2]\n\
	movs r0, 0x3F\n\
	ands r0, r1\n\
	strb r0, [r2]\n\
	cmp r0, 0x6\n\
	bne _08019838\n\
	movs r0, 0x2\n\
	strb r0, [r2]\n\
_08019838:\n\
	ldr r1, _0801986C @ =gBattleCommunication\n\
	ldrb r0, [r2]\n\
	adds r0, 0x40\n\
	strb r0, [r1, 0x3]\n\
	ldr r0, _08019870 @ =gBankTarget\n\
	ldrb r1, [r0]\n\
	ldr r5, _08019874 @ =0x00016003\n\
	adds r0, r7, r5\n\
	strb r1, [r0]\n\
	bl b_movescr_stack_push_cursor\n\
	ldr r1, _08019878 @ =gBattlescriptCurrInstr\n\
	ldr r0, _0801987C @ =gUnknown_081D9953\n\
	str r0, [r1]\n\
	ldr r0, [r4]\n\
	movs r1, 0x80\n\
	lsls r1, 6\n\
	orrs r0, r1\n\
	str r0, [r4]\n\
	b _08019F22\n\
	.align 2, 0\n\
_08019860: .4byte gHitMarker\n\
_08019864: .4byte 0xffffbfff\n\
_08019868: .4byte 0x000160ca\n\
_0801986C: .4byte gBattleCommunication\n\
_08019870: .4byte gBankTarget\n\
_08019874: .4byte 0x00016003\n\
_08019878: .4byte gBattlescriptCurrInstr\n\
_0801987C: .4byte gUnknown_081D9953\n\
_08019880:\n\
	mov r1, r8\n\
	ldrb r0, [r1]\n\
	cmp r0, 0x1C\n\
	beq _0801988A\n\
	b _08019F76\n\
_0801988A:\n\
	ldr r4, _080198DC @ =gHitMarker\n\
	ldr r1, [r4]\n\
	movs r0, 0x80\n\
	lsls r0, 7\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _0801989A\n\
	b _08019F76\n\
_0801989A:\n\
	ldr r0, _080198E0 @ =0xffffbfff\n\
	ands r1, r0\n\
	str r1, [r4]\n\
	ldr r3, _080198E4 @ =0x000160ca\n\
	adds r2, r7, r3\n\
	ldrb r1, [r2]\n\
	movs r0, 0x3F\n\
	ands r0, r1\n\
	strb r0, [r2]\n\
	cmp r0, 0x6\n\
	bne _080198B4\n\
	movs r0, 0x2\n\
	strb r0, [r2]\n\
_080198B4:\n\
	ldr r1, _080198E8 @ =gBattleCommunication\n\
	ldrb r0, [r2]\n\
	strb r0, [r1, 0x3]\n\
	ldr r0, _080198EC @ =gBankAttacker\n\
	ldrb r1, [r0]\n\
	ldr r5, _080198F0 @ =0x00016003\n\
	adds r0, r7, r5\n\
	strb r1, [r0]\n\
	bl b_movescr_stack_push_cursor\n\
	ldr r1, _080198F4 @ =gBattlescriptCurrInstr\n\
	ldr r0, _080198F8 @ =gUnknown_081D9953\n\
	str r0, [r1]\n\
	ldr r0, [r4]\n\
	movs r1, 0x80\n\
	lsls r1, 6\n\
	orrs r0, r1\n\
	str r0, [r4]\n\
	b _08019F22\n\
	.align 2, 0\n\
_080198DC: .4byte gHitMarker\n\
_080198E0: .4byte 0xffffbfff\n\
_080198E4: .4byte 0x000160ca\n\
_080198E8: .4byte gBattleCommunication\n\
_080198EC: .4byte gBankAttacker\n\
_080198F0: .4byte 0x00016003\n\
_080198F4: .4byte gBattlescriptCurrInstr\n\
_080198F8: .4byte gUnknown_081D9953\n\
_080198FC:\n\
	movs r4, 0\n\
	ldr r0, _08019934 @ =gNoOfAllBanks\n\
	ldrb r1, [r0]\n\
	cmp r4, r1\n\
	blt _08019908\n\
	b _08019F76\n\
_08019908:\n\
	ldr r0, _08019938 @ =gBattleMons\n\
	adds r5, r1, 0\n\
	ldr r2, _0801993C @ =gStatuses3\n\
	adds r3, r0, 0\n\
	adds r3, 0x20\n\
	movs r6, 0x80\n\
	lsls r6, 12\n\
_08019916:\n\
	ldrb r1, [r3]\n\
	cmp r1, 0x16\n\
	bne _08019926\n\
	ldr r0, [r2]\n\
	ands r0, r6\n\
	cmp r0, 0\n\
	beq _08019926\n\
	b _08019E6C\n\
_08019926:\n\
	adds r2, 0x4\n\
	adds r3, 0x58\n\
	adds r4, 0x1\n\
	cmp r4, r5\n\
	blt _08019916\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019934: .4byte gNoOfAllBanks\n\
_08019938: .4byte gBattleMons\n\
_0801993C: .4byte gStatuses3\n\
_08019940:\n\
	movs r4, 0\n\
	ldr r0, _08019A1C @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _0801994C\n\
	b _08019F76\n\
_0801994C:\n\
	ldr r0, _08019A20 @ =gActiveBank\n\
	mov r8, r0\n\
	ldr r1, _08019A24 @ =gBattleMons\n\
	adds r1, 0x20\n\
	str r1, [sp, 0x1C]\n\
	movs r2, 0\n\
	str r2, [sp, 0x20]\n\
_0801995A:\n\
	ldr r3, [sp, 0x1C]\n\
	ldrb r0, [r3]\n\
	cmp r0, 0x24\n\
	beq _08019964\n\
	b _08019AF6\n\
_08019964:\n\
	ldr r0, _08019A28 @ =gStatuses3\n\
	ldr r5, [sp, 0x20]\n\
	adds r0, r5, r0\n\
	ldr r1, [r0]\n\
	movs r0, 0x80\n\
	lsls r0, 13\n\
	ands r1, r0\n\
	str r5, [sp, 0x18]\n\
	cmp r1, 0\n\
	bne _0801997A\n\
	b _08019AF6\n\
_0801997A:\n\
	lsls r0, r4, 24\n\
	lsrs r0, 24\n\
	bl GetBankIdentity\n\
	movs r1, 0x1\n\
	adds r5, r0, 0\n\
	eors r5, r1\n\
	ands r5, r1\n\
	adds r0, r5, 0\n\
	bl GetBankByPlayerAI\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	adds r0, r5, 0x2\n\
	bl GetBankByPlayerAI\n\
	lsls r0, 24\n\
	lsrs r7, r0, 24\n\
	ldr r0, _08019A2C @ =gBattleTypeFlags\n\
	ldrh r1, [r0]\n\
	movs r2, 0x1\n\
	adds r0, r2, 0\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080199AE\n\
	b _08019ABC\n\
_080199AE:\n\
	movs r1, 0x58\n\
	adds r0, r6, 0\n\
	muls r0, r1\n\
	ldr r3, _08019A24 @ =gBattleMons\n\
	adds r1, r0, r3\n\
	adds r0, r1, 0\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	beq _08019A78\n\
	ldrh r0, [r1, 0x28]\n\
	cmp r0, 0\n\
	beq _08019A34\n\
	movs r1, 0x58\n\
	adds r0, r7, 0\n\
	muls r0, r1\n\
	adds r1, r0, r3\n\
	adds r0, r1, 0\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	beq _08019A34\n\
	ldrh r0, [r1, 0x28]\n\
	cmp r0, 0\n\
	beq _08019A34\n\
	str r2, [sp, 0x24]\n\
	bl Random\n\
	ldr r2, [sp, 0x24]\n\
	adds r1, r2, 0\n\
	ands r1, r0\n\
	lsls r1, 1\n\
	orrs r5, r1\n\
	adds r0, r5, 0\n\
	bl GetBankByPlayerAI\n\
	mov r2, r8\n\
	strb r0, [r2]\n\
	ldrb r0, [r2]\n\
	movs r3, 0x58\n\
	muls r0, r3\n\
	ldr r5, _08019A24 @ =gBattleMons\n\
	adds r0, r5\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	ldr r1, [sp, 0x1C]\n\
	strb r0, [r1]\n\
	ldrb r0, [r2]\n\
	muls r0, r3\n\
	adds r0, r5\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	ldr r2, _08019A30 @ =gLastUsedAbility\n\
	strb r0, [r2]\n\
	b _08019AE4\n\
	.align 2, 0\n\
_08019A1C: .4byte gNoOfAllBanks\n\
_08019A20: .4byte gActiveBank\n\
_08019A24: .4byte gBattleMons\n\
_08019A28: .4byte gStatuses3\n\
_08019A2C: .4byte gBattleTypeFlags\n\
_08019A30: .4byte gLastUsedAbility\n\
_08019A34:\n\
	ldr r3, _08019A74 @ =gBattleMons\n\
	movs r2, 0x58\n\
	adds r0, r6, 0\n\
	muls r0, r2\n\
	adds r1, r0, r3\n\
	adds r0, r1, 0\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	beq _08019A78\n\
	ldrh r0, [r1, 0x28]\n\
	cmp r0, 0\n\
	beq _08019A78\n\
	mov r5, r8\n\
	strb r6, [r5]\n\
	adds r1, r4, 0\n\
	muls r1, r2\n\
	adds r1, r3\n\
	ldrb r0, [r5]\n\
	muls r0, r2\n\
	adds r0, r3\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	adds r1, 0x20\n\
	strb r0, [r1]\n\
	ldrb r0, [r5]\n\
	muls r0, r2\n\
	adds r0, r3\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	b _08019AE0\n\
	.align 2, 0\n\
_08019A74: .4byte gBattleMons\n\
_08019A78:\n\
	ldr r3, _08019AB8 @ =gBattleMons\n\
	movs r2, 0x58\n\
	adds r0, r7, 0\n\
	muls r0, r2\n\
	adds r1, r0, r3\n\
	adds r0, r1, 0\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	beq _08019AEE\n\
	ldrh r0, [r1, 0x28]\n\
	cmp r0, 0\n\
	beq _08019AEE\n\
	mov r5, r8\n\
	strb r7, [r5]\n\
	adds r1, r4, 0\n\
	muls r1, r2\n\
	adds r1, r3\n\
	ldrb r0, [r5]\n\
	muls r0, r2\n\
	adds r0, r3\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	adds r1, 0x20\n\
	strb r0, [r1]\n\
	ldrb r0, [r5]\n\
	muls r0, r2\n\
	adds r0, r3\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	b _08019AE0\n\
	.align 2, 0\n\
_08019AB8: .4byte gBattleMons\n\
_08019ABC:\n\
	mov r2, r8\n\
	strb r6, [r2]\n\
	movs r3, 0x58\n\
	adds r0, r6, 0\n\
	muls r0, r3\n\
	ldr r5, _08019B10 @ =gBattleMons\n\
	adds r0, r5\n\
	adds r2, r0, 0\n\
	adds r2, 0x20\n\
	ldrb r1, [r2]\n\
	cmp r1, 0\n\
	beq _08019AEE\n\
	ldrh r0, [r0, 0x28]\n\
	cmp r0, 0\n\
	beq _08019AEE\n\
	ldr r0, [sp, 0x1C]\n\
	strb r1, [r0]\n\
	ldrb r0, [r2]\n\
_08019AE0:\n\
	ldr r1, _08019B14 @ =gLastUsedAbility\n\
	strb r0, [r1]\n\
_08019AE4:\n\
	mov r0, r9\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_08019AEE:\n\
	mov r2, r9\n\
	cmp r2, 0\n\
	beq _08019AF6\n\
	b _08019E88\n\
_08019AF6:\n\
	ldr r3, [sp, 0x1C]\n\
	adds r3, 0x58\n\
	str r3, [sp, 0x1C]\n\
	ldr r5, [sp, 0x20]\n\
	adds r5, 0x4\n\
	str r5, [sp, 0x20]\n\
	adds r4, 0x1\n\
	ldr r0, _08019B18 @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	bge _08019B0E\n\
	b _0801995A\n\
_08019B0E:\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019B10: .4byte gBattleMons\n\
_08019B14: .4byte gLastUsedAbility\n\
_08019B18: .4byte gNoOfAllBanks\n\
_08019B1C:\n\
	movs r4, 0\n\
	ldr r0, _08019B54 @ =gNoOfAllBanks\n\
	ldrb r1, [r0]\n\
	cmp r4, r1\n\
	blt _08019B28\n\
	b _08019F76\n\
_08019B28:\n\
	ldr r0, _08019B58 @ =gBattleMons\n\
	adds r5, r1, 0\n\
	ldr r2, _08019B5C @ =gStatuses3\n\
	adds r3, r0, 0\n\
	adds r3, 0x20\n\
	movs r6, 0x80\n\
	lsls r6, 12\n\
_08019B36:\n\
	ldrb r1, [r3]\n\
	cmp r1, 0x16\n\
	bne _08019B46\n\
	ldr r0, [r2]\n\
	ands r0, r6\n\
	cmp r0, 0\n\
	beq _08019B46\n\
	b _08019F04\n\
_08019B46:\n\
	adds r2, 0x4\n\
	adds r3, 0x58\n\
	adds r4, 0x1\n\
	cmp r4, r5\n\
	blt _08019B36\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019B54: .4byte gNoOfAllBanks\n\
_08019B58: .4byte gBattleMons\n\
_08019B5C: .4byte gStatuses3\n\
_08019B60:\n\
	mov r0, r10\n\
	bl GetBankSide\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	movs r4, 0\n\
	ldr r0, _08019BB0 @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019B76\n\
	b _08019F76\n\
_08019B76:\n\
	ldr r7, _08019BB4 @ =gBattleMons\n\
_08019B78:\n\
	lsls r0, r4, 24\n\
	lsrs r0, 24\n\
	bl GetBankSide\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	adds r3, r4, 0x1\n\
	cmp r0, r5\n\
	beq _08019BA2\n\
	movs r0, 0x58\n\
	muls r0, r4\n\
	adds r0, r7\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	cmp r0, r6\n\
	bne _08019BA2\n\
	ldr r0, _08019BB8 @ =gLastUsedAbility\n\
	strb r6, [r0]\n\
	lsls r0, r3, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_08019BA2:\n\
	adds r4, r3, 0\n\
	ldr r0, _08019BB0 @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019B78\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019BB0: .4byte gNoOfAllBanks\n\
_08019BB4: .4byte gBattleMons\n\
_08019BB8: .4byte gLastUsedAbility\n\
_08019BBC:\n\
	mov r0, r10\n\
	bl GetBankSide\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	movs r4, 0\n\
	ldr r0, _08019C0C @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019BD2\n\
	b _08019F76\n\
_08019BD2:\n\
	ldr r7, _08019C10 @ =gBattleMons\n\
_08019BD4:\n\
	lsls r0, r4, 24\n\
	lsrs r0, 24\n\
	bl GetBankSide\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	adds r3, r4, 0x1\n\
	cmp r0, r5\n\
	bne _08019BFE\n\
	movs r0, 0x58\n\
	muls r0, r4\n\
	adds r0, r7\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	cmp r0, r6\n\
	bne _08019BFE\n\
	ldr r0, _08019C14 @ =gLastUsedAbility\n\
	strb r6, [r0]\n\
	lsls r0, r3, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_08019BFE:\n\
	adds r4, r3, 0\n\
	ldr r0, _08019C0C @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019BD4\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019C0C: .4byte gNoOfAllBanks\n\
_08019C10: .4byte gBattleMons\n\
_08019C14: .4byte gLastUsedAbility\n\
_08019C18:\n\
	mov r1, r8\n\
	ldrb r0, [r1]\n\
	cmp r0, 0xFD\n\
	beq _08019C40\n\
	cmp r0, 0xFE\n\
	beq _08019C78\n\
	movs r4, 0\n\
	ldr r0, _08019C38 @ =gNoOfAllBanks\n\
	adds r5, r0, 0\n\
	ldrb r2, [r5]\n\
	cmp r4, r2\n\
	blt _08019C32\n\
	b _08019F76\n\
_08019C32:\n\
	ldr r2, _08019C3C @ =gBattleMons\n\
	b _08019CB0\n\
	.align 2, 0\n\
_08019C38: .4byte gNoOfAllBanks\n\
_08019C3C: .4byte gBattleMons\n\
_08019C40:\n\
	movs r4, 0\n\
	ldr r0, _08019C70 @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019C4C\n\
	b _08019F76\n\
_08019C4C:\n\
	ldr r5, _08019C74 @ =gStatuses3\n\
	movs r2, 0x80\n\
	lsls r2, 9\n\
	adds r1, r0, 0\n\
_08019C54:\n\
	lsls r0, r4, 2\n\
	adds r0, r5\n\
	ldr r0, [r0]\n\
	ands r0, r2\n\
	adds r3, r4, 0x1\n\
	cmp r0, 0\n\
	beq _08019C68\n\
	lsls r0, r3, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_08019C68:\n\
	adds r4, r3, 0\n\
	cmp r4, r1\n\
	blt _08019C54\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019C70: .4byte gNoOfAllBanks\n\
_08019C74: .4byte gStatuses3\n\
_08019C78:\n\
	movs r4, 0\n\
	ldr r0, _08019CA8 @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019C84\n\
	b _08019F76\n\
_08019C84:\n\
	ldr r5, _08019CAC @ =gStatuses3\n\
	movs r2, 0x80\n\
	lsls r2, 10\n\
	adds r1, r0, 0\n\
_08019C8C:\n\
	lsls r0, r4, 2\n\
	adds r0, r5\n\
	ldr r0, [r0]\n\
	ands r0, r2\n\
	adds r3, r4, 0x1\n\
	cmp r0, 0\n\
	beq _08019CA0\n\
	lsls r0, r3, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_08019CA0:\n\
	adds r4, r3, 0\n\
	cmp r4, r1\n\
	blt _08019C8C\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019CA8: .4byte gNoOfAllBanks\n\
_08019CAC: .4byte gStatuses3\n\
_08019CB0:\n\
	movs r0, 0x58\n\
	muls r0, r4\n\
	adds r0, r2\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	adds r3, r4, 0x1\n\
	cmp r0, r6\n\
	bne _08019CCA\n\
	mov r0, r8\n\
	strb r6, [r0]\n\
	lsls r0, r3, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_08019CCA:\n\
	adds r4, r3, 0\n\
	ldrb r1, [r5]\n\
	cmp r4, r1\n\
	blt _08019CB0\n\
	b _08019F76\n\
_08019CD4:\n\
	movs r4, 0\n\
	ldr r0, _08019D10 @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019CE0\n\
	b _08019F76\n\
_08019CE0:\n\
	ldr r7, _08019D14 @ =gBattleMons\n\
	adds r2, r0, 0\n\
	movs r5, 0x58\n\
_08019CE6:\n\
	adds r0, r4, 0\n\
	muls r0, r5\n\
	adds r1, r0, r7\n\
	adds r0, r1, 0\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	adds r3, r4, 0x1\n\
	cmp r0, r6\n\
	bne _08019D08\n\
	ldrh r0, [r1, 0x28]\n\
	cmp r0, 0\n\
	beq _08019D08\n\
	mov r0, r8\n\
	strb r6, [r0]\n\
	lsls r0, r3, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_08019D08:\n\
	adds r4, r3, 0\n\
	cmp r4, r2\n\
	blt _08019CE6\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019D10: .4byte gNoOfAllBanks\n\
_08019D14: .4byte gBattleMons\n\
_08019D18:\n\
	movs r4, 0\n\
	ldr r0, _08019D50 @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019D24\n\
	b _08019F76\n\
_08019D24:\n\
	ldr r7, _08019D54 @ =gBattleMons\n\
	adds r1, r0, 0\n\
	movs r5, 0x58\n\
	ldr r2, _08019D58 @ =gLastUsedAbility\n\
_08019D2C:\n\
	adds r0, r4, 0\n\
	muls r0, r5\n\
	adds r0, r7\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	adds r3, r4, 0x1\n\
	cmp r0, r6\n\
	bne _08019D48\n\
	cmp r4, r10\n\
	beq _08019D48\n\
	strb r6, [r2]\n\
	lsls r0, r3, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_08019D48:\n\
	adds r4, r3, 0\n\
	cmp r4, r1\n\
	blt _08019D2C\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019D50: .4byte gNoOfAllBanks\n\
_08019D54: .4byte gBattleMons\n\
_08019D58: .4byte gLastUsedAbility\n\
_08019D5C:\n\
	mov r0, r10\n\
	bl GetBankSide\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	movs r4, 0\n\
	ldr r0, _08019DAC @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019D72\n\
	b _08019F76\n\
_08019D72:\n\
	ldr r7, _08019DB0 @ =gBattleMons\n\
_08019D74:\n\
	lsls r0, r4, 24\n\
	lsrs r0, 24\n\
	bl GetBankSide\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, r5\n\
	beq _08019DA0\n\
	movs r0, 0x58\n\
	muls r0, r4\n\
	adds r0, r7\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	cmp r0, r6\n\
	bne _08019DA0\n\
	ldr r0, _08019DB4 @ =gLastUsedAbility\n\
	strb r6, [r0]\n\
	mov r0, r9\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_08019DA0:\n\
	adds r4, 0x1\n\
	ldr r0, _08019DAC @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019D74\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019DAC: .4byte gNoOfAllBanks\n\
_08019DB0: .4byte gBattleMons\n\
_08019DB4: .4byte gLastUsedAbility\n\
_08019DB8:\n\
	mov r0, r10\n\
	bl GetBankSide\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	movs r4, 0\n\
	ldr r0, _08019E08 @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019DCE\n\
	b _08019F76\n\
_08019DCE:\n\
	ldr r7, _08019E0C @ =gBattleMons\n\
_08019DD0:\n\
	lsls r0, r4, 24\n\
	lsrs r0, 24\n\
	bl GetBankSide\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, r5\n\
	bne _08019DFC\n\
	movs r0, 0x58\n\
	muls r0, r4\n\
	adds r0, r7\n\
	adds r0, 0x20\n\
	ldrb r0, [r0]\n\
	cmp r0, r6\n\
	bne _08019DFC\n\
	ldr r0, _08019E10 @ =gLastUsedAbility\n\
	strb r6, [r0]\n\
	mov r0, r9\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_08019DFC:\n\
	adds r4, 0x1\n\
	ldr r0, _08019E08 @ =gNoOfAllBanks\n\
	ldrb r0, [r0]\n\
	cmp r4, r0\n\
	blt _08019DD0\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019E08: .4byte gNoOfAllBanks\n\
_08019E0C: .4byte gBattleMons\n\
_08019E10: .4byte gLastUsedAbility\n\
_08019E14:\n\
	ldr r0, _08019E30 @ =gUnknown_081D977D\n\
	bl b_push_move_exec\n\
	ldr r0, _08019E34 @ =0x02000000\n\
	ldr r2, _08019E38 @ =0x00016003\n\
	adds r1, r0, r2\n\
	strb r6, [r1]\n\
	mov r1, r9\n\
	subs r1, 0x1\n\
	ldr r3, _08019E3C @ =0x0001609b\n\
	adds r0, r3\n\
	strb r1, [r0]\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019E30: .4byte gUnknown_081D977D\n\
_08019E34: .4byte 0x02000000\n\
_08019E38: .4byte 0x00016003\n\
_08019E3C: .4byte 0x0001609b\n\
_08019E40:\n\
	ldr r0, _08019E5C @ =gUnknown_081D977D\n\
	bl b_push_move_exec\n\
	ldr r0, _08019E60 @ =0x02000000\n\
	ldr r5, _08019E64 @ =0x00016003\n\
	adds r1, r0, r5\n\
	mov r2, r10\n\
	strb r2, [r1]\n\
	mov r1, r9\n\
	subs r1, 0x1\n\
	ldr r3, _08019E68 @ =0x0001609b\n\
	adds r0, r3\n\
	strb r1, [r0]\n\
	b _08019F92\n\
	.align 2, 0\n\
_08019E5C: .4byte gUnknown_081D977D\n\
_08019E60: .4byte 0x02000000\n\
_08019E64: .4byte 0x00016003\n\
_08019E68: .4byte 0x0001609b\n\
_08019E6C:\n\
	mov r5, r8\n\
	strb r1, [r5]\n\
	ldr r0, [r2]\n\
	ldr r1, _08019E80 @ =0xfff7ffff\n\
	ands r0, r1\n\
	str r0, [r2]\n\
	ldr r0, _08019E84 @ =gUnknown_081D978C\n\
	bl b_push_move_exec\n\
	b _08019F1A\n\
	.align 2, 0\n\
_08019E80: .4byte 0xfff7ffff\n\
_08019E84: .4byte gUnknown_081D978C\n\
_08019E88:\n\
	ldr r0, _08019EDC @ =gUnknown_081D9726\n\
	bl b_push_move_exec\n\
	ldr r1, _08019EE0 @ =gStatuses3\n\
	ldr r2, [sp, 0x18]\n\
	adds r1, r2, r1\n\
	ldr r0, [r1]\n\
	ldr r2, _08019EE4 @ =0xffefffff\n\
	ands r0, r2\n\
	str r0, [r1]\n\
	ldr r0, _08019EE8 @ =0x02000000\n\
	ldr r3, _08019EEC @ =0x00016003\n\
	adds r0, r3\n\
	strb r4, [r0]\n\
	ldr r1, _08019EF0 @ =gBattleTextBuff1\n\
	movs r4, 0xFD\n\
	strb r4, [r1]\n\
	movs r0, 0x4\n\
	strb r0, [r1, 0x1]\n\
	ldr r2, _08019EF4 @ =gActiveBank\n\
	ldrb r0, [r2]\n\
	strb r0, [r1, 0x2]\n\
	ldr r3, _08019EF8 @ =gBattlePartyID\n\
	ldrb r0, [r2]\n\
	lsls r0, 1\n\
	adds r0, r3\n\
	ldrh r0, [r0]\n\
	strb r0, [r1, 0x3]\n\
	movs r0, 0xFF\n\
	strb r0, [r1, 0x4]\n\
	ldr r1, _08019EFC @ =gBattleTextBuff2\n\
	strb r4, [r1]\n\
	movs r0, 0x9\n\
	strb r0, [r1, 0x1]\n\
	ldr r0, _08019F00 @ =gLastUsedAbility\n\
	ldrb r0, [r0]\n\
	strb r0, [r1, 0x2]\n\
	movs r0, 0x1\n\
	negs r0, r0\n\
	strb r0, [r1, 0x3]\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019EDC: .4byte gUnknown_081D9726\n\
_08019EE0: .4byte gStatuses3\n\
_08019EE4: .4byte 0xffefffff\n\
_08019EE8: .4byte 0x02000000\n\
_08019EEC: .4byte 0x00016003\n\
_08019EF0: .4byte gBattleTextBuff1\n\
_08019EF4: .4byte gActiveBank\n\
_08019EF8: .4byte gBattlePartyID\n\
_08019EFC: .4byte gBattleTextBuff2\n\
_08019F00: .4byte gLastUsedAbility\n\
_08019F04:\n\
	mov r5, r8\n\
	strb r1, [r5]\n\
	ldr r0, [r2]\n\
	ldr r1, _08019F30 @ =0xfff7ffff\n\
	ands r0, r1\n\
	str r0, [r2]\n\
	bl b_movescr_stack_push_cursor\n\
	ldr r1, _08019F34 @ =gBattlescriptCurrInstr\n\
	ldr r0, _08019F38 @ =gUnknown_081D9795\n\
	str r0, [r1]\n\
_08019F1A:\n\
	ldr r0, _08019F3C @ =0x02000000\n\
	ldr r1, _08019F40 @ =0x000160dd\n\
	adds r0, r1\n\
	strb r4, [r0]\n\
_08019F22:\n\
	mov r0, r9\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
	b _08019F76\n\
	.align 2, 0\n\
_08019F30: .4byte 0xfff7ffff\n\
_08019F34: .4byte gBattlescriptCurrInstr\n\
_08019F38: .4byte gUnknown_081D9795\n\
_08019F3C: .4byte 0x02000000\n\
_08019F40: .4byte 0x000160dd\n\
_08019F44:\n\
	movs r4, 0\n\
	ldr r0, _08019FA4 @ =gNoOfAllBanks\n\
	ldrb r1, [r0]\n\
	cmp r4, r1\n\
	bge _08019F76\n\
	ldr r0, _08019FA8 @ =gBattleMons\n\
	adds r2, r1, 0\n\
	adds r1, r0, 0\n\
	adds r1, 0x20\n\
	ldr r3, _08019FAC @ =gLastUsedAbility\n\
_08019F58:\n\
	ldrb r0, [r1]\n\
	cmp r0, r6\n\
	bne _08019F6E\n\
	cmp r4, r10\n\
	beq _08019F6E\n\
	strb r6, [r3]\n\
	mov r0, r9\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r9, r0\n\
_08019F6E:\n\
	adds r1, 0x58\n\
	adds r4, 0x1\n\
	cmp r4, r2\n\
	blt _08019F58\n\
_08019F76:\n\
	mov r2, r9\n\
	cmp r2, 0\n\
	beq _08019F92\n\
_08019F7C:\n\
	ldr r3, [sp, 0x4]\n\
	cmp r3, 0xB\n\
	bhi _08019F92\n\
	ldr r1, _08019FAC @ =gLastUsedAbility\n\
	ldrb r0, [r1]\n\
	cmp r0, 0xFF\n\
	beq _08019F92\n\
	adds r1, r0, 0\n\
	mov r0, r10\n\
	bl RecordAbilityBattle\n\
_08019F92:\n\
	mov r0, r9\n\
	add sp, 0x28\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r1}\n\
	bx r1\n\
	.align 2, 0\n\
_08019FA4: .4byte gNoOfAllBanks\n\
_08019FA8: .4byte gBattleMons\n\
_08019FAC: .4byte gLastUsedAbility\n\
        .syntax divided");
}

#endif // NONMATCHING

void b_call_bc_move_exec(u8* BS_ptr)
{
    gBattlescriptCurrInstr = BS_ptr;
    B_FUNCTION_STACK->ptr[B_FUNCTION_STACK->size++] = gBattleMainFunc;
    gBattleMainFunc = sub_8013F54;
    gFightStateTracker = 0;
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

s8 sub_8040A7C(u32 pid, u8 flavor); // get poke flavor relation

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
                b_call_bc_move_exec(gUnknown_081D9A5E);
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
                    b_call_bc_move_exec(gUnknown_081D9A74);
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
                        b_call_bc_move_exec(gUnknown_081D9A91);
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
                    b_call_bc_move_exec(gUnknown_081D9A5E);
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
                    b_call_bc_move_exec(gUnknown_081D9AA1);
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
                    if (sub_8040A7C(gBattleMons[bank].personality, FLAVOR_SPICY) < 0)
                        b_call_bc_move_exec(gUnknown_081D9AD4);
                    else
                        b_call_bc_move_exec(gUnknown_081D9A74);
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
                    if (sub_8040A7C(gBattleMons[bank].personality, FLAVOR_DRY) < 0)
                        b_call_bc_move_exec(gUnknown_081D9AD4);
                    else
                        b_call_bc_move_exec(gUnknown_081D9A74);
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
                    if (sub_8040A7C(gBattleMons[bank].personality, FLAVOR_SWEET) < 0)
                        b_call_bc_move_exec(gUnknown_081D9AD4);
                    else
                        b_call_bc_move_exec(gUnknown_081D9A74);
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
                    if (sub_8040A7C(gBattleMons[bank].personality, FLAVOR_BITTER) < 0)
                        b_call_bc_move_exec(gUnknown_081D9AD4);
                    else
                        b_call_bc_move_exec(gUnknown_081D9A74);
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
                    if (sub_8040A7C(gBattleMons[bank].personality, FLAVOR_SOUR) < 0)
                        b_call_bc_move_exec(gUnknown_081D9AD4);
                    else
                        b_call_bc_move_exec(gUnknown_081D9A74);
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
                    b_call_bc_move_exec(gUnknown_081D9AFE);
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
                    b_call_bc_move_exec(gUnknown_081D9AFE);
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
                    b_call_bc_move_exec(gUnknown_081D9AFE);
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
                    b_call_bc_move_exec(gUnknown_081D9AFE);
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
                    b_call_bc_move_exec(gUnknown_081D9AFE);
                    effect = ITEM_STATS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CRITICAL_UP:
                if (gBattleMons[bank].hp <= gBattleMons[bank].maxHP / bankQuality && !moveTurn && !(gBattleMons[bank].status2 & STATUS2_FOCUS_ENERGY))
                {
                    gBattleMons[bank].status2 |= STATUS2_FOCUS_ENERGY;
                    b_call_bc_move_exec(gUnknown_081D9B19);
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
                        b_call_bc_move_exec(gUnknown_081D9AFE);
                        effect = ITEM_STATS_CHANGE;
                    }
                }
                break;
            case HOLD_EFFECT_CURE_PAR:
                if (gBattleMons[bank].status1 & STATUS_PARALYSIS)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_PARALYSIS);
                    b_call_bc_move_exec(gUnknown_081D99B6);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_PSN:
                if (gBattleMons[bank].status1 & STATUS_PSN_ANY)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_PSN_ANY | STATUS_TOXIC_COUNTER);
                    b_call_bc_move_exec(gUnknown_081D99CE);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_BRN:
                if (gBattleMons[bank].status1 & STATUS_BURN)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_BURN);
                    b_call_bc_move_exec(gUnknown_081D99E6);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_FRZ:
                if (gBattleMons[bank].status1 & STATUS_FREEZE)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_FREEZE);
                    b_call_bc_move_exec(gUnknown_081D99FE);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_SLP:
                if (gBattleMons[bank].status1 & STATUS_SLEEP)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_SLEEP);
                    gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE);
                    b_call_bc_move_exec(gUnknown_081D9A16);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_CONFUSION:
                if (gBattleMons[bank].status2 & STATUS2_CONFUSION)
                {
                    gBattleMons[bank].status2 &= ~(STATUS2_CONFUSION);
                    b_call_bc_move_exec(gUnknown_081D9A2E);
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
                    b_call_bc_move_exec(gUnknown_081D9A44);
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_ATTRACT:
                if (gBattleMons[bank].status2 & STATUS2_INFATUATION)
                {
                    gBattleMons[bank].status2 &= ~(STATUS2_INFATUATION);
                    StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
                    b_call_bc_move_exec(gUnknown_081D9A44);
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
                    gBattlescriptCurrInstr = gUnknown_081D99BC;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_PSN:
                if (gBattleMons[bank].status1 & STATUS_PSN_ANY)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_PSN_ANY | STATUS_TOXIC_COUNTER);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = gUnknown_081D99D4;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_BRN:
                if (gBattleMons[bank].status1 & STATUS_BURN)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_BURN);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = gUnknown_081D99EC;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_FRZ:
                if (gBattleMons[bank].status1 & STATUS_FREEZE)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_FREEZE);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = gUnknown_081D9A04;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_SLP:
                if (gBattleMons[bank].status1 & STATUS_SLEEP)
                {
                    gBattleMons[bank].status1 &= ~(STATUS_SLEEP);
                    gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = gUnknown_081D9A1C;
                    effect = ITEM_STATUS_CHANGE;
                }
                break;
            case HOLD_EFFECT_CURE_CONFUSION:
                if (gBattleMons[bank].status2 & STATUS2_CONFUSION)
                {
                    gBattleMons[bank].status2 &= ~(STATUS2_CONFUSION);
                    b_movescr_stack_push_cursor();
                    gBattlescriptCurrInstr = gUnknown_081D9A34;
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
                    gBattlescriptCurrInstr = gUnknown_081D9A4A;
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
                    gBattlescriptCurrInstr = gUnknown_081D9A4A;
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
                    gBattlescriptCurrInstr = gUnknown_081D9A64;
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
                    gBattlescriptCurrInstr = gUnknown_081D9AA7;
                    effect++;
                }
                break;
            }
        }
        break;
    }

    return effect;
}
