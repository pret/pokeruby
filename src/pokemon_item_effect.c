#include "global.h"
#include "constants/battle.h"
#include "constants/hold_effects.h"
#include "constants/items.h"
#include "constants/species.h"
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
#include "constants/item_effects.h"

extern s32 gBattleMoveDamage;
extern u8 gAbsentBattlerFlags;
extern u8 gBankInMenu;
extern u8 gBattlersCount;
extern u16 gBattlerPartyIndexes[];
extern u8 gActiveBattler;
extern u8 gPotentialItemEffectBattler;
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

bool8 PokemonUseItemEffects(struct Pokemon *pkmn, u16 item, u8 partyIndex, u8 moveIndex, u8 e);

bool8 ExecuteTableBasedItemEffect_(struct Pokemon *pkmn, u16 item, u8 partyIndex, u8 moveIndex)
{
    return PokemonUseItemEffects(pkmn, item, partyIndex, moveIndex, 0);
}

bool8 PokemonUseItemEffects(struct Pokemon *pkmn, u16 item, u8 partyIndex, u8 moveIndex, u8 e)
{
    u32 data;
    s32 friendship;
    s32 cmdIndex;
    bool8 retVal = TRUE;
    const u8 *itemEffect;
    u8 paramIdx = ITEM_EFFECT_ARG_START;
    u32 data2;
    s8 friendshipMod = 0;
    u8 holdEffect;
    u8 battleId = 4; // Not active
    u16 heldItem;
    u8 effect4;
    u32 evChange;

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

    gPotentialItemEffectBattler = gBankInMenu;
    if (gMain.inBattle)
    {
        gActiveBattler = gBankInMenu;
        cmdIndex = (GetBattlerSide(gActiveBattler) != 0);
        while (cmdIndex < gBattlersCount)
        {
            if (gBattlerPartyIndexes[cmdIndex] == partyIndex)
            {
                battleId = cmdIndex;
                break;
            }
            cmdIndex += 2;
        }
    }
    else
    {
        gActiveBattler = 0;
        battleId = 4;
    }

    if (!ITEM_HAS_EFFECT(item))
        return TRUE;
    if (gItemEffectTable[item - 13] == NULL && item != ITEM_ENIGMA_BERRY)
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
        itemEffect = gItemEffectTable[item - 13];
    }

    for (cmdIndex = 0; cmdIndex < 6; cmdIndex++)
    {
        switch (cmdIndex)
        {
        // status healing effects
        case 0:
            if ((itemEffect[cmdIndex] & ITEM0_INFATUATION)
             && gMain.inBattle && battleId != 4 && (gBattleMons[battleId].status2 & STATUS2_INFATUATION))
            {
                gBattleMons[battleId].status2 &= ~STATUS2_INFATUATION;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & ITEM0_DIRE_HIT)
             && !(gBattleMons[gActiveBattler].status2 & STATUS2_FOCUS_ENERGY))
            {
                gBattleMons[gActiveBattler].status2 |= STATUS2_FOCUS_ENERGY;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & ITEM0_X_ATTACK)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] += itemEffect[cmdIndex] & ITEM0_X_ATTACK;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_ATK] = 12;
                retVal = FALSE;
            }
            break;
        // in-battle stat boosting effects?
        case 1:
            if ((itemEffect[cmdIndex] & ITEM1_X_DEFEND)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] += (itemEffect[cmdIndex] & ITEM1_X_DEFEND) >> 4;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_DEF] = 12;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & ITEM1_X_SPEED)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] += itemEffect[cmdIndex] & ITEM1_X_SPEED;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPEED] = 12;
                retVal = FALSE;
            }
            break;
        // more stat boosting effects?
        case 2:
            if ((itemEffect[cmdIndex] & ITEM2_X_ACCURACY)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] += (itemEffect[cmdIndex] & ITEM2_X_ACCURACY) >> 4;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_ACC] = 12;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & ITEM2_X_SPATK)
             && gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] < 12)
            {
                gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] += itemEffect[cmdIndex] & ITEM2_X_SPATK;
                if (gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] > 12)
                    gBattleMons[gActiveBattler].statStages[STAT_STAGE_SPATK] = 12;
                retVal = FALSE;
            }
            break;
        case 3:
            if ((itemEffect[cmdIndex] & ITEM3_GUARD_SPEC)
             && gSideTimers[GetBattlerSide(gActiveBattler)].mistTimer == 0)
            {
                gSideTimers[GetBattlerSide(gActiveBattler)].mistTimer = 5;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & ITEM3_LEVEL_UP)  // raise level
             && GetMonData(pkmn, MON_DATA_LEVEL, NULL) != 100)
            {
                data = gExperienceTables[gBaseStats[GetMonData(pkmn, MON_DATA_SPECIES, NULL)].growthRate][GetMonData(pkmn, MON_DATA_LEVEL, NULL) + 1];
                SetMonData(pkmn, MON_DATA_EXP, &data);
                CalculateMonStats(pkmn);
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & ITEM3_SLEEP)
             && HealStatusConditions(pkmn, partyIndex, 7, battleId) == 0)
            {
                if (battleId != 4)
                    gBattleMons[battleId].status2 &= ~STATUS2_NIGHTMARE;
                retVal = FALSE;
            }
            if ((itemEffect[cmdIndex] & ITEM3_POISON) && HealStatusConditions(pkmn, partyIndex, (STATUS1_PSN_ANY | STATUS1_TOXIC_COUNTER), battleId) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & ITEM3_BURN) && HealStatusConditions(pkmn, partyIndex, STATUS1_BURN, battleId) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & ITEM3_FREEZE) && HealStatusConditions(pkmn, partyIndex, STATUS1_FREEZE, battleId) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & ITEM3_PARALYSIS) && HealStatusConditions(pkmn, partyIndex, STATUS1_PARALYSIS, battleId) == 0)
                retVal = FALSE;
            if ((itemEffect[cmdIndex] & ITEM3_CONFUSION)  // heal confusion
             && gMain.inBattle && battleId != 4 && (gBattleMons[battleId].status2 & STATUS2_CONFUSION))
            {
                gBattleMons[battleId].status2 &= ~STATUS2_CONFUSION;
                retVal = FALSE;
            }
            break;
        // EV, HP, and PP raising effects
        case 4:
            effect4 = itemEffect[cmdIndex];
            if (effect4 & ITEM4_PP_UP)
            {
                effect4 &= ~ITEM4_PP_UP;
                data = (GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) & gPPUpReadMasks[moveIndex]) >> (moveIndex * 2);
                data2 = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                if (data < 3 && data2 > 4)
                {
                    data = GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) + gPPUpValues[moveIndex];
                    SetMonData(pkmn, MON_DATA_PP_BONUSES, &data);

                    data = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), data, moveIndex) - data2;
                    data = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL) + data;
                    SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &data);
                    retVal = FALSE;
                }
            }
            data2 = 0;
            while (effect4 != 0)
            {
                if (effect4 & 1)
                {
                    u16 evCount;
                    s32 r5;
     
                    switch (data2)
                    {
                    case 0: // EV_HP
                    case 1: // EV_ATK
                        evCount = GetMonEVCount(pkmn);
                        if (evCount >= 510)
                            return TRUE;
                        data = GetMonData(pkmn, sGetMonDataEVConstants[data2], NULL);
                        if (data < 100)
                        {
                            if (data + itemEffect[paramIdx] > 100)
                                evChange = 100 - (data + itemEffect[paramIdx]) + itemEffect[paramIdx];
                            else
                                evChange = itemEffect[paramIdx];
                            if (evCount + evChange > 510)
                                evChange += 510 - (evCount + evChange);
                            data += evChange;
                            SetMonData(pkmn, sGetMonDataEVConstants[data2], &data);
                            CalculateMonStats(pkmn);
                            paramIdx++;
                            retVal = FALSE;
                        }
                        break;
                    case 2: // HEAL_HP
                        // revive?
                        if (effect4 & (ITEM4_REVIVE >> 2))
                        {
                            if (GetMonData(pkmn, MON_DATA_HP, NULL) != 0)
                            {
                                paramIdx++;
                                break;
                            }
                            if (gMain.inBattle)
                            {
                                if (battleId != 4)
                                {
                                    gAbsentBattlerFlags &= ~gBitTable[battleId];
                                    CopyPlayerPartyMonToBattleData(battleId, pokemon_order_func(gBattlerPartyIndexes[battleId]));
                                    if (GetBattlerSide(gActiveBattler) == 0 && gBattleResults.reviveCount < 255)
                                        gBattleResults.reviveCount++;
                                }
                                else
                                {
                                    gAbsentBattlerFlags &= ~gBitTable[gActiveBattler ^ 2];
                                    if (GetBattlerSide(gActiveBattler) == 0 && gBattleResults.reviveCount < 255)
                                        gBattleResults.reviveCount++;
                                }
                            }
                        }
                        else
                        {
                            if (GetMonData(pkmn, MON_DATA_HP, NULL) == 0)
                            {
                                paramIdx++;
                                break;
                            }
                        }
                        data = itemEffect[paramIdx++];
                        switch (data)
                        {
                        case ITEM6_HEAL_HP_FULL:
                            data = GetMonData(pkmn, MON_DATA_MAX_HP, NULL) - GetMonData(pkmn, MON_DATA_HP, NULL);
                            break;
                        case ITEM6_HEAL_HP_HALF:
                            data = GetMonData(pkmn, MON_DATA_MAX_HP, NULL) / 2;
                            if (data == 0)
                                data = 1;
                            break;
                        case ITEM6_HEAL_HP_LVL_UP:
                            data = gBattleStruct->levelUpHP;
                            break;
                        }
                        if (GetMonData(pkmn, MON_DATA_MAX_HP, NULL) != GetMonData(pkmn, MON_DATA_HP, NULL))
                        {
                            if (e == 0)
                            {
                                data = GetMonData(pkmn, MON_DATA_HP, NULL) + data;
                                if (data > GetMonData(pkmn, MON_DATA_MAX_HP, NULL))
                                    data = GetMonData(pkmn, MON_DATA_MAX_HP, NULL);
                                SetMonData(pkmn, MON_DATA_HP, &data);
                                if (gMain.inBattle && battleId != 4)
                                {
                                    gBattleMons[battleId].hp = data;
                                    if (!(effect4 & (ITEM4_REVIVE >> 2)) && GetBattlerSide(gActiveBattler) == 0)
                                    {
                                        if (gBattleResults.playerHealInBattleCount < 255)
                                            gBattleResults.playerHealInBattleCount++;
                                        // I have to re-use this variable to match.
                                        r5 = gActiveBattler;
                                        gActiveBattler = battleId;
                                        BtlController_EmitGetMonData(0, 0, 0);
                                        MarkBattlerForControllerExec(gActiveBattler);
                                        gActiveBattler = r5;
                                    }
                                }
                            }
                            else
                            {
                                gBattleMoveDamage = -data;
                            }
                            retVal = FALSE;
                        }
                        effect4 &= ~(ITEM4_REVIVE >> 2);
                        break;
                    case 3: // HEAL_PP
                        if (!(effect4 & (ITEM4_HEAL_PP_ONE >> 3)))
                        {
                            for (r5 = 0; r5 < 4; r5++)
                            {
                                u16 r4;

                                data = GetMonData(pkmn, MON_DATA_PP1 + r5, NULL);
                                r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                if (data != CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5))
                                {
                                    data += itemEffect[paramIdx];
                                    r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                    if (data > CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5))
                                    {
                                        r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                        data = CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5);
                                    }
                                    SetMonData(pkmn, MON_DATA_PP1 + r5, &data);
                                    if (gMain.inBattle
                                     && battleId != 4 && !(gBattleMons[battleId].status2 & STATUS2_TRANSFORMED)
                                     && !(gDisableStructs[battleId].mimickedMoves & gBitTable[r5]))
                                        gBattleMons[battleId].pp[r5] = data;
                                    retVal = FALSE;
                                }
                            }
                            paramIdx++;
                        }
                        else
                        {
                            u16 r4;

                            data = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL);
                            r4 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                            if (data != CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex))
                            {
                                data += itemEffect[paramIdx++];
                                r4 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                                if (data > CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex))
                                {
                                    r4 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL);
                                    data = CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                                }
                                SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &data);
                                if (gMain.inBattle
                                 && battleId != 4 && !(gBattleMons[battleId].status2 & STATUS2_TRANSFORMED)
                                 && !(gDisableStructs[battleId].mimickedMoves & gBitTable[moveIndex]))
                                    gBattleMons[battleId].pp[moveIndex] = data;
                                retVal = FALSE;
                            }
                        }
                        break;
                    case 7: // EVO_STONE
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
                data2++;
                effect4 >>= 1;
            }
            break;
        case 5:
            effect4 = itemEffect[cmdIndex];
            data2 = 0;
            while (effect4 != 0)
            {
                if (effect4 & 1)
                {
                    u16 evCount;

                    switch (data2)
                    {
                    case 0: // EV_DEF
                    case 1: // EV_SPEED
                    case 2: // EV_SPDEF
                    case 3: // EV_SPATK
                        evCount = GetMonEVCount(pkmn);
                        if (evCount >= 510)
                            return TRUE;
                        data = GetMonData(pkmn, sGetMonDataEVConstants[data2 + 2], NULL);
                        if (data < 100)
                        {
                            if (data + itemEffect[paramIdx] > 100)
                                evChange = 100 - (data + itemEffect[paramIdx]) + itemEffect[paramIdx];
                            else
                                evChange = itemEffect[paramIdx];
                            if (evCount + evChange > 510)
                                evChange += 510 - (evCount + evChange);
                            data += evChange;
                            SetMonData(pkmn, sGetMonDataEVConstants[data2 + 2], &data);
                            CalculateMonStats(pkmn);
                            retVal = FALSE;
                            paramIdx++;
                        }
                        break;
                    case 4: // PP_MAX
                        data = (GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) & gPPUpReadMasks[moveIndex]) >> (moveIndex * 2);
                        if (data < 3)
                        {
                            evChange = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), moveIndex);
                            data = GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL);
                            data &= gPPUpWriteMasks[moveIndex];
                            data += gPPUpValues[moveIndex] * 3;

                            SetMonData(pkmn, MON_DATA_PP_BONUSES, &data);
                            data = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex, NULL), data, moveIndex) -
                                   evChange;
                            data = GetMonData(pkmn, MON_DATA_PP1 + moveIndex, NULL) + data;
                            SetMonData(pkmn, MON_DATA_PP1 + moveIndex, &data);
                            retVal = FALSE;
                        }
                        break;
                    case 5: // FRIENDSHIP_LOW
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) < 100 && retVal == 0 &&
                            friendshipMod == 0)
                        {
                            friendshipMod = itemEffect[paramIdx];
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (friendshipMod > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * friendshipMod / 100;
                            else
                                friendship += friendshipMod;
                            if (friendshipMod > 0)
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
                        paramIdx++;
                        break;
                    case 6: // FRIENDSHIP_MID
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) >= 100 && GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) < 200
                         && retVal == 0 &&
                            friendshipMod == 0)
                        {
                            friendshipMod = itemEffect[paramIdx];
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (friendshipMod > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * friendshipMod / 100;
                            else
                                friendship += friendshipMod;
                            if (friendshipMod > 0)
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
                        paramIdx++;
                        break;
                    case 7: // FRIENDSHIP_HIGH
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) >= 200 && retVal == 0 &&
                            friendshipMod == 0)
                        {
                            friendshipMod = itemEffect[paramIdx];
                            friendship = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (friendshipMod > 0 && holdEffect == HOLD_EFFECT_HAPPINESS_UP)
                                friendship += 150 * friendshipMod / 100;
                            else
                                friendship += friendshipMod;
                            if (friendshipMod > 0)
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
                        paramIdx++;
                        break;
                    }
                }
                data2++;
                effect4 >>= 1;
            }
            break;
        }
    }
    return retVal;
}
