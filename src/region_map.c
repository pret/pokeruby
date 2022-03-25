#include "global.h"
#include "constants/region_map_sections.h"
#include "event_data.h"
#include "field_effect.h"
#include "field_specials.h"
#include "m4a.h"
#include "main.h"
#include "constants/maps.h"
#include "menu.h"
#include "palette.h"
#include "pokemon_menu.h"
#include "region_map.h"
#include "overworld.h"
#include "secret_base.h"
#include "constants/songs.h"
#include "sprite.h"
#include "strings.h"
#include "string_util.h"
#include "text.h"
#include "trig.h"
#include "ewram.h"
#include "heal_location.h"
#include "constants/heal_locations.h"

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

static const u8 sRegionMapLayout[] = INCBIN_U8("graphics/pokenav/region_map_section_layout.bin");

#if ENGLISH
#include "data/region_map/region_map_entries.h"
#elif GERMAN
#include "data/region_map/region_map_entries_de.h"
#endif

static const u16 sUnderwaterMaps[][2] =
{
    {MAPSEC_UNDERWATER_124,       MAPSEC_ROUTE_124},
    {MAPSEC_UNDERWATER_125,       MAPSEC_ROUTE_126},
    {MAPSEC_UNDERWATER_126,       MAPSEC_ROUTE_127},
    {MAPSEC_UNDERWATER_127,       MAPSEC_ROUTE_128},
    {MAPSEC_UNDERWATER_SOOTOPOLIS,       MAPSEC_SOOTOPOLIS_CITY},
    {MAPSEC_UNDERWATER_128,       MAPSEC_ROUTE_128},
    {MAPSEC_EVIL_TEAM_HIDEOUT, MAPSEC_LILYCOVE_CITY},
    {MAPSEC_UNDERWATER_SEALED_CHAMBER,       MAPSEC_ROUTE_134},
    {MAPSEC_PETALBURG_WOODS,   MAPSEC_ROUTE_104},
    {MAPSEC_JAGGED_PASS,     MAPSEC_ROUTE_112},
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
static u16 GetOverworldMapFromUnderwaterMap_(u16);
static void sub_80FBA18(void);
static bool8 sub_80FBAA0(u16);
void CreateRegionMapCursor(u16, u16);
void sub_80FBCA0(void);
static void sub_80FBDF8(void);
static void sub_80FBE24(void);
static void SpriteCB_PlayerIconZoomedOut(struct Sprite *);
static void UpdateIconBlink(struct Sprite *);
static void SpriteCB_PlayerIconZoomedIn(struct Sprite *);
const u8 *GetMapSectionName(u8 *, u16, u16);
static void VBlankCB_FlyRegionMap(void);
void CB2_FlyRegionMap(void);
void sub_80FC244(void (*func)(void));
static void PrintFlyTargetName(void);
static void CreateFlyTargetGraphics(void);
static void CreateCityTownFlyTargetIcons(void);
static void CreateSpecialAreaFlyTargetIcons(void);
static void SpriteCB_FlyTargetIcons(struct Sprite *);
static void sub_80FC5B4(void);
static void sub_80FC600(void);
void sub_80FC69C(void);

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
        gRegionMap->unk16 = sub_80FB758(gRegionMap->mapSectionId);
        gRegionMap->mapSectionId = GetOverworldMapFromUnderwaterMap_(gRegionMap->mapSectionId);
        GetMapSectionName(gRegionMap->mapSectionName, gRegionMap->mapSectionId, 16);
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
    u16 mapSectionId;

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

    mapSectionId = GetRegionMapSectionAt(gRegionMap->cursorPosX, gRegionMap->cursorPosY);
    gRegionMap->unk16 = sub_80FB758(mapSectionId);
    if (mapSectionId != gRegionMap->mapSectionId)
    {
        gRegionMap->mapSectionId = mapSectionId;
        GetMapSectionName(gRegionMap->mapSectionName, gRegionMap->mapSectionId, 16);
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
            u16 mapSectionId;

            gRegionMap->unk64 = r3;
            gRegionMap->unk66 = r1;
            mapSectionId = GetRegionMapSectionAt(r3, r1);
            gRegionMap->unk16 = sub_80FB758(mapSectionId);
            if (mapSectionId != gRegionMap->mapSectionId)
            {
                gRegionMap->mapSectionId = mapSectionId;
                GetMapSectionName(gRegionMap->mapSectionName, gRegionMap->mapSectionId, 16);
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

void RegionMapDefaultZoomOffsetPlayerSprite(s16 a, s16 b)
{
    CalcZoomScrollParams(a, b, 0x38, 0x48, 0x100, 0x100, 0);
    UpdateRegionMapVideoRegs();
    if (gRegionMap->playerIconSprite != NULL)
    {
        gRegionMap->playerIconSprite->x2 = -a;
        gRegionMap->playerIconSprite->y2 = -b;
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
     && (gSaveBlock1.location.mapNum == MAP_NUM(SS_TIDAL_CORRIDOR)
      || gSaveBlock1.location.mapNum == MAP_NUM(SS_TIDAL_LOWER_DECK)
      || gSaveBlock1.location.mapNum == MAP_NUM(SS_TIDAL_ROOMS)))
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
        gRegionMap->mapSectionId = gMapHeader.regionMapSectionId;
        gRegionMap->playerIsInCave = FALSE;
        mapWidth = gMapHeader.mapLayout->width;
        mapHeight = gMapHeader.mapLayout->height;
        x = gSaveBlock1.pos.x;
        y = gSaveBlock1.pos.y;
        if (gRegionMap->mapSectionId == MAPSEC_UNDERWATER_128)
            gRegionMap->playerIsInCave = TRUE;
        break;
    case 3:
    case 6:
        mapHeader = Overworld_GetMapHeaderByGroupAndId(gSaveBlock1.warp4.mapGroup, gSaveBlock1.warp4.mapNum);
        gRegionMap->mapSectionId = mapHeader->regionMapSectionId;
        gRegionMap->playerIsInCave = TRUE;
        mapWidth = mapHeader->mapLayout->width;
        mapHeight = mapHeader->mapLayout->height;
        x = gSaveBlock1.warp4.x;
        y = gSaveBlock1.warp4.y;
        break;
    case 8:
        mapHeader = Overworld_GetMapHeaderByGroupAndId(gSaveBlock1.warp2.mapGroup, gSaveBlock1.warp2.mapNum);
        gRegionMap->mapSectionId = mapHeader->regionMapSectionId;
        gRegionMap->playerIsInCave = TRUE;
        mapWidth = mapHeader->mapLayout->width;
        mapHeight = mapHeader->mapLayout->height;
        x = gSaveBlock1.warp2.x;
        y = gSaveBlock1.warp2.y;
        break;
    case 7:
        {
            struct WarpData *r4;

            gRegionMap->mapSectionId = gMapHeader.regionMapSectionId;
            if (gRegionMap->mapSectionId != MAPSEC_DYNAMIC)
            {
                r4 = &gSaveBlock1.warp4;
                mapHeader = Overworld_GetMapHeaderByGroupAndId(r4->mapGroup, r4->mapNum);
            }
            else
            {
                r4 = &gSaveBlock1.warp2;
                mapHeader = Overworld_GetMapHeaderByGroupAndId(r4->mapGroup, r4->mapNum);
                gRegionMap->mapSectionId = mapHeader->regionMapSectionId;
            }
            gRegionMap->playerIsInCave = FALSE;
            mapWidth = mapHeader->mapLayout->width;
            mapHeight = mapHeader->mapLayout->height;
            x = r4->x;
            y = r4->y;
        }
        break;
    }

    r9 = x;

    r1 = mapWidth / gRegionMapEntries[gRegionMap->mapSectionId].width;
    if (r1 == 0)
        r1 = 1;
    x /= r1;
    if (x >= gRegionMapEntries[gRegionMap->mapSectionId].width)
        x = gRegionMapEntries[gRegionMap->mapSectionId].width - 1;

    r1 = mapHeight / gRegionMapEntries[gRegionMap->mapSectionId].height;
    if (r1 == 0)
        r1 = 1;
    y /= r1;
    if (y >= gRegionMapEntries[gRegionMap->mapSectionId].height)
        y = gRegionMapEntries[gRegionMap->mapSectionId].height - 1;

    switch (gRegionMap->mapSectionId)
    {
    case MAPSEC_ROUTE_114:
        if (y != 0)
            x = 0;
        break;
    case MAPSEC_ROUTE_126:
    case MAPSEC_UNDERWATER_125:
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
    gRegionMap->cursorPosX = gRegionMapEntries[gRegionMap->mapSectionId].x + x + MAPCURSOR_X_MIN;
    gRegionMap->cursorPosY = gRegionMapEntries[gRegionMap->mapSectionId].y + y + MAPCURSOR_Y_MIN;
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
        gRegionMap->mapSectionId = MAPSEC_SLATEPORT_CITY;
        break;
    case 2:
        gRegionMap->mapSectionId = MAPSEC_LILYCOVE_CITY;
        break;
    case 3:
        gRegionMap->mapSectionId = MAPSEC_ROUTE_124;
        break;
    case 4:
        gRegionMap->mapSectionId = MAPSEC_ROUTE_131;
        break;
    default:
    case 0:
        {
            struct MapHeader *mapHeader = Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum);
            u16 r1;

            gRegionMap->mapSectionId = mapHeader->regionMapSectionId;
            r1 = mapHeader->mapLayout->width / gRegionMapEntries[gRegionMap->mapSectionId].width;
            if (r1 == 0)
                r1 = 1;
            x = sp2 / r1;
            if (x >= gRegionMapEntries[gRegionMap->mapSectionId].width)
                x = gRegionMapEntries[gRegionMap->mapSectionId].width - 1;

            r1 = mapHeader->mapLayout->height / gRegionMapEntries[gRegionMap->mapSectionId].height;
            if (r1 == 0)
                r1 = 1;
            y = sp4 / r1;
            if (y >= gRegionMapEntries[gRegionMap->mapSectionId].height)
                y = gRegionMapEntries[gRegionMap->mapSectionId].height - 1;
        }
        break;
    }
    gRegionMap->playerIsInCave = FALSE;
    gRegionMap->cursorPosX = gRegionMapEntries[gRegionMap->mapSectionId].x + x + MAPCURSOR_X_MIN;
    gRegionMap->cursorPosY = gRegionMapEntries[gRegionMap->mapSectionId].y + y + MAPCURSOR_Y_MIN;
}

static u16 sub_80FB758(u16 mapSectionId)
{
    switch (mapSectionId)
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
        return FlagGet(FLAG_LANDMARK_BATTLE_TOWER) ? 4 : 0;
    case MAPSEC_SOUTHERN_ISLAND:
        return FlagGet(FLAG_LANDMARK_SOUTHERN_ISLAND) ? 1 : 0;
    default:
        return 1;
    }
}

