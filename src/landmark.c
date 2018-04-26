#include "global.h"
#include "landmark.h"
#include "event_data.h"
#include "constants/region_map_sections.h"

struct Landmark
{
    const u8 *name;
    u16 flag;
};

struct LandmarkList
{
    u8 mapSection;
    u8 id;
    const struct Landmark *const *landmarks;
};

extern const u8 gLandmarkName_FlowerShop[];
extern const u8 gLandmarkName_PetalburgWoods[];
extern const u8 gLandmarkName_MrBrineysCottage[];
extern const u8 gLandmarkName_AbandonedShip[];
extern const u8 gLandmarkName_SeashoreHouse[];
extern const u8 gLandmarkName_SlateportBeach[];
extern const u8 gLandmarkName_CyclingRoad[];
extern const u8 gLandmarkName_NewMauville[];
extern const u8 gLandmarkName_TrickHouse[];
extern const u8 gLandmarkName_OldLadysRestShop[];
extern const u8 gLandmarkName_Desert[];
extern const u8 gLandmarkName_WinstrateFamily[];
extern const u8 gLandmarkName_CableCar[];
extern const u8 gLandmarkName_GlassWorkshop[];
extern const u8 gLandmarkName_WeatherInstitute[];
extern const u8 gLandmarkName_MeteorFalls[];
extern const u8 gLandmarkName_TunnelersRestHouse[];
extern const u8 gLandmarkName_RusturfTunnel[];
extern const u8 gLandmarkName_PokemonDayCare[];
extern const u8 gLandmarkName_SafariZoneEntrance[];
extern const u8 gLandmarkName_MtPyre[];
extern const u8 gLandmarkName_ShoalCave[];
extern const u8 gLandmarkName_SeafloorCavern[];
extern const u8 gLandmarkName_GraniteCave[];
extern const u8 gLandmarkName_OceanCurrent[];
extern const u8 gLandmarkName_LanettesHouse[];
extern const u8 gLandmarkName_FieryPath[];
extern const u8 gLandmarkName_JaggedPass[];
extern const u8 gLandmarkName_BerryMastersHouse[];
extern const u8 gLandmarkName_IslandCave[];
extern const u8 gLandmarkName_DesertRuins[];
extern const u8 gLandmarkName_ScorchedSlab[];
extern const u8 gLandmarkName_AncientTomb[];
extern const u8 gLandmarkName_SealedChamber[];
extern const u8 gLandmarkName_FossilManiacsHouse[];
extern const u8 gLandmarkName_HuntersHouse[];
extern const u8 gLandmarkName_SkyPillar[];

