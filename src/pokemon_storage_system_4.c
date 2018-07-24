
// Includes
#include "global.h"
#include "ewram.h"
#include "data2.h"
#include "constants/moves.h"
#include "constants/species.h"
#include "palette.h"
#include "string_util.h"
#include "text.h"
#include "menu.h"
#include "item.h"
#include "pokemon_summary_screen.h"
#include "pokemon_storage_system.h"

// Static type declarations

struct WallpaperTable {
    const u8 *tiles;
    u32 size;
    const u8 *tileMap;
    const u16 *palettes;
};

// Static RAM declarations

EWRAM_DATA struct Pokemon gUnknown_02038480 = {};
#if DEBUG
EWRAM_DATA u8 unk_2038790 = 0;
EWRAM_DATA u32 unk_2038794 = 0;
EWRAM_DATA u32 unk_2038798 = 0;
#endif
EWRAM_DATA s8 gUnknown_020384E4 = 0;
EWRAM_DATA s8 gUnknown_020384E5 = 0;
EWRAM_DATA bool8 gUnknown_020384E6 = FALSE;
EWRAM_DATA u8 gUnknown_020384E7 = 0;
EWRAM_DATA u8 gUnknown_020384E8 = 0;
EWRAM_DATA u8 gUnknown_020384E9 = 0;
EWRAM_DATA u8 gUnknown_020384EA = 0;
EWRAM_DATA struct UnkStruct_2000020 *gUnknown_020384EC = NULL;

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
void sub_809AFB8(void);
void sub_809A8C8(struct Sprite *sprite);
bool8 sub_809B150(void);
bool8 sub_809B1D8(void);
bool8 sub_809B24C(void);
bool8 sub_809B324(void);
bool8 sub_809B358(void);
void sub_809B384(void);
void sub_809B3E0(void);
void sub_809B44C(u8 a0, u8 a1);
void diegohint2(u8 a0, u8 a1);
void sub_809B548(u8 a0, u8 a1);
void diegohint1(u8 a0, u8 a1);
bool8 sub_809BF2C(void);
void sub_809BF74(void);
void sub_809C028(void);
void sub_809C04C(void *pokemon, u8 a1);
bool8 sub_809CAB0(void);
void sub_809CC04(void);
void sub_809CD88(void);
s8 sub_809CE4C(u8 a0);
void sub_809CA8C(void);
void sub_809D0BC(struct UnkStruct_2000028*);
void sub_809D1C4(struct UnkStruct_2000028*);

// .rodata

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

const struct OamData gOamData_83BB2D0 = {
    .shape = ST_OAM_V_RECTANGLE,
    .priority = 2
};

const union AnimCmd gSpriteAnim_83BB2D8[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83BB2E0[] = {
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83BB2E8[] = {
    gSpriteAnim_83BB2D8,
    gSpriteAnim_83BB2E0
};

const struct SpriteTemplate gSpriteTemplate_83BB2F0 = {
    6,
    0xdacf,
    &gOamData_83BB2D0,
    gSpriteAnimTable_83BB2E8,
    NULL,
    gDummySpriteAffineAnimTable,
    sub_809A8C8
};

const u16 HandCursorPalette[] = INCBIN_U16("graphics/pokemon_storage/hand_cursor_pal.bin");
const u16 HandCursorAltPalette[] = INCBIN_U16("graphics/pokemon_storage/hand_cursor_alt_pal.bin");
const u8 HandCursorTiles[] = INCBIN_U8("graphics/pokemon_storage/hand_cursor.4bpp");
const u8 HandCursorShadowTiles[] = INCBIN_U8("graphics/pokemon_storage/hand_cursor_shadow.4bpp");

bool8 (*const gUnknown_083BBBC8[])(void) = {
    sub_809B150,
    sub_809B1D8,
    sub_809B24C
};

extern const struct SpriteSheet gHandCursorSpriteSheets[3];
extern const struct SpritePalette gHandCursorSpritePalettes[3];
extern const struct SpriteTemplate gSpriteTemplate_83BBC70;
extern const struct SpriteTemplate gSpriteTemplate_83BBC88;
extern const u8 *const gUnknown_083BBCA0[];
extern struct PokemonStorageSystemFunc gUnknown_083BBBD4[];

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
            BeginNormalPaletteFade(gPokemonStorageSystemPtr->unk_0d08, 1, 0, 16, FADE_COLOR_WHITE);
            gPokemonStorageSystemPtr->unk_1032++;
            break;
        case 1:
            if (!UpdatePaletteFade())
            {
                u8 curBox = get_preferred_box();
                sub_8099EB0(curBox, 0);
                sub_809A654();
                BeginNormalPaletteFade(gPokemonStorageSystemPtr->unk_0d08, 1, 16, 0, FADE_COLOR_WHITE);
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
NAKED void sub_8099F58(u16 *vdest, const u16 *src, s8 a2, u8 a3)
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
NAKED void sub_809A14C(u16 *vdest)
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
    r6 = sub_809A6D0(GetStringWidthInMenuWindow(gPokemonStorage.boxNames[boxId]));
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
    x = sub_809A6D0(GetStringWidthInMenuWindow(gPokemonStorage.boxNames[boxId]));
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

void sub_809A6DC(void)
{
    u16 i;

    LoadSpriteSheet(&gUnknown_083BB288);
    LoadSpritePalette(&gUnknown_083BB290);
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_83BB2F0, 0x5c + i * 0x88, 0x1c, 21);
        if (spriteId != MAX_SPRITES)
        {
            struct Sprite *sprite = gSprites + spriteId;
            StartSpriteAnim(sprite, i);
            sprite->data[3] = (i == 0) ? -1 : 1;
            gPokemonStorageSystemPtr->unk_0d00[i] = sprite;
        }
    }
    if (sub_809BF2C())
        sub_809A860(TRUE);
}

void sub_809A774(s8 a0)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        gPokemonStorageSystemPtr->unk_0d00[i]->pos2.x = 0;
        gPokemonStorageSystemPtr->unk_0d00[i]->data[0] = 2;
    }
    if (a0 < 0)
    {
        gPokemonStorageSystemPtr->unk_0d00[0]->data[1] = 29;
        gPokemonStorageSystemPtr->unk_0d00[1]->data[1] = 5;
        gPokemonStorageSystemPtr->unk_0d00[0]->data[2] = 0x48;
        gPokemonStorageSystemPtr->unk_0d00[1]->data[2] = 0x48;
    }
    else
    {
        gPokemonStorageSystemPtr->unk_0d00[0]->data[1] = 5;
        gPokemonStorageSystemPtr->unk_0d00[1]->data[1] = 29;
        gPokemonStorageSystemPtr->unk_0d00[0]->data[2] = 0xF8;
        gPokemonStorageSystemPtr->unk_0d00[1]->data[2] = 0xF8;
    }
    gPokemonStorageSystemPtr->unk_0d00[0]->data[7] = 0;
    gPokemonStorageSystemPtr->unk_0d00[1]->data[7] = 1;
}

void sub_809A810(void)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        gPokemonStorageSystemPtr->unk_0d00[i]->pos1.x = 0x88 * i + 0x5c;
        gPokemonStorageSystemPtr->unk_0d00[i]->pos2.x = 0;
        gPokemonStorageSystemPtr->unk_0d00[i]->invisible = FALSE;
    }
    sub_809A860(TRUE);
}

void sub_809A860(bool8 a0)
{
    u16 i;
    if (a0)
    {
        for (i = 0; i < 2; i++)
        {
            gPokemonStorageSystemPtr->unk_0d00[i]->data[0] = 1;
            gPokemonStorageSystemPtr->unk_0d00[i]->data[1] = 0;
            gPokemonStorageSystemPtr->unk_0d00[i]->data[2] = 0;
            gPokemonStorageSystemPtr->unk_0d00[i]->data[4] = 0;
        }
    }
        else
    {
        for (i = 0; i < 2; i++)
        {
            gPokemonStorageSystemPtr->unk_0d00[i]->data[0] = 0;
        }
    }
}

void sub_809A8C8(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            sprite->pos2.x = 0;
            break;
        case 1:
            if (++sprite->data[1] > 3)
            {
                sprite->data[1] = 0;
                sprite->pos2.x += sprite->data[3];
                if (++sprite->data[2] > 5)
                {
                    sprite->data[2] = 0;
                    sprite->pos2.x = 0;
                }
            }
            break;
        case 2:
            sprite->data[0] = 3;
            break;
        case 3:
            sprite->pos1.x -= gPokemonStorageSystemPtr->unk_08b6;
            if (sprite->pos1.x < 0x49 || sprite->pos1.x > 0xf7)
                sprite->invisible = TRUE;
            if (--sprite->data[1] == 0)
            {
                sprite->pos1.x = sprite->data[2];
                sprite->invisible = FALSE;
                sprite->data[0] = 4;
            }
            break;
        case 4:
            sprite->pos1.x -= gPokemonStorageSystemPtr->unk_08b6;
            break;
    }
}

struct Sprite *sub_809A9A0(u16 x, u16 y, u8 animId, u8 priority, u8 subpriority)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83BB2F0, x, y, subpriority);
    if (spriteId == MAX_SPRITES)
        return NULL;
    animId %= 2;
    StartSpriteAnim(gSprites + spriteId, animId);
    gSprites[spriteId].oam.priority = priority;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    return gSprites + spriteId;
}

void sub_809AA24(void)
{
    if (gPokemonStorageSystemPtr->unk_0005 != 1)
        gUnknown_020384E4 = 0;
    else
        gUnknown_020384E4 = 1;
    gUnknown_020384E5 = 0;
    gUnknown_020384E6 = FALSE;
    gUnknown_020384E7 = 0;
    gUnknown_020384E8 = 0;
    gUnknown_020384E9 = 0;
    sub_809B0D4();
    sub_809CC04();
    gPokemonStorageSystemPtr->unk_11e2 = 1;
    sub_809BF74();
}

void sub_809AA98(void)
{
    sub_809CC04();
    sub_809C028();
    gPokemonStorageSystemPtr->unk_11e2 = 1;
    if (gUnknown_020384E6)
        sub_8098BF0();
}

void sub_809AACC(u8 a0, u8 a1, u16 *a2, u16 *a3)
{
    switch (a0)
    {
        case 0:
            *a2 = (a1 % 6) * 24 + 100;
            *a3 = (a1 / 6) * 24 +  32;
            break;
        case 1:
            if (a1 == 0)
            {
                *a2 = 0x68;
                *a3 = 0x34;
            }
            else if (a1 == 6)
            {
                *a2 = 0x98;
                *a3 = 0x84;
            }
            else
            {
                *a2 = 0x98;
                *a3 = (a1 - 1) * 24 + 4;
            }
            break;
        case 2:
            *a2 = 0xa2;
            *a3 = 0x0c;
            break;
        case 3:
            *a3 = gUnknown_020384E6 ? 8 : 14;
            *a2 = a1 * 0x58 + 0x78;
            break;
        case 4:
            *a2 = 0xa0;
            *a3 = 0x60;
            break;
    }
}

u16 sub_809AB8C(void)
{
    switch (gUnknown_020384E4)
    {
        case 1:
            return GetMonData(gPlayerParty + gUnknown_020384E5, MON_DATA_SPECIES);
        case 0:
            return GetBoxMonData(gPokemonStorage.boxes[get_preferred_box()] + gUnknown_020384E5, MON_DATA_SPECIES);
        default:
            return SPECIES_NONE;
    }
}