u16 GetRegionMapSectionAt_(u16 x, u16 y)
{
    return GetRegionMapSectionAt(x, y);
}

static u16 GetOverworldMapFromUnderwaterMap_(u16 mapSectionId)
{
    u16 i;

    for (i = 0; sUnderwaterMaps[i][0] != MAPSEC_NONE; i++)
    {
        if (sUnderwaterMaps[i][0] == mapSectionId)
            return sUnderwaterMaps[i][1];
    }
    return mapSectionId;
}

u16 GetOverworldMapFromUnderwaterMap(u16 mapSectionId)
{
    return GetOverworldMapFromUnderwaterMap_(mapSectionId);
}

static void sub_80FBA18(void)
{
    u16 x;
    u16 y;
    u16 i;

    if (gRegionMap->mapSectionId == MAPSEC_NONE)
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
            if (GetRegionMapSectionAt(x, y) == gRegionMap->mapSectionId)
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
        if (GetRegionMapSectionAt(x, y) == gRegionMap->mapSectionId)
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
        sprite->x += gRegionMap->cursorDeltaX * 2;
        sprite->y += gRegionMap->cursorDeltaY * 2;
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
            gRegionMap->cursorSprite->x -= 8;
            gRegionMap->cursorSprite->y -= 8;
            StartSpriteAnim(gRegionMap->cursorSprite, 1);
        }
        else
        {
            gRegionMap->cursorSprite->oam.size = 1;
            gRegionMap->cursorSprite->x = gRegionMap->cursorPosX * 8 + 4;
            gRegionMap->cursorSprite->y = gRegionMap->cursorPosY * 8 + 4;
        }
        gRegionMap->cursorSprite->data[1] = 2;
        gRegionMap->cursorSprite->data[2] = IndexOfSpritePaletteTag(paletteTag) * 16 + 0x0101;
        gRegionMap->cursorSprite->data[3] = 1;
    }
}

