
// Includes
#include "global.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "ewram.h"
#include "main.h"
#include "palette.h"
#include "task.h"
#include "sprite.h"
#include "region_map.h"
#include "region_map_sections.h"
#include "string_util.h"
#include "text.h"
#include "wild_encounter.h"
#include "roamer.h"
#include "overworld.h"
#include "event_data.h"

// Static type declarations

struct PokedexAreaScreenSubstruct0010
{
    u8 mapGroup;
    u8 mapNum;
    u16 regionMapSectionId;
};

struct PokedexAreaScreenEwramStruct
{
    void (*unk0000)(void);
    u32 unk0004;
    u32 unk0008;
    u16 unk000C;
    u16 unk000E;
    struct PokedexAreaScreenSubstruct0010 unk0010[0x40];
    u16 unk0110;
    u16 unk0112;
    u16 unk0114;
    u8 unk0116[0x500];
    u8 filler_0616[0x0A];
    u16 unk0620[0x20];
    u8 filler_0660[0x88];
    struct RegionMap unk06E8;
    u8 unk0F68[16];
};

#define ePokedexAreaScreen (*(struct PokedexAreaScreenEwramStruct *)gSharedMem)

// Static RAM declarations

EWRAM_DATA u16 gUnknown_02039260 = 0;
EWRAM_DATA u16 gUnknown_02039262 = 0;
EWRAM_DATA u16 gUnknown_02039264 = 0;
EWRAM_DATA u16 gUnknown_02039266 = 0;
EWRAM_DATA u16 gUnknown_02039268 = 0;
EWRAM_DATA u16 gUnknown_0203926A = 0;

// Static ROM declarations

void CB2_UnusedPokedexAreaScreen(void);
void sub_81107DC(void);
void sub_81107F0(void);
void sub_8110814(void (*func)(void));
void sub_8110824(void);
bool8 DrawAreaGlow(void);
void FindMapsWithMon(u16 mon);
void SetAreaHasMon(u16 mapGroup, u16 mapNum);
void SetSpecialMapHasMon(u16 mapGroup, u16 mapNum);
bool8 MapHasMon(const struct WildPokemonHeader *header, u16 mon);
bool8 MonListHasMon(const struct WildPokemonInfo *info, u16 mon, u16 size);
void BuildAreaGlowTilemap(void);
void sub_8111084(void);
void sub_8111110(void);
void sub_8111288(void);

// .rodata

extern const u16 gUnknown_083F8418[];
extern const u8 gUnknown_083F8438[];
extern const u16 gUnknown_083F856C[];
extern const u16 gUnknown_083F856E[][3];
extern const u16 gUnknown_083F857A[][2];

// .text

void UnusedPokedexAreaScreen(u16 a0, u32 a1, u32 a2)
{
    ePokedexAreaScreen.unk0004 = a1;
    ePokedexAreaScreen.unk0008 = a2;
    ePokedexAreaScreen.unk000E = a0;
    SetMainCallback2(CB2_UnusedPokedexAreaScreen);
}

void CB2_UnusedPokedexAreaScreen(void)
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
            InitRegionMap(&ePokedexAreaScreen.unk06E8, FALSE);
            StringFill(ePokedexAreaScreen.unk0F68, CHAR_SPACE, 16);
            break;
        case 2:
            sub_8110824();
            break;
        case 3:
            if (DrawAreaGlow())
                return;
            break;
        case 4:
            CreateRegionMapPlayerIcon(1, 1);
            sub_80FB2A4(0, -8);
            SetVBlankCallback(sub_81107DC);
            break;
        case 5:
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 16, 0, 0);
            break;
        case 6:
            REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
            sub_8111084();
            REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
            break;
        case 7:
            sub_8110814(sub_8111288);
            SetMainCallback2(sub_81107F0);
            return;
    }
    gMain.state++;
}

