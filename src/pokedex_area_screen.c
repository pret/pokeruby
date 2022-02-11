// Includes
#include "global.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/songs.h"
#include "constants/region_map_sections.h"
#include "sound.h"
#include "ewram.h"
#include "main.h"
#include "palette.h"
#include "task.h"
#include "sprite.h"
#include "region_map.h"
#include "string_util.h"
#include "text.h"
#include "wild_encounter.h"
#include "roamer.h"
#include "overworld.h"
#include "event_data.h"
#include "trig.h"
#include "graphics.h"

// Static type declarations

struct PokedexAreaScreenSubstruct0010
{
    u8 mapGroup;
    u8 mapNum;
    u16 regionMapSectionId;
};

struct PokedexAreaScreenEwramStruct
{
    void (*callback)(void);
    MainCallback prev;
    MainCallback next;
    u16 state;
    u16 species;
    struct PokedexAreaScreenSubstruct0010 overworldAreasWithMons[0x40];
    u16 numOverworldAreas;
    u16 numSpecialAreas;
    u16 drawAreaGlowState;
    u16 areaGlowTilemap[0x280];
    u16 areaShadeOrMarkerFrameCounter;
    u16 areaShadeFrameCounter;
    u16 areaShadeBldArgLo;
    u16 areaShadeBldArgHi;
    u8 whichMarkersFlashing;
    u8 specialMarkerCycleCounter;
    u16 specialAreaRegionMapSectionIds[0x20];
    struct Sprite * areaMarkerSprites[0x20];
    u16 numAreaMarkerSprites;
    u8 * errno;
    struct RegionMap regionMap;
    u8 charBuffer[0x40];
    struct Sprite * areaUnknownSprites[3];
    u8 areaUnknownGraphicsBuffer[0x600];
};

#define ePokedexAreaScreen (*(struct PokedexAreaScreenEwramStruct *)gSharedMem)

// Static RAM declarations

// Static ROM declarations

static void CB2_UnusedPokedexAreaScreen(void);
static void VBlankCB_AreaScren(void);
static void MainCB_AreaScren(void);
static void SetCallback(void (*func)(void));
static void ResetDrawAreaGlowState(void);
static bool8 DrawAreaGlow(void);
static void FindMapsWithMon(u16 mon);
static void SetAreaHasMon(u16 mapGroup, u16 mapNum);
static void SetSpecialMapHasMon(u16 mapGroup, u16 mapNum);
static bool8 MapHasMon(const struct WildPokemonHeader *header, u16 mon);
static bool8 MonListHasMon(const struct WildPokemonInfo *info, u16 mon, u16 size);
static void BuildAreaGlowTilemap(void);
static void StartAreaGlow(void);
static void DoAreaGlow(void);
static void DebugCB_WaitFade(void);
static void DebugCB_WaitButton(void);
static void DebugCB_GoBack(void);
static void DebugCB_GoNext(void);

// .rodata

static const u16 gUnknown_083F8418[] = INCBIN_U16("graphics/pokedex/area_glow.gbapal");

static const u8 gUnknown_083F8438[] = INCBIN_U8("graphics/pokedex/area_glow.4bpp.lz");

static const u16 sSpeciesHiddenFromAreaScreen[] = {SPECIES_WYNAUT};

static const u16 sFeebasData[][3] = {
    {SPECIES_FEEBAS, MAP_GROUP(ROUTE119), MAP_NUM(ROUTE119)},
    {NUM_SPECIES}
};

static const u16 sLandmarkData[][2] = {
    {MAPSEC_SKY_PILLAR,      FLAG_LANDMARK_SKY_PILLAR},
    {MAPSEC_SEAFLOOR_CAVERN, FLAG_LANDMARK_SEAFLOOR_CAVERN},
    {MAPSEC_NONE}
};

static struct PokedexAreaScreenEwramStruct *const gPokedexAreaScreenPtr = &ePokedexAreaScreen;

// .text

void UnusedPokedexAreaScreen(u16 a0, MainCallback a1, MainCallback a2)
{
    gPokedexAreaScreenPtr->prev = a1;
    gPokedexAreaScreenPtr->next = a2;
    gPokedexAreaScreenPtr->species = a0;
    SetMainCallback2(CB2_UnusedPokedexAreaScreen);
}

