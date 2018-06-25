#ifndef GUARD_CONSTANTS_BATTLE_CONSTANTS_H
#define GUARD_CONSTANTS_BATTLE_CONSTANTS_H

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

#define STATUS_SLEEP            0x7
#define STATUS_POISON           0x8
#define STATUS_BURN             0x10
#define STATUS_FREEZE           0x20
#define STATUS_PARALYSIS        0x40
#define STATUS_TOXIC_POISON     0x80
#define STATUS_TOXIC_COUNTER    0xF00

#define STATUS_PSN_ANY          ((STATUS_POISON | STATUS_TOXIC_POISON))
#define STATUS_ANY              ((STATUS_SLEEP | STATUS_POISON | STATUS_BURN | STATUS_FREEZE | STATUS_PARALYSIS | STATUS_TOXIC_POISON))

#define STATUS2_CONFUSION           0x00000007
#define STATUS2_FLINCHED            0x00000008
#define STATUS2_UPROAR              0x00000070
#define STATUS2_BIDE                0x00000300  //two bits 0x100 0x200
#define STATUS2_LOCK_CONFUSE        0x00000C00
#define STATUS2_MULTIPLETURNS       0x00001000
#define STATUS2_WRAPPED             0x0000E000
#define STATUS2_INFATUATION         0x000F0000
#define STATUS2_FOCUS_ENERGY        0x00100000
#define STATUS2_TRANSFORMED         0x00200000
#define STATUS2_RECHARGE            0x00400000
#define STATUS2_RAGE                0x00800000
#define STATUS2_SUBSTITUTE          0x01000000
#define STATUS2_DESTINY_BOND        0x02000000
#define STATUS2_ESCAPE_PREVENTION   0x04000000
#define STATUS2_NIGHTMARE           0x08000000
#define STATUS2_CURSED              0x10000000
#define STATUS2_FORESIGHT           0x20000000
#define STATUS2_DEFENSE_CURL        0x40000000
#define STATUS2_TORMENT             0x80000000

#define STATUS3_LEECHSEED_BANK          0x3
#define STATUS3_LEECHSEED               0x4
#define STATUS3_ALWAYS_HITS             0x18    //two bits
#define STATUS3_PERISH_SONG             0x20
#define STATUS3_ON_AIR                  0x40
#define STATUS3_UNDERGROUND             0x80
#define STATUS3_MINIMIZED               0x100
#define STATUS3_ROOTED                  0x400
#define STATUS3_CHARGED_UP              0x200
#define STATUS3_YAWN                    0x1800  //two bits
#define STATUS3_IMPRISIONED             0x2000
#define STATUS3_GRUDGE                  0x4000
#define STATUS3_CANT_SCORE_A_CRIT       0x8000
#define STATUS3_MUDSPORT                0x10000
#define STATUS3_WATERSPORT              0x20000
#define STATUS3_UNDERWATER              0x40000
#define STATUS3_INTIMIDATE_POKES        0x80000
#define STATUS3_TRACE                   0x100000

#define STATUS3_SEMI_INVULNERABLE       ((STATUS3_UNDERGROUND | STATUS3_ON_AIR | STATUS3_UNDERWATER))

#define HITMARKER_x10                   0x00000010
#define HITMARKER_x20                   0x00000020
#define HITMARKER_DESTINYBOND           0x00000040
#define HITMARKER_NO_ANIMATIONS         0x00000080
#define HITMARKER_IGNORE_SUBSTITUTE     0x00000100
#define HITMARKER_NO_ATTACKSTRING       0x00000200
#define HITMARKER_ATTACKSTRING_PRINTED  0x00000400
#define HITMARKER_NO_PPDEDUCT           0x00000800
#define HITMARKER_PURSUIT_TRAP          0x00001000
#define HITMARKER_IGNORE_SAFEGUARD      0x00002000
#define HITMARKER_SYNCHRONISE_EFFECT    0x00004000
#define HITMARKER_RUN                   0x00008000
#define HITMARKER_IGNORE_ON_AIR         0x00010000
#define HITMARKER_IGNORE_UNDERGROUND    0x00020000
#define HITMARKER_IGNORE_UNDERWATER     0x00040000
#define HITMARKER_UNABLE_TO_USE_MOVE    0x00080000
#define HITMARKER_x100000               0x00100000
#define HITMARKER_x200000               0x00200000
#define HITMARKER_x400000               0x00400000
#define HITMARKER_x800000               0x00800000
#define HITMARKER_GRUDGE                0x01000000
#define HITMARKER_OBEYS                 0x02000000
#define HITMARKER_x4000000              0x04000000
#define HITMARKER_x8000000              0x08000000
#define HITMARKER_FAINTED(bank)         ((gBitTable[bank] << 0x1C))
#define HITMARKER_UNK(bank)             ((0x10000000 << bank))

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

