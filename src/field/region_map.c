#include "global.h"
#include "event_data.h"
#include "field_effect.h"
#include "field_specials.h"
#include "m4a.h"
#include "main.h"
#include "map_constants.h"
#include "menu.h"
#include "palette.h"
#include "pokemon_menu.h"
#include "region_map.h"
#include "overworld.h"
#include "secret_base.h"
#include "songs.h"
#include "sprite.h"
#include "strings.h"
#include "string_util.h"
#include "text.h"
#include "trig.h"
#include "ewram.h"

// Map Section IDs
#define MAPSEC_LITTLEROOT_TOWN 0
#define MAPSEC_OLDALE_TOWN 1
#define MAPSEC_DEWFORD_TOWN 2
#define MAPSEC_LAVARIDGE_TOWN 3
#define MAPSEC_FALLARBOR_TOWN 4
#define MAPSEC_VERDANTURF_TOWN 5
#define MAPSEC_PACIFIDLOG_TOWN 6
#define MAPSEC_PETALBURG_CITY 7
#define MAPSEC_SLATEPORT_CITY 8
#define MAPSEC_MAUVILLE_CITY 9
#define MAPSEC_RUSTBORO_CITY 10
#define MAPSEC_FORTREE_CITY 11
#define MAPSEC_LILYCOVE_CITY 12
#define MAPSEC_MOSSDEEP_CITY 13
#define MAPSEC_SOOTOPOLIS_CITY 14
#define MAPSEC_EVER_GRANDE_CITY 15
#define MAPSEC_ROUTE_101 0x10
#define MAPSEC_ROUTE_102 0x11
#define MAPSEC_ROUTE_103 0x12
#define MAPSEC_ROUTE_104 0x13
#define MAPSEC_ROUTE_105 0x14
#define MAPSEC_ROUTE_106 0x15
#define MAPSEC_ROUTE_107 0x16
#define MAPSEC_ROUTE_108 0x17
#define MAPSEC_ROUTE_109 0x18
#define MAPSEC_ROUTE_110 0x19
#define MAPSEC_ROUTE_111 0x1A
#define MAPSEC_ROUTE_112 0x1B
#define MAPSEC_ROUTE_113 0x1C
#define MAPSEC_ROUTE_114 0x1D
#define MAPSEC_ROUTE_115 0x1E
#define MAPSEC_ROUTE_116 0x1F
#define MAPSEC_ROUTE_117 0x20
#define MAPSEC_ROUTE_118 0x21
#define MAPSEC_ROUTE_119 0x22
#define MAPSEC_ROUTE_120 0x23
#define MAPSEC_ROUTE_121 0x24
#define MAPSEC_ROUTE_122 0x25
#define MAPSEC_ROUTE_123 0x26
#define MAPSEC_ROUTE_124 0x27
#define MAPSEC_ROUTE_125 0x28
#define MAPSEC_ROUTE_126 0x29
#define MAPSEC_ROUTE_127 0x2A
#define MAPSEC_ROUTE_128 0x2B
#define MAPSEC_ROUTE_129 0x2C
#define MAPSEC_ROUTE_130 0x2D
#define MAPSEC_ROUTE_131 0x2E
#define MAPSEC_ROUTE_132 0x2F
#define MAPSEC_ROUTE_133 0x30
#define MAPSEC_ROUTE_134 0x31
#define MAPSEC_UNDERWATER1 0x32
#define MAPSEC_UNDERWATER2 0x33
#define MAPSEC_UNDERWATER3 0x34
#define MAPSEC_UNDERWATER4 0x35
#define MAPSEC_UNDERWATER5 0x36
#define MAPSEC_GRANITE_CAVE 0x37
#define MAPSEC_MT_CHIMNEY 0x38
#define MAPSEC_SAFARI_ZONE 0x39
#define MAPSEC_BATTLE_TOWER 0x3A
#define MAPSEC_PETALBURG_WOODS 0x3B
#define MAPSEC_RUSTURF_TUNNEL 0x3C
#define MAPSEC_ABANDONED_SHIP 0x3D
#define MAPSEC_NEW_MAUVILLE 0x3E
#define MAPSEC_METEOR_FALLS_1 0x3F
#define MAPSEC_METEOR_FALLS_2 0x40
#define MAPSEC_MT_PYRE 0x41
#define MAPSEC_EVIL_TEAM_HIDEOUT 0x42
#define MAPSEC_SHOAL_CAVE 0x43
#define MAPSEC_SEAFLOOR_CAVERN 0x44
#define MAPSEC_UNDERWATER6 0x45
#define MAPSEC_VICTORY_ROAD 0x46
#define MAPSEC_MIRAGE_ISLAND 0x47
#define MAPSEC_CAVE_OF_ORIGIN 0x48
#define MAPSEC_SOUTHERN_ISLAND 0x49
#define MAPSEC_FIERY_PATH_1 0x4A
#define MAPSEC_FIERY_PATH_2 0x4B
#define MAPSEC_JAGGED_PASS_1 0x4C
#define MAPSEC_JAGGED_PASS_2 0x4D
#define MAPSEC_SEALED_CHAMBER 0x4E
#define MAPSEC_UNDERWATER7 0x4F
#define MAPSEC_SCORCHED_SLAB 0x50
#define MAPSEC_ISLAND_CAVE 0x51
#define MAPSEC_DESERT_RUINS 0x52
#define MAPSEC_ANCIENT_TOMB 0x53
#define MAPSEC_INSIDE_OF_TRUCK 0x54
#define MAPSEC_SKY_PILLAR 0x55
#define MAPSEC_SECRET_BASE 0x56
#define MAPSEC_UNK_0x57 0x57
#define MAPSEC_NONE 0x58

#define MAP_WIDTH 28
#define MAP_HEIGHT 15
#define MAPCURSOR_X_MIN 1
#define MAPCURSOR_Y_MIN 2
#define MAPCURSOR_X_MAX (MAPCURSOR_X_MIN + MAP_WIDTH - 1)
#define MAPCURSOR_Y_MAX (MAPCURSOR_Y_MIN + MAP_HEIGHT - 1)

// Input events
enum
{
    INPUT_EVENT_NONE,
    INPUT_EVENT_DPAD,
    INPUT_EVENT_2,
    INPUT_EVENT_3,
    INPUT_EVENT_A_BUTTON,
    INPUT_EVENT_B_BUTTON,
};

static EWRAM_DATA struct RegionMap *gRegionMap = NULL;

static const u16 sRegionMapCursor_Pal[] = INCBIN_U16("graphics/pokenav/cursor.gbapal");
static const u8 sRegionMapCursorSmall_ImageLZ[] = INCBIN_U8("graphics/pokenav/cursor_small.4bpp.lz");
static const u8 sRegionMapCursorLarge_ImageLZ[] = INCBIN_U8("graphics/pokenav/cursor_large.4bpp.lz");
static const u16 sRegionMapBrendanIcon_Pal[] = INCBIN_U16("graphics/pokenav/brendan_icon.gbapal");
static const u8 sRegionMapBrendanIcon_Image[] = INCBIN_U8("graphics/pokenav/brendan_icon.4bpp");
static const u16 sRegionMapMayIcon_Pal[] = INCBIN_U16("graphics/pokenav/may_icon.gbapal");
static const u8 sRegionMapMayIcon_Image[] = INCBIN_U8("graphics/pokenav/may_icon.4bpp");
static const u16 sRegionMapBkgnd_Pal[] = INCBIN_U16("graphics/pokenav/region_map.gbapal");
static const u8 sRegionMapBkgnd_ImageLZ[] = INCBIN_U8("graphics/pokenav/region_map.8bpp.lz");
static const u8 sRegionMapBkgnd_TilemapLZ[] = INCBIN_U8("graphics/pokenav/region_map_map.bin.lz");

#include "../data/region_map_layout.h"

#if ENGLISH
#include "../data/region_map_names_en.h"
#elif GERMAN
#include "../data/region_map_names_de.h"
#endif

struct RegionMapLocation
{
    u8 x, y;
    u8 width, height;
    const u8 *regionMapSectionId;
};