bool8 sub_809AC00(void)
{
    s16 tmp;
    if (gPokemonStorageSystemPtr->unk_11dc == 0)
        return FALSE;
    if (--gPokemonStorageSystemPtr->unk_11dc)
    {
        gPokemonStorageSystemPtr->unk_11c8 += gPokemonStorageSystemPtr->unk_11d0;
        gPokemonStorageSystemPtr->unk_11cc += gPokemonStorageSystemPtr->unk_11d4;
        gPokemonStorageSystemPtr->unk_11c0->pos1.x = gPokemonStorageSystemPtr->unk_11c8 >> 8;
        gPokemonStorageSystemPtr->unk_11c0->pos1.y = gPokemonStorageSystemPtr->unk_11cc >> 8;
        if (gPokemonStorageSystemPtr->unk_11c0->pos1.x > 0x100)
        {
            tmp = gPokemonStorageSystemPtr->unk_11c0->pos1.x - 0x100;
            gPokemonStorageSystemPtr->unk_11c0->pos1.x = tmp + 0x40;
        }
        if (gPokemonStorageSystemPtr->unk_11c0->pos1.x < 0x40)
        {
            tmp = 0x40 - gPokemonStorageSystemPtr->unk_11c0->pos1.x;
            gPokemonStorageSystemPtr->unk_11c0->pos1.x = 0x100 - tmp;
        }
        if (gPokemonStorageSystemPtr->unk_11c0->pos1.y > 0xb0)
        {
            tmp = gPokemonStorageSystemPtr->unk_11c0->pos1.y - 0xb0;
            gPokemonStorageSystemPtr->unk_11c0->pos1.y = tmp - 0x10;
        }
        if (gPokemonStorageSystemPtr->unk_11c0->pos1.y < -0x10)
        {
            tmp = -0x10 - gPokemonStorageSystemPtr->unk_11c0->pos1.y;
            gPokemonStorageSystemPtr->unk_11c0->pos1.y = 0xb0 - tmp;
        }
        if (gPokemonStorageSystemPtr->unk_11e3 && --gPokemonStorageSystemPtr->unk_11e3 == 0)
            gPokemonStorageSystemPtr->unk_11c0->vFlip = gPokemonStorageSystemPtr->unk_11c0->vFlip ? FALSE : TRUE;
    }
    else
    {
        gPokemonStorageSystemPtr->unk_11c0->pos1.x = gPokemonStorageSystemPtr->unk_11d8;
        gPokemonStorageSystemPtr->unk_11c0->pos1.y = gPokemonStorageSystemPtr->unk_11da;
        sub_809AFB8();
    }
    return TRUE;
}

void sub_809AD3C(u8 a0, u8 a1)
{
    u16 x;
    u16 y;

    sub_809AACC(a0, a1, &x, &y);
    gPokemonStorageSystemPtr->unk_11e0 = a0;
    gPokemonStorageSystemPtr->unk_11e1 = a1;
    gPokemonStorageSystemPtr->unk_11d8 = x;
    gPokemonStorageSystemPtr->unk_11da = y;
}

void sub_809AD94(void)
{
    int r7;
    int r0;

    if (gPokemonStorageSystemPtr->unk_11de || gPokemonStorageSystemPtr->unk_11df)
        gPokemonStorageSystemPtr->unk_11dc = 12;
    else
        gPokemonStorageSystemPtr->unk_11dc = 6;
    if (gPokemonStorageSystemPtr->unk_11e3)
        gPokemonStorageSystemPtr->unk_11e3 = gPokemonStorageSystemPtr->unk_11dc >> 1;
    switch (gPokemonStorageSystemPtr->unk_11de)
    {
        default:
            r7 = gPokemonStorageSystemPtr->unk_11da - gPokemonStorageSystemPtr->unk_11c0->pos1.y;
            break;
        case -1:
            r7 = gPokemonStorageSystemPtr->unk_11da - 0xc0 - gPokemonStorageSystemPtr->unk_11c0->pos1.y;
            break;
        case 1:
            r7 = gPokemonStorageSystemPtr->unk_11da + 0xc0 - gPokemonStorageSystemPtr->unk_11c0->pos1.y;
            break;
    }
    switch (gPokemonStorageSystemPtr->unk_11df)
    {
        default:
            r0 = gPokemonStorageSystemPtr->unk_11d8 - gPokemonStorageSystemPtr->unk_11c0->pos1.x;
            break;
        case -1:
            r0 = gPokemonStorageSystemPtr->unk_11d8 - 0xc0 - gPokemonStorageSystemPtr->unk_11c0->pos1.x;
            break;
        case 1:
            r0 = gPokemonStorageSystemPtr->unk_11d8 + 0xc0 - gPokemonStorageSystemPtr->unk_11c0->pos1.x;
            break;
    }
    r7 <<= 8;
    r0 <<= 8;
    gPokemonStorageSystemPtr->unk_11d0 = r0 / gPokemonStorageSystemPtr->unk_11dc;
    gPokemonStorageSystemPtr->unk_11d4 = r7 / gPokemonStorageSystemPtr->unk_11dc;
    gPokemonStorageSystemPtr->unk_11c8 = gPokemonStorageSystemPtr->unk_11c0->pos1.x << 8;
    gPokemonStorageSystemPtr->unk_11cc = gPokemonStorageSystemPtr->unk_11c0->pos1.y << 8;
}

void sub_809AF18(u8 a0, u8 a1)
{
    sub_809AD3C(a0, a1);
    sub_809AD94();
    if (!gUnknown_020384E6)
        StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 1);
    if (a0 == 1 && gUnknown_020384E4 != 1)
    {
        gPokemonStorageSystemPtr->unk_11e2 = a0;
        gPokemonStorageSystemPtr->unk_11c4->invisible = TRUE;
    }
    switch (a0)
    {
        case 0:
            break;
        case 1 ... 3:
            gPokemonStorageSystemPtr->unk_11c4->invisible = TRUE;
            gPokemonStorageSystemPtr->unk_11c4->oam.priority = 1;
            break;
    }
}

void sub_809AFB8(void)
{
    gUnknown_020384E4 = gPokemonStorageSystemPtr->unk_11e0;
    gUnknown_020384E5 = gPokemonStorageSystemPtr->unk_11e1;
    if (!gUnknown_020384E6)
        StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 0);
    sub_809BF74();
    switch (gUnknown_020384E4)
    {
        case 2:
            sub_809A860(TRUE);
            break;
        case 1:
            gPokemonStorageSystemPtr->unk_11c4->subpriority = 12;
            break;
        case 0:
            gPokemonStorageSystemPtr->unk_11c4->oam.priority = 2;
            gPokemonStorageSystemPtr->unk_11c4->subpriority = 20;
            gPokemonStorageSystemPtr->unk_11c4->invisible = FALSE;
            break;
    }
}

void sub_809B068(void)
{
    u8 partyCount;
    if (!gUnknown_020384E6)
        partyCount = 0;
    else
    {
        partyCount = CalculatePlayerPartyCount();
        if (partyCount > PARTY_SIZE - 1)
            partyCount = PARTY_SIZE - 1;
    }
    if (gPokemonStorageSystemPtr->unk_11c0->vFlip)
        gPokemonStorageSystemPtr->unk_11e3 = 1;
    sub_809AF18(1, partyCount);
}

void sub_809B0C0(u8 a0)
{
    sub_809AF18(0, a0);
}

void sub_809B0D4(void)
{
    gUnknown_020384EA = 0;
}

void sub_809B0E0(void)
{
    gUnknown_020384EA = gUnknown_020384E5;
}

u8 sub_809B0F4(void)
{
    return gUnknown_020384EA;
}

void sub_809B100(u8 a0)
{
    gPokemonStorageSystemPtr->unk_12a4 = gUnknown_083BBBC8[a0];
    gPokemonStorageSystemPtr->unk_12a8 = 0;
}

bool8 sub_809B130(void)
{
    return gPokemonStorageSystemPtr->unk_12a4();
}

bool8 sub_809B150(void)
{
    switch (gPokemonStorageSystemPtr->unk_12a8)
    {
        case 0:
            if (gUnknown_020384E6)
                return FALSE;
            StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 2);
            gPokemonStorageSystemPtr->unk_12a8++;
            break;
        case 1:
            if (!sub_809B324())
            {
                StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 3);
                sub_809B384();
                gPokemonStorageSystemPtr->unk_12a8++;
            }
            break;
        case 2:
            if (!sub_809B358())
                gPokemonStorageSystemPtr->unk_12a8++;
            break;
        case 3:
            return FALSE;
    }
    return TRUE;
}

bool8 sub_809B1D8(void)
{
    switch (gPokemonStorageSystemPtr->unk_12a8)
    {
        case 0:
            if (!sub_809B324())
            {
                StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 2);
                sub_809B3E0();
                gPokemonStorageSystemPtr->unk_12a8++;
            }
            break;
        case 1:
            if (!sub_809B358())
            {
                StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 0);
                gPokemonStorageSystemPtr->unk_12a8++;
            }
            break;
        case 2:
            return FALSE;
    }
    return TRUE;
}

bool8 sub_809B24C(void)
{
    switch (gPokemonStorageSystemPtr->unk_12a8)
    {
        case 0:
            switch (gUnknown_020384E4)
            {
                case 1:
                    gPokemonStorageSystemPtr->unk_12a9 = 14;
                    break;
                case 0:
                    gPokemonStorageSystemPtr->unk_12a9 = get_preferred_box();
                    break;
                default:
                    return FALSE;
            }
            StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 2);
            sub_80996B0(gPokemonStorageSystemPtr->unk_12a9, gUnknown_020384E5);
            gPokemonStorageSystemPtr->unk_12a8++;
            break;
        case 1:
            if (!sub_809971C())
            {
                StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 3);
                diegohint1(gPokemonStorageSystemPtr->unk_12a9, gUnknown_020384E5);
                gPokemonStorageSystemPtr->unk_12a8++;
            }
            break;
        case 2:
            return FALSE;
    }
    return TRUE;
}

bool8 sub_809B324(void)
{
    switch (gPokemonStorageSystemPtr->unk_11c0->pos2.y)
    {
        default:
            gPokemonStorageSystemPtr->unk_11c0->pos2.y++;
            break;
        case 0:
            gPokemonStorageSystemPtr->unk_11c0->pos2.y++;
            break;
        case 8:
            return FALSE;
    }
    return TRUE;
}

bool8 sub_809B358(void)
{
    switch (gPokemonStorageSystemPtr->unk_11c0->pos2.y)
    {
        case 0:
            return FALSE;
        default:
            gPokemonStorageSystemPtr->unk_11c0->pos2.y--;
            break;
    }
    return TRUE;
}

void sub_809B384(void)
{
    switch (gUnknown_020384E4)
    {
        case 1:
            sub_809B44C(14, gUnknown_020384E5);
            sub_8099584(0, gUnknown_020384E5);
            break;
        case 0:
            sub_809B44C(get_preferred_box(), gUnknown_020384E5);
            sub_8099584(1, gUnknown_020384E5);
            break;
        default:
            return;
    }
    gUnknown_020384E6 = TRUE;
}

