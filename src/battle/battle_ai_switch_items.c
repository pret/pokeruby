#include "global.h"
#include "battle.h"
#include "battle_ai_switch_items.h"
#include "battle_script_commands.h"
#include "data2.h"
#include "ewram.h"
#include "pokemon.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "rom3.h"
#include "util.h"
#include "constants/abilities.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/species.h"

extern u8 gUnknown_02023A14_50;

extern u8 gLastHitBy[];
extern u8 gActiveBattler;
extern u16 gBattleTypeFlags;
extern u8 gAbsentBattlerFlags;
extern s32 gBattleMoveDamage;
extern u8 gMoveResultFlags;
extern u16 gDynamicBasePower;
extern u8 gCritMultiplier;
extern u16 gBattlerPartyIndexes[];
extern u16 gLastLandedMoves[];
extern const u8 gTypeEffectiveness[];
extern struct BattlePokemon gBattleMons[];
extern u32 gStatuses3[MAX_BATTLERS_COUNT];

static bool8 HasSuperEffectiveMoveAgainstOpponents(bool8 noRng);
static bool8 FindMonWithFlagsAndSuperEffective(u8 flags, u8 moduloPercent);
static bool8 ShouldUseItem(void);


static bool8 ShouldSwitchIfPerishSong(void)
{
    if (gStatuses3[gActiveBattler] & STATUS3_PERISH_SONG
        && gDisableStructs[gActiveBattler].perishSongTimer1 == 0)
    {
        ewram160C8arr(GetBattlerPosition(gActiveBattler)) = 6; // gBattleStruct->AI_monToSwitchIntoId[GetBattlerPosition(gActiveBattler)] = 6;
        Emitcmd33(1, 2, 0);
        return TRUE;
    }

    return FALSE;
}