static void CB2_UnusedPokedexAreaScreen(void)
{
    switch (gMain.state)
    {
        case 0:
            SetVBlankCallback(NULL);
            REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_BG1_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
            ResetPaletteFade();
            ResetSpriteData();
            ResetTasks();
            FreeSpriteTileRanges();
            FreeAllSpritePalettes();
            REG_BG0HOFS = 0;
            REG_BG0VOFS = -8;
            REG_BG2VOFS = 0;
            REG_BG2HOFS = 0;
            REG_BG3HOFS = 0;
            REG_BG3VOFS = 0;
            break;
        case 1:
            InitRegionMap(&gPokedexAreaScreenPtr->regionMap, FALSE);
            StringFill(gPokedexAreaScreenPtr->charBuffer, CHAR_SPACE, 16);
            break;
        case 2:
            ResetDrawAreaGlowState();
            break;
        case 3:
            if (DrawAreaGlow())
                return;
            break;
        case 4:
            CreateRegionMapPlayerIcon(1, 1);
            RegionMapDefaultZoomOffsetPlayerSprite(0, -8);
            SetVBlankCallback(VBlankCB_AreaScren);
            break;
        case 5:
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 16, 0, RGB(0, 0, 0));
            break;
        case 6:
            REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
            StartAreaGlow();
            REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
            break;
        case 7:
            SetCallback(DebugCB_WaitFade);
            SetMainCallback2(MainCB_AreaScren);
            return;
    }
    gMain.state++;
}

