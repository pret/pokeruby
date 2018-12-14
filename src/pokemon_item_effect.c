#include "global.h"
#include "constants/battle_constants.h"
#include "constants/hold_effects.h"
#include "constants/items.h"
#include "constants/species.h"
#include "constants/pokemon_item_effect_constants.h"
#include "battle.h"
#include "evolution_scene.h"
#include "ewram.h"
#include "item.h"
#include "main.h"
#include "overworld.h"
#include "pokemon.h"
#include "pokemon_item_effect.h"
#include "rom_8077ABC.h"
#include "rom_8094928.h"
#include "util.h"

extern s32 gBattleMoveDamage;
extern u8 gAbsentBattlerFlags;
extern u8 gBankInMenu;
extern u8 gBattlersCount;
extern u16 gBattlerPartyIndexes[];
extern u8 gActiveBattler;
extern u8 gStringBank;
extern struct BattlePokemon gBattleMons[];
extern struct BattleEnigmaBerry gEnigmaBerries[];

static const u8 sGetMonDataEVConstants[] =
{
    MON_DATA_HP_EV,
    MON_DATA_ATK_EV,
    MON_DATA_DEF_EV,
    MON_DATA_SPEED_EV,
    MON_DATA_SPDEF_EV,
    MON_DATA_SPATK_EV
};

extern u8 gPPUpReadMasks[];
extern u8 gPPUpWriteMasks[];
extern u8 gPPUpValues[];

bool8 PokemonUseItemEffects(struct Pokemon *pkmn, u16 item, u8 partyIndex, u8 moveIndex, u8 usingOnOpponent);

bool8 ExecuteTableBasedItemEffect_(struct Pokemon *pkmn, u16 item, u8 partyIndex, u8 moveIndex)
{
    return PokemonUseItemEffects(pkmn, item, partyIndex, moveIndex, 0);
}

