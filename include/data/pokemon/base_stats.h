//
// Created by Scott Norton on 6/27/17.
//

#ifndef POKERUBY_BASE_STATS_H
#define POKERUBY_BASE_STATS_H

const struct BaseStats gBaseStats[] = {
    { // ??????????
    }, {
        // Bulbasaur
        45, 49, 49, 45, 65, 65,
        TYPE_GRASS,
        TYPE_POISON,
        45, // catch rate
        64, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Ivysaur
        60, 62, 63, 60, 80, 80,
        TYPE_GRASS,
        TYPE_POISON,
        45, // catch rate
        141, // base exp. yield
        0, 0, 0, 0, 1, 1,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Venusaur
        80, 82, 83, 80, 100, 100,
        TYPE_GRASS,
        TYPE_POISON,
        45, // catch rate
        208, // base exp. yield
        0, 0, 0, 0, 2, 1,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Charmander
        39, 52, 43, 65, 60, 50,
        TYPE_FIRE,
        TYPE_FIRE,
        45, // catch rate
        65, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Charmeleon
        58, 64, 58, 80, 80, 65,
        TYPE_FIRE,
        TYPE_FIRE,
        45, // catch rate
        142, // base exp. yield
        0, 0, 0, 1, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Charizard
        78, 84, 78, 100, 109, 85,
        TYPE_FIRE,
        TYPE_FLYING,
        45, // catch rate
        209, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Squirtle
        44, 48, 65, 43, 50, 64,
        TYPE_WATER,
        TYPE_WATER,
        45, // catch rate
        66, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Wartortle
        59, 63, 80, 58, 65, 80,
        TYPE_WATER,
        TYPE_WATER,
        45, // catch rate
        143, // base exp. yield
        0, 0, 1, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Blastoise
        79, 83, 100, 78, 85, 105,
        TYPE_WATER,
        TYPE_WATER,
        45, // catch rate
        210, // base exp. yield
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Caterpie
        45, 30, 35, 45, 20, 20,
        TYPE_BUG,
        TYPE_BUG,
        255, // catch rate
        53, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHIELD_DUST,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Metapod
        50, 20, 55, 30, 25, 25,
        TYPE_BUG,
        TYPE_BUG,
        120, // catch rate
        72, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Butterfree
        60, 45, 50, 70, 80, 80,
        TYPE_BUG,
        TYPE_FLYING,
        45, // catch rate
        160, // base exp. yield
        0, 0, 0, 0, 2, 1,
        ITEM_NONE,
        ITEM_SILVER_POWDER,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_COMPOUND_EYES,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Weedle
        40, 35, 30, 50, 20, 20,
        TYPE_BUG,
        TYPE_POISON,
        255, // catch rate
        52, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHIELD_DUST,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Kakuna
        45, 25, 50, 35, 25, 25,
        TYPE_BUG,
        TYPE_POISON,
        120, // catch rate
        71, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Beedrill
        65, 80, 40, 75, 45, 80,
        TYPE_BUG,
        TYPE_POISON,
        45, // catch rate
        159, // base exp. yield
        0, 2, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_POISON_BARB,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Pidgey
        40, 45, 40, 56, 35, 35,
        TYPE_NORMAL,
        TYPE_FLYING,
        255, // catch rate
        55, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Pidgeotto
        63, 60, 55, 71, 50, 50,
        TYPE_NORMAL,
        TYPE_FLYING,
        120, // catch rate
        113, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Pidgeot
        83, 80, 75, 91, 70, 70,
        TYPE_NORMAL,
        TYPE_FLYING,
        45, // catch rate
        172, // base exp. yield
        0, 0, 0, 3, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Rattata
        30, 56, 35, 72, 25, 35,
        TYPE_NORMAL,
        TYPE_NORMAL,
        255, // catch rate
        57, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_GUTS,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Raticate
        55, 81, 60, 97, 50, 70,
        TYPE_NORMAL,
        TYPE_NORMAL,
        127, // catch rate
        116, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_GUTS,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Spearow
        40, 60, 30, 70, 31, 31,
        TYPE_NORMAL,
        TYPE_FLYING,
        255, // catch rate
        58, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Fearow
        65, 90, 65, 100, 61, 61,
        TYPE_NORMAL,
        TYPE_FLYING,
        90, // catch rate
        162, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_SHARP_BEAK,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Ekans
        35, 60, 44, 55, 40, 54,
        TYPE_POISON,
        TYPE_POISON,
        255, // catch rate
        62, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_DRAGON,
        ABILITY_INTIMIDATE,
        ABILITY_SHED_SKIN,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Arbok
        60, 85, 69, 80, 65, 79,
        TYPE_POISON,
        TYPE_POISON,
        90, // catch rate
        147, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_DRAGON,
        ABILITY_INTIMIDATE,
        ABILITY_SHED_SKIN,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Pikachu
        35, 55, 30, 90, 50, 40,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        190, // catch rate
        82, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_ORAN_BERRY,
        ITEM_LIGHT_BALL,
        127, // gender
        10, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_STATIC,
        ABILITY_NONE,
        6, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Raichu
        60, 90, 55, 100, 90, 80,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        75, // catch rate
        122, // base exp. yield
        0, 0, 0, 3, 0, 0,
        ITEM_NONE,
        ITEM_ORAN_BERRY,
        127, // gender
        10, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_STATIC,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Sandshrew
        50, 75, 85, 40, 20, 30,
        TYPE_GROUND,
        TYPE_GROUND,
        255, // catch rate
        93, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_QUICK_CLAW,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SAND_VEIL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Sandslash
        75, 100, 110, 65, 45, 55,
        TYPE_GROUND,
        TYPE_GROUND,
        90, // catch rate
        163, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_QUICK_CLAW,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SAND_VEIL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Nidoran♀
        55, 47, 52, 41, 40, 40,
        TYPE_POISON,
        TYPE_POISON,
        235, // catch rate
        59, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        254, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Nidorina
        70, 62, 67, 56, 55, 55,
        TYPE_POISON,
        TYPE_POISON,
        120, // catch rate
        117, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        254, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Nidoqueen
        90, 82, 87, 76, 75, 85,
        TYPE_POISON,
        TYPE_GROUND,
        45, // catch rate
        194, // base exp. yield
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        254, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Nidoran♂
        46, 57, 40, 50, 40, 40,
        TYPE_POISON,
        TYPE_POISON,
        235, // catch rate
        60, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Nidorino
        61, 72, 57, 65, 55, 55,
        TYPE_POISON,
        TYPE_POISON,
        120, // catch rate
        118, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Nidoking
        81, 92, 77, 85, 85, 75,
        TYPE_POISON,
        TYPE_GROUND,
        45, // catch rate
        195, // base exp. yield
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Clefairy
        70, 45, 48, 35, 60, 65,
        TYPE_NORMAL,
        TYPE_NORMAL,
        150, // catch rate
        68, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_LEPPA_BERRY,
        ITEM_MOON_STONE,
        191, // gender
        10, // egg cycles
        140, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Clefable
        95, 70, 73, 60, 85, 90,
        TYPE_NORMAL,
        TYPE_NORMAL,
        25, // catch rate
        129, // base exp. yield
        3, 0, 0, 0, 0, 0,
        ITEM_LEPPA_BERRY,
        ITEM_MOON_STONE,
        191, // gender
        10, // egg cycles
        140, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Vulpix
        38, 41, 40, 65, 50, 65,
        TYPE_FIRE,
        TYPE_FIRE,
        190, // catch rate
        63, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        191, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_FLASH_FIRE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Ninetales
        73, 76, 75, 100, 81, 100,
        TYPE_FIRE,
        TYPE_FIRE,
        75, // catch rate
        178, // base exp. yield
        0, 0, 0, 1, 0, 1,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        191, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_FLASH_FIRE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Jigglypuff
        115, 45, 20, 20, 45, 25,
        TYPE_NORMAL,
        TYPE_NORMAL,
        170, // catch rate
        76, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191, // gender
        10, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Wigglytuff
        140, 70, 45, 45, 75, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        50, // catch rate
        109, // base exp. yield
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191, // gender
        10, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Zubat
        40, 45, 35, 55, 30, 40,
        TYPE_POISON,
        TYPE_FLYING,
        255, // catch rate
        54, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Golbat
        75, 80, 70, 90, 65, 75,
        TYPE_POISON,
        TYPE_FLYING,
        90, // catch rate
        171, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Oddish
        45, 50, 55, 30, 75, 65,
        TYPE_GRASS,
        TYPE_POISON,
        255, // catch rate
        78, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        4, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Gloom
        60, 65, 70, 40, 85, 75,
        TYPE_GRASS,
        TYPE_POISON,
        120, // catch rate
        132, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        6, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Vileplume
        75, 80, 85, 50, 100, 90,
        TYPE_GRASS,
        TYPE_POISON,
        45, // catch rate
        184, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Paras
        35, 70, 55, 25, 45, 55,
        TYPE_BUG,
        TYPE_GRASS,
        190, // catch rate
        70, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_TINY_MUSHROOM,
        ITEM_BIG_MUSHROOM,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_GRASS,
        ABILITY_EFFECT_SPORE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Parasect
        60, 95, 80, 30, 60, 80,
        TYPE_BUG,
        TYPE_GRASS,
        75, // catch rate
        128, // base exp. yield
        0, 2, 1, 0, 0, 0,
        ITEM_TINY_MUSHROOM,
        ITEM_BIG_MUSHROOM,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_GRASS,
        ABILITY_EFFECT_SPORE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Venonat
        60, 55, 50, 45, 40, 55,
        TYPE_BUG,
        TYPE_POISON,
        190, // catch rate
        75, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_COMPOUND_EYES,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Venomoth
        70, 65, 60, 90, 90, 75,
        TYPE_BUG,
        TYPE_POISON,
        75, // catch rate
        138, // base exp. yield
        0, 0, 0, 1, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHIELD_DUST,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Diglett
        10, 55, 25, 95, 35, 45,
        TYPE_GROUND,
        TYPE_GROUND,
        255, // catch rate
        81, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SAND_VEIL,
        ABILITY_ARENA_TRAP,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Dugtrio
        35, 80, 50, 120, 50, 70,
        TYPE_GROUND,
        TYPE_GROUND,
        50, // catch rate
        153, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SAND_VEIL,
        ABILITY_ARENA_TRAP,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Meowth
        40, 45, 35, 90, 40, 40,
        TYPE_NORMAL,
        TYPE_NORMAL,
        255, // catch rate
        69, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PICKUP,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Persian
        65, 70, 60, 115, 65, 65,
        TYPE_NORMAL,
        TYPE_NORMAL,
        90, // catch rate
        148, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_LIMBER,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Psyduck
        50, 52, 48, 55, 65, 50,
        TYPE_WATER,
        TYPE_WATER,
        190, // catch rate
        80, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_DAMP,
        ABILITY_CLOUD_NINE,
        6, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Golduck
        80, 82, 78, 85, 95, 80,
        TYPE_WATER,
        TYPE_WATER,
        75, // catch rate
        174, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_DAMP,
        ABILITY_CLOUD_NINE,
        8, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Mankey
        40, 80, 35, 70, 35, 45,
        TYPE_FIGHTING,
        TYPE_FIGHTING,
        190, // catch rate
        74, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_VITAL_SPIRIT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Primeape
        65, 105, 60, 95, 60, 70,
        TYPE_FIGHTING,
        TYPE_FIGHTING,
        75, // catch rate
        149, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_VITAL_SPIRIT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Growlithe
        55, 70, 45, 60, 70, 50,
        TYPE_FIRE,
        TYPE_FIRE,
        190, // catch rate
        91, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        63, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INTIMIDATE,
        ABILITY_FLASH_FIRE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Arcanine
        90, 110, 80, 95, 100, 80,
        TYPE_FIRE,
        TYPE_FIRE,
        75, // catch rate
        213, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        63, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INTIMIDATE,
        ABILITY_FLASH_FIRE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Poliwag
        40, 50, 40, 90, 40, 40,
        TYPE_WATER,
        TYPE_WATER,
        255, // catch rate
        77, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_WATER_ABSORB,
        ABILITY_DAMP,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE, TRUE
    }, { // Poliwhirl
        65, 65, 65, 90, 50, 50,
        TYPE_WATER,
        TYPE_WATER,
        120, // catch rate
        131, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_WATER_ABSORB,
        ABILITY_DAMP,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE, TRUE
    }, { // Poliwrath
        90, 85, 95, 70, 70, 90,
        TYPE_WATER,
        TYPE_FIGHTING,
        45, // catch rate
        185, // base exp. yield
        0, 0, 3, 0, 0, 0,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_WATER_ABSORB,
        ABILITY_DAMP,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE, TRUE
    }, { // Abra
        25, 20, 15, 90, 105, 55,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        200, // catch rate
        73, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_TWISTED_SPOON,
        63, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SYNCHRONIZE,
        ABILITY_INNER_FOCUS,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Kadabra
        40, 35, 30, 105, 120, 70,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        100, // catch rate
        145, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_TWISTED_SPOON,
        63, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SYNCHRONIZE,
        ABILITY_INNER_FOCUS,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Alakazam
        55, 50, 45, 120, 135, 85,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        50, // catch rate
        186, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_TWISTED_SPOON,
        63, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SYNCHRONIZE,
        ABILITY_INNER_FOCUS,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Machop
        70, 80, 50, 35, 35, 35,
        TYPE_FIGHTING,
        TYPE_FIGHTING,
        180, // catch rate
        88, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_GUTS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Machoke
        80, 100, 70, 45, 50, 60,
        TYPE_FIGHTING,
        TYPE_FIGHTING,
        90, // catch rate
        146, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_GUTS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Machamp
        90, 130, 80, 55, 65, 85,
        TYPE_FIGHTING,
        TYPE_FIGHTING,
        45, // catch rate
        193, // base exp. yield
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_GUTS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Bellsprout
        50, 75, 35, 40, 70, 30,
        TYPE_GRASS,
        TYPE_POISON,
        255, // catch rate
        84, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Weepinbell
        65, 90, 50, 55, 85, 45,
        TYPE_GRASS,
        TYPE_POISON,
        120, // catch rate
        151, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Victreebel
        80, 105, 65, 70, 100, 60,
        TYPE_GRASS,
        TYPE_POISON,
        45, // catch rate
        191, // base exp. yield
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Tentacool
        40, 40, 35, 70, 50, 100,
        TYPE_WATER,
        TYPE_POISON,
        190, // catch rate
        105, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_CLEAR_BODY,
        ABILITY_LIQUID_OOZE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Tentacruel
        80, 70, 65, 100, 80, 120,
        TYPE_WATER,
        TYPE_POISON,
        60, // catch rate
        205, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_CLEAR_BODY,
        ABILITY_LIQUID_OOZE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Geodude
        40, 80, 100, 20, 30, 30,
        TYPE_ROCK,
        TYPE_GROUND,
        255, // catch rate
        86, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_EVERSTONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_ROCK_HEAD,
        ABILITY_STURDY,
        4, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Graveler
        55, 95, 115, 35, 45, 45,
        TYPE_ROCK,
        TYPE_GROUND,
        120, // catch rate
        134, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_EVERSTONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_ROCK_HEAD,
        ABILITY_STURDY,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Golem
        80, 110, 130, 45, 55, 65,
        TYPE_ROCK,
        TYPE_GROUND,
        45, // catch rate
        177, // base exp. yield
        0, 0, 3, 0, 0, 0,
        ITEM_NONE,
        ITEM_EVERSTONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_ROCK_HEAD,
        ABILITY_STURDY,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Ponyta
        50, 85, 55, 90, 65, 65,
        TYPE_FIRE,
        TYPE_FIRE,
        190, // catch rate
        152, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_FLASH_FIRE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Rapidash
        65, 100, 70, 105, 80, 80,
        TYPE_FIRE,
        TYPE_FIRE,
        60, // catch rate
        192, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_FLASH_FIRE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Slowpoke
        90, 65, 65, 15, 40, 40,
        TYPE_WATER,
        TYPE_PSYCHIC,
        190, // catch rate
        99, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_OBLIVIOUS,
        ABILITY_OWN_TEMPO,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Slowbro
        95, 75, 110, 30, 100, 80,
        TYPE_WATER,
        TYPE_PSYCHIC,
        75, // catch rate
        164, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_OBLIVIOUS,
        ABILITY_OWN_TEMPO,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Magnemite
        25, 35, 70, 45, 95, 55,
        TYPE_ELECTRIC,
        TYPE_STEEL,
        190, // catch rate
        89, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        255, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_MAGNET_PULL,
        ABILITY_STURDY,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Magneton
        50, 60, 95, 70, 120, 70,
        TYPE_ELECTRIC,
        TYPE_STEEL,
        60, // catch rate
        161, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        255, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_MAGNET_PULL,
        ABILITY_STURDY,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Farfetch'd
        52, 65, 55, 60, 58, 62,
        TYPE_NORMAL,
        TYPE_FLYING,
        45, // catch rate
        94, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_STICK,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FIELD,
        ABILITY_KEEN_EYE,
        ABILITY_INNER_FOCUS,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Doduo
        35, 85, 45, 75, 35, 35,
        TYPE_NORMAL,
        TYPE_FLYING,
        190, // catch rate
        96, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SHARP_BEAK,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_RUN_AWAY,
        ABILITY_EARLY_BIRD,
        8, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Dodrio
        60, 110, 70, 100, 60, 60,
        TYPE_NORMAL,
        TYPE_FLYING,
        45, // catch rate
        158, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SHARP_BEAK,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_RUN_AWAY,
        ABILITY_EARLY_BIRD,
        10, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Seel
        65, 45, 55, 45, 45, 70,
        TYPE_WATER,
        TYPE_WATER,
        190, // catch rate
        100, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Dewgong
        90, 70, 80, 70, 70, 95,
        TYPE_WATER,
        TYPE_ICE,
        75, // catch rate
        176, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Grimer
        80, 80, 50, 25, 40, 50,
        TYPE_POISON,
        TYPE_POISON,
        190, // catch rate
        90, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NUGGET,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_STENCH,
        ABILITY_STICKY_HOLD,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Muk
        105, 105, 75, 50, 65, 100,
        TYPE_POISON,
        TYPE_POISON,
        75, // catch rate
        157, // base exp. yield
        1, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NUGGET,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_STENCH,
        ABILITY_STICKY_HOLD,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Shellder
        30, 65, 100, 40, 45, 25,
        TYPE_WATER,
        TYPE_WATER,
        190, // catch rate
        97, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_PEARL,
        ITEM_BIG_PEARL,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_SHELL_ARMOR,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Cloyster
        50, 95, 180, 70, 85, 45,
        TYPE_WATER,
        TYPE_ICE,
        60, // catch rate
        203, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_PEARL,
        ITEM_BIG_PEARL,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_SHELL_ARMOR,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Gastly
        30, 35, 30, 80, 100, 35,
        TYPE_GHOST,
        TYPE_POISON,
        190, // catch rate
        95, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Haunter
        45, 50, 45, 95, 115, 55,
        TYPE_GHOST,
        TYPE_POISON,
        90, // catch rate
        126, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Gengar
        60, 65, 60, 110, 130, 75,
        TYPE_GHOST,
        TYPE_POISON,
        45, // catch rate
        190, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Onix
        35, 45, 160, 70, 30, 45,
        TYPE_ROCK,
        TYPE_GROUND,
        45, // catch rate
        108, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_ROCK_HEAD,
        ABILITY_STURDY,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Drowzee
        60, 48, 45, 42, 43, 90,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        190, // catch rate
        102, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_INSOMNIA,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Hypno
        85, 73, 70, 67, 73, 115,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        75, // catch rate
        165, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_INSOMNIA,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Krabby
        30, 105, 90, 50, 25, 25,
        TYPE_WATER,
        TYPE_WATER,
        225, // catch rate
        115, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_HYPER_CUTTER,
        ABILITY_SHELL_ARMOR,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Kingler
        55, 130, 115, 75, 50, 50,
        TYPE_WATER,
        TYPE_WATER,
        60, // catch rate
        206, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_HYPER_CUTTER,
        ABILITY_SHELL_ARMOR,
        0, // Safari Zone flee rate
        BODY_COLOR_RED, TRUE
    }, { // Voltorb
        40, 30, 50, 100, 55, 55,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        190, // catch rate
        103, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_SOUNDPROOF,
        ABILITY_STATIC,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Electrode
        60, 50, 70, 140, 80, 80,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        60, // catch rate
        150, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_SOUNDPROOF,
        ABILITY_STATIC,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Exeggcute
        60, 40, 80, 40, 60, 45,
        TYPE_GRASS,
        TYPE_PSYCHIC,
        90, // catch rate
        98, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Exeggutor
        95, 95, 85, 55, 125, 65,
        TYPE_GRASS,
        TYPE_PSYCHIC,
        45, // catch rate
        212, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Cubone
        50, 50, 95, 35, 40, 50,
        TYPE_GROUND,
        TYPE_GROUND,
        190, // catch rate
        87, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_THICK_CLUB,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_ROCK_HEAD,
        ABILITY_LIGHTNING_ROD,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Marowak
        60, 80, 110, 45, 50, 80,
        TYPE_GROUND,
        TYPE_GROUND,
        75, // catch rate
        124, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_THICK_CLUB,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_ROCK_HEAD,
        ABILITY_LIGHTNING_ROD,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Hitmonlee
        50, 120, 53, 87, 35, 110,
        TYPE_FIGHTING,
        TYPE_FIGHTING,
        45, // catch rate
        139, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_LIMBER,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Hitmonchan
        50, 105, 79, 76, 35, 110,
        TYPE_FIGHTING,
        TYPE_FIGHTING,
        45, // catch rate
        140, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        0, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Lickitung
        90, 55, 75, 30, 60, 75,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        127, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_OWN_TEMPO,
        ABILITY_OBLIVIOUS,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Koffing
        40, 65, 95, 35, 60, 45,
        TYPE_POISON,
        TYPE_POISON,
        190, // catch rate
        114, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_SMOKE_BALL,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Weezing
        65, 90, 120, 60, 85, 70,
        TYPE_POISON,
        TYPE_POISON,
        60, // catch rate
        173, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_SMOKE_BALL,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Rhyhorn
        80, 85, 95, 25, 30, 30,
        TYPE_GROUND,
        TYPE_ROCK,
        120, // catch rate
        135, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_LIGHTNING_ROD,
        ABILITY_ROCK_HEAD,
        4, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Rhydon
        105, 130, 120, 40, 45, 45,
        TYPE_GROUND,
        TYPE_ROCK,
        60, // catch rate
        204, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_LIGHTNING_ROD,
        ABILITY_ROCK_HEAD,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Chansey
        250, 5, 5, 50, 35, 105,
        TYPE_NORMAL,
        TYPE_NORMAL,
        30, // catch rate
        255, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_LUCKY_EGG,
        254, // gender
        40, // egg cycles
        140, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_NATURAL_CURE,
        ABILITY_SERENE_GRACE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Tangela
        65, 55, 115, 60, 100, 40,
        TYPE_GRASS,
        TYPE_GRASS,
        45, // catch rate
        166, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Kangaskhan
        105, 95, 80, 90, 40, 80,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        175, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        254, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_EARLY_BIRD,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Horsea
        30, 40, 70, 60, 70, 25,
        TYPE_WATER,
        TYPE_WATER,
        225, // catch rate
        83, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Seadra
        55, 65, 95, 85, 95, 45,
        TYPE_WATER,
        TYPE_WATER,
        75, // catch rate
        155, // base exp. yield
        0, 0, 1, 0, 1, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Goldeen
        45, 67, 60, 63, 35, 50,
        TYPE_WATER,
        TYPE_WATER,
        225, // catch rate
        111, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_SWIFT_SWIM,
        ABILITY_WATER_VEIL,
        4, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Seaking
        80, 92, 65, 68, 65, 80,
        TYPE_WATER,
        TYPE_WATER,
        60, // catch rate
        170, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_SWIFT_SWIM,
        ABILITY_WATER_VEIL,
        6, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Staryu
        30, 45, 55, 85, 70, 55,
        TYPE_WATER,
        TYPE_WATER,
        225, // catch rate
        106, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_STARDUST,
        ITEM_STAR_PIECE,
        255, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_ILLUMINATE,
        ABILITY_NATURAL_CURE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Starmie
        60, 75, 85, 115, 100, 85,
        TYPE_WATER,
        TYPE_PSYCHIC,
        60, // catch rate
        207, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_STARDUST,
        ITEM_STAR_PIECE,
        255, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_ILLUMINATE,
        ABILITY_NATURAL_CURE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Mr. mime
        40, 45, 65, 90, 100, 120,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        45, // catch rate
        136, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_LEPPA_BERRY,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SOUNDPROOF,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Scyther
        70, 110, 80, 105, 55, 80,
        TYPE_BUG,
        TYPE_FLYING,
        45, // catch rate
        187, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Jynx
        65, 50, 35, 95, 115, 95,
        TYPE_ICE,
        TYPE_PSYCHIC,
        45, // catch rate
        137, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_ASPEAR_BERRY,
        ITEM_ASPEAR_BERRY,
        254, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Electabuzz
        65, 83, 57, 105, 95, 85,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        45, // catch rate
        156, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_STATIC,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW, TRUE
    }, { // Magmar
        65, 95, 57, 93, 100, 85,
        TYPE_FIRE,
        TYPE_FIRE,
        45, // catch rate
        167, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        63, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_FLAME_BODY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Pinsir
        65, 125, 100, 85, 55, 70,
        TYPE_BUG,
        TYPE_BUG,
        45, // catch rate
        200, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_HYPER_CUTTER,
        ABILITY_NONE,
        8, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Tauros
        75, 100, 95, 110, 40, 70,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        211, // base exp. yield
        0, 1, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Magikarp
        20, 10, 55, 80, 15, 20,
        TYPE_WATER,
        TYPE_WATER,
        255, // catch rate
        20, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        5, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_DRAGON,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        4, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Gyarados
        95, 125, 79, 81, 60, 100,
        TYPE_WATER,
        TYPE_FLYING,
        45, // catch rate
        214, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        5, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_DRAGON,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Lapras
        130, 85, 80, 60, 85, 95,
        TYPE_WATER,
        TYPE_ICE,
        45, // catch rate
        219, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        40, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_WATER_ABSORB,
        ABILITY_SHELL_ARMOR,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Ditto
        48, 48, 48, 48, 48, 48,
        TYPE_NORMAL,
        TYPE_NORMAL,
        35, // catch rate
        61, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_METAL_POWDER,
        255, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_DITTO,
        EGG_GROUP_DITTO,
        ABILITY_LIMBER,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Eevee
        55, 55, 50, 55, 45, 65,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        92, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        35, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Vaporeon
        130, 65, 60, 65, 110, 95,
        TYPE_WATER,
        TYPE_WATER,
        45, // catch rate
        196, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        35, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_WATER_ABSORB,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Jolteon
        65, 65, 60, 130, 110, 95,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        45, // catch rate
        197, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        35, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_VOLT_ABSORB,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Flareon
        65, 130, 60, 65, 95, 110,
        TYPE_FIRE,
        TYPE_FIRE,
        45, // catch rate
        198, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        35, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_FLASH_FIRE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Porygon
        65, 60, 70, 40, 85, 75,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        130, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_TRACE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Omanyte
        35, 40, 100, 35, 90, 55,
        TYPE_ROCK,
        TYPE_WATER,
        45, // catch rate
        120, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        30, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_SWIFT_SWIM,
        ABILITY_SHELL_ARMOR,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Omastar
        70, 60, 125, 55, 115, 70,
        TYPE_ROCK,
        TYPE_WATER,
        45, // catch rate
        199, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        30, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_SWIFT_SWIM,
        ABILITY_SHELL_ARMOR,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Kabuto
        30, 80, 90, 55, 55, 45,
        TYPE_ROCK,
        TYPE_WATER,
        45, // catch rate
        119, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        30, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_SWIFT_SWIM,
        ABILITY_BATTLE_ARMOR,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Kabutops
        60, 115, 105, 80, 65, 70,
        TYPE_ROCK,
        TYPE_WATER,
        45, // catch rate
        201, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        30, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_SWIFT_SWIM,
        ABILITY_BATTLE_ARMOR,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Aerodactyl
        80, 105, 65, 130, 60, 75,
        TYPE_ROCK,
        TYPE_FLYING,
        45, // catch rate
        202, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        35, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_ROCK_HEAD,
        ABILITY_PRESSURE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Snorlax
        160, 110, 65, 30, 65, 110,
        TYPE_NORMAL,
        TYPE_NORMAL,
        25, // catch rate
        154, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_LEFTOVERS,
        ITEM_LEFTOVERS,
        31, // gender
        40, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_IMMUNITY,
        ABILITY_THICK_FAT,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Articuno
        90, 85, 100, 85, 95, 125,
        TYPE_ICE,
        TYPE_FLYING,
        3, // catch rate
        215, // base exp. yield
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        80, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Zapdos
        90, 90, 85, 100, 125, 90,
        TYPE_ELECTRIC,
        TYPE_FLYING,
        3, // catch rate
        216, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        80, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Moltres
        90, 100, 90, 90, 125, 85,
        TYPE_FIRE,
        TYPE_FLYING,
        3, // catch rate
        217, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        80, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Dratini
        41, 64, 45, 50, 50, 50,
        TYPE_DRAGON,
        TYPE_DRAGON,
        45, // catch rate
        67, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Dragonair
        61, 84, 65, 70, 70, 70,
        TYPE_DRAGON,
        TYPE_DRAGON,
        45, // catch rate
        144, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Dragonite
        91, 134, 95, 80, 100, 100,
        TYPE_DRAGON,
        TYPE_FLYING,
        45, // catch rate
        218, // base exp. yield
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Mewtwo
        106, 110, 90, 130, 154, 90,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        3, // catch rate
        220, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Mew
        100, 100, 100, 100, 100, 100,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        45, // catch rate
        64, // base exp. yield
        3, 0, 0, 0, 0, 0,
        ITEM_LUM_BERRY,
        ITEM_LUM_BERRY,
        255, // gender
        120, // egg cycles
        100, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_SYNCHRONIZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Chikorita
        45, 49, 65, 45, 49, 65,
        TYPE_GRASS,
        TYPE_GRASS,
        45, // catch rate
        64, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Bayleef
        60, 62, 80, 60, 63, 80,
        TYPE_GRASS,
        TYPE_GRASS,
        45, // catch rate
        141, // base exp. yield
        0, 0, 1, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Meganium
        80, 82, 100, 80, 83, 100,
        TYPE_GRASS,
        TYPE_GRASS,
        45, // catch rate
        208, // base exp. yield
        0, 0, 1, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Cyndaquil
        39, 52, 43, 65, 60, 50,
        TYPE_FIRE,
        TYPE_FIRE,
        45, // catch rate
        65, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Quilava
        58, 64, 58, 80, 80, 65,
        TYPE_FIRE,
        TYPE_FIRE,
        45, // catch rate
        142, // base exp. yield
        0, 0, 0, 1, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Typhlosion
        78, 84, 78, 100, 109, 85,
        TYPE_FIRE,
        TYPE_FIRE,
        45, // catch rate
        209, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Totodile
        50, 65, 64, 43, 44, 48,
        TYPE_WATER,
        TYPE_WATER,
        45, // catch rate
        66, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Croconaw
        65, 80, 80, 58, 59, 63,
        TYPE_WATER,
        TYPE_WATER,
        45, // catch rate
        143, // base exp. yield
        0, 1, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE, TRUE
    }, { // Feraligatr
        85, 105, 100, 78, 79, 83,
        TYPE_WATER,
        TYPE_WATER,
        45, // catch rate
        210, // base exp. yield
        0, 2, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Sentret
        35, 46, 34, 20, 35, 45,
        TYPE_NORMAL,
        TYPE_NORMAL,
        255, // catch rate
        57, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_ORAN_BERRY,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_KEEN_EYE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Furret
        85, 76, 64, 90, 45, 55,
        TYPE_NORMAL,
        TYPE_NORMAL,
        90, // catch rate
        116, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_ORAN_BERRY,
        ITEM_SITRUS_BERRY,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_KEEN_EYE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Hoothoot
        60, 30, 30, 50, 36, 56,
        TYPE_NORMAL,
        TYPE_FLYING,
        255, // catch rate
        58, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INSOMNIA,
        ABILITY_KEEN_EYE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Noctowl
        100, 50, 50, 70, 76, 96,
        TYPE_NORMAL,
        TYPE_FLYING,
        90, // catch rate
        162, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INSOMNIA,
        ABILITY_KEEN_EYE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Ledyba
        40, 20, 30, 55, 40, 80,
        TYPE_BUG,
        TYPE_FLYING,
        255, // catch rate
        54, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_EARLY_BIRD,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Ledian
        55, 35, 50, 85, 55, 110,
        TYPE_BUG,
        TYPE_FLYING,
        90, // catch rate
        134, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_EARLY_BIRD,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Spinarak
        40, 60, 40, 30, 40, 40,
        TYPE_BUG,
        TYPE_POISON,
        255, // catch rate
        54, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_INSOMNIA,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Ariados
        70, 90, 70, 40, 60, 60,
        TYPE_BUG,
        TYPE_POISON,
        90, // catch rate
        134, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_INSOMNIA,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Crobat
        85, 90, 80, 130, 70, 80,
        TYPE_POISON,
        TYPE_FLYING,
        90, // catch rate
        204, // base exp. yield
        0, 0, 0, 3, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Chinchou
        75, 38, 38, 67, 56, 56,
        TYPE_WATER,
        TYPE_ELECTRIC,
        190, // catch rate
        90, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_YELLOW_SHARD,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_VOLT_ABSORB,
        ABILITY_ILLUMINATE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Lanturn
        125, 58, 58, 67, 76, 76,
        TYPE_WATER,
        TYPE_ELECTRIC,
        75, // catch rate
        156, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_YELLOW_SHARD,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_VOLT_ABSORB,
        ABILITY_ILLUMINATE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Pichu
        20, 40, 15, 60, 35, 35,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        190, // catch rate
        42, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_ORAN_BERRY,
        127, // gender
        10, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_STATIC,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Cleffa
        50, 25, 28, 15, 45, 55,
        TYPE_NORMAL,
        TYPE_NORMAL,
        150, // catch rate
        37, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_LEPPA_BERRY,
        ITEM_MOON_STONE,
        191, // gender
        10, // egg cycles
        140, // base friendship
        GROWTH_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Igglybuff
        90, 30, 15, 15, 40, 20,
        TYPE_NORMAL,
        TYPE_NORMAL,
        170, // catch rate
        39, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191, // gender
        10, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK, TRUE
    }, { // Togepi
        35, 20, 65, 20, 40, 65,
        TYPE_NORMAL,
        TYPE_NORMAL,
        190, // catch rate
        74, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        10, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_HUSTLE,
        ABILITY_SERENE_GRACE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Togetic
        55, 40, 85, 40, 80, 105,
        TYPE_NORMAL,
        TYPE_FLYING,
        75, // catch rate
        114, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        10, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FAIRY,
        ABILITY_HUSTLE,
        ABILITY_SERENE_GRACE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Natu
        40, 50, 45, 70, 70, 45,
        TYPE_PSYCHIC,
        TYPE_FLYING,
        190, // catch rate
        73, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_SYNCHRONIZE,
        ABILITY_EARLY_BIRD,
        6, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Xatu
        65, 75, 70, 95, 95, 70,
        TYPE_PSYCHIC,
        TYPE_FLYING,
        75, // catch rate
        171, // base exp. yield
        0, 0, 0, 1, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_SYNCHRONIZE,
        ABILITY_EARLY_BIRD,
        8, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Mareep
        55, 40, 40, 35, 65, 45,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        235, // catch rate
        59, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_STATIC,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Flaaffy
        70, 55, 55, 45, 80, 60,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        120, // catch rate
        117, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_STATIC,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Ampharos
        90, 75, 75, 55, 115, 90,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        45, // catch rate
        194, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_STATIC,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Bellossom
        75, 80, 85, 50, 90, 100,
        TYPE_GRASS,
        TYPE_GRASS,
        45, // catch rate
        184, // base exp. yield
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Marill
        70, 20, 50, 40, 20, 50,
        TYPE_WATER,
        TYPE_WATER,
        190, // catch rate
        58, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        10, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FAIRY,
        ABILITY_THICK_FAT,
        ABILITY_HUGE_POWER,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Azumarill
        100, 50, 80, 50, 50, 80,
        TYPE_WATER,
        TYPE_WATER,
        75, // catch rate
        153, // base exp. yield
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        10, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FAIRY,
        ABILITY_THICK_FAT,
        ABILITY_HUGE_POWER,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Sudowoodo
        70, 100, 115, 30, 30, 65,
        TYPE_ROCK,
        TYPE_ROCK,
        65, // catch rate
        135, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_STURDY,
        ABILITY_ROCK_HEAD,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Politoed
        90, 75, 75, 70, 90, 100,
        TYPE_WATER,
        TYPE_WATER,
        45, // catch rate
        185, // base exp. yield
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_WATER_ABSORB,
        ABILITY_DAMP,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN, TRUE
    }, { // Hoppip
        35, 35, 40, 50, 35, 55,
        TYPE_GRASS,
        TYPE_FLYING,
        255, // catch rate
        74, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Skiploom
        55, 45, 50, 80, 45, 65,
        TYPE_GRASS,
        TYPE_FLYING,
        120, // catch rate
        136, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Jumpluff
        75, 55, 70, 110, 55, 85,
        TYPE_GRASS,
        TYPE_FLYING,
        45, // catch rate
        176, // base exp. yield
        0, 0, 0, 3, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Aipom
        55, 70, 55, 85, 40, 55,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        94, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_PICKUP,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Sunkern
        30, 30, 30, 30, 30, 30,
        TYPE_GRASS,
        TYPE_GRASS,
        235, // catch rate
        52, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Sunflora
        75, 75, 55, 30, 105, 85,
        TYPE_GRASS,
        TYPE_GRASS,
        120, // catch rate
        146, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Yanma
        65, 65, 45, 95, 75, 45,
        TYPE_BUG,
        TYPE_FLYING,
        75, // catch rate
        147, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SPEED_BOOST,
        ABILITY_COMPOUND_EYES,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Wooper
        55, 45, 45, 15, 25, 25,
        TYPE_WATER,
        TYPE_GROUND,
        255, // catch rate
        52, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_DAMP,
        ABILITY_WATER_ABSORB,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Quagsire
        95, 85, 85, 35, 65, 65,
        TYPE_WATER,
        TYPE_GROUND,
        90, // catch rate
        137, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_DAMP,
        ABILITY_WATER_ABSORB,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Espeon
        65, 65, 60, 110, 130, 95,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        45, // catch rate
        197, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        35, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SYNCHRONIZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Umbreon
        95, 65, 110, 65, 60, 130,
        TYPE_DARK,
        TYPE_DARK,
        45, // catch rate
        197, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        35, // egg cycles
        35, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SYNCHRONIZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Murkrow
        60, 85, 42, 91, 85, 42,
        TYPE_DARK,
        TYPE_FLYING,
        30, // catch rate
        107, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        35, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INSOMNIA,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Slowking
        95, 75, 80, 30, 100, 110,
        TYPE_WATER,
        TYPE_PSYCHIC,
        70, // catch rate
        164, // base exp. yield
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_OBLIVIOUS,
        ABILITY_OWN_TEMPO,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Misdreavus
        60, 60, 60, 85, 85, 85,
        TYPE_GHOST,
        TYPE_GHOST,
        45, // catch rate
        147, // base exp. yield
        0, 0, 0, 0, 1, 1,
        ITEM_NONE,
        ITEM_SPELL_TAG,
        127, // gender
        25, // egg cycles
        35, // base friendship
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Unown
        48, 72, 48, 48, 72, 48,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        225, // catch rate
        61, // base exp. yield
        0, 1, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        40, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK, TRUE
    }, { // Wobbuffet
        190, 33, 58, 33, 33, 58,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        45, // catch rate
        177, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_SHADOW_TAG,
        ABILITY_NONE,
        4, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Girafarig
        70, 80, 65, 85, 90, 65,
        TYPE_NORMAL,
        TYPE_PSYCHIC,
        60, // catch rate
        149, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_PERSIM_BERRY,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INNER_FOCUS,
        ABILITY_EARLY_BIRD,
        4, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Pineco
        50, 65, 90, 15, 35, 35,
        TYPE_BUG,
        TYPE_BUG,
        190, // catch rate
        60, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_STURDY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Forretress
        75, 90, 140, 40, 60, 60,
        TYPE_BUG,
        TYPE_STEEL,
        75, // catch rate
        118, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_STURDY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Dunsparce
        100, 70, 70, 45, 65, 65,
        TYPE_NORMAL,
        TYPE_NORMAL,
        190, // catch rate
        75, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SERENE_GRACE,
        ABILITY_RUN_AWAY,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Gligar
        65, 75, 105, 85, 35, 65,
        TYPE_GROUND,
        TYPE_FLYING,
        60, // catch rate
        108, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_HYPER_CUTTER,
        ABILITY_SAND_VEIL,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Steelix
        75, 85, 200, 30, 55, 65,
        TYPE_STEEL,
        TYPE_GROUND,
        25, // catch rate
        196, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_ROCK_HEAD,
        ABILITY_STURDY,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Snubbull
        60, 80, 50, 30, 40, 40,
        TYPE_NORMAL,
        TYPE_NORMAL,
        190, // catch rate
        63, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_INTIMIDATE,
        ABILITY_RUN_AWAY,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Granbull
        90, 120, 75, 45, 60, 60,
        TYPE_NORMAL,
        TYPE_NORMAL,
        75, // catch rate
        178, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_INTIMIDATE,
        ABILITY_INTIMIDATE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Qwilfish
        65, 95, 75, 85, 55, 55,
        TYPE_WATER,
        TYPE_POISON,
        45, // catch rate
        100, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_POISON_POINT,
        ABILITY_SWIFT_SWIM,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Scizor
        70, 130, 100, 65, 55, 80,
        TYPE_BUG,
        TYPE_STEEL,
        25, // catch rate
        200, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Shuckle
        20, 10, 230, 5, 10, 230,
        TYPE_BUG,
        TYPE_ROCK,
        190, // catch rate
        80, // base exp. yield
        0, 0, 1, 0, 0, 1,
        ITEM_ORAN_BERRY,
        ITEM_ORAN_BERRY,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_STURDY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Heracross
        80, 125, 75, 85, 40, 95,
        TYPE_BUG,
        TYPE_FIGHTING,
        45, // catch rate
        200, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_GUTS,
        8, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Sneasel
        55, 95, 55, 115, 35, 75,
        TYPE_DARK,
        TYPE_ICE,
        60, // catch rate
        132, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_QUICK_CLAW,
        127, // gender
        20, // egg cycles
        35, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INNER_FOCUS,
        ABILITY_KEEN_EYE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK, TRUE
    }, { // Teddiursa
        60, 80, 50, 40, 50, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        120, // catch rate
        124, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PICKUP,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN, TRUE
    }, { // Ursaring
        90, 130, 75, 55, 75, 75,
        TYPE_NORMAL,
        TYPE_NORMAL,
        60, // catch rate
        189, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_GUTS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Slugma
        40, 40, 40, 20, 70, 40,
        TYPE_FIRE,
        TYPE_FIRE,
        190, // catch rate
        78, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_MAGMA_ARMOR,
        ABILITY_FLAME_BODY,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Magcargo
        50, 50, 120, 30, 80, 80,
        TYPE_FIRE,
        TYPE_ROCK,
        75, // catch rate
        154, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_MAGMA_ARMOR,
        ABILITY_FLAME_BODY,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Swinub
        50, 50, 40, 50, 30, 30,
        TYPE_ICE,
        TYPE_GROUND,
        225, // catch rate
        78, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Piloswine
        100, 100, 80, 50, 60, 60,
        TYPE_ICE,
        TYPE_GROUND,
        75, // catch rate
        160, // base exp. yield
        1, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Corsola
        55, 55, 85, 35, 65, 85,
        TYPE_WATER,
        TYPE_ROCK,
        60, // catch rate
        113, // base exp. yield
        0, 0, 1, 0, 0, 1,
        ITEM_NONE,
        ITEM_RED_SHARD,
        191, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_HUSTLE,
        ABILITY_NATURAL_CURE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Remoraid
        35, 65, 35, 65, 65, 35,
        TYPE_WATER,
        TYPE_WATER,
        190, // catch rate
        78, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_2,
        ABILITY_HUSTLE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Octillery
        75, 105, 75, 45, 105, 75,
        TYPE_WATER,
        TYPE_WATER,
        75, // catch rate
        164, // base exp. yield
        0, 1, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_2,
        ABILITY_SUCTION_CUPS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Delibird
        45, 55, 45, 75, 65, 45,
        TYPE_ICE,
        TYPE_FLYING,
        45, // catch rate
        183, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_VITAL_SPIRIT,
        ABILITY_HUSTLE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Mantine
        65, 40, 70, 70, 80, 140,
        TYPE_WATER,
        TYPE_FLYING,
        25, // catch rate
        168, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_SWIFT_SWIM,
        ABILITY_WATER_ABSORB,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Skarmory
        65, 80, 140, 70, 40, 70,
        TYPE_STEEL,
        TYPE_FLYING,
        25, // catch rate
        168, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_STURDY,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Houndour
        45, 60, 30, 65, 80, 50,
        TYPE_DARK,
        TYPE_FIRE,
        120, // catch rate
        114, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_EARLY_BIRD,
        ABILITY_FLASH_FIRE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Houndoom
        75, 90, 50, 95, 110, 80,
        TYPE_DARK,
        TYPE_FIRE,
        45, // catch rate
        204, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_EARLY_BIRD,
        ABILITY_FLASH_FIRE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Kingdra
        75, 95, 95, 85, 95, 95,
        TYPE_WATER,
        TYPE_DRAGON,
        45, // catch rate
        207, // base exp. yield
        0, 1, 0, 0, 1, 1,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Phanpy
        90, 60, 60, 40, 40, 40,
        TYPE_GROUND,
        TYPE_GROUND,
        120, // catch rate
        124, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PICKUP,
        ABILITY_NONE,
        10, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Donphan
        90, 120, 120, 50, 60, 60,
        TYPE_GROUND,
        TYPE_GROUND,
        60, // catch rate
        189, // base exp. yield
        0, 1, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_STURDY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Porygon2
        85, 80, 90, 60, 105, 95,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        180, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_TRACE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Stantler
        73, 95, 62, 85, 85, 65,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        165, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Smeargle
        55, 20, 35, 75, 20, 45,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        106, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_OWN_TEMPO,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Tyrogue
        35, 35, 35, 35, 35, 35,
        TYPE_FIGHTING,
        TYPE_FIGHTING,
        75, // catch rate
        91, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_GUTS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Hitmontop
        50, 95, 95, 70, 35, 110,
        TYPE_FIGHTING,
        TYPE_FIGHTING,
        45, // catch rate
        138, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        0, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Smoochum
        45, 30, 15, 65, 85, 65,
        TYPE_ICE,
        TYPE_PSYCHIC,
        45, // catch rate
        87, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_ASPEAR_BERRY,
        ITEM_ASPEAR_BERRY,
        254, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Elekid
        45, 63, 37, 95, 65, 55,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        45, // catch rate
        106, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_STATIC,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW, TRUE
    }, { // Magby
        45, 75, 37, 83, 70, 55,
        TYPE_FIRE,
        TYPE_FIRE,
        45, // catch rate
        117, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        63, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_FLAME_BODY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Miltank
        95, 80, 105, 100, 40, 70,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        200, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_MOOMOO_MILK,
        ITEM_MOOMOO_MILK,
        254, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Blissey
        255, 10, 10, 55, 75, 135,
        TYPE_NORMAL,
        TYPE_NORMAL,
        30, // catch rate
        255, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_LUCKY_EGG,
        254, // gender
        40, // egg cycles
        140, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_NATURAL_CURE,
        ABILITY_SERENE_GRACE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Raikou
        90, 85, 75, 115, 115, 100,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        3, // catch rate
        216, // base exp. yield
        0, 0, 0, 2, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        80, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Entei
        115, 115, 85, 100, 90, 75,
        TYPE_FIRE,
        TYPE_FIRE,
        3, // catch rate
        217, // base exp. yield
        1, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        80, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Suicune
        100, 75, 115, 85, 90, 115,
        TYPE_WATER,
        TYPE_WATER,
        3, // catch rate
        215, // base exp. yield
        0, 0, 1, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        80, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Larvitar
        50, 64, 50, 41, 45, 50,
        TYPE_ROCK,
        TYPE_GROUND,
        45, // catch rate
        67, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_GUTS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Pupitar
        70, 84, 70, 51, 65, 70,
        TYPE_ROCK,
        TYPE_GROUND,
        45, // catch rate
        144, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Tyranitar
        100, 134, 110, 61, 95, 100,
        TYPE_ROCK,
        TYPE_DARK,
        45, // catch rate
        218, // base exp. yield
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_SAND_STREAM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Lugia
        106, 90, 130, 110, 90, 154,
        TYPE_PSYCHIC,
        TYPE_FLYING,
        3, // catch rate
        220, // base exp. yield
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Ho-Oh
        106, 130, 90, 90, 110, 154,
        TYPE_FIRE,
        TYPE_FLYING,
        3, // catch rate
        220, // base exp. yield
        0, 0, 0, 0, 0, 3,
        ITEM_SACRED_ASH,
        ITEM_SACRED_ASH,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Celebi
        100, 100, 100, 100, 100, 100,
        TYPE_PSYCHIC,
        TYPE_GRASS,
        45, // catch rate
        64, // base exp. yield
        3, 0, 0, 0, 0, 0,
        ITEM_LUM_BERRY,
        ITEM_LUM_BERRY,
        255, // gender
        120, // egg cycles
        100, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NATURAL_CURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // ?
        50, 150, 50, 150, 150, 50,
        TYPE_NORMAL,
        TYPE_NORMAL,
        3, // catch rate
        1, // base exp. yield
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Treecko
        40, 45, 35, 70, 65, 55,
        TYPE_GRASS,
        TYPE_GRASS,
        45, // catch rate
        65, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Grovyle
        50, 65, 45, 95, 85, 65,
        TYPE_GRASS,
        TYPE_GRASS,
        45, // catch rate
        141, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Sceptile
        70, 85, 65, 120, 105, 85,
        TYPE_GRASS,
        TYPE_GRASS,
        45, // catch rate
        208, // base exp. yield
        0, 0, 0, 3, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Torchic
        45, 60, 40, 45, 70, 50,
        TYPE_FIRE,
        TYPE_FIRE,
        45, // catch rate
        65, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Combusken
        60, 85, 60, 55, 85, 60,
        TYPE_FIRE,
        TYPE_FIGHTING,
        45, // catch rate
        142, // base exp. yield
        0, 1, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Blaziken
        80, 120, 70, 80, 110, 70,
        TYPE_FIRE,
        TYPE_FIGHTING,
        45, // catch rate
        209, // base exp. yield
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Mudkip
        50, 70, 50, 40, 50, 50,
        TYPE_WATER,
        TYPE_WATER,
        45, // catch rate
        65, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Marshtomp
        70, 85, 70, 50, 60, 70,
        TYPE_WATER,
        TYPE_GROUND,
        45, // catch rate
        143, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Swampert
        100, 110, 90, 60, 85, 90,
        TYPE_WATER,
        TYPE_GROUND,
        45, // catch rate
        210, // base exp. yield
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Poochyena
        35, 55, 35, 35, 30, 30,
        TYPE_DARK,
        TYPE_DARK,
        255, // catch rate
        55, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_PECHA_BERRY,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Mightyena
        70, 90, 70, 70, 60, 60,
        TYPE_DARK,
        TYPE_DARK,
        127, // catch rate
        128, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_PECHA_BERRY,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Zigzagoon
        38, 30, 41, 60, 30, 41,
        TYPE_NORMAL,
        TYPE_NORMAL,
        255, // catch rate
        60, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_ORAN_BERRY,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PICKUP,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Linoone
        78, 70, 61, 100, 50, 61,
        TYPE_NORMAL,
        TYPE_NORMAL,
        90, // catch rate
        128, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_ORAN_BERRY,
        ITEM_SITRUS_BERRY,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PICKUP,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Wurmple
        45, 45, 35, 20, 20, 30,
        TYPE_BUG,
        TYPE_BUG,
        255, // catch rate
        54, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHIELD_DUST,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Silcoon
        50, 35, 55, 15, 25, 25,
        TYPE_BUG,
        TYPE_BUG,
        120, // catch rate
        71, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Beautifly
        60, 70, 50, 65, 90, 50,
        TYPE_BUG,
        TYPE_FLYING,
        45, // catch rate
        161, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_SILVER_POWDER,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Cascoon
        50, 35, 55, 15, 25, 25,
        TYPE_BUG,
        TYPE_BUG,
        120, // catch rate
        72, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Dustox
        60, 50, 70, 65, 50, 90,
        TYPE_BUG,
        TYPE_POISON,
        45, // catch rate
        160, // base exp. yield
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_SILVER_POWDER,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHIELD_DUST,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Lotad
        40, 30, 30, 30, 40, 50,
        TYPE_WATER,
        TYPE_GRASS,
        255, // catch rate
        74, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_GRASS,
        ABILITY_SWIFT_SWIM,
        ABILITY_RAIN_DISH,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Lombre
        60, 50, 50, 50, 60, 70,
        TYPE_WATER,
        TYPE_GRASS,
        120, // catch rate
        141, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_GRASS,
        ABILITY_SWIFT_SWIM,
        ABILITY_RAIN_DISH,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Ludicolo
        80, 70, 70, 70, 90, 100,
        TYPE_WATER,
        TYPE_GRASS,
        45, // catch rate
        181, // base exp. yield
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_GRASS,
        ABILITY_SWIFT_SWIM,
        ABILITY_RAIN_DISH,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Seedot
        40, 40, 50, 30, 30, 30,
        TYPE_GRASS,
        TYPE_GRASS,
        255, // catch rate
        74, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_EARLY_BIRD,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Nuzleaf
        70, 70, 40, 60, 60, 40,
        TYPE_GRASS,
        TYPE_DARK,
        120, // catch rate
        141, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_EARLY_BIRD,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Shiftry
        90, 100, 60, 80, 90, 60,
        TYPE_GRASS,
        TYPE_DARK,
        45, // catch rate
        181, // base exp. yield
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_EARLY_BIRD,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Nincada
        31, 45, 90, 40, 30, 30,
        TYPE_BUG,
        TYPE_GROUND,
        255, // catch rate
        65, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_COMPOUND_EYES,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Ninjask
        61, 90, 45, 160, 50, 50,
        TYPE_BUG,
        TYPE_FLYING,
        120, // catch rate
        155, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SPEED_BOOST,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Shedinja
        1, 90, 45, 40, 30, 30,
        TYPE_BUG,
        TYPE_GHOST,
        45, // catch rate
        95, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_WONDER_GUARD,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Taillow
        40, 55, 30, 85, 30, 30,
        TYPE_NORMAL,
        TYPE_FLYING,
        200, // catch rate
        59, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_GUTS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Swellow
        60, 85, 60, 125, 50, 50,
        TYPE_NORMAL,
        TYPE_FLYING,
        45, // catch rate
        162, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_GUTS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Shroomish
        60, 40, 60, 35, 40, 60,
        TYPE_GRASS,
        TYPE_GRASS,
        255, // catch rate
        65, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_EFFECT_SPORE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Breloom
        60, 130, 80, 70, 60, 60,
        TYPE_GRASS,
        TYPE_FIGHTING,
        90, // catch rate
        165, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_EFFECT_SPORE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Spinda
        60, 60, 60, 60, 60, 60,
        TYPE_NORMAL,
        TYPE_NORMAL,
        255, // catch rate
        85, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_CHESTO_BERRY,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_OWN_TEMPO,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN, TRUE
    }, { // Wingull
        40, 30, 30, 85, 55, 30,
        TYPE_WATER,
        TYPE_FLYING,
        190, // catch rate
        64, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Pelipper
        60, 50, 100, 65, 85, 70,
        TYPE_WATER,
        TYPE_FLYING,
        45, // catch rate
        164, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Surskit
        40, 30, 32, 65, 50, 52,
        TYPE_BUG,
        TYPE_WATER,
        200, // catch rate
        63, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_BUG,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Masquerain
        70, 60, 62, 60, 80, 82,
        TYPE_BUG,
        TYPE_FLYING,
        75, // catch rate
        128, // base exp. yield
        0, 0, 0, 0, 1, 1,
        ITEM_NONE,
        ITEM_SILVER_POWDER,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_BUG,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Wailmer
        130, 70, 35, 60, 70, 35,
        TYPE_WATER,
        TYPE_WATER,
        125, // catch rate
        137, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        40, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_FIELD,
        EGG_GROUP_WATER_2,
        ABILITY_WATER_VEIL,
        ABILITY_OBLIVIOUS,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Wailord
        170, 90, 45, 60, 90, 45,
        TYPE_WATER,
        TYPE_WATER,
        60, // catch rate
        206, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        40, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_FIELD,
        EGG_GROUP_WATER_2,
        ABILITY_WATER_VEIL,
        ABILITY_OBLIVIOUS,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Skitty
        50, 45, 45, 50, 35, 35,
        TYPE_NORMAL,
        TYPE_NORMAL,
        255, // catch rate
        65, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_LEPPA_BERRY,
        191, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Delcatty
        70, 65, 65, 70, 55, 55,
        TYPE_NORMAL,
        TYPE_NORMAL,
        60, // catch rate
        138, // base exp. yield
        1, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_LEPPA_BERRY,
        191, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Kecleon
        60, 90, 70, 40, 60, 120,
        TYPE_NORMAL,
        TYPE_NORMAL,
        200, // catch rate
        132, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_PERSIM_BERRY,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_COLOR_CHANGE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Baltoy
        40, 40, 55, 55, 40, 70,
        TYPE_GROUND,
        TYPE_PSYCHIC,
        255, // catch rate
        58, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Claydol
        60, 70, 105, 75, 70, 120,
        TYPE_GROUND,
        TYPE_PSYCHIC,
        90, // catch rate
        189, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Nosepass
        30, 45, 135, 30, 45, 90,
        TYPE_ROCK,
        TYPE_ROCK,
        255, // catch rate
        108, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_STURDY,
        ABILITY_MAGNET_PULL,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Torkoal
        70, 85, 140, 20, 85, 70,
        TYPE_FIRE,
        TYPE_FIRE,
        90, // catch rate
        161, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_WHITE_SMOKE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Sableye
        50, 75, 75, 50, 65, 65,
        TYPE_DARK,
        TYPE_GHOST,
        45, // catch rate
        98, // base exp. yield
        0, 1, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        25, // egg cycles
        35, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Barboach
        50, 48, 43, 60, 46, 41,
        TYPE_WATER,
        TYPE_GROUND,
        190, // catch rate
        92, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Whiscash
        110, 78, 73, 60, 76, 71,
        TYPE_WATER,
        TYPE_GROUND,
        75, // catch rate
        158, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Luvdisc
        43, 30, 55, 97, 40, 65,
        TYPE_WATER,
        TYPE_WATER,
        225, // catch rate
        110, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_HEART_SCALE,
        ITEM_NONE,
        191, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Corphish
        43, 80, 65, 35, 50, 35,
        TYPE_WATER,
        TYPE_WATER,
        205, // catch rate
        111, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_HYPER_CUTTER,
        ABILITY_SHELL_ARMOR,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Crawdaunt
        63, 120, 85, 55, 90, 55,
        TYPE_WATER,
        TYPE_DARK,
        155, // catch rate
        161, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_HYPER_CUTTER,
        ABILITY_SHELL_ARMOR,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Feebas
        20, 15, 20, 80, 10, 55,
        TYPE_WATER,
        TYPE_WATER,
        255, // catch rate
        61, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Milotic
        95, 60, 79, 81, 100, 125,
        TYPE_WATER,
        TYPE_WATER,
        60, // catch rate
        213, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_MARVEL_SCALE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Carvanha
        45, 90, 20, 65, 65, 20,
        TYPE_WATER,
        TYPE_DARK,
        225, // catch rate
        88, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_ROUGH_SKIN,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Sharpedo
        70, 120, 40, 95, 95, 40,
        TYPE_WATER,
        TYPE_DARK,
        60, // catch rate
        175, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_ROUGH_SKIN,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Trapinch
        45, 100, 45, 10, 45, 45,
        TYPE_GROUND,
        TYPE_GROUND,
        255, // catch rate
        73, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SOFT_SAND,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_HYPER_CUTTER,
        ABILITY_ARENA_TRAP,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Vibrava
        50, 70, 50, 70, 50, 50,
        TYPE_GROUND,
        TYPE_DRAGON,
        120, // catch rate
        126, // base exp. yield
        0, 1, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_LEVITATE,
        ABILITY_LEVITATE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Flygon
        80, 100, 80, 100, 80, 80,
        TYPE_GROUND,
        TYPE_DRAGON,
        45, // catch rate
        197, // base exp. yield
        0, 1, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_LEVITATE,
        ABILITY_LEVITATE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Makuhita
        72, 60, 30, 25, 20, 30,
        TYPE_FIGHTING,
        TYPE_FIGHTING,
        180, // catch rate
        87, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_THICK_FAT,
        ABILITY_GUTS,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Hariyama
        144, 120, 60, 50, 40, 60,
        TYPE_FIGHTING,
        TYPE_FIGHTING,
        200, // catch rate
        184, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        63, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_THICK_FAT,
        ABILITY_GUTS,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Electrike
        40, 45, 40, 65, 65, 40,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        120, // catch rate
        104, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_STATIC,
        ABILITY_LIGHTNING_ROD,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Manectric
        70, 75, 60, 105, 105, 60,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        45, // catch rate
        168, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_STATIC,
        ABILITY_LIGHTNING_ROD,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Numel
        60, 60, 40, 35, 65, 45,
        TYPE_FIRE,
        TYPE_GROUND,
        255, // catch rate
        88, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Camerupt
        70, 100, 70, 40, 105, 75,
        TYPE_FIRE,
        TYPE_GROUND,
        150, // catch rate
        175, // base exp. yield
        0, 1, 0, 0, 1, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_MAGMA_ARMOR,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Spheal
        70, 40, 50, 25, 55, 50,
        TYPE_ICE,
        TYPE_WATER,
        255, // catch rate
        75, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Sealeo
        90, 60, 70, 45, 75, 70,
        TYPE_ICE,
        TYPE_WATER,
        120, // catch rate
        128, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Walrein
        110, 80, 90, 65, 95, 90,
        TYPE_ICE,
        TYPE_WATER,
        45, // catch rate
        192, // base exp. yield
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Cacnea
        50, 85, 40, 35, 85, 40,
        TYPE_GRASS,
        TYPE_GRASS,
        190, // catch rate
        97, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_POISON_BARB,
        127, // gender
        20, // egg cycles
        35, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SAND_VEIL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Cacturne
        70, 115, 60, 55, 115, 60,
        TYPE_GRASS,
        TYPE_DARK,
        60, // catch rate
        177, // base exp. yield
        0, 1, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_POISON_BARB,
        127, // gender
        20, // egg cycles
        35, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SAND_VEIL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Snorunt
        50, 50, 50, 50, 50, 50,
        TYPE_ICE,
        TYPE_ICE,
        190, // catch rate
        74, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_MINERAL,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Glalie
        80, 80, 80, 80, 80, 80,
        TYPE_ICE,
        TYPE_ICE,
        75, // catch rate
        187, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NEVER_MELT_ICE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_MINERAL,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Lunatone
        70, 55, 65, 70, 95, 85,
        TYPE_ROCK,
        TYPE_PSYCHIC,
        45, // catch rate
        150, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_MOON_STONE,
        255, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Solrock
        70, 95, 85, 70, 55, 65,
        TYPE_ROCK,
        TYPE_PSYCHIC,
        45, // catch rate
        150, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SUN_STONE,
        255, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Azurill
        50, 20, 40, 20, 20, 40,
        TYPE_NORMAL,
        TYPE_NORMAL,
        150, // catch rate
        33, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191, // gender
        10, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_THICK_FAT,
        ABILITY_HUGE_POWER,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Spoink
        60, 25, 35, 60, 70, 80,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        255, // catch rate
        89, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_OWN_TEMPO,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Grumpig
        80, 45, 65, 80, 90, 110,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        60, // catch rate
        164, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_OWN_TEMPO,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Plusle
        60, 50, 40, 95, 85, 75,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        200, // catch rate
        120, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_PLUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Minun
        60, 40, 50, 95, 75, 85,
        TYPE_ELECTRIC,
        TYPE_ELECTRIC,
        200, // catch rate
        120, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_MINUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Mawile
        50, 85, 85, 50, 55, 55,
        TYPE_STEEL,
        TYPE_STEEL,
        45, // catch rate
        98, // base exp. yield
        0, 1, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_HYPER_CUTTER,
        ABILITY_INTIMIDATE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Meditite
        30, 40, 55, 60, 40, 55,
        TYPE_FIGHTING,
        TYPE_PSYCHIC,
        180, // catch rate
        91, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_PURE_POWER,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Medicham
        60, 60, 75, 80, 60, 75,
        TYPE_FIGHTING,
        TYPE_PSYCHIC,
        90, // catch rate
        153, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_PURE_POWER,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Swablu
        45, 40, 60, 50, 40, 75,
        TYPE_NORMAL,
        TYPE_FLYING,
        255, // catch rate
        74, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_FLYING,
        EGG_GROUP_DRAGON,
        ABILITY_NATURAL_CURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Altaria
        75, 70, 90, 80, 70, 105,
        TYPE_DRAGON,
        TYPE_FLYING,
        45, // catch rate
        188, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_FLYING,
        EGG_GROUP_DRAGON,
        ABILITY_NATURAL_CURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Wynaut
        95, 23, 48, 23, 23, 48,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        125, // catch rate
        44, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_SHADOW_TAG,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Duskull
        20, 40, 90, 25, 30, 90,
        TYPE_GHOST,
        TYPE_GHOST,
        190, // catch rate
        97, // base exp. yield
        0, 0, 1, 0, 0, 1,
        ITEM_NONE,
        ITEM_SPELL_TAG,
        127, // gender
        25, // egg cycles
        35, // base friendship
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Dusclops
        40, 70, 130, 25, 60, 130,
        TYPE_GHOST,
        TYPE_GHOST,
        90, // catch rate
        179, // base exp. yield
        0, 0, 1, 0, 0, 2,
        ITEM_NONE,
        ITEM_SPELL_TAG,
        127, // gender
        25, // egg cycles
        35, // base friendship
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Roselia
        50, 60, 45, 65, 100, 80,
        TYPE_GRASS,
        TYPE_POISON,
        150, // catch rate
        152, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_POISON_BARB,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_NATURAL_CURE,
        ABILITY_POISON_POINT,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN, TRUE
    }, { // Slakoth
        60, 60, 60, 30, 35, 35,
        TYPE_NORMAL,
        TYPE_NORMAL,
        255, // catch rate
        83, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_TRUANT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Vigoroth
        80, 80, 80, 90, 55, 55,
        TYPE_NORMAL,
        TYPE_NORMAL,
        120, // catch rate
        126, // base exp. yield
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_VITAL_SPIRIT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Slaking
        150, 160, 100, 100, 95, 65,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        210, // base exp. yield
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_TRUANT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Gulpin
        70, 43, 53, 40, 43, 53,
        TYPE_POISON,
        TYPE_POISON,
        225, // catch rate
        75, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_BIG_PEARL,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LIQUID_OOZE,
        ABILITY_STICKY_HOLD,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Swalot
        100, 73, 83, 55, 73, 83,
        TYPE_POISON,
        TYPE_POISON,
        75, // catch rate
        168, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_BIG_PEARL,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LIQUID_OOZE,
        ABILITY_STICKY_HOLD,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Tropius
        99, 68, 83, 51, 72, 87,
        TYPE_GRASS,
        TYPE_FLYING,
        200, // catch rate
        169, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Whismur
        64, 51, 23, 28, 51, 23,
        TYPE_NORMAL,
        TYPE_NORMAL,
        190, // catch rate
        68, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_CHESTO_BERRY,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_SOUNDPROOF,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Loudred
        84, 71, 43, 48, 71, 43,
        TYPE_NORMAL,
        TYPE_NORMAL,
        120, // catch rate
        126, // base exp. yield
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_CHESTO_BERRY,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_SOUNDPROOF,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Exploud
        104, 91, 63, 68, 91, 63,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        184, // base exp. yield
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_CHESTO_BERRY,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_SOUNDPROOF,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Clamperl
        35, 64, 85, 32, 74, 55,
        TYPE_WATER,
        TYPE_WATER,
        255, // catch rate
        142, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_BLUE_SHARD,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_SHELL_ARMOR,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Huntail
        55, 104, 105, 52, 94, 75,
        TYPE_WATER,
        TYPE_WATER,
        60, // catch rate
        178, // base exp. yield
        0, 1, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Gorebyss
        55, 84, 105, 52, 114, 75,
        TYPE_WATER,
        TYPE_WATER,
        60, // catch rate
        178, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PINK
    }, { // Absol
        65, 130, 60, 75, 75, 60,
        TYPE_DARK,
        TYPE_DARK,
        30, // catch rate
        174, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        25, // egg cycles
        35, // base friendship
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE, TRUE
    }, { // Shuppet
        44, 75, 35, 45, 63, 33,
        TYPE_GHOST,
        TYPE_GHOST,
        225, // catch rate
        97, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SPELL_TAG,
        127, // gender
        25, // egg cycles
        35, // base friendship
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_INSOMNIA,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Banette
        64, 115, 65, 65, 83, 63,
        TYPE_GHOST,
        TYPE_GHOST,
        45, // catch rate
        179, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SPELL_TAG,
        127, // gender
        25, // egg cycles
        35, // base friendship
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_INSOMNIA,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK
    }, { // Seviper
        73, 100, 60, 65, 100, 60,
        TYPE_POISON,
        TYPE_POISON,
        90, // catch rate
        165, // base exp. yield
        0, 1, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_FIELD,
        EGG_GROUP_DRAGON,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLACK, TRUE
    }, { // Zangoose
        73, 115, 60, 90, 60, 60,
        TYPE_NORMAL,
        TYPE_NORMAL,
        90, // catch rate
        165, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_IMMUNITY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE, TRUE
    }, { // Relicanth
        100, 90, 130, 55, 45, 65,
        TYPE_WATER,
        TYPE_ROCK,
        25, // catch rate
        198, // base exp. yield
        1, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_GREEN_SHARD,
        31, // gender
        40, // egg cycles
        70, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_2,
        ABILITY_SWIFT_SWIM,
        ABILITY_ROCK_HEAD,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Aron
        50, 70, 100, 30, 40, 40,
        TYPE_STEEL,
        TYPE_ROCK,
        180, // catch rate
        96, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_HARD_STONE,
        127, // gender
        35, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_STURDY,
        ABILITY_ROCK_HEAD,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Lairon
        60, 90, 140, 40, 50, 50,
        TYPE_STEEL,
        TYPE_ROCK,
        90, // catch rate
        152, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_HARD_STONE,
        127, // gender
        35, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_STURDY,
        ABILITY_ROCK_HEAD,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Aggron
        70, 110, 180, 50, 60, 60,
        TYPE_STEEL,
        TYPE_ROCK,
        45, // catch rate
        205, // base exp. yield
        0, 0, 3, 0, 0, 0,
        ITEM_NONE,
        ITEM_HARD_STONE,
        127, // gender
        35, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_STURDY,
        ABILITY_ROCK_HEAD,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Castform
        70, 70, 70, 70, 70, 70,
        TYPE_NORMAL,
        TYPE_NORMAL,
        45, // catch rate
        145, // base exp. yield
        1, 0, 0, 0, 0, 0,
        ITEM_MYSTIC_WATER,
        ITEM_MYSTIC_WATER,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_AMORPHOUS,
        ABILITY_FORECAST,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Volbeat
        65, 73, 55, 85, 47, 75,
        TYPE_BUG,
        TYPE_BUG,
        150, // catch rate
        146, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_BUG,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_ILLUMINATE,
        ABILITY_SWARM,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Illumise
        65, 47, 55, 85, 73, 75,
        TYPE_BUG,
        TYPE_BUG,
        150, // catch rate
        146, // base exp. yield
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        254, // gender
        15, // egg cycles
        70, // base friendship
        GROWTH_FLUCTUATING,
        EGG_GROUP_BUG,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Lileep
        66, 41, 77, 23, 61, 87,
        TYPE_ROCK,
        TYPE_GRASS,
        45, // catch rate
        121, // base exp. yield
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        30, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_SUCTION_CUPS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_PURPLE
    }, { // Cradily
        86, 81, 97, 43, 81, 107,
        TYPE_ROCK,
        TYPE_GRASS,
        45, // catch rate
        201, // base exp. yield
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        30, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_SUCTION_CUPS,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Anorith
        45, 95, 50, 75, 40, 50,
        TYPE_ROCK,
        TYPE_BUG,
        45, // catch rate
        119, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        30, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_BATTLE_ARMOR,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Armaldo
        75, 125, 100, 45, 70, 80,
        TYPE_ROCK,
        TYPE_BUG,
        45, // catch rate
        200, // base exp. yield
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31, // gender
        30, // egg cycles
        70, // base friendship
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_BATTLE_ARMOR,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Ralts
        28, 25, 25, 40, 45, 35,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        235, // catch rate
        70, // base exp. yield
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_SYNCHRONIZE,
        ABILITY_TRACE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Kirlia
        38, 35, 35, 50, 65, 55,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        120, // catch rate
        140, // base exp. yield
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_SYNCHRONIZE,
        ABILITY_TRACE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Gardevoir
        68, 65, 65, 80, 125, 115,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        45, // catch rate
        208, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        20, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_SYNCHRONIZE,
        ABILITY_TRACE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Bagon
        45, 75, 60, 50, 40, 30,
        TYPE_DRAGON,
        TYPE_DRAGON,
        45, // catch rate
        89, // base exp. yield
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_DRAGON,
        EGG_GROUP_DRAGON,
        ABILITY_ROCK_HEAD,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Shelgon
        65, 95, 100, 50, 60, 50,
        TYPE_DRAGON,
        TYPE_DRAGON,
        45, // catch rate
        144, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_DRAGON,
        EGG_GROUP_DRAGON,
        ABILITY_ROCK_HEAD,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_WHITE
    }, { // Salamence
        95, 135, 80, 100, 110, 80,
        TYPE_DRAGON,
        TYPE_FLYING,
        45, // catch rate
        218, // base exp. yield
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_DRAGON,
        EGG_GROUP_DRAGON,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Beldum
        40, 55, 80, 30, 35, 60,
        TYPE_STEEL,
        TYPE_PSYCHIC,
        3, // catch rate
        103, // base exp. yield
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        255, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Metang
        60, 75, 100, 50, 55, 80,
        TYPE_STEEL,
        TYPE_PSYCHIC,
        3, // catch rate
        153, // base exp. yield
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        255, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Metagross
        80, 135, 130, 70, 95, 90,
        TYPE_STEEL,
        TYPE_PSYCHIC,
        3, // catch rate
        210, // base exp. yield
        0, 0, 3, 0, 0, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        255, // gender
        40, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Regirock
        80, 100, 200, 50, 50, 100,
        TYPE_ROCK,
        TYPE_ROCK,
        3, // catch rate
        217, // base exp. yield
        0, 0, 3, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        80, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BROWN
    }, { // Regice
        80, 50, 100, 50, 100, 200,
        TYPE_ICE,
        TYPE_ICE,
        3, // catch rate
        216, // base exp. yield
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        80, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Registeel
        80, 75, 150, 50, 75, 150,
        TYPE_STEEL,
        TYPE_STEEL,
        3, // catch rate
        215, // base exp. yield
        0, 0, 2, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        80, // egg cycles
        35, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GRAY
    }, { // Kyogre
        100, 100, 90, 90, 150, 140,
        TYPE_WATER,
        TYPE_WATER,
        5, // catch rate
        218, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_DRIZZLE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Groudon
        100, 150, 140, 90, 100, 90,
        TYPE_GROUND,
        TYPE_GROUND,
        5, // catch rate
        218, // base exp. yield
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_DROUGHT,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Rayquaza
        105, 150, 90, 95, 150, 90,
        TYPE_DRAGON,
        TYPE_FLYING,
        3, // catch rate
        220, // base exp. yield
        0, 2, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_AIR_LOCK,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_GREEN
    }, { // Latias
        80, 80, 90, 110, 110, 130,
        TYPE_DRAGON,
        TYPE_PSYCHIC,
        3, // catch rate
        211, // base exp. yield
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        254, // gender
        120, // egg cycles
        90, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED
    }, { // Latios
        80, 90, 80, 110, 130, 110,
        TYPE_DRAGON,
        TYPE_PSYCHIC,
        3, // catch rate
        211, // base exp. yield
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        0, // gender
        120, // egg cycles
        90, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }, { // Jirachi
        100, 100, 100, 100, 100, 100,
        TYPE_STEEL,
        TYPE_PSYCHIC,
        3, // catch rate
        215, // base exp. yield
        3, 0, 0, 0, 0, 0,
        ITEM_STAR_PIECE,
        ITEM_STAR_PIECE,
        255, // gender
        120, // egg cycles
        100, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_SERENE_GRACE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_YELLOW
    }, { // Deoxys
        50, 150, 50, 150, 150, 50,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        3, // catch rate
        215, // base exp. yield
        0, 1, 0, 1, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        255, // gender
        120, // egg cycles
        0, // base friendship
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_RED, TRUE
    }, { // Chimecho
        65, 50, 70, 65, 95, 80,
        TYPE_PSYCHIC,
        TYPE_PSYCHIC,
        45, // catch rate
        147, // base exp. yield
        0, 0, 0, 0, 1, 1,
        ITEM_NONE,
        ITEM_NONE,
        127, // gender
        25, // egg cycles
        70, // base friendship
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0, // Safari Zone flee rate
        BODY_COLOR_BLUE
    }
};

#endif //POKERUBY_BASE_STATS_H
