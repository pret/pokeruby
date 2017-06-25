#include "global.h"
#include "abilities.h"
#include "battle.h"
#include "berry.h"
#include "data2.h"
#include "event_data.h"
#include "hold_effects.h"
#include "item.h"
#include "items.h"
#include "main.h"
#include "pokemon.h"
#include "species.h"
#include "sprite.h"
#include "string_util.h"
#include "strings2.h"
#include "text.h"

extern u8 gPlayerPartyCount;
extern u8 gEnemyPartyCount;

extern u16 unk_20160BC[];
extern struct SecretBaseRecord gSecretBaseRecord;
extern u32 dword_2017100[];
extern u16 gBattleTypeFlags;
extern struct BattlePokemon gBattleMons[4];
extern u16 gCurrentMove;
extern u8 gLastUsedAbility;
extern u8 gCritMultiplier;
extern u16 gBattleWeather;
extern struct BattleEnigmaBerry gEnigmaBerries[];
extern u16 gBattleMovePower;
extern struct SpriteTemplate gUnknown_02024E8C;
extern u16 gTrainerBattleOpponent;
extern struct PokemonStorage gPokemonStorage;

extern u8 gBadEggNickname[];
extern struct SpriteTemplate gSpriteTemplate_8208288[];
extern u8 gSecretBaseTrainerClasses[];
extern u8 gHoldEffectToType[][2];

#define APPLY_STAT_MOD(var, mon, stat, statIndex)                            \
{                                                                            \
    (var) = (stat) * (gStatStageRatios)[(mon)->statStages[(statIndex)] * 2]; \
    (var) /= (gStatStageRatios + 1)[(mon)->statStages[(statIndex)] * 2];     \
}