void sub_81107DC(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_81107F0(void)
{
    ePokedexAreaScreen.unk0000();
    sub_8111110();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_8110814(void (*func)(void))
{
    ePokedexAreaScreen.unk0000 = func;
    ePokedexAreaScreen.unk000C = 0;
}

void sub_8110824(void)
{
    ePokedexAreaScreen.unk0114 = 0;
}

bool8 DrawAreaGlow(void)
{
    switch (ePokedexAreaScreen.unk0114)
    {
        case 0:
            FindMapsWithMon(ePokedexAreaScreen.unk000E);
            break;
        case 1:
            BuildAreaGlowTilemap();
            break;
        case 2:
            LZ77UnCompVram(gUnknown_083F8438, BG_CHAR_ADDR(3));
            break;
        case 3:
            DmaCopy16(3, ePokedexAreaScreen.unk0116, BG_SCREEN_ADDR(30), 0x500);
            break;
        case 4:
            LoadPalette(gUnknown_083F8418, 0, 32);
            break;
        case 5:
            REG_BG0CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(3) | BGCNT_16COLOR | BGCNT_SCREENBASE(30) | BGCNT_TXT256x256;
            ePokedexAreaScreen.unk0114++;
            return FALSE;
        default:
            return FALSE;
    }
    ePokedexAreaScreen.unk0114++;
    return TRUE;
}

void FindMapsWithMon(u16 mon)
{
    u16 i;
    struct Roamer *roamer;

    if (mon != ROAMER_SPECIES)
    {
        ePokedexAreaScreen.unk0110 = 0;
        ePokedexAreaScreen.unk0112 = 0;
        for (i = 0; i < 1; i++)
        {
            if (gUnknown_083F856C[i] == mon)
                return;
        }
        for (i = 0; gUnknown_083F856E[i][0] != NUM_SPECIES; i++)
        {
            if (mon == gUnknown_083F856E[i][0])
            {
                switch (gUnknown_083F856E[i][1])
                {
                    case MAP_GROUP(PETALBURG_CITY):
                        SetAreaHasMon(gUnknown_083F856E[i][1], gUnknown_083F856E[i][2]);
                        break;
                    case MAP_GROUP(METEOR_FALLS_1F_1R):
                    case MAP_GROUP(SAFARI_ZONE_NORTHWEST):
                        SetSpecialMapHasMon(gUnknown_083F856E[i][1], gUnknown_083F856E[i][2]);
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
        ePokedexAreaScreen.unk0112 = 0;
        roamer = &gSaveBlock1.roamer;
        if (roamer->active)
        {
            GetRoamerLocation(&ePokedexAreaScreen.unk0010[0].mapGroup, &ePokedexAreaScreen.unk0010[0].mapNum);
            ePokedexAreaScreen.unk0010[0].regionMapSectionId = Overworld_GetMapHeaderByGroupAndId(ePokedexAreaScreen.unk0010[0].mapGroup, ePokedexAreaScreen.unk0010[0].mapNum)->regionMapSectionId;
            ePokedexAreaScreen.unk0110 = 1;
        }
        else
            ePokedexAreaScreen.unk0110 = 0;
    }
}

void SetAreaHasMon(u16 mapGroup, u16 mapNum)
{
    if (ePokedexAreaScreen.unk0110 < 0x40)
    {
        ePokedexAreaScreen.unk0010[ePokedexAreaScreen.unk0110].mapGroup = mapGroup;
        ePokedexAreaScreen.unk0010[ePokedexAreaScreen.unk0110].mapNum = mapNum;
        ePokedexAreaScreen.unk0010[ePokedexAreaScreen.unk0110].regionMapSectionId = sub_80FBA04(Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum)->regionMapSectionId);
        ePokedexAreaScreen.unk0110++;
    }
}

void SetSpecialMapHasMon(u16 mapGroup, u16 mapNum)
{
    const struct MapHeader *mapHeader;
    u16 i;

    if (ePokedexAreaScreen.unk0112 < 0x20)
    {
        mapHeader = Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum);
        if (mapHeader->regionMapSectionId < MAPSEC_Nothing)
        {
            for (i = 0; gUnknown_083F857A[i][0] != MAPSEC_Nothing; i++)
            {
                if (mapHeader->regionMapSectionId == gUnknown_083F857A[i][0] && !FlagGet(gUnknown_083F857A[i][1]))
                    return;
            }
            for (i = 0; i < ePokedexAreaScreen.unk0112; i++)
            {
                if (ePokedexAreaScreen.unk0620[i] == mapHeader->regionMapSectionId)
                    break;
            }
            if (i == ePokedexAreaScreen.unk0112)
            {
                ePokedexAreaScreen.unk0620[i] = mapHeader->regionMapSectionId;
                ePokedexAreaScreen.unk0112++;
            }
        }
    }
}

bool8 MapHasMon(const struct WildPokemonHeader *header, u16 mon)
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

bool8 MonListHasMon(const struct WildPokemonInfo *info, u16 mon, u16 size)
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