static const struct Landmark Landmark_FlowerShop = {gLandmarkName_FlowerShop, FLAG_LANDMARK_FLOWER_SHOP};
static const struct Landmark Landmark_PetalburgWoods = {gLandmarkName_PetalburgWoods, -1};
static const struct Landmark Landmark_MrBrineysCottage = {gLandmarkName_MrBrineysCottage, FLAG_LANDMARK_MR_BRINEY_HOUSE};
static const struct Landmark Landmark_AbandonedShip = {gLandmarkName_AbandonedShip, FLAG_LANDMARK_ABANDONED_SHIP};
static const struct Landmark Landmark_SeashoreHouse = {gLandmarkName_SeashoreHouse, FLAG_LANDMARK_SEASHORE_HOUSE};
static const struct Landmark Landmark_SlateportBeach = {gLandmarkName_SlateportBeach, -1};
static const struct Landmark Landmark_CyclingRoad = {gLandmarkName_CyclingRoad, -1};
static const struct Landmark Landmark_NewMauville = {gLandmarkName_NewMauville, FLAG_LANDMARK_NEW_MAUVILLE};
static const struct Landmark Landmark_TrickHouse = {gLandmarkName_TrickHouse, FLAG_LANDMARK_TRICK_HOUSE};
static const struct Landmark Landmark_OldLadysRestShop = {gLandmarkName_OldLadysRestShop, FLAG_LANDMARK_OLD_LADY_REST_SHOP};
static const struct Landmark Landmark_Desert = {gLandmarkName_Desert, -1};
static const struct Landmark Landmark_WinstrateFamily = {gLandmarkName_WinstrateFamily, FLAG_LANDMARK_WINSTRATE_FAMILY};
static const struct Landmark Landmark_CableCar = {gLandmarkName_CableCar, -1};
static const struct Landmark Landmark_GlassWorkshop = {gLandmarkName_GlassWorkshop, FLAG_LANDMARK_GLASS_WORKSHOP};
static const struct Landmark Landmark_WeatherInstitute = {gLandmarkName_WeatherInstitute, -1};
static const struct Landmark Landmark_MeteorFalls = {gLandmarkName_MeteorFalls, -1};
static const struct Landmark Landmark_TunnelersRestHouse = {gLandmarkName_TunnelersRestHouse, FLAG_LANDMARK_TUNNELERS_REST_HOUSE};
static const struct Landmark Landmark_RusturfTunnel = {gLandmarkName_RusturfTunnel, -1};
static const struct Landmark Landmark_PokemonDayCare = {gLandmarkName_PokemonDayCare, FLAG_LANDMARK_POKEMON_DAYCARE};
static const struct Landmark Landmark_SafariZoneEntrance = {gLandmarkName_SafariZoneEntrance, -1};
static const struct Landmark Landmark_MtPyre = {gLandmarkName_MtPyre, -1};
static const struct Landmark Landmark_ShoalCave = {gLandmarkName_ShoalCave, -1};
static const struct Landmark Landmark_SeafloorCavern = {gLandmarkName_SeafloorCavern, FLAG_LANDMARK_SEAFLOOR_CAVERN};
static const struct Landmark Landmark_GraniteCave = {gLandmarkName_GraniteCave, -1};
static const struct Landmark Landmark_OceanCurrent = {gLandmarkName_OceanCurrent, -1};
static const struct Landmark Landmark_LanettesHouse = {gLandmarkName_LanettesHouse, FLAG_LANDMARK_LANETTES_HOUSE};
static const struct Landmark Landmark_FieryPath = {gLandmarkName_FieryPath, FLAG_LANDMARK_FIERY_PATH};
static const struct Landmark Landmark_JaggedPass = {gLandmarkName_JaggedPass, -1};
static const struct Landmark Landmark_BerryMastersHouse = {gLandmarkName_BerryMastersHouse, FLAG_LANDMARK_BERRY_MASTERS_HOUSE};
static const struct Landmark Landmark_IslandCave = {gLandmarkName_IslandCave, FLAG_LANDMARK_ISLAND_CAVE};
static const struct Landmark Landmark_DesertRuins = {gLandmarkName_DesertRuins, FLAG_LANDMARK_DESERT_RUINS};
static const struct Landmark Landmark_ScorchedSlab = {gLandmarkName_ScorchedSlab, FLAG_LANDMARK_SCORCHED_SLAB};
static const struct Landmark Landmark_AncientTomb = {gLandmarkName_AncientTomb, FLAG_LANDMARK_ANCIENT_TOMB};
static const struct Landmark Landmark_SealedChamber = {gLandmarkName_SealedChamber, FLAG_LANDMARK_SEALED_CHAMBER};
static const struct Landmark Landmark_FossilManiacsHouse = {gLandmarkName_FossilManiacsHouse, FLAG_LANDMARK_FOSSIL_MANIACS_HOUSE};
static const struct Landmark Landmark_HuntersHouse = {gLandmarkName_HuntersHouse, FLAG_LANDMARK_HUNTERS_HOUSE};
static const struct Landmark Landmark_SkyPillar = {gLandmarkName_SkyPillar, FLAG_LANDMARK_SKY_PILLAR};

static const struct Landmark *const Landmarks_Route104_0[]  =
{
    &Landmark_FlowerShop,
    NULL,
};

static const struct Landmark *const Landmarks_Route104_1[]  =
{
    &Landmark_PetalburgWoods,
    &Landmark_MrBrineysCottage,
    NULL,
};

static const struct Landmark *const Landmarks_Route105_0[]  =
{
    &Landmark_IslandCave,
    NULL,
};

static const struct Landmark *const Landmarks_Route106_1[]  =
{
    &Landmark_GraniteCave,
    NULL,
};

static const struct Landmark *const Landmarks_Route108_0[]  =
{
    &Landmark_AbandonedShip,
    NULL,
};

static const struct Landmark *const Landmarks_Route109_0[]  =
{
    &Landmark_SeashoreHouse,
    &Landmark_SlateportBeach,
    NULL,
};

static const struct Landmark *const Landmarks_Route110_0[]  =
{
    &Landmark_CyclingRoad,
    &Landmark_NewMauville,
    NULL,
};

static const struct Landmark *const Landmarks_Route110_1[]  =
{
    &Landmark_CyclingRoad,
    NULL,
};

