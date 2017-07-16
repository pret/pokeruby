#include "global.h"
#include "event_data.h"
#include "field_effect.h"
#include "field_specials.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "pokemon_menu.h"
#include "rom4.h"
#include "secret_base.h"
#include "songs.h"
#include "sprite.h"
#include "strings.h"
#include "string_util.h"
#include "text.h"
#include "trig.h"

struct UnknownStruct1
{
    u8 filler0[0x14];
    u16 unk14;
    u8 unk16;
    u8 unk17;
    u8 (*unk18)(void);
    struct Sprite *unk1C;
    struct Sprite *unk20;
    s32 unk24;
    s32 unk28;
    u32 unk2C;
    u32 unk30;
    u32 unk34;
    u32 unk38;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    u32 unk50;
    u16 unk54;  // cursor x
    u16 unk56;  // cursor y
    u16 unk58;
    u16 unk5A;
    s16 unk5C;
    s16 unk5E;
    s16 unk60;
    s16 unk62;
    u16 unk64;
    u16 unk66;
    u16 unk68;
    u16 unk6A;
    u16 unk6C;
    u16 unk6E;
    u16 unk70;
    u16 unk72;
    u16 unk74;
    u16 unk76;
    u8 unk78;
    u8 unk79;
    s8 unk7A;
    s8 unk7B;  // movement delta horizontal
    s8 unk7C;  // movement delta vertical
    u8 unk7D;
    u8 unk7E;
    u8 unk7F;
    u8 filler80[0x100];
    u8 unk180[0x100];
    u8 unk280[0x100];  // possibly 0x600
};

extern struct UnknownStruct1 *gUnknown_020388CC;

const u16 gPokenavCursor_Pal[] = INCBIN_U16("graphics/pokenav/cursor.gbapal");
const u8 gUnknown_083E5AF0[] = INCBIN_U8("graphics/pokenav/cursor_small.4bpp.lz");
const u8 gUnknown_083E5B34[] = INCBIN_U8("graphics/pokenav/cursor_large.4bpp.lz");
const u16 gRegionMapBrendanIconPalette[] = INCBIN_U16("graphics/pokenav/brendan_icon.gbapal");
const u8 gRegionMapBrendanIconTiles[] = INCBIN_U8("graphics/pokenav/brendan_icon.4bpp");
const u16 gRegionMapMayIconPalette[] = INCBIN_U16("graphics/pokenav/may_icon.gbapal");
const u8 gRegionMapMayIconTiles[] = INCBIN_U8("graphics/pokenav/may_icon.4bpp");
const u16 gUnknown_083E5D60[] = INCBIN_U16("graphics/pokenav/region_map.gbapal");
const u8 gUnknown_083E5DA0[] = INCBIN_U8("graphics/pokenav/region_map.8bpp.lz");
const u8 gUnknown_083E6B04[] = INCBIN_U8("graphics/pokenav/region_map_map.bin.lz");

const u8 gRegionMapSections[] =
{
    0x58, 0x1D, 0x1D, 0x04, 0x1C, 0x1C, 0x1C, 0x1C, 0x1A, 0x58, 0x58, 0x22, 0x0B, 0x23, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
    0x58, 0x1D, 0x58, 0x58, 0x58, 0x58, 0x38, 0x38, 0x1A, 0x58, 0x58, 0x22, 0x58, 0x23, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
    0x1E, 0x1D, 0x58, 0x58, 0x58, 0x58, 0x38, 0x38, 0x1A, 0x58, 0x58, 0x22, 0x58, 0x23, 0x58, 0x58, 0x39, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
    0x1E, 0x58, 0x58, 0x58, 0x58, 0x03, 0x1B, 0x1B, 0x1A, 0x58, 0x58, 0x22, 0x58, 0x23, 0x24, 0x24, 0x24, 0x24, 0x0C, 0x0C, 0x27, 0x27, 0x27, 0x27, 0x28, 0x28, 0x58, 0x58,
    0x1E, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x1A, 0x58, 0x58, 0x22, 0x58, 0x58, 0x58, 0x58, 0x25, 0x58, 0x58, 0x58, 0x27, 0x27, 0x27, 0x27, 0x28, 0x28, 0x58, 0x58,
    0x0A, 0x1F, 0x1F, 0x1F, 0x1F, 0x58, 0x58, 0x58, 0x1A, 0x58, 0x58, 0x22, 0x58, 0x58, 0x58, 0x58, 0x25, 0x58, 0x58, 0x58, 0x27, 0x27, 0x27, 0x27, 0x0D, 0x0D, 0x58, 0x58,
    0x0A, 0x58, 0x58, 0x58, 0x05, 0x20, 0x20, 0x20, 0x09, 0x09, 0x21, 0x21, 0x26, 0x26, 0x26, 0x26, 0x26, 0x58, 0x58, 0x58, 0x29, 0x29, 0x29, 0x2A, 0x2A, 0x2A, 0x58, 0x58,
    0x13, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x19, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x29, 0x0E, 0x29, 0x2A, 0x2A, 0x2A, 0x58, 0x58,
    0x13, 0x58, 0x58, 0x58, 0x12, 0x12, 0x12, 0x12, 0x19, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x29, 0x29, 0x29, 0x2A, 0x2A, 0x2A, 0x58, 0x0F,
    0x13, 0x07, 0x11, 0x11, 0x01, 0x58, 0x58, 0x58, 0x19, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x2B, 0x2B, 0x2B, 0x2B, 0x0F,
    0x14, 0x58, 0x58, 0x58, 0x10, 0x58, 0x58, 0x58, 0x08, 0x31, 0x31, 0x31, 0x30, 0x30, 0x30, 0x2F, 0x2F, 0x06, 0x2E, 0x2E, 0x2E, 0x2D, 0x2D, 0x2D, 0x2C, 0x2C, 0x58, 0x58,
    0x14, 0x58, 0x58, 0x58, 0x00, 0x58, 0x58, 0x58, 0x08, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
    0x14, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x18, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x3A, 0x58, 0x58, 0x58, 0x58, 0x58,
    0x15, 0x15, 0x15, 0x58, 0x58, 0x58, 0x58, 0x58, 0x18, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
    0x58, 0x58, 0x02, 0x16, 0x16, 0x16, 0x17, 0x17, 0x18, 0x58, 0x58, 0x58, 0x49, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
};

#if ENGLISH
#include "data/region_map_names_en.h"
#elif GERMAN
#include "data/region_map_names_de.h"
#endif

