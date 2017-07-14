#include "global.h"
#include "palette.h"
#include "sprite.h"

struct UnknownStruct1
{
    u8 filler0[0x14];
    u16 unk14;
    u8 unk16;
    u8 filler17[1];
    u8 (*unk18)(void);
    struct Sprite *unk1C;
    struct Sprite *unk20;
    u8 filler24[0x30];
    u16 unk54;
    u16 unk56;
    u16 unk58;
    u16 unk5A;
    s16 unk5C;
    s16 unk5E;
    u8 filler60[4];
    u16 unk64;
    u16 unk66;
    u8 filler68[8];
    u16 unk70;
    u16 unk72;
    u16 unk74;
    u16 unk76;
    u8 unk78;
    u8 unk79;
    u8 unk7A;
    u8 filler7B[3];
    u8 unk7E;
    u8 filler7F[0x101];
    u8 unk180[0x100];
    u8 unk280[0x100];
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

void sub_80FA904(struct UnknownStruct1 *, u8);
bool8 sub_80FA940(void);
u8 sub_80FAB78(void);
u8 sub_80FAD04(void);
void sub_80FB170();
void sub_80FB260(void);
void sub_80FB32C(void);
u16 sub_80FB758();
u16 sub_80FB9C0(u16);
void sub_80FBA18();
void sub_80FBFB4();

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
        sub_80FBFB4(gUnknown_020388CC, gUnknown_020388CC->unk14, 16);
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