static const struct Landmark *const Landmarks_Route110_2[]  =
{
    &Landmark_CyclingRoad,
    &Landmark_TrickHouse,
    NULL,
};

static const struct Landmark *const Landmarks_Route111_0[]  =
{
    &Landmark_OldLadysRestShop,
    NULL,
};

static const struct Landmark *const Landmarks_Route111_1[]  =
{
    &Landmark_Desert,
    NULL,
};

static const struct Landmark *const Landmarks_Route111_3[]  =
{
    &Landmark_DesertRuins,
    &Landmark_Desert,
    NULL,
};

static const struct Landmark *const Landmarks_Route111_4[]  =
{
    &Landmark_WinstrateFamily,
    &Landmark_Desert,
    NULL,
};

static const struct Landmark *const Landmarks_Route112_0[]  =
{
    &Landmark_FieryPath,
    &Landmark_JaggedPass,
    NULL,
};

static const struct Landmark *const Landmarks_Route112_1[]  =
{
    &Landmark_CableCar,
    &Landmark_FieryPath,
    NULL,
};

static const struct Landmark *const Landmarks_Route113_1[]  =
{
    &Landmark_GlassWorkshop,
    NULL,
};

static const struct Landmark *const Landmarks_Route114_1[]  =
{
    &Landmark_FossilManiacsHouse,
    NULL,
};

static const struct Landmark *const Landmarks_Route114_2[]  =
{
    &Landmark_LanettesHouse,
    NULL,
};

static const struct Landmark *const Landmarks_MeteorFalls[]  =
{
    &Landmark_MeteorFalls,
    NULL,
};

static const struct Landmark *const Landmarks_Route116_1[]  =
{
    &Landmark_TunnelersRestHouse,
    &Landmark_RusturfTunnel,
    NULL,
};

static const struct Landmark *const Landmarks_Route116_2[]  =
{
    &Landmark_RusturfTunnel,
    NULL,
};

static const struct Landmark *const Landmarks_Route117_2[]  =
{
    &Landmark_PokemonDayCare,
    NULL,
};

static const struct Landmark *const Landmarks_Route119_1[]  =
{
    &Landmark_WeatherInstitute,
    NULL,
};

static const struct Landmark *const Landmarks_Route120_0[]  =
{
    &Landmark_ScorchedSlab,
    NULL,
};

static const struct Landmark *const Landmarks_Route120_2[]  =
{
    &Landmark_AncientTomb,
    NULL,
};

static const struct Landmark *const Landmarks_Route121_2[]  =
{
    &Landmark_SafariZoneEntrance,
    NULL,
};

static const struct Landmark *const Landmarks_Route122_0[]  =
{
    &Landmark_MtPyre,
    NULL,
};

static const struct Landmark *const Landmarks_Route123_0[]  =
{
    &Landmark_BerryMastersHouse,
    NULL,
};

static const struct Landmark *const Landmarks_Route124_7[]  =
{
    &Landmark_HuntersHouse,
    NULL,
};

static const struct Landmark *const Landmarks_Route125_2[]  =
{
    &Landmark_ShoalCave,
    NULL,
};

static const struct Landmark *const Landmarks_Route128_1[]  =
{
    &Landmark_SeafloorCavern,
    NULL,
};

static const struct Landmark *const Landmarks_Route131_1[]  =
{
    &Landmark_SkyPillar,
    NULL,
};

static const struct Landmark *const Landmarks_OceanCurrent[]  =
{
    &Landmark_OceanCurrent,
    NULL,
};

static const struct Landmark *const Landmarks_Route134_2[]  =
{
    &Landmark_SealedChamber,
    &Landmark_OceanCurrent,
    NULL,
};

static const struct Landmark *const Landmarks_MtChimney_2[]  =
{
    &Landmark_CableCar,
    &Landmark_JaggedPass,
    NULL,
};

