#include "global.h"
#include "wild_encounter.h"
#include "abilities.h"
#include "battle_setup.h"
#include "event_data.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "pokeblock.h"
#include "rng.h"
#include "roamer.h"
#include "rom4.h"
#include "safari_zone.h"
#include "script.h"
#include "species.h"
#include "tv.h"

const struct WildPokemon PetalburgCity_WaterMons [] =
{
    {20, 30, SPECIES_MARILL},
    {10, 20, SPECIES_MARILL},
    {30, 35, SPECIES_MARILL},
    {5, 10, SPECIES_MARILL},
    {5, 10, SPECIES_MARILL},
};
const struct WildPokemonInfo PetalburgCity_WaterMonsInfo = {1, PetalburgCity_WaterMons};

const struct WildPokemon PetalburgCity_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_GOLDEEN},
    {10, 30, SPECIES_CORPHISH},
    {25, 30, SPECIES_CORPHISH},
    {30, 35, SPECIES_CORPHISH},
    {20, 25, SPECIES_CORPHISH},
    {35, 40, SPECIES_CORPHISH},
    {40, 45, SPECIES_CORPHISH},
};
const struct WildPokemonInfo PetalburgCity_FishingMonsInfo = {10, PetalburgCity_FishingMons};

const struct WildPokemon SlateportCity_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo SlateportCity_WaterMonsInfo = {4, SlateportCity_WaterMons};

const struct WildPokemon SlateportCity_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo SlateportCity_FishingMonsInfo = {10, SlateportCity_FishingMons};

const struct WildPokemon LilycoveCity_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo LilycoveCity_WaterMonsInfo = {4, LilycoveCity_WaterMons};

const struct WildPokemon LilycoveCity_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_STARYU},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo LilycoveCity_FishingMonsInfo = {10, LilycoveCity_FishingMons};

const struct WildPokemon MossdeepCity_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo MossdeepCity_WaterMonsInfo = {4, MossdeepCity_WaterMons};

const struct WildPokemon MossdeepCity_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo MossdeepCity_FishingMonsInfo = {10, MossdeepCity_FishingMons};

const struct WildPokemon SootopolisCity_WaterMons [] =
{
    {5, 35, SPECIES_MAGIKARP},
    {10, 30, SPECIES_MAGIKARP},
    {15, 25, SPECIES_MAGIKARP},
    {25, 30, SPECIES_MAGIKARP},
    {25, 30, SPECIES_MAGIKARP},
};
const struct WildPokemonInfo SootopolisCity_WaterMonsInfo = {1, SootopolisCity_WaterMons};

const struct WildPokemon SootopolisCity_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
#ifdef SAPPHIRE
    {5, 10, SPECIES_TENTACOOL},
#else
    {10, 15, SPECIES_MAGIKARP},
#endif
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_MAGIKARP},
    {30, 35, SPECIES_MAGIKARP},
    {30, 35, SPECIES_MAGIKARP},
    {35, 40, SPECIES_GYARADOS},
    {35, 45, SPECIES_GYARADOS},
    {5, 45, SPECIES_GYARADOS},
};
const struct WildPokemonInfo SootopolisCity_FishingMonsInfo = {10, SootopolisCity_FishingMons};

const struct WildPokemon EverGrandeCity_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo EverGrandeCity_WaterMonsInfo = {4, EverGrandeCity_WaterMons};

const struct WildPokemon EverGrandeCity_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_LUVDISC},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_LUVDISC},
    {30, 35, SPECIES_WAILMER},
    {30, 35, SPECIES_CORSOLA},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo EverGrandeCity_FishingMonsInfo = {10, EverGrandeCity_FishingMons};

const struct WildPokemon MeteorFalls_1F_1R_LandMons [] =
{
    {16, 16, SPECIES_ZUBAT},
    {17, 17, SPECIES_ZUBAT},
    {18, 18, SPECIES_ZUBAT},
    {15, 15, SPECIES_ZUBAT},
    {14, 14, SPECIES_ZUBAT},
#ifdef SAPPHIRE
    {16, 16, SPECIES_LUNATONE},
    {18, 18, SPECIES_LUNATONE},
    {14, 14, SPECIES_LUNATONE},
#else
    {16, 16, SPECIES_SOLROCK},
    {18, 18, SPECIES_SOLROCK},
    {14, 14, SPECIES_SOLROCK},
#endif
    {19, 19, SPECIES_ZUBAT},
    {20, 20, SPECIES_ZUBAT},
    {19, 19, SPECIES_ZUBAT},
    {20, 20, SPECIES_ZUBAT},
};
const struct WildPokemonInfo MeteorFalls_1F_1R_LandMonsInfo = {10, MeteorFalls_1F_1R_LandMons};

const struct WildPokemon MeteorFalls_1F_1R_WaterMons [] =
{
    {5, 35, SPECIES_ZUBAT},
    {30, 35, SPECIES_ZUBAT},
#ifdef SAPPHIRE
    {25, 35, SPECIES_LUNATONE},
    {15, 25, SPECIES_LUNATONE},
    {5, 15, SPECIES_LUNATONE},
#else
    {25, 35, SPECIES_SOLROCK},
    {15, 25, SPECIES_SOLROCK},
    {5, 15, SPECIES_SOLROCK},
#endif
};
const struct WildPokemonInfo MeteorFalls_1F_1R_WaterMonsInfo = {4, MeteorFalls_1F_1R_WaterMons};

const struct WildPokemon MeteorFalls_1F_1R_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_GOLDEEN},
    {10, 30, SPECIES_BARBOACH},
    {25, 30, SPECIES_BARBOACH},
    {30, 35, SPECIES_BARBOACH},
    {20, 25, SPECIES_BARBOACH},
    {35, 40, SPECIES_BARBOACH},
    {40, 45, SPECIES_BARBOACH},
};
const struct WildPokemonInfo MeteorFalls_1F_1R_FishingMonsInfo = {30, MeteorFalls_1F_1R_FishingMons};