struct RegionMapLocation
{
    u8 x, y;
    u8 width, height;
    const u8 *name;
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

const u16 gUnknown_083E7684[][2] =
{
    {50, 39},
    {51, 41},
    {52, 42},
    {53, 43},
    {54, 14},
    {69, 43},
    {66, 12},
    {79, 49},
    {59, 19},
    {76, 27},
    {65, 37},
    {85, 46},
    {88, 88},
};

void sub_80FA904(struct UnknownStruct1 *, u8);
bool8 sub_80FA940(void);
u8 sub_80FAB78(void);
u8 _swiopen(void);
u8 sub_80FAD04(void);
u8 sub_80FADE4(void);
void sub_80FB170(s16, s16, s16, s16, u16, u16, u8);
void sub_80FB238(s16, s16);
void sub_80FB260(void);
u16 GetRegionMapSectionAt(u16, u16);
void sub_80FB32C(void);
void sub_80FB600(void);
u16 sub_80FB758(u16);
u16 sub_80FB9C0(u16);
void sub_80FBA18(void);
u8 sub_80FBAA0(u16);
void sub_80FBB3C(u16, u16);
void sub_80FBCA0(void);
void sub_80FBDF8(void);
void sub_80FBE24(void);
void sub_80FBF34(struct Sprite *);
void sub_80FBF40(struct Sprite *);
void sub_80FBEA4(struct Sprite *);
const u8 *sub_80FBFB4(u8 *, u16, u16);
void sub_80FC214(void);
void sub_80FC228(void);
void sub_80FC244(void (*func)(void));
void sub_80FC254(void);
void sub_80FC31C(void);
void sub_80FC374(void);
void sub_80FC484(void);
void sub_80FC55C(struct Sprite *);
void sub_80FC5B4(void);
void sub_80FC600(void);
void sub_80FC69C(void);

void sub_80FA8EC(struct UnknownStruct1 *a, u8 b)
{
    sub_80FA904(a, b);
    while (sub_80FA940())
        ;
}

void sub_80FA904(struct UnknownStruct1 *a, u8 b)
{
    gUnknown_020388CC = a;
    gUnknown_020388CC->unk79 = 0;
    gUnknown_020388CC->unk78 = b;
    gUnknown_020388CC->unk18 = (b == 0) ? sub_80FAB78 : sub_80FAD04;
}

bool8 sub_80FA940(void)
{
    switch (gUnknown_020388CC->unk79)
    {
    case 0:
        LZ77UnCompVram(gUnknown_083E5DA0, (void *)(VRAM + 0x8000));
        break;
    case 1:
        LZ77UnCompVram(gUnknown_083E6B04, (void *)(VRAM + 0xE000));
        break;
    case 2:
        LoadPalette(gUnknown_083E5D60, 0x70, 0x60);  // Why isn't this the right size?
        break;
    case 3:
        LZ77UnCompWram(gUnknown_083E5AF0, gUnknown_020388CC->unk180);
        break;
    case 4:
        LZ77UnCompWram(gUnknown_083E5B34, gUnknown_020388CC->unk280);
        break;
    case 5:
        sub_80FB32C();
        gUnknown_020388CC->unk74 = gUnknown_020388CC->unk54;
        gUnknown_020388CC->unk76 = gUnknown_020388CC->unk56;
        gUnknown_020388CC->unk16 = sub_80FB758(gUnknown_020388CC->unk14);
        gUnknown_020388CC->unk14 = sub_80FB9C0(gUnknown_020388CC->unk14);
        sub_80FBFB4(gUnknown_020388CC->filler0, gUnknown_020388CC->unk14, 16);
        break;
    case 6:
        if (gUnknown_020388CC->unk78 == 0)
        {
            sub_80FB170(0, 0, 0, 0, 0x100, 0x100, 0);
        }
        else
        {
            gUnknown_020388CC->unk5C = gUnknown_020388CC->unk54 * 8 - 0x34;
            gUnknown_020388CC->unk5E = gUnknown_020388CC->unk56 * 8 - 0x44;
            gUnknown_020388CC->unk64 = gUnknown_020388CC->unk54;
            gUnknown_020388CC->unk66 = gUnknown_020388CC->unk56;
            sub_80FB170(gUnknown_020388CC->unk5C, gUnknown_020388CC->unk5E, 0x38, 0x48, 0x80, 0x80, 0);
        }
        break;
    case 7:
        sub_80FBA18();
        sub_80FB260();
        gUnknown_020388CC->unk1C = NULL;
        gUnknown_020388CC->unk20 = NULL;
        gUnknown_020388CC->unk7A = 0;
        gUnknown_020388CC->unk7E = 0;
        REG_BG2CNT = 0xBC8A;
        gUnknown_020388CC->unk79++;
    default:
        return FALSE;
    }
    gUnknown_020388CC->unk79++;
    return TRUE;
}

void sub_80FAB10(void)
{
    if (gUnknown_020388CC->unk1C != NULL)
    {
        DestroySprite(gUnknown_020388CC->unk1C);
        FreeSpriteTilesByTag(gUnknown_020388CC->unk58);
        FreeSpritePaletteByTag(gUnknown_020388CC->unk5A);
    }
    if (gUnknown_020388CC->unk20 != NULL)
    {
        DestroySprite(gUnknown_020388CC->unk20);
        FreeSpriteTilesByTag(gUnknown_020388CC->unk70);
        FreeSpritePaletteByTag(gUnknown_020388CC->unk72);
    }
}

u8 sub_80FAB60(void)
{
    return gUnknown_020388CC->unk18();
}

u8 sub_80FAB78(void)
{
    u8 r4 = 0;

    gUnknown_020388CC->unk7B = 0;
    gUnknown_020388CC->unk7C = 0;
    if ((gMain.heldKeys & DPAD_UP) && gUnknown_020388CC->unk56 > 2)
    {
        gUnknown_020388CC->unk7C = -1;
        r4 = 1;
    }
    if ((gMain.heldKeys & DPAD_DOWN) && gUnknown_020388CC->unk56 < 16)
    {
        gUnknown_020388CC->unk7C = 1;
        r4 = 1;
    }
    if ((gMain.heldKeys & DPAD_LEFT) && gUnknown_020388CC->unk54 > 1)
    {
        gUnknown_020388CC->unk7B = -1;
        r4 = 1;
    }
    if ((gMain.heldKeys & DPAD_RIGHT) && gUnknown_020388CC->unk54 < 0x1C)
    {
        gUnknown_020388CC->unk7B = 1;
        r4 = 1;
    }
    if (gMain.newKeys & A_BUTTON)
        r4 = 4;
    else if (gMain.newKeys & B_BUTTON)
        r4 = 5;
    if (r4 == 1)
    {
        gUnknown_020388CC->unk7A = 4;
        gUnknown_020388CC->unk18 = _swiopen;
    }
    return r4;
}

u8 _swiopen(void)
{
    u16 r4;

    if (gUnknown_020388CC->unk7A != 0)
        return 2;

    if (gUnknown_020388CC->unk7B > 0)
        gUnknown_020388CC->unk54++;

    if (gUnknown_020388CC->unk7B < 0)
        gUnknown_020388CC->unk54--;

    if (gUnknown_020388CC->unk7C > 0)
        gUnknown_020388CC->unk56++;

    if (gUnknown_020388CC->unk7C < 0)
        gUnknown_020388CC->unk56--;

    r4 = GetRegionMapSectionAt(gUnknown_020388CC->unk54, gUnknown_020388CC->unk56);
    gUnknown_020388CC->unk16 = sub_80FB758(r4);
    if (r4 != gUnknown_020388CC->unk14)
    {
        gUnknown_020388CC->unk14 = r4;
        sub_80FBFB4(gUnknown_020388CC->filler0, gUnknown_020388CC->unk14, 16);
    }
    sub_80FBA18();
    gUnknown_020388CC->unk18 = sub_80FAB78;
    return 3;
}

u8 sub_80FAD04(void)
{
    u8 r4 = 0;
    gUnknown_020388CC->unk6A = 0;
    gUnknown_020388CC->unk68 = 0;
    if ((gMain.heldKeys & 0x40) && gUnknown_020388CC->unk5E > -0x34)
    {
        gUnknown_020388CC->unk68 = -1;
        r4 = 1;
    }
    if ((gMain.heldKeys & 0x80) && gUnknown_020388CC->unk5E < 0x3C)
    {
        gUnknown_020388CC->unk68 = 1;
        r4 = 1;
    }
    if ((gMain.heldKeys & 0x20) && gUnknown_020388CC->unk5C > -0x2C)
    {
        gUnknown_020388CC->unk6A = -1;
        r4 = 1;
    }
    if ((gMain.heldKeys & 0x10) && gUnknown_020388CC->unk5C < 0xAC)
    {
        gUnknown_020388CC->unk6A = 1;
        r4 = 1;
    }
    if (gMain.newKeys & A_BUTTON)
        r4 = 4;
    if (gMain.newKeys & B_BUTTON)
        r4 = 5;
    if (r4 == 1)
    {
        gUnknown_020388CC->unk18 = sub_80FADE4;
        gUnknown_020388CC->unk6C = 0;
    }
    return r4;
}

u8 sub_80FADE4(void)
{
    gUnknown_020388CC->unk5E += gUnknown_020388CC->unk68;
    gUnknown_020388CC->unk5C += gUnknown_020388CC->unk6A;
    sub_80FB238(gUnknown_020388CC->unk5C, gUnknown_020388CC->unk5E);
    gUnknown_020388CC->unk6C++;
    if (gUnknown_020388CC->unk6C == 8)
    {
        u16 r3 = (gUnknown_020388CC->unk5C + 0x2C) / 8 + 1;
        u16 r1 = (gUnknown_020388CC->unk5E + 0x34) / 8 + 2;

        if (r3 != gUnknown_020388CC->unk64 || r1 != gUnknown_020388CC->unk66)
        {
            u16 r4;

            gUnknown_020388CC->unk64 = r3;
            gUnknown_020388CC->unk66 = r1;
            r4 = GetRegionMapSectionAt(r3, r1);
            gUnknown_020388CC->unk16 = sub_80FB758(r4);
            if (r4 != gUnknown_020388CC->unk14)
            {
                gUnknown_020388CC->unk14 = r4;
                sub_80FBFB4(gUnknown_020388CC->filler0, gUnknown_020388CC->unk14, 16);
            }
            sub_80FBA18();
        }
        gUnknown_020388CC->unk6C = 0;
        gUnknown_020388CC->unk18 = sub_80FAD04;
        return 3;
    }
    return 2;
}

void sub_80FAEC4(void)
{
    if (gUnknown_020388CC->unk78 == 0)
    {
        gUnknown_020388CC->unk5E = 0;
        gUnknown_020388CC->unk5C = 0;
        gUnknown_020388CC->unk40 = 0;
        gUnknown_020388CC->unk3C = 0;
        gUnknown_020388CC->unk60 = gUnknown_020388CC->unk54 * 8 - 0x34;
        gUnknown_020388CC->unk62 = gUnknown_020388CC->unk56 * 8 - 0x44;
        gUnknown_020388CC->unk44 = (gUnknown_020388CC->unk60 << 8) / 16;
        gUnknown_020388CC->unk48 = (gUnknown_020388CC->unk62 << 8) / 16;
        gUnknown_020388CC->unk64 = gUnknown_020388CC->unk54;
        gUnknown_020388CC->unk66 = gUnknown_020388CC->unk56;
        gUnknown_020388CC->unk4C = 0x10000;
        gUnknown_020388CC->unk50 = -0x800;
    }
    else
    {
        gUnknown_020388CC->unk3C = gUnknown_020388CC->unk5C * 256;
        gUnknown_020388CC->unk40 = gUnknown_020388CC->unk5E * 256;
        gUnknown_020388CC->unk60 = 0;
        gUnknown_020388CC->unk62 = 0;
        gUnknown_020388CC->unk44 = -(gUnknown_020388CC->unk3C / 16);
        gUnknown_020388CC->unk48 = -(gUnknown_020388CC->unk40 / 16);
        gUnknown_020388CC->unk54 = gUnknown_020388CC->unk64;
        gUnknown_020388CC->unk56 = gUnknown_020388CC->unk66;
        gUnknown_020388CC->unk4C = 0x8000;
        gUnknown_020388CC->unk50 = 0x800;
    }
    gUnknown_020388CC->unk6E = 0;
    sub_80FBCA0();
    sub_80FBDF8();
}

u8 sub_80FAFC0(void)
{
    u8 r4;

    if (gUnknown_020388CC->unk6E > 15)
        return 0;
    gUnknown_020388CC->unk6E++;
    if (gUnknown_020388CC->unk6E == 16)
    {
        gUnknown_020388CC->unk44 = 0;
        gUnknown_020388CC->unk48 = 0;
        gUnknown_020388CC->unk5C = gUnknown_020388CC->unk60;
        gUnknown_020388CC->unk5E = gUnknown_020388CC->unk62;
        gUnknown_020388CC->unk4C = (gUnknown_020388CC->unk78 == 0) ? 0x8000 : 0x10000;
        gUnknown_020388CC->unk78 = (gUnknown_020388CC->unk78 == 0) ? 1 : 0;
        gUnknown_020388CC->unk18 = (gUnknown_020388CC->unk78 == 0) ? sub_80FAB78 : sub_80FAD04;
        sub_80FBB3C(gUnknown_020388CC->unk58, gUnknown_020388CC->unk5A);
        sub_80FBE24();
        r4 = 0;
    }
    else
    {
        gUnknown_020388CC->unk3C += gUnknown_020388CC->unk44;
        gUnknown_020388CC->unk40 += gUnknown_020388CC->unk48;
        gUnknown_020388CC->unk5C = gUnknown_020388CC->unk3C >> 8;
        gUnknown_020388CC->unk5E = gUnknown_020388CC->unk40 >> 8;
        gUnknown_020388CC->unk4C += gUnknown_020388CC->unk50;
        if ((gUnknown_020388CC->unk44 < 0 && gUnknown_020388CC->unk5C < gUnknown_020388CC->unk60)
         || (gUnknown_020388CC->unk44 > 0 && gUnknown_020388CC->unk5C > gUnknown_020388CC->unk60))
        {
            gUnknown_020388CC->unk5C = gUnknown_020388CC->unk60;
            gUnknown_020388CC->unk44 = 0;
        }
        if ((gUnknown_020388CC->unk48 < 0 && gUnknown_020388CC->unk5E < gUnknown_020388CC->unk62)
         || (gUnknown_020388CC->unk48 > 0 && gUnknown_020388CC->unk5E > gUnknown_020388CC->unk62))
        {
            gUnknown_020388CC->unk5E = gUnknown_020388CC->unk62;
            gUnknown_020388CC->unk48 = 0;
        }
        if (gUnknown_020388CC->unk78 == 0)
        {
            if (gUnknown_020388CC->unk4C < 0x8000)
            {
                gUnknown_020388CC->unk4C = 0x8000;
                gUnknown_020388CC->unk50 = 0;
            }
        }
        else
        {
            if (gUnknown_020388CC->unk4C > 0x10000)
            {
                gUnknown_020388CC->unk4C = 0x10000;
                gUnknown_020388CC->unk50 = 0;
            }
        }
        r4 = 1;
    }
    sub_80FB170(gUnknown_020388CC->unk5C, gUnknown_020388CC->unk5E, 0x38, 0x48, gUnknown_020388CC->unk4C >> 8, gUnknown_020388CC->unk4C >> 8, 0);
    return r4;
}

void sub_80FB170(s16 a, s16 b, s16 c, s16 d, u16 e, u16 f, u8 g)
{
    s32 var1;
    s32 var2;
    s32 var3;
    s32 var4;

    gUnknown_020388CC->unk2C = e * gSineTable[g + 64] >> 8;
    gUnknown_020388CC->unk30 = e * -gSineTable[g] >> 8;
    gUnknown_020388CC->unk34 = f * gSineTable[g] >> 8;
    gUnknown_020388CC->unk38 = f * gSineTable[g + 64] >> 8;

    var1 = (a << 8) + (c << 8);
    var2 = d * gUnknown_020388CC->unk34 + gUnknown_020388CC->unk2C * c;
    gUnknown_020388CC->unk24 = var1 - var2;

    var3 = (b << 8) + (d << 8);
    var4 = gUnknown_020388CC->unk38 * d + gUnknown_020388CC->unk30 * c;
    gUnknown_020388CC->unk28 = var3 - var4;

    gUnknown_020388CC->unk7D = 1;
}

void sub_80FB238(s16 a, s16 b)
{
    gUnknown_020388CC->unk24 = 0x1C00 + (a << 8);
    gUnknown_020388CC->unk28 = 0x2400 + (b << 8);
    gUnknown_020388CC->unk7D = 1;
}

void sub_80FB260(void)
{
    if (gUnknown_020388CC->unk7D != 0)
    {
        REG_BG2PA = gUnknown_020388CC->unk2C;
        REG_BG2PB = gUnknown_020388CC->unk34;
        REG_BG2PC = gUnknown_020388CC->unk30;
        REG_BG2PD = gUnknown_020388CC->unk38;
        REG_BG2X = gUnknown_020388CC->unk24;
        REG_BG2Y = gUnknown_020388CC->unk28;
        gUnknown_020388CC->unk7D = 0;
    }
}

void sub_80FB2A4(s16 a, s16 b)
{
    sub_80FB170(a, b, 0x38, 0x48, 0x100, 0x100, 0);
    sub_80FB260();
    if (gUnknown_020388CC->unk20 != NULL)
    {
        gUnknown_020388CC->unk20->pos2.x = -a;
        gUnknown_020388CC->unk20->pos2.y = -b;
    }
}

u16 GetRegionMapSectionAt(u16 x, u16 y)
{

    if (y < 2 || y > 16 || x < 1 || x > 0x1C)
        return 0x58;
    y -= 2;
    x -= 1;
    return gRegionMapSections[x + y * 28];
}

void sub_80FB32C(void)
{
    struct MapHeader *mapHeader;
    u16 mapWidth;
    u16 mapHeight;
    u16 x;
    u16 y;
    u16 r1;
    u16 r9;

    if (gSaveBlock1.location.mapGroup == 0x19 && (gSaveBlock1.location.mapNum == 0x29 || gSaveBlock1.location.mapNum == 0x2A || gSaveBlock1.location.mapNum == 0x2B))
    {
        sub_80FB600();
        return;
    }

    switch (get_map_light_level_by_bank_and_number(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum) - 1)
    {
    default:
    case 0:
    case 1:
    case 2:
    case 4:
    case 5:
        gUnknown_020388CC->unk14 = gMapHeader.name;
        gUnknown_020388CC->unk7F = 0;
        mapWidth = gMapHeader.mapData->width;
        mapHeight = gMapHeader.mapData->height;
        x = gSaveBlock1.pos.x;
        y = gSaveBlock1.pos.y;
        if (gUnknown_020388CC->unk14 == 0x45)
            gUnknown_020388CC->unk7F = 1;
        break;
    case 3:
    case 6:
        mapHeader = get_mapheader_by_bank_and_number(gSaveBlock1.warp4.mapGroup, gSaveBlock1.warp4.mapNum);
        gUnknown_020388CC->unk14 = mapHeader->name;
        gUnknown_020388CC->unk7F = 1;
        mapWidth = mapHeader->mapData->width;
        mapHeight = mapHeader->mapData->height;
        x = gSaveBlock1.warp4.x;
        y = gSaveBlock1.warp4.y;
        break;
    case 8:
        mapHeader = get_mapheader_by_bank_and_number(gSaveBlock1.warp2.mapGroup, gSaveBlock1.warp2.mapNum);
        gUnknown_020388CC->unk14 = mapHeader->name;
        gUnknown_020388CC->unk7F = 1;
        mapWidth = mapHeader->mapData->width;
        mapHeight = mapHeader->mapData->height;
        x = gSaveBlock1.warp2.x;
        y = gSaveBlock1.warp2.y;
        break;
    case 7:
        {
            struct WarpData *r4;

            gUnknown_020388CC->unk14 = gMapHeader.name;
            if (gUnknown_020388CC->unk14 != 0x57)
            {
                r4 = &gSaveBlock1.warp4;
                mapHeader = get_mapheader_by_bank_and_number(r4->mapGroup, r4->mapNum);
            }
            else
            {
                r4 = &gSaveBlock1.warp2;
                mapHeader = get_mapheader_by_bank_and_number(r4->mapGroup, r4->mapNum);
                gUnknown_020388CC->unk14 = mapHeader->name;
            }
            gUnknown_020388CC->unk7F = 0;
            mapWidth = mapHeader->mapData->width;
            mapHeight = mapHeader->mapData->height;
            x = r4->x;
            y = r4->y;
        }
        break;
    }

    r9 = x;

    r1 = mapWidth / gRegionMapLocations[gUnknown_020388CC->unk14].width;
    if (r1 == 0)
        r1 = 1;
    x /= r1;
    if (x >= gRegionMapLocations[gUnknown_020388CC->unk14].width)
        x = gRegionMapLocations[gUnknown_020388CC->unk14].width - 1;

    r1 = mapHeight / gRegionMapLocations[gUnknown_020388CC->unk14].height;
    if (r1 == 0)
        r1 = 1;
    y /= r1;
    if (y >= gRegionMapLocations[gUnknown_020388CC->unk14].height)
        y = gRegionMapLocations[gUnknown_020388CC->unk14].height - 1;

    switch (gUnknown_020388CC->unk14)
    {
    case 0x1D:
        if (y != 0)
            x = 0;
        break;
    case 0x29:
    case 0x33:
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
    case 0x24:
        x = 0;
        if (r9 > 14)
            x = 1;
        if (r9 > 0x1C)
            x++;
        if (r9 > 0x36)
            x++;
        break;
    }
    gUnknown_020388CC->unk54 = gRegionMapLocations[gUnknown_020388CC->unk14].x + x + 1;
    gUnknown_020388CC->unk56 = gRegionMapLocations[gUnknown_020388CC->unk14].y + y + 2;
}

void sub_80FB600(void)
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
        gUnknown_020388CC->unk14 = 8;
        break;
    case 2:
        gUnknown_020388CC->unk14 = 12;
        break;
    case 3:
        gUnknown_020388CC->unk14 = 0x27;
        break;
    case 4:
        gUnknown_020388CC->unk14 = 0x2E;
        break;
    default:
    case 0:
        {
            struct MapHeader *mapHeader = get_mapheader_by_bank_and_number(mapGroup, mapNum);
            u16 r1;

            gUnknown_020388CC->unk14 = mapHeader->name;
            r1 = mapHeader->mapData->width / gRegionMapLocations[gUnknown_020388CC->unk14].width;
            if (r1 == 0)
                r1 = 1;
            x = sp2 / r1;
            if (x >= gRegionMapLocations[gUnknown_020388CC->unk14].width)
                x = gRegionMapLocations[gUnknown_020388CC->unk14].width - 1;

            r1 = mapHeader->mapData->height / gRegionMapLocations[gUnknown_020388CC->unk14].height;
            if (r1 == 0)
                r1 = 1;
            y = sp4 / r1;
            if (y >= gRegionMapLocations[gUnknown_020388CC->unk14].height)
                y = gRegionMapLocations[gUnknown_020388CC->unk14].height - 1;
        }
        break;
    }
    gUnknown_020388CC->unk7F = 0;
    gUnknown_020388CC->unk54 = gRegionMapLocations[gUnknown_020388CC->unk14].x + x + 1;
    gUnknown_020388CC->unk56 = gRegionMapLocations[gUnknown_020388CC->unk14].y + y + 2;
}