#ifdef NONMATCHING
static bool8 ShouldSwitchIfWonderGuard(void)
{
    u8 opposingBattler;
    u8 moveFlags;
    s32 i, j;

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        return FALSE;

    if (gBattleMons[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)].ability != ABILITY_WONDER_GUARD)
        return FALSE;

    // check if pokemon has a super effective move
    opposingBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
    for (i = 0; i < 4; i++)
    {
        u16 move = gBattleMons[gActiveBattler].moves[i];
        if (move == MOVE_NONE)
            continue;

        moveFlags = AI_TypeCalc(move, gBattleMons[opposingBattler].species, gBattleMons[opposingBattler].ability);
        if (moveFlags & MOVE_RESULT_SUPER_EFFECTIVE)
            return FALSE;
    }

    // find a pokemon in the party that has a super effective move
    for (i = 0; i < 6; i++)
    {
        if (GetMonData(&gEnemyParty[i], MON_DATA_HP) == 0
            || GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == SPECIES_NONE
            || GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == SPECIES_EGG
            || i == gBattlerPartyIndexes[gActiveBattler])
            continue;

        GetMonData(&gEnemyParty[i], MON_DATA_SPECIES); // unused return value
        GetMonData(&gEnemyParty[i], MON_DATA_ALT_ABILITY); // unused return value

        opposingBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
        for (j = 0; j < 4; j++)
        {
            u16 move = GetMonData(&gEnemyParty[i], MON_DATA_MOVE1 + j);
            if (move == MOVE_NONE)
                continue;

            moveFlags = AI_TypeCalc(move, gBattleMons[opposingBattler].species, gBattleMons[opposingBattler].ability);
            if (moveFlags & MOVE_RESULT_SUPER_EFFECTIVE && (Random() % 3) < 2)
            {
                // we found a mon
                ewram160C8arr(GetBattlerPosition(gActiveBattler)) = i; // gBattleStruct->AI_monToSwitchIntoId[GetBattlerPosition(gActiveBattler)] = i;
                Emitcmd33(1, B_ACTION_SWITCH, 0);
                return TRUE;
            }
        }
    }

    return FALSE; // at this point there is not a single pokemon in the party that has a super effective move against a pokemon with wonder guard
}
#else
NAKED
static bool8 ShouldSwitchIfWonderGuard(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r9\n\
    mov r6, r8\n\
    push {r6,r7}\n\
    ldr r0, _0803606C @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080360A0\n\
    b _080361C8\n\
    .align 2, 0\n\
_0803606C: .4byte gBattleTypeFlags\n\
_08036070:\n\
    ldr r0, _08036094 @ =gActiveBattler\n\
    ldrb r0, [r0]\n\
    bl GetBattlerPosition\n\
    ldr r1, _08036098 @ =gSharedMem\n\
    lsls r0, 24\n\
    lsrs r0, 25\n\
    ldr r2, _0803609C @ =0x000160c8\n\
    adds r0, r2\n\
    adds r0, r1\n\
    strb r6, [r0]\n\
    movs r0, 0x1\n\
    movs r1, 0x2\n\
    movs r2, 0\n\
    bl Emitcmd33\n\
    movs r0, 0x1\n\
    b _080361CA\n\
    .align 2, 0\n\
_08036094: .4byte gActiveBattler\n\
_08036098: .4byte gSharedMem\n\
_0803609C: .4byte 0x000160c8\n\
_080360A0:\n\
    ldr r4, _080361D8 @ =gBattleMons\n\
    movs r0, 0\n\
    bl GetBattlerAtPosition\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    movs r1, 0x58\n\
    muls r0, r1\n\
    adds r0, r4\n\
    adds r0, 0x20\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x19\n\
    beq _080360BC\n\
    b _080361C8\n\
_080360BC:\n\
    movs r0, 0\n\
    bl GetBattlerAtPosition\n\
    lsls r0, 24\n\
    lsrs r2, r0, 24\n\
    movs r6, 0\n\
    adds r7, r4, 0\n\
    movs r5, 0x58\n\
    adds r0, r2, 0\n\
    muls r0, r5\n\
    adds r4, r0, r7\n\
    movs r3, 0x20\n\
    adds r3, r4\n\
    mov r8, r3\n\
_080360D8:\n\
    lsls r1, r6, 1\n\
    ldr r0, _080361DC @ =gActiveBattler\n\
    ldrb r0, [r0]\n\
    muls r0, r5\n\
    adds r1, r0\n\
    adds r0, r7, 0\n\
    adds r0, 0xC\n\
    adds r1, r0\n\
    ldrh r0, [r1]\n\
    cmp r0, 0\n\
    beq _08036104\n\
    ldrh r1, [r4]\n\
    mov r3, r8\n\
    ldrb r2, [r3]\n\
    bl AI_TypeCalc\n\
    lsls r0, 24\n\
    lsrs r1, r0, 24\n\
    movs r0, 0x2\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    bne _080361C8\n\
_08036104:\n\
    adds r6, 0x1\n\
    cmp r6, 0x3\n\
    ble _080360D8\n\
    movs r6, 0\n\
    ldr r0, _080361E0 @ =gEnemyParty\n\
    mov r9, r0\n\
_08036110:\n\
    movs r0, 0x64\n\
    adds r5, r6, 0\n\
    muls r5, r0\n\
    mov r2, r9\n\
    adds r4, r5, r2\n\
    adds r0, r4, 0\n\
    movs r1, 0x39\n\
    bl GetMonData\n\
    cmp r0, 0\n\
    beq _080361C2\n\
    adds r0, r4, 0\n\
    movs r1, 0x41\n\
    bl GetMonData\n\
    cmp r0, 0\n\
    beq _080361C2\n\
    adds r0, r4, 0\n\
    movs r1, 0x41\n\
    bl GetMonData\n\
    movs r1, 0xCE\n\
    lsls r1, 1\n\
    cmp r0, r1\n\
    beq _080361C2\n\
    ldr r1, _080361E4 @ =gBattlerPartyIndexes\n\
    ldr r0, _080361DC @ =gActiveBattler\n\
    ldrb r0, [r0]\n\
    lsls r0, 1\n\
    adds r0, r1\n\
    ldrh r0, [r0]\n\
    cmp r6, r0\n\
    beq _080361C2\n\
    adds r0, r4, 0\n\
    movs r1, 0xB\n\
    bl GetMonData\n\
    adds r0, r4, 0\n\
    movs r1, 0x2E\n\
    bl GetMonData\n\
    movs r0, 0\n\
    bl GetBattlerAtPosition\n\
    lsls r0, 24\n\
    lsrs r2, r0, 24\n\
    movs r4, 0\n\
    mov r8, r5\n\
    ldr r1, _080361D8 @ =gBattleMons\n\
    movs r0, 0x58\n\
    muls r0, r2\n\
    adds r5, r0, r1\n\
    adds r7, r5, 0\n\
    adds r7, 0x20\n\
_0803617C:\n\
    adds r1, r4, 0\n\
    adds r1, 0xD\n\
    mov r0, r8\n\
    add r0, r9\n\
    bl GetMonData\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0\n\
    beq _080361BC\n\
    ldrh r1, [r5]\n\
    ldrb r2, [r7]\n\
    bl AI_TypeCalc\n\
    lsls r0, 24\n\
    lsrs r1, r0, 24\n\
    movs r0, 0x2\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _080361BC\n\
    bl Random\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0x3\n\
    bl __umodsi3\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0x1\n\
    bhi _080361BC\n\
    b _08036070\n\
_080361BC:\n\
    adds r4, 0x1\n\
    cmp r4, 0x3\n\
    ble _0803617C\n\
_080361C2:\n\
    adds r6, 0x1\n\
    cmp r6, 0x5\n\
    ble _08036110\n\
_080361C8:\n\
    movs r0, 0\n\
_080361CA:\n\
    pop {r3,r4}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080361D8: .4byte gBattleMons\n\
_080361DC: .4byte gActiveBattler\n\
_080361E0: .4byte gEnemyParty\n\
_080361E4: .4byte gBattlerPartyIndexes\n\
    .syntax divided\n");
}
#endif // NONMATCHING

