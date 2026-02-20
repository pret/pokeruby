#ifndef GUARD_CONSTANTS_BATTLE_H
#define GUARD_CONSTANTS_BATTLE_H

/*
 * A battler may be in one of four positions on the field. The first bit determines
 * what side the battler is on, either the player's side or the opponent's side.
 * The second bit determines what flank the battler is on, either the left or right.
 * Note that the opponent's flanks are drawn corresponding to their perspective, so
 * their right mon appears on the left, and their left mon appears on the right.
 * The battler ID is usually the same as the position, except in the case of link battles.
 *
 *   + ------------------------- +
 *   |           Opponent's side |
 *   |            Right    Left  |
 *   |              3       1    |
 *   |                           |
 *   | Player's side             |
 *   |  Left   Right             |
 *   |   0       2               |
 *   ----------------------------+
 *   |                           |
 *   |                           |
 *   +---------------------------+
 */

#define MAX_BATTLERS_COUNT  4

#define B_POSITION_PLAYER_LEFT        0
#define B_POSITION_OPPONENT_LEFT      1
#define B_POSITION_PLAYER_RIGHT       2
#define B_POSITION_OPPONENT_RIGHT     3

// These macros can be used with either battler ID or positions to get the partner or the opposite mon
#define BATTLE_OPPOSITE(id) ((id) ^ 1)
#define BATTLE_PARTNER(id) ((id) ^ 2)

#define B_SIDE_PLAYER     0
#define B_SIDE_OPPONENT   1

#define B_FLANK_LEFT 0
#define B_FLANK_RIGHT 1

#define BIT_SIDE        1
#define BIT_FLANK       2

// Battle Type Flags
#define BATTLE_TYPE_DOUBLE          0x0001
#define BATTLE_TYPE_LINK            0x0002
#define BATTLE_TYPE_WILD            0x0004
#define BATTLE_TYPE_TRAINER         0x0008
#define BATTLE_TYPE_FIRST_BATTLE    0x0010
#define BATTLE_TYPE_20              0x0020
#define BATTLE_TYPE_MULTI           0x0040
#define BATTLE_TYPE_SAFARI          0x0080
#define BATTLE_TYPE_BATTLE_TOWER    0x0100
#define BATTLE_TYPE_WALLY_TUTORIAL  0x0200
#define BATTLE_TYPE_ROAMER          0x0400
#define BATTLE_TYPE_EREADER_TRAINER 0x0800
#define BATTLE_TYPE_KYOGRE_GROUDON  0x1000
#define BATTLE_TYPE_LEGENDARY       0x2000
#define BATTLE_TYPE_REGI            0x4000
#define BATTLE_TYPE_LINK_DOUBLE     (BATTLE_TYPE_MULTI | BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE)

#define SECRET_BASE_OPPONENT        0x400
#define LINK_BATTLE_OPPONENT        0x800

// Battle Outcome defines
#define B_OUTCOME_WON                  0x1
#define B_OUTCOME_LOST                 0x2
#define B_OUTCOME_DREW                 0x3
#define B_OUTCOME_RAN                  0x4
#define B_OUTCOME_PLAYER_TELEPORTED    0x5
#define B_OUTCOME_MON_FLED             0x6
#define B_OUTCOME_CAUGHT               0x7
#define B_OUTCOME_NO_SAFARI_BALLS      0x8
#define B_OUTCOME_FORFEITED            0x9
#define B_OUTCOME_MON_TELEPORTED       0xA
#define B_OUTCOME_LINK_BATTLE_RAN      0x80

// Non-volatile status conditions
// These persist remain outside of battle and after switching out
#define STATUS1_NONE             0
#define STATUS1_SLEEP            (1 << 0 | 1 << 1 | 1 << 2) // First 3 bits (Number of turns to sleep)
#define STATUS1_SLEEP_TURN(num)  ((num) << 0) // Just for readability (or if rearranging statuses)
#define STATUS1_POISON           (1 << 3)
#define STATUS1_BURN             (1 << 4)
#define STATUS1_FREEZE           (1 << 5)
#define STATUS1_PARALYSIS        (1 << 6)
#define STATUS1_TOXIC_POISON     (1 << 7)
#define STATUS1_TOXIC_COUNTER    (1 << 8 | 1 << 9 | 1 << 10 | 1 << 11)
#define STATUS1_TOXIC_TURN(num)  ((num) << 8)
#define STATUS1_PSN_ANY          (STATUS1_POISON | STATUS1_TOXIC_POISON)
#define STATUS1_ANY              (STATUS1_SLEEP | STATUS1_POISON | STATUS1_BURN | STATUS1_FREEZE | STATUS1_PARALYSIS | STATUS1_TOXIC_POISON)