#define BATTLE_WON                  0x1
#define BATTLE_LOST                 0x2
#define BATTLE_DREW                 0x3
#define BATTLE_RAN                  0x4
#define BATTLE_PLAYER_TELEPORTED    0x5
#define BATTLE_POKE_FLED            0x6
#define BATTLE_CAUGHT               0x7
#define BATTLE_OUT_OF_BALLS         0x8
#define BATTLE_OPPONENT_TELEPORTED  0xA

#define OUTCOME_LINK_BATTLE_RUN      0x80

#define SIDE_STATUS_REFLECT          (1 << 0)
#define SIDE_STATUS_LIGHTSCREEN      (1 << 1)
#define SIDE_STATUS_X4               (1 << 2)
#define SIDE_STATUS_SPIKES           (1 << 4)
#define SIDE_STATUS_SAFEGUARD        (1 << 5)
#define SIDE_STATUS_FUTUREATTACK     (1 << 6)
#define SIDE_STATUS_MIST             (1 << 8)
#define SIDE_STATUS_SPIKES_DAMAGED   (1 << 9)

#define ACTION_USE_MOVE             0
#define ACTION_USE_ITEM             1
#define ACTION_SWITCH               2
#define ACTION_RUN                  3
#define ACTION_WATCHES_CAREFULLY    4
#define ACTION_SAFARI_ZONE_BALL     5
#define ACTION_POKEBLOCK_CASE       6
#define ACTION_GO_NEAR              7
#define ACTION_SAFARI_ZONE_RUN      8
#define ACTION_9                    9
#define ACTION_RUN_BATTLESCRIPT     10 // when executing an action
#define ACTION_CANCEL_PARTNER       12 // when choosing an action
#define ACTION_FINISHED             12 // when executing an action
#define ACTION_NOTHING_FAINTED      13 // when choosing an action
#define ACTION_INIT_VALUE           0xFF

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

#define WEATHER_HAS_EFFECT ((!AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, ABILITY_AIR_LOCK, 0, 0)))

#define MAX_TRAINER_ITEMS 4
#define MAX_MON_MOVES 4

#define WEATHER_RAIN_TEMPORARY      (1 << 0)
#define WEATHER_RAIN_DOWNPOUR       (1 << 1)
#define WEATHER_RAIN_PERMANENT      (1 << 2)
#define WEATHER_RAIN_ANY ((WEATHER_RAIN_TEMPORARY | WEATHER_RAIN_DOWNPOUR | WEATHER_RAIN_PERMANENT))
#define WEATHER_SANDSTORM_TEMPORARY (1 << 3)
#define WEATHER_SANDSTORM_PERMANENT (1 << 4)
#define WEATHER_SANDSTORM_ANY ((WEATHER_SANDSTORM_TEMPORARY | WEATHER_SANDSTORM_PERMANENT))
#define WEATHER_SUN_TEMPORARY       (1 << 5)
#define WEATHER_SUN_PERMANENT       (1 << 6)
#define WEATHER_SUN_ANY ((WEATHER_SUN_TEMPORARY | WEATHER_SUN_PERMANENT))
#define WEATHER_HAIL                (1 << 7)

#define MOVE_TARGET_SELECTED        0x0
#define MOVE_TARGET_DEPENDS         0x1
#define MOVE_TARGET_USER            0x2
#define MOVE_TARGET_RANDOM          0x4
#define MOVE_TARGET_x10             0x10
#define MOVE_TARGET_BOTH            0x8
#define MOVE_TARGET_FOES_AND_ALLY   0x20
#define MOVE_TARGET_OPPONENTS_FIELD 0x40

// array entries for battle communication
#define MULTIUSE_STATE          0x0
#define CURSOR_POSITION         0x1
#define TASK_ID                 0x1 // task Id and cursor position share the same field
#define SPRITES_INIT_STATE1     0x1 // shares the Id as well
#define SPRITES_INIT_STATE2     0x2
#define MOVE_EFFECT_BYTE        0x3
#define ACTIONS_CONFIRMED_COUNT 0x4
#define MULTISTRING_CHOOSER     0x5
#define MSG_DISPLAY             0x7
#define BATTLE_COMMUNICATION_ENTRIES_COUNT  0x8

#define BS_GET_TARGET                   0
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

// special animation table
#define B_ANIM_LVL_UP                   0x0
#define B_ANIM_SWITCH_OUT_PLAYER_MON    0x1
#define B_ANIM_SWITCH_OUT_OPPONENT_MON  0x2
#define B_ANIM_BALL_THROW               0x3
#define B_ANIM_SAFARI_BALL_THROW        0x4
#define B_ANIM_SUBSTITUTE_TO_MON        0x5
#define B_ANIM_MON_TO_SUBSTITUTE        0x6

// AI switch items
#define AI_ITEM_FULL_RESTORE     1
#define AI_ITEM_HEAL_HP          2
#define AI_ITEM_CURE_CONDITION   3
#define AI_ITEM_X_STAT           4
#define AI_ITEM_GUARD_SPECS      5
#define AI_ITEM_NOT_RECOGNIZABLE 6

#endif // GUARD_CONSTANTS_BATTLE_CONSTANTS_H