static bool8 FindMonThatAbsorbsOpponentsMove(void)
{
    u8 battlerIn1, battlerIn2;
    u8 absorbingTypeAbility;
    s32 i;

    if (HasSuperEffectiveMoveAgainstOpponents(TRUE) && Random() % 3 != 0)
        return FALSE;
    if (gLastLandedMoves[gActiveBattler] == 0)
        return FALSE;
    if (gLastLandedMoves[gActiveBattler] == 0xFFFF)
        return FALSE;
    if (gBattleMoves[gLastLandedMoves[gActiveBattler]].power == 0)
        return FALSE;

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        battlerIn1 = gActiveBattler;
        if (gAbsentBattlerFlags & gBitTable[GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gActiveBattler)))])
            battlerIn2 = gActiveBattler;
        else
            battlerIn2 = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gActiveBattler)));
    }
    else
    {
        battlerIn1 = gActiveBattler;
        battlerIn2 = gActiveBattler;
    }

    if (gBattleMoves[gLastLandedMoves[gActiveBattler]].type == TYPE_FIRE)
        absorbingTypeAbility = ABILITY_FLASH_FIRE;
    else if (gBattleMoves[gLastLandedMoves[gActiveBattler]].type == TYPE_WATER)
        absorbingTypeAbility = ABILITY_WATER_ABSORB;
    else if (gBattleMoves[gLastLandedMoves[gActiveBattler]].type == TYPE_ELECTRIC)
        absorbingTypeAbility = ABILITY_VOLT_ABSORB;
    else
        return FALSE;

    if (gBattleMons[gActiveBattler].ability == absorbingTypeAbility)
        return FALSE;

    for (i = 0; i < 6; i++)
    {
        u16 species;
        u8 monAbility;

        if (GetMonData(&gEnemyParty[i], MON_DATA_HP) == 0)
            continue;
        if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == SPECIES_NONE)
            continue;
        if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
            continue;
        if (i == gBattlerPartyIndexes[battlerIn1])
            continue;
        if (i == gBattlerPartyIndexes[battlerIn2])
            continue;
        if (i == ewram16068arr(battlerIn1))
            continue;
        if (i == ewram16068arr(battlerIn2))
            continue;

        species = GetMonData(&gEnemyParty[i], MON_DATA_SPECIES);
        if (GetMonData(&gEnemyParty[i], MON_DATA_ALT_ABILITY) != 0)
            monAbility = gBaseStats[species].ability2;
        else
            monAbility = gBaseStats[species].ability1;

        if (absorbingTypeAbility == monAbility && Random() & 1)
        {
            // we found a mon
            ewram160C8arr(GetBattlerPosition(gActiveBattler)) = i;
            Emitcmd33(1, B_ACTION_SWITCH, 0);
            return TRUE;
        }
    }

    return FALSE;
}