// Volatile status ailments
// These are removed after exiting the battle or switching out
#define STATUS2_CONFUSION             (1 << 0 | 1 << 1 | 1 << 2)
#define STATUS2_CONFUSION_TURN(num)   ((num) << 0)
#define STATUS2_FLINCHED              (1 << 3)
#define STATUS2_UPROAR                (1 << 4 | 1 << 5 | 1 << 6)
#define STATUS2_UPROAR_TURN(num)      ((num) << 4)
#define STATUS2_UNUSED                (1 << 7)
#define STATUS2_BIDE                  (1 << 8 | 1 << 9)
#define STATUS2_BIDE_TURN(num)        (((num) << 8) & STATUS2_BIDE)
#define STATUS2_LOCK_CONFUSE          (1 << 10 | 1 << 11) // e.g. Thrash
#define STATUS2_LOCK_CONFUSE_TURN(num)((num) << 10)
#define STATUS2_MULTIPLETURNS         (1 << 12)
#define STATUS2_WRAPPED               (1 << 13 | 1 << 14 | 1 << 15)
#define STATUS2_WRAPPED_TURN(num)     ((num) << 13)
#define STATUS2_INFATUATION           (1 << 16 | 1 << 17 | 1 << 18 | 1 << 19)  // 4 bits, one for every battler
#define STATUS2_INFATUATED_WITH(battler) (gBitTable[battler] << 16)
#define STATUS2_FOCUS_ENERGY          (1 << 20)
#define STATUS2_TRANSFORMED           (1 << 21)
#define STATUS2_RECHARGE              (1 << 22)
#define STATUS2_RAGE                  (1 << 23)
#define STATUS2_SUBSTITUTE            (1 << 24)
#define STATUS2_DESTINY_BOND          (1 << 25)
#define STATUS2_ESCAPE_PREVENTION     (1 << 26)
#define STATUS2_NIGHTMARE             (1 << 27)
#define STATUS2_CURSED                (1 << 28)
#define STATUS2_FORESIGHT             (1 << 29)
#define STATUS2_DEFENSE_CURL          (1 << 30)
#define STATUS2_TORMENT               (1 << 31)

// Seems like per-battler statuses. Not quite sure how to categorize these
#define STATUS3_LEECHSEED_BATTLER       (1 << 0 | 1 << 1) // The battler to receive HP from Leech Seed
#define STATUS3_LEECHSEED               (1 << 2)
#define STATUS3_ALWAYS_HITS             (1 << 3 | 1 << 4)
#define STATUS3_ALWAYS_HITS_TURN(num)   (((num) << 3) & STATUS3_ALWAYS_HITS) // "Always Hits" is set as a 2 turn timer, i.e. next turn is the last turn when it's active
#define STATUS3_PERISH_SONG             (1 << 5)
#define STATUS3_ON_AIR                  (1 << 6)
#define STATUS3_UNDERGROUND             (1 << 7)
#define STATUS3_MINIMIZED               (1 << 8)
#define STATUS3_CHARGED_UP              (1 << 9)
#define STATUS3_ROOTED                  (1 << 10)
#define STATUS3_YAWN                    (1 << 11 | 1 << 12) // Number of turns to sleep
#define STATUS3_YAWN_TURN(num)          (((num) << 11) & STATUS3_YAWN)
#define STATUS3_IMPRISONED_OTHERS       (1 << 13)
#define STATUS3_GRUDGE                  (1 << 14)
#define STATUS3_CANT_SCORE_A_CRIT       (1 << 15)
#define STATUS3_MUDSPORT                (1 << 16)
#define STATUS3_WATERSPORT              (1 << 17)
#define STATUS3_UNDERWATER              (1 << 18)
#define STATUS3_INTIMIDATE_POKES        (1 << 19)
#define STATUS3_TRACE                   (1 << 20)
#define STATUS3_SEMI_INVULNERABLE       (STATUS3_UNDERGROUND | STATUS3_ON_AIR | STATUS3_UNDERWATER)