#ifdef NONMATCHING
s32 CalculateBaseDamage(struct BattlePokemon *attacker, struct BattlePokemon *defender, u32 move, u16 a4, u16 powerOverride, u8 typeOverride, u8 a7, u8 a8)
{
    s32 i;
    s32 damage = 0;
    u8 type;
    u16 attack, defense;
    u16 spAttack, spDefense;
    u8 defenderHoldEffect;
    u8 defenderHoldEffectParam;
    u8 attackerHoldEffect;
    u8 attackerHoldEffectParam;
    s32 a, b;

    if (!powerOverride)
        gBattleMovePower = gBattleMoves[move].power;
    else
        gBattleMovePower = powerOverride;

    if (!typeOverride)
        type = gBattleMoves[move].type;
    else
        type = typeOverride & 0x3F;

    attack = attacker->attack;
    defense = defender->defense;
    spAttack = attacker->spAttack;
    spDefense = defender->spDefense;

    if (attacker->item == ITEM_ENIGMA_BERRY)
    {
        attackerHoldEffect = gEnigmaBerries[a7].holdEffect;
        attackerHoldEffectParam = gEnigmaBerries[a7].holdEffectParam;
    }
    else
    {
        attackerHoldEffect = ItemId_GetHoldEffect(attacker->item);
        attackerHoldEffectParam = ItemId_GetHoldEffectParam(attacker->item);
    }

    if (defender->item == ITEM_ENIGMA_BERRY)
    {
        defenderHoldEffect = gEnigmaBerries[a8].holdEffect;
        defenderHoldEffectParam = gEnigmaBerries[a8].holdEffectParam;
    }
    else
    {
        defenderHoldEffect = ItemId_GetHoldEffect(defender->item);
        defenderHoldEffectParam = ItemId_GetHoldEffectParam(defender->item);
    }

    if (attacker->ability == ABILITY_HUGE_POWER || attacker->ability == ABILITY_PURE_POWER)
        attack *= 2;

    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_EREADER_TRAINER)))
    {
        if ((gBattleTypeFlags & BATTLE_TYPE_TRAINER)
            && gTrainerBattleOpponent != 1024
            && FlagGet(BADGE01_GET)
            && !GetBankSide(a7))
            attack = (110 * attack) / 100;

        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_EREADER_TRAINER)))
        {
            if ((gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                && gTrainerBattleOpponent != 1024
                && FlagGet(BADGE05_GET)
                && !GetBankSide(a8))
                defense = (110 * defense) / 100;

            if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_EREADER_TRAINER)))
            {
                if ((gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                    && gTrainerBattleOpponent != 1024
                    && FlagGet(BADGE07_GET)
                    && !GetBankSide(a7))
                    spAttack = (110 * spAttack) / 100;

                if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_EREADER_TRAINER)))
                {
                    if ((gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                        && gTrainerBattleOpponent != 1024
                        && FlagGet(BADGE07_GET)
                        && !GetBankSide(a8))
                        spDefense = (110 * spDefense) / 100;
                }
            }
        }
    }

    for (i = 0; i < 17; i++)
    {
        if (attackerHoldEffect == gHoldEffectToType[i][0]
            && type == gHoldEffectToType[i][1])
        {
            if (type <= 8)
                attack = (attack * (attackerHoldEffectParam + 100)) / 100;
            else
                spAttack = (spAttack * (attackerHoldEffectParam + 100)) / 100;
            break;
        }
    }

    if (attackerHoldEffect == HOLD_EFFECT_CHOICE_BAND)
        attack = (150 * attack) / 100;
    if (attackerHoldEffect == HOLD_EFFECT_SOUL_DEW && !(gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER) && (attacker->species == SPECIES_LATIAS || attacker->species == SPECIES_LATIOS))
        spAttack = (150 * spAttack) / 100;
    if (defenderHoldEffect == HOLD_EFFECT_SOUL_DEW && !(gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER) && (defender->species == SPECIES_LATIAS || defender->species == SPECIES_LATIOS))
        spDefense = (150 * spDefense) / 100;
    if (attackerHoldEffect == HOLD_EFFECT_DEEP_SEA_TOOTH && attacker->species == SPECIES_CLAMPERL)
        spAttack *= 2;
    if (defenderHoldEffect == HOLD_EFFECT_DEEP_SEA_SCALE && defender->species == SPECIES_CLAMPERL)
        spDefense *= 2;
    if (attackerHoldEffect == HOLD_EFFECT_LIGHT_BALL && attacker->species == SPECIES_PIKACHU)
        spAttack *= 2;
    if (defenderHoldEffect == HOLD_EFFECT_METAL_POWDER && defender->species == SPECIES_DITTO)
        defense *= 2;
    if (attackerHoldEffect == HOLD_EFFECT_THICK_CLUB && (attacker->species == SPECIES_CUBONE || attacker->species == SPECIES_MAROWAK))
        attack *= 2;
    if (defender->ability == ABILITY_THICK_FAT && (type == TYPE_FIRE || type == TYPE_ICE))
        spAttack /= 2;
    if (attacker->ability == ABILITY_HUSTLE)
        attack = (150 * attack) / 100;
    if (attacker->ability == ABILITY_PLUS && AbilityBattleEffects(0xE, 0, ABILITY_MINUS, 0, 0))
        spAttack = (150 * spAttack) / 100;
    if (attacker->ability == ABILITY_MINUS && AbilityBattleEffects(0xE, 0, ABILITY_PLUS, 0, 0))
        spAttack = (150 * spAttack) / 100;
    if (attacker->ability == ABILITY_GUTS && attacker->status1)
        attack = (150 * attack) / 100;
    if (defender->ability == ABILITY_MARVEL_SCALE && defender->status1)
        defense = (150 * defense) / 100;
    if (type == TYPE_ELECTRIC && AbilityBattleEffects(0xE, 0, 0, 0xFD, 0))
        gBattleMovePower /= 2;
    if (type == TYPE_FIRE && AbilityBattleEffects(0xE, 0, 0, 0xFE, 0))
        gBattleMovePower /= 2;
    if (type == TYPE_GRASS && attacker->ability == ABILITY_OVERGROW && attacker->hp <= (attacker->maxHP / 3))
        gBattleMovePower = (150 * gBattleMovePower) / 100;
    if (type == TYPE_FIRE && attacker->ability == ABILITY_BLAZE && attacker->hp <= (attacker->maxHP / 3))
        gBattleMovePower = (150 * gBattleMovePower) / 100;
    if (type == TYPE_WATER && attacker->ability == ABILITY_TORRENT && attacker->hp <= (attacker->maxHP / 3))
        gBattleMovePower = (150 * gBattleMovePower) / 100;
    if (type == TYPE_BUG && attacker->ability == ABILITY_SWARM && attacker->hp <= (attacker->maxHP / 3))
        gBattleMovePower = (150 * gBattleMovePower) / 100;
    if (gBattleMoves[gCurrentMove].effect == 7)
        defense /= 2;

    if (type < TYPE_MYSTERY) // is physical?
    {
        if (gCritMultiplier == 2)
        {
            if (attacker->statStages[1] > 6)
                APPLY_STAT_MOD(a, attacker, attack, 1)
            else
                a = attack;
        }
        else
            APPLY_STAT_MOD(a, attacker, attack, 1)

        a = a * gBattleMovePower * (2 * attacker->level / 5 + 2);

        if (gCritMultiplier == 2)
        {
            if (defender->statStages[2] < 6)
                APPLY_STAT_MOD(b, defender, defense, 2)
            else
                b = defense;
        }
        else
            APPLY_STAT_MOD(b, defender, defense, 2)

        damage = (a / b) / 50;

        if ((attacker->status1 & 0x10) && attacker->ability != ABILITY_GUTS)
            damage /= 2;

        if ((a4 & 1) && gCritMultiplier == 1)
        {
            if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && CountAliveMons(2) == 2)
                damage = 2 * (damage / 3);
            else
                damage /= 2;
        }

        if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && gBattleMoves[move].target == 8 && CountAliveMons(2) == 2)
            damage /= 2;

        // moves always do at least 1 damage.
        if (damage == 0)
            damage = 1;
    }

    if (type == TYPE_MYSTERY)
        damage = 0; // is ??? type. does 0 damage.

    if (type > TYPE_MYSTERY) // is special?
    {
        if (gCritMultiplier == 2)
        {
            if (attacker->statStages[4] > 6)
                APPLY_STAT_MOD(a, attacker, spAttack, 4)
            else
                a = spAttack;
        }
        else
            APPLY_STAT_MOD(a, attacker, spAttack, 4)

        a = a * gBattleMovePower * (2 * attacker->level / 5 + 2);

        if (gCritMultiplier == 2)
        {
            if (defender->statStages[5] < 6)
                APPLY_STAT_MOD(b, defender, spDefense, 5)
            else
                b = spDefense;
        }
        else
            APPLY_STAT_MOD(b, defender, spDefense, 5)

        damage = (a / b) / 50;

        if ((a4 & 2) && gCritMultiplier == 1)
        {
            if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && CountAliveMons(2) == 2)
                damage = 2 * (damage / 3);
            else
                damage /= 2;
        }

        if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && gBattleMoves[move].target == 8 && CountAliveMons(2) == 2)
            damage /= 2;

        // are effects of weather negated with cloud nine or air lock?
        if (!AbilityBattleEffects(0xE, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(0xE, 0, ABILITY_AIR_LOCK, 0, 0))
        {
            // rain?
            if (gBattleWeather & 1)
            {
                if (type == TYPE_FIRE)
                    damage /= 2;
                else if (type == TYPE_WATER)
                    damage = (15 * damage) / 10;
            }

            // does lack of sun half solar beam damage?
            if ((gBattleWeather & 0x9F) && gCurrentMove == 76)
                damage /= 2;

            // sunny?
            if (gBattleWeather & 0x60)
            {
                if (type == TYPE_FIRE)
                    damage = (15 * damage) / 10;
                else if (type == TYPE_WATER)
                    damage /= 2;
            }
        }

        // flash fire triggered?
        if ((dword_2017100[a7] & 1) && type == TYPE_FIRE)
            damage = (15 * damage) / 10;
    }

    return damage + 2;
}
#else
NAKED
s32 CalculateBaseDamage(struct BattlePokemon *attacker, struct BattlePokemon *defender, u32 move, u16 a4, u16 powerOverride, u8 typeOverride, u8 a7, u8 a8)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x2C\n\
    adds r7, r0, 0\n\
    str r1, [sp, 0x4]\n\
    str r2, [sp, 0x8]\n\
    ldr r0, [sp, 0x4C]\n\
    ldr r1, [sp, 0x50]\n\
    ldr r2, [sp, 0x54]\n\
    ldr r4, [sp, 0x58]\n\
    lsls r3, 16\n\
    lsrs r3, 16\n\
    str r3, [sp, 0xC]\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    lsls r1, 24\n\
    lsrs r6, r1, 24\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    str r2, [sp, 0x10]\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    movs r5, 0\n\
    cmp r3, 0\n\
    bne _0803BA80\n\
    ldr r2, _0803BA78 @ =gBattleMovePower\n\
    ldr r1, _0803BA7C @ =gBattleMoves\n\
    ldr r3, [sp, 0x8]\n\
    lsls r0, r3, 1\n\
    adds r0, r3\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrb r0, [r0, 0x1]\n\
    strh r0, [r2]\n\
    b _0803BA84\n\
    .align 2, 0\n\