bool8 PokemonUseItemEffects(struct Pokemon *pkmn, u16 item, u8 partyIndex, u8 moveIndex, u8 usingOnOpponent)
{
    u32 data;
    s32 friendship;
    s32 cmdIndex;
    bool8 itemUnsuccessful = TRUE;
    const u8 *itemEffect;
    u8 itemEffectExtraArgsIndex = MON_ITEM_EXTRA_ARGS_START_INDEX;
    u32 itemEffectCurBit;
    s8 friendshipDelta = 0;
    u8 holdEffect;
    u8 bank = MAX_BATTLERS_COUNT;
    u16 heldItem;
    u8 itemEffectByte;
    u32 r4;

    heldItem = GetMonData(pkmn, MON_DATA_HELD_ITEM, NULL);
    if (heldItem == ITEM_ENIGMA_BERRY)
    {
        if (gMain.inBattle)
            holdEffect = gEnigmaBerries[gBankInMenu].holdEffect;
        else
            holdEffect = gSaveBlock1.enigmaBerry.holdEffect;
    }
    else
    {
        holdEffect = ItemId_GetHoldEffect(heldItem);
    }

    gStringBank = gBankInMenu;
    if (gMain.inBattle)
    {
        gActiveBattler = gBankInMenu;
        cmdIndex = (GetBattlerSide(gActiveBattler) != 0);
        while (cmdIndex < gBattlersCount)
        {
            if (gBattlerPartyIndexes[cmdIndex] == partyIndex)
            {
                bank = cmdIndex;
                break;
            }
            cmdIndex += 2;
        }
    }
    else
    {
        gActiveBattler = 0;
        bank = MAX_BATTLERS_COUNT;
    }

    if (!IS_POKEMON_ITEM(item))
        return TRUE;
    if (gItemEffectTable[item - ITEM_POTION] == NULL && item != ITEM_ENIGMA_BERRY)
        return TRUE;

    if (item == ITEM_ENIGMA_BERRY)
    {
        if (gMain.inBattle)
            itemEffect = gEnigmaBerries[gActiveBattler].itemEffect;
        else
            itemEffect = gSaveBlock1.enigmaBerry.itemEffect;
    }
    else
    {
        itemEffect = gItemEffectTable[item - ITEM_POTION];
    }

    for (cmdIndex = 0; cmdIndex < MON_ITEM_EXTRA_ARGS_START_INDEX; cmdIndex++)
    {
        switch (cmdIndex)
        {
        case 0:
            if ((itemEffect[cmdIndex] & MON_ITEM_CURE_INFATUATION)
             && gMain.inBattle && bank != MAX_BATTLERS_COUNT && (gBattleMons[bank].status2 & STATUS2_INFATUATION))
            {
                gBattleMons[bank].status2 &= ~STATUS2_INFATUATION;
                itemUnsuccessful = FALSE;
            }
            if ((itemEffect[cmdIndex] & MON_ITEM_HIGH_CRIT_MASK)
             && !(gBattleMons[gActiveBattler].status2 & STATUS2_FOCUS_ENERGY))
            {
                gBattleMons[gActiveBattler].status2 |= STATUS2_FOCUS_ENERGY;
                itemUnsuccessful = FALSE;
            }
            if ((itemEffect[cmdIndex] & MON_ITEM_X_ATTACK_MASK)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] += itemEffect[cmdIndex] & MON_ITEM_X_ATTACK_MASK;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] = 12;
                itemUnsuccessful = FALSE;
            }
            break;
        case 1:
            if ((itemEffect[cmdIndex] & MON_ITEM_X_DEFEND_MASK)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] += (itemEffect[cmdIndex] & MON_ITEM_X_DEFEND_MASK) >> 4;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] = 12;
                itemUnsuccessful = FALSE;
            }
            if ((itemEffect[cmdIndex] & MON_ITEM_X_SPEED_MASK)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] += itemEffect[cmdIndex] & MON_ITEM_X_SPEED_MASK;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] = 12;
                itemUnsuccessful = FALSE;
            }
            break;
        case 2:
            if ((itemEffect[cmdIndex] & MON_ITEM_X_ACCURACY_MASK)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] += (itemEffect[cmdIndex] & MON_ITEM_X_ACCURACY_MASK) >> 4;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] = 12;
                itemUnsuccessful = FALSE;
            }
            if ((itemEffect[cmdIndex] & MON_ITEM_X_SPECIAL_MASK)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] += itemEffect[cmdIndex] & MON_ITEM_X_SPECIAL_MASK;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] = 12;
                itemUnsuccessful = FALSE;
            }
            break;
        case 3:
            if ((itemEffect[cmdIndex] & MON_ITEM_MIST)
             && gSideTimers[GetBattlerSide(gActiveBattler)].mistTimer == 0)
            {
                gSideTimers[GetBattlerSide(gActiveBattler)].mistTimer = 5;
                itemUnsuccessful = FALSE;
            }
            if ((itemEffect[cmdIndex] & MON_ITEM_RAISE_LEVEL)  // raise level
             && GetMonData(pkmn, MON_DATA_LEVEL, NULL) != 100)
            {
                data = gExperienceTables[gBaseStats[GetMonData(pkmn, MON_DATA_SPECIES, NULL)].growthRate][GetMonData(pkmn, MON_DATA_LEVEL, NULL) + 1];
                SetMonData(pkmn, MON_DATA_EXP, &data);
                CalculateMonStats(pkmn);
                itemUnsuccessful = FALSE;
            }
            if ((itemEffect[cmdIndex] & MON_ITEM_CURE_SLEEP)
             && HealStatusConditions(pkmn, partyIndex, STATUS_SLEEP, bank) == 0)
            {
                if (bank != MAX_BATTLERS_COUNT)
                    gBattleMons[bank].status2 &= ~STATUS2_NIGHTMARE;
                itemUnsuccessful = FALSE;
            }
            if ((itemEffect[cmdIndex] & MON_ITEM_CURE_POISON) && HealStatusConditions(pkmn, partyIndex, STATUS_PSN_ANY | STATUS_TOXIC_COUNTER, bank) == 0)
                itemUnsuccessful = FALSE;
            if ((itemEffect[cmdIndex] & MON_ITEM_CURE_BURN) && HealStatusConditions(pkmn, partyIndex, STATUS_BURN, bank) == 0)
                itemUnsuccessful = FALSE;
            if ((itemEffect[cmdIndex] & MON_ITEM_CURE_FREEZE) && HealStatusConditions(pkmn, partyIndex, STATUS_FREEZE, bank) == 0)
                itemUnsuccessful = FALSE;
            if ((itemEffect[cmdIndex] & MON_ITEM_CURE_PARALYSIS) && HealStatusConditions(pkmn, partyIndex, STATUS_PARALYSIS, bank) == 0)
                itemUnsuccessful = FALSE;
            if ((itemEffect[cmdIndex] & MON_ITEM_CURE_CONFUSION)
             && gMain.inBattle && bank != MAX_BATTLERS_COUNT && (gBattleMons[bank].status2 & STATUS2_CONFUSION))
            {
                gBattleMons[bank].status2 &= ~STATUS2_CONFUSION;
                itemUnsuccessful = FALSE;
            }
            break;
        // EV, HP, and PP raising effects
        case 4:
