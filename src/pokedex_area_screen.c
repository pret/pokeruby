
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
#include "trig.h"

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
    MainCallback unk0004;
    MainCallback unk0008;
    u16 unk000C;
    u16 unk000E;
    struct PokedexAreaScreenSubstruct0010 unk0010[0x40];
    u16 unk0110;
    u16 unk0112;
    u16 unk0114;
    u16 unk0116[0x280];
    u16 unk0616;
    u16 unk0618;
    u16 unk061A;
    u16 unk061C;
    u8 unk061E;
    u8 unk061F;
    u16 unk0620[0x20];
    struct Sprite * unk0660[0x20];
    u8 filler_06E0[8];
    struct RegionMap unk06E8;
    u8 unk0F68[16];
    u8 filler_0F78[0x3C];
    u8 unk0FB4[0x600];
};

#define ePokedexAreaScreen (*(struct PokedexAreaScreenEwramStruct *)gSharedMem)

// Static RAM declarations

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
void sub_81112BC(void);
void sub_8111314(void);
void sub_8111360(void);

// .rodata

const u16 gUnknown_083F8418[] = INCBIN_U16("graphics/pokedex/area_glow.gbapal");

const u8 gUnknown_083F8438[] = INCBIN_U8("graphics/pokedex/area_glow.4bpp.lz");

const u16 gUnknown_083F856C[] = {SPECIES_WYNAUT};

const u16 gUnknown_083F856E[][3] = {
    {SPECIES_FEEBAS, MAP_GROUP(ROUTE119), MAP_NUM(ROUTE119)},
    {NUM_SPECIES}
};

const u16 gUnknown_083F857A[][2] = {
    {MAPSEC_SkyPillar,      FLAG_LANDMARK_SKY_PILLAR},
    {MAPSEC_SeafloorCavern, FLAG_LANDMARK_SEAFLOOR_CAVERN},
    {MAPSEC_Nothing}
};

struct PokedexAreaScreenEwramStruct *const gPokedexAreaScreenPtr = &ePokedexAreaScreen;

// .text

void UnusedPokedexAreaScreen(u16 a0, MainCallback a1, MainCallback a2)
{
    gPokedexAreaScreenPtr->unk0004 = a1;
    gPokedexAreaScreenPtr->unk0008 = a2;
    gPokedexAreaScreenPtr->unk000E = a0;
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
            InitRegionMap(&gPokedexAreaScreenPtr->unk06E8, FALSE);
            StringFill(gPokedexAreaScreenPtr->unk0F68, CHAR_SPACE, 16);
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
    gPokedexAreaScreenPtr->unk0000();
    sub_8111110();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_8110814(void (*func)(void))
{
    gPokedexAreaScreenPtr->unk0000 = func;
    gPokedexAreaScreenPtr->unk000C = 0;
}

void sub_8110824(void)
{
    gPokedexAreaScreenPtr->unk0114 = 0;
}

bool8 DrawAreaGlow(void)
{
    switch (gPokedexAreaScreenPtr->unk0114)
    {
        case 0:
            FindMapsWithMon(gPokedexAreaScreenPtr->unk000E);
            break;
        case 1:
            BuildAreaGlowTilemap();
            break;
        case 2:
            LZ77UnCompVram(gUnknown_083F8438, BG_CHAR_ADDR(3));
            break;
        case 3:
            DmaCopy16(3, gPokedexAreaScreenPtr->unk0116, BG_SCREEN_ADDR(30), 0x500);
            break;
        case 4:
            LoadPalette(gUnknown_083F8418, 0, 32);
            break;
        case 5:
            REG_BG0CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(3) | BGCNT_16COLOR | BGCNT_SCREENBASE(30) | BGCNT_TXT256x256;
            gPokedexAreaScreenPtr->unk0114++;
            return FALSE;
        default:
            return FALSE;
    }
    gPokedexAreaScreenPtr->unk0114++;
    return TRUE;
}

void FindMapsWithMon(u16 mon)
{
    u16 i;
    struct Roamer *roamer;

    if (mon != ROAMER_SPECIES)
    {
        gPokedexAreaScreenPtr->unk0110 = 0;
        gPokedexAreaScreenPtr->unk0112 = 0;
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
        gPokedexAreaScreenPtr->unk0112 = 0;
        roamer = &gSaveBlock1.roamer;
        if (roamer->active)
        {
            GetRoamerLocation(&gPokedexAreaScreenPtr->unk0010[0].mapGroup, &gPokedexAreaScreenPtr->unk0010[0].mapNum);
            gPokedexAreaScreenPtr->unk0010[0].regionMapSectionId = Overworld_GetMapHeaderByGroupAndId(gPokedexAreaScreenPtr->unk0010[0].mapGroup, gPokedexAreaScreenPtr->unk0010[0].mapNum)->regionMapSectionId;
            gPokedexAreaScreenPtr->unk0110 = 1;
        }
        else
            gPokedexAreaScreenPtr->unk0110 = 0;
    }
}

void SetAreaHasMon(u16 mapGroup, u16 mapNum)
{
    if (gPokedexAreaScreenPtr->unk0110 < 0x40)
    {
        gPokedexAreaScreenPtr->unk0010[gPokedexAreaScreenPtr->unk0110].mapGroup = mapGroup;
        gPokedexAreaScreenPtr->unk0010[gPokedexAreaScreenPtr->unk0110].mapNum = mapNum;
        gPokedexAreaScreenPtr->unk0010[gPokedexAreaScreenPtr->unk0110].regionMapSectionId = sub_80FBA04(Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum)->regionMapSectionId);
        gPokedexAreaScreenPtr->unk0110++;
    }
}