// Not really sure what a "hitmarker" is.
#define HITMARKER_WAKE_UP_CLEAR         (1 << 4) // Cleared when waking up. Never set or checked.
#define HITMARKER_IGNORE_BIDE           (1 << 5)
#define HITMARKER_DESTINYBOND           (1 << 6)
#define HITMARKER_NO_ANIMATIONS         (1 << 7)
#define HITMARKER_IGNORE_SUBSTITUTE     (1 << 8)
#define HITMARKER_NO_ATTACKSTRING       (1 << 9)
#define HITMARKER_ATTACKSTRING_PRINTED  (1 << 10)
#define HITMARKER_NO_PPDEDUCT           (1 << 11)
#define HITMARKER_SWAP_ATTACKER_TARGET  (1 << 12)
#define HITMARKER_STATUS_ABILITY_EFFECT (1 << 13)
#define HITMARKER_SYNCHRONIZE_EFFECT    (1 << 14)
#define HITMARKER_RUN                   (1 << 15)
#define HITMARKER_IGNORE_ON_AIR         (1 << 16)
#define HITMARKER_IGNORE_UNDERGROUND    (1 << 17)
#define HITMARKER_IGNORE_UNDERWATER     (1 << 18)
#define HITMARKER_UNABLE_TO_USE_MOVE    (1 << 19)
#define HITMARKER_PASSIVE_HP_UPDATE     (1 << 20)
#define HITMARKER_DISOBEDIENT_MOVE      (1 << 21)
#define HITMARKER_PLAYER_FAINTED        (1 << 22)
#define HITMARKER_ALLOW_NO_PP           (1 << 23)
#define HITMARKER_GRUDGE                (1 << 24)
#define HITMARKER_OBEYS                 (1 << 25)
#define HITMARKER_NEVER_SET             (1 << 26) // Cleared as part of a large group. Never set or checked
#define HITMARKER_CHARGING              (1 << 27)
#define HITMARKER_FAINTED(battler)      (gBitTable[battler] << 28)
#define HITMARKER_FAINTED2(battler)     ((1 << 28) << battler)

// Per-side statuses that affect an entire party
#define SIDE_STATUS_REFLECT          (1 << 0)
#define SIDE_STATUS_LIGHTSCREEN      (1 << 1)
#define SIDE_STATUS_X4               (1 << 2)
#define SIDE_STATUS_SPIKES           (1 << 4)
#define SIDE_STATUS_SAFEGUARD        (1 << 5)
#define SIDE_STATUS_FUTUREATTACK     (1 << 6)
#define SIDE_STATUS_MIST             (1 << 8)
#define SIDE_STATUS_SPIKES_DAMAGED   (1 << 9)

// Flags describing move's result
#define MOVE_RESULT_MISSED             (1 << 0)
#define MOVE_RESULT_SUPER_EFFECTIVE    (1 << 1)
#define MOVE_RESULT_NOT_VERY_EFFECTIVE (1 << 2)
#define MOVE_RESULT_DOESNT_AFFECT_FOE  (1 << 3)
#define MOVE_RESULT_ONE_HIT_KO         (1 << 4)
#define MOVE_RESULT_FAILED             (1 << 5)
#define MOVE_RESULT_FOE_ENDURED        (1 << 6)
#define MOVE_RESULT_FOE_HUNG_ON        (1 << 7)
#define MOVE_RESULT_NO_EFFECT          (MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE | MOVE_RESULT_FAILED)