#define ppWithBonus itemEffectCurBit
#define ppUpScratchVar data
            itemEffectByte = itemEffect[cmdIndex];
            if (itemEffectByte & MON_ITEM_PP_UP)
            {
                itemEffectByte &= ~MON_ITEM_PP_UP;
                // ppUpScratchVar = numPPUps
                ppUpScratchVar = (GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) & gPPUpReadMasks[moveIndex]) >> (moveIndex * 2);
                ppWithBonus = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                if (ppUpScratchVar < 3 && ppWithBonus > 4)
                {
                    // new bitpacked pp bonuses value
                    ppUpScratchVar = GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) + gPPUpValues[moveIndex];
                    SetMonData(pkmn, MON_DATA_PP_BONUSES, &ppUpScratchVar);

                    // amount of current pp (not max pp) to add after applying pp up
                    ppUpScratchVar = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), ppUpScratchVar, moveIndex) - ppWithBonus;
                    // new pp amount
                    ppUpScratchVar = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL) + ppUpScratchVar;
                    SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &ppUpScratchVar);
                    itemUnsuccessful = FALSE;
                }
            }
#undef ppWithBonus
#undef ppUpScratchVar
            itemEffectCurBit = 0;
            while (itemEffectByte != 0)
            {
                if (itemEffectByte & 1)
                {
                    u16 evCount;
                    s32 i;
     
                    switch (itemEffectCurBit)
                    {
                    case MON_ITEM_HP_EV_F:
                    case MON_ITEM_ATK_EV_F:
                        evCount = GetMonEVCount(pkmn);
                        if (evCount >= MAX_TOTAL_EVS)
                            return TRUE;
#define evStatAmount data
#define evDelta r4
                        evStatAmount = GetMonData(pkmn, sGetMonDataEVConstants[itemEffectCurBit], NULL);
                        if (evStatAmount < 100)
                        {
                            if (evStatAmount + itemEffect[itemEffectExtraArgsIndex] > 100)
                                // this is actually
                                /* r4 = 100 - evStatAmount */
                                // but the unnecessary adds are required to match
                                evDelta = 100 - (evStatAmount + itemEffect[itemEffectExtraArgsIndex]) + itemEffect[itemEffectExtraArgsIndex];
                            else
                                evDelta = itemEffect[itemEffectExtraArgsIndex];
                            if (evCount + evDelta > MAX_TOTAL_EVS)
                                evDelta += MAX_TOTAL_EVS - (evCount + evDelta);
                            evStatAmount += evDelta;
                            SetMonData(pkmn, sGetMonDataEVConstants[itemEffectCurBit], &evStatAmount);
                            CalculateMonStats(pkmn);
                            itemEffectExtraArgsIndex++;
                            itemUnsuccessful = FALSE;
                        }
                        break;
#undef evStatAmount
#undef evDelta
                    case MON_ITEM_HEAL_HP_F:
                        // check for the revive bit, accounting for the fact
                        // that itemEffectByte has already been shifted
                        // MON_ITEM_HEAL_HP_F (2) times
                        if (itemEffectByte & (1 << (MON_ITEM_REVIVE_F - MON_ITEM_HEAL_HP_F)))
                        {
                            if (GetMonData(pkmn, MON_DATA_HP, NULL) != 0)
                            {
                                itemEffectExtraArgsIndex++;
                                break;
                            }
                            if (gMain.inBattle)
                            {
                                if (bank != MAX_BATTLERS_COUNT)
                                {
                                    gAbsentBattlerFlags &= ~gBitTable[bank];
                                    CopyPlayerPartyMonToBattleData(bank, pokemon_order_func(gBattlerPartyIndexes[bank]));
                                    if (GetBattlerSide(gActiveBattler) == 0 && gBattleResults.unk4 < 255)
                                        gBattleResults.unk4++;
                                }
                                else
                                {
                                    gAbsentBattlerFlags &= ~gBitTable[gActiveBattler ^ 2];
                                    if (GetBattlerSide(gActiveBattler) == 0 && gBattleResults.unk4 < 255)
                                        gBattleResults.unk4++;
                                }
                            }
                        }
                        else
                        {
                            if (GetMonData(pkmn, MON_DATA_HP, NULL) == 0)
                            {
                                itemEffectExtraArgsIndex++;
                                break;
                            }
                        }
#define hpHealValue data
                        hpHealValue = itemEffect[itemEffectExtraArgsIndex++];
                        switch (hpHealValue)
                        {
                        case MON_ITEM_ARG_HEAL_FULL_HP:
                            hpHealValue = GetMonData(pkmn, MON_DATA_MAX_HP, NULL) - GetMonData(pkmn, MON_DATA_HP, NULL);
                            break;
                        case MON_ITEM_ARG_HEAL_HALF_HP:
                            hpHealValue = GetMonData(pkmn, MON_DATA_MAX_HP, NULL) / 2;
                            if (hpHealValue == 0)
                                hpHealValue = 1;
                            break;
                        case MON_ITEM_ARG_HEAL_RARE_CANDY:
                            hpHealValue = eLevelUpHPDelta;
                            break;
                        }
                        if (GetMonData(pkmn, MON_DATA_MAX_HP, NULL) != GetMonData(pkmn, MON_DATA_HP, NULL))
                        {
                            if (usingOnOpponent == 0)
                            {
                                // hpHealValue is now the new hp of the mon
                                hpHealValue = GetMonData(pkmn, MON_DATA_HP, NULL) + hpHealValue;
                                if (hpHealValue > GetMonData(pkmn, MON_DATA_MAX_HP, NULL))
                                    hpHealValue = GetMonData(pkmn, MON_DATA_MAX_HP, NULL);
                                SetMonData(pkmn, MON_DATA_HP, &hpHealValue);
                                if (gMain.inBattle && bank != MAX_BATTLERS_COUNT)
                                {
                                    gBattleMons[bank].hp = hpHealValue;
                                    if (!(itemEffectByte & (1 << (MON_ITEM_REVIVE_F - MON_ITEM_HEAL_HP_F))) && GetBattlerSide(gActiveBattler) == 0)
                                    {
                                        if (gBattleResults.unk3 < 255)
                                            gBattleResults.unk3++;
                                        // I have to re-use this variable to match.
                                        i = gActiveBattler;
                                        gActiveBattler = bank;
                                        EmitGetAttributes(0, 0, 0);
                                        MarkBufferBankForExecution(gActiveBattler);
                                        gActiveBattler = i;
                                    }
                                }
                            }
                            else
                            {
                                gBattleMoveDamage = -data;
                            }
                            itemUnsuccessful = FALSE;
                        }
                        // unset revive bit for some reason
                        itemEffectByte &= ~(1 << (MON_ITEM_REVIVE_F - MON_ITEM_HEAL_HP_F));
                        break;
#undef hpHealValue
                    case MON_ITEM_HEAL_PP_F:
#define ppAmount data
                        // Determine if we're using an elixir item or ether item
                        if (!(itemEffectByte & 1 << (MON_ITEM_PP_HEAL_ONE_MOVE_F - MON_ITEM_HEAL_PP_F)))
                        {
                            for (i = 0; i < MAX_BATTLERS_COUNT; i++)
                            {
                                u16 curMove;

                                ppAmount = GetMonData(pkmn, MON_DATA_PP1 + i, NULL);
                                curMove = GetMonData(pkmn, MON_DATA_MOVE1 + i, NULL);
                                if (ppAmount != CalculatePPWithBonus(curMove, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), i))
                                {
                                    ppAmount += itemEffect[itemEffectExtraArgsIndex];
                                    curMove = GetMonData(pkmn, MON_DATA_MOVE1 + i, NULL);
                                    if (ppAmount > CalculatePPWithBonus(curMove, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), i))
                                    {
                                        curMove = GetMonData(pkmn, MON_DATA_MOVE1 + i, NULL);
                                        ppAmount = CalculatePPWithBonus(curMove, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), i);
                                    }
                                    SetMonData(pkmn, MON_DATA_PP1 + i, &ppAmount);

                                    if (gMain.inBattle
                                     && bank != MAX_BATTLERS_COUNT
                                     && !(gBattleMons[bank].status2 & STATUS2_TRANSFORMED)
                                     && !(gDisableStructs[bank].unk18_b & gBitTable[i]))
                                        gBattleMons[bank].pp[i] = ppAmount;

                                    itemUnsuccessful = FALSE;
                                }
                            }
                            itemEffectExtraArgsIndex++;
                        }
                        else
                        {
                            u16 move;

                            ppAmount = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL);
                            move = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                            if (ppAmount != CalculatePPWithBonus(move, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex))
                            {
                                ppAmount += itemEffect[itemEffectExtraArgsIndex++];
                                move = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                                if (ppAmount > CalculatePPWithBonus(move, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex))
                                {
                                    move = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                                    ppAmount = CalculatePPWithBonus(move, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                                }
                                SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &ppAmount);

                                if (gMain.inBattle
                                 && bank != MAX_BATTLERS_COUNT
                                 && !(gBattleMons[bank].status2 & STATUS2_TRANSFORMED)
                                 && !(gDisableStructs[bank].unk18_b & gBitTable[moveIndex]))
                                    gBattleMons[bank].pp[moveIndex] = ppAmount;

                                itemUnsuccessful = FALSE;
                            }
                        }
                        break;