void sub_80FBCA0(void)
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
    gRegionMap->cursorSprite->data[3] = 1;
}

void unref_sub_80FBCE0(void)
{
    gRegionMap->cursorSprite->data[3] = 0;
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
        gRegionMap->playerIconSprite->x = gRegionMap->unk74 * 8 + 4;
        gRegionMap->playerIconSprite->y = gRegionMap->unk76 * 8 + 4;
        gRegionMap->playerIconSprite->callback = SpriteCB_PlayerIconZoomedOut;
    }
    else
    {
        gRegionMap->playerIconSprite->x = gRegionMap->unk74 * 16 - 48;
        gRegionMap->playerIconSprite->y = gRegionMap->unk76 * 16 - 66;
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
            gRegionMap->playerIconSprite->x = gRegionMap->unk74 * 16 - 48;
            gRegionMap->playerIconSprite->y = gRegionMap->unk76 * 16 - 66;
            gRegionMap->playerIconSprite->callback = SpriteCB_PlayerIconZoomedIn;
            gRegionMap->playerIconSprite->invisible = FALSE;
        }
        else
        {
            gRegionMap->playerIconSprite->x = gRegionMap->unk74 * 8 + 4;
            gRegionMap->playerIconSprite->y = gRegionMap->unk76 * 8 + 4;
            gRegionMap->playerIconSprite->x2 = 0;
            gRegionMap->playerIconSprite->y2 = 0;
            gRegionMap->playerIconSprite->callback = SpriteCB_PlayerIconZoomedOut;
            gRegionMap->playerIconSprite->invisible = FALSE;
        }
    }
}