static void VBlankCB_AreaScren(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void MainCB_AreaScren(void)
{
    gPokedexAreaScreenPtr->callback();
    DoAreaGlow();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void SetCallback(void (*func)(void))
{
    gPokedexAreaScreenPtr->callback = func;
    gPokedexAreaScreenPtr->state = 0;
}

static void ResetDrawAreaGlowState(void)
{
    gPokedexAreaScreenPtr->drawAreaGlowState = 0;
}

bool8 DrawAreaGlow(void)
{
    switch (gPokedexAreaScreenPtr->drawAreaGlowState)
    {
        case 0:
            FindMapsWithMon(gPokedexAreaScreenPtr->species);
            break;
        case 1:
            BuildAreaGlowTilemap();
            break;
        case 2:
            LZ77UnCompVram(gUnknown_083F8438, BG_CHAR_ADDR(3));
            break;
        case 3:
            DmaCopy16(3, gPokedexAreaScreenPtr->areaGlowTilemap, BG_SCREEN_ADDR(30), 0x500);
            break;
        case 4:
            LoadPalette(gUnknown_083F8418, 0, 32);
            break;
        case 5:
            REG_BG0CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(3) | BGCNT_16COLOR | BGCNT_SCREENBASE(30) | BGCNT_TXT256x256;
            gPokedexAreaScreenPtr->drawAreaGlowState++;
            return FALSE;
        default:
            return FALSE;
    }
    gPokedexAreaScreenPtr->drawAreaGlowState++;
    return TRUE;
}

static void FindMapsWithMon(u16 mon)
{
    u16 i;
    struct Roamer *roamer;

    if (mon != ROAMER_SPECIES)
    {
        gPokedexAreaScreenPtr->numOverworldAreas = 0;
        gPokedexAreaScreenPtr->numSpecialAreas = 0;
        for (i = 0; i < ARRAY_COUNT(sSpeciesHiddenFromAreaScreen); i++)
        {
            if (sSpeciesHiddenFromAreaScreen[i] == mon)
                return;
        }
        for (i = 0; sFeebasData[i][0] != NUM_SPECIES; i++)
        {
            if (mon == sFeebasData[i][0])
            {
                switch (sFeebasData[i][1])
                {
                    case MAP_GROUP(PETALBURG_CITY):
                        SetAreaHasMon(sFeebasData[i][1], sFeebasData[i][2]);
                        break;
                    case MAP_GROUP(METEOR_FALLS_1F_1R):
                    case MAP_GROUP(SAFARI_ZONE_NORTHWEST):
                        SetSpecialMapHasMon(sFeebasData[i][1], sFeebasData[i][2]);
                        break;
                }
            }
        }
        for (i = 0; gWildMonHeaders[i].mapGroup != 0xFF; i++)
        {
            if (MapHasMon(gWildMonHeaders + i, mon))
            {
                switch (gWildMonHeaders[i].mapGroup)
                {
                    case MAP_GROUP(PETALBURG_CITY):
                        SetAreaHasMon(gWildMonHeaders[i].mapGroup, gWildMonHeaders[i].mapNum);
                        break;
                    case MAP_GROUP(METEOR_FALLS_1F_1R):
                    case MAP_GROUP(SAFARI_ZONE_NORTHWEST):
                        SetSpecialMapHasMon(gWildMonHeaders[i].mapGroup, gWildMonHeaders[i].mapNum);
                        break;
                }
            }
        }
    }
    else
    {
        gPokedexAreaScreenPtr->numSpecialAreas = 0;
        roamer = &gSaveBlock1.roamer;
        if (roamer->active)
        {
            GetRoamerLocation(&gPokedexAreaScreenPtr->overworldAreasWithMons[0].mapGroup, &gPokedexAreaScreenPtr->overworldAreasWithMons[0].mapNum);
            gPokedexAreaScreenPtr->overworldAreasWithMons[0].regionMapSectionId = Overworld_GetMapHeaderByGroupAndId(gPokedexAreaScreenPtr->overworldAreasWithMons[0].mapGroup, gPokedexAreaScreenPtr->overworldAreasWithMons[0].mapNum)->regionMapSectionId;
            gPokedexAreaScreenPtr->numOverworldAreas = 1;
        }
        else
            gPokedexAreaScreenPtr->numOverworldAreas = 0;
    }
}

static void SetAreaHasMon(u16 mapGroup, u16 mapNum)
{
    if (gPokedexAreaScreenPtr->numOverworldAreas < 0x40)
    {
        gPokedexAreaScreenPtr->overworldAreasWithMons[gPokedexAreaScreenPtr->numOverworldAreas].mapGroup = mapGroup;
        gPokedexAreaScreenPtr->overworldAreasWithMons[gPokedexAreaScreenPtr->numOverworldAreas].mapNum = mapNum;
        gPokedexAreaScreenPtr->overworldAreasWithMons[gPokedexAreaScreenPtr->numOverworldAreas].regionMapSectionId = GetOverworldMapFromUnderwaterMap(Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum)->regionMapSectionId);
        gPokedexAreaScreenPtr->numOverworldAreas++;
    }
}

static void SetSpecialMapHasMon(u16 mapGroup, u16 mapNum)
{
    const struct MapHeader *mapHeader;
    u16 i;

    if (gPokedexAreaScreenPtr->numSpecialAreas < 0x20)
    {
        mapHeader = Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum);
        if (mapHeader->regionMapSectionId < MAPSEC_NONE)
        {
            for (i = 0; sLandmarkData[i][0] != MAPSEC_NONE; i++)
            {
                if (mapHeader->regionMapSectionId == sLandmarkData[i][0] && !FlagGet(sLandmarkData[i][1]))
                    return;
            }
            for (i = 0; i < gPokedexAreaScreenPtr->numSpecialAreas; i++)
            {
                if (gPokedexAreaScreenPtr->specialAreaRegionMapSectionIds[i] == mapHeader->regionMapSectionId)
                    break;
            }
            if (i == gPokedexAreaScreenPtr->numSpecialAreas)
            {
                gPokedexAreaScreenPtr->specialAreaRegionMapSectionIds[i] = mapHeader->regionMapSectionId;
                gPokedexAreaScreenPtr->numSpecialAreas++;
            }
        }
    }
}

static bool8 MapHasMon(const struct WildPokemonHeader *header, u16 mon)
{
    if (MonListHasMon(header->landMonsInfo, mon, 12))
        return TRUE;
    if (MonListHasMon(header->waterMonsInfo, mon, 5))
        return TRUE;
    if (MonListHasMon(header->fishingMonsInfo, mon, 12))
        return TRUE;
    if (MonListHasMon(header->rockSmashMonsInfo, mon, 5))
        return TRUE;
    return FALSE;
}

static bool8 MonListHasMon(const struct WildPokemonInfo *info, u16 mon, u16 size)
{
    u16 i;
    if (info != NULL)
    {
        for (i = 0; i < size; i++)
        {
            if (info->wildPokemon[i].species == mon)
                return TRUE;
        }
    }
    return FALSE;
}

