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
    {MAPSEC_NOTHING}
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
        if (mapHeader->regionMapSectionId < MAPSEC_NOTHING)
        {
            for (i = 0; sLandmarkData[i][0] != MAPSEC_NOTHING; i++)
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

#ifdef NONMATCHING
static void BuildAreaGlowTilemap(void)
{
    static EWRAM_DATA u16 gUnknown_02039260 = 0;
    static EWRAM_DATA u16 gUnknown_02039262 = 0;
    static EWRAM_DATA u16 gUnknown_02039264 = 0;
    static EWRAM_DATA u16 gUnknown_02039266 = 0;
    static EWRAM_DATA u16 gUnknown_02039268 = 0;
    static EWRAM_DATA u16 gUnknown_0203926A = 0;
    u32 r3;

    for (gUnknown_02039260 = 0; gUnknown_02039260 < 0x280; gUnknown_02039260++)
        gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] = 0;

    for (gUnknown_02039260 = 0; gUnknown_02039260 < gPokedexAreaScreenPtr->numOverworldAreas; gUnknown_02039260++)
    {
        gUnknown_02039266 = 0;
        for (gUnknown_02039264 = 0; gUnknown_02039264 < 20; gUnknown_02039264++)
        {
            for (gUnknown_02039262 = 0; gUnknown_02039262 < 32; gUnknown_02039262++)
            {
                if (GetRegionMapSectionAt_(gUnknown_02039262, gUnknown_02039264) == gPokedexAreaScreenPtr->overworldAreasWithMons[gUnknown_02039260].regionMapSectionId)
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
                if (gUnknown_02039262 != 0 && gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 1] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 1] |= 0x02;
                if (gUnknown_02039262 != 31 && gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 1] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 1] |= 0x01;
                if (gUnknown_02039264 != 0 && gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 32] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 32] |= 0x08;
                if (gUnknown_02039264 != 19 && gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 32] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 32] |= 0x04;
                if (gUnknown_02039262 != 0 && gUnknown_02039264 != 0 && gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 33] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 33] |= 0x10;
                if (gUnknown_02039262 != 31 && gUnknown_02039264 != 0 && gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 31] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 - 31] |= 0x40;
                if (gUnknown_02039262 != 0 && gUnknown_02039264 != 19 && gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 31] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 31] |= 0x20;
                if (gUnknown_02039262 != 31 && gUnknown_02039264 != 19 && gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 33] != 0xFFFF)
                    gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039266 + 33] |= 0x80;
            }
            gUnknown_02039266++;
        }
    }

    for (gUnknown_02039260 = 0; gUnknown_02039260 < 0x280; gUnknown_02039260++) // Register difference on induction: expected r3, got r1
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
            if (gUnknown_0203926A)
            {
                gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] &= 0x0F;
                switch (gUnknown_02039268)
                {
                    case 0:
                        if (gUnknown_0203926A != 0)
                            gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] += (gUnknown_0203926A >> 4) + 0x10;
                        break;
                    case 2:
                        if (gUnknown_0203926A != 0)
                            gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] += (gUnknown_0203926A >> 4) + 0x1E;
                        break;
                    case 1:
                        if (gUnknown_0203926A != 0)
                            gPokedexAreaScreenPtr->areaGlowTilemap[gUnknown_02039260] += (gUnknown_0203926A >> 6) + 0x20;
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
        }
    }
}
# else
EWRAM_DATA u16 gUnknown_02039260 = 0;
EWRAM_DATA u16 gUnknown_02039262 = 0;
EWRAM_DATA u16 gUnknown_02039264 = 0;
EWRAM_DATA u16 gUnknown_02039266 = 0;
EWRAM_DATA u16 gUnknown_02039268 = 0;
EWRAM_DATA u16 gUnknown_0203926A = 0;
static NAKED void BuildAreaGlowTilemap(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0xC\n"
                "\tldr r1, _08110E5C @ =gUnknown_02039260\n"
                "\tmovs r0, 0\n"
                "\tstrh r0, [r1]\n"
                "\tmov r9, r1\n"
                "\tldr r0, _08110E60 @ =gSharedMem\n"
                "\tmov r8, r0\n"
                "\tldr r1, _08110E64 @ =gUnknown_02039262\n"
                "\tmov r12, r1\n"
                "\tmov r1, r9\n"
                "\tmovs r4, 0x8B\n"
                "\tlsls r4, 1\n"
                "\tadd r4, r8\n"
                "\tldr r3, _08110E68 @ =0x0000027f\n"
                "\tmovs r2, 0\n"
                "_08110C5C:\n"
                "\tldrh r0, [r1]\n"
                "\tlsls r0, 1\n"
                "\tadds r0, r4\n"
                "\tstrh r2, [r0]\n"
                "\tldrh r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1]\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tcmp r0, r3\n"
                "\tbls _08110C5C\n"
                "\tmovs r0, 0\n"
                "\tmov r3, r9\n"
                "\tstrh r0, [r3]\n"
                "\tmovs r1, 0x88\n"
                "\tlsls r1, 1\n"
                "\tadd r1, r8\n"
                "\tldrh r0, [r1]\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110D04\n"
                "\tldr r4, _08110E6C @ =gUnknown_02039266\n"
                "\tmovs r2, 0\n"
                "\tldr r5, _08110E64 @ =gUnknown_02039262\n"
                "\tmov r0, r8\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tmovs r1, 0x8B\n"
                "\tlsls r1, 1\n"
                "\tadd r1, r8\n"
                "\tmov r10, r1\n"
                "\tldr r6, _08110E70 @ =gUnknown_02039264\n"
                "\tmov r7, r9\n"
                "_08110C9A:\n"
                "\tstrh r2, [r4]\n"
                "\tldr r3, _08110E70 @ =gUnknown_02039264\n"
                "\tstrh r2, [r3]\n"
                "_08110CA0:\n"
                "\tmov r0, r12\n"
                "\tstrh r2, [r0]\n"
                "_08110CA4:\n"
                "\tldrh r0, [r5]\n"
                "\tldrh r1, [r6]\n"
                "\tstr r2, [sp]\n"
                "\tbl GetRegionMapSectionAt_\n"
                "\tldrh r1, [r7]\n"
                "\tlsls r1, 2\n"
                "\tldr r3, [sp, 0x8]\n"
                "\tadds r1, r3\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tldr r2, [sp]\n"
                "\tldrh r1, [r1, 0x12]\n"
                "\tcmp r0, r1\n"
                "\tbne _08110CCC\n"
                "\tldrh r0, [r4]\n"
                "\tlsls r0, 1\n"
                "\tadd r0, r10\n"
                "\tldr r1, _08110E74 @ =0x0000ffff\n"
                "\tstrh r1, [r0]\n"
                "_08110CCC:\n"
                "\tldrh r0, [r4]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4]\n"
                "\tldrh r0, [r5]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r5]\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tcmp r0, 0x1F\n"
                "\tbls _08110CA4\n"
                "\tldrh r0, [r6]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r6]\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tldr r1, _08110E64 @ =gUnknown_02039262\n"
                "\tmov r12, r1\n"
                "\tcmp r0, 0x13\n"
                "\tbls _08110CA0\n"
                "\tldrh r0, [r7]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r7]\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tldr r3, _08110E78 @ =gSharedMem + 0x110\n"
                "\tldrh r3, [r3]\n"
                "\tcmp r0, r3\n"
                "\tbcc _08110C9A\n"
                "_08110D04:\n"
                "\tmovs r0, 0\n"
                "\tldr r1, _08110E6C @ =gUnknown_02039266\n"
                "\tstrh r0, [r1]\n"
                "\tldr r3, _08110E70 @ =gUnknown_02039264\n"
                "\tstrh r0, [r3]\n"
                "\tldr r6, _08110E64 @ =gUnknown_02039262\n"
                "\tmov r10, r0\n"
                "\tadds r3, r1, 0\n"
                "\tldr r5, _08110E7C @ =gSharedMem + 0x116\n"
                "\tldr r4, _08110E74 @ =0x0000ffff\n"
                "\tldr r7, _08110E70 @ =gUnknown_02039264\n"
                "_08110D1A:\n"
                "\tmov r0, r10\n"
                "\tstrh r0, [r6]\n"
                "_08110D1E:\n"
                "\tldrh r1, [r3]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r5\n"
                "\tldrh r0, [r0]\n"
                "\tcmp r0, r4\n"
                "\tbne _08110E10\n"
                "\tldrh r0, [r6]\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110D42\n"
                "\tsubs r0, r1, 0x1\n"
                "\tlsls r0, 1\n"
                "\tadds r2, r0, r5\n"
                "\tldrh r1, [r2]\n"
                "\tcmp r1, r4\n"
                "\tbeq _08110D42\n"
                "\tmovs r0, 0x2\n"
                "\torrs r0, r1\n"
                "\tstrh r0, [r2]\n"
                "_08110D42:\n"
                "\tldrh r0, [r6]\n"
                "\tcmp r0, 0x1F\n"
                "\tbeq _08110D5C\n"
                "\tldrh r0, [r3]\n"
                "\tadds r0, 0x1\n"
                "\tlsls r0, 1\n"
                "\tadds r2, r0, r5\n"
                "\tldrh r1, [r2]\n"
                "\tcmp r1, r4\n"
                "\tbeq _08110D5C\n"
                "\tmovs r0, 0x1\n"
                "\torrs r0, r1\n"
                "\tstrh r0, [r2]\n"
                "_08110D5C:\n"
                "\tldrh r0, [r7]\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110D76\n"
                "\tldrh r0, [r3]\n"
                "\tsubs r0, 0x20\n"
                "\tlsls r0, 1\n"
                "\tadds r2, r0, r5\n"
                "\tldrh r1, [r2]\n"
                "\tcmp r1, r4\n"
                "\tbeq _08110D76\n"
                "\tmovs r0, 0x8\n"
                "\torrs r0, r1\n"
                "\tstrh r0, [r2]\n"
                "_08110D76:\n"
                "\tldrh r0, [r7]\n"
                "\tcmp r0, 0x13\n"
                "\tbeq _08110D90\n"
                "\tldrh r0, [r3]\n"
                "\tadds r0, 0x20\n"
                "\tlsls r0, 1\n"
                "\tadds r2, r0, r5\n"
                "\tldrh r1, [r2]\n"
                "\tcmp r1, r4\n"
                "\tbeq _08110D90\n"
                "\tmovs r0, 0x4\n"
                "\torrs r0, r1\n"
                "\tstrh r0, [r2]\n"
                "_08110D90:\n"
                "\tldrh r0, [r6]\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110DB0\n"
                "\tldrh r0, [r7]\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110DB0\n"
                "\tldrh r0, [r3]\n"
                "\tsubs r0, 0x21\n"
                "\tlsls r0, 1\n"
                "\tadds r2, r0, r5\n"
                "\tldrh r1, [r2]\n"
                "\tcmp r1, r4\n"
                "\tbeq _08110DB0\n"
                "\tmovs r0, 0x10\n"
                "\torrs r0, r1\n"
                "\tstrh r0, [r2]\n"
                "_08110DB0:\n"
                "\tldrh r0, [r6]\n"
                "\tcmp r0, 0x1F\n"
                "\tbeq _08110DD0\n"
                "\tldrh r0, [r7]\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110DD0\n"
                "\tldrh r0, [r3]\n"
                "\tsubs r0, 0x1F\n"
                "\tlsls r0, 1\n"
                "\tadds r2, r0, r5\n"
                "\tldrh r1, [r2]\n"
                "\tcmp r1, r4\n"
                "\tbeq _08110DD0\n"
                "\tmovs r0, 0x40\n"
                "\torrs r0, r1\n"
                "\tstrh r0, [r2]\n"
                "_08110DD0:\n"
                "\tldrh r0, [r6]\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110DF0\n"
                "\tldrh r0, [r7]\n"
                "\tcmp r0, 0x13\n"
                "\tbeq _08110DF0\n"
                "\tldrh r0, [r3]\n"
                "\tadds r0, 0x1F\n"
                "\tlsls r0, 1\n"
                "\tadds r2, r0, r5\n"
                "\tldrh r1, [r2]\n"
                "\tcmp r1, r4\n"
                "\tbeq _08110DF0\n"
                "\tmovs r0, 0x20\n"
                "\torrs r0, r1\n"
                "\tstrh r0, [r2]\n"
                "_08110DF0:\n"
                "\tldrh r0, [r6]\n"
                "\tcmp r0, 0x1F\n"
                "\tbeq _08110E10\n"
                "\tldrh r0, [r7]\n"
                "\tcmp r0, 0x13\n"
                "\tbeq _08110E10\n"
                "\tldrh r0, [r3]\n"
                "\tadds r0, 0x21\n"
                "\tlsls r0, 1\n"
                "\tadds r2, r0, r5\n"
                "\tldrh r1, [r2]\n"
                "\tcmp r1, r4\n"
                "\tbeq _08110E10\n"
                "\tmovs r0, 0x80\n"
                "\torrs r0, r1\n"
                "\tstrh r0, [r2]\n"
                "_08110E10:\n"
                "\tldrh r0, [r3]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r3]\n"
                "\tldrh r0, [r6]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r6]\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tcmp r0, 0x1F\n"
                "\tbhi _08110E26\n"
                "\tb _08110D1E\n"
                "_08110E26:\n"
                "\tldrh r0, [r7]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r7]\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tcmp r0, 0x13\n"
                "\tbhi _08110E36\n"
                "\tb _08110D1A\n"
                "_08110E36:\n"
                "\tmovs r0, 0\n"
                "\tmov r1, r9\n"
                "\tstrh r0, [r1]\n"
                "_08110E3C:\n"
                "\tmov r3, r9\n"
                "\tldrh r0, [r3]\n"
                "\tlsls r0, 1\n"
                "\tmovs r4, 0x8B\n"
                "\tlsls r4, 1\n"
                "\tadd r4, r8\n"
                "\tadds r3, r0, r4\n"
                "\tldrh r2, [r3]\n"
                "\tadds r1, r2, 0\n"
                "\tldr r0, _08110E74 @ =0x0000ffff\n"
                "\tcmp r1, r0\n"
                "\tbne _08110E80\n"
                "\tmovs r0, 0x10\n"
                "\tstrh r0, [r3]\n"
                "\tb _0811105E\n"
                "\t.align 2, 0\n"
                "_08110E5C: .4byte gUnknown_02039260\n"
                "_08110E60: .4byte gSharedMem\n"
                "_08110E64: .4byte gUnknown_02039262\n"
                "_08110E68: .4byte 0x0000027f\n"
                "_08110E6C: .4byte gUnknown_02039266\n"
                "_08110E70: .4byte gUnknown_02039264\n"
                "_08110E74: .4byte 0x0000ffff\n"
                "_08110E78: .4byte gSharedMem + 0x110\n"
                "_08110E7C: .4byte gSharedMem + 0x116\n"
                "_08110E80:\n"
                "\tcmp r1, 0\n"
                "\tbne _08110E86\n"
                "\tb _0811105E\n"
                "_08110E86:\n"
                "\tmovs r0, 0x2\n"
                "\tands r0, r2\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110E94\n"
                "\tldr r0, _08110F28 @ =0x0000ffcf\n"
                "\tands r0, r2\n"
                "\tstrh r0, [r3]\n"
                "_08110E94:\n"
                "\tmov r1, r9\n"
                "\tldrh r0, [r1]\n"
                "\tlsls r0, 1\n"
                "\tadds r2, r0, r4\n"
                "\tldrh r1, [r2]\n"
                "\tmovs r0, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110EAC\n"
                "\tldr r0, _08110F2C @ =0x0000ff3f\n"
                "\tands r0, r1\n"
                "\tstrh r0, [r2]\n"
                "_08110EAC:\n"
                "\tmov r3, r9\n"
                "\tldrh r0, [r3]\n"
                "\tlsls r0, 1\n"
                "\tadds r2, r0, r4\n"
                "\tldrh r1, [r2]\n"
                "\tmovs r0, 0x8\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110EC4\n"
                "\tldr r0, _08110F30 @ =0x0000ffaf\n"
                "\tands r0, r1\n"
                "\tstrh r0, [r2]\n"
                "_08110EC4:\n"
                "\tmov r1, r9\n"
                "\tldrh r0, [r1]\n"
                "\tlsls r0, 1\n"
                "\tadds r2, r0, r4\n"
                "\tldrh r1, [r2]\n"
                "\tmovs r0, 0x4\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110EDC\n"
                "\tldr r0, _08110F34 @ =0x0000ff5f\n"
                "\tands r0, r1\n"
                "\tstrh r0, [r2]\n"
                "_08110EDC:\n"
                "\tldr r6, _08110F38 @ =gUnknown_02039268\n"
                "\tmov r3, r9\n"
                "\tldrh r0, [r3]\n"
                "\tlsls r0, 1\n"
                "\tadds r0, r4\n"
                "\tldrh r1, [r0]\n"
                "\tmovs r5, 0xF\n"
                "\tadds r0, r5, 0\n"
                "\tands r0, r1\n"
                "\tstrh r0, [r6]\n"
                "\tldr r2, _08110F3C @ =gUnknown_0203926A\n"
                "\tldrh r0, [r3]\n"
                "\tlsls r0, 1\n"
                "\tadds r0, r4\n"
                "\tldrh r1, [r0]\n"
                "\tmovs r0, 0xF0\n"
                "\tands r0, r1\n"
                "\tstrh r0, [r2]\n"
                "\tldrh r1, [r3]\n"
                "\tadds r3, r2, 0\n"
                "\tcmp r0, 0\n"
                "\tbne _08110F0A\n"
                "\tb _0811105E\n"
                "_08110F0A:\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r4\n"
                "\tldrh r2, [r0]\n"
                "\tadds r1, r5, 0\n"
                "\tands r1, r2\n"
                "\tstrh r1, [r0]\n"
                "\tldrh r0, [r6]\n"
                "\tcmp r0, 0xA\n"
                "\tbls _08110F1E\n"
                "\tb _0811105E\n"
                "_08110F1E:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _08110F40 @ =_08110F44\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_08110F28: .4byte 0x0000ffcf\n"
                "_08110F2C: .4byte 0x0000ff3f\n"
                "_08110F30: .4byte 0x0000ffaf\n"
                "_08110F34: .4byte 0x0000ff5f\n"
                "_08110F38: .4byte gUnknown_02039268\n"
                "_08110F3C: .4byte gUnknown_0203926A\n"
                "_08110F40: .4byte _08110F44\n"
                "\t.align 2, 0\n"
                "_08110F44:\n"
                "\t.4byte _08110F70\n"
                "\t.4byte _08110FAC\n"
                "\t.4byte _08110F8E\n"
                "\t.4byte _0811105E\n"
                "\t.4byte _08111002\n"
                "\t.4byte _08111036\n"
                "\t.4byte _08111036\n"
                "\t.4byte _0811105E\n"
                "\t.4byte _08110FCE\n"
                "\t.4byte _0811104A\n"
                "\t.4byte _0811104A\n"
                "_08110F70:\n"
                "\tldrh r0, [r3]\n"
                "\tlsls r1, r0, 16\n"
                "\tcmp r1, 0\n"
                "\tbeq _0811105E\n"
                "\tmov r0, r9\n"
                "\tldrh r2, [r0]\n"
                "\tlsls r2, 1\n"
                "\tmovs r0, 0x8B\n"
                "\tlsls r0, 1\n"
                "\tadd r0, r8\n"
                "\tadds r2, r0\n"
                "\tldrh r0, [r2]\n"
                "\tadds r0, 0x10\n"
                "\tlsrs r1, 20\n"
                "\tb _08110FC8\n"
                "_08110F8E:\n"
                "\tldrh r0, [r3]\n"
                "\tlsls r1, r0, 16\n"
                "\tcmp r1, 0\n"
                "\tbeq _0811105E\n"
                "\tmov r3, r9\n"
                "\tldrh r2, [r3]\n"
                "\tlsls r2, 1\n"
                "\tmovs r0, 0x8B\n"
                "\tlsls r0, 1\n"
                "\tadd r0, r8\n"
                "\tadds r2, r0\n"
                "\tldrh r0, [r2]\n"
                "\tadds r0, 0x1E\n"
                "\tlsrs r1, 20\n"
                "\tb _08110FC8\n"
                "_08110FAC:\n"
                "\tldrh r0, [r3]\n"
                "\tlsls r1, r0, 16\n"
                "\tcmp r1, 0\n"
                "\tbeq _0811105E\n"
                "\tmov r0, r9\n"
                "\tldrh r2, [r0]\n"
                "\tlsls r2, 1\n"
                "\tmovs r0, 0x8B\n"
                "\tlsls r0, 1\n"
                "\tadd r0, r8\n"
                "\tadds r2, r0\n"
                "\tldrh r0, [r2]\n"
                "\tadds r0, 0x20\n"
                "\tlsrs r1, 22\n"
                "_08110FC8:\n"
                "\tadds r0, r1\n"
                "\tstrh r0, [r2]\n"
                "\tb _0811105E\n"
                "_08110FCE:\n"
                "\tldrh r2, [r3]\n"
                "\tcmp r2, 0\n"
                "\tbeq _0811105E\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r2\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tnegs r0, r0\n"
                "\tlsrs r3, r0, 31\n"
                "\tmovs r0, 0x20\n"
                "\tands r0, r2\n"
                "\tcmp r0, 0\n"
                "\tbeq _08110FEC\n"
                "\tmovs r0, 0x2\n"
                "\torrs r3, r0\n"
                "_08110FEC:\n"
                "\tmov r0, r9\n"
                "\tldrh r1, [r0]\n"
                "\tlsls r1, 1\n"
                "\tmovs r0, 0x8B\n"
                "\tlsls r0, 1\n"
                "\tadd r0, r8\n"
                "\tadds r1, r0\n"
                "\tldrh r0, [r1]\n"
                "\tadds r0, 0x20\n"
                "\tadds r0, r3\n"
                "\tb _0811105C\n"
                "_08111002:\n"
                "\tldrh r2, [r3]\n"
                "\tcmp r2, 0\n"
                "\tbeq _0811105E\n"
                "\tmovs r0, 0x40\n"
                "\tands r0, r2\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tnegs r0, r0\n"
                "\tlsrs r3, r0, 31\n"
                "\tmovs r0, 0x10\n"
                "\tands r0, r2\n"
                "\tcmp r0, 0\n"
                "\tbeq _08111020\n"
                "\tmovs r0, 0x2\n"
                "\torrs r3, r0\n"
                "_08111020:\n"
                "\tmov r0, r9\n"
                "\tldrh r1, [r0]\n"
                "\tlsls r1, 1\n"
                "\tmovs r0, 0x8B\n"
                "\tlsls r0, 1\n"
                "\tadd r0, r8\n"
                "\tadds r1, r0\n"
                "\tldrh r0, [r1]\n"
                "\tadds r0, 0x21\n"
                "\tadds r0, r3\n"
                "\tb _0811105C\n"
                "_08111036:\n"
                "\tmov r3, r9\n"
                "\tldrh r1, [r3]\n"
                "\tlsls r1, 1\n"
                "\tmovs r0, 0x8B\n"
                "\tlsls r0, 1\n"
                "\tadd r0, r8\n"
                "\tadds r1, r0\n"
                "\tldrh r0, [r1]\n"
                "\tadds r0, 0x27\n"
                "\tb _0811105C\n"
                "_0811104A:\n"
                "\tmov r0, r9\n"
                "\tldrh r1, [r0]\n"
                "\tlsls r1, 1\n"
                "\tmovs r0, 0x8B\n"
                "\tlsls r0, 1\n"
                "\tadd r0, r8\n"
                "\tadds r1, r0\n"
                "\tldrh r0, [r1]\n"
                "\tadds r0, 0x25\n"
                "_0811105C:\n"
                "\tstrh r0, [r1]\n"
                "_0811105E:\n"
                "\tmov r3, r9\n"
                "\tldrh r0, [r3]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r3]\n"
                "\tlsls r0, 16\n"
                "\tldr r1, _08111080 @ =0x027f0000\n"
                "\tcmp r0, r1\n"
                "\tbhi _08111070\n"
                "\tb _08110E3C\n"
                "_08111070:\n"
                "\tadd sp, 0xC\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_08111080: .4byte 0x027f0000");
}
#endif // NONMATCHING

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
                PlaySE(SE_Z_PAGE);
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
        x = 8 * (gRegionMapLocations[mapSecId].x + 1) + 4;
        y = 8 * (gRegionMapLocations[mapSecId].y) + 28;
        x += 4 * (gRegionMapLocations[mapSecId].width - 1);
        y += 4 * (gRegionMapLocations[mapSecId].height - 1);
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