static bool8 ShouldSwitchIfNaturalCure(void)
{
    if (!(gBattleMons[gActiveBattler].status1 & STATUS_SLEEP))
        return FALSE;
    if (gBattleMons[gActiveBattler].ability != ABILITY_NATURAL_CURE)
        return FALSE;
    if (gBattleMons[gActiveBattler].hp < gBattleMons[gActiveBattler].maxHP / 2)
        return FALSE;

    if ((gLastLandedMoves[gActiveBattler] == 0 || gLastLandedMoves[gActiveBattler] == 0xFFFF) && Random() & 1)
    {
        ewram160C8arr(GetBattlerPosition(gActiveBattler)) = 6;
        Emitcmd33(1, B_ACTION_SWITCH, 0);
        return TRUE;
    }
    else if (gBattleMoves[gLastLandedMoves[gActiveBattler]].power == 0 && Random() & 1)
    {
        ewram160C8arr(GetBattlerPosition(gActiveBattler)) = 6;
        Emitcmd33(1, B_ACTION_SWITCH, 0);
        return TRUE;
    }

    if (FindMonWithFlagsAndSuperEffective(MOVE_RESULT_DOESNT_AFFECT_FOE, 1))
        return TRUE;
    if (FindMonWithFlagsAndSuperEffective(MOVE_RESULT_NOT_VERY_EFFECTIVE, 1))
        return TRUE;
    if (Random() & 1)
    {
        ewram160C8arr(GetBattlerPosition(gActiveBattler)) = 6;
        Emitcmd33(1, B_ACTION_SWITCH, 0);
        return TRUE;
    }

    return FALSE;
}

static bool8 HasSuperEffectiveMoveAgainstOpponents(bool8 noRng)
{
    u8 opposingBattler;
    s32 i;
    u8 moveFlags;
    u16 move;

    opposingBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
    if (!(gAbsentBattlerFlags & gBitTable[opposingBattler]))
    {
        for (i = 0; i < 4; i++)
        {
            move = gBattleMons[gActiveBattler].moves[i];
            if (move == MOVE_NONE)
                continue;

            moveFlags = AI_TypeCalc(move, gBattleMons[opposingBattler].species, gBattleMons[opposingBattler].ability);
            if (moveFlags & MOVE_RESULT_SUPER_EFFECTIVE)
            {
                if (noRng)
                    return TRUE;
                if (Random() % 10 != 0)
                    return TRUE;
            }
        }
    }
    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
        return FALSE;

    opposingBattler = GetBattlerAtPosition(BATTLE_PARTNER(B_POSITION_PLAYER_LEFT));
    if (!(gAbsentBattlerFlags & gBitTable[opposingBattler]))
    {
        for (i = 0; i < 4; i++)
        {
            move = gBattleMons[gActiveBattler].moves[i];
            if (move == MOVE_NONE)
                continue;

            moveFlags = AI_TypeCalc(move, gBattleMons[opposingBattler].species, gBattleMons[opposingBattler].ability);
            if (moveFlags & MOVE_RESULT_SUPER_EFFECTIVE)
            {
                if (noRng)
                    return TRUE;
                if (Random() % 10 != 0)
                    return TRUE;
            }
        }
    }

    return FALSE;
}

static bool8 AreStatsRaised(void)
{
    u8 buffedStatsValue = 0;
    s32 i;

    for (i = 0; i < BATTLE_STATS_NO; i++)
    {
        if (gBattleMons[gActiveBattler].statStages[i] > 6)
            buffedStatsValue += gBattleMons[gActiveBattler].statStages[i] - 6;
    }

    return (buffedStatsValue > 3);
}

static bool8 FindMonWithFlagsAndSuperEffective(u8 flags, u8 moduloPercent)
{
    u8 battlerIn1, battlerIn2;
    s32 i, j;
    u16 move;
    u8 moveFlags;

    if (gLastLandedMoves[gActiveBattler] == 0)
        return FALSE;
    if (gLastLandedMoves[gActiveBattler] == 0xFFFF)
        return FALSE;
    if (gLastHitBy[gActiveBattler] == 0xFF)
        return FALSE;
    if (gBattleMoves[gLastLandedMoves[gActiveBattler]].power == 0)
        return FALSE;

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        battlerIn1 = gActiveBattler;
        if (gAbsentBattlerFlags & gBitTable[GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gActiveBattler)))])
            battlerIn2 = gActiveBattler;
        else
            battlerIn2 = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gActiveBattler)));
    }
    else
    {
        battlerIn1 = gActiveBattler;
        battlerIn2 = gActiveBattler;
    }

    for (i = 0; i < 6; i++)
    {
        u16 species;
        u8 monAbility;

        if (GetMonData(&gEnemyParty[i], MON_DATA_HP) == 0)
            continue;
        if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == SPECIES_NONE)
            continue;
        if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
            continue;
        if (i == gBattlerPartyIndexes[battlerIn1])
            continue;
        if (i == gBattlerPartyIndexes[battlerIn2])
            continue;
        if (i == ewram16068arr(battlerIn1))
            continue;
        if (i == ewram16068arr(battlerIn2))
            continue;

        species = GetMonData(&gEnemyParty[i], MON_DATA_SPECIES);
        if (GetMonData(&gEnemyParty[i], MON_DATA_ALT_ABILITY) != 0)
            monAbility = gBaseStats[species].ability2;
        else
            monAbility = gBaseStats[species].ability1;

        moveFlags = AI_TypeCalc(gLastLandedMoves[gActiveBattler], species, monAbility);
        if (moveFlags & flags)
        {
            battlerIn1 = gLastHitBy[gActiveBattler];

            for (j = 0; j < 4; j++)
            {
                move = GetMonData(&gEnemyParty[i], MON_DATA_MOVE1 + j);
                if (move == 0)
                    continue;

                moveFlags = AI_TypeCalc(move, gBattleMons[battlerIn1].species, gBattleMons[battlerIn1].ability);
                if (moveFlags & MOVE_RESULT_SUPER_EFFECTIVE && Random() % moduloPercent == 0)
                {
                    ewram160C8arr(GetBattlerPosition(gActiveBattler)) = i;
                    Emitcmd33(1, B_ACTION_SWITCH, 0);
                    return TRUE;
                }
            }
        }
    }

    return FALSE;
}