static void BuildAreaGlowTilemap(void)
{
    static EWRAM_DATA u16 gUnknown_02039260 = 0;
    static EWRAM_DATA u16 gUnknown_02039262 = 0;
    static EWRAM_DATA u16 gUnknown_02039264 = 0;
    static EWRAM_DATA u16 gUnknown_02039266 = 0;
    static EWRAM_DATA u16 gUnknown_02039268 = 0;
    static EWRAM_DATA u16 gUnknown_0203926A = 0;
    u8 r3;

    for (gUnknown_02039260 = 0; gUnknown_02039260 < 0x280; gUnknown_02039260++)
        gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] = 0;

    for (gUnknown_02039260 = 0; gUnknown_02039260 < gPokedexAreaScreenPtr->numOverworldAreas;
         gUnknown_02039260++)
    {
        gUnknown_02039266 = 0;
        for (gUnknown_02039264 = 0; gUnknown_02039264 < 20; gUnknown_02039264++)
        {
            for (gUnknown_02039262 = 0; gUnknown_02039262 < 32; gUnknown_02039262++)
            {
                if (GetRegionMapSectionAt_(gUnknown_02039262, gUnknown_02039264) ==
                    gPokedexAreaScreenPtr->overworldAreasWithMons[gUnknown_02039260]
                        .regionMapSectionId)
                {
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266] = 0xFFFF;
                }
                gUnknown_02039266++;
            }
        }
    }

    gUnknown_02039266 = 0;
    for (gUnknown_02039264 = 0; gUnknown_02039264 < 20; gUnknown_02039264++)
    {
        for (gUnknown_02039262 = 0; gUnknown_02039262 < 32; gUnknown_02039262++)
        {
            if (gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266] == 0xFFFF)
            {
                if (gUnknown_02039262 != 0 &&
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 1] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 1] |= 0x02;
                if (gUnknown_02039262 != 31 &&
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 1] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 1] |= 0x01;
                if (gUnknown_02039264 != 0 &&
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 32] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 32] |= 0x08;
                if (gUnknown_02039264 != 19 &&
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 32] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 32] |= 0x04;
                if (gUnknown_02039262 != 0 && gUnknown_02039264 != 0 &&
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 33] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 33] |= 0x10;
                if (gUnknown_02039262 != 31 && gUnknown_02039264 != 0 &&
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 31] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 31] |= 0x40;
                if (gUnknown_02039262 != 0 && gUnknown_02039264 != 19 &&
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 31] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 31] |= 0x20;
                if (gUnknown_02039262 != 31 && gUnknown_02039264 != 19 &&
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 33] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 33] |= 0x80;
            }
            gUnknown_02039266++;
        }
    }

    for (gUnknown_02039260 = 0; gUnknown_02039260 < 0x280;
         gUnknown_02039260++) // Register difference on induction: expected r3, got r1
    {
        if (gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] == 0xFFFF)
            gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] = 0x10;
        else if (gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] != 0)
        {
            if (gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] & 0x02)
                gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] &= 0xFFCF;
            if (gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] & 0x01)
                gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] &= 0xFF3F;
            if (gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] & 0x08)
                gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] &= 0xFFAF;
            if (gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] & 0x04)
                gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] &= 0xFF5F;
            gUnknown_02039268 = gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] & 0x0F;
            gUnknown_0203926A = gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] & 0xF0;
            if (!gUnknown_0203926A)
            {
                continue;
            }

            gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] &= 0x0F;
            switch (gUnknown_02039268)
            {
            case 0:
                if (gUnknown_0203926A != 0)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] +=
                        (gUnknown_0203926A >> 4) + 0x10;
                break;
            case 2:
                if (gUnknown_0203926A != 0)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] +=
                        (gUnknown_0203926A >> 4) + 0x1E;
                break;
            case 1:
                if (gUnknown_0203926A != 0)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] +=
                        (gUnknown_0203926A >> 6) + 0x20;
                break;
            case 8:
                if (gUnknown_0203926A != 0)
                {
                    r3 = 0;
                    if (gUnknown_0203926A & 0x80)
                        r3 |= 1;
                    if (gUnknown_0203926A & 0x20)
                        r3 |= 2;
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] += r3 + 0x20;
                }
                break;
            case 4:
                if (gUnknown_0203926A != 0)
                {
                    r3 = 0;
                    if (gUnknown_0203926A & 0x40)
                        r3 |= 1;
                    if (gUnknown_0203926A & 0x10)
                        r3 |= 2;
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] += r3 + 0x21;
                }
                break;
            case 5:
            case 6:
                gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] += 0x27;
                break;
            case 9:
            case 10:
                gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] += 0x25;
                break;
            }
        }
        gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] |= 0; // Needed to match
    }
}

