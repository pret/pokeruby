
// Includes
#include "global.h"
#include "palette.h"
#include "text.h"
#include "menu.h"
#include "pokemon_storage_system.h"

// Static type declarations

// Static RAM declarations

EWRAM_DATA struct Pokemon gUnknown_02038480 = {};
EWRAM_DATA u8 gUnknown_020384E4 = 0;
EWRAM_DATA u8 gUnknown_020384E5 = 0;
EWRAM_DATA u8 gUnknown_020384E6 = 0;
EWRAM_DATA u8 gUnknown_020384E7 = 0;
EWRAM_DATA u8 gUnknown_020384E8 = 0;
EWRAM_DATA u8 gUnknown_020384E9 = 0;
EWRAM_DATA u16 gUnknown_020384EA = 0;

struct WallpaperTable {
    const u8 *tiles;
    u32 size;
    const u8 *tileMap;
    const u16 *palettes;
};

// Static ROM declarations

void sub_809900C(u8 boxId, s8 a1);
s8 sub_8099D90(u8 boxId);
void sub_8099EB0(u8 boxId, s8 a1);
void sub_8099F58(u16 *vdest, const u16 *src, s8 a2, u8 a3);
void sub_809A14C(u16 *vdest);
void sub_809A23C(u8 boxId);
void sub_809A3D0(u8 boxId, s8 a1);
void sub_809A598(void);
void sub_809A5E8(struct Sprite *sprite);
void sub_809A61C(struct Sprite *sprite);
void sub_809A654(void);
s16 sub_809A6D0(u8 width);
void sub_809A6DC(void);
void sub_809A774(s8 a0);
void sub_809A810(void);
void sub_809A8C8(struct Sprite *sprite);

// .rodata

// .text

void sub_8099BF8(u8 boxId)
{
    gPokemonStorageSystemPtr->unk_08ba = FALSE;
    gPokemonStorageSystemPtr->unk_08b4 = 0;
    DmaFill32(3, 0, BG_SCREEN_ADDR(26), 0x1000);
    sub_8099EB0(boxId, 0);
    sub_809A23C(boxId);
    sub_809A6DC();
    SpawnBoxIconSprites(boxId);
    REG_BG2CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(26) | BGCNT_TXT512x256;
}

void sub_8099C70(u8 whichBox)
{
    s8 r4 = sub_8099D90(whichBox);
    sub_8099EB0(whichBox, r4);
    gPokemonStorageSystemPtr->unk_08b6 = r4 * 6;
    gPokemonStorageSystemPtr->unk_08b8 = 0x20;
    gPokemonStorageSystemPtr->unk_08bb = whichBox;
    gPokemonStorageSystemPtr->unk_08bc = r4 > 0 ? 0 : 5;
    gPokemonStorageSystemPtr->unk_08be = r4;
    gPokemonStorageSystemPtr->unk_08c0 = r4 > 0 ? 0x108 : 0x38;
    gPokemonStorageSystemPtr->unk_08c2 = r4 > 0 ? 0 : 5;
    gPokemonStorageSystemPtr->unk_08c4 = r4;
    gPokemonStorageSystemPtr->unk_08c6 = 0;
    gPokemonStorageSystemPtr->unk_08c8 = 2;
    sub_809900C(whichBox, r4);
    sub_809A3D0(whichBox, r4);
    sub_809A774(r4);
}

bool8 sub_8099D34(void)
{
    bool8 retVal = sub_80990AC();
    if (gPokemonStorageSystemPtr->unk_08b8 != 0)
    {
        gPokemonStorageSystemPtr->unk_08b4 += gPokemonStorageSystemPtr->unk_08b6;
        gPokemonStorageSystemPtr->unk_08b4 &= 0x1ff;
        if (--gPokemonStorageSystemPtr->unk_08b8 == 0)
        {
            sub_809A598();
            sub_809A810();
        }
        return TRUE;
    }
    return retVal;
}

s8 sub_8099D90(u8 boxId)
{
    u8 curBox = get_preferred_box();
    u8 i;

    for (i = 0; curBox != boxId; i++)
    {
        if (++curBox >= 14)
            curBox = 0;
    }
    return i <= 6 ? 1 : -1;
}

void sub_8099DCC(u8 wallpaperId)
{
    u8 curBox = get_preferred_box();
    gPokemonStorage.wallpaper[curBox] = wallpaperId;
    gPokemonStorageSystemPtr->unk_1032 = 0;
}

bool8 sub_8099E08(void)
{
    switch (gPokemonStorageSystemPtr->unk_1032)
    {
        case 0:
            BeginNormalPaletteFade(gPokemonStorageSystemPtr->unk_0d08, 1, 0, 0x10, 0xffff);
            gPokemonStorageSystemPtr->unk_1032++;
            break;
        case 1:
            if (!UpdatePaletteFade())
            {
                u8 curBox = get_preferred_box();
                sub_8099EB0(curBox, 0);
                sub_809A654();
                BeginNormalPaletteFade(gPokemonStorageSystemPtr->unk_0d08, 1, 0x10, 0, 0xffff);
                gPokemonStorageSystemPtr->unk_1032++;
            }
            break;
        case 2:
            if (!UpdatePaletteFade())
                gPokemonStorageSystemPtr->unk_1032++;
            break;
        case 3:
            return FALSE;
    }
    return TRUE;
}