static bool8 ShouldSwitch(void)
{
    u8 battlerIn1, battlerIn2;
    s32 i;
    s32 availableToSwitch;

    if (gBattleMons[gActiveBattler].status2 & (STATUS2_WRAPPED | STATUS2_ESCAPE_PREVENTION))
        return FALSE;
    if (gStatuses3[gActiveBattler] & STATUS3_ROOTED)
        return FALSE;
    if (AbilityBattleEffects(ABILITYEFFECT_CHECK_OTHER_SIDE, gActiveBattler, ABILITY_SHADOW_TAG, 0, 0))
        return FALSE;
    if (AbilityBattleEffects(ABILITYEFFECT_CHECK_OTHER_SIDE, gActiveBattler, ABILITY_ARENA_TRAP, 0, 0))
        return FALSE; // misses the flying or levitate check
    if (AbilityBattleEffects(ABILITYEFFECT_FIELD_SPORT, 0, ABILITY_MAGNET_PULL, 0, 0))
    {
        if (gBattleMons[gActiveBattler].type1 == TYPE_STEEL)
            return FALSE;
        if (gBattleMons[gActiveBattler].type2 == TYPE_STEEL)
            return FALSE;
    }

    availableToSwitch = 0;
    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        battlerIn1 = gActiveBattler;
        if (gAbsentBattlerFlags & gBitTable[GetBattlerAtPosition(GetBattlerPosition(gActiveBattler) ^ BIT_FLANK)])
            battlerIn2 = gActiveBattler;
        else
            battlerIn2 = GetBattlerAtPosition(GetBattlerPosition(gActiveBattler) ^ BIT_FLANK);
    }
    else
    {
        battlerIn1 = gActiveBattler;
        battlerIn2 = gActiveBattler;
    }

    for (i = 0; i < 6; i++)
    {
        if (GetMonData(&gEnemyParty[i], MON_DATA_HP) == 0)
            continue;
        if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == SPECIES_NONE)
            continue;
        if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
            continue;
        if (i == gBattlerPartyIndexes[battlerIn1])
            continue;
        if (i == gBattlerPartyIndexes[battlerIn2])
            continue;
        if (i == ewram16068arr(battlerIn1))
            continue;
        if (i == ewram16068arr(battlerIn2))
            continue;

        availableToSwitch++;
    }

    if (availableToSwitch == 0)
        return FALSE;
    if (ShouldSwitchIfPerishSong())
        return TRUE;
    if (ShouldSwitchIfWonderGuard())
        return TRUE;
    if (FindMonThatAbsorbsOpponentsMove())
        return TRUE;
    if (ShouldSwitchIfNaturalCure())
        return TRUE;
    if (HasSuperEffectiveMoveAgainstOpponents(FALSE))
        return FALSE;
    if (AreStatsRaised())
        return FALSE;
    if (FindMonWithFlagsAndSuperEffective(MOVE_RESULT_DOESNT_AFFECT_FOE, 2)
        || FindMonWithFlagsAndSuperEffective(MOVE_RESULT_NOT_VERY_EFFECTIVE, 3))
        return TRUE;

    return FALSE;
}

