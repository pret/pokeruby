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
extern s32 gBattleMoveDamage;

u8 IsImprisoned(u8 bank, u16 move);
u8 GetBankByPlayerAI(u8 ID);
u8 GetBankIdentity(u8 bank);
u8 GetBankSide(u8 bank);
void b_call_bc_move_exec(u8* BS_ptr);
bool8 sub_8015660(u8 bank); //check if a move failed
void SetMoveEffect(bool8 primary, u8 certainArg);
bool8 sub_8025A44(u8 bank); //uproar wakeup check

extern u8 BattleScript_MoveSelectionDisabledMove[];
extern u8 BattleScript_MoveSelectionTormented[];
extern u8 BattleScript_MoveSelectionTaunted[];
extern u8 BattleScript_MoveSelectionImprisoned[];
extern u8 BattleScript_MoveSelectionChoiceBanded[];
extern u8 BattleScript_MoveSelectionNoPP[];
extern u8 BattleScript_NoMovesLeft[];
extern u8 BattleScript_WishComesTrue[];
extern u8 gUnknown_081D9030[];
extern u8 gUnknown_081D8F62[];
extern u8 gUnknown_081D8FFF[];
extern u8 gUnknown_081D8F7D[];
extern u8 gUnknown_081D9016[];
extern u8 gUnknown_081D9008[];
extern u8 gUnknown_081D9041[];

extern u8 gUnknown_081D93D1[]; //ingrain bs
extern u8 gUnknown_081D904B[]; //leech seed BS
extern u8 gUnknown_081D9518[]; //poison dmg BS
extern u8 gUnknown_081D953A[]; //burn dmg BS
extern u8 gUnknown_081D9613[]; //nightmare dmg BS
extern u8 gUnknown_081D9624[]; //curse dmg BS
extern u8 gUnknown_081D95E2[]; //wrap dmg BS
extern u8 gUnknown_081D95F4[]; //wrap ends BS
extern u8 gUnknown_081D950F[]; //uproar wakeup BS
extern u8 gUnknown_081D957E[]; //uproar BS
extern u8 gUnknown_081D9587[]; //thrash confusion BS
extern u8 gUnknown_081D9148[]; //disabled no more BS
extern u8 gUnknown_081D914F[]; //encored no more BS
extern u8 gUnknown_081D964C[]; //yawn sleep BS

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