static void StartAreaGlow(void)
{
    if (gPokedexAreaScreenPtr->numSpecialAreas != 0 && gPokedexAreaScreenPtr->numOverworldAreas == 0)
        gPokedexAreaScreenPtr->whichMarkersFlashing = 1;
    else
        gPokedexAreaScreenPtr->whichMarkersFlashing = 0;
    gPokedexAreaScreenPtr->areaShadeOrMarkerFrameCounter = 0;
    gPokedexAreaScreenPtr->areaShadeFrameCounter = 0;
    gPokedexAreaScreenPtr->areaShadeBldArgLo = 0;
    gPokedexAreaScreenPtr->areaShadeBldArgHi = 0x40;
    gPokedexAreaScreenPtr->specialMarkerCycleCounter = 1;
    REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
    REG_BLDALPHA = 0x1000;
    DoAreaGlow();
}

static void DoAreaGlow(void)
{
    u16 x;
    u16 y;
    u16 i;

    if (gPokedexAreaScreenPtr->whichMarkersFlashing == 0)
    {
        if (gPokedexAreaScreenPtr->areaShadeOrMarkerFrameCounter == 0)
        {
            gPokedexAreaScreenPtr->areaShadeFrameCounter++;
            if (gPokedexAreaScreenPtr->areaShadeFrameCounter & 1)
                gPokedexAreaScreenPtr->areaShadeBldArgLo = (gPokedexAreaScreenPtr->areaShadeBldArgLo + 4) & 0x7f;
            else
                gPokedexAreaScreenPtr->areaShadeBldArgHi = (gPokedexAreaScreenPtr->areaShadeBldArgHi + 4) & 0x7f;
            x = gSineTable[gPokedexAreaScreenPtr->areaShadeBldArgLo] >> 4;
            y = gSineTable[gPokedexAreaScreenPtr->areaShadeBldArgHi] >> 4;
            REG_BLDALPHA = x | (y << 8);
            gPokedexAreaScreenPtr->areaShadeOrMarkerFrameCounter = 0;
            if (gPokedexAreaScreenPtr->areaShadeFrameCounter == 0x40)
            {
                gPokedexAreaScreenPtr->areaShadeFrameCounter = 0;
                if (gPokedexAreaScreenPtr->numSpecialAreas != 0)
                    gPokedexAreaScreenPtr->whichMarkersFlashing = 1;
            }
        }
        else
            gPokedexAreaScreenPtr->areaShadeOrMarkerFrameCounter--;
    }
    else
    {
        gPokedexAreaScreenPtr->areaShadeOrMarkerFrameCounter++;
        if (gPokedexAreaScreenPtr->areaShadeOrMarkerFrameCounter > 12)
        {
            gPokedexAreaScreenPtr->areaShadeOrMarkerFrameCounter = 0;
            gPokedexAreaScreenPtr->specialMarkerCycleCounter++;
            for (i = 0; i < gPokedexAreaScreenPtr->numSpecialAreas; i++)
            {
                gPokedexAreaScreenPtr->areaMarkerSprites[i]->invisible = gPokedexAreaScreenPtr->specialMarkerCycleCounter & 1;
            }
            if (gPokedexAreaScreenPtr->specialMarkerCycleCounter > 4)
            {
                gPokedexAreaScreenPtr->specialMarkerCycleCounter = 1;
                if (gPokedexAreaScreenPtr->numOverworldAreas != 0)
                    gPokedexAreaScreenPtr->whichMarkersFlashing = 0;
            }
        }
    }
}

static void DebugCB_WaitFade(void)
{
    switch (gPokedexAreaScreenPtr->state)
    {
        case 0:
            gPokedexAreaScreenPtr->state = 1;
            break;
        case 1:
            if (!UpdatePaletteFade())
            {
                SetCallback(DebugCB_WaitButton);
            }
            break;
    }
}