void SetSpecialMapHasMon(u16 mapGroup, u16 mapNum)
{
    const struct MapHeader *mapHeader;
    u16 i;

    if (gPokedexAreaScreenPtr->unk0112 < 0x20)
    {
        mapHeader = Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum);
        if (mapHeader->regionMapSectionId < MAPSEC_Nothing)
        {
            for (i = 0; gUnknown_083F857A[i][0] != MAPSEC_Nothing; i++)
            {
                if (mapHeader->regionMapSectionId == gUnknown_083F857A[i][0] && !FlagGet(gUnknown_083F857A[i][1]))
                    return;
            }
            for (i = 0; i < gPokedexAreaScreenPtr->unk0112; i++)
            {
                if (gPokedexAreaScreenPtr->unk0620[i] == mapHeader->regionMapSectionId)
                    break;
            }
            if (i == gPokedexAreaScreenPtr->unk0112)
            {
                gPokedexAreaScreenPtr->unk0620[i] = mapHeader->regionMapSectionId;
                gPokedexAreaScreenPtr->unk0112++;
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

#ifdef NONMATCHING
void BuildAreaGlowTilemap(void)
{
    static EWRAM_DATA u16 gUnknown_02039260 = 0;
    static EWRAM_DATA u16 gUnknown_02039262 = 0;
    static EWRAM_DATA u16 gUnknown_02039264 = 0;
    static EWRAM_DATA u16 gUnknown_02039266 = 0;
    static EWRAM_DATA u16 gUnknown_02039268 = 0;
    static EWRAM_DATA u16 gUnknown_0203926A = 0;
    u32 r3;

    for (gUnknown_02039260 = 0; gUnknown_02039260 < 0x280; gUnknown_02039260++)
        gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] = 0;

    for (gUnknown_02039260 = 0; gUnknown_02039260 < gPokedexAreaScreenPtr->unk0110; gUnknown_02039260++)
    {
        gUnknown_02039266 = 0;
        for (gUnknown_02039264 = 0; gUnknown_02039264 < 20; gUnknown_02039264++)
        {
            for (gUnknown_02039262 = 0; gUnknown_02039262 < 32; gUnknown_02039262++)
            {
                if (GetRegionMapSectionAt_(gUnknown_02039262, gUnknown_02039264) == gPokedexAreaScreenPtr->unk0010[gUnknown_02039260].regionMapSectionId)
                {
                    gPokedexAreaScreenPtr->unk0116[gUnknown_02039266] = 0xFFFF;
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
            if (gPokedexAreaScreenPtr->unk0116[gUnknown_02039266] == 0xFFFF)
            {
                if (gUnknown_02039262 != 0 && gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 - 1] != 0xFFFF)
                    gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 - 1] |= 0x02;
                if (gUnknown_02039262 != 31 && gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 + 1] != 0xFFFF)
                    gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 + 1] |= 0x01;
                if (gUnknown_02039264 != 0 && gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 - 32] != 0xFFFF)
                    gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 - 32] |= 0x08;
                if (gUnknown_02039264 != 19 && gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 + 32] != 0xFFFF)
                    gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 + 32] |= 0x04;
                if (gUnknown_02039262 != 0 && gUnknown_02039264 != 0 && gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 - 33] != 0xFFFF)
                    gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 - 33] |= 0x10;
                if (gUnknown_02039262 != 31 && gUnknown_02039264 != 0 && gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 - 31] != 0xFFFF)
                    gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 - 31] |= 0x40;
                if (gUnknown_02039262 != 0 && gUnknown_02039264 != 19 && gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 + 31] != 0xFFFF)
                    gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 + 31] |= 0x20;
                if (gUnknown_02039262 != 31 && gUnknown_02039264 != 19 && gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 + 33] != 0xFFFF)
                    gPokedexAreaScreenPtr->unk0116[gUnknown_02039266 + 33] |= 0x80;
            }
            gUnknown_02039266++;
        }
    }

    for (gUnknown_02039260 = 0; gUnknown_02039260 < 0x280; gUnknown_02039260++) // Register difference on induction: expected r3, got r1
    {
        if (gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] == 0xFFFF)
            gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] = 0x10;
        else if (gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] != 0)
        {
            if (gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] & 0x02)
                gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] &= 0xFFCF;
            if (gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] & 0x01)
                gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] &= 0xFF3F;
            if (gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] & 0x08)
                gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] &= 0xFFAF;
            if (gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] & 0x04)
                gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] &= 0xFF5F;
            gUnknown_02039268 = gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] & 0x0F;
            gUnknown_0203926A = gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] & 0xF0;
            if (gUnknown_0203926A)
            {
                gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] &= 0x0F;
                switch (gUnknown_02039268)
                {
                    case 0:
                        if (gUnknown_0203926A != 0)
                            gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] += (gUnknown_0203926A >> 4) + 0x10;
                        break;
                    case 2:
                        if (gUnknown_0203926A != 0)
                            gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] += (gUnknown_0203926A >> 4) + 0x1E;
                        break;
                    case 1:
                        if (gUnknown_0203926A != 0)
                            gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] += (gUnknown_0203926A >> 6) + 0x20;
                        break;
                    case 8:
                        if (gUnknown_0203926A != 0)
                        {
                            r3 = 0;
                            if (gUnknown_0203926A & 0x80)
                                r3 |= 1;
                            if (gUnknown_0203926A & 0x20)
                                r3 |= 2;
                            gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] += r3 + 0x20;
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
                            gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] += r3 + 0x21;
                        }
                        break;
                    case 5:
                    case 6:
                        gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] += 0x27;
                        break;
                    case 9:
                    case 10:
                        gPokedexAreaScreenPtr->unk0116[gUnknown_02039260] += 0x25;
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
NAKED void BuildAreaGlowTilemap(void)
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