// Battle Weather flags
#define B_WEATHER_RAIN_TEMPORARY      (1 << 0)
#define B_WEATHER_RAIN_DOWNPOUR       (1 << 1)  // unused
#define B_WEATHER_RAIN_PERMANENT      (1 << 2)
#define B_WEATHER_RAIN                (B_WEATHER_RAIN_TEMPORARY | B_WEATHER_RAIN_DOWNPOUR | B_WEATHER_RAIN_PERMANENT)
#define B_WEATHER_SANDSTORM_TEMPORARY (1 << 3)
#define B_WEATHER_SANDSTORM_PERMANENT (1 << 4)
#define B_WEATHER_SANDSTORM           (B_WEATHER_SANDSTORM_TEMPORARY | B_WEATHER_SANDSTORM_PERMANENT)
#define B_WEATHER_SUN_TEMPORARY       (1 << 5)
#define B_WEATHER_SUN_PERMANENT       (1 << 6)
#define B_WEATHER_SUN                 (B_WEATHER_SUN_TEMPORARY | B_WEATHER_SUN_PERMANENT)
#define B_WEATHER_HAIL_TEMPORARY      (1 << 7)
#define B_WEATHER_HAIL                (B_WEATHER_HAIL_TEMPORARY)
#define B_WEATHER_ANY                 (B_WEATHER_RAIN | B_WEATHER_SANDSTORM | B_WEATHER_SUN | B_WEATHER_HAIL)

// Move Effects
#define MOVE_EFFECT_SLEEP               0x1
#define MOVE_EFFECT_POISON              0x2
#define MOVE_EFFECT_BURN                0x3
#define MOVE_EFFECT_FREEZE              0x4
#define MOVE_EFFECT_PARALYSIS           0x5
#define PRIMARY_STATUS_MOVE_EFFECT      MOVE_EFFECT_TOXIC // All above move effects apply primary status
#define MOVE_EFFECT_TOXIC               0x6
#define MOVE_EFFECT_CONFUSION           0x7
#define MOVE_EFFECT_FLINCH              0x8
#define MOVE_EFFECT_TRI_ATTACK          0x9
#define MOVE_EFFECT_UPROAR              0xA
#define MOVE_EFFECT_PAYDAY              0xB
#define MOVE_EFFECT_CHARGING            0xC
#define MOVE_EFFECT_WRAP                0xD
#define MOVE_EFFECT_RECOIL_25           0xE
#define MOVE_EFFECT_ATK_PLUS_1          0xF
#define MOVE_EFFECT_DEF_PLUS_1          0x10
#define MOVE_EFFECT_SPD_PLUS_1          0x11
#define MOVE_EFFECT_SP_ATK_PLUS_1       0x12
#define MOVE_EFFECT_SP_DEF_PLUS_1       0x13
#define MOVE_EFFECT_ACC_PLUS_1          0x14
#define MOVE_EFFECT_EVS_PLUS_1          0x15
#define MOVE_EFFECT_ATK_MINUS_1         0x16
#define MOVE_EFFECT_DEF_MINUS_1         0x17
#define MOVE_EFFECT_SPD_MINUS_1         0x18
#define MOVE_EFFECT_SP_ATK_MINUS_1      0x19
#define MOVE_EFFECT_SP_DEF_MINUS_1      0x1A
#define MOVE_EFFECT_ACC_MINUS_1         0x1B
#define MOVE_EFFECT_EVS_MINUS_1         0x1C
#define MOVE_EFFECT_RECHARGE            0x1D
#define MOVE_EFFECT_RAGE                0x1E
#define MOVE_EFFECT_STEAL_ITEM          0x1F
#define MOVE_EFFECT_PREVENT_ESCAPE      0x20
#define MOVE_EFFECT_NIGHTMARE           0x21
#define MOVE_EFFECT_ALL_STATS_UP        0x22
#define MOVE_EFFECT_RAPIDSPIN           0x23
#define MOVE_EFFECT_REMOVE_PARALYSIS    0x24
#define MOVE_EFFECT_ATK_DEF_DOWN        0x25
#define MOVE_EFFECT_RECOIL_33           0x26
#define MOVE_EFFECT_ATK_PLUS_2          0x27
#define MOVE_EFFECT_DEF_PLUS_2          0x28
#define MOVE_EFFECT_SPD_PLUS_2          0x29
#define MOVE_EFFECT_SP_ATK_PLUS_2       0x2A
#define MOVE_EFFECT_SP_DEF_PLUS_2       0x2B
#define MOVE_EFFECT_ACC_PLUS_2          0x2C
#define MOVE_EFFECT_EVS_PLUS_2          0x2D
#define MOVE_EFFECT_ATK_MINUS_2         0x2E
#define MOVE_EFFECT_DEF_MINUS_2         0x2F
#define MOVE_EFFECT_SPD_MINUS_2         0x30
#define MOVE_EFFECT_SP_ATK_MINUS_2      0x31
#define MOVE_EFFECT_SP_DEF_MINUS_2      0x32
#define MOVE_EFFECT_ACC_MINUS_2         0x33
#define MOVE_EFFECT_EVS_MINUS_2         0x34
#define MOVE_EFFECT_THRASH              0x35
#define MOVE_EFFECT_KNOCK_OFF           0x36
#define MOVE_EFFECT_NOTHING_37          0x37
#define MOVE_EFFECT_NOTHING_38          0x38
#define MOVE_EFFECT_NOTHING_39          0x39
#define MOVE_EFFECT_NOTHING_3A          0x3A
#define MOVE_EFFECT_SP_ATK_TWO_DOWN     0x3B
#define MOVE_EFFECT_NOTHING_3C          0x3C
#define MOVE_EFFECT_NOTHING_3D          0x3D
#define MOVE_EFFECT_NOTHING_3E          0x3E
#define MOVE_EFFECT_NOTHING_3F          0x3F
#define MOVE_EFFECT_AFFECTS_USER        0x40
#define MOVE_EFFECT_CERTAIN             0x80