void sub_809B3E0(void)
{
    u8 boxId;
    switch (gUnknown_020384E4)
    {
        case 1:
            diegohint2(14, gUnknown_020384E5);
            sub_809960C(14, gUnknown_020384E5);
            break;
        case 0:
            boxId = get_preferred_box();
            diegohint2(boxId, gUnknown_020384E5);
            sub_809960C(boxId, gUnknown_020384E5);
            break;
        default:
            return;
    }
    gUnknown_020384E6 = FALSE;
}

void sub_809B440(void)
{
    sub_809BF74();
}

void sub_809B44C(u8 a0, u8 a1)
{
    if (a0 == 14)
        gPokemonStorageSystemPtr->unk_25b4 = gPlayerParty[gUnknown_020384E5];
    else
        ExpandBoxMon(gPokemonStorage.boxes[a0] + a1, &gPokemonStorageSystemPtr->unk_25b4);
    sub_809B548(a0, a1);
    gUnknown_020384E7 = a0;
    gUnknown_020384E8 = a1;
}

void diegohint2(u8 a0, u8 a1)
{
    if (a0 == 14)
    {
        gPlayerParty[a1] = gPokemonStorageSystemPtr->unk_25b4;
    }
    else
    {
        BoxMonRestorePP(&gPokemonStorageSystemPtr->unk_25b4.box);
        gPokemonStorage.boxes[a0][a1] = gPokemonStorageSystemPtr->unk_25b4.box;
    }
}

void sub_809B548(u8 a0, u8 a1)
{
    if (a0 == 14)
        ZeroMonData(gPlayerParty + a1);
    else
        ZeroBoxMonData(gPokemonStorage.boxes[a0] + a1);
}

void diegohint1(u8 a0, u8 a1)
{
    if (a0 == 14)
        gPokemonStorageSystemPtr->unk_2618 = gPlayerParty[a1];
    else
        ExpandBoxMon(gPokemonStorage.boxes[a0] + a1, &gPokemonStorageSystemPtr->unk_2618);
    diegohint2(a0, a1);
    gPokemonStorageSystemPtr->unk_25b4 = gPokemonStorageSystemPtr->unk_2618;
    sub_809C04C(&gPokemonStorageSystemPtr->unk_25b4, 0);
    gUnknown_020384E7 = a0;
    gUnknown_020384E8 = a1;
}

bool8 sub_809B62C(u8 boxId)
{
    s16 monIdx = GetIndexOfFirstEmptySpaceInBoxN(boxId);
    if (monIdx == -1)
        return FALSE;
    if (gUnknown_020384E6)
    {
        diegohint2(boxId, monIdx);
        sub_8099480();
        gUnknown_020384E6 = FALSE;
    }
    else
    {
        sub_809B44C(14, gUnknown_020384E5);
        diegohint2(boxId, monIdx);
        sub_8099520(gUnknown_020384E5);
    }
    if (boxId == get_preferred_box())
        sub_8098D20(monIdx);
    StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 1);
    return TRUE;
}

void sub_809B6BC(void)
{
    StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 0);
    sub_809BF74();
}

void sub_809B6DC(void)
{
    u8 mode;

    if (gUnknown_020384E6)
        mode = 2;
    else if (gUnknown_020384E4 == 1)
        mode = 0;
    else
        mode = 1;
    sub_809981C(mode, gUnknown_020384E5);
    StringCopy(gPokemonStorageSystemPtr->unk_26e4, gPokemonStorageSystemPtr->unk_11fa);
}

bool8 sub_809B734(void)
{
    if (!sub_80998D8())
    {
        StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 0);
        return FALSE;
    }
    return TRUE;
}

void sub_809B760(void)
{
    sub_8099920();
    if (gUnknown_020384E6)
        gUnknown_020384E6 = FALSE;
    else
    {
        u8 boxId;
        if (gUnknown_020384E4 == 1)
            boxId = 14;
        else
            boxId = get_preferred_box();
        sub_809B548(boxId, gUnknown_020384E5);
    }
    sub_809BF74();
}

void sub_809B7AC(void)
{
    if (gUnknown_020384E6)
        StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 3);
}

void sub_809B7D4(void)
{
    u16 knownMoves;
    if (gUnknown_020384E6)
    {
        gPokemonStorageSystemPtr->unk_2618 = gPokemonStorageSystemPtr->unk_25b4;
        gPokemonStorageSystemPtr->unk_2682 = -1;
        gPokemonStorageSystemPtr->unk_2683 = -1;
    }
    else
    {
        if (gUnknown_020384E4 == 1)
        {
            gPokemonStorageSystemPtr->unk_2618 = gPlayerParty[gUnknown_020384E5];
            gPokemonStorageSystemPtr->unk_2682 = 14;
        }
        else
        {
            ExpandBoxMon(gPokemonStorage.boxes[gPokemonStorage.currentBox] + gUnknown_020384E5, &gPokemonStorageSystemPtr->unk_2618);
            gPokemonStorageSystemPtr->unk_2682 = gPokemonStorage.currentBox;
        }
        gPokemonStorageSystemPtr->unk_2683 = gUnknown_020384E5;
    }
    gPokemonStorageSystemPtr->unk_267e = 0;
    gPokemonStorageSystemPtr->unk_267f = 0;
    gPokemonStorageSystemPtr->unk_2686[0] = MOVE_SURF;
    gPokemonStorageSystemPtr->unk_2686[1] = MOVE_DIVE;
    gPokemonStorageSystemPtr->unk_2686[2] = NUM_MOVES;
    knownMoves = GetMonData(&gPokemonStorageSystemPtr->unk_2618, MON_DATA_KNOWN_MOVES, gPokemonStorageSystemPtr->unk_2686);
    gPokemonStorageSystemPtr->unk_267e = knownMoves & 1;
    gPokemonStorageSystemPtr->unk_267f = (knownMoves >> 1) & 1;
    if (gPokemonStorageSystemPtr->unk_267e || gPokemonStorageSystemPtr->unk_267f)
        gPokemonStorageSystemPtr->unk_267d = 0;
    else
    {
        gPokemonStorageSystemPtr->unk_267d = 1;
        gPokemonStorageSystemPtr->unk_267c = 1;
    }
    gPokemonStorageSystemPtr->unk_2684 = 0;
}

s8 sub_809B960(void)
{
    u16 i;
    u16 knownMoves;

    if (gPokemonStorageSystemPtr->unk_267d)
        return gPokemonStorageSystemPtr->unk_267c;
    switch (gPokemonStorageSystemPtr->unk_2684)
    {
        case 0:
            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (gPokemonStorageSystemPtr->unk_2682 != 14 || gPokemonStorageSystemPtr->unk_2683 != i)
                {
                    knownMoves = GetMonData(gPlayerParty + i, MON_DATA_KNOWN_MOVES, gPokemonStorageSystemPtr->unk_2686);
                    if (knownMoves & 1)
                        gPokemonStorageSystemPtr->unk_267e = 0;
                    if (knownMoves & 2)
                        gPokemonStorageSystemPtr->unk_267f = 0;
                }
            }
            if (gPokemonStorageSystemPtr->unk_267e == 0 && gPokemonStorageSystemPtr->unk_267f == 0)
            {
                gPokemonStorageSystemPtr->unk_267d = 1;
                gPokemonStorageSystemPtr->unk_267c = 1;
            }
            else
            {
                gPokemonStorageSystemPtr->unk_2680 = 0;
                gPokemonStorageSystemPtr->unk_2681 = 0;
                gPokemonStorageSystemPtr->unk_2684++;
            }
            break;
        case 1:
            for (i = 0; i < 5; i++)
            {
                knownMoves = GetBoxMonData(gPokemonStorage.boxes[gPokemonStorageSystemPtr->unk_2680] + gPokemonStorageSystemPtr->unk_2681, MON_DATA_KNOWN_MOVES, gPokemonStorageSystemPtr->unk_2686);
                if (knownMoves && (gPokemonStorageSystemPtr->unk_2682 != gPokemonStorageSystemPtr->unk_2680 || gPokemonStorageSystemPtr->unk_2683 != gPokemonStorageSystemPtr->unk_2681))
                {
                    if (knownMoves & 1)
                        gPokemonStorageSystemPtr->unk_267e = 0;
                    if (knownMoves & 2)
                        gPokemonStorageSystemPtr->unk_267f = 0;
                }
                if (++gPokemonStorageSystemPtr->unk_2681 >= 30)
                {
                    gPokemonStorageSystemPtr->unk_2681 = 0;
                    if (++gPokemonStorageSystemPtr->unk_2680 >= 14)
                    {
                        gPokemonStorageSystemPtr->unk_267d = 1;
                        gPokemonStorageSystemPtr->unk_267c = 0;
                        break;
                    }
                }
            }
            if (gPokemonStorageSystemPtr->unk_267e == 0 && gPokemonStorageSystemPtr->unk_267f == 0)
            {
                gPokemonStorageSystemPtr->unk_267d = 1;
                gPokemonStorageSystemPtr->unk_267c = 1;
            }
            break;
    }
    return -1;
}

void sub_809BB90(void)
{
    if (gUnknown_020384E6)
        gUnknown_02038480 = gPokemonStorageSystemPtr->unk_25b4;
}

void sub_809BBC0(void)
{
    if (gUnknown_020384E6)
    {
        if (gUnknown_020384E7 == 14)
            gPokemonStorageSystemPtr->unk_25b4 = gUnknown_02038480;
        else
            gPokemonStorageSystemPtr->unk_25b4.box = gUnknown_02038480.box;
    }
}

void sub_809BC18(void)
{
    if (gUnknown_020384E6)
    {
        sub_809BB90();
        gPokemonStorageSystemPtr->unk_2690.pokemon = &gUnknown_02038480;
        gPokemonStorageSystemPtr->unk_268d = 0;
        gPokemonStorageSystemPtr->unk_268c = 0;
        gPokemonStorageSystemPtr->unk_268e = 0;
    }
    else if (gUnknown_020384E4 == 1)
    {
        gPokemonStorageSystemPtr->unk_2690.pokemon = gPlayerParty;
        gPokemonStorageSystemPtr->unk_268d = gUnknown_020384E5;
        gPokemonStorageSystemPtr->unk_268c = StorageSystemGetPartySize() - 1;
        gPokemonStorageSystemPtr->unk_268e = 0;
    }
    else
    {
        gPokemonStorageSystemPtr->unk_2690.box = gPokemonStorage.boxes[gPokemonStorage.currentBox];
        gPokemonStorageSystemPtr->unk_268d = gUnknown_020384E5;
        gPokemonStorageSystemPtr->unk_268c = 30 - 1;
        gPokemonStorageSystemPtr->unk_268e = 5;
    }
}

void sub_809BD14(void)
{
    if (gUnknown_020384E6)
        sub_809BBC0();
    else
        gUnknown_020384E5 = pssData.monIndex;
}

s16 party_compaction(void)
{
    s16 retVal = -1;
    u16 i;
    u16 last;

    for (i = 0, last = 0; i < PARTY_SIZE; i++)
    {
        if ((u16)GetMonData(gPlayerParty + i, MON_DATA_SPECIES) != SPECIES_NONE)
        {
            if (i != last)
                gPlayerParty[last] = gPlayerParty[i];
            last++;
        }
        else if (retVal == -1)
            retVal = i;
    }
    for (; last < PARTY_SIZE; last++)
        ZeroMonData(gPlayerParty + last);
    return retVal;
}

