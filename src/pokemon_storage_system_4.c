
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
#include "sound.h"
#include "constants/songs.h"

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
EWRAM_DATA s8 sBoxCursorArea = 0;
EWRAM_DATA s8 sBoxCursorPosition = 0;
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
void CopyWallpaperTilemap(u16 *buffer, const u16 *tilemap, s8 direction, u8 offset);
void ClearLowestWallpaperTiles(u16 *buffer);
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
void SetPlacedMonData(u8 a0, u8 a1);
void sub_809B548(u8 a0, u8 a1);
void SetShiftedMonData(u8 a0, u8 a1);
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
        ClearLowestWallpaperTiles(BG_SCREEN_ADDR(26));
    }
    wallpaperTable = gWallpaperTable +gPokemonStorage.wallpaper[boxId];
    LoadPalette(wallpaperTable->palettes, gPokemonStorageSystemPtr->unk_08ba * 0x30 + 0x40, 0x60);
    LZ77UnCompWram(wallpaperTable->tileMap, gPokemonStorageSystemPtr->unk_0d62);
    CopyWallpaperTilemap(BG_SCREEN_ADDR(26), gPokemonStorageSystemPtr->unk_0d62, a1, gPokemonStorageSystemPtr->unk_08ba);
    LZ77UnCompVram(wallpaperTable->tiles, BG_CHAR_ADDR(2) + (gPokemonStorageSystemPtr->unk_08ba << 13));
}

/*
    Copies the wallpaper rectangle tilemap to a buffer,
    depending on the wallpaper type.

    - buffer    : Where to copy the wallpaper to.
    - tilemap   : The wallpaper tilemap to copy.
    - direction : The direction of the wallpaper.
    - offset    : The offset of the wallpaper tilemap.

    Also depends on stored BG2 X variable in PSS.
*/
void CopyWallpaperTilemap(u16 *buffer, const u16 *tilemap, s8 direction, u8 offset)
{
    u16 *dest; // For either all of the wallpaper tilemap, or the first half of it.
    u16 *dest2; // The second half of wallpaper tilemap; used in case of two halves.
    u16 *fillDest; // For blanking; used when direction is set.

    u16 x, y; // Temps for copying the tilemap.

    // Temps for copying the tile and palette metadata of the wallpaper.
    u16 tileMeta;
    u16 tileOffset = offset * 256;
    u16 paletteMeta;
    u16 paletteOffset = (offset * 3 + 4) << 12;

    s16 rectWidth; // The width of the wallpaper, or it's first half.
    s16 rectWidth2; // Used in case of two halves.
    s16 rectX = ((gPokemonStorageSystemPtr->unk_08b4 / 8 + 10) + (direction * 24)) & 0x3F;

    s16 fillX; // For blanking; used when direction is set.

    /*
        Bull**** agbcc behavior discovered here
        while attempting to match this function:
        x + (y + z) is NOT the same as x + y + z.
        Even though it SHOULDN'T make a difference.

        Rather, it's the same as x + z + y. That's
        old codegen for you.
    */
    if (rectX < 13)
    {
        // Copy the wallpaper in full.
        rectWidth = 20;
        rectWidth2 = 0;
        dest = buffer + (rectX + 64);
        dest2 = NULL;
    }
    else if (rectX < 32)
    {
        // Split copying the wallpaper into two operations.
        rectWidth = 32 - rectX;
        rectWidth2 = 20 - rectWidth;
        dest = buffer + (rectX + 64);
        dest2 = buffer + 0x440;
    }
    else if (rectX < 45)
    {
        // Copy the wallpaper in full.
        rectWidth = 20;
        rectWidth2 = 0;
        dest = buffer + (rectX + 0x420);
        dest2 = NULL;
    }
    else
    {
        // Split copying the wallpaper into two operations.
        rectWidth = 64 - rectX;
        rectWidth2 = 20 - rectWidth;
        dest = buffer + (rectX + 0x420);
        dest2 = buffer + 0x40;
    }

    for (y = 0; y < 18; y++)
    {
        for(x = 0; x < rectWidth; x++)
        {
            // Get the tile and palette metadata for each
            // 2 bytes, and copy over into the buffer.
            tileMeta = (*tilemap & 0xfff) + tileOffset;
            paletteMeta =  (*tilemap & 0xf000) + paletteOffset;
            dest[x] = paletteMeta | tileMeta;
            tilemap++;
        }
        for(x = 0; x < rectWidth2; x++)
        {
            // Repeat the same process again in case we need
            // to copy halves.
            tileMeta = (*tilemap & 0xfff) + tileOffset;
            paletteMeta =  (*tilemap & 0xf000) + paletteOffset;
            dest2[x] = paletteMeta | tileMeta;
            tilemap++;
        }
        dest += 0x20;
        dest2 += 0x20;
    }

    if (direction != 0)
    {
        fillX = (direction > 0 ? rectX + 20 : rectX - 4) & 0x3F;

        if(fillX < 32)
            fillDest = buffer + (fillX + 0x40);
        else
            fillDest = buffer + (fillX + 0x420);

        for(x = 0; x < 4; x++)
        {
            for(y = 0; y < 18; y++)
            {
                *fillDest = 0; // Blank the buffer.
                fillDest += 0x20;
            }
            // Needs to be one statement, or else it won't match.
            // fillX = ++fillX & 0x3F; matches, but to have consistency
            // with ClearLowestWallpaperTiles, which requires var + 1
            // instead for a similar operation, we'll use that.
            fillX = (fillX + 1) & 0x3F;

            if (fillX < 32)
                fillDest = buffer + (fillX + 0x40);
            else
                fillDest = buffer + (fillX + 0x420);
        }
    }
}