bool8 TurnBasedEffects(void)
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
            int i;
            switch (BATTLE_STRUCT->turnEffectsTracker)
            {
            case 0: //ingrain
                if (gStatuses3[gActiveBank] & STATUS3_ROOTED && gBattleMons[gActiveBank].hp != gBattleMons[gActiveBank].maxHP && gBattleMons[gActiveBank].hp != 0)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 16;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    gBattleMoveDamage *= -1;
                    b_call_bc_move_exec(gUnknown_081D93D1);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 1: //end turn abilities
                if (AbilityBattleEffects(ABILITYEFFECT_ENDTURN, gActiveBank, 0, 0, 0))
                    effect++;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 2: //item effects
                if (ItemBattleEffects(0, gActiveBank, 0))
                    effect++;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 18: //item effects again
                if (ItemBattleEffects(1, gActiveBank, 1))
                    effect++;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 3: //leech seed
                {
                    u8 leecher;
                    if (gStatuses3[gActiveBank] & STATUS3_LEECHSEED && gBattleMons[leecher = (gStatuses3[gActiveBank] & STATUS3_LEECHSEED_BANK)].hp && gBattleMons[gActiveBank].hp) //wont match without this ugly leecher assignment
                    {
                        //u8 leecher = gStatuses3[gActiveBank] & STATUS3_LEECHSEED_BANK;
                        gBankTarget = leecher; //funny how the 'target' is actually the bank that receives HP
                        gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 8;
                        if (gBattleMoveDamage == 0)
                            gBattleMoveDamage = 1;
                        BATTLE_STRUCT->animArg1 = leecher;
                        BATTLE_STRUCT->animArg2 = gBankAttacker;
                        b_call_bc_move_exec(gUnknown_081D904B);
                        effect++;
                    }
                    BATTLE_STRUCT->turnEffectsTracker++;
                }
                break;
            case 4: //poison
                if (gBattleMons[gActiveBank].status1 & STATUS_POISON && gBattleMons[gActiveBank].hp)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 8;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    b_call_bc_move_exec(gUnknown_081D9518);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 5: //toxic poison
                if (gBattleMons[gActiveBank].status1 & STATUS_TOXIC_POISON && gBattleMons[gActiveBank].hp)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 16;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    if ((gBattleMons[gActiveBank].status1 & 0xF00) != 0xF00) //not 16 turns
                        gBattleMons[gActiveBank].status1 += 0x100;
                    gBattleMoveDamage *= (gBattleMons[gActiveBank].status1 & 0xF00) >> 8;
                    b_call_bc_move_exec(gUnknown_081D9518);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 6: //burn
                if (gBattleMons[gActiveBank].status1 & STATUS_BURN && gBattleMons[gActiveBank].hp)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 8;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    b_call_bc_move_exec(gUnknown_081D953A);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 7: //spooky nightmares
                if (gBattleMons[gActiveBank].status2 & STATUS2_NIGHTMARE && gBattleMons[gActiveBank].hp)
                {
                    //missing sleep check
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 4;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    b_call_bc_move_exec(gUnknown_081D9613);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 8: //curse
                if (gBattleMons[gActiveBank].status2 & STATUS2_CURSED && gBattleMons[gActiveBank].hp)
                {
                    gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 4;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    b_call_bc_move_exec(gUnknown_081D9624);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 9: //wrap
                if (gBattleMons[gActiveBank].status2 & STATUS2_WRAPPED && gBattleMons[gActiveBank].hp)
                {
                    gBattleMons[gActiveBank].status2 &= 0xFFFFE000; //hmmm
                    if (gBattleMons[gActiveBank].status2 & STATUS2_WRAPPED) //damaged by wrap
                    {
                        BATTLE_STRUCT->animArg1 = ewram[gActiveBank * 2 + 0x16004];
                        BATTLE_STRUCT->animArg2 = ewram[gActiveBank * 2 + 0x16005];
                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 2;
                        gBattleTextBuff1[2] = ewram[gActiveBank * 2 + 0x16004];
                        gBattleTextBuff1[3] = ewram[gActiveBank * 2 + 0x16005];
                        gBattleTextBuff1[4] = 0xFF;
                        gBattlescriptCurrInstr = gUnknown_081D95E2;
                        gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / 16;
                        if (gBattleMoveDamage == 0)
                            gBattleMoveDamage = 1;
                    }
                    else //broke free
                    {
                        gBattleTextBuff1[0] = 0xFD;
                        gBattleTextBuff1[1] = 2;
                        gBattleTextBuff1[2] = ewram[gActiveBank * 2 + 0x16004];
                        gBattleTextBuff1[3] = ewram[gActiveBank * 2 + 0x16005];
                        gBattleTextBuff1[4] = 0xFF;
                        gBattlescriptCurrInstr = gUnknown_081D95F4;
                    }
                    b_call_bc_move_exec(gBattlescriptCurrInstr);
                    effect++;
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 10: //uproar
                if (gBattleMons[gActiveBank].status2 & STATUS2_UPROAR)
                {
                    for (gBankAttacker = 0; gBankAttacker < gNoOfAllBanks; gBankAttacker++)
                    {
                        if (gBattleMons[gBankAttacker].status1 & STATUS_SLEEP && gBattleMons[gBankAttacker].ability != ABILITY_SOUNDPROOF)
                        {
                            gBattleMons[gBankAttacker].status1 &= ~(STATUS_SLEEP);
                            gBattleMons[gBankAttacker].status2 &= ~(STATUS2_NIGHTMARE);
                            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                            b_call_bc_move_exec(gUnknown_081D950F);
                            gActiveBank = gBankAttacker;
                            EmitSetAttributes(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gBankAttacker].status1);
                            MarkBufferBankForExecution(gActiveBank);
                            break;
                        }
                    }
                    if (gBankAttacker != gNoOfAllBanks)
                    {
                        effect = 2; //a pokemon was awaken
                        break;
                    }
                    else
                    {
                        gBankAttacker = gActiveBank;
                        gBattleMons[gActiveBank].status2 -= 0x10; //uproar timer goes down
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
            case 11: //thrash
                if (gBattleMons[gActiveBank].status2 & STATUS2_LOCK_CONFUSE)
                {
                    gBattleMons[gActiveBank].status2 &= 0xFFFFFC00;
                    if (sub_8015660(gActiveBank))
                        CancelMultiTurnMoves(gActiveBank);
                    else if (!(gBattleMons[gActiveBank].status2 & STATUS2_LOCK_CONFUSE) && gBattleMons[gActiveBank].status2 & STATUS2_MULTIPLETURNS)
                    {
                        gBattleMons[gActiveBank].status2 &= 0xFFFFEFFF;
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
            case 12: //disable
                if (gDisableStructs[gActiveBank].disableTimer1)
                {
                    for (i = 0; i < 4; i++)
                    {
                        if (gDisableStructs[gActiveBank].disabledMove == gBattleMons[gActiveBank].moves[i])
                            break;
                    }
                    if (i == 4) //pokemon does not have the disabled move anymore
                    {
                        gDisableStructs[gActiveBank].disabledMove = 0;
                        gDisableStructs[gActiveBank].disableTimer1 = 0;
                    }
                    else if (--gDisableStructs[gActiveBank].disableTimer1 == 0) //disable ends
                    {
                        gDisableStructs[gActiveBank].disabledMove = 0;
                        b_call_bc_move_exec(gUnknown_081D9148);
                        effect++;
                    }
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 13: //encore
                if (gDisableStructs[gActiveBank].encoreTimer1)
                {
                    if (gBattleMons[gActiveBank].moves[gDisableStructs[gActiveBank].encoredMovePos] != gDisableStructs[gActiveBank].encoredMove) //pokemon does not have the encored move anymore
                    {
                        gDisableStructs[gActiveBank].encoredMove = 0;
                        gDisableStructs[gActiveBank].encoreTimer1 = 0;
                    }
                    else if (--gDisableStructs[gActiveBank].encoreTimer1 == 0 || gBattleMons[gActiveBank].pp[gDisableStructs[gActiveBank].encoredMovePos] == 0)
                    {
                        gDisableStructs[gActiveBank].encoredMove = 0;
                        gDisableStructs[gActiveBank].encoreTimer1 = 0;
                        b_call_bc_move_exec(gUnknown_081D914F);
                        effect++;
                    }
                }
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 14: //lock-on decrement
                if (gStatuses3[gActiveBank] & STATUS3_ALWAYS_HITS)
                    gStatuses3[gActiveBank] -= 0x8;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 15: //charge
                if (gDisableStructs[gActiveBank].chargeTimer1 && --gDisableStructs[gActiveBank].chargeTimer1 == 0)
                    gStatuses3[gActiveBank] &= ~STATUS3_CHARGED_UP;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 16: //taunt
                if (gDisableStructs[gActiveBank].tauntTimer1)
                    gDisableStructs[gActiveBank].tauntTimer1--;
                BATTLE_STRUCT->turnEffectsTracker++;
                break;
            case 17: //yawn
                if (gStatuses3[gActiveBank] & STATUS3_YAWN)
                {
                    gStatuses3[gActiveBank] &= 0xFFFFF800;
                    if (!(gStatuses3[gActiveBank] & STATUS3_YAWN) && !gBattleMons[gActiveBank].status1 && gBattleMons[gActiveBank].ability != ABILITY_VITAL_SPIRIT
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
            case 19: //done
                BATTLE_STRUCT->turnEffectsTracker = 0;
                BATTLE_STRUCT->turnEffectsBank++;
                break;
            }
            if (effect)
                return effect;
        }
    }
    gHitMarker &= ~(HITMARKER_GRUDGE | HITMARKER_x20);
    return 0;
}