void sub_809BDD8(u8 markings)
{
    gPokemonStorageSystemPtr->unk_11f7 = markings;
    if (gUnknown_020384E6)
        SetMonData(&gPokemonStorageSystemPtr->unk_25b4, MON_DATA_MARKINGS, &markings);
    else
    {
        if (gUnknown_020384E4 == 1)
            SetMonData(gPlayerParty + gUnknown_020384E5, MON_DATA_MARKINGS, &markings);
        if (gUnknown_020384E4 == 0)
            SetBoxMonData(gPokemonStorage.boxes[get_preferred_box()] + gUnknown_020384E5, MON_DATA_MARKINGS, &markings);
    }
}

bool8 sub_809BE80(void)
{
    if (gUnknown_020384E4 == 1 && !gUnknown_020384E6 && CountAlivePartyMonsExceptOne(gUnknown_020384E5) == 0)
        return TRUE;
    return FALSE;
}

bool8 sub_809BEBC(void)
{
    if (gUnknown_020384E6)
    {
        if (gUnknown_020384E4 == 1 && CountAlivePartyMonsExceptOne(gUnknown_020384E5) == 0)
        {
            if (gPokemonStorageSystemPtr->unk_11f9 || GetMonData(&gPokemonStorageSystemPtr->unk_25b4, MON_DATA_HP) == 0)
                return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

bool8 sub_809BF20(void)
{
    return gUnknown_020384E6;
}

bool8 sub_809BF2C(void)
{
    return gUnknown_020384E4 == 2 ? TRUE : FALSE;
}

bool8 sub_809BF48(void)
{
    return (gUnknown_020384E4 == 3 && gUnknown_020384E5 == 1) ? TRUE : FALSE;
}

void sub_809BF74(void)
{
    gPokemonStorageSystemPtr->unk_11f6 = gUnknown_020384E6 ? 0 : 1;
    if (!gUnknown_020384E6)
    {
        switch (gUnknown_020384E4)
        {
            case 1:
                if (gUnknown_020384E5 < PARTY_SIZE)
                {
                    sub_809C04C(gPlayerParty + gUnknown_020384E5, 0);
                    break;
                }
                // fallthrough
            case 2:
            case 3:
                sub_809C04C(NULL, 2);
                break;
            case 0:
                sub_809C04C(gPokemonStorage.boxes[get_preferred_box()] + gUnknown_020384E5, 1);
                break;
        }
    }
}

void sub_809C028(void)
{
    if (gUnknown_020384E6)
        sub_809C04C(&gUnknown_02038480.box, 0);
    else
        sub_809BF74();
}

void sub_809C04C(void *pokemon, u8 a1)
{
    u8 *buf;
    u16 gender = MON_MALE;
    gPokemonStorageSystemPtr->unk_11f2 = 0;
    if (a1 == 0)
    {
        struct Pokemon *pkmn = (struct Pokemon *)pokemon;
        gPokemonStorageSystemPtr->unk_11f0 = GetMonData(pokemon, MON_DATA_SPECIES2);
        if (gPokemonStorageSystemPtr->unk_11f0 != SPECIES_NONE)
        {
            gPokemonStorageSystemPtr->unk_11f9 = GetMonData(pkmn, MON_DATA_IS_EGG);
            GetMonData(pkmn, MON_DATA_NICKNAME, gPokemonStorageSystemPtr->unk_11fa);
            StringGetEnd10(gPokemonStorageSystemPtr->unk_11fa);
            gPokemonStorageSystemPtr->unk_11f8 = GetMonData(pkmn, MON_DATA_LEVEL);
            gPokemonStorageSystemPtr->unk_11f7 = GetMonData(pkmn, MON_DATA_MARKINGS);
            gPokemonStorageSystemPtr->unk_11ec = GetMonData(pkmn, MON_DATA_PERSONALITY);
            gPokemonStorageSystemPtr->unk_11e8 = GetMonSpritePal(pkmn);
            gender = GetMonGender(pkmn);
            gPokemonStorageSystemPtr->unk_11f2 = GetMonData(pkmn, MON_DATA_HELD_ITEM);
        }
    }
    else if (a1 == 1)
    {
        struct BoxPokemon *boxmon = (struct BoxPokemon *)pokemon;
        gPokemonStorageSystemPtr->unk_11f0 = GetBoxMonData(pokemon, MON_DATA_SPECIES2);
        if (gPokemonStorageSystemPtr->unk_11f0 != SPECIES_NONE)
        {
            u32 otId = GetBoxMonData(boxmon, MON_DATA_OT_ID);
            gPokemonStorageSystemPtr->unk_11f9 = GetBoxMonData(boxmon, MON_DATA_IS_EGG);
            GetBoxMonData(boxmon, MON_DATA_NICKNAME, gPokemonStorageSystemPtr->unk_11fa);
            StringGetEnd10(gPokemonStorageSystemPtr->unk_11fa);
            gPokemonStorageSystemPtr->unk_11f8 = GetLevelFromBoxMonExp(boxmon);
            gPokemonStorageSystemPtr->unk_11f7 = GetBoxMonData(boxmon, MON_DATA_MARKINGS);
            gPokemonStorageSystemPtr->unk_11ec = GetBoxMonData(boxmon, MON_DATA_PERSONALITY);
            gPokemonStorageSystemPtr->unk_11e8 = GetMonSpritePalFromOtIdPersonality(gPokemonStorageSystemPtr->unk_11f0, otId, gPokemonStorageSystemPtr->unk_11ec);
            gender = GetGenderFromSpeciesAndPersonality(gPokemonStorageSystemPtr->unk_11f0, gPokemonStorageSystemPtr->unk_11ec);
            gPokemonStorageSystemPtr->unk_11f2 = GetBoxMonData(boxmon, MON_DATA_HELD_ITEM);
        }
    }
    else
    {
        gPokemonStorageSystemPtr->unk_11f0 = SPECIES_NONE;
    }
    if (gPokemonStorageSystemPtr->unk_11f0 == SPECIES_NONE)
    {
        gPokemonStorageSystemPtr->unk_11fa[0] = EOS;
        gPokemonStorageSystemPtr->unk_120f[0] = EOS;
        gPokemonStorageSystemPtr->unk_1234[0] = EOS;
        gPokemonStorageSystemPtr->unk_1259[0] = EOS;
        gPokemonStorageSystemPtr->unk_127a[0] = EOS;
    }
    else if (gPokemonStorageSystemPtr->unk_11f9)
    {
        buf = gPokemonStorageSystemPtr->unk_120f;
        buf[0] = EXT_CTRL_CODE_BEGIN;
        buf[1] = 0x04; // COLOR_HIGHLIGHT_SHADOW
        buf[2] = 0x0F; // WHITE2
        buf[3] = 0x00; // TRANSPARENT
        buf[4] = 0x01; // DARK_GREY
        buf = gPokemonStorageSystemPtr->unk_120f + 5;
        buf = StringCopy(buf, gPokemonStorageSystemPtr->unk_11fa);
        gPokemonStorageSystemPtr->unk_1234[0] = EOS;
        gPokemonStorageSystemPtr->unk_1259[0] = EOS;
        gPokemonStorageSystemPtr->unk_127a[0] = EOS;
    }
    else
    {
        if (gPokemonStorageSystemPtr->unk_11f0 == SPECIES_NIDORAN_M || gPokemonStorageSystemPtr->unk_11f0 == SPECIES_NIDORAN_F)
            gender = MON_GENDERLESS;
        buf = gPokemonStorageSystemPtr->unk_120f;
        buf[0] = EXT_CTRL_CODE_BEGIN;
        buf[1] = 0x04; // COLOR_HIGHLIGHT_SHADOW
        buf[2] = 0x0F; // WHITE2
        buf[3] = 0x00; // TRANSPARENT
        buf[4] = 0x01; // DARK_GREY
        buf = gPokemonStorageSystemPtr->unk_120f + 5;
        buf = StringCopy(buf, gPokemonStorageSystemPtr->unk_11fa);
        buf = gPokemonStorageSystemPtr->unk_1234;
        buf[0] = EXT_CTRL_CODE_BEGIN;
        buf[1] = 0x04; // COLOR_HIGHLIGHT_SHADOW
        buf[2] = 0x0F; // WHITE2
        buf[3] = 0x00; // TRANSPARENT
        buf[4] = 0x01; // DARK_GREY
        buf[5] = EXT_CTRL_CODE_BEGIN;
        buf[6] = 0x13; // CLEAR_TO
        buf[7] = 7;
        buf[8] = CHAR_SLASH;
        buf = gPokemonStorageSystemPtr->unk_1234 + 9;
        buf = StringCopy(buf, gSpeciesNames[gPokemonStorageSystemPtr->unk_11f0]);
        buf[0] = EXT_CTRL_CODE_BEGIN;
        buf[1] = 0x13; // CLEAR_TO
        buf[2] = 0x50;
        buf[3] = EOS;
        buf = gPokemonStorageSystemPtr->unk_1259;
        buf[0] = EXT_CTRL_CODE_BEGIN;
        buf[1] = 0x04; // COLOR_HIGHLIGHT_SHADOW
        buf[2] = 0x0F; // WHITE2
        buf[3] = 0x00; // TRANSPARENT
        buf[4] = 0x01; // DARK_GREY
        buf[5] = EXT_CTRL_CODE_BEGIN;
        buf[6] = 0x13; // CLEAR_TO
        buf[7] = 8;
        buf = gPokemonStorageSystemPtr->unk_1259 + 8;
        buf[0] = 0x34; // LV
        buf = gPokemonStorageSystemPtr->unk_1259 + 9;
        buf = AlignInt1InMenuWindow(buf, gPokemonStorageSystemPtr->unk_11f8, 0x22, STR_CONV_MODE_RIGHT_ALIGN);
        buf[0] = EXT_CTRL_CODE_BEGIN;
        buf[1] = 0x11; // CLEAR
        buf[2] = 8;
        buf += 3;
        switch (gender)
        {
            case MON_MALE:
                buf[0] = EXT_CTRL_CODE_BEGIN;
                buf[1] = 0x04; // COLOR_HIGHLIGHT_SHADOW
                buf[2] = 0x04; // BLUE
                buf[3] = 0x00; // TRANSPARENT
                buf[4] = 0x05; // YELLOW
                buf[5] = CHAR_MALE;
                buf += 6;
                break;
            case MON_FEMALE:
                buf[0] = EXT_CTRL_CODE_BEGIN;
                buf[1] = 0x04; // COLOR_HIGHLIGHT_SHADOW
                buf[2] = 0x06; // CYAN
                buf[3] = 0x00; // TRANSPARENT
                buf[4] = 0x07; // MAGENTA
                buf[5] = CHAR_FEMALE;
                buf += 6;
                break;
        }
        buf[0] = EOS;
        buf = gPokemonStorageSystemPtr->unk_127a;
        if (gPokemonStorageSystemPtr->unk_11f2)
        {
            buf[0] = EXT_CTRL_CODE_BEGIN;
            buf[1] = 0x04; // COLOR_HIGHLIGHT_SHADOW
            buf[2] = 0x0F; // WHITE2
            buf[3] = 0x00; // TRANSPARENT
            buf[4] = 0x01; // DARK_GREY
            buf = gPokemonStorageSystemPtr->unk_127a + 5;
            buf[0] = EXT_CTRL_CODE_BEGIN;
            buf[1] = 0x06; // size
            buf[2] = 0x04;
            buf = gPokemonStorageSystemPtr->unk_127a + 8;
            buf = StringCopy(buf, ItemId_GetName(gPokemonStorageSystemPtr->unk_11f2));
            buf[0] = EXT_CTRL_CODE_BEGIN;
            buf[1] = 0x07; // UNKNOWN_7;
            buf += 2;
        }
        buf[0] = EOS;
    }
}

#ifdef NONMATCHING
u8 sub_809C464(void)
{
    u8 r9;
    s8 r8 = gUnknown_020384E4;
    s8 r4 = gUnknown_020384E5;
    gPokemonStorageSystemPtr->unk_11de = 0;
    gPokemonStorageSystemPtr->unk_11df = 0;
    gPokemonStorageSystemPtr->unk_11e3 = 0;
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        r9 = 1;
        if (gUnknown_020384E5 >= 6)
        {
            r4 -= 6;
        }
        else
        {
            r8 = 2;
            r4 = 0;
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        r9 = 1;
        r4 += 6;
        if (r4 >= 30)
        {
            r8 = 3;
            r4 -= 30;
            r4 /= 3;
            gPokemonStorageSystemPtr->unk_11de = 1;
            gPokemonStorageSystemPtr->unk_11e3 = 1;
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        r9 = 1;
        if (gUnknown_020384E5 % 6)
            r4--;
        else
        {
            gPokemonStorageSystemPtr->unk_11df = -1;
            r4 += 5;
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        r9 = 1;
        if ((gUnknown_020384E5 + 1) % 6)
            r4++;
        else
        {
            gPokemonStorageSystemPtr->unk_11df = 1;
            r4 -= 5;
        }
    }
    else if (gMain.newKeys & START_BUTTON)
    {
        r9 = 1;
        r8 = 2;
        r4 = 0;
    }
    else
    {
        if ((gMain.newKeys & A_BUTTON) && sub_809CAB0())
        {
            if (gUnknown_020384E9 == 0)
                return 8;
            switch (sub_809CE4C(0))
            {
                case 1:
                    return 11;
                case 2:
                    return 12;
                case 3:
                    return 13;
                case 4:
                    return 14;
                case 5:
                    return 15;
            }
        }
        if (gMain.newKeys & B_BUTTON)
            return 16;
        if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        {
            if (gMain.heldKeys & L_BUTTON)
                return 10;
            if (gMain.heldKeys & R_BUTTON)
                return 9;
        }
        if (gMain.newKeys & SELECT_BUTTON)
        {
            sub_809CD88();
            return 0;
        }
        r9 = 0;
    }
    if (r9)
        sub_809AF18(r8, r4);
    return r9;
}
#else
NAKED u8 sub_809C464(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r9\n"
                    "\tmov r6, r8\n"
                    "\tpush {r6,r7}\n"
                    "\tldr r0, _0809C4D8 @ =gUnknown_020384E4\n"
                    "\tldrb r0, [r0]\n"
                    "\tmov r8, r0\n"
                    "\tldr r2, _0809C4DC @ =gUnknown_020384E5\n"
                    "\tldrb r4, [r2]\n"
                    "\tldr r0, _0809C4E0 @ =gPokemonStorageSystemPtr\n"
                    "\tldr r1, [r0]\n"
                    "\tldr r0, _0809C4E4 @ =0x000011de\n"
                    "\tadds r7, r1, r0\n"
                    "\tmovs r0, 0\n"
                    "\tstrb r0, [r7]\n"
                    "\tldr r3, _0809C4E8 @ =0x000011df\n"
                    "\tadds r5, r1, r3\n"
                    "\tstrb r0, [r5]\n"
                    "\tadds r3, 0x4\n"
                    "\tadds r6, r1, r3\n"
                    "\tstrb r0, [r6]\n"
                    "\tldr r0, _0809C4EC @ =gMain\n"
                    "\tmov r12, r0\n"
                    "\tldrh r1, [r0, 0x30]\n"
                    "\tmovs r0, 0x40\n"
                    "\tands r0, r1\n"
                    "\tadds r3, r2, 0\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C4A0\n"
                    "\tb _0809C62A\n"
                    "_0809C4A0:\n"
                    "\tmovs r0, 0x80\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C4F0\n"
                    "\tmovs r1, 0x1\n"
                    "\tmov r9, r1\n"
                    "\tlsls r0, r4, 24\n"
                    "\tmovs r3, 0xC0\n"
                    "\tlsls r3, 19\n"
                    "\tadds r0, r3\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tasrs r0, 24\n"
                    "\tcmp r0, 0x1D\n"
                    "\tbgt _0809C4BE\n"
                    "\tb _0809C648\n"
                    "_0809C4BE:\n"
                    "\tmovs r1, 0x3\n"
                    "\tmov r8, r1\n"
                    "\tsubs r0, 0x1E\n"
                    "\tlsls r0, 24\n"
                    "\tasrs r0, 24\n"
                    "\tbl __divsi3\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tmov r3, r9\n"
                    "\tstrb r3, [r7]\n"
                    "\tstrb r3, [r6]\n"
                    "\tb _0809C648\n"
                    "\t.align 2, 0\n"
                    "_0809C4D8: .4byte gUnknown_020384E4\n"
                    "_0809C4DC: .4byte gUnknown_020384E5\n"
                    "_0809C4E0: .4byte gPokemonStorageSystemPtr\n"
                    "_0809C4E4: .4byte 0x000011de\n"
                    "_0809C4E8: .4byte 0x000011df\n"
                    "_0809C4EC: .4byte gMain\n"
                    "_0809C4F0:\n"
                    "\tmovs r0, 0x20\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C524\n"
                    "\tmovs r0, 0x1\n"
                    "\tmov r9, r0\n"
                    "\tmovs r0, 0\n"
                    "\tldrsb r0, [r3, r0]\n"
                    "\tmovs r1, 0x6\n"
                    "\tbl __modsi3\n"
                    "\tlsls r0, 24\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C514\n"
                    "\tlsls r0, r4, 24\n"
                    "\tmovs r1, 0xFF\n"
                    "\tlsls r1, 24\n"
                    "\tb _0809C63C\n"
                    "_0809C514:\n"
                    "\tmovs r0, 0xFF\n"
                    "\tstrb r0, [r5]\n"
                    "\tlsls r0, r4, 24\n"
                    "\tmovs r3, 0xA0\n"
                    "\tlsls r3, 19\n"
                    "\tadds r0, r3\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tb _0809C648\n"
                    "_0809C524:\n"
                    "\tmovs r0, 0x10\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C554\n"
                    "\tmovs r0, 0x1\n"
                    "\tmov r9, r0\n"
                    "\tmovs r0, 0\n"
                    "\tldrsb r0, [r3, r0]\n"
                    "\tadds r0, 0x1\n"
                    "\tmovs r1, 0x6\n"
                    "\tbl __modsi3\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C548\n"
                    "\tlsls r0, r4, 24\n"
                    "\tmovs r1, 0x80\n"
                    "\tlsls r1, 17\n"
                    "\tb _0809C63C\n"
                    "_0809C548:\n"
                    "\tmov r3, r9\n"
                    "\tstrb r3, [r5]\n"
                    "\tlsls r0, r4, 24\n"
                    "\tmovs r1, 0xFB\n"
                    "\tlsls r1, 24\n"
                    "\tb _0809C63C\n"
                    "_0809C554:\n"
                    "\tmov r3, r12\n"
                    "\tldrh r1, [r3, 0x2E]\n"
                    "\tmovs r0, 0x8\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C56A\n"
                    "\tmovs r0, 0x1\n"
                    "\tmov r9, r0\n"
                    "\tmovs r1, 0x2\n"
                    "\tmov r8, r1\n"
                    "\tb _0809C646\n"
                    "_0809C56A:\n"
                    "\tmovs r0, 0x1\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C5D4\n"
                    "\tbl sub_809CAB0\n"
                    "\tlsls r0, 24\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C5D4\n"
                    "\tldr r0, _0809C588 @ =gUnknown_020384E9\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _0809C58C\n"
                    "\tmovs r0, 0x8\n"
                    "\tb _0809C658\n"
                    "\t.align 2, 0\n"
                    "_0809C588: .4byte gUnknown_020384E9\n"
                    "_0809C58C:\n"
                    "\tmovs r0, 0\n"
                    "\tbl sub_809CE4C\n"
                    "\tsubs r0, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tasrs r0, 24\n"
                    "\tcmp r0, 0x4\n"
                    "\tbhi _0809C5D4\n"
                    "\tlsls r0, 2\n"
                    "\tldr r1, _0809C5A8 @ =_0809C5AC\n"
                    "\tadds r0, r1\n"
                    "\tldr r0, [r0]\n"
                    "\tmov pc, r0\n"
                    "\t.align 2, 0\n"
                    "_0809C5A8: .4byte _0809C5AC\n"
                    "\t.align 2, 0\n"
                    "_0809C5AC:\n"
                    "\t.4byte _0809C5C0\n"
                    "\t.4byte _0809C5C4\n"
                    "\t.4byte _0809C5C8\n"
                    "\t.4byte _0809C5CC\n"
                    "\t.4byte _0809C5D0\n"
                    "_0809C5C0:\n"
                    "\tmovs r0, 0xB\n"
                    "\tb _0809C658\n"
                    "_0809C5C4:\n"
                    "\tmovs r0, 0xC\n"
                    "\tb _0809C658\n"
                    "_0809C5C8:\n"
                    "\tmovs r0, 0xD\n"
                    "\tb _0809C658\n"
                    "_0809C5CC:\n"
                    "\tmovs r0, 0xE\n"
                    "\tb _0809C658\n"
                    "_0809C5D0:\n"
                    "\tmovs r0, 0xF\n"
                    "\tb _0809C658\n"
                    "_0809C5D4:\n"
                    "\tldr r2, _0809C5E4 @ =gMain\n"
                    "\tldrh r1, [r2, 0x2E]\n"
                    "\tmovs r0, 0x2\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C5E8\n"
                    "\tmovs r0, 0x10\n"
                    "\tb _0809C658\n"
                    "\t.align 2, 0\n"
                    "_0809C5E4: .4byte gMain\n"
                    "_0809C5E8:\n"
                    "\tldr r0, _0809C600 @ =gSaveBlock2\n"
                    "\tldrb r0, [r0, 0x13]\n"
                    "\tcmp r0, 0x1\n"
                    "\tbne _0809C612\n"
                    "\tldrh r1, [r2, 0x2C]\n"
                    "\tmovs r0, 0x80\n"
                    "\tlsls r0, 2\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C604\n"
                    "\tmovs r0, 0xA\n"
                    "\tb _0809C658\n"
                    "\t.align 2, 0\n"
                    "_0809C600: .4byte gSaveBlock2\n"
                    "_0809C604:\n"
                    "\tmovs r0, 0x80\n"
                    "\tlsls r0, 1\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C612\n"
                    "\tmovs r0, 0x9\n"
                    "\tb _0809C658\n"
                    "_0809C612:\n"
                    "\tldrh r1, [r2, 0x2E]\n"
                    "\tmovs r0, 0x4\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C624\n"
                    "\tbl sub_809CD88\n"
                    "\tmovs r0, 0\n"
                    "\tb _0809C658\n"
                    "_0809C624:\n"
                    "\tmovs r3, 0\n"
                    "\tmov r9, r3\n"
                    "\tb _0809C656\n"
                    "_0809C62A:\n"
                    "\tmovs r0, 0x1\n"
                    "\tmov r9, r0\n"
                    "\tmovs r0, 0\n"
                    "\tldrsb r0, [r2, r0]\n"
                    "\tcmp r0, 0x5\n"
                    "\tble _0809C642\n"
                    "\tlsls r0, r4, 24\n"
                    "\tmovs r1, 0xFA\n"
                    "\tlsls r1, 24\n"
                    "_0809C63C:\n"
                    "\tadds r0, r1\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tb _0809C648\n"
                    "_0809C642:\n"
                    "\tmovs r3, 0x2\n"
                    "\tmov r8, r3\n"
                    "_0809C646:\n"
                    "\tmovs r4, 0\n"
                    "_0809C648:\n"
                    "\tmov r0, r9\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C656\n"
                    "\tmov r0, r8\n"
                    "\tadds r1, r4, 0\n"
                    "\tbl sub_809AF18\n"
                    "_0809C656:\n"
                    "\tmov r0, r9\n"
                    "_0809C658:\n"
                    "\tpop {r3,r4}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r1}\n"
                    "\tbx r1");
}
#endif

#ifdef NONMATCHING
u8 sub_809C664(void)
{
    s8 r10 = gUnknown_020384E4;
    s8 r4 = gUnknown_020384E5;
    u8 r8;
    u8 r9;

    gPokemonStorageSystemPtr->unk_11df = 0;
    gPokemonStorageSystemPtr->unk_11de = 0;
    gPokemonStorageSystemPtr->unk_11e3 = 0;
    r9 = FALSE;
    r8 = 0;
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (--r4 < 0)
            r4 = 6;
        if (r4 != gUnknown_020384E5)
            r8 = 1;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (++r4 > 6)
            r4 = 0;
        if (r4 != gUnknown_020384E5)
            r8 = 1;
    }
    else if ((gMain.newAndRepeatedKeys & DPAD_LEFT) && gUnknown_020384E5)
    {
        r8 = 1;
        gPokemonStorageSystemPtr->unk_11e2 = gUnknown_020384E5;
        r4 = 0;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        if (gUnknown_020384E5 == 0)
        {
            r8 = 1;
            r4 = gPokemonStorageSystemPtr->unk_11e2;
        }
        else
        {
            r8 = 6;
            r10 = 0;
            r4 = 0;
        }
    }
    else
    {
        if (gMain.newKeys & A_BUTTON)
        {
            if (gUnknown_020384E5 == 6)
            {
                if (gPokemonStorageSystemPtr->unk_0005 == 1)
                    return 4;
                r9 = TRUE;
            }
            else if (sub_809CAB0())
            {
                if (gUnknown_020384E9 == 0)
                    return 8;
                switch (sub_809CE4C(0))
                {
                    case 1:
                        return 11;
                    case 2:
                        return 12;
                    case 3:
                        return 13;
                    case 4:
                        return 14;
                    case 5:
                        return 15;
                }
            }
        }
        if (gMain.newKeys & B_BUTTON)
        {
            if (gPokemonStorageSystemPtr->unk_0005 == 1)
                return 16;
            r9 = TRUE;
        }
        if (!r9)
        {
            r8 = 6;
            r10 = 0;
            r4 = 0;
        }
        else if (gMain.newKeys & SELECT_BUTTON)
        {
            sub_809CD88();
            return 0;
        }
    }
    if (r8)
        sub_809AF18(r10, r4);
    return r8;
}
#else
NAKED u8 sub_809C664(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tldr r0, _0809C6D8 @ =gUnknown_020384E4\n"
                    "\tldrb r0, [r0]\n"
                    "\tmov r10, r0\n"
                    "\tldr r7, _0809C6DC @ =gUnknown_020384E5\n"
                    "\tldrb r4, [r7]\n"
                    "\tldr r2, _0809C6E0 @ =gPokemonStorageSystemPtr\n"
                    "\tldr r5, [r2]\n"
                    "\tldr r1, _0809C6E4 @ =0x000011df\n"
                    "\tadds r0, r5, r1\n"
                    "\tmovs r1, 0\n"
                    "\tstrb r1, [r0]\n"
                    "\tldr r3, _0809C6E8 @ =0x000011de\n"
                    "\tadds r0, r5, r3\n"
                    "\tstrb r1, [r0]\n"
                    "\tadds r3, 0x5\n"
                    "\tadds r0, r5, r3\n"
                    "\tstrb r1, [r0]\n"
                    "\tmov r9, r1\n"
                    "\tmov r8, r1\n"
                    "\tldr r1, _0809C6EC @ =gMain\n"
                    "\tldrh r3, [r1, 0x30]\n"
                    "\tmovs r0, 0x40\n"
                    "\tands r0, r3\n"
                    "\tadds r6, r7, 0\n"
                    "\tmov r12, r2\n"
                    "\tadds r2, r1, 0\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C6A8\n"
                    "\tb _0809C81C\n"
                    "_0809C6A8:\n"
                    "\tmovs r0, 0x80\n"
                    "\tands r0, r3\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C6F0\n"
                    "\tlsls r0, r4, 24\n"
                    "\tmovs r1, 0x80\n"
                    "\tlsls r1, 17\n"
                    "\tadds r0, r1\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tasrs r0, 24\n"
                    "\tcmp r0, 0x6\n"
                    "\tble _0809C6C2\n"
                    "\tmovs r4, 0\n"
                    "_0809C6C2:\n"
                    "\tlsls r0, r4, 24\n"
                    "\tasrs r0, 24\n"
                    "\tmovs r1, 0\n"
                    "\tldrsb r1, [r6, r1]\n"
                    "\tcmp r0, r1\n"
                    "\tbne _0809C6D0\n"
                    "\tb _0809C83C\n"
                    "_0809C6D0:\n"
                    "\tmovs r2, 0x1\n"
                    "\tmov r8, r2\n"
                    "\tb _0809C842\n"
                    "\t.align 2, 0\n"
                    "_0809C6D8: .4byte gUnknown_020384E4\n"
                    "_0809C6DC: .4byte gUnknown_020384E5\n"
                    "_0809C6E0: .4byte gPokemonStorageSystemPtr\n"
                    "_0809C6E4: .4byte 0x000011df\n"
                    "_0809C6E8: .4byte 0x000011de\n"
                    "_0809C6EC: .4byte gMain\n"
                    "_0809C6F0:\n"
                    "\tmovs r0, 0x20\n"
                    "\tands r0, r3\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C714\n"
                    "\tldrb r1, [r6]\n"
                    "\tmovs r0, 0\n"
                    "\tldrsb r0, [r6, r0]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C714\n"
                    "\tmovs r3, 0x1\n"
                    "\tmov r8, r3\n"
                    "\tldr r2, _0809C710 @ =0x000011e2\n"
                    "\tadds r0, r5, r2\n"
                    "\tstrb r1, [r0]\n"
                    "\tmovs r4, 0\n"
                    "\tb _0809C83C\n"
                    "\t.align 2, 0\n"
                    "_0809C710: .4byte 0x000011e2\n"
                    "_0809C714:\n"
                    "\tldrh r1, [r2, 0x30]\n"
                    "\tmovs r0, 0x10\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C748\n"
                    "\tmovs r0, 0\n"
                    "\tldrsb r0, [r6, r0]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _0809C73C\n"
                    "\tmovs r3, 0x1\n"
                    "\tmov r8, r3\n"
                    "\tmov r1, r12\n"
                    "\tldr r0, [r1]\n"
                    "\tldr r2, _0809C738 @ =0x000011e2\n"
                    "\tadds r0, r2\n"
                    "\tldrb r4, [r0]\n"
                    "\tb _0809C83C\n"
                    "\t.align 2, 0\n"
                    "_0809C738: .4byte 0x000011e2\n"
                    "_0809C73C:\n"
                    "\tmovs r3, 0x6\n"
                    "\tmov r8, r3\n"
                    "\tmovs r0, 0\n"
                    "\tmov r10, r0\n"
                    "\tmovs r4, 0\n"
                    "\tb _0809C83C\n"
                    "_0809C748:\n"
                    "\tldrh r1, [r2, 0x2E]\n"
                    "\tmovs r0, 0x1\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C7D0\n"
                    "\tmovs r0, 0\n"
                    "\tldrsb r0, [r6, r0]\n"
                    "\tcmp r0, 0x6\n"
                    "\tbne _0809C76E\n"
                    "\tmov r1, r12\n"
                    "\tldr r0, [r1]\n"
                    "\tldrb r0, [r0, 0x5]\n"
                    "\tcmp r0, 0x1\n"
                    "\tbne _0809C768\n"
                    "\tmovs r0, 0x4\n"
                    "\tb _0809C84C\n"
                    "_0809C768:\n"
                    "\tmovs r2, 0x1\n"
                    "\tmov r9, r2\n"
                    "\tb _0809C7D0\n"
                    "_0809C76E:\n"
                    "\tbl sub_809CAB0\n"
                    "\tlsls r0, 24\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C7D0\n"
                    "\tldr r0, _0809C784 @ =gUnknown_020384E9\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _0809C788\n"
                    "\tmovs r0, 0x8\n"
                    "\tb _0809C84C\n"
                    "\t.align 2, 0\n"
                    "_0809C784: .4byte gUnknown_020384E9\n"
                    "_0809C788:\n"
                    "\tmovs r0, 0\n"
                    "\tbl sub_809CE4C\n"
                    "\tsubs r0, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tasrs r0, 24\n"
                    "\tcmp r0, 0x4\n"
                    "\tbhi _0809C7D0\n"
                    "\tlsls r0, 2\n"
                    "\tldr r1, _0809C7A4 @ =_0809C7A8\n"
                    "\tadds r0, r1\n"
                    "\tldr r0, [r0]\n"
                    "\tmov pc, r0\n"
                    "\t.align 2, 0\n"
                    "_0809C7A4: .4byte _0809C7A8\n"
                    "\t.align 2, 0\n"
                    "_0809C7A8:\n"
                    "\t.4byte _0809C7BC\n"
                    "\t.4byte _0809C7C0\n"
                    "\t.4byte _0809C7C4\n"
                    "\t.4byte _0809C7C8\n"
                    "\t.4byte _0809C7CC\n"
                    "_0809C7BC:\n"
                    "\tmovs r0, 0xB\n"
                    "\tb _0809C84C\n"
                    "_0809C7C0:\n"
                    "\tmovs r0, 0xC\n"
                    "\tb _0809C84C\n"
                    "_0809C7C4:\n"
                    "\tmovs r0, 0xD\n"
                    "\tb _0809C84C\n"
                    "_0809C7C8:\n"
                    "\tmovs r0, 0xE\n"
                    "\tb _0809C84C\n"
                    "_0809C7CC:\n"
                    "\tmovs r0, 0xF\n"
                    "\tb _0809C84C\n"
                    "_0809C7D0:\n"
                    "\tldr r2, _0809C7EC @ =gMain\n"
                    "\tldrh r1, [r2, 0x2E]\n"
                    "\tmovs r0, 0x2\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C7F8\n"
                    "\tldr r0, _0809C7F0 @ =gPokemonStorageSystemPtr\n"
                    "\tldr r0, [r0]\n"
                    "\tldrb r0, [r0, 0x5]\n"
                    "\tcmp r0, 0x1\n"
                    "\tbne _0809C7F4\n"
                    "\tmovs r0, 0x10\n"
                    "\tb _0809C84C\n"
                    "\t.align 2, 0\n"
                    "_0809C7EC: .4byte gMain\n"
                    "_0809C7F0: .4byte gPokemonStorageSystemPtr\n"
                    "_0809C7F4:\n"
                    "\tmovs r3, 0x1\n"
                    "\tmov r9, r3\n"
                    "_0809C7F8:\n"
                    "\tmov r0, r9\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C80A\n"
                    "\tmovs r1, 0x6\n"
                    "\tmov r8, r1\n"
                    "\tmovs r2, 0\n"
                    "\tmov r10, r2\n"
                    "\tmovs r4, 0\n"
                    "\tb _0809C83C\n"
                    "_0809C80A:\n"
                    "\tldrh r1, [r2, 0x2E]\n"
                    "\tmovs r0, 0x4\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0809C83C\n"
                    "\tbl sub_809CD88\n"
                    "\tmovs r0, 0\n"
                    "\tb _0809C84C\n"
                    "_0809C81C:\n"
                    "\tlsls r0, r4, 24\n"
                    "\tmovs r3, 0xFF\n"
                    "\tlsls r3, 24\n"
                    "\tadds r0, r3\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tcmp r0, 0\n"
                    "\tbge _0809C82C\n"
                    "\tmovs r4, 0x6\n"
                    "_0809C82C:\n"
                    "\tlsls r0, r4, 24\n"
                    "\tasrs r0, 24\n"
                    "\tmovs r1, 0\n"
                    "\tldrsb r1, [r7, r1]\n"
                    "\tcmp r0, r1\n"
                    "\tbeq _0809C83C\n"
                    "\tmovs r0, 0x1\n"
                    "\tmov r8, r0\n"
                    "_0809C83C:\n"
                    "\tmov r1, r8\n"
                    "\tcmp r1, 0\n"
                    "\tbeq _0809C84A\n"
                    "_0809C842:\n"
                    "\tmov r0, r10\n"
                    "\tadds r1, r4, 0\n"
                    "\tbl sub_809AF18\n"
                    "_0809C84A:\n"
                    "\tmov r0, r8\n"
                    "_0809C84C:\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r1}\n"
                    "\tbx r1");
}
#endif

u8 sub_809C85C(void)
{
    u8 retVal;
    s8 var0;
    register s8 var1 asm("r5"); // FAKEMATCHING: r5 and r6 become swapped without this register hack

    gPokemonStorageSystemPtr->unk_11df = 0;
    gPokemonStorageSystemPtr->unk_11de = 0;
    gPokemonStorageSystemPtr->unk_11e3 = 0;

    if (!(gMain.newAndRepeatedKeys & DPAD_UP))
    {
        if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            retVal = 1;
            var0 = 0;
            var1 = 2;
        }
        else
        {
            if (gMain.heldKeys & DPAD_LEFT)
                return 10;
            if (gMain.heldKeys & DPAD_RIGHT)
                return 9;
            if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
            {
                if (gMain.heldKeys & L_BUTTON)
                    return 10;
                if (gMain.heldKeys & R_BUTTON)
                    return 9;
            }

            if (gMain.newKeys & A_BUTTON)
            {
                sub_809A860(0);
                sub_809CA8C();
                return 7;
            }

            if (gMain.newKeys & B_BUTTON)
                return 16;

            if (gMain.newKeys & SELECT_BUTTON)
            {
                sub_809CD88();
                return 0;
            }

            retVal = 0;
        }
    }
    else
    {
        retVal = 1;
        var0 = 3;
        var1 = 0;
        gPokemonStorageSystemPtr->unk_11e3 = 1;
    }

    if (retVal)
    {
        if (var0 != 2)
            sub_809A860(0);
        sub_809AF18(var0, var1);
        return retVal;
    }

    return retVal;
}

#ifdef NONMATCHING
u8 sub_809C944(void)
{
    u8 r6;
    s8 var0 = gUnknown_020384E4;
    s8 var1 = gUnknown_020384E5;

    gPokemonStorageSystemPtr->unk_11df = 0;
    gPokemonStorageSystemPtr->unk_11de = 0;
    gPokemonStorageSystemPtr->unk_11e3 = 0;

    if (!(gMain.newAndRepeatedKeys & DPAD_UP))
    {
        if (gMain.newAndRepeatedKeys & (DPAD_DOWN | START_BUTTON))
        {
            r6 = 1;
            var0 = 2;
            var1 = 0;
            gPokemonStorageSystemPtr->unk_11e3 = 1;
        }
        else if (gMain.newAndRepeatedKeys & DPAD_LEFT)
        {
            r6 = 1;
            var1 -= 1;
            if (var1 < 0)
            {
                gPokemonStorageSystemPtr->unk_11df = -1;
                var1 = 1;
            }
        }
        else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
        {
            r6 = 1;
            var1 += 1;
            if (var1 > 1)
            {
                gPokemonStorageSystemPtr->unk_11df = 1;
                var1 = 0;
            }
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            return var1 == 0 ? 5 : 4;
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            return 16;
        }
        else if (gMain.newKeys & SELECT_BUTTON)
        {
            sub_809CD88();
            return 0;
        }
        else
        {
            r6 = 0;
        }
    }
    else
    {
        r6 = 1;
        var0 = 0;
        gPokemonStorageSystemPtr->unk_11de = -1;
        var1 = !gUnknown_020384E5 ? 24 : 29;
        gPokemonStorageSystemPtr->unk_11e3 = 1;
    }

    if (r6)
    {
        sub_809AF18(var0, var1);
    }

    return r6;
}
#else
NAKED
u8 sub_809C944(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    ldr r0, _0809C988 @ =gUnknown_020384E4\n\
    ldrb r0, [r0]\n\
    mov r12, r0\n\
    ldr r7, _0809C98C @ =gUnknown_020384E5\n\
    ldrb r3, [r7]\n\
    ldr r0, _0809C990 @ =gPokemonStorageSystemPtr\n\
    ldr r1, [r0]\n\
    ldr r0, _0809C994 @ =0x000011df\n\
    adds r5, r1, r0\n\
    movs r0, 0\n\
    strb r0, [r5]\n\
    ldr r2, _0809C998 @ =0x000011de\n\
    adds r4, r1, r2\n\
    strb r0, [r4]\n\
    adds r2, 0x5\n\
    adds r1, r2\n\
    strb r0, [r1]\n\
    ldr r6, _0809C99C @ =gMain\n\
    ldrh r2, [r6, 0x30]\n\
    movs r0, 0x40\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    bne _0809CA14\n\
    movs r0, 0x88\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    beq _0809C9A0\n\
    movs r6, 0x1\n\
    movs r0, 0x2\n\
    mov r12, r0\n\
    movs r3, 0\n\
    b _0809CA2A\n\
    .align 2, 0\n\
_0809C988: .4byte gUnknown_020384E4\n\
_0809C98C: .4byte gUnknown_020384E5\n\
_0809C990: .4byte gPokemonStorageSystemPtr\n\
_0809C994: .4byte 0x000011df\n\
_0809C998: .4byte 0x000011de\n\
_0809C99C: .4byte gMain\n\
_0809C9A0:\n\
    movs r0, 0x20\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    beq _0809C9C0\n\
    movs r6, 0x1\n\
    lsls r0, r3, 24\n\
    movs r1, 0xFF\n\
    lsls r1, 24\n\
    adds r0, r1\n\
    lsrs r3, r0, 24\n\
    cmp r0, 0\n\
    bge _0809CA2C\n\
    movs r0, 0xFF\n\
    strb r0, [r5]\n\
    movs r3, 0x1\n\
    b _0809CA2C\n\
_0809C9C0:\n\
    movs r0, 0x10\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    beq _0809C9E0\n\
    movs r6, 0x1\n\
    lsls r0, r3, 24\n\
    movs r2, 0x80\n\
    lsls r2, 17\n\
    adds r0, r2\n\
    lsrs r3, r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0x1\n\
    ble _0809CA2C\n\
    strb r6, [r5]\n\
    movs r3, 0\n\
    b _0809CA2C\n\
_0809C9E0:\n\
    ldrh r1, [r6, 0x2E]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809C9F4\n\
    movs r0, 0x4\n\
    cmp r3, 0\n\
    bne _0809CA3A\n\
    movs r0, 0x5\n\
    b _0809CA3A\n\
_0809C9F4:\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809CA00\n\
    movs r0, 0x10\n\
    b _0809CA3A\n\
_0809CA00:\n\
    movs r0, 0x4\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809CA10\n\
    bl sub_809CD88\n\
    movs r0, 0\n\
    b _0809CA3A\n\
_0809CA10:\n\
    movs r6, 0\n\
    b _0809CA38\n\
_0809CA14:\n\
    movs r6, 0x1\n\
    movs r0, 0\n\
    mov r12, r0\n\
    movs r0, 0xFF\n\
    strb r0, [r4]\n\
    movs r0, 0\n\
    ldrsb r0, [r7, r0]\n\
    movs r3, 0x1D\n\
    cmp r0, 0\n\
    bne _0809CA2A\n\
    movs r3, 0x18\n\
_0809CA2A:\n\
    strb r6, [r1]\n\
_0809CA2C:\n\
    cmp r6, 0\n\
    beq _0809CA38\n\
    mov r0, r12\n\
    adds r1, r3, 0\n\
    bl sub_809AF18\n\
_0809CA38:\n\
    adds r0, r6, 0\n\
_0809CA3A:\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}
#endif // NONMATCHING

u8 sub_809CA40(void)
{
    u16 i = 0;
    while (gUnknown_083BBBD4[i].func != NULL)
    {
        if (gUnknown_083BBBD4[i].unk4 == gUnknown_020384E4)
            return gUnknown_083BBBD4[i].func();
        i++;
    }

    return 0;
}

void sub_809CA8C(void)
{
    sub_809CDCC();
    sub_809CDEC(9);
    sub_809CDEC(10);
    sub_809CDEC(11);
    sub_809CDEC(0);
}

#if DEBUG
u8 debug_sub_80AA40C(void)
{
    if (!sub_809AB8C())
        return 0;

    sub_809CDCC();
    sub_809CDEC(32);
    sub_809CDEC(6);
    return 1;
}
#endif

bool8 sub_809CAB0(void)
{
    u16 var0;

#if DEBUG
    if (unk_2038790)
        return debug_sub_80AA40C();
#endif

    sub_809CDCC();
    var0 = sub_809AB8C();

    switch (gPokemonStorageSystemPtr->unk_0005)
    {
    case 1:
        if (var0)
            sub_809CDEC(1);
        else
            return 0;
        break;
    case 0:
        if (var0)
            sub_809CDEC(2);
        else
            return 0;
        break;
    case 2:
        if (gUnknown_020384E6)
        {
            if (var0)
                sub_809CDEC(4);
            else
                sub_809CDEC(5);
        }
        else
        {
            if (var0)
                sub_809CDEC(3);
            else
                return 0;
        }
        break;
    default:
        return 0;
    }

    sub_809CDEC(6);
    if (gPokemonStorageSystemPtr->unk_0005 == 2)
    {
        if (!gUnknown_020384E4)
            sub_809CDEC(2);
        else
            sub_809CDEC(1);
    }

    sub_809CDEC(8);
    sub_809CDEC(7);
    sub_809CDEC(0);
    return 1;
}

void sub_809CB74(struct Sprite *sprite)
{
    sprite->pos1.x = gPokemonStorageSystemPtr->unk_11c0->pos1.x;
    sprite->pos1.y = gPokemonStorageSystemPtr->unk_11c0->pos1.y + 20;
}

void sub_809CB94(struct Pokemon *mon)
{
    if (gUnknown_020384E4 == 1)
    {
        mon->box = gPlayerParty[gUnknown_020384E5].box;
    }
    else
    {
        u8 boxId = get_preferred_box();
        mon->box = gPokemonStorage.boxes[boxId][gUnknown_020384E5];
    }
}

void sub_809CC04(void)
{
    u16 x, y;
    u8 spriteId;
    int priority, subpriority;
    struct SpriteSheet spriteSheets[3];
    struct SpritePalette spritePalettes[3];

    memcpy(spriteSheets, gHandCursorSpriteSheets, 24);
    memcpy(spritePalettes, gHandCursorSpritePalettes, 24);
    LoadSpriteSheets(spriteSheets);
    LoadSpritePalettes(spritePalettes);
    gPokemonStorageSystemPtr->unk_11e4[0] = IndexOfSpritePaletteTag(0xDAC6);
    gPokemonStorageSystemPtr->unk_11e4[1] = IndexOfSpritePaletteTag(0xDAD1);

    sub_809AACC(gUnknown_020384E4, gUnknown_020384E5, &x, &y);
    spriteId = CreateSprite(&gSpriteTemplate_83BBC70, x, y, 6);
    if (spriteId != MAX_SPRITES)
    {
        gPokemonStorageSystemPtr->unk_11c0 = &gSprites[spriteId];
        gPokemonStorageSystemPtr->unk_11c0->oam.paletteNum = gPokemonStorageSystemPtr->unk_11e4[gUnknown_020384E9];
        if (gUnknown_020384E6)
            StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 3);
    }
    else
    {
        gPokemonStorageSystemPtr->unk_11c0 = NULL;
    }

    if (gUnknown_020384E4 == 1)
    {
        subpriority = 12;
        priority = 1;
    }
    else
    {
        subpriority = 20;
        priority = 2;
    }

    spriteId = CreateSprite(&gSpriteTemplate_83BBC88, 0, 0, subpriority);
    if (spriteId != MAX_SPRITES)
    {
        gPokemonStorageSystemPtr->unk_11c4 = &gSprites[spriteId];
        gPokemonStorageSystemPtr->unk_11c4->oam.priority = priority;
        if (gUnknown_020384E4)
            gPokemonStorageSystemPtr->unk_11c4->invisible = 1;
    }
    else
    {
        gPokemonStorageSystemPtr->unk_11c4 = NULL;
    }
}