const u16 gWallpaperPalettes_Forest[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_Forest_2[] = INCBIN_U16("graphics/pokemon_storage/forest_frame.gbapal");
const u16 gWallpaperPalettes_Forest_2_3[] = INCBIN_U16("graphics/pokemon_storage/forest_bg.gbapal");

const u8 gWallpaperTiles_Forest[] = INCBIN_U8("graphics/pokemon_storage/forest.4bpp.lz");

const u8 gWallpaperTilemap_Forest[] = INCBIN_U8("graphics/pokemon_storage/forest.bin.lz");

const u16 gWallpaperPalettes_City[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_City_2[] = INCBIN_U16("graphics/pokemon_storage/city_frame.gbapal");
const u16 gWallpaperPalettes_City_2_3[] = INCBIN_U16("graphics/pokemon_storage/city_bg.gbapal");

const u8 gWallpaperTiles_City[] = INCBIN_U8("graphics/pokemon_storage/city.4bpp.lz");

const u8 gWallpaperTilemap_City[] = INCBIN_U8("graphics/pokemon_storage/city.bin.lz");

const u16 gWallpaperPalettes_Desert[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_Desert_2[] = INCBIN_U16("graphics/pokemon_storage/desert_frame.gbapal");
const u16 gWallpaperPalettes_Desert_2_3[] = INCBIN_U16("graphics/pokemon_storage/desert_bg.gbapal");

const u8 gWallpaperTiles_Desert[] = INCBIN_U8("graphics/pokemon_storage/desert.4bpp.lz");

const u8 gWallpaperTilemap_Desert[] = INCBIN_U8("graphics/pokemon_storage/desert.bin.lz");

const u16 gWallpaperPalettes_Savanna[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_Savanna_2[] = INCBIN_U16("graphics/pokemon_storage/savanna_frame.gbapal");
const u16 gWallpaperPalettes_Savanna_2_3[] = INCBIN_U16("graphics/pokemon_storage/savanna_bg.gbapal");

const u8 gWallpaperTiles_Savanna[] = INCBIN_U8("graphics/pokemon_storage/savanna.4bpp.lz");

const u8 gWallpaperTilemap_Savanna[] = INCBIN_U8("graphics/pokemon_storage/savanna.bin.lz");

const u16 gWallpaperPalettes_Crag[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_Crag_2[] = INCBIN_U16("graphics/pokemon_storage/crag_frame.gbapal");
const u16 gWallpaperPalettes_Crag_2_3[] = INCBIN_U16("graphics/pokemon_storage/crag_bg.gbapal");

const u8 gWallpaperTiles_Crag[] = INCBIN_U8("graphics/pokemon_storage/crag.4bpp.lz");

const u8 gWallpaperTilemap_Crag[] = INCBIN_U8("graphics/pokemon_storage/crag.bin.lz");

const u16 gWallpaperPalettes_Volcano[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_Volcano_2[] = INCBIN_U16("graphics/pokemon_storage/volcano_frame.gbapal");
const u16 gWallpaperPalettes_Volcano_2_3[] = INCBIN_U16("graphics/pokemon_storage/volcano_bg.gbapal");

const u8 gWallpaperTiles_Volcano[] = INCBIN_U8("graphics/pokemon_storage/volcano.4bpp.lz");
const u32 filler_83b871c = 0; // needed to match but otherwise garbage

const u8 gWallpaperTilemap_Volcano[] = INCBIN_U8("graphics/pokemon_storage/volcano.bin.lz");

const u16 gWallpaperPalettes_Snow[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_Snow_2[] = INCBIN_U16("graphics/pokemon_storage/snow_frame.gbapal");
const u16 gWallpaperPalettes_Snow_2_3[] = INCBIN_U16("graphics/pokemon_storage/snow_bg.gbapal");

const u8 gWallpaperTiles_Snow[] = INCBIN_U8("graphics/pokemon_storage/snow.4bpp.lz");

const u8 gWallpaperTilemap_Snow[] = INCBIN_U8("graphics/pokemon_storage/snow.bin.lz");

const u16 gWallpaperPalettes_Cave[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_Cave_2[] = INCBIN_U16("graphics/pokemon_storage/cave_frame.gbapal");
const u16 gWallpaperPalettes_Cave_2_3[] = INCBIN_U16("graphics/pokemon_storage/cave_bg.gbapal");

const u8 gWallpaperTiles_Cave[] = INCBIN_U8("graphics/pokemon_storage/cave.4bpp.lz");

const u8 gWallpaperTilemap_Cave[] = INCBIN_U8("graphics/pokemon_storage/cave.bin.lz");

const u16 gWallpaperPalettes_Beach[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_Beach_2[] = INCBIN_U16("graphics/pokemon_storage/beach_frame.gbapal");
const u16 gWallpaperPalettes_Beach_2_3[] = INCBIN_U16("graphics/pokemon_storage/beach_bg.gbapal");

const u8 gWallpaperTiles_Beach[] = INCBIN_U8("graphics/pokemon_storage/beach.4bpp.lz");

const u8 gWallpaperTilemap_Beach[] = INCBIN_U8("graphics/pokemon_storage/beach.bin.lz");

const u16 gWallpaperPalettes_Seafloor[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_Seafloor_2[] = INCBIN_U16("graphics/pokemon_storage/seafloor_frame.gbapal");
const u16 gWallpaperPalettes_Seafloor_2_3[] = INCBIN_U16("graphics/pokemon_storage/seafloor_bg.gbapal");

const u8 gWallpaperTiles_Seafloor[] = INCBIN_U8("graphics/pokemon_storage/seafloor.4bpp.lz");

const u8 gWallpaperTilemap_Seafloor[] = INCBIN_U8("graphics/pokemon_storage/seafloor.bin.lz");

const u16 gWallpaperPalettes_River[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_River_2[] = INCBIN_U16("graphics/pokemon_storage/river_frame.gbapal");
const u16 gWallpaperPalettes_River_2_3[] = INCBIN_U16("graphics/pokemon_storage/river_bg.gbapal");

const u8 gWallpaperTiles_River[] = INCBIN_U8("graphics/pokemon_storage/river.4bpp.lz");

const u8 gWallpaperTilemap_River[] = INCBIN_U8("graphics/pokemon_storage/river.bin.lz");

const u16 gWallpaperPalettes_Sky[] = INCBIN_U16("graphics/pokemon_storage/box_bg1.gbapal");
const u16 gWallpaperPalettes_Sky_2[] = INCBIN_U16("graphics/pokemon_storage/sky_frame.gbapal");
const u16 gWallpaperPalettes_Sky_2_3[] = INCBIN_U16("graphics/pokemon_storage/sky_bg.gbapal");

const u8 gWallpaperTiles_Sky[] = INCBIN_U8("graphics/pokemon_storage/sky.4bpp.lz");

const u8 gWallpaperTilemap_Sky[] = INCBIN_U8("graphics/pokemon_storage/sky.bin.lz");

const u16 gWallpaperPalettes_Polkadot[] = INCBIN_U16("graphics/pokemon_storage/box_bg2.gbapal");
const u16 gWallpaperPalettes_Polkadot_2[] = INCBIN_U16("graphics/pokemon_storage/polkadot_frame.gbapal");
const u16 gWallpaperPalettes_Polkadot_2_3[] = INCBIN_U16("graphics/pokemon_storage/polkadot_bg.gbapal");

const u8 gWallpaperTiles_Polkadot[] = INCBIN_U8("graphics/pokemon_storage/polkadot.4bpp.lz");

const u8 gWallpaperTilemap_Polkadot[] = INCBIN_U8("graphics/pokemon_storage/polkadot.bin.lz");

const u16 gWallpaperPalettes_Pokecenter[] = INCBIN_U16("graphics/pokemon_storage/box_bg2.gbapal");
const u16 gWallpaperPalettes_Pokecenter_2[] = INCBIN_U16("graphics/pokemon_storage/pokecenter_frame.gbapal");
const u16 gWallpaperPalettes_Pokecenter_2_3[] = INCBIN_U16("graphics/pokemon_storage/pokecenter_bg.gbapal");

const u8 gWallpaperTiles_Pokecenter[] = INCBIN_U8("graphics/pokemon_storage/pokecenter.4bpp.lz");

const u8 gWallpaperTilemap_Pokecenter[] = INCBIN_U8("graphics/pokemon_storage/pokecenter.bin.lz");

const u16 gWallpaperPalettes_Machine[] = INCBIN_U16("graphics/pokemon_storage/box_bg3.gbapal");
const u16 gWallpaperPalettes_Machine_2[] = INCBIN_U16("graphics/pokemon_storage/machine_frame.gbapal");
const u16 gWallpaperPalettes_Machine_2_3[] = INCBIN_U16("graphics/pokemon_storage/machine_bg.gbapal");

const u8 gWallpaperTiles_Machine[] = INCBIN_U8("graphics/pokemon_storage/machine.4bpp.lz");

const u8 gWallpaperTilemap_Machine[] = INCBIN_U8("graphics/pokemon_storage/machine.bin.lz");

const u16 gWallpaperPalettes_Plain[] = INCBIN_U16("graphics/pokemon_storage/box_bg4.gbapal");
const u16 gWallpaperPalettes_Plain_2[] = INCBIN_U16("graphics/pokemon_storage/plain_frame.gbapal");
const u16 gWallpaperPalettes_Plain_2_3[] = INCBIN_U16("graphics/pokemon_storage/plain_bg.gbapal");

const u8 gWallpaperTiles_Plain[] = INCBIN_U8("graphics/pokemon_storage/plain.4bpp.lz");

const u8 gWallpaperTilemap_Plain[] = INCBIN_U8("graphics/pokemon_storage/plain.bin.lz");

const u16 gUnknown_083BAEF8[] = INCBIN_U16("graphics/unused/tilemap_3BAEF8.bin");

const u16 gUnknown_083BB0A8[][2] = {
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF},
    {0x1CE7, 0x7FFF}
};

const struct WallpaperTable gWallpaperTable[] = {
    {gWallpaperTiles_Forest, 0x3D0, gWallpaperTilemap_Forest, gWallpaperPalettes_Forest}, // Forest
    {gWallpaperTiles_City, 0x208, gWallpaperTilemap_City, gWallpaperPalettes_City}, // City
    {gWallpaperTiles_Desert, 0x2EC, gWallpaperTilemap_Desert, gWallpaperPalettes_Desert}, // Desert
    {gWallpaperTiles_Savanna, 0x220, gWallpaperTilemap_Savanna, gWallpaperPalettes_Savanna}, // Savanna
    {gWallpaperTiles_Crag, 0x350, gWallpaperTilemap_Crag, gWallpaperPalettes_Crag}, // Crag
    {gWallpaperTiles_Volcano, 0x334, gWallpaperTilemap_Volcano, gWallpaperPalettes_Volcano}, // Volcano
    {gWallpaperTiles_Snow, 0x2B8, gWallpaperTilemap_Snow, gWallpaperPalettes_Snow}, // Snow
    {gWallpaperTiles_Cave, 0x344, gWallpaperTilemap_Cave, gWallpaperPalettes_Cave}, // Cave
    {gWallpaperTiles_Beach, 0x384, gWallpaperTilemap_Beach, gWallpaperPalettes_Beach}, // Beach
    {gWallpaperTiles_Seafloor, 0x2B4, gWallpaperTilemap_Seafloor, gWallpaperPalettes_Seafloor}, // Seafloor
    {gWallpaperTiles_River, 0x294, gWallpaperTilemap_River, gWallpaperPalettes_River}, // River
    {gWallpaperTiles_Sky, 0x298, gWallpaperTilemap_Sky, gWallpaperPalettes_Sky}, // Sky
    {gWallpaperTiles_Polkadot, 0x1FC, gWallpaperTilemap_Polkadot, gWallpaperPalettes_Polkadot}, // Polkadot
    {gWallpaperTiles_Pokecenter, 0x3A4, gWallpaperTilemap_Pokecenter, gWallpaperPalettes_Pokecenter}, // Pokecenter
    {gWallpaperTiles_Machine, 0x2F0, gWallpaperTilemap_Machine, gWallpaperPalettes_Machine}, // Machine
    {gWallpaperTiles_Plain, 0xFC, gWallpaperTilemap_Plain, gWallpaperPalettes_Plain} // Plain
};

void sub_8099EB0(u8 boxId, s8 a1)
{
    const struct WallpaperTable *wallpaperTable;

    if (a1)
    {
        gPokemonStorageSystemPtr->unk_08ba = gPokemonStorageSystemPtr->unk_08ba ? FALSE : TRUE;
        sub_809A14C(BG_SCREEN_ADDR(26));
    }
    wallpaperTable = gWallpaperTable +gPokemonStorage.wallpaper[boxId];
    LoadPalette(wallpaperTable->palettes, gPokemonStorageSystemPtr->unk_08ba * 0x30 + 0x40, 0x60);
    LZ77UnCompWram(wallpaperTable->tileMap, gPokemonStorageSystemPtr->unk_0d62);
    sub_8099F58(BG_SCREEN_ADDR(26), gPokemonStorageSystemPtr->unk_0d62, a1, gPokemonStorageSystemPtr->unk_08ba);
    LZ77UnCompVram(wallpaperTable->tiles, BG_CHAR_ADDR(2) + (gPokemonStorageSystemPtr->unk_08ba << 13));
}

#ifdef NONMATCHING
void sub_8099F58(u16 *vdest, const u16 *src, s8 a2, u8 a3)
{
    s16 r6;
    s16 r3;
    u16 sp0 = a3 << 8;
    u16 sp4 = (a3 * 3 + 4) << 12;
    u16 *r4;
    u16 *r7;
    u16 i;
    u16 j;
    s16 sp8 = ((gPokemonStorageSystemPtr->unk_08b4 >> 3) + 10 + a2 * 24) & 0x3f;
    if (sp8 < 13)
    {
        r6 = 20;
        r3 = 0;
        r4 = vdest + sp8 + 0x40;
        r7 = NULL;
    }
    else if (sp8 < 32)
    {
        r6 = 32 - sp8;
        r3 = 20 - r6;
        r4 = vdest + sp8 + 0x40;
        r7 = vdest + 0x440;
    }
    else if (sp8 < 45)
    {
        r6 = 20;
        r3 = 0;
        r4 = vdest + sp8 + 0x420;
        r7 = NULL;
    }
    else
    {
        r6 = 64 - sp8;
        r3 = 20 - r6;
        r4 = vdest + sp8 + 0x420;
        r7 = vdest + 0x40;
    }
    for (i = 0; i < 18; i++)
    {
        for (j = 0; j < r6; j++)
        {
            u16 tile = ((*src & 0xfff) + sp0) | ((*src & 0xf000) + sp4);
            r4[j] = tile;
            src++;
        }
        for (j = 0; j < r3; j++)
        {
            u16 tile = ((*src & 0xfff) + sp0) | ((*src & 0xf000) + sp4);
            r7[j] = tile;
            src++;
        }
        r4 += 0x20;
        r7 += 0x20;
    }
    if (a2)
    {
        s16 r4_2;
        u16 *r2;
        if (a2 > 0)
            r4_2 = (sp8 + 20) & 0x3f;
        else
            r4_2 = (sp8 - 4) & 0x3f;
        r2 = r4_2 < 0x20 ? vdest + r4_2 + 0x40 : vdest + r4_2 + 0x420;
        for (i = 0; i < 4; i++)
        {
            for (j = 0; j < 18; j++)
            {
                *r2 = 0;
                r2 += 0x20;
            }
            r4_2++;
            r4_2 &= 0x3f;
            r2 = r4_2 < 0x20 ? vdest + r4_2 + 0x40 : vdest + r4_2 + 0x420;
        }
    }
}
#else
__attribute__((naked)) void sub_8099F58(u16 *vdest, const u16 *src, s8 a2, u8 a3)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0x20\n"
                    "\tmov r9, r0\n"
                    "\tadds r5, r1, 0\n"
                    "\tlsls r2, 24\n"
                    "\tlsls r3, 24\n"
                    "\tlsrs r3, 24\n"
                    "\tlsls r0, r3, 8\n"
                    "\tstr r0, [sp]\n"
                    "\tlsls r0, r3, 1\n"
                    "\tadds r0, r3\n"
                    "\tadds r0, 0x4\n"
                    "\tlsls r0, 28\n"
                    "\tlsrs r0, 16\n"
                    "\tstr r0, [sp, 0x4]\n"
                    "\tldr r0, _08099FB8 @ =gPokemonStorageSystemPtr\n"
                    "\tldr r0, [r0]\n"
                    "\tldr r1, _08099FBC @ =0x000008b4\n"
                    "\tadds r0, r1\n"
                    "\tldrh r1, [r0]\n"
                    "\tlsrs r1, 3\n"
                    "\tadds r1, 0xA\n"
                    "\tlsrs r0, r2, 24\n"
                    "\tmov r8, r0\n"
                    "\tasrs r2, 24\n"
                    "\tlsls r0, r2, 1\n"
                    "\tadds r0, r2\n"
                    "\tlsls r0, 3\n"
                    "\tadds r1, r0\n"
                    "\tmovs r0, 0x3F\n"
                    "\tands r1, r0\n"
                    "\tstr r1, [sp, 0x8]\n"
                    "\tadds r2, r1, 0\n"
                    "\tcmp r2, 0xC\n"
                    "\tbgt _08099FC0\n"
                    "\tmovs r6, 0x14\n"
                    "\tmovs r3, 0\n"
                    "\tlsls r0, r2, 1\n"
                    "\tadds r0, 0x80\n"
                    "\tmov r1, r9\n"
                    "\tadds r4, r1, r0\n"
                    "\tmovs r7, 0\n"
                    "\tb _0809A020\n"
                    "\t.align 2, 0\n"
                    "_08099FB8: .4byte gPokemonStorageSystemPtr\n"
                    "_08099FBC: .4byte 0x000008b4\n"
                    "_08099FC0:\n"
                    "\tcmp r2, 0x1F\n"
                    "\tbgt _08099FE6\n"
                    "\tmovs r0, 0x20\n"
                    "\tsubs r0, r2\n"
                    "\tlsls r0, 16\n"
                    "\tmovs r1, 0x14\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tasrs r0, 16\n"
                    "\tsubs r1, r0\n"
                    "\tlsls r1, 16\n"
                    "\tlsrs r3, r1, 16\n"
                    "\tlsls r0, r2, 1\n"
                    "\tadds r0, 0x80\n"
                    "\tmov r2, r9\n"
                    "\tadds r4, r2, r0\n"
                    "\tmovs r7, 0x88\n"
                    "\tlsls r7, 4\n"
                    "\tadd r7, r9\n"
                    "\tb _0809A020\n"
                    "_08099FE6:\n"
                    "\tcmp r2, 0x2C\n"
                    "\tbgt _08099FFE\n"
                    "\tmovs r6, 0x14\n"
                    "\tmovs r3, 0\n"
                    "\tlsls r0, r2, 1\n"
                    "\tmovs r1, 0x84\n"
                    "\tlsls r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tmov r2, r9\n"
                    "\tadds r4, r2, r0\n"
                    "\tmovs r7, 0\n"
                    "\tb _0809A020\n"
                    "_08099FFE:\n"
                    "\tmovs r0, 0x40\n"
                    "\tsubs r0, r2\n"
                    "\tlsls r0, 16\n"
                    "\tmovs r1, 0x14\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tasrs r0, 16\n"
                    "\tsubs r1, r0\n"
                    "\tlsls r1, 16\n"
                    "\tlsrs r3, r1, 16\n"
                    "\tlsls r0, r2, 1\n"
                    "\tmovs r1, 0x84\n"
                    "\tlsls r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tmov r2, r9\n"
                    "\tadds r4, r2, r0\n"
                    "\tmov r7, r9\n"
                    "\tadds r7, 0x80\n"
                    "_0809A020:\n"
                    "\tmovs r1, 0\n"
                    "\tmov r0, r8\n"
                    "\tlsls r0, 24\n"
                    "\tstr r0, [sp, 0x14]\n"
                    "\tlsls r0, r6, 16\n"
                    "\tasrs r0, 16\n"
                    "\tmov r8, r0\n"
                    "\tlsls r3, 16\n"
                    "\tstr r3, [sp, 0xC]\n"
                    "\tasrs r2, r3, 16\n"
                    "\tstr r2, [sp, 0x10]\n"
                    "_0809A036:\n"
                    "\tmovs r3, 0\n"
                    "\tadds r0, r4, 0\n"
                    "\tadds r0, 0x40\n"
                    "\tstr r0, [sp, 0x18]\n"
                    "\tadds r2, r7, 0\n"
                    "\tadds r2, 0x40\n"
                    "\tstr r2, [sp, 0x1C]\n"
                    "\tadds r1, 0x1\n"
                    "\tmov r10, r1\n"
                    "\tcmp r3, r8\n"
                    "\tbge _0809A07A\n"
                    "\tldr r0, _0809A0D4 @ =0x00000fff\n"
                    "\tmov r12, r0\n"
                    "\tmovs r6, 0xF0\n"
                    "\tlsls r6, 8\n"
                    "_0809A054:\n"
                    "\tldrh r2, [r5]\n"
                    "\tmov r0, r12\n"
                    "\tands r0, r2\n"
                    "\tldr r1, [sp]\n"
                    "\tadds r0, r1, r0\n"
                    "\tadds r1, r6, 0\n"
                    "\tands r1, r2\n"
                    "\tldr r2, [sp, 0x4]\n"
                    "\tadds r1, r2, r1\n"
                    "\torrs r1, r0\n"
                    "\tlsls r0, r3, 1\n"
                    "\tadds r0, r4\n"
                    "\tstrh r1, [r0]\n"
                    "\tadds r5, 0x2\n"
                    "\tadds r0, r3, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r3, r0, 16\n"
                    "\tcmp r3, r8\n"
                    "\tblt _0809A054\n"
                    "_0809A07A:\n"
                    "\tmovs r3, 0\n"
                    "\tldr r0, [sp, 0x10]\n"
                    "\tcmp r3, r0\n"
                    "\tbge _0809A0B4\n"
                    "\tldr r1, _0809A0D4 @ =0x00000fff\n"
                    "\tmov r12, r1\n"
                    "\tmovs r6, 0xF0\n"
                    "\tlsls r6, 8\n"
                    "\tldr r2, [sp, 0xC]\n"
                    "\tasrs r4, r2, 16\n"
                    "_0809A08E:\n"
                    "\tldrh r2, [r5]\n"
                    "\tmov r0, r12\n"
                    "\tands r0, r2\n"
                    "\tldr r1, [sp]\n"
                    "\tadds r0, r1, r0\n"
                    "\tadds r1, r6, 0\n"
                    "\tands r1, r2\n"
                    "\tldr r2, [sp, 0x4]\n"
                    "\tadds r1, r2, r1\n"
                    "\torrs r1, r0\n"
                    "\tlsls r0, r3, 1\n"
                    "\tadds r0, r7\n"
                    "\tstrh r1, [r0]\n"
                    "\tadds r5, 0x2\n"
                    "\tadds r0, r3, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r3, r0, 16\n"
                    "\tcmp r3, r4\n"
                    "\tblt _0809A08E\n"
                    "_0809A0B4:\n"
                    "\tldr r4, [sp, 0x18]\n"
                    "\tldr r7, [sp, 0x1C]\n"
                    "\tmov r1, r10\n"
                    "\tlsls r0, r1, 16\n"
                    "\tlsrs r1, r0, 16\n"
                    "\tcmp r1, 0x11\n"
                    "\tbls _0809A036\n"
                    "\tldr r0, [sp, 0x14]\n"
                    "\tasrs r2, r0, 24\n"
                    "\tcmp r2, 0\n"
                    "\tbeq _0809A13A\n"
                    "\tcmp r2, 0\n"
                    "\tble _0809A0D8\n"
                    "\tldr r1, [sp, 0x8]\n"
                    "\tadds r1, 0x14\n"
                    "\tb _0809A0DC\n"
                    "\t.align 2, 0\n"
                    "_0809A0D4: .4byte 0x00000fff\n"
                    "_0809A0D8:\n"
                    "\tldr r1, [sp, 0x8]\n"
                    "\tsubs r1, 0x4\n"
                    "_0809A0DC:\n"
                    "\tmovs r0, 0x3F\n"
                    "\tands r1, r0\n"
                    "\tadds r4, r1, 0\n"
                    "\tadds r0, r4, 0\n"
                    "\tcmp r0, 0x1F\n"
                    "\tbgt _0809A0EE\n"
                    "\tlsls r0, 1\n"
                    "\tadds r0, 0x80\n"
                    "\tb _0809A0F6\n"
                    "_0809A0EE:\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r2, 0x84\n"
                    "\tlsls r2, 4\n"
                    "\tadds r0, r2\n"
                    "_0809A0F6:\n"
                    "\tmov r1, r9\n"
                    "\tadds r2, r1, r0\n"
                    "\tmovs r3, 0\n"
                    "\tmovs r6, 0\n"
                    "_0809A0FE:\n"
                    "\tmovs r1, 0\n"
                    "\tadds r5, r3, 0x1\n"
                    "\tlsls r3, r4, 16\n"
                    "_0809A104:\n"
                    "\tstrh r6, [r2]\n"
                    "\tadds r2, 0x40\n"
                    "\tadds r0, r1, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r1, r0, 16\n"
                    "\tcmp r1, 0x11\n"
                    "\tbls _0809A104\n"
                    "\tasrs r0, r3, 16\n"
                    "\tadds r4, r0, 0x1\n"
                    "\tmovs r0, 0x3F\n"
                    "\tands r4, r0\n"
                    "\tadds r0, r4, 0\n"
                    "\tcmp r0, 0x1F\n"
                    "\tbgt _0809A126\n"
                    "\tlsls r0, 1\n"
                    "\tadds r0, 0x80\n"
                    "\tb _0809A12E\n"
                    "_0809A126:\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r2, 0x84\n"
                    "\tlsls r2, 4\n"
                    "\tadds r0, r2\n"
                    "_0809A12E:\n"
                    "\tmov r1, r9\n"
                    "\tadds r2, r1, r0\n"
                    "\tlsls r0, r5, 16\n"
                    "\tlsrs r3, r0, 16\n"
                    "\tcmp r3, 0x3\n"
                    "\tbls _0809A0FE\n"
                    "_0809A13A:\n"
                    "\tadd sp, 0x20\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0");
}
#endif

#ifdef NONMATCHING
void sub_809A14C(u16 *vdest)
{
    u16 *r2;
    u16 i;
    int r3 = ((gPokemonStorageSystemPtr->unk_08b4 >> 3) + 30) & 0x3f;
    r2 = vdest + (r3 < 0x20 ? r3 + 0x260 : r3 + 0x640);
    for (i = 0; i < 0x2b; i++)
    {
        *r2++ = 0;
        r3++;
        r3 &= 0x3f;
        if (r3 == 0)
            r2 -= 0x420;
        if (r3 == 0x20)
            r2 += 0x3e0;
    }
}
#else
__attribute__((naked)) void sub_809A14C(u16 *vdest)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                    "\tadds r2, r0, 0\n"
                    "\tldr r0, _0809A174 @ =gPokemonStorageSystemPtr\n"
                    "\tldr r0, [r0]\n"
                    "\tldr r1, _0809A178 @ =0x000008b4\n"
                    "\tadds r0, r1\n"
                    "\tldrh r0, [r0]\n"
                    "\tlsrs r0, 3\n"
                    "\tadds r3, r0, 0\n"
                    "\tadds r3, 0x1E\n"
                    "\tmovs r0, 0x3F\n"
                    "\tands r3, r0\n"
                    "\tadds r0, r3, 0\n"
                    "\tcmp r0, 0x1F\n"
                    "\tbgt _0809A17C\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r6, 0x98\n"
                    "\tlsls r6, 3\n"
                    "\tadds r0, r6\n"
                    "\tb _0809A184\n"
                    "\t.align 2, 0\n"
                    "_0809A174: .4byte gPokemonStorageSystemPtr\n"
                    "_0809A178: .4byte 0x000008b4\n"
                    "_0809A17C:\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r1, 0xC8\n"
                    "\tlsls r1, 4\n"
                    "\tadds r0, r1\n"
                    "_0809A184:\n"
                    "\tadds r2, r0\n"
                    "\tmovs r0, 0\n"
                    "\tmovs r5, 0\n"
                    "\tmovs r4, 0x3F\n"
                    "_0809A18C:\n"
                    "\tstrh r5, [r2]\n"
                    "\tadds r2, 0x2\n"
                    "\tadds r3, 0x1\n"
                    "\tands r3, r4\n"
                    "\tadds r1, r3, 0\n"
                    "\tcmp r1, 0\n"
                    "\tbne _0809A19E\n"
                    "\tldr r6, _0809A1B8 @ =0xfffff7c0\n"
                    "\tadds r2, r6\n"
                    "_0809A19E:\n"
                    "\tcmp r1, 0x20\n"
                    "\tbne _0809A1A8\n"
                    "\tmovs r1, 0xF8\n"
                    "\tlsls r1, 3\n"
                    "\tadds r2, r1\n"
                    "_0809A1A8:\n"
                    "\tadds r0, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tcmp r0, 0x2B\n"
                    "\tbls _0809A18C\n"
                    "\tpop {r4-r6}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_0809A1B8: .4byte 0xfffff7c0");
}
#endif

void sub_809A1BC(const u8 *a0, const u8 *text)
{
    u8 *r5 = gUnknown_083B6DB8;
    DmaClear16(3, r5, 0x200);
    Text_InitWindow8004E3C(&gWindowTemplate_81E6D38, r5, text);
    DmaCopy16(3, r5 + 0x000, a0 + 0x000, 0x80);
    DmaCopy16(3, r5 + 0x100, a0 + 0x080, 0x80);
    DmaCopy16(3, r5 + 0x080, a0 + 0x100, 0x80);
    DmaCopy16(3, r5 + 0x180, a0 + 0x180, 0x80);
}

const struct SpriteTemplate gSpriteTemplate_83BB2B8;

void sub_809A23C(u8 boxId)
{
    u8 tagIdx;
    s16 r6;
    u16 i;

    struct SpriteSheet spriteSheet = {gPokemonStorageSystemPtr->unk_08ca, 0x200, 3};
    struct SpritePalette palettes[] = {
        {gPokemonStorageSystemPtr->unk_0ccc, 0xdac8},
        {gPokemonStorageSystemPtr->unk_0ccc, 0xdac9},
        {}
    };

    u16 wallpaper = gPokemonStorage.wallpaper[boxId];
    gPokemonStorageSystemPtr->unk_0ccc[14] = gUnknown_083BB0A8[wallpaper][0];
    gPokemonStorageSystemPtr->unk_0ccc[15] = gUnknown_083BB0A8[wallpaper][1];
    LoadSpritePalettes(palettes);
    gPokemonStorageSystemPtr->unk_0d08 = 0x3f0;
    tagIdx = IndexOfSpritePaletteTag(0xdac8);
    gPokemonStorageSystemPtr->unk_0cec = 0x10e + 16 * tagIdx;
    gPokemonStorageSystemPtr->unk_0d08 |= 0x10000 << tagIdx;
    tagIdx = IndexOfSpritePaletteTag(0xdac9);
    gPokemonStorageSystemPtr->unk_0cee = 0x10e + 16 * tagIdx;
    gPokemonStorageSystemPtr->unk_0d08 |= 0x10000 << tagIdx;
    sub_809A1BC(gPokemonStorageSystemPtr->unk_08ca, gPokemonStorage.boxNames[boxId]);
    LoadSpriteSheet(&spriteSheet);
    r6 = sub_809A6D0(sub_8072CA4(gPokemonStorage.boxNames[boxId]));
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_83BB2B8, r6 + i * 32, 0x1c, 23);
        gPokemonStorageSystemPtr->unk_0cf0[i] = gSprites + spriteId;
        StartSpriteAnim(gPokemonStorageSystemPtr->unk_0cf0[i], i);
    }
    gPokemonStorageSystemPtr->unk_0cca = 0;
}

void sub_809A3D0(u8 boxId, s8 a1)
{
    u16 r8;
    s16 x;
    s16 x2;
    u16 i;
    struct SpriteSheet spriteSheet = {gPokemonStorageSystemPtr->unk_08ca, 0x200, 3};
    struct SpriteTemplate template = gSpriteTemplate_83BB2B8;

    gPokemonStorageSystemPtr->unk_0cca = gPokemonStorageSystemPtr->unk_0cca ? FALSE : TRUE;
    if (gPokemonStorageSystemPtr->unk_0cca == 0)
    {
        spriteSheet.tag = 3;
        r8 = gPokemonStorageSystemPtr->unk_0cec;
    }
    else
    {
        spriteSheet.tag = 4;
        r8 = gPokemonStorageSystemPtr->unk_0cec;
        template.tileTag = 4;
        template.paletteTag = 0xdac9;
    }
    sub_809A1BC(gPokemonStorageSystemPtr->unk_08ca, gPokemonStorage.boxNames[boxId]);
    LoadSpriteSheet(&spriteSheet);
    LoadPalette(gUnknown_083BB0A8[gPokemonStorage.wallpaper[boxId]], r8, 0x04);
    x = sub_809A6D0(sub_8072CA4(gPokemonStorage.boxNames[boxId]));
    x2 = x + a1 * 192;
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&template, i * 32 + x2, 0x1c, 23);
        gPokemonStorageSystemPtr->unk_0cf8[i] = gSprites + spriteId;
        gPokemonStorageSystemPtr->unk_0cf8[i]->data[0] = (-a1) * 6;
        gPokemonStorageSystemPtr->unk_0cf8[i]->data[1] = i * 32 + x;
        gPokemonStorageSystemPtr->unk_0cf8[i]->data[2] = 1;
        gPokemonStorageSystemPtr->unk_0cf8[i]->callback = sub_809A5E8;
        StartSpriteAnim(gPokemonStorageSystemPtr->unk_0cf8[i], i);
        gPokemonStorageSystemPtr->unk_0cf0[i]->data[0] = (-a1) * 6;
        gPokemonStorageSystemPtr->unk_0cf0[i]->data[1] = 1;
        gPokemonStorageSystemPtr->unk_0cf0[i]->callback = sub_809A61C;
    }
}

const u16 PCPal_Arrow[] = INCBIN_U16("graphics/pokemon_storage/arrow.gbapal");
const u8 PCGfx_Arrow[] = INCBIN_U8("graphics/pokemon_storage/arrow.4bpp");

const struct SpriteSheet gUnknown_083BB288 = {PCGfx_Arrow, 0x80, 6};
const struct SpritePalette gUnknown_083BB290 = {PCPal_Arrow, 0xdacf};

const struct OamData gOamData_83BB298 = {
    .shape = ST_OAM_H_RECTANGLE,
    .size = 2,
    .priority = 2
};

const union AnimCmd gSpriteAnim_83BB2A0[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83BB2A8[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83BB2B0[] = {
    gSpriteAnim_83BB2A0,
    gSpriteAnim_83BB2A8
};

const struct SpriteTemplate gSpriteTemplate_83BB2B8 = {
    3,
    0xdac8,
    &gOamData_83BB298,
    gSpriteAnimTable_83BB2B0,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

void sub_809A598(void)
{
    if (gPokemonStorageSystemPtr->unk_0cca == 0)
        FreeSpriteTilesByTag(4);
    else
        FreeSpriteTilesByTag(3);
    gPokemonStorageSystemPtr->unk_0cf0[0] = gPokemonStorageSystemPtr->unk_0cf8[0];
    gPokemonStorageSystemPtr->unk_0cf0[1] = gPokemonStorageSystemPtr->unk_0cf8[1];
}

void sub_809A5E8(struct Sprite *sprite)
{
    if (sprite->data[2])
        sprite->data[2]--;
    else if ((sprite->pos1.x += sprite->data[0]) == sprite->data[1])
        sprite->callback = SpriteCallbackDummy;
}

void sub_809A61C(struct Sprite *sprite)
{
    if (sprite->data[1])
        sprite->data[1]--;
    else
    {
        sprite->pos1.x += sprite->data[0];
        sprite->data[2] = sprite->pos1.x + sprite->pos2.x;
        if (sprite->data[2] < 0x40 || sprite->data[2] > 0x100)
            DestroySprite(sprite);
    }
}

void sub_809A654(void)
{
    u8 boxId = get_preferred_box();
    u8 wallpaperId = gPokemonStorage.wallpaper[boxId];
    if (gPokemonStorageSystemPtr->unk_0cca == 0)
        CpuCopy16(gUnknown_083BB0A8[wallpaperId], gPlttBufferUnfaded + gPokemonStorageSystemPtr->unk_0cec, 4);
    else
        CpuCopy16(gUnknown_083BB0A8[wallpaperId], gPlttBufferUnfaded + gPokemonStorageSystemPtr->unk_0cee, 4);
}

s16 sub_809A6D0(u8 width)
{
    return 0xb0 - width / 2;
}