u16 sub_80FB758(u16 a)
{
    switch (a)
    {
    case 88:
        return 0;
    case 0:
        return FlagGet(0x80F) ? 2 : 3;
    case 1:
        return FlagGet(0x810) ? 2 : 3;
    case 2:
        return FlagGet(0x811) ? 2 : 3;
    case 3:
        return FlagGet(0x812) ? 2 : 3;
    case 4:
        return FlagGet(0x813) ? 2 : 3;
    case 5:
        return FlagGet(0x814) ? 2 : 3;
    case 6:
        return FlagGet(0x815) ? 2 : 3;
    case 7:
        return FlagGet(0x816) ? 2 : 3;
    case 8:
        return FlagGet(0x817) ? 2 : 3;
    case 9:
        return FlagGet(0x818) ? 2 : 3;
    case 10:
        return FlagGet(0x819) ? 2 : 3;
    case 11:
        return FlagGet(0x81A) ? 2 : 3;
    case 12:
        return FlagGet(0x81B) ? 2 : 3;
    case 13:
        return FlagGet(0x81C) ? 2 : 3;
    case 14:
        return FlagGet(0x81D) ? 2 : 3;
    case 15:
        return FlagGet(0x81E) ? 2 : 3;
    case 58:
        return FlagGet(0x848) ? 4 : 0;
    case 73:
        return FlagGet(0x849) ? 1 : 0;
    default:
        return 1;
    }
}

