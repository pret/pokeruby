#include "global.h"
#include "pokemon.h"
#include "species.h"
#include "trainer.h"
#include "abilities.h"
#include "moves.h"
#include "hold_effects.h"
#include "items.h"
#include "sprite.h"
#include "data2.h"

#include "../data/pokemon/dex_order.h"
#include "../data/pokemon/spinda_spots.h"
#include "../data/pokemon/item_effects.h"
#include "../data/pokemon/nature_stats.h"
#include "../data/pokemon/tmhm_learnsets.h"
#include "../data/pokemon/trainer_class_lookups.h"
#include "../data/pokemon/cry_ids.h"
#include "../data/pokemon/experience_tables.h"
#include "../data/pokemon/base_stats.h"
#include "../data/pokemon/level_up_learnsets.h"
#include "../data/pokemon/evolution.h"
#include "../data/pokemon/level_up_learnset_pointers.h"

const u8 gUnknown_08208238[] = { // Masks for getting PP Up count, also PP Max values
    0x03, 0x0c, 0x30, 0xc0
};

const u8 gUnknown_0820823C[] = { // Masks for setting PP Up count
    0xFC, 0xF3, 0xCF, 0x3F
};

const u8 gUnknown_08208240[] = { // Values added to PP Up count
    0x01, 0x04, 0x10, 0x40
};

const u8 gStatStageRatios[][2] = {
    {10, 40}, // -6
    {10, 35}, // -5
    {10, 30}, // -4
    {10, 25}, // -3
    {10, 20}, // -2
    {10, 15}, // -1
    {10, 10}, //  0
    {15, 10}, //  1
    {20, 10}, //  2
    {25, 10}, //  3
    {30, 10}, //  4
    {35, 10}, //  5
    {40, 10}  //  6
};

const u8 unknownGameFreakAbbrev_820825E[] = _("ゲーフリ");

const u8 gHoldEffectToType[][2] = {
    {HOLD_EFFECT_BUG_POWER,      TYPE_BUG},
    {HOLD_EFFECT_STEEL_POWER,    TYPE_STEEL},
    {HOLD_EFFECT_GROUND_POWER,   TYPE_GROUND},
    {HOLD_EFFECT_ROCK_POWER,     TYPE_ROCK},
    {HOLD_EFFECT_GRASS_POWER,    TYPE_GRASS},
    {HOLD_EFFECT_DARK_POWER,     TYPE_DARK},
    {HOLD_EFFECT_FIGHTING_POWER, TYPE_FIGHTING},
    {HOLD_EFFECT_ELECTRIC_POWER, TYPE_ELECTRIC},
    {HOLD_EFFECT_WATER_POWER,    TYPE_WATER},
    {HOLD_EFFECT_FLYING_POWER,   TYPE_FLYING},
    {HOLD_EFFECT_POISON_POWER,   TYPE_POISON},
    {HOLD_EFFECT_ICE_POWER,      TYPE_ICE},
    {HOLD_EFFECT_GHOST_POWER,    TYPE_GHOST},
    {HOLD_EFFECT_PSYCHIC_POWER,  TYPE_PSYCHIC},
    {HOLD_EFFECT_FIRE_POWER,     TYPE_FIRE},
    {HOLD_EFFECT_DRAGON_POWER,   TYPE_DRAGON},
    {HOLD_EFFECT_NORMAL_POWER,   TYPE_NORMAL}
};

extern void sub_80105A0(struct Sprite *);
extern void oac_poke_opponent(struct Sprite *);

const struct SpriteTemplate gSpriteTemplate_8208288[] = {
    {0xFFFF, 0, &gOamData_81F96F0, NULL, gSpriteImageTable_81E7A10, gSpriteAffineAnimTable_81E7B70, sub_80105A0},
    {0xFFFF, 0, &gOamData_81F96E8, NULL, gSpriteImageTable_81E7A30, gSpriteAffineAnimTable_81E7BEC, oac_poke_opponent},
    {0xFFFF, 0, &gOamData_81F96F0, NULL, gSpriteImageTable_81E7A50, gSpriteAffineAnimTable_81E7B70, sub_80105A0},
    {0xFFFF, 0, &gOamData_81F96E8, NULL, gSpriteImageTable_81E7A70, gSpriteAffineAnimTable_81E7BEC, oac_poke_opponent},
};

const u8 gSecretBaseTrainerClasses[][5] = {
    // male
    {TRAINER_CLASS_YOUNGSTER, TRAINER_CLASS_BUG_CATCHER,  TRAINER_CLASS_RICH_BOY, TRAINER_CLASS_CAMPER,    TRAINER_CLASS_COOL_TRAINER_M},
    // female
    {TRAINER_CLASS_LASS,      TRAINER_CLASS_SCHOOL_KID_F, TRAINER_CLASS_LADY,     TRAINER_CLASS_PICNICKER, TRAINER_CLASS_COOL_TRAINER_F}
};

const u8 gUnknown_082082F2[] = {
    MON_DATA_HP_EV,
    MON_DATA_ATK_EV,
    MON_DATA_DEF_EV,
    MON_DATA_SPEED_EV,
    MON_DATA_SPDEF_EV,
    MON_DATA_SPATK_EV
};

const u8 gUnknown_082082F8[] = {1, 1, 3, 2, 4, 6};

const s8 gUnknown_082082FE[][3] = {
    // Happiness deltas
    { 5,  3,   2},
    { 5,  3,   2},
    { 1,  1,   0},
    { 3,  2,   1},
    { 1,  1,   0},
    { 1,  1,   1},
    {-1, -1,  -1},
    {-5, -5, -10},
    {-5, -5, -10}
};

const u16 gHMMoves[] = {
    MOVE_CUT,
    MOVE_FLY,
    MOVE_SURF,
    MOVE_STRENGTH,
    MOVE_FLASH,
    MOVE_ROCK_SMASH,
    MOVE_WATERFALL,
    MOVE_DIVE,
    0xffff
};

const u8 gJapaneseNidoranNames[][11] = {_("ニドラン♂"), _("ニドラン♀")};