void sub_8111084(void)
{
    if (gPokedexAreaScreenPtr->unk0112 != 0 && gPokedexAreaScreenPtr->unk0110 == 0)
        gPokedexAreaScreenPtr->unk061E = 1;
    else
        gPokedexAreaScreenPtr->unk061E = 0;
    gPokedexAreaScreenPtr->unk0616 = 0;
    gPokedexAreaScreenPtr->unk0618 = 0;
    gPokedexAreaScreenPtr->unk061A = 0;
    gPokedexAreaScreenPtr->unk061C = 0x40;
    gPokedexAreaScreenPtr->unk061F = 1;
    REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
    REG_BLDALPHA = 0x1000;
    sub_8111110();
}

void sub_8111110(void)
{
    u16 x;
    u16 y;
    u16 i;

    if (gPokedexAreaScreenPtr->unk061E == 0)
    {
        if (gPokedexAreaScreenPtr->unk0616 == 0)
        {
            gPokedexAreaScreenPtr->unk0618++;
            if (gPokedexAreaScreenPtr->unk0618 & 1)
                gPokedexAreaScreenPtr->unk061A = (gPokedexAreaScreenPtr->unk061A + 4) & 0x7f;
            else
                gPokedexAreaScreenPtr->unk061C = (gPokedexAreaScreenPtr->unk061C + 4) & 0x7f;
            x = gSineTable[gPokedexAreaScreenPtr->unk061A] >> 4;
            y = gSineTable[gPokedexAreaScreenPtr->unk061C] >> 4;
            REG_BLDALPHA = x | (y << 8);
            gPokedexAreaScreenPtr->unk0616 = 0;
            if (gPokedexAreaScreenPtr->unk0618 == 0x40)
            {
                gPokedexAreaScreenPtr->unk0618 = 0;
                if (gPokedexAreaScreenPtr->unk0112 != 0)
                    gPokedexAreaScreenPtr->unk061E = 1;
            }
        }
        else
            gPokedexAreaScreenPtr->unk0616--;
    }
    else
    {
        gPokedexAreaScreenPtr->unk0616++;
        if (gPokedexAreaScreenPtr->unk0616 > 12)
        {
            gPokedexAreaScreenPtr->unk0616 = 0;
            gPokedexAreaScreenPtr->unk061F++;
            for (i = 0; i < gPokedexAreaScreenPtr->unk0112; i++)
            {
                gPokedexAreaScreenPtr->unk0660[i]->invisible = gPokedexAreaScreenPtr->unk061F & 1;
            }
            if (gPokedexAreaScreenPtr->unk061F > 4)
            {
                gPokedexAreaScreenPtr->unk061F = 1;
                if (gPokedexAreaScreenPtr->unk0110 != 0)
                    gPokedexAreaScreenPtr->unk061E = 0;
            }
        }
    }
}