_0803BA78: .4byte gBattleMovePower\n\
_0803BA7C: .4byte gBattleMoves\n\
_0803BA80:\n\
    ldr r0, _0803BA9C @ =gBattleMovePower\n\
    strh r3, [r0]\n\
_0803BA84:\n\
    cmp r6, 0\n\
    bne _0803BAA4\n\
    ldr r1, _0803BAA0 @ =gBattleMoves\n\
    ldr r6, [sp, 0x8]\n\
    lsls r0, r6, 1\n\
    adds r0, r6\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrb r0, [r0, 0x2]\n\
    mov r9, r0\n\
    b _0803BAAE\n\
    .align 2, 0\n\
_0803BA9C: .4byte gBattleMovePower\n\
_0803BAA0: .4byte gBattleMoves\n\
_0803BAA4:\n\
    movs r0, 0x3F\n\
    mov r9, r0\n\
    mov r1, r9\n\
    ands r1, r6\n\
    mov r9, r1\n\
_0803BAAE:\n\
    ldrh r6, [r7, 0x2]\n\
    ldr r2, [sp, 0x4]\n\
    ldrh r2, [r2, 0x4]\n\
    str r2, [sp, 0x14]\n\
    ldrh r3, [r7, 0x8]\n\
    mov r8, r3\n\
    ldr r0, [sp, 0x4]\n\
    ldrh r0, [r0, 0xA]\n\
    str r0, [sp, 0x18]\n\
    ldrh r0, [r7, 0x2E]\n\
    cmp r0, 0xAF\n\
    bne _0803BAE0\n\
    ldr r1, _0803BADC @ =gEnigmaBerries\n\
    ldr r2, [sp, 0x10]\n\
    lsls r0, r2, 3\n\
    subs r0, r2\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrb r3, [r0, 0x7]\n\
    mov r10, r3\n\
    ldrb r0, [r0, 0x1A]\n\
    b _0803BAF6\n\
    .align 2, 0\n\
_0803BADC: .4byte gEnigmaBerries\n\
_0803BAE0:\n\
    ldrh r0, [r7, 0x2E]\n\
    bl ItemId_GetHoldEffect\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    ldrh r0, [r7, 0x2E]\n\
    bl ItemId_GetHoldEffectParam\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
_0803BAF6:\n\
    str r0, [sp, 0x20]\n\
    ldr r1, [sp, 0x4]\n\
    ldrh r0, [r1, 0x2E]\n\
    cmp r0, 0xAF\n\
    bne _0803BB26\n\
    ldr r1, _0803BB10 @ =gEnigmaBerries\n\
    lsls r0, r4, 3\n\
    subs r0, r4\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrb r0, [r0, 0x7]\n\
    str r0, [sp, 0x1C]\n\
    b _0803BB3C\n\
    .align 2, 0\n\
_0803BB10: .4byte gEnigmaBerries\n\
_0803BB14:\n\
    ldr r0, [sp, 0x20]\n\
    adds r0, 0x64\n\
    muls r0, r6\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
    b _0803BCDC\n\
_0803BB26:\n\
    ldr r2, [sp, 0x4]\n\
    ldrh r0, [r2, 0x2E]\n\
    bl ItemId_GetHoldEffect\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x1C]\n\
    ldr r3, [sp, 0x4]\n\
    ldrh r0, [r3, 0x2E]\n\
    bl ItemId_GetHoldEffectParam\n\
_0803BB3C:\n\
    adds r0, r7, 0\n\
    adds r0, 0x20\n\
    ldrb r1, [r0]\n\
    str r0, [sp, 0x24]\n\
    cmp r1, 0x25\n\
    beq _0803BB4C\n\
    cmp r1, 0x4A\n\
    bne _0803BB50\n\
_0803BB4C:\n\
    lsls r0, r6, 17\n\
    lsrs r6, r0, 16\n\
_0803BB50:\n\
    ldr r0, _0803BCB8 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    ldr r0, _0803BCBC @ =0x00000902\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803BB5E\n\
    b _0803BC78\n\
_0803BB5E:\n\
    movs r0, 0x8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803BB98\n\
    ldr r0, _0803BCC0 @ =gTrainerBattleOpponent\n\
    ldrh r1, [r0]\n\
    movs r0, 0x80\n\
    lsls r0, 3\n\
    cmp r1, r0\n\
    beq _0803BB98\n\
    ldr r0, _0803BCC4 @ =0x00000807\n\
    bl FlagGet\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0803BB98\n\
    ldr r0, [sp, 0x10]\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0803BB98\n\
    movs r0, 0x6E\n\
    muls r0, r6\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
