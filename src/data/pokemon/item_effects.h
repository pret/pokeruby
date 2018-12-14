#ifndef GUARD_ITEM_EFFECTS_H
#define GUARD_ITEM_EFFECTS_H

// constants defined in constants/pokemon_item_effect_constants.h

const u8 gItemEffect_Potion[]       = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        0x00,
                                        20
                                      };
const u8 gItemEffect_Antidote[]     = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_POISON,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_BurnHeal[]     = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_BURN,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_IceHeal[]      = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_FREEZE,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_Awakening[]    = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_SLEEP,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_ParalyzeHeal[] = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_PARALYSIS,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_FullRestore[]  = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_ALL_STATUS,
                                        MON_ITEM_HEAL_HP,
                                        0x00,
                                        MON_ITEM_ARG_HEAL_FULL_HP
                                      };
const u8 gItemEffect_MaxPotion[]    = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        0x00,
                                        MON_ITEM_ARG_HEAL_FULL_HP
                                      };
const u8 gItemEffect_HyperPotion[]  = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        0x00, 200
                                      };
const u8 gItemEffect_SuperPotion[]  = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        0x00,
                                        50
                                      };
const u8 gItemEffect_FullHeal[]     = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_ALL_STATUS,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_Revive[]       = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_REVIVE | MON_ITEM_HEAL_HP,
                                        0x00,
                                        MON_ITEM_ARG_HEAL_HALF_HP
                                      };
const u8 gItemEffect_MaxRevive[]    = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_REVIVE | MON_ITEM_HEAL_HP,
                                        0x00,
                                        MON_ITEM_ARG_HEAL_FULL_HP
                                      };
const u8 gItemEffect_FreshWater[]   = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        0x00,
                                        50
                                      };
const u8 gItemEffect_SodaPop[]      = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        0x00,
                                        60
                                      };
const u8 gItemEffect_Lemonade[]     = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        0x00,
                                        80
                                      };
const u8 gItemEffect_MoomooMilk[]   = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        0x00,
                                        100
                                      };
const u8 gItemEffect_EnergyPowder[] = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        50,
                                        -5, -5, -10
                                      };
const u8 gItemEffect_EnergyRoot[]   = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        200,
                                        -10, -10, -15
                                      };
const u8 gItemEffect_HealPowder[]   = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_ALL_STATUS,
                                        0x00,
                                        MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        -5, -5, -10
                                      };
const u8 gItemEffect_RevivalHerb[]  = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_REVIVE | MON_ITEM_HEAL_HP,
                                        MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        MON_ITEM_ARG_HEAL_HALF_HP,
                                        -15, -15, -20
                                      };
const u8 gItemEffect_Ether[]        = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_PP_HEAL_ONE_MOVE | MON_ITEM_HEAL_PP,
                                        0x00,
                                        10
                                      };
const u8 gItemEffect_MaxEther[]     = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_PP_HEAL_ONE_MOVE | MON_ITEM_HEAL_PP,
                                        0x00,
                                        127
                                      };
const u8 gItemEffect_Elixir[]       = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_PP,
                                        0x00,
                                        10
                                      };
const u8 gItemEffect_MaxElixir[]    = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_PP,
                                        0x00,
                                        127
                                      };
const u8 gItemEffect_LavaCookie[]   = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_ALL_STATUS,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_BlueFlute[]    = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_SLEEP,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_YellowFlute[]  = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_CONFUSION,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_RedFlute[]     = {
                                        MON_ITEM_CURE_INFATUATION,
                                        0x00, 0x00, 0x00, 0x00, 0x00
                                      };
const u8 gItemEffect_BerryJuice[]   = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        0x00,
                                        20
                                      };
const u8 gItemEffect_SacredAsh[]    = {
                                        MON_ITEM_0_0x40,
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_REVIVE | MON_ITEM_HEAL_HP,
                                        0x00,
                                        MON_ITEM_ARG_HEAL_FULL_HP
                                      };
const u8 gItemEffect_HPUp[]         = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HP_EV,
                                        MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        10,
                                        5, 3, 2
                                      };
const u8 gItemEffect_Protein[]      = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_ATK_EV,
                                        MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        10,
                                        5, 3, 2
                                      };
const u8 gItemEffect_Iron[]         = {
                                        0x00, 0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_DEF_EV | MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        10,
                                        5, 3, 2
                                      };
const u8 gItemEffect_Carbos[]       = {
                                        0x00, 0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_SPEED_EV | MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        10, 
                                        5, 3, 2
                                      };
const u8 gItemEffect_Calcium[]      = {
                                        0x00, 0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_SPATK_EV | MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        10,
                                        5, 3, 2
                                      };
const u8 gItemEffect_RareCandy[]    = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_RAISE_LEVEL,
                                        MON_ITEM_REVIVE | MON_ITEM_HEAL_HP,
                                        MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        MON_ITEM_ARG_HEAL_RARE_CANDY,
                                        5, 3, 2
                                      };
const u8 gItemEffect_PPUp[]         = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_PP_UP,
                                        MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        5, 3, 2
                                      };
const u8 gItemEffect_Zinc[]         = {
                                        0x00, 0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_SPDEF_EV | MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        10,
                                        5, 3, 2
                                      };
const u8 gItemEffect_PPMax[]        = {
                                        0x00, 0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_PP_MAX | MON_ITEM_AFFECT_FRIENDSHIP_ALL_RANGES,
                                        5, 3, 2
                                      };