const struct WildPokemon MeteorFalls_1F_2R_LandMons [] =
{
    {33, 33, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {35, 35, SPECIES_LUNATONE},
    {33, 33, SPECIES_LUNATONE},
    {37, 37, SPECIES_LUNATONE},
#else
    {35, 35, SPECIES_SOLROCK},
    {33, 33, SPECIES_SOLROCK},
    {37, 37, SPECIES_SOLROCK},
#endif
    {35, 35, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {39, 39, SPECIES_LUNATONE},
#else
    {39, 39, SPECIES_SOLROCK},
#endif
    {38, 38, SPECIES_GOLBAT},
    {40, 40, SPECIES_GOLBAT},
    {38, 38, SPECIES_GOLBAT},
    {40, 40, SPECIES_GOLBAT},
};
const struct WildPokemonInfo MeteorFalls_1F_2R_LandMonsInfo = {10, MeteorFalls_1F_2R_LandMons};

const struct WildPokemon MeteorFalls_1F_2R_WaterMons [] =
{
    {30, 35, SPECIES_GOLBAT},
    {30, 35, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {25, 35, SPECIES_LUNATONE},
    {15, 25, SPECIES_LUNATONE},
    {5, 15, SPECIES_LUNATONE},
#else
    {25, 35, SPECIES_SOLROCK},
    {15, 25, SPECIES_SOLROCK},
    {5, 15, SPECIES_SOLROCK},
#endif
};
const struct WildPokemonInfo MeteorFalls_1F_2R_WaterMonsInfo = {4, MeteorFalls_1F_2R_WaterMons};

const struct WildPokemon MeteorFalls_1F_2R_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_GOLDEEN},
    {10, 30, SPECIES_BARBOACH},
    {25, 30, SPECIES_BARBOACH},
    {30, 35, SPECIES_BARBOACH},
    {30, 35, SPECIES_WHISCASH},
    {35, 40, SPECIES_WHISCASH},
    {40, 45, SPECIES_WHISCASH},
};
const struct WildPokemonInfo MeteorFalls_1F_2R_FishingMonsInfo = {30, MeteorFalls_1F_2R_FishingMons};

const struct WildPokemon MeteorFalls_B1F_1R_LandMons [] =
{
    {33, 33, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {35, 35, SPECIES_LUNATONE},
    {33, 33, SPECIES_LUNATONE},
    {37, 37, SPECIES_LUNATONE},
#else
    {35, 35, SPECIES_SOLROCK},
    {33, 33, SPECIES_SOLROCK},
    {37, 37, SPECIES_SOLROCK},
#endif
    {35, 35, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {39, 39, SPECIES_LUNATONE},
#else
    {39, 39, SPECIES_SOLROCK},
#endif
    {38, 38, SPECIES_GOLBAT},
    {40, 40, SPECIES_GOLBAT},
    {38, 38, SPECIES_GOLBAT},
    {40, 40, SPECIES_GOLBAT},
};
const struct WildPokemonInfo MeteorFalls_B1F_1R_LandMonsInfo = {10, MeteorFalls_B1F_1R_LandMons};

const struct WildPokemon MeteorFalls_B1F_1R_WaterMons [] =
{
    {30, 35, SPECIES_GOLBAT},
    {30, 35, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {25, 35, SPECIES_LUNATONE},
    {15, 25, SPECIES_LUNATONE},
    {5, 15, SPECIES_LUNATONE},
#else
    {25, 35, SPECIES_SOLROCK},
    {15, 25, SPECIES_SOLROCK},
    {5, 15, SPECIES_SOLROCK},
#endif
};
const struct WildPokemonInfo MeteorFalls_B1F_1R_WaterMonsInfo = {4, MeteorFalls_B1F_1R_WaterMons};

const struct WildPokemon MeteorFalls_B1F_1R_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_GOLDEEN},
    {10, 30, SPECIES_BARBOACH},
    {25, 30, SPECIES_BARBOACH},
    {30, 35, SPECIES_BARBOACH},
    {30, 35, SPECIES_WHISCASH},
    {35, 40, SPECIES_WHISCASH},
    {40, 45, SPECIES_WHISCASH},
};
const struct WildPokemonInfo MeteorFalls_B1F_1R_FishingMonsInfo = {30, MeteorFalls_B1F_1R_FishingMons};

const struct WildPokemon MeteorFalls_B1F_2R_LandMons [] =
{
    {33, 33, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {30, 30, SPECIES_BAGON},
#ifdef SAPPHIRE
    {35, 35, SPECIES_LUNATONE},
#else
    {35, 35, SPECIES_SOLROCK},
#endif
    {35, 35, SPECIES_BAGON},
#ifdef SAPPHIRE
    {37, 37, SPECIES_LUNATONE},
#else
    {37, 37, SPECIES_SOLROCK},
#endif
    {25, 25, SPECIES_BAGON},
#ifdef SAPPHIRE
    {39, 39, SPECIES_LUNATONE},
#else
    {39, 39, SPECIES_SOLROCK},
#endif
    {38, 38, SPECIES_GOLBAT},
    {40, 40, SPECIES_GOLBAT},
    {38, 38, SPECIES_GOLBAT},
    {40, 40, SPECIES_GOLBAT},
};
const struct WildPokemonInfo MeteorFalls_B1F_2R_LandMonsInfo = {10, MeteorFalls_B1F_2R_LandMons};

const struct WildPokemon MeteorFalls_B1F_2R_WaterMons [] =
{
    {30, 35, SPECIES_GOLBAT},
    {30, 35, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {25, 35, SPECIES_LUNATONE},
    {15, 25, SPECIES_LUNATONE},
    {5, 15, SPECIES_LUNATONE},
#else
    {25, 35, SPECIES_SOLROCK},
    {15, 25, SPECIES_SOLROCK},
    {5, 15, SPECIES_SOLROCK},
#endif
};
const struct WildPokemonInfo MeteorFalls_B1F_2R_WaterMonsInfo = {4, MeteorFalls_B1F_2R_WaterMons};

const struct WildPokemon MeteorFalls_B1F_2R_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_GOLDEEN},
    {10, 30, SPECIES_BARBOACH},
    {25, 30, SPECIES_BARBOACH},
    {30, 35, SPECIES_BARBOACH},
    {30, 35, SPECIES_WHISCASH},
    {35, 40, SPECIES_WHISCASH},
    {40, 45, SPECIES_WHISCASH},
};
const struct WildPokemonInfo MeteorFalls_B1F_2R_FishingMonsInfo = {30, MeteorFalls_B1F_2R_FishingMons};

const struct WildPokemon RusturfTunnel_LandMons [] =
{
    {6, 6, SPECIES_WHISMUR},
    {7, 7, SPECIES_WHISMUR},
    {6, 6, SPECIES_WHISMUR},
    {6, 6, SPECIES_WHISMUR},
    {7, 7, SPECIES_WHISMUR},
    {7, 7, SPECIES_WHISMUR},
    {5, 5, SPECIES_WHISMUR},
    {8, 8, SPECIES_WHISMUR},
    {5, 5, SPECIES_WHISMUR},
    {8, 8, SPECIES_WHISMUR},
    {5, 5, SPECIES_WHISMUR},
    {8, 8, SPECIES_WHISMUR},
};
const struct WildPokemonInfo RusturfTunnel_LandMonsInfo = {10, RusturfTunnel_LandMons};

const struct WildPokemon GraniteCave_1F_LandMons [] =
{
    {7, 7, SPECIES_ZUBAT},
    {8, 8, SPECIES_MAKUHITA},
    {7, 7, SPECIES_MAKUHITA},
    {8, 8, SPECIES_ZUBAT},
    {9, 9, SPECIES_MAKUHITA},
    {8, 8, SPECIES_ABRA},
    {10, 10, SPECIES_MAKUHITA},
    {6, 6, SPECIES_MAKUHITA},
    {7, 7, SPECIES_GEODUDE},
    {8, 8, SPECIES_GEODUDE},
    {6, 6, SPECIES_GEODUDE},
    {9, 9, SPECIES_GEODUDE},
};
const struct WildPokemonInfo GraniteCave_1F_LandMonsInfo = {10, GraniteCave_1F_LandMons};

const struct WildPokemon GraniteCave_B1F_LandMons [] =
{
    {9, 9, SPECIES_ZUBAT},
    {10, 10, SPECIES_ARON},
    {9, 9, SPECIES_ARON},
    {11, 11, SPECIES_ARON},
    {10, 10, SPECIES_ZUBAT},
    {9, 9, SPECIES_ABRA},
    {10, 10, SPECIES_MAKUHITA},
    {11, 11, SPECIES_MAKUHITA},
#ifdef SAPPHIRE
    {10, 10, SPECIES_SABLEYE},
    {10, 10, SPECIES_SABLEYE},
    {9, 9, SPECIES_SABLEYE},
    {11, 11, SPECIES_SABLEYE},
#else
    {10, 10, SPECIES_MAWILE},
    {10, 10, SPECIES_MAWILE},
    {9, 9, SPECIES_MAWILE},
    {11, 11, SPECIES_MAWILE},
#endif
};
const struct WildPokemonInfo GraniteCave_B1F_LandMonsInfo = {10, GraniteCave_B1F_LandMons};

const struct WildPokemon GraniteCave_B2F_LandMons [] =
{
    {10, 10, SPECIES_ZUBAT},
    {11, 11, SPECIES_ARON},
    {10, 10, SPECIES_ARON},
    {11, 11, SPECIES_ZUBAT},
    {12, 12, SPECIES_ARON},
    {10, 10, SPECIES_ABRA},
#ifdef SAPPHIRE
    {10, 10, SPECIES_SABLEYE},
    {11, 11, SPECIES_SABLEYE},
    {12, 12, SPECIES_SABLEYE},
    {10, 10, SPECIES_SABLEYE},
    {12, 12, SPECIES_SABLEYE},
    {10, 10, SPECIES_SABLEYE},
#else
    {10, 10, SPECIES_MAWILE},
    {11, 11, SPECIES_MAWILE},
    {12, 12, SPECIES_MAWILE},
    {10, 10, SPECIES_MAWILE},
    {12, 12, SPECIES_MAWILE},
    {10, 10, SPECIES_MAWILE},
#endif
};
const struct WildPokemonInfo GraniteCave_B2F_LandMonsInfo = {10, GraniteCave_B2F_LandMons};

const struct WildPokemon GraniteCave_B2F_RockSmashMons [] =
{
    {10, 15, SPECIES_GEODUDE},
    {10, 20, SPECIES_NOSEPASS},
    {5, 10, SPECIES_GEODUDE},
    {15, 20, SPECIES_GEODUDE},
    {15, 20, SPECIES_GEODUDE},
};
const struct WildPokemonInfo GraniteCave_B2F_RockSmashMonsInfo = {20, GraniteCave_B2F_RockSmashMons};

const struct WildPokemon GraniteCave_StevensRoom_LandMons [] =
{
    {7, 7, SPECIES_ZUBAT},
    {8, 8, SPECIES_MAKUHITA},
    {7, 7, SPECIES_MAKUHITA},
    {8, 8, SPECIES_ZUBAT},
    {9, 9, SPECIES_MAKUHITA},
    {8, 8, SPECIES_ABRA},
    {10, 10, SPECIES_MAKUHITA},
    {6, 6, SPECIES_MAKUHITA},
    {7, 7, SPECIES_ARON},
    {8, 8, SPECIES_ARON},
    {7, 7, SPECIES_ARON},
    {8, 8, SPECIES_ARON},
};
const struct WildPokemonInfo GraniteCave_StevensRoom_LandMonsInfo = {10, GraniteCave_StevensRoom_LandMons};

const struct WildPokemon PetalburgWoods_LandMons [] =
{
    {5, 5, SPECIES_ZIGZAGOON},
    {5, 5, SPECIES_WURMPLE},
    {5, 5, SPECIES_SHROOMISH},
    {6, 6, SPECIES_ZIGZAGOON},
    {5, 5, SPECIES_SILCOON},
    {5, 5, SPECIES_CASCOON},
    {6, 6, SPECIES_WURMPLE},
    {6, 6, SPECIES_SHROOMISH},
    {5, 5, SPECIES_TAILLOW},
    {5, 5, SPECIES_SLAKOTH},
    {6, 6, SPECIES_TAILLOW},
    {6, 6, SPECIES_SLAKOTH},
};
const struct WildPokemonInfo PetalburgWoods_LandMonsInfo = {20, PetalburgWoods_LandMons};

//Jagged Pass Pokemon are 2 levels higher on Sapphire
#ifdef SAPPHIRE
#define JAGGED_PASS_LEVEL_DIFF 2
#else
#define JAGGED_PASS_LEVEL_DIFF 0
#endif

const struct WildPokemon JaggedPass_LandMons [] =
{
    {19 + JAGGED_PASS_LEVEL_DIFF, 19 + JAGGED_PASS_LEVEL_DIFF, SPECIES_NUMEL},
    {19 + JAGGED_PASS_LEVEL_DIFF, 19 + JAGGED_PASS_LEVEL_DIFF, SPECIES_NUMEL},
    {19 + JAGGED_PASS_LEVEL_DIFF, 19 + JAGGED_PASS_LEVEL_DIFF, SPECIES_MACHOP},
    {18 + JAGGED_PASS_LEVEL_DIFF, 18 + JAGGED_PASS_LEVEL_DIFF, SPECIES_NUMEL},
    {18 + JAGGED_PASS_LEVEL_DIFF, 18 + JAGGED_PASS_LEVEL_DIFF, SPECIES_SPOINK},
    {18 + JAGGED_PASS_LEVEL_DIFF, 18 + JAGGED_PASS_LEVEL_DIFF, SPECIES_MACHOP},
    {19 + JAGGED_PASS_LEVEL_DIFF, 19 + JAGGED_PASS_LEVEL_DIFF, SPECIES_SPOINK},
    {20 + JAGGED_PASS_LEVEL_DIFF, 20 + JAGGED_PASS_LEVEL_DIFF, SPECIES_MACHOP},
    {20 + JAGGED_PASS_LEVEL_DIFF, 20 + JAGGED_PASS_LEVEL_DIFF, SPECIES_NUMEL},
    {20 + JAGGED_PASS_LEVEL_DIFF, 20 + JAGGED_PASS_LEVEL_DIFF, SPECIES_SPOINK},
    {20 + JAGGED_PASS_LEVEL_DIFF, 20 + JAGGED_PASS_LEVEL_DIFF, SPECIES_NUMEL},
    {20 + JAGGED_PASS_LEVEL_DIFF, 20 + JAGGED_PASS_LEVEL_DIFF, SPECIES_SPOINK},
};
const struct WildPokemonInfo JaggedPass_LandMonsInfo = {20, JaggedPass_LandMons};

const struct WildPokemon FieryPath_LandMons [] =
{
    {15, 15, SPECIES_NUMEL},
#ifdef SAPPHIRE
    {15, 15, SPECIES_GRIMER},
#else
    {15, 15, SPECIES_KOFFING},
#endif
    {16, 16, SPECIES_NUMEL},
    {15, 15, SPECIES_MACHOP},
    {15, 15, SPECIES_TORKOAL},
    {15, 15, SPECIES_SLUGMA},
#ifdef SAPPHIRE
    {16, 16, SPECIES_GRIMER},
#else
    {16, 16, SPECIES_KOFFING},
#endif
    {16, 16, SPECIES_MACHOP},
    {14, 14, SPECIES_TORKOAL},
    {16, 16, SPECIES_TORKOAL},
#ifdef SAPPHIRE
    {14, 14, SPECIES_KOFFING},
    {14, 14, SPECIES_KOFFING},
#else
    {14, 14, SPECIES_GRIMER},
    {14, 14, SPECIES_GRIMER},
#endif
};
const struct WildPokemonInfo FieryPath_LandMonsInfo = {10, FieryPath_LandMons};

const struct WildPokemon MtPyre_1F_LandMons [] =
{
#ifdef SAPPHIRE
    {27, 27, SPECIES_SHUPPET},
    {28, 28, SPECIES_SHUPPET},
    {26, 26, SPECIES_SHUPPET},
    {25, 25, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
    {23, 23, SPECIES_SHUPPET},
    {22, 22, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
#else
    {27, 27, SPECIES_DUSKULL},
    {28, 28, SPECIES_DUSKULL},
    {26, 26, SPECIES_DUSKULL},
    {25, 25, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
    {23, 23, SPECIES_DUSKULL},
    {22, 22, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
#endif
};
const struct WildPokemonInfo MtPyre_1F_LandMonsInfo = {10, MtPyre_1F_LandMons};

const struct WildPokemon MtPyre_2F_LandMons [] =
{
#ifdef SAPPHIRE
    {27, 27, SPECIES_SHUPPET},
    {28, 28, SPECIES_SHUPPET},
    {26, 26, SPECIES_SHUPPET},
    {25, 25, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
    {23, 23, SPECIES_SHUPPET},
    {22, 22, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
#else
    {27, 27, SPECIES_DUSKULL},
    {28, 28, SPECIES_DUSKULL},
    {26, 26, SPECIES_DUSKULL},
    {25, 25, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
    {23, 23, SPECIES_DUSKULL},
    {22, 22, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
#endif
};
const struct WildPokemonInfo MtPyre_2F_LandMonsInfo = {10, MtPyre_2F_LandMons};

const struct WildPokemon MtPyre_3F_LandMons [] =
{
#ifdef SAPPHIRE
    {27, 27, SPECIES_SHUPPET},
    {28, 28, SPECIES_SHUPPET},
    {26, 26, SPECIES_SHUPPET},
    {25, 25, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
    {23, 23, SPECIES_SHUPPET},
    {22, 22, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
#else
    {27, 27, SPECIES_DUSKULL},
    {28, 28, SPECIES_DUSKULL},
    {26, 26, SPECIES_DUSKULL},
    {25, 25, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
    {23, 23, SPECIES_DUSKULL},
    {22, 22, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
#endif
};
const struct WildPokemonInfo MtPyre_3F_LandMonsInfo = {10, MtPyre_3F_LandMons};

const struct WildPokemon MtPyre_4F_LandMons [] =
{
#ifdef SAPPHIRE
    {27, 27, SPECIES_SHUPPET},
    {28, 28, SPECIES_SHUPPET},
    {26, 26, SPECIES_SHUPPET},
    {25, 25, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
    {23, 23, SPECIES_SHUPPET},
    {22, 22, SPECIES_SHUPPET},
    {27, 27, SPECIES_DUSKULL},
    {27, 27, SPECIES_DUSKULL},
    {25, 25, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
#else
    {27, 27, SPECIES_DUSKULL},
    {28, 28, SPECIES_DUSKULL},
    {26, 26, SPECIES_DUSKULL},
    {25, 25, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
    {23, 23, SPECIES_DUSKULL},
    {22, 22, SPECIES_DUSKULL},
    {27, 27, SPECIES_SHUPPET},
    {27, 27, SPECIES_SHUPPET},
    {25, 25, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
#endif
};
const struct WildPokemonInfo MtPyre_4F_LandMonsInfo = {10, MtPyre_4F_LandMons};

const struct WildPokemon MtPyre_5F_LandMons [] =
{
#ifdef SAPPHIRE
    {27, 27, SPECIES_SHUPPET},
    {28, 28, SPECIES_SHUPPET},
    {26, 26, SPECIES_SHUPPET},
    {25, 25, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
    {23, 23, SPECIES_SHUPPET},
    {22, 22, SPECIES_SHUPPET},
    {27, 27, SPECIES_DUSKULL},
    {27, 27, SPECIES_DUSKULL},
    {25, 25, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
#else
    {27, 27, SPECIES_DUSKULL},
    {28, 28, SPECIES_DUSKULL},
    {26, 26, SPECIES_DUSKULL},
    {25, 25, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
    {23, 23, SPECIES_DUSKULL},
    {22, 22, SPECIES_DUSKULL},
    {27, 27, SPECIES_SHUPPET},
    {27, 27, SPECIES_SHUPPET},
    {25, 25, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
#endif
};
const struct WildPokemonInfo MtPyre_5F_LandMonsInfo = {10, MtPyre_5F_LandMons};

const struct WildPokemon MtPyre_6F_LandMons [] =
{
#ifdef SAPPHIRE
    {27, 27, SPECIES_SHUPPET},
    {28, 28, SPECIES_SHUPPET},
    {26, 26, SPECIES_SHUPPET},
    {25, 25, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
    {23, 23, SPECIES_SHUPPET},
    {22, 22, SPECIES_SHUPPET},
    {27, 27, SPECIES_DUSKULL},
    {27, 27, SPECIES_DUSKULL},
    {25, 25, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
#else
    {27, 27, SPECIES_DUSKULL},
    {28, 28, SPECIES_DUSKULL},
    {26, 26, SPECIES_DUSKULL},
    {25, 25, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
    {23, 23, SPECIES_DUSKULL},
    {22, 22, SPECIES_DUSKULL},
    {27, 27, SPECIES_SHUPPET},
    {27, 27, SPECIES_SHUPPET},
    {25, 25, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
#endif
};
const struct WildPokemonInfo MtPyre_6F_LandMonsInfo = {10, MtPyre_6F_LandMons};

const struct WildPokemon MtPyre_Exterior_LandMons [] =
{
#ifdef SAPPHIRE
    {27, 27, SPECIES_SHUPPET},
#else
    {27, 27, SPECIES_DUSKULL},
#endif
    {27, 27, SPECIES_MEDITITE},
#ifdef SAPPHIRE
    {28, 28, SPECIES_SHUPPET},
#else
    {28, 28, SPECIES_DUSKULL},
#endif
    {29, 29, SPECIES_MEDITITE},
#ifdef SAPPHIRE
    {29, 29, SPECIES_SHUPPET},
#else
    {29, 29, SPECIES_DUSKULL},
#endif
    {27, 27, SPECIES_VULPIX},
    {29, 29, SPECIES_VULPIX},
    {25, 25, SPECIES_VULPIX},
    {27, 27, SPECIES_WINGULL},
    {27, 27, SPECIES_WINGULL},
    {26, 26, SPECIES_WINGULL},
    {28, 28, SPECIES_WINGULL},
};
const struct WildPokemonInfo MtPyre_Exterior_LandMonsInfo = {10, MtPyre_Exterior_LandMons};

const struct WildPokemon MtPyre_Summit_LandMons [] =
{
#ifdef SAPPHIRE
    {28, 28, SPECIES_SHUPPET},
    {29, 29, SPECIES_SHUPPET},
    {27, 27, SPECIES_SHUPPET},
    {26, 26, SPECIES_SHUPPET},
    {30, 30, SPECIES_SHUPPET},
    {25, 25, SPECIES_SHUPPET},
    {24, 24, SPECIES_SHUPPET},
    {28, 28, SPECIES_DUSKULL},
    {26, 26, SPECIES_DUSKULL},
    {30, 30, SPECIES_DUSKULL},
#else
    {28, 28, SPECIES_DUSKULL},
    {29, 29, SPECIES_DUSKULL},
    {27, 27, SPECIES_DUSKULL},
    {26, 26, SPECIES_DUSKULL},
    {30, 30, SPECIES_DUSKULL},
    {25, 25, SPECIES_DUSKULL},
    {24, 24, SPECIES_DUSKULL},
    {28, 28, SPECIES_SHUPPET},
    {26, 26, SPECIES_SHUPPET},
    {30, 30, SPECIES_SHUPPET},
#endif
    {28, 28, SPECIES_CHIMECHO},
    {28, 28, SPECIES_CHIMECHO},
};
const struct WildPokemonInfo MtPyre_Summit_LandMonsInfo = {10, MtPyre_Summit_LandMons};

const struct WildPokemon SeafloorCavern_Entrance_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {5, 35, SPECIES_ZUBAT},
    {30, 35, SPECIES_ZUBAT},
    {30, 35, SPECIES_GOLBAT},
    {30, 35, SPECIES_GOLBAT},
};
const struct WildPokemonInfo SeafloorCavern_Entrance_WaterMonsInfo = {4, SeafloorCavern_Entrance_WaterMons};

const struct WildPokemon SeafloorCavern_Entrance_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo SeafloorCavern_Entrance_FishingMonsInfo = {10, SeafloorCavern_Entrance_FishingMons};

const struct WildPokemon SeafloorCavern_Room1_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
    {33, 33, SPECIES_ZUBAT},
    {28, 28, SPECIES_ZUBAT},
    {29, 29, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {35, 35, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo SeafloorCavern_Room1_LandMonsInfo = {4, SeafloorCavern_Room1_LandMons};

const struct WildPokemon SeafloorCavern_Room2_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
    {33, 33, SPECIES_ZUBAT},
    {28, 28, SPECIES_ZUBAT},
    {29, 29, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {35, 35, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo SeafloorCavern_Room2_LandMonsInfo = {4, SeafloorCavern_Room2_LandMons};

const struct WildPokemon SeafloorCavern_Room3_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
    {33, 33, SPECIES_ZUBAT},
    {28, 28, SPECIES_ZUBAT},
    {29, 29, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {35, 35, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo SeafloorCavern_Room3_LandMonsInfo = {4, SeafloorCavern_Room3_LandMons};

const struct WildPokemon SeafloorCavern_Room4_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
    {33, 33, SPECIES_ZUBAT},
    {28, 28, SPECIES_ZUBAT},
    {29, 29, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {35, 35, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo SeafloorCavern_Room4_LandMonsInfo = {4, SeafloorCavern_Room4_LandMons};

const struct WildPokemon SeafloorCavern_Room5_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
    {33, 33, SPECIES_ZUBAT},
    {28, 28, SPECIES_ZUBAT},
    {29, 29, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {35, 35, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo SeafloorCavern_Room5_LandMonsInfo = {4, SeafloorCavern_Room5_LandMons};

const struct WildPokemon SeafloorCavern_Room6_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
    {33, 33, SPECIES_ZUBAT},
    {28, 28, SPECIES_ZUBAT},
    {29, 29, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {35, 35, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo SeafloorCavern_Room6_LandMonsInfo = {4, SeafloorCavern_Room6_LandMons};

const struct WildPokemon SeafloorCavern_Room6_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {5, 35, SPECIES_ZUBAT},
    {30, 35, SPECIES_ZUBAT},
    {30, 35, SPECIES_GOLBAT},
    {30, 35, SPECIES_GOLBAT},
};
const struct WildPokemonInfo SeafloorCavern_Room6_WaterMonsInfo = {4, SeafloorCavern_Room6_WaterMons};

const struct WildPokemon SeafloorCavern_Room6_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo SeafloorCavern_Room6_FishingMonsInfo = {10, SeafloorCavern_Room6_FishingMons};

const struct WildPokemon SeafloorCavern_Room7_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
    {33, 33, SPECIES_ZUBAT},
    {28, 28, SPECIES_ZUBAT},
    {29, 29, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {35, 35, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo SeafloorCavern_Room7_LandMonsInfo = {4, SeafloorCavern_Room7_LandMons};

const struct WildPokemon SeafloorCavern_Room7_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {5, 35, SPECIES_ZUBAT},
    {30, 35, SPECIES_ZUBAT},
    {30, 35, SPECIES_GOLBAT},
    {30, 35, SPECIES_GOLBAT},
};
const struct WildPokemonInfo SeafloorCavern_Room7_WaterMonsInfo = {4, SeafloorCavern_Room7_WaterMons};

const struct WildPokemon SeafloorCavern_Room7_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo SeafloorCavern_Room7_FishingMonsInfo = {10, SeafloorCavern_Room7_FishingMons};

const struct WildPokemon SeafloorCavern_Room8_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
    {33, 33, SPECIES_ZUBAT},
    {28, 28, SPECIES_ZUBAT},
    {29, 29, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {35, 35, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo SeafloorCavern_Room8_LandMonsInfo = {4, SeafloorCavern_Room8_LandMons};

const struct WildPokemon CaveOfOrigin_Entrance_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
    {33, 33, SPECIES_ZUBAT},
    {28, 28, SPECIES_ZUBAT},
    {29, 29, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {35, 35, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo CaveOfOrigin_Entrance_LandMonsInfo = {4, CaveOfOrigin_Entrance_LandMons};

const struct WildPokemon CaveOfOrigin_1F_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
#ifdef SAPPHIRE
    {30, 30, SPECIES_SABLEYE},
    {32, 32, SPECIES_SABLEYE},
    {34, 34, SPECIES_SABLEYE},
#else
    {30, 30, SPECIES_MAWILE},
    {32, 32, SPECIES_MAWILE},
    {34, 34, SPECIES_MAWILE},
#endif
    {33, 33, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo CaveOfOrigin_1F_LandMonsInfo = {4, CaveOfOrigin_1F_LandMons};

const struct WildPokemon CaveOfOrigin_B1F_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
#ifdef SAPPHIRE
    {30, 30, SPECIES_SABLEYE},
    {32, 32, SPECIES_SABLEYE},
    {34, 34, SPECIES_SABLEYE},
#else
    {30, 30, SPECIES_MAWILE},
    {32, 32, SPECIES_MAWILE},
    {34, 34, SPECIES_MAWILE},
#endif
    {33, 33, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo CaveOfOrigin_B1F_LandMonsInfo = {4, CaveOfOrigin_B1F_LandMons};

const struct WildPokemon CaveOfOrigin_B2F_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
#ifdef SAPPHIRE
    {30, 30, SPECIES_SABLEYE},
    {32, 32, SPECIES_SABLEYE},
    {34, 34, SPECIES_SABLEYE},
#else
    {30, 30, SPECIES_MAWILE},
    {32, 32, SPECIES_MAWILE},
    {34, 34, SPECIES_MAWILE},
#endif
    {33, 33, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo CaveOfOrigin_B2F_LandMonsInfo = {4, CaveOfOrigin_B2F_LandMons};

const struct WildPokemon CaveOfOrigin_B3F_LandMons [] =
{
    {30, 30, SPECIES_ZUBAT},
    {31, 31, SPECIES_ZUBAT},
    {32, 32, SPECIES_ZUBAT},
#ifdef SAPPHIRE
    {30, 30, SPECIES_SABLEYE},
    {32, 32, SPECIES_SABLEYE},
    {34, 34, SPECIES_SABLEYE},
#else
    {30, 30, SPECIES_MAWILE},
    {32, 32, SPECIES_MAWILE},
    {34, 34, SPECIES_MAWILE},
#endif
    {33, 33, SPECIES_ZUBAT},
    {34, 34, SPECIES_ZUBAT},
    {34, 34, SPECIES_GOLBAT},
    {35, 35, SPECIES_GOLBAT},
    {33, 33, SPECIES_GOLBAT},
    {36, 36, SPECIES_GOLBAT},
};
const struct WildPokemonInfo CaveOfOrigin_B3F_LandMonsInfo = {4, CaveOfOrigin_B3F_LandMons};

const struct WildPokemon VictoryRoad_1F_LandMons [] =
{
    {40, 40, SPECIES_GOLBAT},
    {40, 40, SPECIES_HARIYAMA},
    {40, 40, SPECIES_LAIRON},
    {40, 40, SPECIES_LOUDRED},
    {36, 36, SPECIES_ZUBAT},
    {36, 36, SPECIES_MAKUHITA},
    {38, 38, SPECIES_GOLBAT},
    {38, 38, SPECIES_HARIYAMA},
    {36, 36, SPECIES_ARON},
    {36, 36, SPECIES_WHISMUR},
    {36, 36, SPECIES_ARON},
    {36, 36, SPECIES_WHISMUR},
};
const struct WildPokemonInfo VictoryRoad_1F_LandMonsInfo = {10, VictoryRoad_1F_LandMons};

const struct WildPokemon VictoryRoad_B1F_LandMons [] =
{
    {40, 40, SPECIES_GOLBAT},
    {40, 40, SPECIES_HARIYAMA},
    {40, 40, SPECIES_LAIRON},
    {40, 40, SPECIES_MEDICHAM},
    {38, 38, SPECIES_GOLBAT},
    {38, 38, SPECIES_HARIYAMA},
    {42, 42, SPECIES_GOLBAT},
    {42, 42, SPECIES_HARIYAMA},
    {42, 42, SPECIES_LAIRON},
    {38, 38, SPECIES_MEDITITE},
    {42, 42, SPECIES_LAIRON},
    {38, 38, SPECIES_MEDITITE},
};
const struct WildPokemonInfo VictoryRoad_B1F_LandMonsInfo = {10, VictoryRoad_B1F_LandMons};

const struct WildPokemon VictoryRoad_B1F_RockSmashMons [] =
{
    {30, 40, SPECIES_GRAVELER},
    {30, 40, SPECIES_GEODUDE},
    {35, 40, SPECIES_GRAVELER},
    {35, 40, SPECIES_GRAVELER},
    {35, 40, SPECIES_GRAVELER},
};
const struct WildPokemonInfo VictoryRoad_B1F_RockSmashMonsInfo = {20, VictoryRoad_B1F_RockSmashMons};

const struct WildPokemon VictoryRoad_B2F_LandMons [] =
{
    {40, 40, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {40, 40, SPECIES_SABLEYE},
#else
    {40, 40, SPECIES_MAWILE},
#endif
    {40, 40, SPECIES_LAIRON},
    {40, 40, SPECIES_MEDICHAM},
    {42, 42, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {42, 42, SPECIES_SABLEYE},
#else
    {42, 42, SPECIES_MAWILE},
#endif
    {44, 44, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {44, 44, SPECIES_SABLEYE},
#else
    {44, 44, SPECIES_MAWILE},
#endif
    {42, 42, SPECIES_LAIRON},
    {42, 42, SPECIES_MEDICHAM},
    {44, 44, SPECIES_LAIRON},
    {44, 44, SPECIES_MEDICHAM},
};
const struct WildPokemonInfo VictoryRoad_B2F_LandMonsInfo = {10, VictoryRoad_B2F_LandMons};

const struct WildPokemon VictoryRoad_B2F_WaterMons [] =
{
    {30, 35, SPECIES_GOLBAT},
    {25, 30, SPECIES_GOLBAT},
    {35, 40, SPECIES_GOLBAT},
    {35, 40, SPECIES_GOLBAT},
    {35, 40, SPECIES_GOLBAT},
};
const struct WildPokemonInfo VictoryRoad_B2F_WaterMonsInfo = {4, VictoryRoad_B2F_WaterMons};

const struct WildPokemon VictoryRoad_B2F_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_GOLDEEN},
    {10, 30, SPECIES_BARBOACH},
    {25, 30, SPECIES_BARBOACH},
    {30, 35, SPECIES_BARBOACH},
    {30, 35, SPECIES_WHISCASH},
    {35, 40, SPECIES_WHISCASH},
    {40, 45, SPECIES_WHISCASH},
};
const struct WildPokemonInfo VictoryRoad_B2F_FishingMonsInfo = {30, VictoryRoad_B2F_FishingMons};

const struct WildPokemon ShoalCave_LowTideEntranceRoom_LandMons [] =
{
    {26, 26, SPECIES_ZUBAT},
    {26, 26, SPECIES_SPHEAL},
    {28, 28, SPECIES_ZUBAT},
    {28, 28, SPECIES_SPHEAL},
    {30, 30, SPECIES_ZUBAT},
    {30, 30, SPECIES_SPHEAL},
    {32, 32, SPECIES_ZUBAT},
    {32, 32, SPECIES_SPHEAL},
    {32, 32, SPECIES_GOLBAT},
    {32, 32, SPECIES_SPHEAL},
    {32, 32, SPECIES_GOLBAT},
    {32, 32, SPECIES_SPHEAL},
};
const struct WildPokemonInfo ShoalCave_LowTideEntranceRoom_LandMonsInfo = {10, ShoalCave_LowTideEntranceRoom_LandMons};

const struct WildPokemon ShoalCave_LowTideEntranceRoom_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {5, 35, SPECIES_ZUBAT},
    {25, 30, SPECIES_SPHEAL},
    {25, 30, SPECIES_SPHEAL},
    {25, 35, SPECIES_SPHEAL},
};
const struct WildPokemonInfo ShoalCave_LowTideEntranceRoom_WaterMonsInfo = {4, ShoalCave_LowTideEntranceRoom_WaterMons};

const struct WildPokemon ShoalCave_LowTideEntranceRoom_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo ShoalCave_LowTideEntranceRoom_FishingMonsInfo = {10, ShoalCave_LowTideEntranceRoom_FishingMons};

const struct WildPokemon ShoalCave_LowTideInnerRoom_LandMons [] =
{
    {26, 26, SPECIES_ZUBAT},
    {26, 26, SPECIES_SPHEAL},
    {28, 28, SPECIES_ZUBAT},
    {28, 28, SPECIES_SPHEAL},
    {30, 30, SPECIES_ZUBAT},
    {30, 30, SPECIES_SPHEAL},
    {32, 32, SPECIES_ZUBAT},
    {32, 32, SPECIES_SPHEAL},
    {32, 32, SPECIES_GOLBAT},
    {32, 32, SPECIES_SPHEAL},
    {32, 32, SPECIES_GOLBAT},
    {32, 32, SPECIES_SPHEAL},
};
const struct WildPokemonInfo ShoalCave_LowTideInnerRoom_LandMonsInfo = {10, ShoalCave_LowTideInnerRoom_LandMons};

const struct WildPokemon ShoalCave_LowTideInnerRoom_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {5, 35, SPECIES_ZUBAT},
    {25, 30, SPECIES_SPHEAL},
    {25, 30, SPECIES_SPHEAL},
    {25, 35, SPECIES_SPHEAL},
};
const struct WildPokemonInfo ShoalCave_LowTideInnerRoom_WaterMonsInfo = {4, ShoalCave_LowTideInnerRoom_WaterMons};

const struct WildPokemon ShoalCave_LowTideInnerRoom_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo ShoalCave_LowTideInnerRoom_FishingMonsInfo = {10, ShoalCave_LowTideInnerRoom_FishingMons};

const struct WildPokemon ShoalCave_LowTideStairsRoom_LandMons [] =
{
    {26, 26, SPECIES_ZUBAT},
    {26, 26, SPECIES_SPHEAL},
    {28, 28, SPECIES_ZUBAT},
    {28, 28, SPECIES_SPHEAL},
    {30, 30, SPECIES_ZUBAT},
    {30, 30, SPECIES_SPHEAL},
    {32, 32, SPECIES_ZUBAT},
    {32, 32, SPECIES_SPHEAL},
    {32, 32, SPECIES_GOLBAT},
    {32, 32, SPECIES_SPHEAL},
    {32, 32, SPECIES_GOLBAT},
    {32, 32, SPECIES_SPHEAL},
};
const struct WildPokemonInfo ShoalCave_LowTideStairsRoom_LandMonsInfo = {10, ShoalCave_LowTideStairsRoom_LandMons};

const struct WildPokemon ShoalCave_LowTideLowerRoom_LandMons [] =
{
    {26, 26, SPECIES_ZUBAT},
    {26, 26, SPECIES_SPHEAL},
    {28, 28, SPECIES_ZUBAT},
    {28, 28, SPECIES_SPHEAL},
    {30, 30, SPECIES_ZUBAT},
    {30, 30, SPECIES_SPHEAL},
    {32, 32, SPECIES_ZUBAT},
    {32, 32, SPECIES_SPHEAL},
    {32, 32, SPECIES_GOLBAT},
    {32, 32, SPECIES_SPHEAL},
    {32, 32, SPECIES_GOLBAT},
    {32, 32, SPECIES_SPHEAL},
};
const struct WildPokemonInfo ShoalCave_LowTideLowerRoom_LandMonsInfo = {10, ShoalCave_LowTideLowerRoom_LandMons};

const struct WildPokemon ShoalCave_LowTideIceRoom_LandMons [] =
{
    {26, 26, SPECIES_ZUBAT},
    {26, 26, SPECIES_SPHEAL},
    {28, 28, SPECIES_ZUBAT},
    {28, 28, SPECIES_SPHEAL},
    {30, 30, SPECIES_ZUBAT},
    {30, 30, SPECIES_SPHEAL},
    {26, 26, SPECIES_SNORUNT},
    {32, 32, SPECIES_SPHEAL},
    {30, 30, SPECIES_GOLBAT},
    {28, 28, SPECIES_SNORUNT},
    {32, 32, SPECIES_GOLBAT},
    {30, 30, SPECIES_SNORUNT},
};
const struct WildPokemonInfo ShoalCave_LowTideIceRoom_LandMonsInfo = {10, ShoalCave_LowTideIceRoom_LandMons};

const struct WildPokemon NewMauville_Entrance_LandMons [] =
{
    {24, 24, SPECIES_VOLTORB},
    {24, 24, SPECIES_MAGNEMITE},
    {25, 25, SPECIES_VOLTORB},
    {25, 25, SPECIES_MAGNEMITE},
    {23, 23, SPECIES_VOLTORB},
    {23, 23, SPECIES_MAGNEMITE},
    {26, 26, SPECIES_VOLTORB},
    {26, 26, SPECIES_MAGNEMITE},
    {22, 22, SPECIES_VOLTORB},
    {22, 22, SPECIES_MAGNEMITE},
    {22, 22, SPECIES_VOLTORB},
    {22, 22, SPECIES_MAGNEMITE},
};
const struct WildPokemonInfo NewMauville_Entrance_LandMonsInfo = {10, NewMauville_Entrance_LandMons};

const struct WildPokemon NewMauville_Inside_LandMons [] =
{
    {24, 24, SPECIES_VOLTORB},
    {24, 24, SPECIES_MAGNEMITE},
    {25, 25, SPECIES_VOLTORB},
    {25, 25, SPECIES_MAGNEMITE},
    {23, 23, SPECIES_VOLTORB},
    {23, 23, SPECIES_MAGNEMITE},
    {26, 26, SPECIES_VOLTORB},
    {26, 26, SPECIES_MAGNEMITE},
    {22, 22, SPECIES_VOLTORB},
    {22, 22, SPECIES_MAGNEMITE},
    {26, 26, SPECIES_ELECTRODE},
    {26, 26, SPECIES_MAGNETON},
};
const struct WildPokemonInfo NewMauville_Inside_LandMonsInfo = {10, NewMauville_Inside_LandMons};

const struct WildPokemon AbandonedShip_Rooms_B1F_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {5, 35, SPECIES_TENTACOOL},
    {5, 35, SPECIES_TENTACOOL},
    {5, 35, SPECIES_TENTACOOL},
    {30, 35, SPECIES_TENTACRUEL},
};
const struct WildPokemonInfo AbandonedShip_Rooms_B1F_WaterMonsInfo = {4, AbandonedShip_Rooms_B1F_WaterMons};

const struct WildPokemon AbandonedShip_Rooms_B1F_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_TENTACOOL},
    {25, 30, SPECIES_TENTACOOL},
    {30, 35, SPECIES_TENTACOOL},
    {30, 35, SPECIES_TENTACRUEL},
    {25, 30, SPECIES_TENTACRUEL},
    {20, 25, SPECIES_TENTACRUEL},
};
const struct WildPokemonInfo AbandonedShip_Rooms_B1F_FishingMonsInfo = {20, AbandonedShip_Rooms_B1F_FishingMons};

const struct WildPokemon AbandonedShip_HiddenFloorCorridors_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {5, 35, SPECIES_TENTACOOL},
    {5, 35, SPECIES_TENTACOOL},
    {5, 35, SPECIES_TENTACOOL},
    {30, 35, SPECIES_TENTACRUEL},
};
const struct WildPokemonInfo AbandonedShip_HiddenFloorCorridors_WaterMonsInfo = {4, AbandonedShip_HiddenFloorCorridors_WaterMons};

const struct WildPokemon AbandonedShip_HiddenFloorCorridors_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_TENTACOOL},
    {25, 30, SPECIES_TENTACOOL},
    {30, 35, SPECIES_TENTACOOL},
    {30, 35, SPECIES_TENTACRUEL},
    {25, 30, SPECIES_TENTACRUEL},
    {20, 25, SPECIES_TENTACRUEL},
};
const struct WildPokemonInfo AbandonedShip_HiddenFloorCorridors_FishingMonsInfo = {20, AbandonedShip_HiddenFloorCorridors_FishingMons};

const struct WildPokemon SkyPillar_1F_LandMons [] =
{
#ifdef SAPPHIRE
    {48, 48, SPECIES_SABLEYE},
#else
    {48, 48, SPECIES_MAWILE},
#endif
    {48, 48, SPECIES_GOLBAT},
    {50, 50, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {50, 50, SPECIES_SABLEYE},
#else
    {50, 50, SPECIES_MAWILE},
#endif
    {48, 48, SPECIES_CLAYDOL},
#ifdef SAPPHIRE
    {48, 48, SPECIES_BANETTE},
    {50, 50, SPECIES_BANETTE},
#else
    {48, 48, SPECIES_DUSCLOPS},
    {50, 50, SPECIES_DUSCLOPS},
#endif
    {49, 49, SPECIES_CLAYDOL},
    {47, 47, SPECIES_CLAYDOL},
    {50, 50, SPECIES_CLAYDOL},
    {47, 47, SPECIES_CLAYDOL},
    {50, 50, SPECIES_CLAYDOL},
};
const struct WildPokemonInfo SkyPillar_1F_LandMonsInfo = {10, SkyPillar_1F_LandMons};

const struct WildPokemon SkyPillar_3F_LandMons [] =
{
#ifdef SAPPHIRE
    {51, 51, SPECIES_SABLEYE},
#else
    {51, 51, SPECIES_MAWILE},
#endif
    {51, 51, SPECIES_GOLBAT},
    {53, 53, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {53, 53, SPECIES_SABLEYE},
#else
    {53, 53, SPECIES_MAWILE},
#endif
    {51, 51, SPECIES_CLAYDOL},
#ifdef SAPPHIRE
    {51, 51, SPECIES_BANETTE},
    {53, 53, SPECIES_BANETTE},
#else
    {51, 51, SPECIES_DUSCLOPS},
    {53, 53, SPECIES_DUSCLOPS},
#endif
    {52, 52, SPECIES_CLAYDOL},
    {50, 50, SPECIES_CLAYDOL},
    {53, 53, SPECIES_CLAYDOL},
    {50, 50, SPECIES_CLAYDOL},
    {53, 53, SPECIES_CLAYDOL},
};
const struct WildPokemonInfo SkyPillar_3F_LandMonsInfo = {10, SkyPillar_3F_LandMons};

const struct WildPokemon SkyPillar_5F_LandMons [] =
{
#ifdef SAPPHIRE
    {54, 54, SPECIES_SABLEYE},
#else
    {54, 54, SPECIES_MAWILE},
#endif
    {54, 54, SPECIES_GOLBAT},
    {56, 56, SPECIES_GOLBAT},
#ifdef SAPPHIRE
    {56, 56, SPECIES_SABLEYE},
#else
    {56, 56, SPECIES_MAWILE},
#endif
    {54, 54, SPECIES_CLAYDOL},
#ifdef SAPPHIRE
    {54, 54, SPECIES_BANETTE},
    {56, 56, SPECIES_BANETTE},
#else
    {54, 54, SPECIES_DUSCLOPS},
    {56, 56, SPECIES_DUSCLOPS},
#endif
    {55, 55, SPECIES_CLAYDOL},
    {56, 56, SPECIES_CLAYDOL},
    {57, 57, SPECIES_ALTARIA},
    {54, 54, SPECIES_ALTARIA},
    {60, 60, SPECIES_ALTARIA},
};
const struct WildPokemonInfo SkyPillar_5F_LandMonsInfo = {10, SkyPillar_5F_LandMons};

const struct WildPokemon Route101_LandMons [] =
{
    {2, 2, SPECIES_WURMPLE},
    {2, 2, SPECIES_ZIGZAGOON},
    {2, 2, SPECIES_WURMPLE},
    {3, 3, SPECIES_WURMPLE},
    {3, 3, SPECIES_ZIGZAGOON},
    {3, 3, SPECIES_ZIGZAGOON},
    {3, 3, SPECIES_WURMPLE},
    {3, 3, SPECIES_ZIGZAGOON},
    {2, 2, SPECIES_POOCHYENA},
    {2, 2, SPECIES_POOCHYENA},
    {3, 3, SPECIES_POOCHYENA},
    {3, 3, SPECIES_POOCHYENA},
};
const struct WildPokemonInfo Route101_LandMonsInfo = {20, Route101_LandMons};

const struct WildPokemon Route102_LandMons [] =
{
    {3, 3, SPECIES_ZIGZAGOON},
    {3, 3, SPECIES_WURMPLE},
    {4, 4, SPECIES_ZIGZAGOON},
    {4, 4, SPECIES_WURMPLE},
#ifdef SAPPHIRE
    {3, 3, SPECIES_LOTAD},
    {4, 4, SPECIES_LOTAD},
#else
    {3, 3, SPECIES_SEEDOT},
    {4, 4, SPECIES_SEEDOT},
#endif
    {3, 3, SPECIES_POOCHYENA},
    {3, 3, SPECIES_POOCHYENA},
    {4, 4, SPECIES_POOCHYENA},
    {4, 4, SPECIES_RALTS},
    {4, 4, SPECIES_POOCHYENA},
    {3, 3, SPECIES_SURSKIT},
};
const struct WildPokemonInfo Route102_LandMonsInfo = {20, Route102_LandMons};

const struct WildPokemon Route102_WaterMons [] =
{
    {20, 30, SPECIES_MARILL},
    {10, 20, SPECIES_MARILL},
    {30, 35, SPECIES_MARILL},
    {5, 10, SPECIES_MARILL},
    {20, 30, SPECIES_SURSKIT},
};
const struct WildPokemonInfo Route102_WaterMonsInfo = {4, Route102_WaterMons};

const struct WildPokemon Route102_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_GOLDEEN},
    {10, 30, SPECIES_CORPHISH},
    {25, 30, SPECIES_CORPHISH},
    {30, 35, SPECIES_CORPHISH},
    {20, 25, SPECIES_CORPHISH},
    {35, 40, SPECIES_CORPHISH},
    {40, 45, SPECIES_CORPHISH},
};
const struct WildPokemonInfo Route102_FishingMonsInfo = {30, Route102_FishingMons};

const struct WildPokemon Route103_LandMons [] =
{
    {2, 2, SPECIES_ZIGZAGOON},
    {3, 3, SPECIES_ZIGZAGOON},
    {3, 3, SPECIES_ZIGZAGOON},
    {4, 4, SPECIES_ZIGZAGOON},
    {2, 2, SPECIES_POOCHYENA},
    {3, 3, SPECIES_POOCHYENA},
    {3, 3, SPECIES_POOCHYENA},
    {4, 4, SPECIES_POOCHYENA},
    {3, 3, SPECIES_WINGULL},
    {3, 3, SPECIES_WINGULL},
    {2, 2, SPECIES_WINGULL},
    {4, 4, SPECIES_WINGULL},
};
const struct WildPokemonInfo Route103_LandMonsInfo = {20, Route103_LandMons};

const struct WildPokemon Route103_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route103_WaterMonsInfo = {4, Route103_WaterMons};

const struct WildPokemon Route103_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route103_FishingMonsInfo = {30, Route103_FishingMons};

const struct WildPokemon Route104_LandMons [] =
{
    {4, 4, SPECIES_ZIGZAGOON},
    {4, 4, SPECIES_WURMPLE},
    {5, 5, SPECIES_ZIGZAGOON},
    {5, 5, SPECIES_WURMPLE},
    {4, 4, SPECIES_ZIGZAGOON},
    {5, 5, SPECIES_ZIGZAGOON},
    {4, 4, SPECIES_TAILLOW},
    {5, 5, SPECIES_TAILLOW},
    {4, 4, SPECIES_WINGULL},
    {4, 4, SPECIES_WINGULL},
    {3, 3, SPECIES_WINGULL},
    {5, 5, SPECIES_WINGULL},
};
const struct WildPokemonInfo Route104_LandMonsInfo = {20, Route104_LandMons};

const struct WildPokemon Route104_WaterMons [] =
{
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route104_WaterMonsInfo = {4, Route104_WaterMons};

const struct WildPokemon Route104_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_MAGIKARP},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_MAGIKARP},
    {25, 30, SPECIES_MAGIKARP},
    {30, 35, SPECIES_MAGIKARP},
    {20, 25, SPECIES_MAGIKARP},
    {35, 40, SPECIES_MAGIKARP},
    {40, 45, SPECIES_MAGIKARP},
};
const struct WildPokemonInfo Route104_FishingMonsInfo = {30, Route104_FishingMons};

const struct WildPokemon Route105_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route105_WaterMonsInfo = {4, Route105_WaterMons};

const struct WildPokemon Route105_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route105_FishingMonsInfo = {30, Route105_FishingMons};

const struct WildPokemon Route106_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route106_WaterMonsInfo = {4, Route106_WaterMons};

const struct WildPokemon Route106_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route106_FishingMonsInfo = {30, Route106_FishingMons};

const struct WildPokemon Route107_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route107_WaterMonsInfo = {4, Route107_WaterMons};

const struct WildPokemon Route107_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route107_FishingMonsInfo = {30, Route107_FishingMons};

const struct WildPokemon Route108_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route108_WaterMonsInfo = {4, Route108_WaterMons};

const struct WildPokemon Route108_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route108_FishingMonsInfo = {30, Route108_FishingMons};

const struct WildPokemon Route109_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route109_WaterMonsInfo = {4, Route109_WaterMons};

const struct WildPokemon Route109_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route109_FishingMonsInfo = {30, Route109_FishingMons};

const struct WildPokemon Route110_LandMons [] =
{
    {12, 12, SPECIES_ZIGZAGOON},
    {12, 12, SPECIES_ELECTRIKE},
    {12, 12, SPECIES_GULPIN},
    {13, 13, SPECIES_ELECTRIKE},
#ifdef SAPPHIRE
    {13, 13, SPECIES_PLUSLE},
#else
    {13, 13, SPECIES_MINUN},
#endif
    {13, 13, SPECIES_ODDISH},
#ifdef SAPPHIRE
    {13, 13, SPECIES_PLUSLE},
#else
    {13, 13, SPECIES_MINUN},
#endif
    {13, 13, SPECIES_GULPIN},
    {12, 12, SPECIES_WINGULL},
    {12, 12, SPECIES_WINGULL},
#ifdef SAPPHIRE
    {12, 12, SPECIES_MINUN},
    {13, 13, SPECIES_MINUN},
#else
    {12, 12, SPECIES_PLUSLE},
    {13, 13, SPECIES_PLUSLE},
#endif
};
const struct WildPokemonInfo Route110_LandMonsInfo = {20, Route110_LandMons};

const struct WildPokemon Route110_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route110_WaterMonsInfo = {4, Route110_WaterMons};

const struct WildPokemon Route110_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route110_FishingMonsInfo = {30, Route110_FishingMons};

const struct WildPokemon Route111_LandMons [] =
{
    {20, 20, SPECIES_SANDSHREW},
    {20, 20, SPECIES_TRAPINCH},
    {21, 21, SPECIES_SANDSHREW},
    {21, 21, SPECIES_TRAPINCH},
    {19, 19, SPECIES_CACNEA},
    {21, 21, SPECIES_CACNEA},
    {19, 19, SPECIES_SANDSHREW},
    {19, 19, SPECIES_TRAPINCH},
    {20, 20, SPECIES_BALTOY},
    {20, 20, SPECIES_BALTOY},
    {22, 22, SPECIES_BALTOY},
    {22, 22, SPECIES_BALTOY},
};
const struct WildPokemonInfo Route111_LandMonsInfo = {10, Route111_LandMons};

const struct WildPokemon Route111_WaterMons [] =
{
    {20, 30, SPECIES_MARILL},
    {10, 20, SPECIES_MARILL},
    {30, 35, SPECIES_MARILL},
    {5, 10, SPECIES_MARILL},
    {20, 30, SPECIES_SURSKIT},
};
const struct WildPokemonInfo Route111_WaterMonsInfo = {4, Route111_WaterMons};

const struct WildPokemon Route111_RockSmashMons [] =
{
    {10, 15, SPECIES_GEODUDE},
    {5, 10, SPECIES_GEODUDE},
    {15, 20, SPECIES_GEODUDE},
    {15, 20, SPECIES_GEODUDE},
    {15, 20, SPECIES_GEODUDE},
};
const struct WildPokemonInfo Route111_RockSmashMonsInfo = {20, Route111_RockSmashMons};

const struct WildPokemon Route111_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_GOLDEEN},
    {10, 30, SPECIES_BARBOACH},
    {25, 30, SPECIES_BARBOACH},
    {30, 35, SPECIES_BARBOACH},
    {20, 25, SPECIES_BARBOACH},
    {35, 40, SPECIES_BARBOACH},
    {40, 45, SPECIES_BARBOACH},
};
const struct WildPokemonInfo Route111_FishingMonsInfo = {30, Route111_FishingMons};

const struct WildPokemon Route112_LandMons [] =
{
    {15, 15, SPECIES_NUMEL},
    {15, 15, SPECIES_NUMEL},
    {15, 15, SPECIES_MACHOP},
    {14, 14, SPECIES_NUMEL},
    {14, 14, SPECIES_NUMEL},
    {14, 14, SPECIES_MACHOP},
    {16, 16, SPECIES_NUMEL},
    {16, 16, SPECIES_MACHOP},
    {16, 16, SPECIES_NUMEL},
    {16, 16, SPECIES_NUMEL},
    {16, 16, SPECIES_NUMEL},
    {16, 16, SPECIES_NUMEL},
};
const struct WildPokemonInfo Route112_LandMonsInfo = {20, Route112_LandMons};

const struct WildPokemon Route113_LandMons [] =
{
    {15, 15, SPECIES_SPINDA},
    {15, 15, SPECIES_SPINDA},
    {15, 15, SPECIES_SANDSHREW},
    {14, 14, SPECIES_SPINDA},
    {14, 14, SPECIES_SPINDA},
    {14, 14, SPECIES_SANDSHREW},
    {16, 16, SPECIES_SPINDA},
    {16, 16, SPECIES_SANDSHREW},
    {16, 16, SPECIES_SPINDA},
    {16, 16, SPECIES_SKARMORY},
    {16, 16, SPECIES_SPINDA},
    {16, 16, SPECIES_SKARMORY},
};
const struct WildPokemonInfo Route113_LandMonsInfo = {20, Route113_LandMons};

const struct WildPokemon Route114_LandMons [] =
{
    {16, 16, SPECIES_SWABLU},
#ifdef SAPPHIRE
    {16, 16, SPECIES_LOTAD},
#else
    {16, 16, SPECIES_SEEDOT},
#endif
    {17, 17, SPECIES_SWABLU},
    {15, 15, SPECIES_SWABLU},
#ifdef SAPPHIRE
    {15, 15, SPECIES_LOTAD},
    {16, 16, SPECIES_SEVIPER},
    {16, 16, SPECIES_LOMBRE},
    {18, 18, SPECIES_LOMBRE},
    {17, 17, SPECIES_SEVIPER},
    {15, 15, SPECIES_SEVIPER},
    {17, 17, SPECIES_SEVIPER},
#else
    {15, 15, SPECIES_SEEDOT},
    {16, 16, SPECIES_ZANGOOSE},
    {16, 16, SPECIES_NUZLEAF},
    {18, 18, SPECIES_NUZLEAF},
    {17, 17, SPECIES_ZANGOOSE},
    {15, 15, SPECIES_ZANGOOSE},
    {17, 17, SPECIES_ZANGOOSE},
#endif
    {15, 15, SPECIES_SURSKIT},
};
const struct WildPokemonInfo Route114_LandMonsInfo = {20, Route114_LandMons};

const struct WildPokemon Route114_WaterMons [] =
{
    {20, 30, SPECIES_MARILL},
    {10, 20, SPECIES_MARILL},
    {30, 35, SPECIES_MARILL},
    {5, 10, SPECIES_MARILL},
    {20, 30, SPECIES_SURSKIT},
};
const struct WildPokemonInfo Route114_WaterMonsInfo = {4, Route114_WaterMons};

const struct WildPokemon Route114_RockSmashMons [] =
{
    {10, 15, SPECIES_GEODUDE},
    {5, 10, SPECIES_GEODUDE},
    {15, 20, SPECIES_GEODUDE},
    {15, 20, SPECIES_GEODUDE},
    {15, 20, SPECIES_GEODUDE},
};
const struct WildPokemonInfo Route114_RockSmashMonsInfo = {20, Route114_RockSmashMons};

const struct WildPokemon Route114_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_GOLDEEN},
    {10, 30, SPECIES_BARBOACH},
    {25, 30, SPECIES_BARBOACH},
    {30, 35, SPECIES_BARBOACH},
    {20, 25, SPECIES_BARBOACH},
    {35, 40, SPECIES_BARBOACH},
    {40, 45, SPECIES_BARBOACH},
};
const struct WildPokemonInfo Route114_FishingMonsInfo = {30, Route114_FishingMons};

const struct WildPokemon Route115_LandMons [] =
{
    {23, 23, SPECIES_SWABLU},
    {23, 23, SPECIES_TAILLOW},
    {25, 25, SPECIES_SWABLU},
    {24, 24, SPECIES_TAILLOW},
    {25, 25, SPECIES_TAILLOW},
    {25, 25, SPECIES_SWELLOW},
    {24, 24, SPECIES_JIGGLYPUFF},
    {25, 25, SPECIES_JIGGLYPUFF},
    {24, 24, SPECIES_WINGULL},
    {24, 24, SPECIES_WINGULL},
    {26, 26, SPECIES_WINGULL},
    {25, 25, SPECIES_WINGULL},
};
const struct WildPokemonInfo Route115_LandMonsInfo = {20, Route115_LandMons};

const struct WildPokemon Route115_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route115_WaterMonsInfo = {4, Route115_WaterMons};

const struct WildPokemon Route115_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route115_FishingMonsInfo = {30, Route115_FishingMons};

const struct WildPokemon Route116_LandMons [] =
{
    {6, 6, SPECIES_ZIGZAGOON},
    {6, 6, SPECIES_WHISMUR},
    {6, 6, SPECIES_NINCADA},
    {7, 7, SPECIES_WHISMUR},
    {7, 7, SPECIES_NINCADA},
    {6, 6, SPECIES_TAILLOW},
    {7, 7, SPECIES_TAILLOW},
    {8, 8, SPECIES_TAILLOW},
    {7, 7, SPECIES_ZIGZAGOON},
    {8, 8, SPECIES_ZIGZAGOON},
    {7, 7, SPECIES_SKITTY},
    {8, 8, SPECIES_SKITTY},
};
const struct WildPokemonInfo Route116_LandMonsInfo = {20, Route116_LandMons};

const struct WildPokemon Route117_LandMons [] =
{
    {13, 13, SPECIES_ZIGZAGOON},
    {13, 13, SPECIES_ROSELIA},
    {14, 14, SPECIES_ZIGZAGOON},
    {14, 14, SPECIES_ROSELIA},
    {13, 13, SPECIES_MARILL},
    {13, 13, SPECIES_ODDISH},
#ifdef SAPPHIRE
    {13, 13, SPECIES_VOLBEAT},
    {13, 13, SPECIES_VOLBEAT},
    {14, 14, SPECIES_VOLBEAT},
    {14, 14, SPECIES_VOLBEAT},
    {13, 13, SPECIES_ILLUMISE},
#else
    {13, 13, SPECIES_ILLUMISE},
    {13, 13, SPECIES_ILLUMISE},
    {14, 14, SPECIES_ILLUMISE},
    {14, 14, SPECIES_ILLUMISE},
    {13, 13, SPECIES_VOLBEAT},
#endif
    {13, 13, SPECIES_SURSKIT},
};
const struct WildPokemonInfo Route117_LandMonsInfo = {20, Route117_LandMons};

const struct WildPokemon Route117_WaterMons [] =
{
    {20, 30, SPECIES_MARILL},
    {10, 20, SPECIES_MARILL},
    {30, 35, SPECIES_MARILL},
    {5, 10, SPECIES_MARILL},
    {20, 30, SPECIES_SURSKIT},
};
const struct WildPokemonInfo Route117_WaterMonsInfo = {4, Route117_WaterMons};

const struct WildPokemon Route117_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_GOLDEEN},
    {10, 30, SPECIES_CORPHISH},
    {25, 30, SPECIES_CORPHISH},
    {30, 35, SPECIES_CORPHISH},
    {20, 25, SPECIES_CORPHISH},
    {35, 40, SPECIES_CORPHISH},
    {40, 45, SPECIES_CORPHISH},
};
const struct WildPokemonInfo Route117_FishingMonsInfo = {30, Route117_FishingMons};

const struct WildPokemon Route118_LandMons [] =
{
    {24, 24, SPECIES_ZIGZAGOON},
    {24, 24, SPECIES_ELECTRIKE},
    {26, 26, SPECIES_ZIGZAGOON},
    {26, 26, SPECIES_ELECTRIKE},
    {26, 26, SPECIES_LINOONE},
    {26, 26, SPECIES_MANECTRIC},
    {25, 25, SPECIES_WINGULL},
    {25, 25, SPECIES_WINGULL},
    {26, 26, SPECIES_WINGULL},
    {26, 26, SPECIES_WINGULL},
    {27, 27, SPECIES_WINGULL},
    {25, 25, SPECIES_KECLEON},
};
const struct WildPokemonInfo Route118_LandMonsInfo = {20, Route118_LandMons};

const struct WildPokemon Route118_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route118_WaterMonsInfo = {4, Route118_WaterMons};

const struct WildPokemon Route118_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_CARVANHA},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_CARVANHA},
    {20, 25, SPECIES_CARVANHA},
    {35, 40, SPECIES_CARVANHA},
    {40, 45, SPECIES_CARVANHA},
};
const struct WildPokemonInfo Route118_FishingMonsInfo = {30, Route118_FishingMons};

const struct WildPokemon Route119_LandMons [] =
{
    {25, 25, SPECIES_ZIGZAGOON},
    {25, 25, SPECIES_LINOONE},
    {27, 27, SPECIES_ZIGZAGOON},
    {25, 25, SPECIES_ODDISH},
    {27, 27, SPECIES_LINOONE},
    {26, 26, SPECIES_ODDISH},
    {27, 27, SPECIES_ODDISH},
    {24, 24, SPECIES_ODDISH},
    {25, 25, SPECIES_TROPIUS},
    {26, 26, SPECIES_TROPIUS},
    {27, 27, SPECIES_TROPIUS},
    {25, 25, SPECIES_KECLEON},
};
const struct WildPokemonInfo Route119_LandMonsInfo = {15, Route119_LandMons};

const struct WildPokemon Route119_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route119_WaterMonsInfo = {4, Route119_WaterMons};

const struct WildPokemon Route119_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_CARVANHA},
    {25, 30, SPECIES_CARVANHA},
    {30, 35, SPECIES_CARVANHA},
    {20, 25, SPECIES_CARVANHA},
    {35, 40, SPECIES_CARVANHA},
    {40, 45, SPECIES_CARVANHA},
};
const struct WildPokemonInfo Route119_FishingMonsInfo = {30, Route119_FishingMons};

const struct WildPokemon Route120_LandMons [] =
{
    {25, 25, SPECIES_ZIGZAGOON},
    {25, 25, SPECIES_LINOONE},
    {27, 27, SPECIES_LINOONE},
    {25, 25, SPECIES_ODDISH},
    {25, 25, SPECIES_MARILL},
    {26, 26, SPECIES_ODDISH},
    {27, 27, SPECIES_ODDISH},
    {27, 27, SPECIES_MARILL},
    {25, 25, SPECIES_ABSOL},
    {27, 27, SPECIES_ABSOL},
    {25, 25, SPECIES_KECLEON},
    {25, 25, SPECIES_SURSKIT},
};
const struct WildPokemonInfo Route120_LandMonsInfo = {20, Route120_LandMons};

const struct WildPokemon Route120_WaterMons [] =
{
    {20, 30, SPECIES_MARILL},
    {10, 20, SPECIES_MARILL},
    {30, 35, SPECIES_MARILL},
    {5, 10, SPECIES_MARILL},
    {20, 30, SPECIES_SURSKIT},
};
const struct WildPokemonInfo Route120_WaterMonsInfo = {4, Route120_WaterMons};

const struct WildPokemon Route120_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_GOLDEEN},
    {10, 30, SPECIES_BARBOACH},
    {25, 30, SPECIES_BARBOACH},
    {30, 35, SPECIES_BARBOACH},
    {20, 25, SPECIES_BARBOACH},
    {35, 40, SPECIES_BARBOACH},
    {40, 45, SPECIES_BARBOACH},
};
const struct WildPokemonInfo Route120_FishingMonsInfo = {30, Route120_FishingMons};

const struct WildPokemon Route121_LandMons [] =
{
    {26, 26, SPECIES_ZIGZAGOON},
#ifdef SAPPHIRE
    {26, 26, SPECIES_SHUPPET},
#else
    {26, 26, SPECIES_DUSKULL},
#endif
    {26, 26, SPECIES_LINOONE},
#ifdef SAPPHIRE
    {28, 28, SPECIES_SHUPPET},
#else
    {28, 28, SPECIES_DUSKULL},
#endif
    {28, 28, SPECIES_LINOONE},
    {26, 26, SPECIES_ODDISH},
    {28, 28, SPECIES_ODDISH},
    {28, 28, SPECIES_GLOOM},
    {26, 26, SPECIES_WINGULL},
    {27, 27, SPECIES_WINGULL},
    {28, 28, SPECIES_WINGULL},
    {25, 25, SPECIES_KECLEON},
};
const struct WildPokemonInfo Route121_LandMonsInfo = {20, Route121_LandMons};

const struct WildPokemon Route121_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route121_WaterMonsInfo = {4, Route121_WaterMons};

const struct WildPokemon Route121_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route121_FishingMonsInfo = {30, Route121_FishingMons};

const struct WildPokemon Route122_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route122_WaterMonsInfo = {4, Route122_WaterMons};

const struct WildPokemon Route122_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route122_FishingMonsInfo = {30, Route122_FishingMons};

const struct WildPokemon Route123_LandMons [] =
{
    {26, 26, SPECIES_ZIGZAGOON},
#ifdef SAPPHIRE
    {26, 26, SPECIES_SHUPPET},
#else
    {26, 26, SPECIES_DUSKULL},
#endif
    {26, 26, SPECIES_LINOONE},
#ifdef SAPPHIRE
    {28, 28, SPECIES_SHUPPET},
#else
    {28, 28, SPECIES_DUSKULL},
#endif
    {28, 28, SPECIES_LINOONE},
    {26, 26, SPECIES_ODDISH},
    {28, 28, SPECIES_ODDISH},
    {28, 28, SPECIES_GLOOM},
    {26, 26, SPECIES_WINGULL},
    {27, 27, SPECIES_WINGULL},
    {28, 28, SPECIES_WINGULL},
    {25, 25, SPECIES_KECLEON},
};
const struct WildPokemonInfo Route123_LandMonsInfo = {20, Route123_LandMons};

const struct WildPokemon Route123_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route123_WaterMonsInfo = {4, Route123_WaterMons};

const struct WildPokemon Route123_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route123_FishingMonsInfo = {30, Route123_FishingMons};

const struct WildPokemon Route124_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route124_WaterMonsInfo = {4, Route124_WaterMons};

const struct WildPokemon Route124_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route124_FishingMonsInfo = {30, Route124_FishingMons};

const struct WildPokemon Route125_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route125_WaterMonsInfo = {4, Route125_WaterMons};

const struct WildPokemon Route125_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route125_FishingMonsInfo = {30, Route125_FishingMons};

const struct WildPokemon Route126_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route126_WaterMonsInfo = {4, Route126_WaterMons};

const struct WildPokemon Route126_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route126_FishingMonsInfo = {30, Route126_FishingMons};

const struct WildPokemon Route127_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route127_WaterMonsInfo = {4, Route127_WaterMons};

const struct WildPokemon Route127_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route127_FishingMonsInfo = {30, Route127_FishingMons};

const struct WildPokemon Route128_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route128_WaterMonsInfo = {4, Route128_WaterMons};

const struct WildPokemon Route128_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_LUVDISC},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_LUVDISC},
    {30, 35, SPECIES_WAILMER},
    {30, 35, SPECIES_CORSOLA},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route128_FishingMonsInfo = {30, Route128_FishingMons};

const struct WildPokemon Route129_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
#ifdef SAPPHIRE
    {25, 30, SPECIES_WAILORD},
#else
    {35, 40, SPECIES_WAILORD},
#endif
};
const struct WildPokemonInfo Route129_WaterMonsInfo = {4, Route129_WaterMons};

const struct WildPokemon Route129_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route129_FishingMonsInfo = {30, Route129_FishingMons};

const struct WildPokemon Route130_LandMons [] =
{
    {30, 30, SPECIES_WYNAUT},
    {35, 35, SPECIES_WYNAUT},
    {25, 25, SPECIES_WYNAUT},
    {40, 40, SPECIES_WYNAUT},
    {20, 20, SPECIES_WYNAUT},
    {45, 45, SPECIES_WYNAUT},
    {15, 15, SPECIES_WYNAUT},
    {50, 50, SPECIES_WYNAUT},
    {10, 10, SPECIES_WYNAUT},
    {5, 5, SPECIES_WYNAUT},
    {10, 10, SPECIES_WYNAUT},
    {5, 5, SPECIES_WYNAUT},
};
const struct WildPokemonInfo Route130_LandMonsInfo = {20, Route130_LandMons};

const struct WildPokemon Route130_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route130_WaterMonsInfo = {4, Route130_WaterMons};

const struct WildPokemon Route130_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route130_FishingMonsInfo = {30, Route130_FishingMons};

const struct WildPokemon Route131_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route131_WaterMonsInfo = {4, Route131_WaterMons};

const struct WildPokemon Route131_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route131_FishingMonsInfo = {30, Route131_FishingMons};

const struct WildPokemon Route132_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route132_WaterMonsInfo = {4, Route132_WaterMons};

const struct WildPokemon Route132_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_HORSEA},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route132_FishingMonsInfo = {30, Route132_FishingMons};

const struct WildPokemon Route133_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route133_WaterMonsInfo = {4, Route133_WaterMons};

const struct WildPokemon Route133_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_HORSEA},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route133_FishingMonsInfo = {30, Route133_FishingMons};

const struct WildPokemon Route134_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo Route134_WaterMonsInfo = {4, Route134_WaterMons};

const struct WildPokemon Route134_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_HORSEA},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo Route134_FishingMonsInfo = {30, Route134_FishingMons};

const struct WildPokemon SafariZone_Northwest_LandMons [] =
{
    {27, 27, SPECIES_RHYHORN},
    {27, 27, SPECIES_ODDISH},
    {29, 29, SPECIES_RHYHORN},
    {29, 29, SPECIES_ODDISH},
    {27, 27, SPECIES_DODUO},
    {29, 29, SPECIES_GLOOM},
    {31, 31, SPECIES_GLOOM},
    {29, 29, SPECIES_DODUO},
    {29, 29, SPECIES_DODRIO},
    {27, 27, SPECIES_PINSIR},
    {31, 31, SPECIES_DODRIO},
    {29, 29, SPECIES_PINSIR},
};
const struct WildPokemonInfo SafariZone_Northwest_LandMonsInfo = {25, SafariZone_Northwest_LandMons};

const struct WildPokemon SafariZone_Northwest_WaterMons [] =
{
    {20, 30, SPECIES_PSYDUCK},
    {20, 30, SPECIES_PSYDUCK},
    {30, 35, SPECIES_PSYDUCK},
    {30, 35, SPECIES_GOLDUCK},
    {25, 40, SPECIES_GOLDUCK},
};
const struct WildPokemonInfo SafariZone_Northwest_WaterMonsInfo = {9, SafariZone_Northwest_WaterMons};

const struct WildPokemon SafariZone_Northwest_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 25, SPECIES_GOLDEEN},
    {10, 30, SPECIES_GOLDEEN},
    {25, 30, SPECIES_GOLDEEN},
    {30, 35, SPECIES_GOLDEEN},
    {30, 35, SPECIES_SEAKING},
    {35, 40, SPECIES_SEAKING},
    {25, 30, SPECIES_SEAKING},
};
const struct WildPokemonInfo SafariZone_Northwest_FishingMonsInfo = {35, SafariZone_Northwest_FishingMons};

const struct WildPokemon SafariZone_Northeast_LandMons [] =
{
    {27, 27, SPECIES_PHANPY},
    {27, 27, SPECIES_ODDISH},
    {29, 29, SPECIES_PHANPY},
    {29, 29, SPECIES_ODDISH},
    {27, 27, SPECIES_NATU},
    {29, 29, SPECIES_GLOOM},
    {31, 31, SPECIES_GLOOM},
    {29, 29, SPECIES_NATU},
    {29, 29, SPECIES_XATU},
    {27, 27, SPECIES_HERACROSS},
    {31, 31, SPECIES_XATU},
    {29, 29, SPECIES_HERACROSS},
};
const struct WildPokemonInfo SafariZone_Northeast_LandMonsInfo = {25, SafariZone_Northeast_LandMons};

const struct WildPokemon SafariZone_Northeast_RockSmashMons [] =
{
    {10, 15, SPECIES_GEODUDE},
    {5, 10, SPECIES_GEODUDE},
    {15, 20, SPECIES_GEODUDE},
    {20, 25, SPECIES_GEODUDE},
    {25, 30, SPECIES_GEODUDE},
};
const struct WildPokemonInfo SafariZone_Northeast_RockSmashMonsInfo = {25, SafariZone_Northeast_RockSmashMons};

const struct WildPokemon SafariZone_Southwest_LandMons [] =
{
    {25, 25, SPECIES_ODDISH},
    {27, 27, SPECIES_ODDISH},
    {25, 25, SPECIES_GIRAFARIG},
    {27, 27, SPECIES_GIRAFARIG},
    {25, 25, SPECIES_NATU},
#ifdef SAPPHIRE
    {27, 27, SPECIES_DODUO},
#else
    {25, 25, SPECIES_DODUO},
#endif
    {25, 25, SPECIES_GLOOM},
    {27, 27, SPECIES_WOBBUFFET},
    {25, 25, SPECIES_PIKACHU},
    {27, 27, SPECIES_WOBBUFFET},
    {27, 27, SPECIES_PIKACHU},
    {29, 29, SPECIES_WOBBUFFET},
};
const struct WildPokemonInfo SafariZone_Southwest_LandMonsInfo = {25, SafariZone_Southwest_LandMons};

const struct WildPokemon SafariZone_Southwest_WaterMons [] =
{
    {20, 30, SPECIES_PSYDUCK},
    {20, 30, SPECIES_PSYDUCK},
    {30, 35, SPECIES_PSYDUCK},
    {30, 35, SPECIES_PSYDUCK},
    {30, 35, SPECIES_PSYDUCK},
};
const struct WildPokemonInfo SafariZone_Southwest_WaterMonsInfo = {9, SafariZone_Southwest_WaterMons};

const struct WildPokemon SafariZone_Southwest_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_GOLDEEN},
    {10, 30, SPECIES_MAGIKARP},
    {10, 25, SPECIES_GOLDEEN},
    {10, 30, SPECIES_GOLDEEN},
    {25, 30, SPECIES_GOLDEEN},
    {30, 35, SPECIES_GOLDEEN},
    {30, 35, SPECIES_SEAKING},
    {35, 40, SPECIES_SEAKING},
    {25, 30, SPECIES_SEAKING},
};
const struct WildPokemonInfo SafariZone_Southwest_FishingMonsInfo = {35, SafariZone_Southwest_FishingMons};

const struct WildPokemon SafariZone_Southeast_LandMons [] =
{
    {25, 25, SPECIES_ODDISH},
    {27, 27, SPECIES_ODDISH},
    {25, 25, SPECIES_GIRAFARIG},
    {27, 27, SPECIES_GIRAFARIG},
    {25, 25, SPECIES_NATU},
    {25, 25, SPECIES_DODUO},
    {25, 25, SPECIES_GLOOM},
    {27, 27, SPECIES_WOBBUFFET},
    {25, 25, SPECIES_PIKACHU},
    {27, 27, SPECIES_WOBBUFFET},
    {27, 27, SPECIES_PIKACHU},
    {29, 29, SPECIES_WOBBUFFET},
};
const struct WildPokemonInfo SafariZone_Southeast_LandMonsInfo = {25, SafariZone_Southeast_LandMons};

const struct WildPokemon DewfordTown_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo DewfordTown_WaterMonsInfo = {4, DewfordTown_WaterMons};

const struct WildPokemon DewfordTown_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_WAILMER},
    {20, 25, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo DewfordTown_FishingMonsInfo = {10, DewfordTown_FishingMons};

const struct WildPokemon PacifidlogTown_WaterMons [] =
{
    {5, 35, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WINGULL},
    {15, 25, SPECIES_WINGULL},
    {25, 30, SPECIES_PELIPPER},
    {25, 30, SPECIES_PELIPPER},
};
const struct WildPokemonInfo PacifidlogTown_WaterMonsInfo = {4, PacifidlogTown_WaterMons};

const struct WildPokemon PacifidlogTown_FishingMons [] =
{
    {5, 10, SPECIES_MAGIKARP},
    {5, 10, SPECIES_TENTACOOL},
    {10, 30, SPECIES_MAGIKARP},
    {10, 30, SPECIES_TENTACOOL},
    {10, 30, SPECIES_WAILMER},
    {30, 35, SPECIES_SHARPEDO},
    {30, 35, SPECIES_WAILMER},
    {25, 30, SPECIES_WAILMER},
    {35, 40, SPECIES_WAILMER},
    {40, 45, SPECIES_WAILMER},
};
const struct WildPokemonInfo PacifidlogTown_FishingMonsInfo = {10, PacifidlogTown_FishingMons};

const struct WildPokemon Underwater1_WaterMons [] =
{
    {20, 30, SPECIES_CLAMPERL},
    {20, 30, SPECIES_CHINCHOU},
    {30, 35, SPECIES_CLAMPERL},
    {30, 35, SPECIES_RELICANTH},
    {30, 35, SPECIES_RELICANTH},
};
const struct WildPokemonInfo Underwater1_WaterMonsInfo = {4, Underwater1_WaterMons};

const struct WildPokemon Underwater2_WaterMons [] =
{
    {20, 30, SPECIES_CLAMPERL},
    {20, 30, SPECIES_CHINCHOU},
    {30, 35, SPECIES_CLAMPERL},
    {30, 35, SPECIES_RELICANTH},
    {30, 35, SPECIES_RELICANTH},
};
const struct WildPokemonInfo Underwater2_WaterMonsInfo = {4, Underwater2_WaterMons};


extern u16 gRoute119WaterTileData[];
extern u16 gScriptResult;
extern struct WildPokemon gWildFeebasRoute119Data;
extern u8 Event_RepelWoreOff[];

EWRAM_DATA static u8 sWildEncountersDisabled = 0;
EWRAM_DATA static u32 sFeebasRngValue = 0;

#define NUM_FEEBAS_SPOTS 6

static u16 FeebasRandom(void);
static void FeebasSeedRng(u16 seed);

static bool8 RepelCheck(u8 level);
static void ApplyFluteEncounterRateMod(u32 *encRate);
static void ApplyCleanseTagEncounterRateMod(u32 *encRate);

void DisableWildEncounters(bool8 disabled)
{
    sWildEncountersDisabled = disabled;
}

static u16 GetRoute119WaterTileNum(s16 x, s16 y, u8 section)
{
    u16 xCur;
    u16 yCur;
    u16 yMin = gRoute119WaterTileData[section * 3 + 0];
    u16 yMax = gRoute119WaterTileData[section * 3 + 1];
    u16 tileNum = gRoute119WaterTileData[section * 3 + 2];

    for (yCur = yMin; yCur <= yMax; yCur++)
    {
        for (xCur = 0; xCur < gMapHeader.mapData->width; xCur++)
        {
            if (sub_805759C(MapGridGetMetatileBehaviorAt(xCur + 7, yCur + 7)) == TRUE)
            {
                tileNum++;
                if (x == xCur && y == yCur)
                    return tileNum;
            }
        }
    }
    return tileNum + 1;
}

static bool8 CheckFeebas(void)
{
    u8 i;
    u16 feebasSpots[6];
    s16 x;
    s16 y;
    u8 route119section = 0;
    u16 waterTileNum;

    if (gSaveBlock1.location.mapGroup == 0 && gSaveBlock1.location.mapNum == 0x22)
    {
        GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
        x -= 7;
        y -= 7;

#ifdef NONMATCHING
        if (y >= gRoute119WaterTileData[3 * 1 + 0] && y <= gRoute119WaterTileData[3 * 1 + 1])
            route119section = 1;
        if (y >= gRoute119WaterTileData[3 * 2 + 0] && y <= gRoute119WaterTileData[3 * 2 + 1])
            route119section = 2;
#else
        {
            register u16 *arr asm("r0");
            if (y >= (arr = gRoute119WaterTileData)[3 * 1 + 0] && y <= arr[3 * 1 + 1])
                route119section = 1;
            if (y >= arr[3 * 2 + 0] && y <= arr[3 * 2 + 1])
                route119section = 2;
        }
#endif

        if (Random() % 100 > 49) //50% chance of encountering Feebas
            return FALSE;

        FeebasSeedRng(gSaveBlock1.easyChatPairs[0].unk2);
        for (i = 0; i != NUM_FEEBAS_SPOTS;)
        {
            feebasSpots[i] = FeebasRandom() % 447;
            if (feebasSpots[i] == 0)
                feebasSpots[i] = 447;
            if (feebasSpots[i] < 1 || feebasSpots[i] >= 4)
                i++;
        }
        waterTileNum = GetRoute119WaterTileNum(x, y, route119section);
        for (i = 0; i < NUM_FEEBAS_SPOTS; i++)
        {
            if (waterTileNum == feebasSpots[i])
                return TRUE;
        }
    }
    return FALSE;
}

static u16 FeebasRandom(void)
{
    sFeebasRngValue = 12345 + 0x41C64E6D * sFeebasRngValue;
    return sFeebasRngValue >> 16;
}

static void FeebasSeedRng(u16 seed)
{
    sFeebasRngValue = seed;
}

static u8 ChooseWildMonIndex_Land(void)
{
    u8 rand = Random() % 100;

    if (rand < 20)                  //20% chance
        return 0;
    if (rand >= 20 && rand < 40)    //20% chance
        return 1;
    if (rand >= 40 && rand < 50)    //10% chance
        return 2;
    if (rand >= 50 && rand < 60)    //10% chance
        return 3;
    if (rand >= 60 && rand < 70)    //10% chance
        return 4;
    if (rand >= 70 && rand < 80)    //10% chance
        return 5;
    if (rand >= 80 && rand < 85)    //5% chance
        return 6;
    if (rand >= 85 && rand < 90)    //5% chance
        return 7;
    if (rand >= 90 && rand < 94)    //4% chance
        return 8;
    if (rand >= 94 && rand < 98)    //4% chance
        return 9;
    if (rand == 98)                 //1% chance
        return 10;
    else                            //1% chance
        return 11;
}

static u8 ChooseWildMonIndex_Water(void)
{
    u8 rand = Random() % 100;

    if (rand < 60)                  //60% chance
        return 0;
    if (rand >= 60 && rand < 90)    //30% chance
        return 1;
    if (rand >= 90 && rand < 95)    //5% chance
        return 2;
    if (rand >= 95 && rand < 99)    //4% chance
        return 3;
    else                            //1% chance
        return 4;
}

enum
{
    OLD_ROD,
    GOOD_ROD,
    SUPER_ROD
};

static u8 ChooseWildMonIndex_Fishing(u8 rod)
{
    u8 wildMonIndex = 0;
    u8 rand = Random() % 100;

    switch (rod)
    {
    case OLD_ROD:
        if (rand < 70)  //70% chance
            wildMonIndex = 0;
        else            //30% chance
            wildMonIndex = 1;
        break;
    case GOOD_ROD:
        if (rand < 60)                  //60% chance
            wildMonIndex = 2;
        if (rand >= 60 && rand < 80)    //20% chance
            wildMonIndex = 3;
        if (rand >= 80 && rand < 100)   //20% chance
            wildMonIndex = 4;
        break;
    case SUPER_ROD:
        if (rand < 40)                  //40% chance
            wildMonIndex = 5;
        if (rand >= 40 && rand < 80)    //40% chance
            wildMonIndex = 6;
        if (rand >= 80 && rand < 95)    //15% chance
            wildMonIndex = 7;
        if (rand >= 95 && rand < 99)    //4% chance
            wildMonIndex = 8;
        if (rand == 99)                 //1% chance
            wildMonIndex = 9;
        break;
    }
    return wildMonIndex;
}

static u8 ChooseWildMonLevel(const struct WildPokemon *wildPokemon)
{
    u8 min;
    u8 max;
    u8 range;
    u8 rand;

    //Make sure minimum level is less than maximum level
    if (wildPokemon->maxLevel >= wildPokemon->minLevel)
    {
        min = wildPokemon->minLevel;
        max = wildPokemon->maxLevel;
    }
    else
    {
        min = wildPokemon->maxLevel;
        max = wildPokemon->minLevel;
    }
    range = max - min + 1;
    rand = Random() % range;
    return min + rand;
}

static u16 GetCurrentMapWildMonHeader(void)
{
    u16 i;

    for (i = 0; gWildMonHeaders[i].mapGroup != 0xFF; i++)
    {
        if (gWildMonHeaders[i].mapGroup == gSaveBlock1.location.mapGroup &&
        gWildMonHeaders[i].mapNum == gSaveBlock1.location.mapNum)
            return i;
    }
    return -1;
}

static u8 PickWildMonNature(void)
{
    u8 i;
    u8 j;
    struct Pokeblock *safariPokeblock;
    u8 natures[25];

    if (GetSafariZoneFlag() == TRUE && Random() % 100 < 80)
    {
        safariPokeblock = SafariZoneGetActivePokeblock();
        if (safariPokeblock != NULL)
        {
            for (i = 0; i < 25; i++)
                natures[i] = i;
            for (i = 0; i < 24; i++)
            {
                for (j = i + 1; j < 25; j++)
                {
                    if (Random() & 1)
                    {
                        u8 temp = natures[i];

                        natures[i] = natures[j];
                        natures[j] = temp;
                    }
                }
            }
            for (i = 0; i < 25; i++)
            {
                if (PokeblockGetGain(natures[i], safariPokeblock) > 0)
                    return natures[i];
            }
        }
    }
    return Random() % 25;
}

static void CreateWildMon(u16 species, u8 b)
{
    ZeroEnemyPartyMons();
    CreateMonWithNature(&gEnemyParty[0], species, b, 0x20, PickWildMonNature());
}

static bool8 GenerateWildMon(struct WildPokemonInfo *wildMonInfo, u8 area, bool8 checkRepel)
{
    u8 wildMonIndex = 0;
    u8 level;

    switch (area)
    {
    case 0:
        wildMonIndex = ChooseWildMonIndex_Land();
        break;
    case 1:
        wildMonIndex = ChooseWildMonIndex_Water();
        break;
    case 2:
        wildMonIndex = ChooseWildMonIndex_Water();
        break;
    }
    level = ChooseWildMonLevel(&wildMonInfo->wildPokemon[wildMonIndex]);
    if (checkRepel == TRUE && RepelCheck(level) == FALSE)
        return FALSE;
    else
    {
        CreateWildMon(wildMonInfo->wildPokemon[wildMonIndex].species, level);
        return TRUE;
    }
}

static u16 GenerateFishingWildMon(struct WildPokemonInfo *wildMonInfo, u8 rod)
{
    u8 wildMonIndex = ChooseWildMonIndex_Fishing(rod);
    u8 level = ChooseWildMonLevel(&wildMonInfo->wildPokemon[wildMonIndex]);

    CreateWildMon(wildMonInfo->wildPokemon[wildMonIndex].species, level);
    return wildMonInfo->wildPokemon[wildMonIndex].species;
}

static bool8 SetUpMassOutbreakEncounter(bool8 checkRepel)
{
    u16 i;

    if (checkRepel == TRUE && RepelCheck(gSaveBlock1.outbreakPokemonLevel) == 0)
        return FALSE;
    else
    {
        CreateWildMon(gSaveBlock1.outbreakPokemonSpecies, gSaveBlock1.outbreakPokemonLevel);
        for (i = 0; i < 4; i++)
            SetMonMoveSlot(&gEnemyParty[0], gSaveBlock1.outbreakPokemonMoves[i], i);
        return TRUE;
    }
}

static bool8 DoMassOutbreakEncounterTest(void)
{
    if (gSaveBlock1.outbreakPokemonSpecies != 0
     && gSaveBlock1.location.mapNum == gSaveBlock1.outbreakLocationMapNum
     && gSaveBlock1.location.mapGroup == gSaveBlock1.outbreakLocationMapGroup)
    {
        if (Random() % 100 < gSaveBlock1.outbreakPokemonProbability)
            return TRUE;
    }
    return FALSE;
}

static bool8 DoWildEncounterRateDiceRoll(u16 encounterRate)
{
    if (Random() % 2880 < encounterRate)
        return TRUE;
    else
        return FALSE;
}

static bool8 DoWildEncounterTest(u32 encounterRate, bool8 ignoreAbility)
{
    encounterRate *= 16;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
        encounterRate = encounterRate * 80 / 100;
    ApplyFluteEncounterRateMod(&encounterRate);
    ApplyCleanseTagEncounterRateMod(&encounterRate);
    if (!ignoreAbility)
    {
        // UB: Too few arguments for function 'GetMonData'
        if (!GetMonData(&gPlayerParty[0], MON_DATA_SANITY_BIT3))
        {
            u32 ability = GetMonAbility(&gPlayerParty[0]);
            if (ability == ABILITY_STENCH)
                encounterRate /= 2;
            if (ability == ABILITY_ILLUMINATE)
                encounterRate *= 2;
        }
    }
    if (encounterRate > 2880)
        encounterRate = 2880;
    return DoWildEncounterRateDiceRoll(encounterRate);
}

static bool8 DoGlobalWildEncounterDiceRoll(void)
{
    if (Random() % 100 >= 60)
        return FALSE;
    else
        return TRUE;
}

bool8 StandardWildEncounter(u16 a, u16 b)
{
    u16 headerNum;
    struct Roamer *roamer;

    if (sWildEncountersDisabled == TRUE)
        return 0;
    else
    {
        headerNum = GetCurrentMapWildMonHeader();
        if (headerNum != 0xFFFF)
        {
            if (MetatileBehavior_IsLandWildEncounter(a) == TRUE)
            {
                if (gWildMonHeaders[headerNum].landMonsInfo)
                {
                    if (b != a && !DoGlobalWildEncounterDiceRoll())
                        return 0;

                    if (DoWildEncounterTest(gWildMonHeaders[headerNum].landMonsInfo->encounterRate, 0) == TRUE)
                    {
                        if (TryStartRoamerEncounter() == TRUE)
                        {
                            roamer = &gSaveBlock1.roamer;
                            if (RepelCheck(roamer->level))
                            {
                                BattleSetup_StartRoamerBattle();
                                return 1;
                            }
                        }
                        else
                        {
                            if (DoMassOutbreakEncounterTest() == TRUE && SetUpMassOutbreakEncounter(1) == TRUE)
                            {
                                BattleSetup_StartWildBattle();
                                return 1;
                            }
                            if (GenerateWildMon(gWildMonHeaders[headerNum].landMonsInfo, 0, TRUE) == TRUE)
                            {
                                goto label;
                            }
                        }
                    }
                }
            }
            else if (MetatileBehavior_IsWaterWildEncounter(a) == TRUE
             || (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING) && MetatileBehavior_IsBridge(a) == TRUE))
            {
                if (gWildMonHeaders[headerNum].waterMonsInfo)
                {
                    if (b != a && !DoGlobalWildEncounterDiceRoll())
                        return 0;

                    if (DoWildEncounterTest(gWildMonHeaders[headerNum].waterMonsInfo->encounterRate, 0) == TRUE)
                    {
                        if (TryStartRoamerEncounter() == TRUE)
                        {
                            roamer = &gSaveBlock1.roamer;
                            if (RepelCheck(roamer->level))
                            {
                                BattleSetup_StartRoamerBattle();
                                return 1;
                            }
                        }
                        else
                        {
                            //_08085268
                            if (GenerateWildMon(gWildMonHeaders[headerNum].waterMonsInfo, 1, TRUE) == TRUE)
                            {
                            label:
                                //_0808527A
                                BattleSetup_StartWildBattle();
                                return 1;
                            }
                        }
                    }
                }
            }
        }
    }
    return 0;
}

void RockSmashWildEncounter(void)
{
    u16 headerNum = GetCurrentMapWildMonHeader();

    if (headerNum != 0xFFFF)
    {
        struct WildPokemonInfo *wildPokemonInfo = gWildMonHeaders[headerNum].rockSmashMonsInfo;

        if (wildPokemonInfo == NULL)
        {
            gScriptResult = 0;
            return;
        }
        else if (DoWildEncounterTest(wildPokemonInfo->encounterRate, 1) == TRUE
         && GenerateWildMon(wildPokemonInfo, 2, TRUE) == TRUE)
        {
            BattleSetup_StartWildBattle();
            gScriptResult = 1;
            return;
        }
    }
    gScriptResult = 0;
    return;
}

bool8 SweetScentWildEncounter(void)
{
    s16 x;
    s16 y;
    u16 headerNum;
    struct WildPokemonInfo *wildPokemonInfo;

    PlayerGetDestCoords(&x, &y);
    if ((headerNum = GetCurrentMapWildMonHeader()) != 0xFFFF)
    {
        if (MetatileBehavior_IsLandWildEncounter(MapGridGetMetatileBehaviorAt(x, y)) == 1)
        {
            wildPokemonInfo = gWildMonHeaders[headerNum].landMonsInfo;
            if (wildPokemonInfo == NULL)
                return FALSE;
            if (TryStartRoamerEncounter() == TRUE)
            {
                BattleSetup_StartRoamerBattle();
                return TRUE;
            }
            if (DoMassOutbreakEncounterTest() == TRUE)
                SetUpMassOutbreakEncounter(0);
            else
                GenerateWildMon(wildPokemonInfo, 0, FALSE);
            BattleSetup_StartWildBattle();
            return TRUE;
        }
        else if (MetatileBehavior_IsWaterWildEncounter(MapGridGetMetatileBehaviorAt(x, y)) == 1)
        {
            wildPokemonInfo = gWildMonHeaders[headerNum].waterMonsInfo;
            if (wildPokemonInfo == NULL)
                return FALSE;
            if (TryStartRoamerEncounter() == TRUE)
            {
                BattleSetup_StartRoamerBattle();
                return TRUE;
            }
            GenerateWildMon(wildPokemonInfo, 1, FALSE);
            BattleSetup_StartWildBattle();
            return TRUE;
        }
    }
    return FALSE;
}

bool8 GetFishingWildMonListHeader(void)
{
    u16 headerNum = GetCurrentMapWildMonHeader();

    if (headerNum != 0xFFFF && gWildMonHeaders[headerNum].fishingMonsInfo != NULL)
        return TRUE;
    else
        return FALSE;
}

void FishingWildEncounter(u8 rod)
{
    u16 species;

    if (CheckFeebas() == TRUE)
    {
        u8 level = ChooseWildMonLevel(&gWildFeebasRoute119Data);

        species = gWildFeebasRoute119Data.species;
        CreateWildMon(species, level);
    }
    else
    {
        species = GenerateFishingWildMon(
          gWildMonHeaders[GetCurrentMapWildMonHeader()].fishingMonsInfo,
          rod);
    }
    IncrementGameStat(12);
    sub_80BEA50(species);
    BattleSetup_StartWildBattle();
}

u16 GetLocalWildMon(bool8 *isWaterMon)
{
    u16 headerNum;
    struct WildPokemonInfo *landMonsInfo;
    struct WildPokemonInfo *waterMonsInfo;

    *isWaterMon = FALSE;
    headerNum = GetCurrentMapWildMonHeader();
    if (headerNum == 0xFFFF)
        return 0;
    landMonsInfo = gWildMonHeaders[headerNum].landMonsInfo;
    waterMonsInfo = gWildMonHeaders[headerNum].waterMonsInfo;
    //Neither
    if (landMonsInfo == NULL && waterMonsInfo == NULL)
        return 0;
    //Land Pokemon
    if (landMonsInfo != NULL && waterMonsInfo == NULL)
        return landMonsInfo->wildPokemon[ChooseWildMonIndex_Land()].species;
    //Water Pokemon
    if (landMonsInfo == NULL && waterMonsInfo != NULL)
    {
        *isWaterMon = TRUE;
        return waterMonsInfo->wildPokemon[ChooseWildMonIndex_Water()].species;
    }
    //Either land or water Pokemon
    if ((Random() % 100) < 80)
        return landMonsInfo->wildPokemon[ChooseWildMonIndex_Land()].species;
    else
    {
        *isWaterMon = TRUE;
        return waterMonsInfo->wildPokemon[ChooseWildMonIndex_Water()].species;
    }
}

u16 GetMirageIslandMon(void)
{
    u16 headerNum = GetCurrentMapWildMonHeader();

    if (headerNum != 0xFFFF)
    {
        struct WildPokemonInfo *waterMonsInfo = gWildMonHeaders[headerNum].waterMonsInfo;

        if (waterMonsInfo)
            return waterMonsInfo->wildPokemon[ChooseWildMonIndex_Water()].species;
    }
    return 0;
}

bool8 UpdateRepelCounter(void)
{
    u16 steps = VarGet(VAR_REPEL_STEP_COUNT);

    if (steps != 0)
    {
        steps--;
        VarSet(VAR_REPEL_STEP_COUNT, steps);
        if (steps == 0)
        {
            ScriptContext1_SetupScript(Event_RepelWoreOff);
            return TRUE;
        }
    }
    return FALSE;
}

//Returns FALSE if Repel prevents wild Pokemon at the specified level from appearing
static bool8 RepelCheck(u8 level)
{
    u8 i;

    if (!VarGet(VAR_REPEL_STEP_COUNT))
        return TRUE;
    else
    {
        for (i = 0; i < 6; i++)
        {
            // UB: Too few arguments for function 'GetMonData'
            if (GetMonData(&gPlayerParty[i], MON_DATA_HP) && !GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
            {
                if (level < (u8)GetMonData(&gPlayerParty[i], MON_DATA_LEVEL))
                    return FALSE;
                else
                    return TRUE;
            }
        }
        return FALSE;
    }
}

static void ApplyFluteEncounterRateMod(u32 *encRate)
{
    if (FlagGet(SYS_ENC_UP_ITEM) == TRUE)
        *encRate += *encRate / 2;
    else if (FlagGet(SYS_ENC_DOWN_ITEM) == TRUE)
        *encRate = *encRate / 2;
}

static void ApplyCleanseTagEncounterRateMod(u32 *encRate)
{
    // UB: Too few arguments for function 'GetMonData'
    if (GetMonData(&gPlayerParty[0], MON_DATA_HELD_ITEM) == 0xBE)
        *encRate = *encRate * 2 / 3;
}