const struct RegionMapLocation gRegionMapLocations[] =
{
    { 4, 11, 1, 1, gMapName_LittlerootTown},
    { 4,  9, 1, 1, gMapName_OldaleTown},
    { 2, 14, 1, 1, gMapName_DewfordTown},
    { 5,  3, 1, 1, gMapName_LavaridgeTown},
    { 3,  0, 1, 1, gMapName_FallarborTown},
    { 4,  6, 1, 1, gMapName_VerdanturfTown},
    {17, 10, 1, 1, gMapName_PacifidlogTown},
    { 1,  9, 1, 1, gMapName_PetalburgCity},
    { 8, 10, 1, 2, gMapName_SlateportCity},
    { 8,  6, 2, 1, gMapName_MauvilleCity},
    { 0,  5, 1, 2, gMapName_RustboroCity},
    {12,  0, 1, 1, gMapName_FortreeCity},
    {18,  3, 2, 1, gMapName_LilycoveCity},
    {24,  5, 2, 1, gMapName_MossdeepCity},
    {21,  7, 1, 1, gMapName_SootopolisCity},
    {27,  8, 1, 2, gMapName_EverGrandeCity},
    { 4, 10, 1, 1, gMapName_Route101},
    { 2,  9, 2, 1, gMapName_Route102},
    { 4,  8, 4, 1, gMapName_Route103},
    { 0,  7, 1, 3, gMapName_Route104},
    { 0, 10, 1, 3, gMapName_Route105},
    { 0, 13, 2, 1, gMapName_Route106},
    { 3, 14, 3, 1, gMapName_Route107},
    { 6, 14, 2, 1, gMapName_Route108},
    { 8, 12, 1, 3, gMapName_Route109},
    { 8,  7, 1, 3, gMapName_Route110},
    { 8,  0, 1, 6, gMapName_Route111},
    { 6,  3, 2, 1, gMapName_Route112},
    { 4,  0, 4, 1, gMapName_Route113},
    { 1,  0, 2, 3, gMapName_Route114},
    { 0,  2, 1, 3, gMapName_Route115},
    { 1,  5, 4, 1, gMapName_Route116},
    { 5,  6, 3, 1, gMapName_Route117},
    {10,  6, 2, 1, gMapName_Route118},
    {11,  0, 1, 6, gMapName_Route119},
    {13,  0, 1, 4, gMapName_Route120},
    {14,  3, 4, 1, gMapName_Route121},
    {16,  4, 1, 2, gMapName_Route122},
    {12,  6, 5, 1, gMapName_Route123},
    {20,  3, 4, 3, gMapName_Route124},
    {24,  3, 2, 2, gMapName_Route125},
    {20,  6, 3, 3, gMapName_Route126},
    {23,  6, 3, 3, gMapName_Route127},
    {23,  9, 4, 1, gMapName_Route128},
    {24, 10, 2, 1, gMapName_Route129},
    {21, 10, 3, 1, gMapName_Route130},
    {18, 10, 3, 1, gMapName_Route131},
    {15, 10, 2, 1, gMapName_Route132},
    {12, 10, 3, 1, gMapName_Route133},
    { 9, 10, 3, 1, gMapName_Route134},
    {20,  3, 4, 3, gMapName_Underwater},
    {20,  6, 3, 3, gMapName_Underwater},
    {23,  6, 3, 3, gMapName_Underwater},
    {23,  9, 4, 1, gMapName_Underwater},
    {21,  7, 1, 1, gMapName_Underwater},
    { 1, 13, 1, 1, gMapName_GraniteCave},
    { 6,  2, 1, 1, gMapName_MtChimney},
    {16,  2, 1, 1, gMapName_SafariZone},
    {22, 12, 1, 1, gMapName_BattleTower},
    { 0,  8, 1, 1, gMapName_PetalburgWoods},
    { 2,  5, 1, 1, gMapName_RusturfTunnel},
    { 6, 14, 1, 1, gMapName_AbandonedShip},
    { 8,  7, 1, 1, gMapName_NewMauville},
    { 0,  3, 1, 1, gMapName_MeteorFalls},
    { 1,  2, 1, 1, gMapName_MeteorFalls},
    {16,  4, 1, 1, gMapName_MtPyre},
    {19,  3, 1, 1, gMapName_EvilTeamHideout},
    {24,  4, 1, 1, gMapName_ShoalCave},
    {24,  9, 1, 1, gMapName_SeafloorCavern},
    {24,  9, 1, 1, gMapName_Underwater},
    {27,  9, 1, 1, gMapName_VictoryRoad},
    {17, 10, 1, 1, gMapName_MirageIsland},
    {21,  7, 1, 1, gMapName_CaveOfOrigin},
    {12, 14, 1, 1, gMapName_SouthernIsland},
    { 6,  3, 1, 1, gMapName_FieryPath},
    { 7,  3, 1, 1, gMapName_FieryPath},
    { 6,  3, 1, 1, gMapName_JaggedPass},
    { 7,  2, 1, 1, gMapName_JaggedPass},
    {11, 10, 1, 1, gMapName_SealedChamber},
    {11, 10, 1, 1, gMapName_Underwater},
    {13,  0, 1, 1, gMapName_ScorchedSlab},
    {0,  10, 1, 1, gMapName_IslandCave},
    { 8,  3, 1, 1, gMapName_DesertRuins},
    {13,  2, 1, 1, gMapName_AncientTomb},
    { 0,  0, 1, 1, gMapName_InsideOfTruck},
    {19, 10, 1, 1, gMapName_SkyPillar},
    { 0,  0, 1, 1, gMapName_SecretBase},
    { 0,  0, 1, 1, gMapName_None},
};

static const u16 gUnknown_083E7684[][2] =
{
    {MAPSEC_UNDERWATER1,       MAPSEC_ROUTE_124},
    {MAPSEC_UNDERWATER2,       MAPSEC_ROUTE_126},
    {MAPSEC_UNDERWATER3,       MAPSEC_ROUTE_127},
    {MAPSEC_UNDERWATER4,       MAPSEC_ROUTE_128},
    {MAPSEC_UNDERWATER5,       MAPSEC_SOOTOPOLIS_CITY},
    {MAPSEC_UNDERWATER6,       MAPSEC_ROUTE_128},
    {MAPSEC_EVIL_TEAM_HIDEOUT, MAPSEC_LILYCOVE_CITY},
    {MAPSEC_UNDERWATER7,       MAPSEC_ROUTE_134},
    {MAPSEC_PETALBURG_WOODS,   MAPSEC_ROUTE_104},
    {MAPSEC_JAGGED_PASS_1,     MAPSEC_ROUTE_112},
    {MAPSEC_MT_PYRE,           MAPSEC_ROUTE_122},
    {MAPSEC_SKY_PILLAR,        MAPSEC_ROUTE_131},
    {MAPSEC_NONE,              MAPSEC_NONE},
};

static u8 sub_80FAB78(void);
static u8 _swiopen(void);
static u8 sub_80FAD04(void);
static u8 sub_80FADE4(void);
static void CalcZoomScrollParams(s16, s16, s16, s16, u16, u16, u8);
static void sub_80FB238(s16, s16);
void UpdateRegionMapVideoRegs(void);
static u16 GetRegionMapSectionAt(u16, u16);
static void InitializeCursorPosition(void);
static void sub_80FB600(void);
static u16 sub_80FB758(u16);
static u16 sub_80FB9C0(u16);
static void sub_80FBA18(void);
static bool8 sub_80FBAA0(u16);
void CreateRegionMapCursor(u16, u16);
static void sub_80FBCA0(void);
static void sub_80FBDF8(void);
static void sub_80FBE24(void);
static void SpriteCB_PlayerIconZoomedOut(struct Sprite *);
static void UpdateIconBlink(struct Sprite *);
static void SpriteCB_PlayerIconZoomedIn(struct Sprite *);
const u8 *GetMapSectionName(u8 *, u16, u16);
static void VBlankCB_FlyRegionMap(void);
static void CB2_FlyRegionMap(void);
static void sub_80FC244(void (*func)(void));
static void PrintFlyTargetName(void);
static void CreateFlyTargetGraphics(void);
static void CreateCityTownFlyTargetIcons(void);
static void CreateSpecialAreaFlyTargetIcons(void);
static void SpriteCB_FlyTargetIcons(struct Sprite *);
static void sub_80FC5B4(void);
static void sub_80FC600(void);
static void sub_80FC69C(void);

void InitRegionMap(struct RegionMap *regionMap, bool8 zoomed)
{
    sub_80FA904(regionMap, zoomed);
    while (sub_80FA940())
        ;
}

void sub_80FA904(struct RegionMap *regionMap, bool8 zoomed)
{
    gRegionMap = regionMap;
    gRegionMap->initStep = 0;
    gRegionMap->zoomed = zoomed;
    gRegionMap->inputCallback = (zoomed == 0) ? sub_80FAB78 : sub_80FAD04;
}