void AI_TrySwitchOrUseItem(void)
{
    u8 battlerIn1, battlerIn2;

    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
    {
        if (ShouldSwitch())
        {
            if (ewram160C8arr(GetBattlerPosition(gActiveBattler)) == 6)
            {
                s32 monToSwitchId = GetMostSuitableMonToSwitchInto();
                if (monToSwitchId == 6)
                {
                    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
                    {
                        battlerIn1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
                        battlerIn2 = battlerIn1;
                    }
                    else
                    {
                        battlerIn1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
                        battlerIn2 = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
                    }

                    for (monToSwitchId = 0; monToSwitchId < 6; monToSwitchId++)
                    {
                        if (GetMonData(&gEnemyParty[monToSwitchId], MON_DATA_HP) == 0)
                            continue;
                        if (monToSwitchId == gBattlerPartyIndexes[battlerIn1])
                            continue;
                        if (monToSwitchId == gBattlerPartyIndexes[battlerIn2])
                            continue;
                        if (monToSwitchId == ewram16068arr(battlerIn1))
                            continue;
                        if (monToSwitchId == ewram16068arr(battlerIn2))
                            continue;

                        break;
                    }
                }

                ewram160C8arr(GetBattlerPosition(gActiveBattler)) = monToSwitchId;
            }

            ewram16068arr(gActiveBattler) = ewram160C8arr(GetBattlerPosition(gActiveBattler));
            return;
        }
        else
        {
            #if DEBUG
            if (!(gUnknown_02023A14_50 & 0x20) && ShouldUseItem())
                return;
            #else
            if (ShouldUseItem())
                return;
            #endif
        }
    }

    Emitcmd33(1, B_ACTION_USE_MOVE, (gActiveBattler ^ BIT_SIDE) << 8);
}

static void ModulateByTypeEffectiveness(u8 attackType, u8 defenseType1, u8 defenseType2, u8 *var)
{
    s32 i = 0;

    while (TYPE_EFFECT_ATK_TYPE(i) != TYPE_ENDTABLE)
    {
        if (TYPE_EFFECT_ATK_TYPE(i) == TYPE_FORESIGHT)
        {
            i += 3;
            continue;
        }
        else if (TYPE_EFFECT_ATK_TYPE(i) == attackType)
        {
            // check type1
            if (TYPE_EFFECT_DEF_TYPE(i) == defenseType1)
                *var = (*var * TYPE_EFFECT_MULTIPLIER(i)) / 10;
            // check type2
            if (TYPE_EFFECT_DEF_TYPE(i) == defenseType2 && defenseType1 != defenseType2)
                *var = (*var * TYPE_EFFECT_MULTIPLIER(i)) / 10;
        }
        i += 3;
    }
}