_0803BB98:\n\
    ldr r0, _0803BCB8 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    ldr r0, _0803BCBC @ =0x00000902\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0803BC78\n\
    movs r0, 0x8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803BBE2\n\
    ldr r0, _0803BCC0 @ =gTrainerBattleOpponent\n\
    ldrh r1, [r0]\n\
    movs r0, 0x80\n\
    lsls r0, 3\n\
    cmp r1, r0\n\
    beq _0803BBE2\n\
    ldr r0, _0803BCC8 @ =0x0000080b\n\
    bl FlagGet\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0803BBE2\n\
    adds r0, r4, 0\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0803BBE2\n\
    movs r0, 0x6E\n\
    ldr r1, [sp, 0x14]\n\
    muls r0, r1\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x14]\n\
_0803BBE2:\n\
    ldr r0, _0803BCB8 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    ldr r0, _0803BCBC @ =0x00000902\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0803BC78\n\
    movs r0, 0x8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803BC2E\n\
    ldr r0, _0803BCC0 @ =gTrainerBattleOpponent\n\
    ldrh r1, [r0]\n\
    movs r0, 0x80\n\
    lsls r0, 3\n\
    cmp r1, r0\n\
    beq _0803BC2E\n\
    ldr r0, _0803BCCC @ =0x0000080d\n\
    bl FlagGet\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0803BC2E\n\
    ldr r0, [sp, 0x10]\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0803BC2E\n\
    movs r0, 0x6E\n\
    mov r2, r8\n\
    muls r2, r0\n\
    adds r0, r2, 0\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
_0803BC2E:\n\
    ldr r0, _0803BCB8 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    ldr r0, _0803BCBC @ =0x00000902\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0803BC78\n\
    movs r0, 0x8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803BC78\n\
    ldr r0, _0803BCC0 @ =gTrainerBattleOpponent\n\
    ldrh r1, [r0]\n\
    movs r0, 0x80\n\
    lsls r0, 3\n\
    cmp r1, r0\n\
    beq _0803BC78\n\
    ldr r0, _0803BCCC @ =0x0000080d\n\
    bl FlagGet\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0803BC78\n\
    adds r0, r4, 0\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0803BC78\n\
    movs r0, 0x6E\n\
    ldr r3, [sp, 0x18]\n\
    muls r0, r3\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x18]\n\
_0803BC78:\n\
    movs r2, 0\n\
    ldr r4, _0803BCD0 @ =gHoldEffectToType\n\
    ldr r0, [sp, 0x4]\n\
    adds r0, 0x20\n\
    str r0, [sp, 0x28]\n\
    adds r3, r4, 0\n\
_0803BC84:\n\
    lsls r1, r2, 1\n\
    ldrb r0, [r3]\n\
    cmp r10, r0\n\
    bne _0803BCD4\n\
    adds r0, r4, 0x1\n\
    adds r0, r1, r0\n\
    ldrb r0, [r0]\n\
    cmp r9, r0\n\
    bne _0803BCD4\n\
    mov r1, r9\n\
    cmp r1, 0x8\n\
    bhi _0803BC9E\n\
    b _0803BB14\n\
_0803BC9E:\n\
    ldr r0, [sp, 0x20]\n\
    adds r0, 0x64\n\
    mov r2, r8\n\
    muls r2, r0\n\
    adds r0, r2, 0\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
    b _0803BCDC\n\
    .align 2, 0\n\
_0803BCB8: .4byte gBattleTypeFlags\n\
_0803BCBC: .4byte 0x00000902\n\
_0803BCC0: .4byte gTrainerBattleOpponent\n\
_0803BCC4: .4byte 0x00000807\n\
_0803BCC8: .4byte 0x0000080b\n\
_0803BCCC: .4byte 0x0000080d\n\
_0803BCD0: .4byte gHoldEffectToType\n\
_0803BCD4:\n\
    adds r3, 0x2\n\
    adds r2, 0x1\n\
    cmp r2, 0x10\n\
    bls _0803BC84\n\
_0803BCDC:\n\
    mov r3, r10\n\
    cmp r3, 0x1D\n\
    bne _0803BCF0\n\
    movs r0, 0x96\n\
    muls r0, r6\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
_0803BCF0:\n\
    mov r0, r10\n\
    cmp r0, 0x22\n\
    bne _0803BD28\n\
    ldr r0, _0803BFDC @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x80\n\
    lsls r0, 1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0803BD28\n\
    ldr r1, _0803BFE0 @ =0xfffffe69\n\
    adds r0, r1, 0\n\
    ldrh r2, [r7]\n\
    adds r0, r2\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0x1\n\
    bhi _0803BD28\n\
    movs r0, 0x96\n\
    mov r3, r8\n\
    muls r3, r0\n\
    adds r0, r3, 0\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
_0803BD28:\n\
    ldr r0, [sp, 0x1C]\n\
    cmp r0, 0x22\n\
    bne _0803BD60\n\
    ldr r0, _0803BFDC @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x80\n\
    lsls r0, 1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0803BD60\n\
    ldr r1, _0803BFE0 @ =0xfffffe69\n\
    adds r0, r1, 0\n\
    ldr r2, [sp, 0x4]\n\
    ldrh r2, [r2]\n\
    adds r0, r2\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0x1\n\
    bhi _0803BD60\n\
    movs r0, 0x96\n\
    ldr r3, [sp, 0x18]\n\
    muls r0, r3\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x18]\n\
_0803BD60:\n\
    mov r0, r10\n\
    cmp r0, 0x23\n\
    bne _0803BD76\n\
    ldrh r1, [r7]\n\
    ldr r0, _0803BFE4 @ =0x00000175\n\
    cmp r1, r0\n\
    bne _0803BD76\n\
    mov r1, r8\n\
    lsls r0, r1, 17\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