const u8 gItemEffect_GuardSpec[]    = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_MIST,
                                        0x00,
                                        MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99 | MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199,
                                        1, 1
                                      };
const u8 gItemEffect_DireHit[]      = {
                                        MON_ITEM_HIGH_CRIT,
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99 | MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199,
                                        1, 1
                                      };
const u8 gItemEffect_XAttack[]      = {
                                        1,
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99 | MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199,
                                        1, 1
                                      };
const u8 gItemEffect_XDefend[]      = {
                                        0x00,
                                        1 << 4,
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99 | MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199,
                                        1, 1
                                      };
const u8 gItemEffect_XSpeed[]       = {
                                        0x00,
                                        1,
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99 | MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199,
                                        1, 1
                                      };
const u8 gItemEffect_XAccuracy[]    = {
                                        0x00, 0x00,
                                        1 << 4,
                                        0x00, 0x00,
                                        MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99 | MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199,
                                        1, 1
                                      };
const u8 gItemEffect_XSpecial[]     = {
                                        0x00, 0x00,
                                        1,
                                        0x00, 0x00,
                                        MON_ITEM_AFFECT_FRIENDSHIP_0_TO_99 | MON_ITEM_AFFECT_FRIENDSHIP_100_TO_199,
                                        1, 1
                                      };
const u8 gItemEffect_SunStone[]     = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_EVO_STONE,
                                        0x00
                                      };
const u8 gItemEffect_MoonStone[]    = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_EVO_STONE,
                                        0x00
                                      };
const u8 gItemEffect_FireStone[]    = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_EVO_STONE,
                                        0x00
                                      };
const u8 gItemEffect_ThunderStone[] = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_EVO_STONE,
                                        0x00
                                      };
const u8 gItemEffect_WaterStone[]   = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_EVO_STONE,
                                        0x00
                                      };
const u8 gItemEffect_LeafStone[]    = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_EVO_STONE,
                                        0x00
                                      };
const u8 gItemEffect_CheriBerry[]   = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_PARALYSIS,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_ChestoBerry[]  = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_SLEEP,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_PechaBerry[]   = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_POISON,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_RawstBerry[]   = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_BURN,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_AspearBerry[]  = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_FREEZE,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_LeppaBerry[]   = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_PP_HEAL_ONE_MOVE | MON_ITEM_HEAL_PP,
                                        0x00,
                                        10
                                      };
const u8 gItemEffect_OranBerry[]    = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        0x00,
                                        10
                                      };
const u8 gItemEffect_PersimBerry[]  = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_CONFUSION,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_LumBerry[]     = {
                                        0x00, 0x00, 0x00,
                                        MON_ITEM_CURE_ALL_STATUS,
                                        0x00, 0x00
                                      };
const u8 gItemEffect_SitrusBerry[]  = {
                                        0x00, 0x00, 0x00, 0x00,
                                        MON_ITEM_HEAL_HP,
                                        0x00,
                                        30
                                      };

const u8 *const gItemEffectTable[] =
{
    gItemEffect_Potion,
    gItemEffect_Antidote,
    gItemEffect_BurnHeal,
    gItemEffect_IceHeal,
    gItemEffect_Awakening,
    gItemEffect_ParalyzeHeal,
    gItemEffect_FullRestore,
    gItemEffect_MaxPotion,
    gItemEffect_HyperPotion,
    gItemEffect_SuperPotion,
    gItemEffect_FullHeal,
    gItemEffect_Revive,
    gItemEffect_MaxRevive,
    gItemEffect_FreshWater,
    gItemEffect_SodaPop,
    gItemEffect_Lemonade,
    gItemEffect_MoomooMilk,
    gItemEffect_EnergyPowder,
    gItemEffect_EnergyRoot,
    gItemEffect_HealPowder,
    gItemEffect_RevivalHerb,
    gItemEffect_Ether,
    gItemEffect_MaxEther,
    gItemEffect_Elixir,
    gItemEffect_MaxElixir,
    gItemEffect_LavaCookie,
    gItemEffect_BlueFlute,
    gItemEffect_YellowFlute,
    gItemEffect_RedFlute,
    NULL,
    NULL,
    gItemEffect_BerryJuice,
    gItemEffect_SacredAsh,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    gItemEffect_HPUp,
    gItemEffect_Protein,
    gItemEffect_Iron,
    gItemEffect_Carbos,
    gItemEffect_Calcium,
    gItemEffect_RareCandy,
    gItemEffect_PPUp,
    gItemEffect_Zinc,
    gItemEffect_PPMax,
    NULL,
    gItemEffect_GuardSpec,
    gItemEffect_DireHit,
    gItemEffect_XAttack,
    gItemEffect_XDefend,
    gItemEffect_XSpeed,
    gItemEffect_XAccuracy,
    gItemEffect_XSpecial,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    gItemEffect_SunStone,
    gItemEffect_MoonStone,
    gItemEffect_FireStone,
    gItemEffect_ThunderStone,
    gItemEffect_WaterStone,
    gItemEffect_LeafStone,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    gItemEffect_CheriBerry,
    gItemEffect_ChestoBerry,
    gItemEffect_PechaBerry,
    gItemEffect_RawstBerry,
    gItemEffect_AspearBerry,
    gItemEffect_LeppaBerry,
    gItemEffect_OranBerry,
    gItemEffect_PersimBerry,
    gItemEffect_LumBerry,
    gItemEffect_SitrusBerry,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
};

#endif //GUARD_ITEM_EFFECTS_H