u8 GetMostSuitableMonToSwitchInto(void)
{
    u8 opposingBattler;
    u8 bestDmg; // note : should be changed to s32
    u8 bestMonId;
    u8 battlerIn1, battlerIn2;
    s32 i, j;
    u8 invalidMons;
    u16 move;

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        battlerIn1 = gActiveBattler;
        if (gAbsentBattlerFlags & gBitTable[GetBattlerAtPosition(GetBattlerPosition(gActiveBattler) ^ BIT_FLANK)])
            battlerIn2 = gActiveBattler;
        else
            battlerIn2 = GetBattlerAtPosition(GetBattlerPosition(gActiveBattler) ^ BIT_FLANK);

        // UB: It considers the opponent only player's side even though it can battle alongside player;
        opposingBattler = Random() & BIT_FLANK;
        if (gAbsentBattlerFlags & gBitTable[opposingBattler])
            opposingBattler ^= BIT_FLANK;
    }
    else
    {
        opposingBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
        battlerIn1 = gActiveBattler;
        battlerIn2 = gActiveBattler;
    }

    invalidMons = 0;

    while (invalidMons != 0x3F) // all mons are invalid
    {
        bestDmg = 0;
        bestMonId = 6;
        // find the mon which type is the most suitable offensively
        for (i = 0; i < 6; i++)
        {
            u16 species = GetMonData(&gEnemyParty[i], MON_DATA_SPECIES);
            if (species != SPECIES_NONE
                && GetMonData(&gEnemyParty[i], MON_DATA_HP) != 0
                && !(gBitTable[i] & invalidMons)
                && gBattlerPartyIndexes[battlerIn1] != i
                && gBattlerPartyIndexes[battlerIn2] != i
                && i != ewram16068arr(battlerIn1)
                && i != ewram16068arr(battlerIn2))
            {
                u8 type1 = gBaseStats[species].type1;
                u8 type2 = gBaseStats[species].type2;
                u8 typeDmg = 10;
                ModulateByTypeEffectiveness(gBattleMons[opposingBattler].type1, type1, type2, &typeDmg);
                ModulateByTypeEffectiveness(gBattleMons[opposingBattler].type2, type1, type2, &typeDmg);
                if (bestDmg < typeDmg)
                {
                    bestDmg = typeDmg;
                    bestMonId = i;
                }
            }
            else
            {
                invalidMons |= gBitTable[i];
            }
        }

        // ok, we know the mon has the right typing but does it have at least one super effective move?
        if (bestMonId != 6)
        {
            for (i = 0; i < 4; i++)
            {
                move = GetMonData(&gEnemyParty[bestMonId], MON_DATA_MOVE1 + i);
                if (move != MOVE_NONE && TypeCalc(move, gActiveBattler, opposingBattler) & MOVE_RESULT_SUPER_EFFECTIVE)
                    break;
            }

            if (i != 4)
                return bestMonId; // has both the typing and at least one super effective move

            invalidMons |= gBitTable[bestMonId]; // sorry buddy, we want something better
        }
        else
        {
            invalidMons = 0x3F; // no viable mon to switch
        }
    }

    gDynamicBasePower = 0;
    gBattleStruct->dynamicMoveType = 0;
    gBattleStruct->dmgMultiplier = 1;
    gMoveResultFlags = 0;
    gCritMultiplier = 1;
    bestDmg = 0;
    bestMonId = 6;

    // if we couldn't find the best mon in terms of typing, find the one that deals most damage
    for (i = 0; i < 6; i++)
    {
        if ((u16)(GetMonData(&gEnemyParty[i], MON_DATA_SPECIES)) == SPECIES_NONE)
            continue;
        if (GetMonData(&gEnemyParty[i], MON_DATA_HP) == 0)
            continue;
        if (gBattlerPartyIndexes[battlerIn1] == i)
            continue;
        if (gBattlerPartyIndexes[battlerIn2] == i)
            continue;
        if (i == ewram16068arr(battlerIn1))
            continue;
        if (i == ewram16068arr(battlerIn2))
            continue;

        for (j = 0; j < 4; j++)
        {
            move = GetMonData(&gEnemyParty[i], MON_DATA_MOVE1 + j);
            gBattleMoveDamage = 0;
            if (move != MOVE_NONE && gBattleMoves[move].power != 1)
            {
                AI_CalcDmg(gActiveBattler, opposingBattler);
                TypeCalc(move, gActiveBattler, opposingBattler);
            }
            if (bestDmg < gBattleMoveDamage)
            {
                bestDmg = gBattleMoveDamage;
                bestMonId = i;
            }
        }
    }

    return bestMonId;
}

// TODO: use PokemonItemEffect struct instead of u8 once it's documented
static u8 GetAI_ItemType(u8 itemId, const u8 *itemEffect) // NOTE: should take u16 as item Id argument
{
    if (itemId == ITEM_FULL_RESTORE)
        return AI_ITEM_FULL_RESTORE;
    if (itemEffect[4] & 4)
        return AI_ITEM_HEAL_HP;
    if (itemEffect[3] & 0x3F)
        return AI_ITEM_CURE_CONDITION;
    if (itemEffect[0] & 0x3F || itemEffect[1] != 0 || itemEffect[2] != 0)
        return AI_ITEM_X_STAT;
    if (itemEffect[3] & 0x80)
        return AI_ITEM_GUARD_SPECS;

    return AI_ITEM_NOT_RECOGNIZABLE;
}