_0803BD76:\n\
    ldr r2, [sp, 0x1C]\n\
    cmp r2, 0x24\n\
    bne _0803BD8E\n\
    ldr r3, [sp, 0x4]\n\
    ldrh r1, [r3]\n\
    ldr r0, _0803BFE4 @ =0x00000175\n\
    cmp r1, r0\n\
    bne _0803BD8E\n\
    ldr r1, [sp, 0x18]\n\
    lsls r0, r1, 17\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x18]\n\
_0803BD8E:\n\
    mov r2, r10\n\
    cmp r2, 0x2D\n\
    bne _0803BDA2\n\
    ldrh r0, [r7]\n\
    cmp r0, 0x19\n\
    bne _0803BDA2\n\
    mov r3, r8\n\
    lsls r0, r3, 17\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
_0803BDA2:\n\
    ldr r0, [sp, 0x1C]\n\
    cmp r0, 0x40\n\
    bne _0803BDB8\n\
    ldr r1, [sp, 0x4]\n\
    ldrh r0, [r1]\n\
    cmp r0, 0x84\n\
    bne _0803BDB8\n\
    ldr r2, [sp, 0x14]\n\
    lsls r0, r2, 17\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x14]\n\
_0803BDB8:\n\
    mov r3, r10\n\
    cmp r3, 0x41\n\
    bne _0803BDCE\n\
    ldrh r0, [r7]\n\
    subs r0, 0x68\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0x1\n\
    bhi _0803BDCE\n\
    lsls r0, r6, 17\n\
    lsrs r6, r0, 16\n\
_0803BDCE:\n\
    ldr r1, [sp, 0x28]\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x2F\n\
    bne _0803BDE6\n\
    mov r2, r9\n\
    cmp r2, 0xA\n\
    beq _0803BDE0\n\
    cmp r2, 0xF\n\
    bne _0803BDE6\n\
_0803BDE0:\n\
    mov r3, r8\n\
    lsrs r3, 1\n\
    mov r8, r3\n\
_0803BDE6:\n\
    ldr r0, [sp, 0x24]\n\
    ldrb r4, [r0]\n\
    cmp r4, 0x37\n\
    bne _0803BDFC\n\
    movs r0, 0x96\n\
    muls r0, r6\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
_0803BDFC:\n\
    cmp r4, 0x39\n\
    bne _0803BE2A\n\
    movs r0, 0\n\
    str r0, [sp]\n\
    movs r0, 0xE\n\
    movs r1, 0\n\
    movs r2, 0x3A\n\
    movs r3, 0\n\
    bl AbilityBattleEffects\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0803BE2A\n\
    movs r0, 0x96\n\
    mov r1, r8\n\
    muls r1, r0\n\
    adds r0, r1, 0\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
_0803BE2A:\n\
    ldr r2, [sp, 0x24]\n\
    ldrb r0, [r2]\n\
    cmp r0, 0x3A\n\
    bne _0803BE5C\n\
    movs r0, 0\n\
    str r0, [sp]\n\
    movs r0, 0xE\n\
    movs r1, 0\n\
    movs r2, 0x39\n\
    movs r3, 0\n\
    bl AbilityBattleEffects\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0803BE5C\n\
    movs r0, 0x96\n\
    mov r3, r8\n\
    muls r3, r0\n\
    adds r0, r3, 0\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
_0803BE5C:\n\
    ldr r1, [sp, 0x24]\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x3E\n\
    bne _0803BE78\n\
    ldr r0, [r7, 0x4C]\n\
    cmp r0, 0\n\
    beq _0803BE78\n\
    movs r0, 0x96\n\
    muls r0, r6\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
_0803BE78:\n\
    ldr r2, [sp, 0x28]\n\
    ldrb r0, [r2]\n\
    cmp r0, 0x3F\n\
    bne _0803BE9A\n\
    ldr r3, [sp, 0x4]\n\
    ldr r0, [r3, 0x4C]\n\
    cmp r0, 0\n\
    beq _0803BE9A\n\
    movs r0, 0x96\n\
    ldr r1, [sp, 0x14]\n\
    muls r0, r1\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x14]\n\
_0803BE9A:\n\
    mov r2, r9\n\
    cmp r2, 0xD\n\
    bne _0803BEBE\n\
    movs r0, 0\n\
    str r0, [sp]\n\
    movs r0, 0xE\n\
    movs r1, 0\n\
    movs r2, 0\n\
    movs r3, 0xFD\n\
    bl AbilityBattleEffects\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0803BEBE\n\
    ldr r1, _0803BFE8 @ =gBattleMovePower\n\
    ldrh r0, [r1]\n\
    lsrs r0, 1\n\
    strh r0, [r1]\n\
_0803BEBE:\n\
    mov r3, r9\n\
    cmp r3, 0xA\n\
    bne _0803BEE2\n\
    movs r0, 0\n\
    str r0, [sp]\n\
    movs r0, 0xE\n\
    movs r1, 0\n\
    movs r2, 0\n\
    movs r3, 0xFE\n\
    bl AbilityBattleEffects\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0803BEE2\n\
    ldr r1, _0803BFE8 @ =gBattleMovePower\n\
    ldrh r0, [r1]\n\
    lsrs r0, 1\n\
    strh r0, [r1]\n\
_0803BEE2:\n\
    mov r0, r9\n\
    cmp r0, 0xC\n\
    bne _0803BF12\n\
    ldr r1, [sp, 0x24]\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x41\n\
    bne _0803BF12\n\
    ldrh r0, [r7, 0x2C]\n\
    movs r1, 0x3\n\
    bl __udivsi3\n\
    ldrh r1, [r7, 0x28]\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r1, r0\n\
    bhi _0803BF12\n\
    ldr r4, _0803BFE8 @ =gBattleMovePower\n\
    ldrh r1, [r4]\n\
    movs r0, 0x96\n\
    muls r0, r1\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    strh r0, [r4]\n\