bool8 sub_80FA940(void)
{
    switch (gRegionMap->initStep)
    {
    case 0:
        LZ77UnCompVram(sRegionMapBkgnd_ImageLZ, (void *)(VRAM + 0x8000));
        break;
    case 1:
        LZ77UnCompVram(sRegionMapBkgnd_TilemapLZ, (void *)(VRAM + 0xE000));
        break;
    case 2:
        LoadPalette(sRegionMapBkgnd_Pal, 0x70, 0x60);  // Why isn't this the right size?
        break;
    case 3:
        LZ77UnCompWram(sRegionMapCursorSmall_ImageLZ, gRegionMap->cursorSmallImage);
        break;
    case 4:
        LZ77UnCompWram(sRegionMapCursorLarge_ImageLZ, gRegionMap->cursorLargeImage);
        break;
    case 5:
        InitializeCursorPosition();
        gRegionMap->unk74 = gRegionMap->cursorPosX;
        gRegionMap->unk76 = gRegionMap->cursorPosY;
        gRegionMap->unk16 = sub_80FB758(gRegionMap->mapSecId);
        gRegionMap->mapSecId = sub_80FB9C0(gRegionMap->mapSecId);
        GetMapSectionName(gRegionMap->mapSecName, gRegionMap->mapSecId, 16);
        break;
    case 6:
        if (gRegionMap->zoomed == FALSE)
        {
            CalcZoomScrollParams(0, 0, 0, 0, 0x100, 0x100, 0);
        }
        else
        {
            gRegionMap->scrollX = gRegionMap->cursorPosX * 8 - 52;
            gRegionMap->scrollY = gRegionMap->cursorPosY * 8 - 68;
            gRegionMap->unk64 = gRegionMap->cursorPosX;
            gRegionMap->unk66 = gRegionMap->cursorPosY;
            CalcZoomScrollParams(gRegionMap->scrollX, gRegionMap->scrollY, 0x38, 0x48, 0x80, 0x80, 0);
        }
        break;
    case 7:
        sub_80FBA18();
        UpdateRegionMapVideoRegs();
        gRegionMap->cursorSprite = NULL;
        gRegionMap->playerIconSprite = NULL;
        gRegionMap->unk7A = 0;
        gRegionMap->blinkPlayerIcon = FALSE;
        REG_BG2CNT = 0xBC8A;
        gRegionMap->initStep++;
    default:
        return FALSE;
    }
    gRegionMap->initStep++;
    return TRUE;
}

void FreeRegionMapIconResources(void)
{
    if (gRegionMap->cursorSprite != NULL)
    {
        DestroySprite(gRegionMap->cursorSprite);
        FreeSpriteTilesByTag(gRegionMap->cursorTileTag);
        FreeSpritePaletteByTag(gRegionMap->cursorPaletteTag);
    }
    if (gRegionMap->playerIconSprite != NULL)
    {
        DestroySprite(gRegionMap->playerIconSprite);
        FreeSpriteTilesByTag(gRegionMap->playerIconTileTag);
        FreeSpritePaletteByTag(gRegionMap->playerIconPaletteTag);
    }
}

u8 sub_80FAB60(void)
{
    return gRegionMap->inputCallback();
}

static u8 sub_80FAB78(void)
{
    u8 event = INPUT_EVENT_NONE;

    gRegionMap->cursorDeltaX = 0;
    gRegionMap->cursorDeltaY = 0;
    if ((gMain.heldKeys & DPAD_UP) && gRegionMap->cursorPosY > MAPCURSOR_Y_MIN)
    {
        gRegionMap->cursorDeltaY = -1;
        event = INPUT_EVENT_DPAD;
    }
    if ((gMain.heldKeys & DPAD_DOWN) && gRegionMap->cursorPosY < MAPCURSOR_Y_MAX)
    {
        gRegionMap->cursorDeltaY = 1;
        event = INPUT_EVENT_DPAD;
    }
    if ((gMain.heldKeys & DPAD_LEFT) && gRegionMap->cursorPosX > MAPCURSOR_X_MIN)
    {
        gRegionMap->cursorDeltaX = -1;
        event = INPUT_EVENT_DPAD;
    }
    if ((gMain.heldKeys & DPAD_RIGHT) && gRegionMap->cursorPosX < MAPCURSOR_X_MAX)
    {
        gRegionMap->cursorDeltaX = 1;
        event = INPUT_EVENT_DPAD;
    }

    if (gMain.newKeys & A_BUTTON)
        event = INPUT_EVENT_A_BUTTON;
    else if (gMain.newKeys & B_BUTTON)
        event = INPUT_EVENT_B_BUTTON;

    if (event == INPUT_EVENT_DPAD)
    {
        gRegionMap->unk7A = 4;
        gRegionMap->inputCallback = _swiopen;
    }
    return event;
}

static u8 _swiopen(void)
{
    u16 mapSecId;

    if (gRegionMap->unk7A != 0)
        return INPUT_EVENT_2;

    if (gRegionMap->cursorDeltaX > 0)
        gRegionMap->cursorPosX++;

    if (gRegionMap->cursorDeltaX < 0)
        gRegionMap->cursorPosX--;

    if (gRegionMap->cursorDeltaY > 0)
        gRegionMap->cursorPosY++;

    if (gRegionMap->cursorDeltaY < 0)
        gRegionMap->cursorPosY--;

    mapSecId = GetRegionMapSectionAt(gRegionMap->cursorPosX, gRegionMap->cursorPosY);
    gRegionMap->unk16 = sub_80FB758(mapSecId);
    if (mapSecId != gRegionMap->mapSecId)
    {
        gRegionMap->mapSecId = mapSecId;
        GetMapSectionName(gRegionMap->mapSecName, gRegionMap->mapSecId, 16);
    }
    sub_80FBA18();
    gRegionMap->inputCallback = sub_80FAB78;
    return INPUT_EVENT_3;
}

static u8 sub_80FAD04(void)
{
    u8 event = INPUT_EVENT_NONE;

    gRegionMap->unk6A = 0;
    gRegionMap->unk68 = 0;
    if ((gMain.heldKeys & DPAD_UP) && gRegionMap->scrollY > -52)
    {
        gRegionMap->unk68 = -1;
        event = INPUT_EVENT_DPAD;
    }
    if ((gMain.heldKeys & DPAD_DOWN) && gRegionMap->scrollY < 60)
    {
        gRegionMap->unk68 = 1;
        event = INPUT_EVENT_DPAD;
    }
    if ((gMain.heldKeys & DPAD_LEFT) && gRegionMap->scrollX > -44)
    {
        gRegionMap->unk6A = -1;
        event = INPUT_EVENT_DPAD;
    }
    if ((gMain.heldKeys & DPAD_RIGHT) && gRegionMap->scrollX < 172)
    {
        gRegionMap->unk6A = 1;
        event = INPUT_EVENT_DPAD;
    }

    if (gMain.newKeys & A_BUTTON)
        event = INPUT_EVENT_A_BUTTON;
    if (gMain.newKeys & B_BUTTON)
        event = INPUT_EVENT_B_BUTTON;

    if (event == INPUT_EVENT_DPAD)
    {
        gRegionMap->inputCallback = sub_80FADE4;
        gRegionMap->unk6C = 0;
    }
    return event;
}

static u8 sub_80FADE4(void)
{
    gRegionMap->scrollY += gRegionMap->unk68;
    gRegionMap->scrollX += gRegionMap->unk6A;
    sub_80FB238(gRegionMap->scrollX, gRegionMap->scrollY);
    gRegionMap->unk6C++;
    if (gRegionMap->unk6C == 8)
    {
        u16 r3 = (gRegionMap->scrollX + 44) / 8 + 1;
        u16 r1 = (gRegionMap->scrollY + 52) / 8 + 2;

        if (r3 != gRegionMap->unk64 || r1 != gRegionMap->unk66)
        {
            u16 mapSecId;

            gRegionMap->unk64 = r3;
            gRegionMap->unk66 = r1;
            mapSecId = GetRegionMapSectionAt(r3, r1);
            gRegionMap->unk16 = sub_80FB758(mapSecId);
            if (mapSecId != gRegionMap->mapSecId)
            {
                gRegionMap->mapSecId = mapSecId;
                GetMapSectionName(gRegionMap->mapSecName, gRegionMap->mapSecId, 16);
            }
            sub_80FBA18();
        }
        gRegionMap->unk6C = 0;
        gRegionMap->inputCallback = sub_80FAD04;
        return INPUT_EVENT_3;
    }
    return INPUT_EVENT_2;
}