#undef ppAmount
                    case MON_ITEM_EVO_STONE_F:
                        {
                            u16 targetSpecies = GetEvolutionTargetSpecies(pkmn, 2, item);

                            if (targetSpecies != SPECIES_NONE)
                            {
                                BeginEvolutionScene(pkmn, targetSpecies, 0, partyIndex);
                                return FALSE;
                            }
                        }
                        break;
                    }
                }
                itemEffectCurBit++;
                itemEffectByte >>= 1;
            }
            break;
        case 5:
            itemEffectByte = itemEffect[cmdIndex];
            itemEffectCurBit = 0;
            while (itemEffectByte != 0)
            {
                if (itemEffectByte & 1)
                {
                    u16 evCount;

                    switch (itemEffectCurBit)
                    {
                    case MON_ITEM_DEF_EV_F:
                    case MON_ITEM_SPEED_EV_F:
                    case MON_ITEM_SPDEF_EV_F:
                    case MON_ITEM_SPATK_EV_F:
                        evCount = GetMonEVCount(pkmn);
                        if (evCount >= MAX_TOTAL_EVS)
                            return TRUE;
#define evStatAmount data
#define evDelta r4
                        evStatAmount = GetMonData(pkmn, sGetMonDataEVConstants[itemEffectCurBit + 2], NULL);
                        if (evStatAmount < 100)
                        {
                            // this is actually
                            /* r4 = 100 - evStatAmount */
                            // but the unnecessary adds are required to match
                            if (evStatAmount + itemEffect[itemEffectExtraArgsIndex] > 100)
                                evDelta = 100 - (evStatAmount + itemEffect[itemEffectExtraArgsIndex]) + itemEffect[itemEffectExtraArgsIndex];
                            else
                                evDelta = itemEffect[itemEffectExtraArgsIndex];
                            if (evCount + evDelta > MAX_TOTAL_EVS)
                                evDelta += MAX_TOTAL_EVS - (evCount + evDelta);
                            evStatAmount += evDelta;
                            SetMonData(pkmn, sGetMonDataEVConstants[itemEffectCurBit + 2], &evStatAmount);
                            CalculateMonStats(pkmn);
                            itemUnsuccessful = FALSE;
                            itemEffectExtraArgsIndex++;
                        }
                        break;
#undef evStatAmount
#undef evDelta

#define ppUpScratchVar data
#define ppWithBonus r4
                    case MON_ITEM_PP_MAX_F:
                        // ppUpScratchVar = numPPUps
                        ppUpScratchVar = (GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) & gPPUpReadMasks[moveIndex]) >> (moveIndex * 2);
                        // minor bug: does not check for sketch PP
                        if (ppUpScratchVar < 3)
                        {
                            ppWithBonus = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                            // ppUpScratchVar = new bitpacked pp bonuses value
                            ppUpScratchVar = GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL);
                            // Temporarily clear current PP Up value...
                            ppUpScratchVar &= gPPUpWriteMasks[moveIndex];
                            // Then add the max PP Up value.
                            ppUpScratchVar += gPPUpValues[moveIndex] * 3;
                            SetMonData(pkmn, MON_DATA_PP_BONUSES, &ppUpScratchVar);

                            // amount of current pp (not max pp) to add after applying pp up
                            ppUpScratchVar = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), ppUpScratchVar, moveIndex) - ppWithBonus;
                            // new current pp amount
                            ppUpScratchVar = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL) + ppUpScratchVar;
                            SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &ppUpScratchVar);
                            itemUnsuccessful = FALSE;
                        }
                        break;