_0803BF12:\n\
    mov r2, r9\n\
    cmp r2, 0xA\n\
    bne _0803BF42\n\
    ldr r3, [sp, 0x24]\n\
    ldrb r0, [r3]\n\
    cmp r0, 0x42\n\
    bne _0803BF42\n\
    ldrh r0, [r7, 0x2C]\n\
    movs r1, 0x3\n\
    bl __udivsi3\n\
    ldrh r1, [r7, 0x28]\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r1, r0\n\
    bhi _0803BF42\n\
    ldr r4, _0803BFE8 @ =gBattleMovePower\n\
    ldrh r1, [r4]\n\
    movs r0, 0x96\n\
    muls r0, r1\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    strh r0, [r4]\n\
_0803BF42:\n\
    mov r0, r9\n\
    cmp r0, 0xB\n\
    bne _0803BF72\n\
    ldr r1, [sp, 0x24]\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x43\n\
    bne _0803BF72\n\
    ldrh r0, [r7, 0x2C]\n\
    movs r1, 0x3\n\
    bl __udivsi3\n\
    ldrh r1, [r7, 0x28]\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r1, r0\n\
    bhi _0803BF72\n\
    ldr r4, _0803BFE8 @ =gBattleMovePower\n\
    ldrh r1, [r4]\n\
    movs r0, 0x96\n\
    muls r0, r1\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    strh r0, [r4]\n\
_0803BF72:\n\
    mov r2, r9\n\
    cmp r2, 0x6\n\
    bne _0803BFA2\n\
    ldr r3, [sp, 0x24]\n\
    ldrb r0, [r3]\n\
    cmp r0, 0x44\n\
    bne _0803BFA2\n\
    ldrh r0, [r7, 0x2C]\n\
    movs r1, 0x3\n\
    bl __udivsi3\n\
    ldrh r1, [r7, 0x28]\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r1, r0\n\
    bhi _0803BFA2\n\
    ldr r4, _0803BFE8 @ =gBattleMovePower\n\
    ldrh r1, [r4]\n\
    movs r0, 0x96\n\
    muls r0, r1\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    strh r0, [r4]\n\
_0803BFA2:\n\
    ldr r2, _0803BFEC @ =gBattleMoves\n\
    ldr r0, _0803BFF0 @ =gCurrentMove\n\
    ldrh r1, [r0]\n\
    lsls r0, r1, 1\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x7\n\
    bne _0803BFBC\n\
    ldr r0, [sp, 0x14]\n\
    lsrs r0, 1\n\
    str r0, [sp, 0x14]\n\
_0803BFBC:\n\
    mov r1, r9\n\
    cmp r1, 0x8\n\
    bls _0803BFC4\n\
    b _0803C122\n\
_0803BFC4:\n\
    ldr r0, _0803BFF4 @ =gCritMultiplier\n\
    ldrb r1, [r0]\n\
    adds r4, r0, 0\n\
    cmp r1, 0x2\n\
    bne _0803C000\n\
    movs r0, 0x19\n\
    ldrsb r0, [r7, r0]\n\
    cmp r0, 0x6\n\
    ble _0803BFFC\n\
    ldr r2, _0803BFF8 @ =gStatStageRatios\n\
    b _0803C006\n\
    .align 2, 0\n\
_0803BFDC: .4byte gBattleTypeFlags\n\
_0803BFE0: .4byte 0xfffffe69\n\
_0803BFE4: .4byte 0x00000175\n\
_0803BFE8: .4byte gBattleMovePower\n\
_0803BFEC: .4byte gBattleMoves\n\
_0803BFF0: .4byte gCurrentMove\n\
_0803BFF4: .4byte gCritMultiplier\n\
_0803BFF8: .4byte gStatStageRatios\n\
_0803BFFC:\n\
    adds r5, r6, 0\n\
    b _0803C01E\n\
_0803C000:\n\
    ldr r2, _0803C050 @ =gStatStageRatios\n\
    movs r0, 0x19\n\
    ldrsb r0, [r7, r0]\n\
_0803C006:\n\
    lsls r0, 1\n\
    adds r1, r0, r2\n\
    ldrb r1, [r1]\n\
    adds r5, r6, 0\n\
    muls r5, r1\n\
    adds r2, 0x1\n\
    adds r0, r2\n\
    ldrb r1, [r0]\n\
    adds r0, r5, 0\n\
    bl __divsi3\n\
    adds r5, r0, 0\n\
_0803C01E:\n\
    ldr r0, _0803C054 @ =gBattleMovePower\n\
    ldrh r0, [r0]\n\
    muls r5, r0\n\
    adds r0, r7, 0\n\
    adds r0, 0x2A\n\
    ldrb r0, [r0]\n\
    lsls r0, 1\n\
    movs r1, 0x5\n\
    bl __divsi3\n\
    adds r0, 0x2\n\
    muls r5, r0\n\
    ldrb r0, [r4]\n\
    cmp r0, 0x2\n\
    bne _0803C05C\n\
    ldr r2, [sp, 0x4]\n\
    movs r0, 0x1A\n\
    ldrsb r0, [r2, r0]\n\
    cmp r0, 0x5\n\
    bgt _0803C058\n\
    ldr r2, _0803C050 @ =gStatStageRatios\n\
    ldr r3, [sp, 0x4]\n\
    movs r0, 0x1A\n\
    ldrsb r0, [r3, r0]\n\
    b _0803C064\n\
    .align 2, 0\n\
_0803C050: .4byte gStatStageRatios\n\
_0803C054: .4byte gBattleMovePower\n\
_0803C058:\n\
    ldr r3, [sp, 0x14]\n\
    b _0803C07E\n\
_0803C05C:\n\
    ldr r2, _0803C0DC @ =gStatStageRatios\n\
    ldr r1, [sp, 0x4]\n\
    movs r0, 0x1A\n\
    ldrsb r0, [r1, r0]\n\