void sub_809CD88(void)
{
    gUnknown_020384E9 = !gUnknown_020384E9;
    gPokemonStorageSystemPtr->unk_11c0->oam.paletteNum = gPokemonStorageSystemPtr->unk_11e4[gUnknown_020384E9];
}

void sub_809CDCC(void)
{
    gPokemonStorageSystemPtr->unk_11b8 = 0;
    gPokemonStorageSystemPtr->unk_11b9 = 0;
}

void sub_809CDEC(u8 arg0)
{
    u8 width;
    u8 var0;

    if (gPokemonStorageSystemPtr->unk_11b8 < 7)
    {
        struct StorageText *storageText = &gPokemonStorageSystemPtr->unk_1180[gPokemonStorageSystemPtr->unk_11b8];
        storageText->text = gUnknown_083BBCA0[arg0];
        storageText->textId = arg0;
        width = GetStringWidthInMenuWindow(storageText->text);
        var0 = (width + 7) / 8;
        if (var0 > gPokemonStorageSystemPtr->unk_11b9)
            gPokemonStorageSystemPtr->unk_11b9 = var0;

        gPokemonStorageSystemPtr->unk_11b8++;
    }
}

s8 sub_809CE4C(u8 arg0)
{
    if (arg0 >= gPokemonStorageSystemPtr->unk_11b8)
        return -1;
    else
        return gPokemonStorageSystemPtr->unk_1180[arg0].textId;
}