u16 GetRegionMapSectionAt_(u16 x, u16 y)
{
    return GetRegionMapSectionAt(x, y);
}

u16 sub_80FB9C0(u16 a)
{
    u16 i = 0;

    while (gUnknown_083E7684[i][0] != 88)
    {
        if (gUnknown_083E7684[i][0] == a)
            return gUnknown_083E7684[i][1];
        i++;
    }
    return a;
}

u16 sub_80FBA04(u16 a)
{
    return sub_80FB9C0(a);
}

void sub_80FBA18(void)
{
    u16 x;
    u16 y;
    u16 i;

    if (gUnknown_020388CC->unk14 == 88)
    {
        gUnknown_020388CC->unk17 = 0;
        return;
    }

    if (gUnknown_020388CC->unk78 == 0)
    {
        x = gUnknown_020388CC->unk54;
        y = gUnknown_020388CC->unk56;
    }
    else
    {
        x = gUnknown_020388CC->unk64;
        y = gUnknown_020388CC->unk66;
    }

    i = 0;
    while (1)
    {
        if (x <= 1)
        {
            if (sub_80FBAA0(y) != 0)
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
            if (GetRegionMapSectionAt(x, y) == gUnknown_020388CC->unk14)
                i++;
        }
    }

    gUnknown_020388CC->unk17 = i;
}