static void SpriteCB_PlayerIconZoomedIn(struct Sprite *sprite)
{
    sprite->x2 = -(gRegionMap->scrollX * 2);
    sprite->y2 = -(gRegionMap->scrollY * 2);
    sprite->data[0] = sprite->y + sprite->y2 + sprite->centerToCornerVecY;
    sprite->data[1] = sprite->x + sprite->x2 + sprite->centerToCornerVecX;

    // Determine if sprite is on screen
    if (sprite->data[0] < -8 || sprite->data[0] > 0xA8 || sprite->data[1] < -8 || sprite->data[1] > 0xF8)
        sprite->data[2] = FALSE;
    else
        sprite->data[2] = TRUE;

    if (sprite->data[2] == TRUE)
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
        sprite->data[7]++;
        if (sprite->data[7] > 16)
        {
            sprite->data[7] = 0;
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

const u8 *GetMapSectionName(u8 *dest, u16 mapSectionId, u16 length)
{
    if (mapSectionId == MAPSEC_SECRET_BASE)
        return GetSecretBaseMapName(dest);
    if (mapSectionId < MAPSEC_NONE)
        return StringCopy(dest, gRegionMapEntries[mapSectionId].regionMapSectionId);
    if (length == 0)
        length = 18;
    return StringFill(dest, CHAR_SPACE, length);
}

const u8 *CopyMapName(u8 *dest, u16 mapSectionId)
{
    switch (mapSectionId)
    {
    case MAPSEC_DYNAMIC:
        return StringCopy(dest, gOtherText_Ferry);
    case MAPSEC_SECRET_BASE:
        return StringCopy(dest, gOtherText_SecretBase);
    default:
        return GetMapSectionName(dest, mapSectionId, 0);
    }
}

const u8 *CopyLocationName(u8 *dest, u16 mapSectionId)
{
    if (mapSectionId == MAPSEC_EVIL_TEAM_HIDEOUT)
        return StringCopy(dest, gOtherText_Hideout);
    else
        return CopyMapName(dest, mapSectionId);
}

static void GetRegionMapLocationPosition(u16 mapSectionId, u16 *x, u16 *y, u16 *width, u16 *height)
{
    *x = gRegionMapEntries[mapSectionId].x;
    *y = gRegionMapEntries[mapSectionId].y;
    *width = gRegionMapEntries[mapSectionId].width;
    *height = gRegionMapEntries[mapSectionId].height;
}

static const u16 sFlyRegionMapFrame_Pal[] = INCBIN_U16("graphics/pokenav/map_frame.gbapal");
static const u8 sFlyRegionMapFrame_ImageLZ[] = INCBIN_U8("graphics/pokenav/map_frame.4bpp.lz");
static const u8 sFlyRegionMapFrame_TilemapLZ[] = INCBIN_U8("graphics/pokenav/map_frame.bin.lz");
static const u16 sFlyTargetIcons_Pal[] = INCBIN_U16("graphics/pokenav/fly_target_icons.gbapal");
static const u8 sFlyTargetIcons_ImageLZ[] = INCBIN_U8("graphics/pokenav/fly_target_icons.4bpp.lz");

static const u8 sMapHealLocations[][3] =
{
    {MAP_GROUP(LITTLEROOT_TOWN), MAP_NUM(LITTLEROOT_TOWN), HEAL_LOCATION_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F},
    {MAP_GROUP(OLDALE_TOWN), MAP_NUM(OLDALE_TOWN), HEAL_LOCATION_OLDALE_TOWN},
    {MAP_GROUP(DEWFORD_TOWN), MAP_NUM(DEWFORD_TOWN), HEAL_LOCATION_DEWFORD_TOWN},
    {MAP_GROUP(LAVARIDGE_TOWN), MAP_NUM(LAVARIDGE_TOWN), HEAL_LOCATION_LAVARIDGE_TOWN},
    {MAP_GROUP(FALLARBOR_TOWN), MAP_NUM(FALLARBOR_TOWN), HEAL_LOCATION_FALLARBOR_TOWN},
    {MAP_GROUP(VERDANTURF_TOWN), MAP_NUM(VERDANTURF_TOWN), HEAL_LOCATION_VERDANTURF_TOWN},
    {MAP_GROUP(PACIFIDLOG_TOWN), MAP_NUM(PACIFIDLOG_TOWN), HEAL_LOCATION_PACIFIDLOG_TOWN},
    {MAP_GROUP(PETALBURG_CITY), MAP_NUM(PETALBURG_CITY), HEAL_LOCATION_PETALBURG_CITY},
    {MAP_GROUP(SLATEPORT_CITY), MAP_NUM(SLATEPORT_CITY), HEAL_LOCATION_SLATEPORT_CITY},
    {MAP_GROUP(MAUVILLE_CITY), MAP_NUM(MAUVILLE_CITY), HEAL_LOCATION_MAUVILLE_CITY},
    {MAP_GROUP(RUSTBORO_CITY), MAP_NUM(RUSTBORO_CITY), HEAL_LOCATION_RUSTBORO_CITY},
    {MAP_GROUP(FORTREE_CITY), MAP_NUM(FORTREE_CITY), HEAL_LOCATION_FORTREE_CITY},
    {MAP_GROUP(LILYCOVE_CITY), MAP_NUM(LILYCOVE_CITY), HEAL_LOCATION_LILYCOVE_CITY},
    {MAP_GROUP(MOSSDEEP_CITY), MAP_NUM(MOSSDEEP_CITY), HEAL_LOCATION_MOSSDEEP_CITY},
    {MAP_GROUP(SOOTOPOLIS_CITY), MAP_NUM(SOOTOPOLIS_CITY), HEAL_LOCATION_SOOTOPOLIS_CITY},
    {MAP_GROUP(EVER_GRANDE_CITY), MAP_NUM(EVER_GRANDE_CITY), HEAL_LOCATION_EVER_GRANDE_CITY},
    {MAP_GROUP(ROUTE101), MAP_NUM(ROUTE101), 0},
    {MAP_GROUP(ROUTE102), MAP_NUM(ROUTE102), 0},
    {MAP_GROUP(ROUTE103), MAP_NUM(ROUTE103), 0},
    {MAP_GROUP(ROUTE104), MAP_NUM(ROUTE104), 0},
    {MAP_GROUP(ROUTE105), MAP_NUM(ROUTE105), 0},
    {MAP_GROUP(ROUTE106), MAP_NUM(ROUTE106), 0},
    {MAP_GROUP(ROUTE107), MAP_NUM(ROUTE107), 0},
    {MAP_GROUP(ROUTE108), MAP_NUM(ROUTE108), 0},
    {MAP_GROUP(ROUTE109), MAP_NUM(ROUTE109), 0},
    {MAP_GROUP(ROUTE110), MAP_NUM(ROUTE110), 0},
    {MAP_GROUP(ROUTE111), MAP_NUM(ROUTE111), 0},
    {MAP_GROUP(ROUTE112), MAP_NUM(ROUTE112), 0},
    {MAP_GROUP(ROUTE113), MAP_NUM(ROUTE113), 0},
    {MAP_GROUP(ROUTE114), MAP_NUM(ROUTE114), 0},
    {MAP_GROUP(ROUTE115), MAP_NUM(ROUTE115), 0},
    {MAP_GROUP(ROUTE116), MAP_NUM(ROUTE116), 0},
    {MAP_GROUP(ROUTE117), MAP_NUM(ROUTE117), 0},
    {MAP_GROUP(ROUTE118), MAP_NUM(ROUTE118), 0},
    {MAP_GROUP(ROUTE119), MAP_NUM(ROUTE119), 0},
    {MAP_GROUP(ROUTE120), MAP_NUM(ROUTE120), 0},
    {MAP_GROUP(ROUTE121), MAP_NUM(ROUTE121), 0},
    {MAP_GROUP(ROUTE122), MAP_NUM(ROUTE122), 0},
    {MAP_GROUP(ROUTE123), MAP_NUM(ROUTE123), 0},
    {MAP_GROUP(ROUTE124), MAP_NUM(ROUTE124), 0},
    {MAP_GROUP(ROUTE125), MAP_NUM(ROUTE125), 0},
    {MAP_GROUP(ROUTE126), MAP_NUM(ROUTE126), 0},
    {MAP_GROUP(ROUTE127), MAP_NUM(ROUTE127), 0},
    {MAP_GROUP(ROUTE128), MAP_NUM(ROUTE128), 0},
    {MAP_GROUP(ROUTE129), MAP_NUM(ROUTE129), 0},
    {MAP_GROUP(ROUTE130), MAP_NUM(ROUTE130), 0},
    {MAP_GROUP(ROUTE131), MAP_NUM(ROUTE131), 0},
    {MAP_GROUP(ROUTE132), MAP_NUM(ROUTE132), 0},
    {MAP_GROUP(ROUTE133), MAP_NUM(ROUTE133), 0},
    {MAP_GROUP(ROUTE134), MAP_NUM(ROUTE134), 0},
};

static const u8 *const sEverGrandeCityAreaNames[] =
{
    OtherText_PokeLeague,
    OtherText_PokeCenter,
};

struct MultiPartMapSection
{
    const u8 *const *partNames;
    u16 mapSectionId;
    u16 requiredFlag;
};

// Map sections that are divided into multiple parts. Ever Grande City is the only one.
static const struct MultiPartMapSection sMultiPartMapSections[1] =
{
    {sEverGrandeCityAreaNames, MAPSEC_EVER_GRANDE_CITY, FLAG_SYS_POKEMON_LEAGUE_FLY},
};

struct RegionMapState *const gRegionMapState = &eRegionMapState;

static const struct SpritePalette sFlyTargetIconSpritePalette = {sFlyTargetIcons_Pal, 2};

// Fly targets that are not cities or towns
static const u16 sSpecialFlyAreas[][2] =
{
    // flag, mapSectionId
    {FLAG_LANDMARK_BATTLE_TOWER, MAPSEC_BATTLE_TOWER},
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
        Text_LoadWindowTemplate(&gWindowTemplate_81E7224);
        break;
    case 2:
        InitMenuWindow(&gWindowTemplate_81E7224);
        Menu_EraseScreen();
        break;
    case 3:
        InitRegionMap(&gRegionMapState->regionMap, 0);
        CreateRegionMapCursor(0, 0);
        CreateRegionMapPlayerIcon(1, 1);
        gRegionMapState->mapSectionId = gRegionMapState->regionMap.mapSectionId;
        StringFill(gRegionMapState->blankMapName, CHAR_SPACE, 12);
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
        Menu_PrintTextPixelCoords(gOtherText_FlyToWhere, 1, 0x90, 1);
        break;
    case 7:
        CreateFlyTargetGraphics();
        break;
    case 8:
        BlendPalettes(0xFFFFFFFF, 16, RGB(0, 0, 0));
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

void CB2_FlyRegionMap(void)
{
    gRegionMapState->callback();
    AnimateSprites();
    BuildOamBuffer();
}

void sub_80FC244(void (*func)(void))
{
    gRegionMapState->callback = func;
    gRegionMapState->state = 0;
}

static void PrintFlyTargetName(void)
{
    if (gRegionMapState->regionMap.unk16 == 2 || gRegionMapState->regionMap.unk16 == 4)
    {
        bool8 drawFrameDisabled = FALSE;
        u16 i;

        for (i = 0; i < ARRAY_COUNT(sMultiPartMapSections); i++)
        {
            if (gRegionMapState->regionMap.mapSectionId == sMultiPartMapSections[i].mapSectionId)
            {
                if (FlagGet(sMultiPartMapSections[i].requiredFlag))
                {
                    Menu_DrawStdWindowFrame(16, 14, 29, 19);
                    Menu_PrintText(gRegionMapState->regionMap.mapSectionName, 17, 15);
                    MenuPrint_RightAligned(sMultiPartMapSections[i].partNames[gRegionMapState->regionMap.everGrandeCityArea], 29, 17);
                    drawFrameDisabled = TRUE;
                }
                break;
            }
        }

        if (!drawFrameDisabled)
        {
            Menu_DrawStdWindowFrame(16, 16, 29, 19);
            Menu_PrintText(gRegionMapState->regionMap.mapSectionName, 17, 17);
            Menu_EraseWindowRect(16, 14, 29, 15);
        }
    }
    else
    {
        Menu_DrawStdWindowFrame(16, 16, 29, 19);
        Menu_PrintText(gRegionMapState->blankMapName, 17, 17);
        Menu_EraseWindowRect(16, 14, 29, 15);
    }
}

static void CreateFlyTargetGraphics(void)
{
    struct SpriteSheet spriteSheet;

    LZ77UnCompWram(sFlyTargetIcons_ImageLZ, gRegionMapState->unk_888);
    spriteSheet.data = (u8 *)gRegionMapState->unk_888;
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
    u16 canFlyFlag = FLAG_VISITED_LITTLEROOT_TOWN;
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
            gSprites[spriteId].data[0] = i;
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
            u16 mapSectionId = sSpecialFlyAreas[i][1];
            u8 spriteId;

            GetRegionMapLocationPosition(mapSectionId, &x, &y, &width, &height);
            x = (x + 1) * 8;
            y = (y + 2) * 8;
            spriteId = CreateSprite(&gFlyTargetSpriteTemplate, x, y, 10);
            if (spriteId != 64)
            {
                gSprites[spriteId].oam.size = 1;
                gSprites[spriteId].callback = SpriteCB_FlyTargetIcons;
                StartSpriteAnim(&gSprites[spriteId], 6);
                gSprites[spriteId].data[0] = mapSectionId;
            }
        }
    }
}

static void SpriteCB_FlyTargetIcons(struct Sprite *sprite)
{
    // Blink if our mapSectionId is the one selected on the map
    if (gRegionMapState->regionMap.mapSectionId == sprite->data[0])
    {
        // Toggle visibility every 16 frames
        sprite->data[1]++;
        if (sprite->data[1] > 16)
        {
            sprite->data[1] = 0;
            sprite->invisible = !sprite->invisible;
        }
    }
    else
    {
        sprite->data[1] = 16;
        sprite->invisible = FALSE;
    }
}

static void sub_80FC5B4(void)
{
    switch (gRegionMapState->state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gRegionMapState->state++;
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
    if (gRegionMapState->state == 0)
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
            if (gRegionMapState->regionMap.unk16 == 2 || gRegionMapState->regionMap.unk16 == 4)
            {
                m4aSongNumStart(SE_SELECT);
                gRegionMapState->choseFlyLocation = 1;
                sub_80FC244(sub_80FC69C);
            }
            break;
        case INPUT_EVENT_B_BUTTON:
            m4aSongNumStart(SE_SELECT);
            gRegionMapState->choseFlyLocation = 0;
            sub_80FC244(sub_80FC69C);
            break;
        }
    }
}