/*
    Clears the lowest line of a wallpaper buffer.
    Depends on stored BG2 X variable in PSS.

    - buffer : Wallpaper buffer.
*/
void ClearLowestWallpaperTiles(u16 *buffer)
{
    u16 x;
    s16 rectX = ((gPokemonStorageSystemPtr->unk_08b4 / 8) + 30) & 0x3F;

    if (rectX < 32)
        buffer += rectX + 0x260;
    else
        buffer += rectX + 0x640;

    for (x = 0; x < 44; x++)
    {
        *buffer++ = 0;
        // Needs to be one statement in order to match.
        rectX = (rectX + 1) & 0x3F;
        if (rectX == 0)
            buffer -= 0x420;
        if (rectX == 32)
            buffer += 0x3e0;
    }
}

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
    else if ((sprite->x += sprite->data[0]) == sprite->data[1])
        sprite->callback = SpriteCallbackDummy;
}

void sub_809A61C(struct Sprite *sprite)
{
    if (sprite->data[1])
        sprite->data[1]--;
    else
    {
        sprite->x += sprite->data[0];
        sprite->data[2] = sprite->x + sprite->x2;
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
        gPokemonStorageSystemPtr->unk_0d00[i]->x2 = 0;
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
        gPokemonStorageSystemPtr->unk_0d00[i]->x = 0x88 * i + 0x5c;
        gPokemonStorageSystemPtr->unk_0d00[i]->x2 = 0;
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
            sprite->x2 = 0;
            break;
        case 1:
            if (++sprite->data[1] > 3)
            {
                sprite->data[1] = 0;
                sprite->x2 += sprite->data[3];
                if (++sprite->data[2] > 5)
                {
                    sprite->data[2] = 0;
                    sprite->x2 = 0;
                }
            }
            break;
        case 2:
            sprite->data[0] = 3;
            break;
        case 3:
            sprite->x -= gPokemonStorageSystemPtr->unk_08b6;
            if (sprite->x < 0x49 || sprite->x > 0xf7)
                sprite->invisible = TRUE;
            if (--sprite->data[1] == 0)
            {
                sprite->x = sprite->data[2];
                sprite->invisible = FALSE;
                sprite->data[0] = 4;
            }
            break;
        case 4:
            sprite->x -= gPokemonStorageSystemPtr->unk_08b6;
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
        sBoxCursorArea = 0;
    else
        sBoxCursorArea = 1;
    sBoxCursorPosition = 0;
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
    switch (sBoxCursorArea)
    {
        case 1:
            return GetMonData(gPlayerParty + sBoxCursorPosition, MON_DATA_SPECIES);
        case 0:
            return GetBoxMonData(gPokemonStorage.boxes[get_preferred_box()] + sBoxCursorPosition, MON_DATA_SPECIES);
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
        gPokemonStorageSystemPtr->unk_11c0->x = gPokemonStorageSystemPtr->unk_11c8 >> 8;
        gPokemonStorageSystemPtr->unk_11c0->y = gPokemonStorageSystemPtr->unk_11cc >> 8;
        if (gPokemonStorageSystemPtr->unk_11c0->x > 0x100)
        {
            tmp = gPokemonStorageSystemPtr->unk_11c0->x - 0x100;
            gPokemonStorageSystemPtr->unk_11c0->x = tmp + 0x40;
        }
        if (gPokemonStorageSystemPtr->unk_11c0->x < 0x40)
        {
            tmp = 0x40 - gPokemonStorageSystemPtr->unk_11c0->x;
            gPokemonStorageSystemPtr->unk_11c0->x = 0x100 - tmp;
        }
        if (gPokemonStorageSystemPtr->unk_11c0->y > 0xb0)
        {
            tmp = gPokemonStorageSystemPtr->unk_11c0->y - 0xb0;
            gPokemonStorageSystemPtr->unk_11c0->y = tmp - 0x10;
        }
        if (gPokemonStorageSystemPtr->unk_11c0->y < -0x10)
        {
            tmp = -0x10 - gPokemonStorageSystemPtr->unk_11c0->y;
            gPokemonStorageSystemPtr->unk_11c0->y = 0xb0 - tmp;
        }
        if (gPokemonStorageSystemPtr->unk_11e3 && --gPokemonStorageSystemPtr->unk_11e3 == 0)
            gPokemonStorageSystemPtr->unk_11c0->vFlip = gPokemonStorageSystemPtr->unk_11c0->vFlip ? FALSE : TRUE;
    }
    else
    {
        gPokemonStorageSystemPtr->unk_11c0->x = gPokemonStorageSystemPtr->unk_11d8;
        gPokemonStorageSystemPtr->unk_11c0->y = gPokemonStorageSystemPtr->unk_11da;
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
            r7 = gPokemonStorageSystemPtr->unk_11da - gPokemonStorageSystemPtr->unk_11c0->y;
            break;
        case -1:
            r7 = gPokemonStorageSystemPtr->unk_11da - 0xc0 - gPokemonStorageSystemPtr->unk_11c0->y;
            break;
        case 1:
            r7 = gPokemonStorageSystemPtr->unk_11da + 0xc0 - gPokemonStorageSystemPtr->unk_11c0->y;
            break;
    }
    switch (gPokemonStorageSystemPtr->unk_11df)
    {
        default:
            r0 = gPokemonStorageSystemPtr->unk_11d8 - gPokemonStorageSystemPtr->unk_11c0->x;
            break;
        case -1:
            r0 = gPokemonStorageSystemPtr->unk_11d8 - 0xc0 - gPokemonStorageSystemPtr->unk_11c0->x;
            break;
        case 1:
            r0 = gPokemonStorageSystemPtr->unk_11d8 + 0xc0 - gPokemonStorageSystemPtr->unk_11c0->x;
            break;
    }
    r7 <<= 8;
    r0 <<= 8;
    gPokemonStorageSystemPtr->unk_11d0 = r0 / gPokemonStorageSystemPtr->unk_11dc;
    gPokemonStorageSystemPtr->unk_11d4 = r7 / gPokemonStorageSystemPtr->unk_11dc;
    gPokemonStorageSystemPtr->unk_11c8 = gPokemonStorageSystemPtr->unk_11c0->x << 8;
    gPokemonStorageSystemPtr->unk_11cc = gPokemonStorageSystemPtr->unk_11c0->y << 8;
}

void sub_809AF18(u8 a0, u8 a1)
{
    sub_809AD3C(a0, a1);
    sub_809AD94();
    if (!gUnknown_020384E6)
        StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 1);
    if (a0 == 1 && sBoxCursorArea != 1)
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
    sBoxCursorArea = gPokemonStorageSystemPtr->unk_11e0;
    sBoxCursorPosition = gPokemonStorageSystemPtr->unk_11e1;
    if (!gUnknown_020384E6)
        StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 0);
    sub_809BF74();
    switch (sBoxCursorArea)
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
    gUnknown_020384EA = sBoxCursorPosition;
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
            switch (sBoxCursorArea)
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
            sub_80996B0(gPokemonStorageSystemPtr->unk_12a9, sBoxCursorPosition);
            gPokemonStorageSystemPtr->unk_12a8++;
            break;
        case 1:
            if (!sub_809971C())
            {
                StartSpriteAnim(gPokemonStorageSystemPtr->unk_11c0, 3);
                SetShiftedMonData(gPokemonStorageSystemPtr->unk_12a9, sBoxCursorPosition);
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
    switch (gPokemonStorageSystemPtr->unk_11c0->y2)
    {
        default:
            gPokemonStorageSystemPtr->unk_11c0->y2++;
            break;
        case 0:
            gPokemonStorageSystemPtr->unk_11c0->y2++;
            break;
        case 8:
            return FALSE;
    }
    return TRUE;
}