void sub_80FAEC4(void)
{
    if (gRegionMap->zoomed == FALSE)
    {
        gRegionMap->scrollY = 0;
        gRegionMap->scrollX = 0;
        gRegionMap->unk40 = 0;
        gRegionMap->unk3C = 0;
        gRegionMap->unk60 = gRegionMap->cursorPosX * 8 - 52;
        gRegionMap->unk62 = gRegionMap->cursorPosY * 8 - 68;
        gRegionMap->unk44 = (gRegionMap->unk60 << 8) / 16;
        gRegionMap->unk48 = (gRegionMap->unk62 << 8) / 16;
        gRegionMap->unk64 = gRegionMap->cursorPosX;
        gRegionMap->unk66 = gRegionMap->cursorPosY;
        gRegionMap->unk4C = (256 << 8);
        gRegionMap->unk50 = -0x800;
    }
    else
    {
        gRegionMap->unk3C = gRegionMap->scrollX * 256;
        gRegionMap->unk40 = gRegionMap->scrollY * 256;
        gRegionMap->unk60 = 0;
        gRegionMap->unk62 = 0;
        gRegionMap->unk44 = -(gRegionMap->unk3C / 16);
        gRegionMap->unk48 = -(gRegionMap->unk40 / 16);
        gRegionMap->cursorPosX = gRegionMap->unk64;
        gRegionMap->cursorPosY = gRegionMap->unk66;
        gRegionMap->unk4C = (128 << 8);
        gRegionMap->unk50 = 0x800;
    }
    gRegionMap->unk6E = 0;
    sub_80FBCA0();
    sub_80FBDF8();
}

u8 sub_80FAFC0(void)
{
    u8 r4;

    if (gRegionMap->unk6E >= 16)
        return 0;
    gRegionMap->unk6E++;
    if (gRegionMap->unk6E == 16)
    {
        gRegionMap->unk44 = 0;
        gRegionMap->unk48 = 0;
        gRegionMap->scrollX = gRegionMap->unk60;
        gRegionMap->scrollY = gRegionMap->unk62;
        gRegionMap->unk4C = (gRegionMap->zoomed == FALSE) ? (128 << 8) : (256 << 8);
        gRegionMap->zoomed = !gRegionMap->zoomed;
        gRegionMap->inputCallback = (gRegionMap->zoomed == FALSE) ? sub_80FAB78 : sub_80FAD04;
        CreateRegionMapCursor(gRegionMap->cursorTileTag, gRegionMap->cursorPaletteTag);
        sub_80FBE24();
        r4 = 0;
    }
    else
    {
        gRegionMap->unk3C += gRegionMap->unk44;
        gRegionMap->unk40 += gRegionMap->unk48;
        gRegionMap->scrollX = gRegionMap->unk3C >> 8;
        gRegionMap->scrollY = gRegionMap->unk40 >> 8;
        gRegionMap->unk4C += gRegionMap->unk50;
        if ((gRegionMap->unk44 < 0 && gRegionMap->scrollX < gRegionMap->unk60)
         || (gRegionMap->unk44 > 0 && gRegionMap->scrollX > gRegionMap->unk60))
        {
            gRegionMap->scrollX = gRegionMap->unk60;
            gRegionMap->unk44 = 0;
        }
        if ((gRegionMap->unk48 < 0 && gRegionMap->scrollY < gRegionMap->unk62)
         || (gRegionMap->unk48 > 0 && gRegionMap->scrollY > gRegionMap->unk62))
        {
            gRegionMap->scrollY = gRegionMap->unk62;
            gRegionMap->unk48 = 0;
        }
        if (gRegionMap->zoomed == FALSE)
        {
            if (gRegionMap->unk4C < (128 << 8))
            {
                gRegionMap->unk4C = (128 << 8);
                gRegionMap->unk50 = 0;
            }
        }
        else
        {
            if (gRegionMap->unk4C > (256 << 8))
            {
                gRegionMap->unk4C = (256 << 8);
                gRegionMap->unk50 = 0;
            }
        }
        r4 = 1;
    }
    CalcZoomScrollParams(gRegionMap->scrollX, gRegionMap->scrollY, 0x38, 0x48, gRegionMap->unk4C >> 8, gRegionMap->unk4C >> 8, 0);
    return r4;
}

static void CalcZoomScrollParams(s16 a, s16 b, s16 c, s16 d, u16 e, u16 f, u8 rotation)
{
    s32 var1;
    s32 var2;
    s32 var3;
    s32 var4;

    gRegionMap->unk2C = e * gSineTable[rotation + 64] >> 8;
    gRegionMap->unk30 = e * -gSineTable[rotation] >> 8;
    gRegionMap->unk34 = f * gSineTable[rotation] >> 8;
    gRegionMap->unk38 = f * gSineTable[rotation + 64] >> 8;

    var1 = (a << 8) + (c << 8);
    var2 = d * gRegionMap->unk34 + gRegionMap->unk2C * c;
    gRegionMap->bg2x = var1 - var2;

    var3 = (b << 8) + (d << 8);
    var4 = gRegionMap->unk38 * d + gRegionMap->unk30 * c;
    gRegionMap->bg2y = var3 - var4;

    gRegionMap->needUpdateVideoRegs = TRUE;
}

static void sub_80FB238(s16 x, s16 y)
{
    gRegionMap->bg2x = (0x1C << 8) + (x << 8);
    gRegionMap->bg2y = (0x24 << 8) + (y << 8);
    gRegionMap->needUpdateVideoRegs = TRUE;
}

void UpdateRegionMapVideoRegs(void)
{
    if (gRegionMap->needUpdateVideoRegs)
    {
        REG_BG2PA = gRegionMap->unk2C;
        REG_BG2PB = gRegionMap->unk34;
        REG_BG2PC = gRegionMap->unk30;
        REG_BG2PD = gRegionMap->unk38;
        REG_BG2X = gRegionMap->bg2x;
        REG_BG2Y = gRegionMap->bg2y;
        gRegionMap->needUpdateVideoRegs = FALSE;
    }
}

void sub_80FB2A4(s16 a, s16 b)
{
    CalcZoomScrollParams(a, b, 0x38, 0x48, 0x100, 0x100, 0);
    UpdateRegionMapVideoRegs();
    if (gRegionMap->playerIconSprite != NULL)
    {
        gRegionMap->playerIconSprite->pos2.x = -a;
        gRegionMap->playerIconSprite->pos2.y = -b;
    }
}

static u16 GetRegionMapSectionAt(u16 x, u16 y)
{
    if (y < MAPCURSOR_Y_MIN || y > MAPCURSOR_Y_MAX || x < MAPCURSOR_X_MIN || x > MAPCURSOR_X_MAX)
        return MAPSEC_NONE;
    y -= MAPCURSOR_Y_MIN;
    x -= MAPCURSOR_X_MIN;
    return sRegionMapLayout[x + y * 28];
}