static void DebugCB_WaitButton(void)
{
    switch (gPokedexAreaScreenPtr->state)
    {
        case 0:
            if (gMain.newKeys & B_BUTTON)
            {
                SetCallback(DebugCB_GoBack);
            }
            else if (gMain.newKeys & DPAD_RIGHT || (gMain.newKeys & R_BUTTON && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
            {
                SetCallback(DebugCB_GoNext);
            }
            break;
    }
}

static void DebugCB_GoBack(void)
{
    switch (gPokedexAreaScreenPtr->state)
    {
        case 0:
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, RGB(0, 0, 0));
            gPokedexAreaScreenPtr->state++;
            break;
        case 1:
            if (!UpdatePaletteFade())
            {
                FreeRegionMapIconResources();
                SetMainCallback2(gPokedexAreaScreenPtr->prev);
            }
            break;
    }
}

static void DebugCB_GoNext(void)
{
    switch (gPokedexAreaScreenPtr->state)
    {
        case 0:
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, RGB(0, 0, 0));
            gPokedexAreaScreenPtr->state++;
            break;
        case 1:
            if (!UpdatePaletteFade())
            {
                FreeRegionMapIconResources();
                SetMainCallback2(gPokedexAreaScreenPtr->next);
            }
            break;
    }
}

static void Task_PokedexAreaScreen_0(u8 taskId);
static void Task_PokedexAreaScreen_1(u8 taskId);
static void CreateAreaMarkerSprites(void);
static void DestroyAreaSprites(void);
static void LoadAreaUnknownGraphics(void);
static void CreateAreaUnknownSprites(void);

void ShowPokedexAreaScreen(u16 species, u8 * errno)
{
    u8 taskId;
    gPokedexAreaScreenPtr->species = species;
    gPokedexAreaScreenPtr->errno = errno;
    errno[0] = 0;
    taskId = CreateTask(Task_PokedexAreaScreen_0, 0);
    gTasks[taskId].data[0] = 0;
}

static void Task_PokedexAreaScreen_0(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
        case 0:
            REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_BG1_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
            REG_BG0HOFS = 0;
            REG_BG0VOFS = -8;
            REG_BG2VOFS = 0;
            REG_BG2HOFS = 0;
            REG_BG3HOFS = 0;
            REG_BG3VOFS = 0;
            break;
        case 1:
            ResetPaletteFade();
            ResetSpriteData();
            FreeAllSpritePalettes();
            break;
        case 2:
            InitRegionMap(&gPokedexAreaScreenPtr->regionMap, FALSE);
            StringFill(gPokedexAreaScreenPtr->charBuffer, CHAR_SPACE, 16);
            break;
        case 3:
            ResetDrawAreaGlowState();
            break;
        case 4:
            if (DrawAreaGlow())
                return;
            break;
        case 5:
            CreateRegionMapPlayerIcon(1, 1);
            RegionMapDefaultZoomOffsetPlayerSprite(0, -8);
            break;
        case 6:
            CreateAreaMarkerSprites();
            break;
        case 7:
            LoadAreaUnknownGraphics();
            break;
        case 8:
            CreateAreaUnknownSprites();
            break;
        case 9:
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 16, 0, RGB(0, 0, 0));
            break;
        case 10:
            REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
            StartAreaGlow();
            REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
            break;
        case 11:
            gTasks[taskId].func = Task_PokedexAreaScreen_1;
            gTasks[taskId].data[0] = 0;
            return;
    }
    gTasks[taskId].data[0]++;
}

