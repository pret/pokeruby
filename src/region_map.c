#include "global.h"
#include "main.h"
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
    u8 filler24[0x18];
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
u8 _swiopen(void);
u8 sub_80FAD04(void);
u8 sub_80FADE4(void);
void sub_80FB170(int, int, int, int, u16, u16, int);
void sub_80FB238();
void sub_80FB260(void);
u16 GetRegionMapSectionAt();
void sub_80FB32C(void);
u16 sub_80FB758();
u16 sub_80FB9C0(u16);
void sub_80FBA18();
void sub_80FBB3C();
void sub_80FBCA0(void);
void sub_80FBDF8(void);
void sub_80FBE24(void);
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
        sub_80FBFB4(gUnknown_020388CC, gUnknown_020388CC->unk14, 16);
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
                sub_80FBFB4(gUnknown_020388CC, gUnknown_020388CC->unk14, 16);
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