// Battle environment defines for gBattleEnvironment.
#define BATTLE_ENVIRONMENT_GRASS        0
#define BATTLE_ENVIRONMENT_LONG_GRASS   1
#define BATTLE_ENVIRONMENT_SAND         2
#define BATTLE_ENVIRONMENT_UNDERWATER   3
#define BATTLE_ENVIRONMENT_WATER        4
#define BATTLE_ENVIRONMENT_POND         5
#define BATTLE_ENVIRONMENT_MOUNTAIN     6
#define BATTLE_ENVIRONMENT_CAVE         7
#define BATTLE_ENVIRONMENT_BUILDING     8
#define BATTLE_ENVIRONMENT_PLAIN        9

#define B_WAIT_TIME_LONG  64
#define B_WAIT_TIME_MED   48
#define B_WAIT_TIME_SHORT 32

#define TARGET_SELECTED_POKEMON 0
#define TARGET_SPECIAL          (1 << 0)
#define TARGET_UNK2             (1 << 1)
#define TARGET_RANDOM           (1 << 2)
#define TARGET_BOTH_ENEMIES     (1 << 3)
#define TARGET_USER             (1 << 4)
#define TARGET_ALL_EXCEPT_USER  (1 << 5)
#define TARGET_ENEMY_SIDE       (1 << 6)

#define F_MAKES_CONTACT           (1 << 0)
#define F_AFFECTED_BY_PROTECT     (1 << 1)
#define F_AFFECTED_BY_MAGIC_COAT  (1 << 2)
#define F_AFFECTED_BY_SNATCH      (1 << 3)
#define F_MIRROR_MOVE_COMPATIBLE  (1 << 4)
#define F_AFFECTED_BY_KINGS_ROCK  (1 << 5)

#define AI_ACTION_DONE          0x0001
#define AI_ACTION_FLEE          0x0002
#define AI_ACTION_WATCH         0x0004
#define AI_ACTION_DO_NOT_ATTACK 0x0008
#define AI_ACTION_UNK5          0x0010
#define AI_ACTION_UNK6          0x0020
#define AI_ACTION_UNK7          0x0040
#define AI_ACTION_UNK8          0x0080