_0803C064:\n\
    lsls r0, 1\n\
    adds r1, r0, r2\n\
    ldrb r1, [r1]\n\
    ldr r6, [sp, 0x14]\n\
    adds r3, r6, 0\n\
    muls r3, r1\n\
    adds r2, 0x1\n\
    adds r0, r2\n\
    ldrb r1, [r0]\n\
    adds r0, r3, 0\n\
    bl __divsi3\n\
    adds r3, r0, 0\n\
_0803C07E:\n\
    adds r0, r5, 0\n\
    adds r1, r3, 0\n\
    bl __divsi3\n\
    adds r5, r0, 0\n\
    movs r1, 0x32\n\
    bl __divsi3\n\
    adds r5, r0, 0\n\
    ldr r0, [r7, 0x4C]\n\
    movs r1, 0x10\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803C0A8\n\
    ldr r1, [sp, 0x24]\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x3E\n\
    beq _0803C0A8\n\
    lsrs r0, r5, 31\n\
    adds r0, r5, r0\n\
    asrs r5, r0, 1\n\
_0803C0A8:\n\
    movs r0, 0x1\n\
    ldr r2, [sp, 0xC]\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    beq _0803C0EA\n\
    ldrb r1, [r4]\n\
    cmp r1, 0x1\n\
    bne _0803C0EA\n\
    ldr r0, _0803C0E0 @ =gBattleTypeFlags\n\
    ldrh r0, [r0]\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _0803C0E4\n\
    movs r0, 0x2\n\
    bl CountAliveMons\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x2\n\
    bne _0803C0E4\n\
    adds r0, r5, 0\n\
    movs r1, 0x3\n\
    bl __divsi3\n\
    lsls r5, r0, 1\n\
    b _0803C0EA\n\
    .align 2, 0\n\
_0803C0DC: .4byte gStatStageRatios\n\
_0803C0E0: .4byte gBattleTypeFlags\n\
_0803C0E4:\n\
    lsrs r0, r5, 31\n\
    adds r0, r5, r0\n\
    asrs r5, r0, 1\n\
_0803C0EA:\n\
    ldr r0, _0803C148 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803C11C\n\
    ldr r0, _0803C14C @ =gBattleMoves\n\
    ldr r3, [sp, 0x8]\n\
    lsls r1, r3, 1\n\
    adds r1, r3\n\
    lsls r1, 2\n\
    adds r1, r0\n\
    ldrb r0, [r1, 0x6]\n\
    cmp r0, 0x8\n\
    bne _0803C11C\n\
    movs r0, 0x2\n\
    bl CountAliveMons\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x2\n\
    bne _0803C11C\n\
    lsrs r0, r5, 31\n\
    adds r0, r5, r0\n\
    asrs r5, r0, 1\n\
_0803C11C:\n\
    cmp r5, 0\n\
    bne _0803C122\n\
    movs r5, 0x1\n\
_0803C122:\n\
    mov r6, r9\n\
    cmp r6, 0x9\n\
    bne _0803C12A\n\
    movs r5, 0\n\
_0803C12A:\n\
    mov r0, r9\n\
    cmp r0, 0x9\n\
    bhi _0803C132\n\
    b _0803C330\n\
_0803C132:\n\
    ldr r0, _0803C150 @ =gCritMultiplier\n\
    ldrb r1, [r0]\n\
    adds r4, r0, 0\n\
    cmp r1, 0x2\n\
    bne _0803C15C\n\
    movs r0, 0x1C\n\
    ldrsb r0, [r7, r0]\n\
    cmp r0, 0x6\n\
    ble _0803C158\n\
    ldr r2, _0803C154 @ =gStatStageRatios\n\
    b _0803C162\n\
    .align 2, 0\n\
_0803C148: .4byte gBattleTypeFlags\n\
_0803C14C: .4byte gBattleMoves\n\
_0803C150: .4byte gCritMultiplier\n\
_0803C154: .4byte gStatStageRatios\n\
_0803C158:\n\
    mov r5, r8\n\
    b _0803C17A\n\
_0803C15C:\n\
    ldr r2, _0803C1A8 @ =gStatStageRatios\n\
    movs r0, 0x1C\n\
    ldrsb r0, [r7, r0]\n\
_0803C162:\n\
    lsls r0, 1\n\
    adds r1, r0, r2\n\
    ldrb r1, [r1]\n\
    mov r5, r8\n\
    muls r5, r1\n\
    adds r2, 0x1\n\
    adds r0, r2\n\
    ldrb r1, [r0]\n\
    adds r0, r5, 0\n\
    bl __divsi3\n\
    adds r5, r0, 0\n\
_0803C17A:\n\
    ldr r0, _0803C1AC @ =gBattleMovePower\n\
    ldrh r0, [r0]\n\
    muls r5, r0\n\
    adds r0, r7, 0\n\
    adds r0, 0x2A\n\
    ldrb r0, [r0]\n\
    lsls r0, 1\n\
    movs r1, 0x5\n\
    bl __divsi3\n\
    adds r0, 0x2\n\
    muls r5, r0\n\
    ldrb r0, [r4]\n\
    cmp r0, 0x2\n\
    bne _0803C1B4\n\
    ldr r1, [sp, 0x4]\n\
    movs r0, 0x1D\n\
    ldrsb r0, [r1, r0]\n\
    cmp r0, 0x5\n\
    bgt _0803C1B0\n\
    ldr r2, _0803C1A8 @ =gStatStageRatios\n\
    b _0803C1BC\n\
    .align 2, 0\n\
_0803C1A8: .4byte gStatStageRatios\n\
_0803C1AC: .4byte gBattleMovePower\n\
_0803C1B0:\n\
    ldr r3, [sp, 0x18]\n\
    b _0803C1D6\n\