void sub_809CE84(void)
{
    gPokemonStorageSystemPtr->unk_11bc = 14 - gPokemonStorageSystemPtr->unk_11b8 * 2;
    gPokemonStorageSystemPtr->unk_11ba = 28 - gPokemonStorageSystemPtr->unk_11b9;
    Menu_DrawStdWindowFrame(gPokemonStorageSystemPtr->unk_11ba, gPokemonStorageSystemPtr->unk_11bc, 29, 15);
    Menu_PrintItems(
        gPokemonStorageSystemPtr->unk_11ba + 1,
        gPokemonStorageSystemPtr->unk_11bc + 1,
        gPokemonStorageSystemPtr->unk_11b8,
        gPokemonStorageSystemPtr->unk_1180);
    InitMenu(
        0,
        gPokemonStorageSystemPtr->unk_11ba + 1,
        gPokemonStorageSystemPtr->unk_11bc + 1,
        gPokemonStorageSystemPtr->unk_11b8,
        0,
        gPokemonStorageSystemPtr->unk_11b9);
}

#ifdef NONMATCHING // r4 and r5 are swapped throughout the entire function.
s16 sub_809CF30(void)
{
    int textId = -2;

    if (!(gMain.newKeys & A_BUTTON))
    {
        if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(5);
            textId++;
        }

        if (gMain.newKeys & DPAD_UP)
        {
            PlaySE(5);
            Menu_MoveCursor(-1);
        }
        else if (gMain.newKeys & DPAD_DOWN)
        {
            PlaySE(5);
            Menu_MoveCursor(1);
        }
    }
    else
    {
        textId = Menu_GetCursorPos();
    }

    if (textId != -2)
    {
        Menu_DestroyCursor();
        Menu_EraseWindowRect(
            gPokemonStorageSystemPtr->unk_11ba,
            gPokemonStorageSystemPtr->unk_11bc,
            29,
            15);
    }

    if (textId >= 0)
    {
        textId = gPokemonStorageSystemPtr->unk_1180[textId].textId;
    }

    return textId;
}
#else
NAKED
s16 sub_809CF30(void)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    movs r5, 0x2\n\
    negs r5, r5\n\
    ldr r4, _0809CF6C @ =gMain\n\
    ldrh r1, [r4, 0x2E]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0809CF86\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809CF52\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    adds r5, 0x1\n\