static bool8 ShouldUseItem(void)
{
    s32 i;
    u8 validMons = 0;
    bool8 shouldUse = FALSE;

    for (i = 0; i < 6; i++)
    {
        if (GetMonData(&gEnemyParty[i], MON_DATA_HP) != 0
            && GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) != SPECIES_NONE
            && GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) != SPECIES_EGG)
        {
            validMons++;
        }
    }

    for (i = 0; i < 4; i++)
    {
        u16 item;
        const u8 *itemEffects;
        u8 paramOffset;
        u8 battlerSide;

        if (i != 0 && validMons > (AI_BATTLE_HISTORY->numItems - i) + 1)
            continue;
        item = AI_BATTLE_HISTORY->trainerItems[i];
        if (item == ITEM_NONE)
            continue;
        if (gItemEffectTable[item - 13] == NULL)
            continue;

        if (item == ITEM_ENIGMA_BERRY)
            itemEffects = gSaveBlock1.enigmaBerry.itemEffect;
        else
            itemEffects = gItemEffectTable[item - 13];

        ewram160D8(gActiveBattler) = GetAI_ItemType(item, itemEffects);

        switch (ewram160D8(gActiveBattler))
        {
        case AI_ITEM_FULL_RESTORE:
            if (gBattleMons[gActiveBattler].hp >= gBattleMons[gActiveBattler].maxHP / 4)
                break;
            if (gBattleMons[gActiveBattler].hp == 0)
                break;
            shouldUse = TRUE;
            break;
        case AI_ITEM_HEAL_HP:
            paramOffset = GetItemEffectParamOffset(item, 4, 4);
            if (paramOffset == 0)
                break;
            if (gBattleMons[gActiveBattler].hp == 0)
                break;
            if (gBattleMons[gActiveBattler].hp < gBattleMons[gActiveBattler].maxHP / 4 || gBattleMons[gActiveBattler].maxHP - gBattleMons[gActiveBattler].hp > itemEffects[paramOffset])
                shouldUse = TRUE;
            break;
        case AI_ITEM_CURE_CONDITION:
            ewram160DA(gActiveBattler) = 0;
            if (itemEffects[3] & 0x20 && gBattleMons[gActiveBattler].status1 & STATUS_SLEEP)
            {
               ewram160DA(gActiveBattler) |= 0x20;
                shouldUse = TRUE;
            }
            if (itemEffects[3] & 0x10 && (gBattleMons[gActiveBattler].status1 & STATUS_POISON || gBattleMons[gActiveBattler].status1 & STATUS_TOXIC_POISON))
            {
               ewram160DA(gActiveBattler) |= 0x10;
                shouldUse = TRUE;
            }
            if (itemEffects[3] & 0x8 && gBattleMons[gActiveBattler].status1 & STATUS_BURN)
            {
               ewram160DA(gActiveBattler) |= 0x8;
                shouldUse = TRUE;
            }
            if (itemEffects[3] & 0x4 && gBattleMons[gActiveBattler].status1 & STATUS_FREEZE)
            {
               ewram160DA(gActiveBattler) |= 0x4;
                shouldUse = TRUE;
            }
            if (itemEffects[3] & 0x2 && gBattleMons[gActiveBattler].status1 & STATUS_PARALYSIS)
            {
               ewram160DA(gActiveBattler) |= 0x2;
                shouldUse = TRUE;
            }
            if (itemEffects[3] & 0x1 && gBattleMons[gActiveBattler].status2 & STATUS2_CONFUSION)
            {
               ewram160DA(gActiveBattler) |= 0x1;
                shouldUse = TRUE;
            }
            break;
        case AI_ITEM_X_STAT:
           ewram160DA(gActiveBattler) = 0;
            if (gDisableStructs[gActiveBattler].isFirstTurn == 0)
                break;
            if (itemEffects[0] & 0xF)
               ewram160DA(gActiveBattler) |= 0x1;
            if (itemEffects[1] & 0xF0)
               ewram160DA(gActiveBattler) |= 0x2;
            if (itemEffects[1] & 0xF)
               ewram160DA(gActiveBattler) |= 0x4;
            if (itemEffects[2] & 0xF)
               ewram160DA(gActiveBattler) |= 0x8;
            if (itemEffects[2] & 0xF0)
               ewram160DA(gActiveBattler) |= 0x20;
            if (itemEffects[0] & 0x30)
               ewram160DA(gActiveBattler) |= 0x80;
            shouldUse = TRUE;
            break;
        case AI_ITEM_GUARD_SPECS:
            battlerSide = GetBattlerSide(gActiveBattler);
            if (gDisableStructs[gActiveBattler].isFirstTurn != 0 && gSideTimers[battlerSide].mistTimer == 0)
                shouldUse = TRUE;
            break;
        case AI_ITEM_NOT_RECOGNIZABLE:
            return FALSE;
        }

        if (shouldUse)
        {
            Emitcmd33(1, B_ACTION_USE_ITEM, 0);
            ewram160D4(gActiveBattler) = item;
            AI_BATTLE_HISTORY->trainerItems[i] = 0;
            return shouldUse;
        }
    }

    return FALSE;
}