bool8 sub_809B358(void)
{
    switch (gPokemonStorageSystemPtr->unk_11c0->y2)
    {
        case 0:
            return FALSE;
        default:
            gPokemonStorageSystemPtr->unk_11c0->y2--;
            break;
    }
    return TRUE;
}

void sub_809B384(void)
{
    switch (sBoxCursorArea)
    {
        case 1:
            sub_809B44C(14, sBoxCursorPosition);
            sub_8099584(0, sBoxCursorPosition);
            break;
        case 0:
            sub_809B44C(get_preferred_box(), sBoxCursorPosition);
            sub_8099584(1, sBoxCursorPosition);
            break;
        default:
            return;
    }
    gUnknown_020384E6 = TRUE;
}

void sub_809B3E0(void)
{
    u8 boxId;
    switch (sBoxCursorArea)
    {
        case 1:
            SetPlacedMonData(14, sBoxCursorPosition);
            sub_809960C(14, sBoxCursorPosition);
            break;
        case 0:
            boxId = get_preferred_box();
            SetPlacedMonData(boxId, sBoxCursorPosition);
            sub_809960C(boxId, sBoxCursorPosition);
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
        gPokemonStorageSystemPtr->unk_25b4 = gPlayerParty[sBoxCursorPosition];
    else
        ExpandBoxMon(gPokemonStorage.boxes[a0] + a1, &gPokemonStorageSystemPtr->unk_25b4);
    sub_809B548(a0, a1);
    gUnknown_020384E7 = a0;
    gUnknown_020384E8 = a1;
}

void SetPlacedMonData(u8 boxId, u8 position)
{
    if (boxId == 14)
    {
        gPlayerParty[position] = gPokemonStorageSystemPtr->unk_25b4;
    }
    else
    {
        BoxMonRestorePP(&gPokemonStorageSystemPtr->unk_25b4.box);
        gPokemonStorage.boxes[boxId][position] = gPokemonStorageSystemPtr->unk_25b4.box;
    }
}

void sub_809B548(u8 a0, u8 a1)
{
    if (a0 == 14)
        ZeroMonData(gPlayerParty + a1);
    else
        ZeroBoxMonData(gPokemonStorage.boxes[a0] + a1);
}

void SetShiftedMonData(u8 boxId, u8 position)
{
    if (boxId == 14)
        gPokemonStorageSystemPtr->unk_2618 = gPlayerParty[position];
    else
        ExpandBoxMon(gPokemonStorage.boxes[boxId] + position, &gPokemonStorageSystemPtr->unk_2618);
    SetPlacedMonData(boxId, position);
    gPokemonStorageSystemPtr->unk_25b4 = gPokemonStorageSystemPtr->unk_2618;
    sub_809C04C(&gPokemonStorageSystemPtr->unk_25b4, 0);
    gUnknown_020384E7 = boxId;
    gUnknown_020384E8 = position;
}

bool8 sub_809B62C(u8 boxId)
{
    s16 monIdx = GetIndexOfFirstEmptySpaceInBoxN(boxId);
    if (monIdx == -1)
        return FALSE;
    if (gUnknown_020384E6)
    {
        SetPlacedMonData(boxId, monIdx);
        sub_8099480();
        gUnknown_020384E6 = FALSE;
    }
    else
    {
        sub_809B44C(14, sBoxCursorPosition);
        SetPlacedMonData(boxId, monIdx);
        sub_8099520(sBoxCursorPosition);
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
    else if (sBoxCursorArea == 1)
        mode = 0;
    else
        mode = 1;
    sub_809981C(mode, sBoxCursorPosition);
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
        if (sBoxCursorArea == 1)
            boxId = 14;
        else
            boxId = get_preferred_box();
        sub_809B548(boxId, sBoxCursorPosition);
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
        if (sBoxCursorArea == 1)
        {
            gPokemonStorageSystemPtr->unk_2618 = gPlayerParty[sBoxCursorPosition];
            gPokemonStorageSystemPtr->unk_2682 = 14;
        }
        else
        {
            ExpandBoxMon(gPokemonStorage.boxes[gPokemonStorage.currentBox] + sBoxCursorPosition, &gPokemonStorageSystemPtr->unk_2618);
            gPokemonStorageSystemPtr->unk_2682 = gPokemonStorage.currentBox;
        }
        gPokemonStorageSystemPtr->unk_2683 = sBoxCursorPosition;
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
    else if (sBoxCursorArea == 1)
    {
        gPokemonStorageSystemPtr->unk_2690.pokemon = gPlayerParty;
        gPokemonStorageSystemPtr->unk_268d = sBoxCursorPosition;
        gPokemonStorageSystemPtr->unk_268c = StorageSystemGetPartySize() - 1;
        gPokemonStorageSystemPtr->unk_268e = 0;
    }
    else
    {
        gPokemonStorageSystemPtr->unk_2690.box = gPokemonStorage.boxes[gPokemonStorage.currentBox];
        gPokemonStorageSystemPtr->unk_268d = sBoxCursorPosition;
        gPokemonStorageSystemPtr->unk_268c = 30 - 1;
        gPokemonStorageSystemPtr->unk_268e = 5;
    }
}

void sub_809BD14(void)
{
    if (gUnknown_020384E6)
        sub_809BBC0();
    else
        sBoxCursorPosition = pssData.monIndex;
}

s16 CompactPartySlots(void)
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
        if (sBoxCursorArea == 1)
            SetMonData(gPlayerParty + sBoxCursorPosition, MON_DATA_MARKINGS, &markings);
        if (sBoxCursorArea == 0)
            SetBoxMonData(gPokemonStorage.boxes[get_preferred_box()] + sBoxCursorPosition, MON_DATA_MARKINGS, &markings);
    }
}