static const struct LandmarkList gLandmarkLists[] =
{
	{MAPSEC_ROUTE_104, 0, Landmarks_Route104_0},
    {MAPSEC_ROUTE_104, 1, Landmarks_Route104_1},
    {MAPSEC_ROUTE_105, 0, Landmarks_Route105_0},
    {MAPSEC_ROUTE_106, 1, Landmarks_Route106_1},
    {MAPSEC_ROUTE_108, 0, Landmarks_Route108_0},
    {MAPSEC_ROUTE_109, 0, Landmarks_Route109_0},
    {MAPSEC_ROUTE_110, 0, Landmarks_Route110_0},
    {MAPSEC_ROUTE_110, 1, Landmarks_Route110_1},
    {MAPSEC_ROUTE_110, 2, Landmarks_Route110_2},
    {MAPSEC_ROUTE_111, 0, Landmarks_Route111_0},
    {MAPSEC_ROUTE_111, 1, Landmarks_Route111_1},
    {MAPSEC_ROUTE_111, 2, Landmarks_Route111_1},
    {MAPSEC_ROUTE_111, 3, Landmarks_Route111_3},
    {MAPSEC_ROUTE_111, 4, Landmarks_Route111_4},
    {MAPSEC_ROUTE_112, 0, Landmarks_Route112_0},
    {MAPSEC_ROUTE_112, 1, Landmarks_Route112_1},
    {MAPSEC_ROUTE_113, 1, Landmarks_Route113_1},
    {MAPSEC_ROUTE_114, 1, Landmarks_Route114_1},
    {MAPSEC_ROUTE_114, 2, Landmarks_Route114_2},
    {MAPSEC_ROUTE_114, 3, Landmarks_MeteorFalls},
    {MAPSEC_ROUTE_115, 0, Landmarks_MeteorFalls},
    {MAPSEC_ROUTE_115, 1, Landmarks_MeteorFalls},
    {MAPSEC_ROUTE_116, 1, Landmarks_Route116_1},
    {MAPSEC_ROUTE_116, 2, Landmarks_Route116_2},
    {MAPSEC_ROUTE_117, 2, Landmarks_Route117_2},
    {MAPSEC_ROUTE_119, 1, Landmarks_Route119_1},
    {MAPSEC_ROUTE_120, 0, Landmarks_Route120_0},
    {MAPSEC_ROUTE_120, 2, Landmarks_Route120_2},
    {MAPSEC_ROUTE_121, 2, Landmarks_Route121_2},
    {MAPSEC_ROUTE_122, 0, Landmarks_Route122_0},
    {MAPSEC_ROUTE_123, 0, Landmarks_Route123_0},
    {MAPSEC_ROUTE_122, 1, Landmarks_Route122_0},
    {MAPSEC_ROUTE_124, 7, Landmarks_Route124_7},
    {MAPSEC_ROUTE_125, 2, Landmarks_Route125_2},
    {MAPSEC_ROUTE_128, 1, Landmarks_Route128_1},
    {MAPSEC_ROUTE_131, 1, Landmarks_Route131_1},
    {MAPSEC_ROUTE_132, 0, Landmarks_OceanCurrent},
    {MAPSEC_ROUTE_132, 1, Landmarks_OceanCurrent},
    {MAPSEC_ROUTE_133, 0, Landmarks_OceanCurrent},
    {MAPSEC_ROUTE_133, 1, Landmarks_OceanCurrent},
    {MAPSEC_ROUTE_133, 2, Landmarks_OceanCurrent},
    {MAPSEC_ROUTE_134, 0, Landmarks_OceanCurrent},
    {MAPSEC_ROUTE_134, 1, Landmarks_OceanCurrent},
    {MAPSEC_ROUTE_134, 2, Landmarks_Route134_2},
    {MAPSEC_MT_CHIMNEY, 2, Landmarks_MtChimney_2},
    {MAPSEC_NOTHING, 0, NULL},
};

static const struct Landmark *const *GetLandmarks(u8 mapSection, u8 id);

const u8 *GetLandmarkName(u8 mapSection, u8 id, u8 count)
{
    const struct Landmark *const *landmarks = GetLandmarks(mapSection, id);

    if (!landmarks)
        return NULL;

    while (1)
    {
        const struct Landmark *landmark = *landmarks;

        if (landmark->flag == 0xFFFF || FlagGet(landmark->flag) == TRUE)
        {
            if (count == 0)
                break;
            else
                count--;
        }

        landmarks++;
        if (!*landmarks)
            return NULL;
    }

    return (*landmarks)->name;
}

static const struct Landmark *const *GetLandmarks(u8 mapSection, u8 id)
{
    u16 i = 0;

    for (; gLandmarkLists[i].mapSection != MAPSEC_NOTHING; i++)
    {
        if (gLandmarkLists[i].mapSection > mapSection)
            return NULL;
        if (gLandmarkLists[i].mapSection == mapSection)
            break;
    }

    if (gLandmarkLists[i].mapSection == MAPSEC_NOTHING)
        return NULL;

    for (; gLandmarkLists[i].mapSection == mapSection; i++)
    {
        if (gLandmarkLists[i].id == id)
            return gLandmarkLists[i].landmarks;
    }

    return NULL;
}