static void InitializeCursorPosition(void)
{
    struct MapHeader *mapHeader;
    u16 mapWidth;
    u16 mapHeight;
    u16 x;
    u16 y;
    u16 r1;
    u16 r9;

    if (gSaveBlock1.location.mapGroup == 25
     && (gSaveBlock1.location.mapNum == MAP_ID_SS_TIDAL_CORRIDOR
      || gSaveBlock1.location.mapNum == MAP_ID_SS_TIDAL_LOWER_DECK
      || gSaveBlock1.location.mapNum == MAP_ID_SS_TIDAL_ROOMS))
    {
        sub_80FB600();
        return;
    }

    switch (GetMapTypeByGroupAndId(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum) - 1)
    {
    default:
    case 0:
    case 1:
    case 2:
    case 4:
    case 5:
        gRegionMap->mapSecId = gMapHeader.regionMapSectionId;
        gRegionMap->playerIsInCave = FALSE;
        mapWidth = gMapHeader.mapData->width;
        mapHeight = gMapHeader.mapData->height;
        x = gSaveBlock1.pos.x;
        y = gSaveBlock1.pos.y;
        if (gRegionMap->mapSecId == MAPSEC_UNDERWATER6)
            gRegionMap->playerIsInCave = TRUE;
        break;
    case 3:
    case 6:
        mapHeader = Overworld_GetMapHeaderByGroupAndId(gSaveBlock1.warp4.mapGroup, gSaveBlock1.warp4.mapNum);
        gRegionMap->mapSecId = mapHeader->regionMapSectionId;
        gRegionMap->playerIsInCave = TRUE;
        mapWidth = mapHeader->mapData->width;
        mapHeight = mapHeader->mapData->height;
        x = gSaveBlock1.warp4.x;
        y = gSaveBlock1.warp4.y;
        break;
    case 8:
        mapHeader = Overworld_GetMapHeaderByGroupAndId(gSaveBlock1.warp2.mapGroup, gSaveBlock1.warp2.mapNum);
        gRegionMap->mapSecId = mapHeader->regionMapSectionId;
        gRegionMap->playerIsInCave = TRUE;
        mapWidth = mapHeader->mapData->width;
        mapHeight = mapHeader->mapData->height;
        x = gSaveBlock1.warp2.x;
        y = gSaveBlock1.warp2.y;
        break;
    case 7:
        {
            struct WarpData *r4;

            gRegionMap->mapSecId = gMapHeader.regionMapSectionId;
            if (gRegionMap->mapSecId != MAPSEC_UNK_0x57)
            {
                r4 = &gSaveBlock1.warp4;
                mapHeader = Overworld_GetMapHeaderByGroupAndId(r4->mapGroup, r4->mapNum);
            }
            else
            {
                r4 = &gSaveBlock1.warp2;
                mapHeader = Overworld_GetMapHeaderByGroupAndId(r4->mapGroup, r4->mapNum);
                gRegionMap->mapSecId = mapHeader->regionMapSectionId;
            }
            gRegionMap->playerIsInCave = FALSE;
            mapWidth = mapHeader->mapData->width;
            mapHeight = mapHeader->mapData->height;
            x = r4->x;
            y = r4->y;
        }
        break;
    }

    r9 = x;

    r1 = mapWidth / gRegionMapLocations[gRegionMap->mapSecId].width;
    if (r1 == 0)
        r1 = 1;
    x /= r1;
    if (x >= gRegionMapLocations[gRegionMap->mapSecId].width)
        x = gRegionMapLocations[gRegionMap->mapSecId].width - 1;

    r1 = mapHeight / gRegionMapLocations[gRegionMap->mapSecId].height;
    if (r1 == 0)
        r1 = 1;
    y /= r1;
    if (y >= gRegionMapLocations[gRegionMap->mapSecId].height)
        y = gRegionMapLocations[gRegionMap->mapSecId].height - 1;

    switch (gRegionMap->mapSecId)
    {
    case MAPSEC_ROUTE_114:
        if (y != 0)
            x = 0;
        break;
    case MAPSEC_ROUTE_126:
    case MAPSEC_UNDERWATER2:
        x = 0;
        if (gSaveBlock1.pos.x > 32)
            x = 1;
        if (gSaveBlock1.pos.x > 0x33)
            x++;
        y = 0;
        if (gSaveBlock1.pos.y > 0x25)
            y = 1;
        if (gSaveBlock1.pos.y > 0x38)
            y++;
        break;
    case MAPSEC_ROUTE_121:
        x = 0;
        if (r9 > 14)
            x = 1;
        if (r9 > 0x1C)
            x++;
        if (r9 > 0x36)
            x++;
        break;
    }
    gRegionMap->cursorPosX = gRegionMapLocations[gRegionMap->mapSecId].x + x + MAPCURSOR_X_MIN;
    gRegionMap->cursorPosY = gRegionMapLocations[gRegionMap->mapSecId].y + y + MAPCURSOR_Y_MIN;
}

static void sub_80FB600(void)
{
    u16 y = 0;
    u16 x = 0;
    u8 mapGroup;
    u8 mapNum;
    s16 sp2;
    s16 sp4;

    switch (GetSSTidalLocation(&mapGroup, &mapNum, &sp2, &sp4))
    {
    case 1:
        gRegionMap->mapSecId = MAPSEC_SLATEPORT_CITY;
        break;
    case 2:
        gRegionMap->mapSecId = MAPSEC_LILYCOVE_CITY;
        break;
    case 3:
        gRegionMap->mapSecId = MAPSEC_ROUTE_124;
        break;
    case 4:
        gRegionMap->mapSecId = MAPSEC_ROUTE_131;
        break;
    default:
    case 0:
        {
            struct MapHeader *mapHeader = Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum);
            u16 r1;

            gRegionMap->mapSecId = mapHeader->regionMapSectionId;
            r1 = mapHeader->mapData->width / gRegionMapLocations[gRegionMap->mapSecId].width;
            if (r1 == 0)
                r1 = 1;
            x = sp2 / r1;
            if (x >= gRegionMapLocations[gRegionMap->mapSecId].width)
                x = gRegionMapLocations[gRegionMap->mapSecId].width - 1;

            r1 = mapHeader->mapData->height / gRegionMapLocations[gRegionMap->mapSecId].height;
            if (r1 == 0)
                r1 = 1;
            y = sp4 / r1;
            if (y >= gRegionMapLocations[gRegionMap->mapSecId].height)
                y = gRegionMapLocations[gRegionMap->mapSecId].height - 1;
        }
        break;
    }
    gRegionMap->playerIsInCave = FALSE;
    gRegionMap->cursorPosX = gRegionMapLocations[gRegionMap->mapSecId].x + x + MAPCURSOR_X_MIN;
    gRegionMap->cursorPosY = gRegionMapLocations[gRegionMap->mapSecId].y + y + MAPCURSOR_Y_MIN;
}

static u16 sub_80FB758(u16 mapSecId)
{
    switch (mapSecId)
    {
    case MAPSEC_NONE:
        return 0;
    case MAPSEC_LITTLEROOT_TOWN:
        return FlagGet(FLAG_VISITED_LITTLEROOT_TOWN) ? 2 : 3;
    case MAPSEC_OLDALE_TOWN:
        return FlagGet(FLAG_VISITED_OLDALE_TOWN) ? 2 : 3;
    case MAPSEC_DEWFORD_TOWN:
        return FlagGet(FLAG_VISITED_DEWFORD_TOWN) ? 2 : 3;
    case MAPSEC_LAVARIDGE_TOWN:
        return FlagGet(FLAG_VISITED_LAVARIDGE_TOWN) ? 2 : 3;
    case MAPSEC_FALLARBOR_TOWN:
        return FlagGet(FLAG_VISITED_FALLARBOR_TOWN) ? 2 : 3;
    case MAPSEC_VERDANTURF_TOWN:
        return FlagGet(FLAG_VISITED_VERDANTURF_TOWN) ? 2 : 3;
    case MAPSEC_PACIFIDLOG_TOWN:
        return FlagGet(FLAG_VISITED_PACIFIDLOG_TOWN) ? 2 : 3;
    case MAPSEC_PETALBURG_CITY:
        return FlagGet(FLAG_VISITED_PETALBURG_CITY) ? 2 : 3;
    case MAPSEC_SLATEPORT_CITY:
        return FlagGet(FLAG_VISITED_SLATEPORT_CITY) ? 2 : 3;
    case MAPSEC_MAUVILLE_CITY:
        return FlagGet(FLAG_VISITED_MAUVILLE_CITY) ? 2 : 3;
    case MAPSEC_RUSTBORO_CITY:
        return FlagGet(FLAG_VISITED_RUSTBORO_CITY) ? 2 : 3;
    case MAPSEC_FORTREE_CITY:
        return FlagGet(FLAG_VISITED_FORTREE_CITY) ? 2 : 3;
    case MAPSEC_LILYCOVE_CITY:
        return FlagGet(FLAG_VISITED_LILYCOVE_CITY) ? 2 : 3;
    case MAPSEC_MOSSDEEP_CITY:
        return FlagGet(FLAG_VISITED_MOSSDEEP_CITY) ? 2 : 3;
    case MAPSEC_SOOTOPOLIS_CITY:
        return FlagGet(FLAG_VISITED_SOOTOPOLIS_CITY) ? 2 : 3;
    case MAPSEC_EVER_GRANDE_CITY:
        return FlagGet(FLAG_VISITED_EVER_GRANDE_CITY) ? 2 : 3;

    case MAPSEC_BATTLE_TOWER:
        return FlagGet(FLAG_UNLOCK_BATTLE_TOWER) ? 4 : 0;
    case MAPSEC_SOUTHERN_ISLAND:
        return FlagGet(FLAG_UNLOCK_SOUTHERN_ISLAND) ? 1 : 0;
    default:
        return 1;
    }
}

u16 GetRegionMapSectionAt_(u16 x, u16 y)
{
    return GetRegionMapSectionAt(x, y);
}

static u16 sub_80FB9C0(u16 mapSecId)
{
    u16 i;

    for (i = 0; gUnknown_083E7684[i][0] != MAPSEC_NONE; i++)
    {
        if (gUnknown_083E7684[i][0] == mapSecId)
            return gUnknown_083E7684[i][1];
    }
    return mapSecId;
}

