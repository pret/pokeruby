#ifndef GUARD_CONSTANTS_POKEMON_ITEM_EFFECT_CONSTANTS_H
#define GUARD_CONSTANTS_POKEMON_ITEM_EFFECT_CONSTANTS_H

// field 0
#define MON_ITEM_FIELD_0 0

#define MON_ITEM_CURE_INFATUATION_F 7

#define MON_ITEM_CURE_INFATUATION (1 << MON_ITEM_CURE_INFATUATION_F)
#define MON_ITEM_0_0x40           0x40
#define MON_ITEM_HIGH_CRIT_MASK   0x30
#define MON_ITEM_X_ATTACK_MASK    0x0f

#define MON_ITEM_HIGH_CRIT        0x20

// field 1
#define MON_ITEM_FIELD_1 1

#define MON_ITEM_X_DEFEND_MASK 0xf0
#define MON_ITEM_X_SPEED_MASK  0x0f

// field 2
#define MON_ITEM_FIELD_2 2

#define MON_ITEM_X_ACCURACY_MASK 0xf0
#define MON_ITEM_X_SPECIAL_MASK  0x0f

// field 3
#define MON_ITEM_FIELD_3 3

#define MON_ITEM_MIST           0x80
#define MON_ITEM_RAISE_LEVEL    0x40
#define MON_ITEM_CURE_SLEEP     0x20
#define MON_ITEM_CURE_POISON    0x10
#define MON_ITEM_CURE_BURN      0x08
#define MON_ITEM_CURE_FREEZE    0x04
#define MON_ITEM_CURE_PARALYSIS 0x02
#define MON_ITEM_CURE_CONFUSION 0x01

#define MON_ITEM_CURE_ALL_STATUS (MON_ITEM_CURE_SLEEP | MON_ITEM_CURE_POISON | MON_ITEM_CURE_BURN \
                                | MON_ITEM_CURE_FREEZE | MON_ITEM_CURE_PARALYSIS | MON_ITEM_CURE_CONFUSION)

// field 4
#define MON_ITEM_FIELD_4 4

#define MON_ITEM_HP_EV_F             0
#define MON_ITEM_ATK_EV_F            1
#define MON_ITEM_HEAL_HP_F           2
#define MON_ITEM_HEAL_PP_F           3
#define MON_ITEM_PP_HEAL_ONE_MOVE_F  4
#define MON_ITEM_PP_UP_F             5
#define MON_ITEM_REVIVE_F            6
#define MON_ITEM_EVO_STONE_F         7

// field 4 masks
#define MON_ITEM_HP_EV              (1 << MON_ITEM_HP_EV_F)             // 0x01
#define MON_ITEM_ATK_EV             (1 << MON_ITEM_ATK_EV_F)            // 0x02
#define MON_ITEM_HEAL_HP            (1 << MON_ITEM_HEAL_HP_F)           // 0x04
#define MON_ITEM_HEAL_PP            (1 << MON_ITEM_HEAL_PP_F)           // 0x08
#define MON_ITEM_PP_HEAL_ONE_MOVE   (1 << MON_ITEM_PP_HEAL_ONE_MOVE_F)  // 0x10
#define MON_ITEM_PP_UP              (1 << MON_ITEM_PP_UP_F)             // 0x20
#define MON_ITEM_REVIVE             (1 << MON_ITEM_REVIVE_F)            // 0x40
#define MON_ITEM_EVO_STONE          (1 << MON_ITEM_EVO_STONE_F)         // 0x80

// field 5
#define MON_ITEM_FIELD_5 5

#define MON_ITEM_DEF_EV_F                        0
#define MON_ITEM_SPEED_EV_F                      1
#define MON_ITEM_SPDEF_EV_F                      2
#define MON_ITEM_SPATK_EV_F                      3
#define MON_ITEM_PP_MAX_F                        4
#define MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99_F     5
#define MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199_F  6
#define MON_ITEM_AFFECT_FRIENDSHIP_200_TO_255_F  7

// field 5 masks
#define MON_ITEM_DEF_EV                         (1 << MON_ITEM_DEF_EV_F)                        // 0x01
#define MON_ITEM_SPEED_EV                       (1 << MON_ITEM_SPEED_EV_F)                      // 0x02
#define MON_ITEM_SPDEF_EV                       (1 << MON_ITEM_SPDEF_EV_F)                      // 0x04
#define MON_ITEM_SPATK_EV                       (1 << MON_ITEM_SPATK_EV_F)                      // 0x08
#define MON_ITEM_PP_MAX                         (1 << MON_ITEM_PP_MAX_F)                        // 0x10
#define MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99      (1 << MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99_F)     // 0x20
#define MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199   (1 << MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199_F)  // 0x40
#define MON_ITEM_AFFECT_FRIENDSHIP_200_TO_255   (1 << MON_ITEM_AFFECT_FRIENDSHIP_200_TO_255_F)  // 0x80

#define MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES    (MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99 | MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199 | MON_ITEM_AFFECT_FRIENDSHIP_200_TO_255)

// hp heal args
#define MON_ITEM_ARG_HEAL_FULL_HP 0xff
#define MON_ITEM_ARG_HEAL_HALF_HP 0xfe
#define MON_ITEM_ARG_HEAL_RARE_CANDY 0xfd

#define MON_ITEM_EXTRA_ARGS_START_INDEX 6

#define MON_ITEM_TYPE_X_ITEM 0
#define MON_ITEM_TYPE_RAISE_LEVEL 1
#define MON_ITEM_TYPE_HEAL_HP 2
#define MON_ITEM_TYPE_CURE_POISON 3
#define MON_ITEM_TYPE_CURE_SLEEP 4
#define MON_ITEM_TYPE_CURE_BURN 5
#define MON_ITEM_TYPE_CURE_FREEZE 6
#define MON_ITEM_TYPE_CURE_PARALYSIS 7
#define MON_ITEM_TYPE_CURE_CONFUSION 8
#define MON_ITEM_TYPE_CURE_INFATUATION 9
#define MON_ITEM_TYPE_SACRED_ASH 10
#define MON_ITEM_TYPE_CURE_ALL_STATUS 11
#define MON_ITEM_TYPE_ATK_EV 12
#define MON_ITEM_TYPE_HP_EV 13
#define MON_ITEM_TYPE_SPATK_EV 14
#define MON_ITEM_TYPE_SPDEF_EV 15
#define MON_ITEM_TYPE_SPEED_EV 16
#define MON_ITEM_TYPE_DEF_EV 17
#define MON_ITEM_TYPE_EVO_STONE 18
#define MON_ITEM_TYPE_PP_UP 19
#define MON_ITEM_TYPE_PP_MAX 20
#define MON_ITEM_TYPE_HEAL_PP 21
#define MON_ITEM_TYPE_UNKNOWN 22

#endif