_0803C1B4:\n\
    ldr r2, _0803C21C @ =gStatStageRatios\n\
    ldr r1, [sp, 0x4]\n\
    movs r0, 0x1D\n\
    ldrsb r0, [r1, r0]\n\
_0803C1BC:\n\
    lsls r0, 1\n\
    adds r1, r0, r2\n\
    ldrb r1, [r1]\n\
    ldr r6, [sp, 0x18]\n\
    adds r3, r6, 0\n\
    muls r3, r1\n\
    adds r2, 0x1\n\
    adds r0, r2\n\
    ldrb r1, [r0]\n\
    adds r0, r3, 0\n\
    bl __divsi3\n\
    adds r3, r0, 0\n\
_0803C1D6:\n\
    adds r0, r5, 0\n\
    adds r1, r3, 0\n\
    bl __divsi3\n\
    adds r5, r0, 0\n\
    movs r1, 0x32\n\
    bl __divsi3\n\
    adds r5, r0, 0\n\
    movs r0, 0x2\n\
    ldr r1, [sp, 0xC]\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803C22A\n\
    ldrb r1, [r4]\n\
    cmp r1, 0x1\n\
    bne _0803C22A\n\
    ldr r0, _0803C220 @ =gBattleTypeFlags\n\
    ldrh r0, [r0]\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _0803C224\n\
    movs r0, 0x2\n\
    bl CountAliveMons\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x2\n\
    bne _0803C224\n\
    adds r0, r5, 0\n\
    movs r1, 0x3\n\
    bl __divsi3\n\
    lsls r5, r0, 1\n\
    b _0803C22A\n\
    .align 2, 0\n\
_0803C21C: .4byte gStatStageRatios\n\
_0803C220: .4byte gBattleTypeFlags\n\
_0803C224:\n\
    lsrs r0, r5, 31\n\
    adds r0, r5, r0\n\
    asrs r5, r0, 1\n\
_0803C22A:\n\
    ldr r0, _0803C2A4 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803C25C\n\
    ldr r0, _0803C2A8 @ =gBattleMoves\n\
    ldr r2, [sp, 0x8]\n\
    lsls r1, r2, 1\n\
    adds r1, r2\n\
    lsls r1, 2\n\
    adds r1, r0\n\
    ldrb r0, [r1, 0x6]\n\
    cmp r0, 0x8\n\
    bne _0803C25C\n\
    movs r0, 0x2\n\
    bl CountAliveMons\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x2\n\
    bne _0803C25C\n\
    lsrs r0, r5, 31\n\
    adds r0, r5, r0\n\
    asrs r5, r0, 1\n\
_0803C25C:\n\
    movs r0, 0\n\
    str r0, [sp]\n\
    movs r0, 0xE\n\
    movs r1, 0\n\
    movs r2, 0xD\n\
    movs r3, 0\n\
    bl AbilityBattleEffects\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0\n\
    bne _0803C30C\n\
    str r0, [sp]\n\
    movs r0, 0xE\n\
    movs r1, 0\n\
    movs r2, 0x4D\n\
    movs r3, 0\n\
    bl AbilityBattleEffects\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0803C30C\n\
    ldr r2, _0803C2AC @ =gBattleWeather\n\
    ldrh r1, [r2]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    adds r4, r2, 0\n\
    cmp r0, 0\n\
    beq _0803C2C4\n\
    mov r3, r9\n\
    cmp r3, 0xA\n\
    beq _0803C2B0\n\
    cmp r3, 0xB\n\
    beq _0803C2B8\n\
    b _0803C2C4\n\
    .align 2, 0\n\
_0803C2A4: .4byte gBattleTypeFlags\n\
_0803C2A8: .4byte gBattleMoves\n\
_0803C2AC: .4byte gBattleWeather\n\
_0803C2B0:\n\
    lsrs r0, r5, 31\n\
    adds r0, r5, r0\n\
    asrs r5, r0, 1\n\
    b _0803C2C4\n\
_0803C2B8:\n\
    lsls r0, r5, 4\n\
    subs r0, r5\n\
    movs r1, 0xA\n\
    bl __divsi3\n\
    adds r5, r0, 0\n\
_0803C2C4:\n\
    ldrh r1, [r4]\n\
    movs r0, 0x9F\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803C2DC\n\
    ldr r0, _0803C2F4 @ =gCurrentMove\n\
    ldrh r0, [r0]\n\
    cmp r0, 0x4C\n\
    bne _0803C2DC\n\
    lsrs r0, r5, 31\n\
    adds r0, r5, r0\n\
    asrs r5, r0, 1\n\
_0803C2DC:\n\
    ldrh r1, [r4]\n\
    movs r0, 0x60\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803C30C\n\
    mov r6, r9\n\
    cmp r6, 0xA\n\
    beq _0803C2F8\n\
    cmp r6, 0xB\n\
    beq _0803C306\n\
    b _0803C30C\n\
    .align 2, 0\n\
_0803C2F4: .4byte gCurrentMove\n\
_0803C2F8:\n\
    lsls r0, r5, 4\n\
    subs r0, r5\n\
    movs r1, 0xA\n\
    bl __divsi3\n\
    adds r5, r0, 0\n\
    b _0803C30C\n\
_0803C306:\n\
    lsrs r0, r5, 31\n\
    adds r0, r5, r0\n\
    asrs r5, r0, 1\n\
_0803C30C:\n\
    ldr r1, _0803C344 @ =0x02017100\n\
    ldr r2, [sp, 0x10]\n\
    lsls r0, r2, 2\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    movs r1, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803C330\n\
    mov r3, r9\n\
    cmp r3, 0xA\n\
    bne _0803C330\n\
    lsls r0, r5, 4\n\
    subs r0, r5\n\
    movs r1, 0xA\n\
    bl __divsi3\n\
    adds r5, r0, 0\n\
_0803C330:\n\
    adds r0, r5, 0x2\n\
    add sp, 0x2C\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_0803C344: .4byte 0x02017100\n\
    .syntax divided");
}
#endif