#undef ppUpScratchVar
#undef ppWithBonus
                    case MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99_F:
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) < 100 && itemUnsuccessful == FALSE && friendshipDelta == 0)
                        {
                            friendshipDelta = itemEffect[itemEffectExtraArgsIndex];
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (friendshipDelta > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * friendshipDelta / 100;
                            else
                                friendship += friendshipDelta;
                            if (friendshipDelta > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    friendship++;
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == sav1_map_get_name())
                                    friendship++;
                            }
                            if (friendship < 0)
                                friendship = 0;
                            if (friendship > 255)
                                friendship = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &friendship);
                        }
                        itemEffectExtraArgsIndex++;
                        break;
                    case MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199_F:
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) >= 100 && GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) < 200
                         && itemUnsuccessful == FALSE && friendshipDelta == 0)
                        {
                            friendshipDelta = itemEffect[itemEffectExtraArgsIndex];
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (friendshipDelta > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * friendshipDelta / 100;
                            else
                                friendship += friendshipDelta;
                            if (friendshipDelta > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    friendship++;
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == sav1_map_get_name())
                                    friendship++;
                            }
                            if (friendship < 0)
                                friendship = 0;
                            if (friendship > 255)
                                friendship = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &friendship);
                        }
                        itemEffectExtraArgsIndex++;
                        break;
                    case MON_ITEM_AFFECT_FRIENDSHIP_200_TO_255_F:
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) >= 200 && itemUnsuccessful == FALSE && friendshipDelta == 0)
                        {
                            friendshipDelta = itemEffect[itemEffectExtraArgsIndex];
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (friendshipDelta > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * friendshipDelta / 100;
                            else
                                friendship += friendshipDelta;
                            if (friendshipDelta > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    friendship++;
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == sav1_map_get_name())
                                    friendship++;
                            }
                            if (friendship < 0)
                                friendship = 0;
                            if (friendship > 255)
                                friendship = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &friendship);
                        }
                        itemEffectExtraArgsIndex++;
                        break;
                    }
                }
                itemEffectCurBit++;
                itemEffectByte >>= 1;
            }
            break;
        }
    }
    return itemUnsuccessful;
}