void sub_8111288(void)
{
    switch (gPokedexAreaScreenPtr->unk000C)
    {
        case 0:
            gPokedexAreaScreenPtr->unk000C = 1;
            break;
        case 1:
            if (!UpdatePaletteFade())
            {
                sub_8110814(sub_81112BC);
            }
            break;
    }
}

void sub_81112BC(void)
{
    switch (gPokedexAreaScreenPtr->unk000C)
    {
        case 0:
            if (gMain.newKeys & B_BUTTON)
            {
                sub_8110814(sub_8111314);
            }
            else if (gMain.newKeys & DPAD_RIGHT || (gMain.newKeys & R_BUTTON && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
            {
                sub_8110814(sub_8111360);
            }
            break;
    }
}

void sub_8111314(void)
{
    switch (gPokedexAreaScreenPtr->unk000C)
    {
        case 0:
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, 0);
            gPokedexAreaScreenPtr->unk000C++;
            break;
        case 1:
            if (!UpdatePaletteFade())
            {
                FreeRegionMapIconResources();
                SetMainCallback2(gPokedexAreaScreenPtr->unk0004);
            }
            break;
    }
}

void sub_8111360(void)
{
    switch (gPokedexAreaScreenPtr->unk000C)
    {
        case 0:
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 0, 16, 0);
            gPokedexAreaScreenPtr->unk000C++;
            break;
        case 1:
            if (!UpdatePaletteFade())
            {
                FreeRegionMapIconResources();
                SetMainCallback2(gPokedexAreaScreenPtr->unk0008);
            }
            break;
    }
}