void sub_80FC69C(void)
{
    switch (gRegionMapState->state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gRegionMapState->state++;
        break;
    case 1:
        if (UpdatePaletteFade() != 0)
            break;
        FreeRegionMapIconResources();
        if (gRegionMapState->choseFlyLocation != 0)
        {
            switch (gRegionMapState->regionMap.mapSectionId)
            {
            case MAPSEC_SOUTHERN_ISLAND:
                sub_8053538(HEAL_LOCATION_SOUTHERN_ISLAND_EXTERIOR);
                break;
            case MAPSEC_BATTLE_TOWER:
                sub_8053538(HEAL_LOCATION_BATTLE_TOWER_OUTSIDE);
                break;
            case MAPSEC_LITTLEROOT_TOWN:
                sub_8053538((gSaveBlock2.playerGender == MALE) ? HEAL_LOCATION_LITTLEROOT_TOWN_BRENDANS_HOUSE : HEAL_LOCATION_LITTLEROOT_TOWN_MAYS_HOUSE);
                break;
            case MAPSEC_EVER_GRANDE_CITY:
                sub_8053538((FlagGet(FLAG_SYS_POKEMON_LEAGUE_FLY) && gRegionMapState->regionMap.everGrandeCityArea == 0) ? HEAL_LOCATION_EVER_GRANDE_CITY_POKEMON_LEAGUE : HEAL_LOCATION_EVER_GRANDE_CITY);
                break;
            default:
                if (sMapHealLocations[gRegionMapState->regionMap.mapSectionId][2] != 0)
                    sub_8053538(sMapHealLocations[gRegionMapState->regionMap.mapSectionId][2]);
                else
                    SetWarpDestinationToMapWarp(sMapHealLocations[gRegionMapState->regionMap.mapSectionId][0], sMapHealLocations[gRegionMapState->regionMap.mapSectionId][1], -1);
                break;
            }
            ReturnToFieldFromFlyMapSelect();
        }
        else
        {
            SetMainCallback2(sub_808AD58);
        }
        break;
    }
}