#define ABILITYEFFECT_ON_SWITCHIN         0x0
#define ABILITYEFFECT_ENDTURN             0x1
#define ABILITYEFFECT_MOVES_BLOCK         0x2
#define ABILITYEFFECT_ABSORBING           0x3
#define ABILITYEFFECT_CONTACT             0x4
#define ABILITYEFFECT_IMMUNITY            0x5
#define ABILITYEFFECT_FORECAST            0x6
#define ABILITYEFFECT_SYNCHRONIZE         0x7
#define ABILITYEFFECT_ATK_SYNCHRONIZE     0x8
#define ABILITYEFFECT_INTIMIDATE1         0x9
#define ABILITYEFFECT_INTIMIDATE2         0xA
#define ABILITYEFFECT_TRACE               0xB
#define ABILITYEFFECT_CHECK_OTHER_SIDE    0xC
#define ABILITYEFFECT_CHECK_BANK_SIDE     0xD
#define ABILITYEFFECT_FIELD_SPORT         0xE
#define ABILITYEFFECT_CHECK_FIELD_EXCEPT_BANK   0xF
#define ABILITYEFFECT_COUNT_OTHER_SIZE    0x10
#define ABILITYEFFECT_COUNT_BANK_SIDE     0x11
#define ABILITYEFFECT_COUNT_ON_FIELD      0x12
#define ABILITYEFFECT_CHECK_ON_FIELD      0x13

#define BS_TARGET                   0
#define BS_GET_ATTACKER                 1
#define BS_GET_EFFECT_BANK              2
#define BS_GET_gBank1   3
#define BS_GET_BANK_0   7
#define BS_ATTACKER_WITH_PARTNER        4 // for atk98_status_icon_update
#define BS_GET_ATTACKER_SIDE            8 // for atk1E_jumpifability
#define BS_GET_NOT_ATTACKER_SIDE        9 // for atk1E_jumpifability
#define BS_GET_SCRIPTING_BANK           10
#define BS_GET_OPPONENT1                12
#define BS_GET_PLAYER2                  13
#define BS_GET_OPPONENT2                14

// status animation table
#define B_ANIM_STATUS_PSN               0x0
#define B_ANIM_STATUS_CONFUSION         0x1
#define B_ANIM_STATUS_BRN               0x2
#define B_ANIM_STATUS_INFATUATION       0x3
#define B_ANIM_STATUS_SLP               0x4
#define B_ANIM_STATUS_PRZ               0x5
#define B_ANIM_STATUS_FRZ               0x6
#define B_ANIM_STATUS_CURSED            0x7
#define B_ANIM_STATUS_NIGHTMARE         0x8
#define B_ANIM_STATUS_WRAPPED           0x9

// general animation table
#define B_ANIM_CASTFORM_CHANGE          0x0
#define B_ANIM_STATS_CHANGE             0x1
#define B_ANIM_SUBSTITUTE_FADE          0x2
#define B_ANIM_SUBSTITUTE_APPEAR        0x3
#define B_ANIM_POKEBLOCK_THROW          0x4
#define B_ANIM_ITEM_KNOCKOFF            0x5
#define B_ANIM_TURN_TRAP                0x6
#define B_ANIM_ITEM_EFFECT              0x7
#define B_ANIM_SMOKEBALL_ESCAPE         0x8
#define B_ANIM_HANGED_ON                0x9
#define B_ANIM_RAIN_CONTINUES           0xA
#define B_ANIM_SUN_CONTINUES            0xB
#define B_ANIM_SANDSTORM_CONTINUES      0xC
#define B_ANIM_HAIL_CONTINUES           0xD
#define B_ANIM_LEECH_SEED_DRAIN         0xE
#define B_ANIM_MON_HIT                  0xF
#define B_ANIM_ITEM_STEAL               0x10
#define B_ANIM_SNATCH_MOVE              0x11
#define B_ANIM_FUTURE_SIGHT_HIT         0x12
#define B_ANIM_DOOM_DESIRE_HIT          0x13
#define B_ANIM_FOCUS_PUNCH_SET_UP       0x14
#define B_ANIM_INGRAIN_HEAL             0x15
#define B_ANIM_WISH_HEAL                0x16

// AI switch items
#define AI_ITEM_FULL_RESTORE     1
#define AI_ITEM_HEAL_HP          2
#define AI_ITEM_CURE_CONDITION   3
#define AI_ITEM_X_STAT           4
#define AI_ITEM_GUARD_SPECS      5
#define AI_ITEM_NOT_RECOGNIZABLE 6

#endif // GUARD_CONSTANTS_BATTLE_CONSTANTS_H