bool8 sub_809BE80(void)
{
    if (sBoxCursorArea == 1 && !gUnknown_020384E6 && CountAlivePartyMonsExceptOne(sBoxCursorPosition) == 0)
        return TRUE;
    return FALSE;
}

bool8 sub_809BEBC(void)
{
    if (gUnknown_020384E6)
    {
        if (sBoxCursorArea == 1 && CountAlivePartyMonsExceptOne(sBoxCursorPosition) == 0)
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
    return sBoxCursorArea == 2 ? TRUE : FALSE;
}

bool8 sub_809BF48(void)
{
    return (sBoxCursorArea == 3 && sBoxCursorPosition == 1) ? TRUE : FALSE;
}

void sub_809BF74(void)
{
    gPokemonStorageSystemPtr->unk_11f6 = gUnknown_020384E6 ? 0 : 1;
    if (!gUnknown_020384E6)
    {
        switch (sBoxCursorArea)
        {
            case 1:
                if (sBoxCursorPosition < PARTY_SIZE)
                {
                    sub_809C04C(gPlayerParty + sBoxCursorPosition, 0);
                    break;
                }
                // fallthrough
            case 2:
            case 3:
                sub_809C04C(NULL, 2);
                break;
            case 0:
                sub_809C04C(gPokemonStorage.boxes[get_preferred_box()] + sBoxCursorPosition, 1);
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
            StringGet_Nickname(gPokemonStorageSystemPtr->unk_11fa);
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
            StringGet_Nickname(gPokemonStorageSystemPtr->unk_11fa);
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

u8 sub_809C464(void)
{
    u8 r9;
    s8 r8 = sBoxCursorArea;
    s8 r4 = sBoxCursorPosition;

    do
    {
        gPokemonStorageSystemPtr->unk_11de = 0;
        gPokemonStorageSystemPtr->unk_11df = 0;
        gPokemonStorageSystemPtr->unk_11e3 = 0;

        if (JOY_REPT(DPAD_UP))
        {
            r9 = 1;
            if (sBoxCursorPosition >= 6)
            {
                r4 -= 6;
            }
            else
            {
                r8 = 2;
                r4 = 0;
            }
            break;
        }
        if (JOY_REPT(DPAD_DOWN))
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
            break;
        }
        if (JOY_REPT(DPAD_LEFT))
        {
            r9 = 1;
            if (sBoxCursorPosition % 6)
                r4--;
            else
            {
                gPokemonStorageSystemPtr->unk_11df = -1;
                r4 += 5;
            }
            break;
        }
        if (JOY_REPT(DPAD_RIGHT))
        {
            r9 = 1;
            if ((sBoxCursorPosition + 1) % 6)
                r4++;
            else
            {
                gPokemonStorageSystemPtr->unk_11df = 1;
                r4 -= 5;
            }
            break;
        }
        if (JOY_NEW(START_BUTTON))
        {
            r9 = 1;
            r8 = 2;
            r4 = 0;
            break;
        }
        if ((JOY_NEW(A_BUTTON)) && sub_809CAB0())
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
        if (JOY_NEW(B_BUTTON))
            return 16;
        if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        {
            if (JOY_HELD(L_BUTTON))
                return 10;
            if (JOY_HELD(R_BUTTON))
                return 9;
        }
        if (JOY_NEW(SELECT_BUTTON))
        {
            sub_809CD88();
            return 0;
        }
        r9 = 0;
    } while (0);
    if (r9)
        sub_809AF18(r8, r4);
    return r9;
}

u8 sub_809C664(void)
{
    u8 retVal;
    bool8 gotoBox;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        cursorArea = sBoxCursorArea;
        cursorPosition = sBoxCursorPosition;
        gPokemonStorageSystemPtr->unk_11df = 0;
        gPokemonStorageSystemPtr->unk_11de = 0;
        gPokemonStorageSystemPtr->unk_11e3 = 0;
        gotoBox = FALSE;
        retVal = 0;

        if (JOY_REPT(DPAD_UP))
        {
            if (--cursorPosition < 0)
                cursorPosition = 6;
            if (cursorPosition != sBoxCursorPosition)
                retVal = 1;
            break;
        }

        if (JOY_REPT(DPAD_DOWN))
        {
            if (++cursorPosition > 6)
                cursorPosition = 0;
            if (cursorPosition != sBoxCursorPosition)
                retVal = 1;
            break;
        }

        if (JOY_REPT(DPAD_LEFT) && sBoxCursorPosition != 0)
        {
            retVal = 1;
            gPokemonStorageSystemPtr->unk_11e2 = sBoxCursorPosition;
            cursorPosition = 0;
            break;
        }

        if (JOY_REPT(DPAD_RIGHT))
        {
            if (sBoxCursorPosition == 0)
            {
                retVal = 1;
                cursorPosition = gPokemonStorageSystemPtr->unk_11e2;
            }
            else
            {
                retVal = 6;
                cursorArea = 0;
                cursorPosition = 0;
            }
            break;
        }

        if (JOY_NEW(A_BUTTON))
        {
            if (sBoxCursorPosition == 6)
            {
                if (gPokemonStorageSystemPtr->unk_0005 == 1)
                    return 4;

                gotoBox = TRUE;
            }
            else if (sub_809CAB0())
            {
                if (!gUnknown_020384E9)
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

        if (JOY_NEW(B_BUTTON))
        {
            if (gPokemonStorageSystemPtr->unk_0005 == 1)
                return 16;

            gotoBox = TRUE;
        }

        if (gotoBox)
        {
            retVal = 6;
            cursorArea = 0;
            cursorPosition = 0;
            break;
        }

        if (JOY_NEW(SELECT_BUTTON))
        {
            sub_809CD88();
            return 0;
        }
    } while (0);

    if (retVal != 0)
    {
        sub_809AF18(cursorArea, cursorPosition);
    }

    return retVal;
}

u8 sub_809C85C(void)
{
    u8 retVal;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        gPokemonStorageSystemPtr->unk_11df = 0;
        gPokemonStorageSystemPtr->unk_11de = 0;
        gPokemonStorageSystemPtr->unk_11e3 = 0;

        if (JOY_REPT(DPAD_UP))
        {
            retVal = 1;
            cursorArea = 3;
            cursorPosition = 0;
            gPokemonStorageSystemPtr->unk_11e3 = 1;
            break;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            retVal = 1;
            cursorArea = 0;
            cursorPosition = 2;
            break;
        }

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

        if (JOY_NEW(A_BUTTON))
        {
            sub_809A860(FALSE);
            sub_809CA8C();
            return 7;
        }

        if (JOY_NEW(B_BUTTON))
            return 16;

        if (JOY_NEW(SELECT_BUTTON))
        {
            sub_809CD88();
            return 0;
        }

        retVal = 0;
    } while (0);

    if (retVal != 0)
    {
        if (cursorArea != 2)
            sub_809A860(FALSE);
        sub_809AF18(cursorArea, cursorPosition);
    }

    return retVal;
}

u8 sub_809C944(void)
{
    u8 retVal;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        cursorArea = sBoxCursorArea;
        cursorPosition = sBoxCursorPosition;
        gPokemonStorageSystemPtr->unk_11df = 0;
        gPokemonStorageSystemPtr->unk_11de = 0;
        gPokemonStorageSystemPtr->unk_11e3 = 0;

        if (JOY_REPT(DPAD_UP))
        {
            retVal = 1;
            cursorArea = 0;
            gPokemonStorageSystemPtr->unk_11de = -1;
            if (sBoxCursorPosition == 0)
                cursorPosition = 24;
            else
                cursorPosition = 29;
            gPokemonStorageSystemPtr->unk_11e3 = 1;
            break;
        }

        if (JOY_REPT(DPAD_DOWN | START_BUTTON))
        {
            retVal = 1;
            cursorArea = 2;
            cursorPosition = 0;
            gPokemonStorageSystemPtr->unk_11e3 = 1;
            break;
        }

        if (JOY_REPT(DPAD_LEFT))
        {
            retVal = 1;
            if (--cursorPosition < 0)
            {
                gPokemonStorageSystemPtr->unk_11df = -1;
                cursorPosition = 1;
            }
            break;
        }

        if (JOY_REPT(DPAD_RIGHT))
        {
            retVal = 1;
            if (++cursorPosition > 1)
            {
                gPokemonStorageSystemPtr->unk_11df = 1;
                cursorPosition = 0;
            }
            break;
        }

        if (JOY_NEW(A_BUTTON))
            return (cursorPosition == 0) ? 5 : 4;
        if (JOY_NEW(B_BUTTON))
            return 16;

        if (JOY_NEW(SELECT_BUTTON))
        {
            sub_809CD88();
            return 0;
        }

        retVal = 0;
    } while (0);

    if (retVal != 0)
    {
        sub_809AF18(cursorArea, cursorPosition);
    }

    return retVal;
}

u8 sub_809CA40(void)
{
    u16 i = 0;
    while (gUnknown_083BBBD4[i].func != NULL)
    {
        if (gUnknown_083BBBD4[i].unk4 == sBoxCursorArea)
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
        if (!sBoxCursorArea)
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
    sprite->x = gPokemonStorageSystemPtr->unk_11c0->x;
    sprite->y = gPokemonStorageSystemPtr->unk_11c0->y + 20;
}

void sub_809CB94(struct Pokemon *mon)
{
    if (sBoxCursorArea == 1)
    {
        mon->box = gPlayerParty[sBoxCursorPosition].box;
    }
    else
    {
        u8 boxId = get_preferred_box();
        mon->box = gPokemonStorage.boxes[boxId][sBoxCursorPosition];
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

    sub_809AACC(sBoxCursorArea, sBoxCursorPosition, &x, &y);
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

    if (sBoxCursorArea == 1)
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
        if (sBoxCursorArea)
            gPokemonStorageSystemPtr->unk_11c4->invisible = TRUE;
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

s16 sub_809CF30(void)
{
    int textId = -2;

    do
    {
        if (!(JOY_NEW(A_BUTTON)))
        {
            if (JOY_NEW(B_BUTTON))
            {
                PlaySE(SE_SELECT);
                textId++;
            }

            if (JOY_NEW(DPAD_UP))
            {
                PlaySE(SE_SELECT);
                Menu_MoveCursor(-1);
            }
            else if (JOY_NEW(DPAD_DOWN))
            {
                PlaySE(SE_SELECT);
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
    } while (0);

    if (textId >= 0)
    {
        textId = gPokemonStorageSystemPtr->unk_1180[textId].textId;
    }

    return textId;
}

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
        CpuCopy16(src, dest, width);
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
        CpuCopy16(from, to, width2);
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