_0809CF52:\n\
    ldrh r1, [r4, 0x2E]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809CF70\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    bl Menu_MoveCursor\n\
    b _0809CF8E\n\
    .align 2, 0\n\
_0809CF6C: .4byte gMain\n\
_0809CF70:\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809CF8E\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0x1\n\
    bl Menu_MoveCursor\n\
    b _0809CF8E\n\
_0809CF86:\n\
    bl Menu_GetCursorPos\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
_0809CF8E:\n\
    movs r0, 0x2\n\
    negs r0, r0\n\
    cmp r5, r0\n\
    beq _0809CFB2\n\
    bl Menu_DestroyCursor\n\
    ldr r0, _0809CFD0 @ =gPokemonStorageSystemPtr\n\
    ldr r1, [r0]\n\
    ldr r2, _0809CFD4 @ =0x000011ba\n\
    adds r0, r1, r2\n\
    ldrb r0, [r0]\n\
    adds r2, 0x2\n\
    adds r1, r2\n\
    ldrb r1, [r1]\n\
    movs r2, 0x1D\n\
    movs r3, 0xF\n\
    bl Menu_EraseWindowRect\n\
_0809CFB2:\n\
    cmp r5, 0\n\
    blt _0809CFC4\n\
    ldr r0, _0809CFD0 @ =gPokemonStorageSystemPtr\n\
    ldr r0, [r0]\n\
    lsls r1, r5, 3\n\
    ldr r2, _0809CFD8 @ =0x00001184\n\
    adds r0, r2\n\
    adds r0, r1\n\
    ldr r5, [r0]\n\