#if DEBUG

void debug_sub_8110CCC(void)
{
    bool8 r7 = FALSE;
    u16 i;
    s16 indent;

    for (i = 0; i < ARRAY_COUNT(sMultiPartMapSections); i++)
    {
        if (gRegionMapState->regionMap.mapSectionId == sMultiPartMapSections[i].mapSectionId)
        {
            if (FlagGet(sMultiPartMapSections[i].requiredFlag))
            {
                indent = 12 - StringLength(sMultiPartMapSections[i].partNames[gRegionMapState->regionMap.everGrandeCityArea]);
                if (indent < 0)
                    indent = 0;
                r7 = TRUE;
                Menu_DrawStdWindowFrame(16, 14, 29, 19);
                Menu_PrintText(gRegionMapState->regionMap.mapSectionName, 17, 15);
                Menu_PrintText(sMultiPartMapSections[i].partNames[gRegionMapState->regionMap.everGrandeCityArea], 17 + indent, 17);
            }
            break;
        }
    }
    if (!r7)
    {
        Menu_DrawStdWindowFrame(16, 16, 29, 19);
        Menu_PrintText(gRegionMapState->regionMap.mapSectionName, 17, 17);
        Menu_EraseWindowRect(16, 14, 29, 15);
    }
}

void debug_sub_8110D84(void)
{
    switch (gRegionMapState->state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gRegionMapState->state++;
        break;
    case 1:
        if (!UpdatePaletteFade())
            gRegionMapState->state++;
        break;
    case 2:
        switch (sub_80FAB60())
        {
        case 0:
            break;
        case 3:
            debug_sub_8110CCC();
            break;
        case 4:
            if (gRegionMapState->regionMap.unk16 != 0)
            {
                m4aSongNumStart(SE_SELECT);
                gSharedMem[0xA6E] = 1;  // TODO: what is this?
                sub_80FC244(sub_80FC69C);
            }
            break;
        case 5:
            m4aSongNumStart(SE_SELECT);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gRegionMapState->state++;
            break;
        }
        break;
    case 3:
        if (!UpdatePaletteFade())
            SetMainCallback2(c2_exit_to_overworld_1_sub_8080DEC);
        break;
    case 4:
        if (sub_80FAB60() != 0)
        {
            debug_sub_8110CCC();
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            sub_80FBCA0();
            sub_80FAEC4();
            gRegionMapState->state++;
        }
        break;
    case 5:
        if (sub_80FAFC0() == 0)
        {
            CreateRegionMapCursor(0, 0);
            gRegionMapState->state++;
        }
        break;
    case 6:
        if (sub_80FAB60() != 0)
        {
            debug_sub_8110CCC();
        }
        if (gMain.newKeys & A_BUTTON)  // no "else if" like above?
        {
            sub_80FBCA0();
            sub_80FAEC4();
            gRegionMapState->state++;
        }
        break;
    case 7:
        if (sub_80FAFC0() == 0)
        {
            CreateRegionMapCursor(0, 0);
            gRegionMapState->state = 3;
        }
        break;
    }
}

void debug_sub_8110F28(void)
{
    CB2_InitFlyRegionMap();
    
    if (gMain.callback2 == CB2_FlyRegionMap)
    {
        sub_80FBF94();
        sub_80FC244(debug_sub_8110D84);
        debug_sub_8110CCC();
    }
}

#endif