static void Task_PokedexAreaScreen_1(u8 taskId)
{
    DoAreaGlow();
    switch (gTasks[taskId].data[0])
    {
        default:
            gTasks[taskId].data[0] = 0;
        case 0:
            if (gPaletteFade.active)
                return;
            break;
        case 1:
            if (gMain.newKeys & B_BUTTON)
            {
                gTasks[taskId].data[1] = 1;
                PlaySE(SE_PC_OFF);
            }
            else if (gMain.newKeys & DPAD_RIGHT || (gMain.newKeys & R_BUTTON && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
            {
                gTasks[taskId].data[1] = 2;
                PlaySE(SE_DEX_PAGE);
            }
            else
                return;
            break;
        case 2:
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, RGB(0, 0, 0));
            break;
        case 3:
            if (gPaletteFade.active)
                return;
            DestroyAreaSprites();
            gPokedexAreaScreenPtr->errno[0] = gTasks[taskId].data[1];
            DestroyTask(taskId);
            return;
    }
    gTasks[taskId].data[0]++;
}

const u16 AreaMarkerPalette[];
const u8 AreaMarkerTiles[];

const struct SpriteSheet sAreaMarkerSpriteSheet = {
    AreaMarkerTiles, 0x80, 2
};

const struct SpritePalette sAreaMarkerSpritePalette = {
    AreaMarkerPalette, 2
};

const struct OamData sAreaMarkerOamData = {
    .size = 1,
    .priority = 1
};

const struct SpriteTemplate sAreaMarkerSpriteTemplate = {
    2,
    2,
    &sAreaMarkerOamData,
    gDummySpriteAnimTable,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

const u16 AreaMarkerPalette[] = INCBIN_U16("graphics/pokedex/area_marker.gbapal");
const u8 AreaMarkerTiles[] = INCBIN_U8("graphics/pokedex/area_marker.4bpp");

static void CreateAreaMarkerSprites(void)
{
    s16 i;
    u8 spriteId;
    s16 x;
    s16 y;
    s16 cnt;
    s16 mapSecId;

    LoadSpriteSheet(&sAreaMarkerSpriteSheet);
    LoadSpritePalette(&sAreaMarkerSpritePalette);
    cnt = 0;
    for (i = 0; i < gPokedexAreaScreenPtr->numSpecialAreas; i++)
    {
        mapSecId = gPokedexAreaScreenPtr->specialAreaRegionMapSectionIds[i];
        x = 8 * (gRegionMapEntries[mapSecId].x + 1) + 4;
        y = 8 * (gRegionMapEntries[mapSecId].y) + 28;
        x += 4 * (gRegionMapEntries[mapSecId].width - 1);
        y += 4 * (gRegionMapEntries[mapSecId].height - 1);
        spriteId = CreateSprite(&sAreaMarkerSpriteTemplate, x, y, 0);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].invisible = TRUE;
            gPokedexAreaScreenPtr->areaMarkerSprites[cnt++] = gSprites + spriteId;
        }
    }
    gPokedexAreaScreenPtr->numAreaMarkerSprites = cnt;
}

static void DestroyAreaSprites(void)
{
    u16 i;
    FreeSpriteTilesByTag(2);
    FreeSpritePaletteByTag(2);
    for (i = 0; i < gPokedexAreaScreenPtr->numAreaMarkerSprites; i++)
    {
        DestroySprite(gPokedexAreaScreenPtr->areaMarkerSprites[i]);
    }
    FreeSpriteTilesByTag(3);
    FreeSpritePaletteByTag(3);
    for (i = 0; i < 3; i++)
    {
        if (gPokedexAreaScreenPtr->areaUnknownSprites[i] != NULL)
        {
            DestroySprite(gPokedexAreaScreenPtr->areaUnknownSprites[i]);
        }
    }
}

const struct SpritePalette sAreaUnknownSpritePalette = {gAreaUnknownPalette, 3};

static void LoadAreaUnknownGraphics(void)
{
    struct SpriteSheet spriteSheet = {gPokedexAreaScreenPtr->areaUnknownGraphicsBuffer, 0x600, 3};

    LZ77UnCompWram(gAreaUnknownTiles, gPokedexAreaScreenPtr->areaUnknownGraphicsBuffer);
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&sAreaUnknownSpritePalette);
}

const struct OamData sAreaUnknownOamData = {
    .size = 2,
    .priority = 1
};

const struct SpriteTemplate sAreaUnknownSpriteTemplate = {
    3,
    3,
    &sAreaUnknownOamData,
    gDummySpriteAnimTable,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

static void CreateAreaUnknownSprites(void)
{
    u16 i;
    u8 spriteId;

    if (gPokedexAreaScreenPtr->numOverworldAreas != 0 || gPokedexAreaScreenPtr->numSpecialAreas != 0)
    {
        for (i = 0; i < 3; i++)
        {
            gPokedexAreaScreenPtr->areaUnknownSprites[i] = NULL;
        }
    }
    else
    {
        for (i = 0; i < 3; i++)
        {
            spriteId = CreateSprite(&sAreaUnknownSpriteTemplate, i * 32 + 0xa0, 0x8c, 0);
            if (spriteId != MAX_SPRITES)
            {
                gSprites[spriteId].oam.tileNum += i * 16;
                gPokedexAreaScreenPtr->areaUnknownSprites[i] = gSprites + spriteId;
            }
            else
                gPokedexAreaScreenPtr->areaUnknownSprites[i] = NULL;
        }
    }
}