u16 sub_80FBA04(u16 mapSecId)
{
    return sub_80FB9C0(mapSecId);
}

static void sub_80FBA18(void)
{
    u16 x;
    u16 y;
    u16 i;

    if (gRegionMap->mapSecId == MAPSEC_NONE)
    {
        gRegionMap->everGrandeCityArea = 0;
        return;
    }

    if (gRegionMap->zoomed == FALSE)
    {
        x = gRegionMap->cursorPosX;
        y = gRegionMap->cursorPosY;
    }
    else
    {
        x = gRegionMap->unk64;
        y = gRegionMap->unk66;
    }

    i = 0;
    while (1)
    {
        if (x <= 1)
        {
            if (sub_80FBAA0(y))
            {
                y--;
                x = 0x1D;
            }
            else
            {
                break;
            }
        }
        else
        {
            x--;
            if (GetRegionMapSectionAt(x, y) == gRegionMap->mapSecId)
                i++;
        }
    }

    gRegionMap->everGrandeCityArea = i;
}

static bool8 sub_80FBAA0(u16 a)
{
    u16 x;
    u16 y;

    y = a - 1;
    if (y == 0xFFFF)
        return FALSE;

    for (x = MAPCURSOR_X_MIN; x <= MAPCURSOR_X_MAX; x++)
    {
        if (GetRegionMapSectionAt(x, y) == gRegionMap->mapSecId)
            return TRUE;
    }
    return FALSE;
}