_0809CFC4:\n\
    lsls r0, r5, 16\n\
    asrs r0, 16\n\
    pop {r4,r5}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_0809CFD0: .4byte gPokemonStorageSystemPtr\n\
_0809CFD4: .4byte 0x000011ba\n\
_0809CFD8: .4byte 0x00001184\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_809CFDC(struct UnkStruct_2000020 *arg0, struct UnkStruct_2000028 *arg1, u8 arg2)
{
    gUnknown_020384EC = arg0;
    arg0->unk_00 = arg1;
    arg0->unk_05 = arg2;
    arg0->unk_04 = 0;
}

void sub_809CFF0(void)
{
    u16 i;
    struct UnkStruct_2000028 *unkStruct;

    if (gUnknown_020384EC->unk_04)
    {
        for (i = 0; i < gUnknown_020384EC->unk_04; i++)
        {
            unkStruct = &gUnknown_020384EC->unk_00[i];
            unkStruct->unk_0c(unkStruct);
        }

        gUnknown_020384EC->unk_04 = 0;
    }
}

bool8 sub_809D034(u8 *dest, u16 dLeft, u16 dTop, const u8 *src, u16 sLeft, u16 sTop, u16 width, u16 height)
{
    struct UnkStruct_2000028 *unkStruct;

    if (gUnknown_020384EC->unk_04 >= gUnknown_020384EC->unk_05)
        return FALSE;

    unkStruct = &gUnknown_020384EC->unk_00[gUnknown_020384EC->unk_04++];
    unkStruct->unk_08 = width * 2;
    unkStruct->unk_04 = dest + (dTop * 64) + (dLeft * 2);
    unkStruct->unk_00 = src + (sTop * 64) + (sLeft * 2);
    unkStruct->unk_0a = height;
    unkStruct->unk_0c = sub_809D0BC;
    return TRUE;
}

void sub_809D0BC(struct UnkStruct_2000028 *unkStruct)
{
    u32 i;
    const u8 *src = unkStruct->unk_00;
    u8 *dest = unkStruct->unk_04;
    int height = unkStruct->unk_0a;
    int width = unkStruct->unk_08;
    for (i = 0; i < height; i++)
    {
        CpuSet(src, dest, (width / 2) & 0x1FFFFF);
        dest += 64;
        src += 64;
    }
}

void sub_809D104(u8 *dest, u16 dLeft, u16 dTop, const u8 *src, u16 sLeft, u16 sTop, u16 width, u16 height)
{
    const u8 *from = src + (sTop * 64) + (sLeft * 2);
    u8 *to = dest + (dTop * 64) + (dLeft * 2);
    u8 *end = dest + (dTop + height) * 64;
    int width2 = width * 2;
    while (to < end)
    {
        CpuSet(from, to, (width2 / 2) & 0x1FFFFF);
        to += 64;
        from += 64;
    }
}

bool8 sub_809D16C(void *dest, u16 dLeft, u16 dTop, u16 width, u16 height)
{
    struct UnkStruct_2000028 *unkStruct;

    if (gUnknown_020384EC->unk_04 >= gUnknown_020384EC->unk_05)
        return FALSE;

    unkStruct = &gUnknown_020384EC->unk_00[gUnknown_020384EC->unk_04++];
    unkStruct->unk_08 = width * 2;
    unkStruct->unk_04 = dest + ((dTop * 32) + dLeft) * 2;
    unkStruct->unk_0a = height;
    unkStruct->unk_0c = sub_809D1C4;
    return TRUE;
}

void sub_809D1C4(struct UnkStruct_2000028 *unkStruct)
{
    u16 i;

    for (i = 0; i < unkStruct->unk_0a; i++)
    {
        Dma3FillLarge_(0, unkStruct->unk_04, unkStruct->unk_08, 16);
        unkStruct->unk_04 += 64;
    }
}