u8 sub_80FBAA0(u16 a)
{
    u16 x;
    u16 y;

    y = a - 1;
    if (y == 0xFFFF)
        return 0;

    x = 1;
    while (x < 0x1D)
    {
        if (GetRegionMapSectionAt(x, y) == gUnknown_020388CC->unk14)
            return 1;
        x++;
    }
    return 0;
}



const struct OamData gOamData_83E76B8 =
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

const union AnimCmd gSpriteAnim_83E76C0[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_83E76CC[] =
{
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_FRAME(16, 10),
    ANIMCMD_FRAME(32, 10),
    ANIMCMD_FRAME(16, 10),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83E76E0[] =
{
    gSpriteAnim_83E76C0,
    gSpriteAnim_83E76CC,
};

void sub_80FBAF0(struct Sprite *sprite)
{
    if (gUnknown_020388CC->unk7A != 0)
    {
        sprite->pos1.x += gUnknown_020388CC->unk7B * 2;
        sprite->pos1.y += gUnknown_020388CC->unk7C * 2;
        gUnknown_020388CC->unk7A--;
    }
}

void nullsub_66(struct Sprite *sprite)
{
}

void sub_80FBB3C(u16 tileTag, u16 paletteTag)
{
    u8 spriteId;
    struct SpriteSheet spriteSheet;
    struct SpritePalette spritePalette =
    {
        .data = gPokenavCursor_Pal,
    };
    struct SpriteTemplate spriteTemplate =
    {
        .oam = &gOamData_83E76B8,
        .anims = gSpriteAnimTable_83E76E0,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_80FBAF0,
    };

    spriteSheet.tag = tileTag;
    spriteTemplate.tileTag = tileTag;
    gUnknown_020388CC->unk58 = tileTag;

    spritePalette.tag = paletteTag;
    spriteTemplate.paletteTag = paletteTag;
    gUnknown_020388CC->unk5A = paletteTag;

    if (gUnknown_020388CC->unk78 == 0)
    {
        spriteSheet.data = gUnknown_020388CC->unk180;
        spriteSheet.size = 0x100;
        spriteTemplate.callback = sub_80FBAF0;
    }
    else
    {
        spriteSheet.data = gUnknown_020388CC->unk280;
        spriteSheet.size = 0x600;
        spriteTemplate.callback = nullsub_66;
    }
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&spriteTemplate, 0x38, 0x48, 0);
    if (spriteId != 64)
    {
        gUnknown_020388CC->unk1C = &gSprites[spriteId];
        if (gUnknown_020388CC->unk78 == 1)
        {
            gUnknown_020388CC->unk1C->oam.size = 2;
            gUnknown_020388CC->unk1C->pos1.x -= 8;
            gUnknown_020388CC->unk1C->pos1.y -= 8;
            StartSpriteAnim(gUnknown_020388CC->unk1C, 1);
        }
        else
        {
            gUnknown_020388CC->unk1C->oam.size = 1;
            gUnknown_020388CC->unk1C->pos1.x = gUnknown_020388CC->unk54 * 8 + 4;
            gUnknown_020388CC->unk1C->pos1.y = gUnknown_020388CC->unk56 * 8 + 4;
        }
        gUnknown_020388CC->unk1C->data1 = 2;
        gUnknown_020388CC->unk1C->data2 = IndexOfSpritePaletteTag(paletteTag) * 16 + 0x0101;
        gUnknown_020388CC->unk1C->data3 = 1;
    }
}

void sub_80FBCA0(void)
{
    if (gUnknown_020388CC->unk1C != NULL)
    {
        DestroySprite(gUnknown_020388CC->unk1C);
        FreeSpriteTilesByTag(gUnknown_020388CC->unk58);
        FreeSpritePaletteByTag(gUnknown_020388CC->unk5A);
    }
}

void unref_sub_80FBCD0(void)
{
    gUnknown_020388CC->unk1C->data3 = 1;
}

void unref_sub_80FBCE0(void)
{
    gUnknown_020388CC->unk1C->data3 = 0;
}

const struct OamData gOamData_083E7708 =
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

const union AnimCmd gSpriteAnim_83E7710[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_083E7718[] =
{
    gSpriteAnim_83E7710,
};

void sub_80FBCF0(u16 tileTag, u16 paletteTag)
{
    u8 spriteId;
    struct SpriteSheet spriteSheet =
    {
        .data = gRegionMapBrendanIconTiles,
        .size = 128,
        .tag = tileTag,
    };
    struct SpritePalette spritePalette =
    {
        .data = gRegionMapBrendanIconPalette,
        .tag = paletteTag,
    };
    struct SpriteTemplate spriteTemplate =
    {
        .tileTag = tileTag,
        .paletteTag = paletteTag,
        .oam = &gOamData_083E7708,
        .anims = gSpriteAnimTable_083E7718,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };

    if (gSaveBlock2.playerGender == FEMALE)
    {
        spriteSheet.data = gRegionMapMayIconTiles;
        spritePalette.data = gRegionMapMayIconPalette;
    }
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&spriteTemplate, 0, 0, 1);
    gUnknown_020388CC->unk20 = &gSprites[spriteId];
    if (gUnknown_020388CC->unk78 == 0)
    {
        gUnknown_020388CC->unk20->pos1.x = gUnknown_020388CC->unk74 * 8 + 4;
        gUnknown_020388CC->unk20->pos1.y = gUnknown_020388CC->unk76 * 8 + 4;
        gUnknown_020388CC->unk20->callback = sub_80FBF34;
    }
    else
    {
        gUnknown_020388CC->unk20->pos1.x = gUnknown_020388CC->unk74 * 16 - 48;
        gUnknown_020388CC->unk20->pos1.y = gUnknown_020388CC->unk76 * 16 - 66;
        gUnknown_020388CC->unk20->callback = sub_80FBEA4;
    }
}

void sub_80FBDF8(void)
{
    if (gUnknown_020388CC->unk20 != NULL)
    {
        gUnknown_020388CC->unk20->invisible = TRUE;
        gUnknown_020388CC->unk20->callback = SpriteCallbackDummy;
    }
}

void sub_80FBE24(void)
{
    if (gUnknown_020388CC->unk20 != NULL)
    {
        if (gUnknown_020388CC->unk78 == 1)
        {
            gUnknown_020388CC->unk20->pos1.x = gUnknown_020388CC->unk74 * 16 - 48;
            gUnknown_020388CC->unk20->pos1.y = gUnknown_020388CC->unk76 * 16 - 66;
            gUnknown_020388CC->unk20->callback = sub_80FBEA4;
            gUnknown_020388CC->unk20->invisible = FALSE;
        }
        else
        {
            gUnknown_020388CC->unk20->pos1.x = gUnknown_020388CC->unk74 * 8 + 4;
            gUnknown_020388CC->unk20->pos1.y = gUnknown_020388CC->unk76 * 8 + 4;
            gUnknown_020388CC->unk20->pos2.x = 0;
            gUnknown_020388CC->unk20->pos2.y = 0;
            gUnknown_020388CC->unk20->callback = sub_80FBF34;
            gUnknown_020388CC->unk20->invisible = FALSE;
        }
    }
}

void sub_80FBEA4(struct Sprite *sprite)
{
    sprite->pos2.x = -(gUnknown_020388CC->unk5C * 2);
    sprite->pos2.y = -(gUnknown_020388CC->unk5E * 2);
    sprite->data0 = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY;
    sprite->data1 = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX;

    if (sprite->data0 < -8 || sprite->data0 > 0xA8 || sprite->data1 < -8 || sprite->data1 > 0xF8)
        sprite->data2 = 0;
    else
        sprite->data2 = 1;

    if (sprite->data2 == 1)
        sub_80FBF40(sprite);
    else
        sprite->invisible = TRUE;
}

void sub_80FBF34(struct Sprite *sprite)
{
    sub_80FBF40(sprite);
}

void sub_80FBF40(struct Sprite *sprite)
{
    if (gUnknown_020388CC->unk7E != 0)
    {
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
    if (gUnknown_020388CC->unk7F != 0)
        gUnknown_020388CC->unk7E = 1;
}

const u8 *sub_80FBFB4(u8 *dest, u16 b, u16 length)
{
    if (b == 86)
        return GetSecretBaseMapName(dest);
    if (b < 88)
        return StringCopy(dest, gRegionMapLocations[b].name);
    if (length == 0)
        length = 18;
    return StringFill(dest, CHAR_SPACE, length);
}

const u8 *CopyMapName(u8 *dest, u16 b)
{
    switch (b)
    {
    case 87:
        return StringCopy(dest, gOtherText_Ferry);
    case 86:
        return StringCopy(dest, gOtherText_SecretBase);
    default:
        return sub_80FBFB4(dest, b, 0);
    }
}

const u8 *CopyLocationName(u8 *dest, u16 b)
{
    if (b == 66)
        return StringCopy(dest, gOtherText_Hideout);
    else
        return CopyMapName(dest, b);
}

void sub_80FC04C(u16 a, u16 *x, u16 *y, u16 *width, u16 *height)
{
    *x = gRegionMapLocations[a].x;
    *y = gRegionMapLocations[a].y;
    *width = gRegionMapLocations[a].width;
    *height = gRegionMapLocations[a].height;
}

struct UnknownStruct3
{
    void (*unk0)(void);
    u16 unk4;
    u16 unk6;
    struct UnknownStruct1 unk8;
};

extern u8 ewram[];
#define ewram0 (*(struct UnknownStruct3 *)(ewram + 0))
#define ewram888 (ewram + 0x888)
#define ewramA6E (ewram[0xA6E])
#define ewramA48 (ewram + 0xA48)

const u16 gUnknown_083E771C[] = INCBIN_U16("graphics/pokenav/map_frame.gbapal");
const u8 gUnknown_083E773C[] = INCBIN_U8("graphics/pokenav/map_frame.4bpp.lz");
const u8 gUnknown_083E7774[] = INCBIN_U8("graphics/pokenav/map_frame.bin.lz");
const u16 gPokenavMapMisc_Pal[] = INCBIN_U16("graphics/pokenav/map_misc.gbapal");
const u8 gUnknown_083E784C[] = INCBIN_U8("graphics/pokenav/map_misc.4bpp.lz");

const u8 gUnknown_083E7920[][3] =
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
    u16 unk4;
    u16 unk6;
};

const u8 *const Unknown_3E79B8[] = {OtherText_PokeLeague, OtherText_PokeCenter};

const struct UnknownStruct4 gUnknown_083E79C0[1] =
{
    {Unknown_3E79B8, 15, 0x854},
};

// XXX: what is this?
static u8 *const ewram_ = ewram;

const struct SpritePalette gUnknown_083E79CC = {gPokenavMapMisc_Pal, 2};

const u16 gUnknown_083E79D4[][2] =
{
    {0x848, 58},
    {0xFFFF, 88},
};

const struct OamData gOamData_83E79DC =
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

const union AnimCmd gSpriteAnim_83E79E4[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E79EC[] =
{
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E79F4[] =
{
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E79FC[] =
{
    ANIMCMD_FRAME(5, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E7A04[] =
{
    ANIMCMD_FRAME(6, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E7A0C[] =
{
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83E7A14[] =
{
    ANIMCMD_FRAME(10, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83E7A1C[] =
{
    gSpriteAnim_83E79E4,
    gSpriteAnim_83E79EC,
    gSpriteAnim_83E79F4,
    gSpriteAnim_83E79FC,
    gSpriteAnim_83E7A04,
    gSpriteAnim_83E7A0C,
    gSpriteAnim_83E7A14,
};

const struct SpriteTemplate gSpriteTemplate_83E7A38 =
{
    .tileTag = 2,
    .paletteTag = 2,
    .oam = &gOamData_83E79DC,
    .anims = gSpriteAnimTable_83E7A1C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

void sub_80FC074(void)
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
        sub_80FA8EC(&ewram0.unk8, 0);
        sub_80FBB3C(0, 0);
        sub_80FBCF0(1, 1);
        ewram0.unk6 = ewram0.unk8.unk14;
        StringFill(ewramA48, CHAR_SPACE, 12);
        sub_80FC254();
        break;
    case 4:
        LZ77UnCompVram(gUnknown_083E773C, (void *)(VRAM + 0xC000));
        break;
    case 5:
        LZ77UnCompVram(gUnknown_083E7774, (void *)(VRAM + 0xF000));
        break;
    case 6:
        LoadPalette(gUnknown_083E771C, 16, 32);
        MenuPrint_PixelCoords(gOtherText_FlyToWhere, 1, 0x90, 1);
        break;
    case 7:
        sub_80FC31C();
        break;
    case 8:
        BlendPalettes(0xFFFFFFFF, 16, 0);
        SetVBlankCallback(sub_80FC214);
        break;
    case 9:
        REG_BLDCNT = 0;
        REG_BG1CNT = 0x1E0D;
        REG_DISPCNT = 0x1741;
        sub_80FC244(sub_80FC5B4);
        SetMainCallback2(sub_80FC228);
        break;
    default:
        return;
    }
    gMain.state++;
}

void sub_80FC214(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_80FC228(void)
{
    ewram0.unk0();
    AnimateSprites();
    BuildOamBuffer();
}

void sub_80FC244(void (*func)(void))
{
    ewram0.unk0 = func;
    ewram0.unk4 = 0;
}

void sub_80FC254(void)
{
    if (ewram0.unk8.unk16 == 2 || ewram0.unk8.unk16 == 4)
    {
        u16 i = 0;
        int zero;

        for (i = 0; i < 1; i++)
        {
            const struct UnknownStruct4 *r4 = &gUnknown_083E79C0[i];

            if (ewram0.unk8.unk14 == r4->unk4)
            {
                if (FlagGet(r4->unk6))
                {
                    MenuDrawTextWindow(16, 14, 29, 19);
                    MenuPrint(ewram0.unk8.filler0, 17, 15);
                    MenuPrint_RightAligned(r4->unk0[ewram0.unk8.unk17], 29, 17);
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
            MenuPrint(ewram0.unk8.filler0, 17, 17);
            MenuZeroFillWindowRect(16, 14, 29, 15);
        }
    }
    else
    {
        MenuDrawTextWindow(16, 16, 29, 19);
        MenuPrint(ewramA48, 17, 17);
        MenuZeroFillWindowRect(16, 14, 29, 15);
    }
}

void sub_80FC31C(void)
{
    struct SpriteSheet spriteSheet;

    LZ77UnCompWram(gUnknown_083E784C, ewram888);
    spriteSheet.data = ewram888;
    spriteSheet.size = 0x1C0;
    spriteSheet.tag = 2;
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&gUnknown_083E79CC);
    sub_80FC374();
    sub_80FC484();
}

void sub_80FC374(void)
{
    u16 flag = 0x80F;
    u16 i;

    for (i = 0; i < 16; i++)
    {
        u16 x;
        u16 y;
        u16 width;
        u16 height;
        u16 r7;
        u8 spriteId;

        sub_80FC04C(i, &x, &y, &width, &height);
        x = (x + 1) * 8 + 4;
        y = (y + 2) * 8 + 4;
        if (width == 2)
            r7 = 1;
        else if (height == 2)
            r7 = 2;
        else
            r7 = 0;
        spriteId = CreateSprite(&gSpriteTemplate_83E7A38, x, y, 10);
        if (spriteId != 64)
        {
            gSprites[spriteId].oam.shape = r7;
            if (FlagGet(flag))
                gSprites[spriteId].callback = sub_80FC55C;
            else
                r7 += 3;
            StartSpriteAnim(&gSprites[spriteId], r7);
            gSprites[spriteId].data0 = i;
        }
        flag++;
    }
}

void sub_80FC484(void)
{
    u16 i;

    for (i = 0; gUnknown_083E79D4[i][1] != 88; i++)
    {
        u16 x;
        u16 y;
        u16 width;
        u16 height;

        if (FlagGet(gUnknown_083E79D4[i][0]))
        {
            u16 r6 = gUnknown_083E79D4[i][1];
            u8 spriteId;

            sub_80FC04C(r6, &x, &y, &width, &height);
            x = (x + 1) * 8;
            y = (y + 2) * 8;
            spriteId = CreateSprite(&gSpriteTemplate_83E7A38, x, y, 10);
            if (spriteId != 64)
            {
                gSprites[spriteId].oam.size = 1;
                gSprites[spriteId].callback = sub_80FC55C;
                StartSpriteAnim(&gSprites[spriteId], 6);
                gSprites[spriteId].data0 = r6;
            }
        }
    }
}

void sub_80FC55C(struct Sprite *sprite)
{
    if (ewram0.unk8.unk14 == sprite->data0)
    {
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

void sub_80FC5B4(void)
{
    switch (ewram0.unk4)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        ewram0.unk4++;
        break;
    case 1:
        if (UpdatePaletteFade() != 0)
            break;
        sub_80FC244(sub_80FC600);
        break;
    }
}

void sub_80FC600(void)
{
    if (ewram0.unk4 == 0)
    {
        switch (sub_80FAB60())
        {
        case 0:
        case 1:
        case 2:
            break;
        case 3:
            sub_80FC254();
            break;
        case 4:
            if (ewram0.unk8.unk16 == 2 || ewram0.unk8.unk16 == 4)
            {
                m4aSongNumStart(SE_SELECT);
                ewramA6E = 1;
                sub_80FC244(sub_80FC69C);
            }
            break;
        case 5:
            m4aSongNumStart(SE_SELECT);
            ewramA6E = 0;
            sub_80FC244(sub_80FC69C);
            break;
        }
    }
}

void sub_80FC69C(void)
{
    switch (ewram0.unk4)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        ewram0.unk4++;
        break;
    case 1:
        if (UpdatePaletteFade() != 0)
            break;
        sub_80FAB10();
        if (ewramA6E != 0)
        {
            switch (ewram0.unk8.unk14)
            {
            case 0x49:
                sub_8053538(22);
                break;
            case 0x3A:
                sub_8053538(21);
                break;
            case 0:
                sub_8053538((gSaveBlock2.playerGender == MALE) ? 12 : 13);
                break;
            case 15:
                sub_8053538((FlagGet(0x854) && ewram0.unk8.unk17 == 0) ? 20 : 11);
                break;
            default:
                if (gUnknown_083E7920[ewram0.unk8.unk14][2] != 0)
                    sub_8053538(gUnknown_083E7920[ewram0.unk8.unk14][2]);
                else
                    warp1_set_2(gUnknown_083E7920[ewram0.unk8.unk14][0], gUnknown_083E7920[ewram0.unk8.unk14][1], -1);
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