static const struct OamData sCursorOamData =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sCursorAnimSeq0[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sCursorAnimSeq1[] =
{
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_FRAME(16, 10),
    ANIMCMD_FRAME(32, 10),
    ANIMCMD_FRAME(16, 10),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sCursorAnimTable[] =
{
    sCursorAnimSeq0,
    sCursorAnimSeq1,
};

static void SpriteCB_Cursor(struct Sprite *sprite)
{
    if (gRegionMap->unk7A != 0)
    {
        sprite->pos1.x += gRegionMap->cursorDeltaX * 2;
        sprite->pos1.y += gRegionMap->cursorDeltaY * 2;
        gRegionMap->unk7A--;
    }
}

static void nullsub_66(struct Sprite *sprite)
{
}

void CreateRegionMapCursor(u16 tileTag, u16 paletteTag)
{
    u8 spriteId;
    struct SpriteSheet spriteSheet;
    struct SpritePalette spritePalette =
    {
        .data = sRegionMapCursor_Pal,
    };
    struct SpriteTemplate spriteTemplate =
    {
        .oam = &sCursorOamData,
        .anims = sCursorAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_Cursor,
    };

    spriteSheet.tag = tileTag;
    spriteTemplate.tileTag = tileTag;
    gRegionMap->cursorTileTag = tileTag;

    spritePalette.tag = paletteTag;
    spriteTemplate.paletteTag = paletteTag;
    gRegionMap->cursorPaletteTag = paletteTag;

    if (gRegionMap->zoomed == FALSE)
    {
        spriteSheet.data = gRegionMap->cursorSmallImage;
        spriteSheet.size = 0x100;
        spriteTemplate.callback = SpriteCB_Cursor;
    }
    else
    {
        spriteSheet.data = gRegionMap->cursorLargeImage;
        spriteSheet.size = 0x600;
        spriteTemplate.callback = nullsub_66;
    }
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&spriteTemplate, 0x38, 0x48, 0);
    if (spriteId != 64)
    {
        gRegionMap->cursorSprite = &gSprites[spriteId];
        if (gRegionMap->zoomed == TRUE)
        {
            gRegionMap->cursorSprite->oam.size = 2;
            gRegionMap->cursorSprite->pos1.x -= 8;
            gRegionMap->cursorSprite->pos1.y -= 8;
            StartSpriteAnim(gRegionMap->cursorSprite, 1);
        }
        else
        {
            gRegionMap->cursorSprite->oam.size = 1;
            gRegionMap->cursorSprite->pos1.x = gRegionMap->cursorPosX * 8 + 4;
            gRegionMap->cursorSprite->pos1.y = gRegionMap->cursorPosY * 8 + 4;
        }
        gRegionMap->cursorSprite->data1 = 2;
        gRegionMap->cursorSprite->data2 = IndexOfSpritePaletteTag(paletteTag) * 16 + 0x0101;
        gRegionMap->cursorSprite->data3 = 1;
    }
}

static void sub_80FBCA0(void)
{
    if (gRegionMap->cursorSprite != NULL)
    {
        DestroySprite(gRegionMap->cursorSprite);
        FreeSpriteTilesByTag(gRegionMap->cursorTileTag);
        FreeSpritePaletteByTag(gRegionMap->cursorPaletteTag);
    }
}

void unref_sub_80FBCD0(void)
{
    gRegionMap->cursorSprite->data3 = 1;
}

void unref_sub_80FBCE0(void)
{
    gRegionMap->cursorSprite->data3 = 0;
}

static const struct OamData sPlayerIconOamData =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sPlayerIconAnimSeq0[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

static const union AnimCmd *const sPlayerIconAnimTable[] =
{
    sPlayerIconAnimSeq0,
};

void CreateRegionMapPlayerIcon(u16 tileTag, u16 paletteTag)
{
    u8 spriteId;
    struct SpriteSheet playerIconSpriteSheet =
    {
        .data = sRegionMapBrendanIcon_Image,
        .size = 128,
        .tag = tileTag,
    };
    struct SpritePalette playerIconSpritePalette =
    {
        .data = sRegionMapBrendanIcon_Pal,
        .tag = paletteTag,
    };
    struct SpriteTemplate playerIconSpriteTemplate =
    {
        .tileTag = tileTag,
        .paletteTag = paletteTag,
        .oam = &sPlayerIconOamData,
        .anims = sPlayerIconAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };

    if (gSaveBlock2.playerGender == FEMALE)
    {
        playerIconSpriteSheet.data = sRegionMapMayIcon_Image;
        playerIconSpritePalette.data = sRegionMapMayIcon_Pal;
    }
    LoadSpriteSheet(&playerIconSpriteSheet);
    LoadSpritePalette(&playerIconSpritePalette);
    spriteId = CreateSprite(&playerIconSpriteTemplate, 0, 0, 1);
    gRegionMap->playerIconSprite = &gSprites[spriteId];
    if (gRegionMap->zoomed == FALSE)
    {
        gRegionMap->playerIconSprite->pos1.x = gRegionMap->unk74 * 8 + 4;
        gRegionMap->playerIconSprite->pos1.y = gRegionMap->unk76 * 8 + 4;
        gRegionMap->playerIconSprite->callback = SpriteCB_PlayerIconZoomedOut;
    }
    else
    {
        gRegionMap->playerIconSprite->pos1.x = gRegionMap->unk74 * 16 - 48;
        gRegionMap->playerIconSprite->pos1.y = gRegionMap->unk76 * 16 - 66;
        gRegionMap->playerIconSprite->callback = SpriteCB_PlayerIconZoomedIn;
    }
}

static void sub_80FBDF8(void)
{
    if (gRegionMap->playerIconSprite != NULL)
    {
        gRegionMap->playerIconSprite->invisible = TRUE;
        gRegionMap->playerIconSprite->callback = SpriteCallbackDummy;
    }
}

static void sub_80FBE24(void)
{
    if (gRegionMap->playerIconSprite != NULL)
    {
        if (gRegionMap->zoomed == TRUE)
        {
            gRegionMap->playerIconSprite->pos1.x = gRegionMap->unk74 * 16 - 48;
            gRegionMap->playerIconSprite->pos1.y = gRegionMap->unk76 * 16 - 66;
            gRegionMap->playerIconSprite->callback = SpriteCB_PlayerIconZoomedIn;
            gRegionMap->playerIconSprite->invisible = FALSE;
        }
        else
        {
            gRegionMap->playerIconSprite->pos1.x = gRegionMap->unk74 * 8 + 4;
            gRegionMap->playerIconSprite->pos1.y = gRegionMap->unk76 * 8 + 4;
            gRegionMap->playerIconSprite->pos2.x = 0;
            gRegionMap->playerIconSprite->pos2.y = 0;
            gRegionMap->playerIconSprite->callback = SpriteCB_PlayerIconZoomedOut;
            gRegionMap->playerIconSprite->invisible = FALSE;
        }
    }
}

static void SpriteCB_PlayerIconZoomedIn(struct Sprite *sprite)
{
    sprite->pos2.x = -(gRegionMap->scrollX * 2);
    sprite->pos2.y = -(gRegionMap->scrollY * 2);
    sprite->data0 = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY;
    sprite->data1 = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX;

    // Determine if sprite is on screen
    if (sprite->data0 < -8 || sprite->data0 > 0xA8 || sprite->data1 < -8 || sprite->data1 > 0xF8)
        sprite->data2 = FALSE;
    else
        sprite->data2 = TRUE;

    if (sprite->data2 == TRUE)
        UpdateIconBlink(sprite);
    else
        sprite->invisible = TRUE;
}

static void SpriteCB_PlayerIconZoomedOut(struct Sprite *sprite)
{
    UpdateIconBlink(sprite);
}

static void UpdateIconBlink(struct Sprite *sprite)
{
    if (gRegionMap->blinkPlayerIcon)
    {
        // Toggle visibility every 16 frames
        sprite->data7++;
        if (sprite->data7 > 16)
        {
            sprite->data7 = 0;
            sprite->invisible = !sprite->invisible;
        }
    }
    else
    {
        sprite->invisible = FALSE;
    }
}

void sub_80FBF94(void)
{
    if (gRegionMap->playerIsInCave)
        gRegionMap->blinkPlayerIcon = TRUE;
}

const u8 *GetMapSectionName(u8 *dest, u16 mapSecId, u16 length)
{
    if (mapSecId == MAPSEC_SECRET_BASE)
        return GetSecretBaseMapName(dest);
    if (mapSecId < MAPSEC_NONE)
        return StringCopy(dest, gRegionMapLocations[mapSecId].regionMapSectionId);
    if (length == 0)
        length = 18;
    return StringFill(dest, CHAR_SPACE, length);
}

const u8 *CopyMapName(u8 *dest, u16 mapSecId)
{
    switch (mapSecId)
    {
    case MAPSEC_UNK_0x57:
        return StringCopy(dest, gOtherText_Ferry);
    case MAPSEC_SECRET_BASE:
        return StringCopy(dest, gOtherText_SecretBase);
    default:
        return GetMapSectionName(dest, mapSecId, 0);
    }
}

const u8 *CopyLocationName(u8 *dest, u16 mapSecId)
{
    if (mapSecId == MAPSEC_EVIL_TEAM_HIDEOUT)
        return StringCopy(dest, gOtherText_Hideout);
    else
        return CopyMapName(dest, mapSecId);
}

static void GetRegionMapLocationPosition(u16 mapSecId, u16 *x, u16 *y, u16 *width, u16 *height)
{
    *x = gRegionMapLocations[mapSecId].x;
    *y = gRegionMapLocations[mapSecId].y;
    *width = gRegionMapLocations[mapSecId].width;
    *height = gRegionMapLocations[mapSecId].height;
}

struct UnknownStruct3
{
    void (*unk0)(void);
    u16 unk4;
    u16 unk6;
    struct RegionMap regionMap;
};

static const u16 sFlyRegionMapFrame_Pal[] = INCBIN_U16("graphics/pokenav/map_frame.gbapal");
static const u8 sFlyRegionMapFrame_ImageLZ[] = INCBIN_U8("graphics/pokenav/map_frame.4bpp.lz");
static const u8 sFlyRegionMapFrame_TilemapLZ[] = INCBIN_U8("graphics/pokenav/map_frame.bin.lz");
static const u16 sFlyTargetIcons_Pal[] = INCBIN_U16("graphics/pokenav/fly_target_icons.gbapal");
static const u8 sFlyTargetIcons_ImageLZ[] = INCBIN_U8("graphics/pokenav/fly_target_icons.4bpp.lz");

static const u8 sUnknown_083E7920[][3] =
{
    {0,  9,  1},
    {0, 10, 14},
    {0, 11, 15},
    {0, 12, 16},
    {0, 13, 17},
    {0, 14, 18},
    {0, 15, 19},
    {0,  0,  3},
    {0,  1,  4},
    {0,  2,  5},
    {0,  3,  6},
    {0,  4,  7},
    {0,  5,  8},
    {0,  6,  9},
    {0,  7, 10},
    {0,  8, 11},
    {0, 16,  0},
    {0, 17,  0},
    {0, 18,  0},
    {0, 19,  0},
    {0, 20,  0},
    {0, 21,  0},
    {0, 22,  0},
    {0, 23,  0},
    {0, 24,  0},
    {0, 25,  0},
    {0, 26,  0},
    {0, 27,  0},
    {0, 28,  0},
    {0, 29,  0},
    {0, 30,  0},
    {0, 31,  0},
    {0, 32,  0},
    {0, 33,  0},
    {0, 34,  0},
    {0, 35,  0},
    {0, 36,  0},
    {0, 37,  0},
    {0, 38,  0},
    {0, 39,  0},
    {0, 40,  0},
    {0, 41,  0},
    {0, 42,  0},
    {0, 43,  0},
    {0, 44,  0},
    {0, 45,  0},
    {0, 46,  0},
    {0, 47,  0},
    {0, 48,  0},
    {0, 49,  0},
};

struct UnknownStruct4
{
    const u8 *const *unk0;
    u16 mapSecId;
    u16 flag;
};

static const u8 *const sEverGrandeCityAreaNames[] = {OtherText_PokeLeague, OtherText_PokeCenter};

static const struct UnknownStruct4 sUnknown_083E79C0[1] =
{
    {sEverGrandeCityAreaNames, MAPSEC_EVER_GRANDE_CITY, SYS_POKEMON_LEAGUE_FLY},
};

// XXX: what is this?
static u8 *const ewram_ = ewram;

static const struct SpritePalette sFlyTargetIconSpritePalette = {sFlyTargetIcons_Pal, 2};

// Fly targets that are not cities or towns
static const u16 sSpecialFlyAreas[][2] =
{
    // flag, mapSecId
    {0x848, MAPSEC_BATTLE_TOWER},
    {0xFFFF, MAPSEC_NONE},
};

static const struct OamData sFlyTargetOamData =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sFlyTargetAnimSeq0[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

static const union AnimCmd sFlyTargetAnimSeq1[] =
{
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_END,
};

static const union AnimCmd sFlyTargetAnimSeq2[] =
{
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_END,
};

static const union AnimCmd sFlyTargetAnimSeq3[] =
{
    ANIMCMD_FRAME(5, 5),
    ANIMCMD_END,
};

static const union AnimCmd sFlyTargetAnimSeq4[] =
{
    ANIMCMD_FRAME(6, 5),
    ANIMCMD_END,
};

static const union AnimCmd sFlyTargetAnimSeq5[] =
{
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END,
};

static const union AnimCmd sFlyTargetAnimSeq6[] =
{
    ANIMCMD_FRAME(10, 5),
    ANIMCMD_END,
};

static const union AnimCmd *const sFlyTargetAnimTable[] =
{
    sFlyTargetAnimSeq0,
    sFlyTargetAnimSeq1,
    sFlyTargetAnimSeq2,
    sFlyTargetAnimSeq3,
    sFlyTargetAnimSeq4,
    sFlyTargetAnimSeq5,
    sFlyTargetAnimSeq6,
};

static const struct SpriteTemplate gFlyTargetSpriteTemplate =
{
    .tileTag = 2,
    .paletteTag = 2,
    .oam = &sFlyTargetOamData,
    .anims = sFlyTargetAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

void CB2_InitFlyRegionMap(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        REG_DISPCNT = 0;
        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;
        REG_BG1HOFS = 0;
        REG_BG1VOFS = 0;
        REG_BG2VOFS = 0;
        REG_BG2HOFS = 0;
        REG_BG3HOFS = 0;
        REG_BG3VOFS = 0;
        ResetPaletteFade();
        ResetSpriteData();
        FreeSpriteTileRanges();
        FreeAllSpritePalettes();
        break;
    case 1:
        SetUpWindowConfig(&gWindowConfig_81E7224);
        break;
    case 2:
        InitMenuWindow(&gWindowConfig_81E7224);
        MenuZeroFillScreen();
        break;
    case 3:
        InitRegionMap(&ewram0_3.regionMap, 0);
        CreateRegionMapCursor(0, 0);
        CreateRegionMapPlayerIcon(1, 1);
        ewram0_3.unk6 = ewram0_3.regionMap.mapSecId;
        StringFill(ewramBlankMapName, CHAR_SPACE, 12);
        PrintFlyTargetName();
        break;
    case 4:
        LZ77UnCompVram(sFlyRegionMapFrame_ImageLZ, (void *)(VRAM + 0xC000));
        break;
    case 5:
        LZ77UnCompVram(sFlyRegionMapFrame_TilemapLZ, (void *)(VRAM + 0xF000));
        break;
    case 6:
        LoadPalette(sFlyRegionMapFrame_Pal, 16, 32);
        MenuPrint_PixelCoords(gOtherText_FlyToWhere, 1, 0x90, 1);
        break;
    case 7:
        CreateFlyTargetGraphics();
        break;
    case 8:
        BlendPalettes(0xFFFFFFFF, 16, 0);
        SetVBlankCallback(VBlankCB_FlyRegionMap);
        break;
    case 9:
        REG_BLDCNT = 0;
        REG_BG1CNT = 0x1E0D;
        REG_DISPCNT = 0x1741;
        sub_80FC244(sub_80FC5B4);
        SetMainCallback2(CB2_FlyRegionMap);
        break;
    default:
        return;
    }
    gMain.state++;
}

static void VBlankCB_FlyRegionMap(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void CB2_FlyRegionMap(void)
{
    ewram0_3.unk0();
    AnimateSprites();
    BuildOamBuffer();
}

static void sub_80FC244(void (*func)(void))
{
    ewram0_3.unk0 = func;
    ewram0_3.unk4 = 0;
}

static void PrintFlyTargetName(void)
{
    if (ewram0_3.regionMap.unk16 == 2 || ewram0_3.regionMap.unk16 == 4)
    {
        u16 i = 0;
        int zero;

        for (i = 0; i < ARRAY_COUNT(sUnknown_083E79C0); i++)
        {
            const struct UnknownStruct4 *r4 = &sUnknown_083E79C0[i];

            if (ewram0_3.regionMap.mapSecId == r4->mapSecId)
            {
                if (FlagGet(r4->flag))
                {
                    MenuDrawTextWindow(16, 14, 29, 19);
                    MenuPrint(ewram0_3.regionMap.mapSecName, 17, 15);
                    MenuPrint_RightAligned(r4->unk0[ewram0_3.regionMap.everGrandeCityArea], 29, 17);
                    return;
                }
                break;
            }
        }
        // This check is always true, but somehow the compiler still performed it.
        asm("mov %0, #0\n":"=r"(zero));  // zero = 0
        if (zero == 0)
        {
            MenuDrawTextWindow(16, 16, 29, 19);
            MenuPrint(ewram0_3.regionMap.mapSecName, 17, 17);
            MenuZeroFillWindowRect(16, 14, 29, 15);
        }
    }
    else
    {
        MenuDrawTextWindow(16, 16, 29, 19);
        MenuPrint(ewramBlankMapName, 17, 17);
        MenuZeroFillWindowRect(16, 14, 29, 15);
    }
}

static void CreateFlyTargetGraphics(void)
{
    struct SpriteSheet spriteSheet;

    LZ77UnCompWram(sFlyTargetIcons_ImageLZ, ewram888);
    spriteSheet.data = ewram888;
    spriteSheet.size = 0x1C0;
    spriteSheet.tag = 2;
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&sFlyTargetIconSpritePalette);
    CreateCityTownFlyTargetIcons();
    CreateSpecialAreaFlyTargetIcons();
}

// Draws a light overlay on cities and towns that the player can fly to
static void CreateCityTownFlyTargetIcons(void)
{
    u16 canFlyFlag = 0x80F;
    u16 i;

    for (i = 0; i < 16; i++)
    {
        u16 x;
        u16 y;
        u16 width;
        u16 height;
        u16 r7;
        u8 spriteId;

        GetRegionMapLocationPosition(i, &x, &y, &width, &height);
        x = (x + 1) * 8 + 4;
        y = (y + 2) * 8 + 4;
        if (width == 2)
            r7 = 1;
        else if (height == 2)
            r7 = 2;
        else
            r7 = 0;
        spriteId = CreateSprite(&gFlyTargetSpriteTemplate, x, y, 10);
        if (spriteId != 64)
        {
            gSprites[spriteId].oam.shape = r7;
            if (FlagGet(canFlyFlag))
                gSprites[spriteId].callback = SpriteCB_FlyTargetIcons;
            else
                r7 += 3;
            StartSpriteAnim(&gSprites[spriteId], r7);
            gSprites[spriteId].data0 = i;
        }
        canFlyFlag++;
    }
}

// Draws a red box on other fly targets
// The Battle Tower is the only one of these
static void CreateSpecialAreaFlyTargetIcons(void)
{
    u16 i;

    for (i = 0; sSpecialFlyAreas[i][1] != MAPSEC_NONE; i++)
    {
        u16 x;
        u16 y;
        u16 width;
        u16 height;

        if (FlagGet(sSpecialFlyAreas[i][0]))
        {
            u16 mapSecId = sSpecialFlyAreas[i][1];
            u8 spriteId;

            GetRegionMapLocationPosition(mapSecId, &x, &y, &width, &height);
            x = (x + 1) * 8;
            y = (y + 2) * 8;
            spriteId = CreateSprite(&gFlyTargetSpriteTemplate, x, y, 10);
            if (spriteId != 64)
            {
                gSprites[spriteId].oam.size = 1;
                gSprites[spriteId].callback = SpriteCB_FlyTargetIcons;
                StartSpriteAnim(&gSprites[spriteId], 6);
                gSprites[spriteId].data0 = mapSecId;
            }
        }
    }
}

static void SpriteCB_FlyTargetIcons(struct Sprite *sprite)
{
    // Blink if our mapSecId is the one selected on the map
    if (ewram0_3.regionMap.mapSecId == sprite->data0)
    {
        // Toggle visibility every 16 frames
        sprite->data1++;
        if (sprite->data1 > 16)
        {
            sprite->data1 = 0;
            sprite->invisible = !sprite->invisible;
        }
    }
    else
    {
        sprite->data1 = 16;
        sprite->invisible = FALSE;
    }
}

static void sub_80FC5B4(void)
{
    switch (ewram0_3.unk4)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        ewram0_3.unk4++;
        break;
    case 1:
        if (UpdatePaletteFade() != 0)
            break;
        sub_80FC244(sub_80FC600);
        break;
    }
}

static void sub_80FC600(void)
{
    if (ewram0_3.unk4 == 0)
    {
        switch (sub_80FAB60())
        {
        case INPUT_EVENT_NONE:
        case INPUT_EVENT_DPAD:
        case INPUT_EVENT_2:
            break;
        case INPUT_EVENT_3:
            PrintFlyTargetName();
            break;
        case INPUT_EVENT_A_BUTTON:
            if (ewram0_3.regionMap.unk16 == 2 || ewram0_3.regionMap.unk16 == 4)
            {
                m4aSongNumStart(SE_SELECT);
                ewramA6E = 1;
                sub_80FC244(sub_80FC69C);
            }
            break;
        case INPUT_EVENT_B_BUTTON:
            m4aSongNumStart(SE_SELECT);
            ewramA6E = 0;
            sub_80FC244(sub_80FC69C);
            break;
        }
    }
}

static void sub_80FC69C(void)
{
    switch (ewram0_3.unk4)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        ewram0_3.unk4++;
        break;
    case 1:
        if (UpdatePaletteFade() != 0)
            break;
        FreeRegionMapIconResources();
        if (ewramA6E != 0)
        {
            switch (ewram0_3.regionMap.mapSecId)
            {
            case MAPSEC_SOUTHERN_ISLAND:
                sub_8053538(22);
                break;
            case MAPSEC_BATTLE_TOWER:
                sub_8053538(21);
                break;
            case MAPSEC_LITTLEROOT_TOWN:
                sub_8053538((gSaveBlock2.playerGender == MALE) ? 12 : 13);
                break;
            case MAPSEC_EVER_GRANDE_CITY:
                sub_8053538((FlagGet(0x854) && ewram0_3.regionMap.everGrandeCityArea == 0) ? 20 : 11);
                break;
            default:
                if (sUnknown_083E7920[ewram0_3.regionMap.mapSecId][2] != 0)
                    sub_8053538(sUnknown_083E7920[ewram0_3.regionMap.mapSecId][2]);
                else
                    warp1_set_2(sUnknown_083E7920[ewram0_3.regionMap.mapSecId][0], sUnknown_083E7920[ewram0_3.regionMap.mapSecId][1], -1);
                break;
            }
            sub_80865BC();
        }
        else
        {
            SetMainCallback2(sub_808AD58);
        }
        break;
    }
}
