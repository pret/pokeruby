#include "global.h"
#include "tileset_anim.h"

struct Dma
{
    const void *src;
    const void *dest;
    u16 size;
};

EWRAM_DATA static struct Dma gTilesetAnimDmas[20] = {0};

static u8 gNumTilesetAnimDmas;
static u16 gTileset1AnimFrame;
static u16 gTileset1AnimLength;
static u16 gTileset2AnimFrame;
static u16 gTileset2AnimLength;
static void (*gTileset1AnimCallback)(u16);
static void (*gTileset2AnimCallback)(u16);

static void StartTileset1Animation(void);
static void StartTileset2Animation(void);

static void sub_8073014(u16);
static void sub_8073058(u16);

static void sub_8073070(u16);
static void sub_8073098(u16);
static void sub_80730C0(u16);
static void sub_80730E8(u16);
static void sub_807361C(u16);

static void sub_8073424(u16);
static void sub_80734A0(u16);
static void sub_8073514(u16);
static void sub_8073540(u16);
static void sub_80735B4(u16);
static void sub_80735E4(u16);
static void sub_80738A8(u16);
static void sub_8073600(u16);
static void sub_80738C0(u16);
static void sub_8073890(u16);
static void sub_80738EC(u16);

static void sub_80737A4(u16, u8);
static void sub_80737E0(u16);
static void sub_8073704(u16, u8);
static void sub_8073644(u8);
static void sub_8073808(u16);
static void sub_8073830(u16, u8);
static void sub_807368C(u8);
static void sub_80736DC(u8);
static void sub_80736B4(u8);
static void sub_8073868(u16);

static void sub_8073904(u16);
static void sub_80739C4(u16);
static void sub_807392C(u16);
static void sub_807399C(u16);
static void sub_8073974(u16);
static void sub_80739EC(u16);

static const u8 gTilesetAnims_General0_Frame1[] = INCBIN_U8("data/tilesets/primary/general/anim/0/1.4bpp");
static const u8 gTilesetAnims_General0_Frame0[] = INCBIN_U8("data/tilesets/primary/general/anim/0/0.4bpp");
static const u8 gTilesetAnims_General0_Frame2[] = INCBIN_U8("data/tilesets/primary/general/anim/0/2.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnims_General0[] =
{
    gTilesetAnims_General0_Frame0,
    gTilesetAnims_General0_Frame1,
    gTilesetAnims_General0_Frame0,
    gTilesetAnims_General0_Frame2,
};

static const u8 gTilesetAnims_General1_Frame0[] = INCBIN_U8("data/tilesets/primary/general/anim/1/0.4bpp");
static const u8 gTilesetAnims_General1_Frame1[] = INCBIN_U8("data/tilesets/primary/general/anim/1/1.4bpp");
static const u8 gTilesetAnims_General1_Frame2[] = INCBIN_U8("data/tilesets/primary/general/anim/1/2.4bpp");
static const u8 gTilesetAnims_General1_Frame3[] = INCBIN_U8("data/tilesets/primary/general/anim/1/3.4bpp");
static const u8 gTilesetAnims_General1_Frame4[] = INCBIN_U8("data/tilesets/primary/general/anim/1/4.4bpp");
static const u8 gTilesetAnims_General1_Frame5[] = INCBIN_U8("data/tilesets/primary/general/anim/1/5.4bpp");
static const u8 gTilesetAnims_General1_Frame6[] = INCBIN_U8("data/tilesets/primary/general/anim/1/6.4bpp");
static const u8 gTilesetAnims_General1_Frame7[] = INCBIN_U8("data/tilesets/primary/general/anim/1/7.4bpp");

static const u8 *const gTilesetAnims_General1[] =
{
    gTilesetAnims_General1_Frame0,
    gTilesetAnims_General1_Frame1,
    gTilesetAnims_General1_Frame2,
    gTilesetAnims_General1_Frame3,
    gTilesetAnims_General1_Frame4,
    gTilesetAnims_General1_Frame5,
    gTilesetAnims_General1_Frame6,
    gTilesetAnims_General1_Frame7,
};

static const u8 gTilesetAnims_General2_Frame0[] = INCBIN_U8("data/tilesets/primary/general/anim/2/0.4bpp");
static const u8 gTilesetAnims_General2_Frame1[] = INCBIN_U8("data/tilesets/primary/general/anim/2/1.4bpp");
static const u8 gTilesetAnims_General2_Frame2[] = INCBIN_U8("data/tilesets/primary/general/anim/2/2.4bpp");
static const u8 gTilesetAnims_General2_Frame3[] = INCBIN_U8("data/tilesets/primary/general/anim/2/3.4bpp");
static const u8 gTilesetAnims_General2_Frame4[] = INCBIN_U8("data/tilesets/primary/general/anim/2/4.4bpp");
static const u8 gTilesetAnims_General2_Frame5[] = INCBIN_U8("data/tilesets/primary/general/anim/2/5.4bpp");
static const u8 gTilesetAnims_General2_Frame6[] = INCBIN_U8("data/tilesets/primary/general/anim/2/6.4bpp");

static const u8 *const gTilesetAnims_General2[] =
{
    gTilesetAnims_General2_Frame0,
    gTilesetAnims_General2_Frame1,
    gTilesetAnims_General2_Frame2,
    gTilesetAnims_General2_Frame3,
    gTilesetAnims_General2_Frame4,
    gTilesetAnims_General2_Frame5, 
    gTilesetAnims_General2_Frame6,
    gTilesetAnims_General2_Frame0,
};

static const u8 gTilesetAnims_General3_Frame0[] = INCBIN_U8("data/tilesets/primary/general/anim/3/0.4bpp");
static const u8 gTilesetAnims_General3_Frame1[] = INCBIN_U8("data/tilesets/primary/general/anim/3/1.4bpp");
static const u8 gTilesetAnims_General3_Frame2[] = INCBIN_U8("data/tilesets/primary/general/anim/3/2.4bpp");
static const u8 gTilesetAnims_General3_Frame3[] = INCBIN_U8("data/tilesets/primary/general/anim/3/3.4bpp");

static const u8 *const gTilesetAnims_General3[] =
{
    gTilesetAnims_General3_Frame0,
    gTilesetAnims_General3_Frame1,
    gTilesetAnims_General3_Frame2,
    gTilesetAnims_General3_Frame3,
};

static const u8 gTilesetAnims_General4_Frame0[] = INCBIN_U8("data/tilesets/primary/general/anim/4/0.4bpp");
static const u8 gTilesetAnims_General4_Frame1[] = INCBIN_U8("data/tilesets/primary/general/anim/4/1.4bpp");
static const u8 gTilesetAnims_General4_Frame2[] = INCBIN_U8("data/tilesets/primary/general/anim/4/2.4bpp");
static const u8 gTilesetAnims_General4_Frame3[] = INCBIN_U8("data/tilesets/primary/general/anim/4/3.4bpp");

static const u8 *const gTilesetAnims_General4[] =
{
    gTilesetAnims_General4_Frame0,
    gTilesetAnims_General4_Frame1,
    gTilesetAnims_General4_Frame2,
    gTilesetAnims_General4_Frame3,
};

static const u8 gTilesetAnims_Lavaridge0_Frame0[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/0.4bpp");
static const u8 gTilesetAnims_Lavaridge0_Frame1[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/1.4bpp");
static const u8 gTilesetAnims_Lavaridge0_Frame2[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/2.4bpp");
static const u8 gTilesetAnims_Lavaridge0_Frame3[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/3.4bpp");

static const u8 *const gTilesetAnims_Lavaridge0[] =
{
    gTilesetAnims_Lavaridge0_Frame0,
    gTilesetAnims_Lavaridge0_Frame1,
    gTilesetAnims_Lavaridge0_Frame2,
    gTilesetAnims_Lavaridge0_Frame3,
};

static const u8 gTilesetAnims_Pacifidlog0_Frame0[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/0/0.4bpp");
static const u8 gTilesetAnims_Pacifidlog0_Frame1[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/0/1.4bpp");
static const u8 gTilesetAnims_Pacifidlog0_Frame2[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/0/2.4bpp");

static const u8 *const gTilesetAnims_Pacifidlog0[] =
{
    gTilesetAnims_Pacifidlog0_Frame0,
    gTilesetAnims_Pacifidlog0_Frame1,
    gTilesetAnims_Pacifidlog0_Frame2,
    gTilesetAnims_Pacifidlog0_Frame1,
};

static const u8 gTilesetAnims_Underwater0_Frame0[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/0.4bpp");
static const u8 gTilesetAnims_Underwater0_Frame1[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/1.4bpp");
static const u8 gTilesetAnims_Underwater0_Frame2[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/2.4bpp");
static const u8 gTilesetAnims_Underwater0_Frame3[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/3.4bpp");

static const u8 *const gTilesetAnims_Underwater0[] =
{
    gTilesetAnims_Underwater0_Frame0,
    gTilesetAnims_Underwater0_Frame1,
    gTilesetAnims_Underwater0_Frame2,
    gTilesetAnims_Underwater0_Frame3
};

static const u8 gTilesetAnims_Pacifidlog1_Frame0[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/0.4bpp");
static const u8 gTilesetAnims_Pacifidlog1_Frame1[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/1.4bpp");
static const u8 gTilesetAnims_Pacifidlog1_Frame2[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/2.4bpp");
static const u8 gTilesetAnims_Pacifidlog1_Frame3[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/3.4bpp");
static const u8 gTilesetAnims_Pacifidlog1_Frame4[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/4.4bpp");
static const u8 gTilesetAnims_Pacifidlog1_Frame5[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/5.4bpp");
static const u8 gTilesetAnims_Pacifidlog1_Frame6[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/6.4bpp");
static const u8 gTilesetAnims_Pacifidlog1_Frame7[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/7.4bpp");

static const u8 *const gTilesetAnims_Pacifidlog1[] =
{
    gTilesetAnims_Pacifidlog1_Frame0,
    gTilesetAnims_Pacifidlog1_Frame1,
    gTilesetAnims_Pacifidlog1_Frame2,
    gTilesetAnims_Pacifidlog1_Frame3,
    gTilesetAnims_Pacifidlog1_Frame4,
    gTilesetAnims_Pacifidlog1_Frame5,
    gTilesetAnims_Pacifidlog1_Frame6,
    gTilesetAnims_Pacifidlog1_Frame7
};

static const u8 gTilesetAnims_Mauville0_Frame0[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/0.4bpp");
static const u8 gTilesetAnims_Mauville0_Frame1[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/1.4bpp");
static const u8 gTilesetAnims_Mauville0_Frame2[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/2.4bpp");
static const u8 gTilesetAnims_Mauville0_Frame3[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/3.4bpp");
static const u8 gTilesetAnims_Mauville0_Frame4[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/4.4bpp");

static const u8 gTilesetAnims_Mauville1_Frame0[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/0.4bpp");
static const u8 gTilesetAnims_Mauville1_Frame1[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/1.4bpp");
static const u8 gTilesetAnims_Mauville1_Frame2[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/2.4bpp");
static const u8 gTilesetAnims_Mauville1_Frame3[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/3.4bpp");
static const u8 gTilesetAnims_Mauville1_Frame4[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/4.4bpp");

static const void *const gTilesetAnims_MauvilleVDests0[] =
{
    (void *)(VRAM + 0x4C00),
    (void *)(VRAM + 0x4C80),
    (void *)(VRAM + 0x4D00),
    (void *)(VRAM + 0x4D80),
    (void *)(VRAM + 0x4E00),
    (void *)(VRAM + 0x4E80),
    (void *)(VRAM + 0x4F00),
    (void *)(VRAM + 0x4F80),
};

static const void *const gTilesetAnims_MauvilleVDests1[] =
{
    (void *)(VRAM + 0x5000),
    (void *)(VRAM + 0x5080),
    (void *)(VRAM + 0x5100),
    (void *)(VRAM + 0x5180),
    (void *)(VRAM + 0x5200),
    (void *)(VRAM + 0x5280),
    (void *)(VRAM + 0x5300),
    (void *)(VRAM + 0x5380),
};

static const u8 *const gTilesetAnims_Mauville0[] =
{
    gTilesetAnims_Mauville0_Frame0,
    gTilesetAnims_Mauville0_Frame0,
    gTilesetAnims_Mauville0_Frame1,
    gTilesetAnims_Mauville0_Frame2,
    gTilesetAnims_Mauville0_Frame3,
    gTilesetAnims_Mauville0_Frame3,
    gTilesetAnims_Mauville0_Frame3,
    gTilesetAnims_Mauville0_Frame3,
    gTilesetAnims_Mauville0_Frame3,
    gTilesetAnims_Mauville0_Frame3,
    gTilesetAnims_Mauville0_Frame2,
    gTilesetAnims_Mauville0_Frame1,
};

static const u8 *const gTilesetAnims_Mauville1[] =
{
    gTilesetAnims_Mauville1_Frame0,
    gTilesetAnims_Mauville1_Frame0,
    gTilesetAnims_Mauville1_Frame1,
    gTilesetAnims_Mauville1_Frame2,
    gTilesetAnims_Mauville1_Frame3,
    gTilesetAnims_Mauville1_Frame3,
    gTilesetAnims_Mauville1_Frame3,
    gTilesetAnims_Mauville1_Frame3,
    gTilesetAnims_Mauville1_Frame3,
    gTilesetAnims_Mauville1_Frame3,
    gTilesetAnims_Mauville1_Frame2,
    gTilesetAnims_Mauville1_Frame1,
};

static const u8 *const gTilesetAnims_Mauville2[] =
{
    gTilesetAnims_Mauville0_Frame0,
    gTilesetAnims_Mauville0_Frame0,
    gTilesetAnims_Mauville0_Frame4,
    gTilesetAnims_Mauville0_Frame4,
};

static const u8 *const gTilesetAnims_Mauville3[] =
{
    gTilesetAnims_Mauville1_Frame0,
    gTilesetAnims_Mauville1_Frame0,
    gTilesetAnims_Mauville1_Frame4,
    gTilesetAnims_Mauville1_Frame4,
};

static const u8 gTilesetAnims_Rustboro0_Frame0[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/0.4bpp");
static const u8 gTilesetAnims_Rustboro0_Frame1[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/1.4bpp");
static const u8 gTilesetAnims_Rustboro0_Frame2[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/2.4bpp");
static const u8 gTilesetAnims_Rustboro0_Frame3[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/3.4bpp");
static const u8 gTilesetAnims_Rustboro0_Frame4[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/4.4bpp");
static const u8 gTilesetAnims_Rustboro0_Frame5[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/5.4bpp");
static const u8 gTilesetAnims_Rustboro0_Frame6[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/6.4bpp");
static const u8 gTilesetAnims_Rustboro0_Frame7[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/7.4bpp");

static const void *const gTilesetAnims_RustboroVDests0[] =
{
    (void *)(VRAM + 0x5000),
    (void *)(VRAM + 0x5080),
    (void *)(VRAM + 0x5100),
    (void *)(VRAM + 0x5180),
    (void *)(VRAM + 0x5200),
    (void *)(VRAM + 0x5280),
    (void *)(VRAM + 0x5300),
    (void *)(VRAM + 0x5380),
};

static const u8 *const gTilesetAnims_Rustboro0[] =
{
    gTilesetAnims_Rustboro0_Frame0,
    gTilesetAnims_Rustboro0_Frame1,
    gTilesetAnims_Rustboro0_Frame2,
    gTilesetAnims_Rustboro0_Frame3,
    gTilesetAnims_Rustboro0_Frame4,
    gTilesetAnims_Rustboro0_Frame5,
    gTilesetAnims_Rustboro0_Frame6,
    gTilesetAnims_Rustboro0_Frame7,
};

static const u8 gTilesetAnims_Rustboro1_Frame0[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/1/0.4bpp");
static const u8 gTilesetAnims_Rustboro1_Frame1[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/1/1.4bpp");

static const u8 *const gTilesetAnims_Rustboro1[] =
{
    gTilesetAnims_Rustboro1_Frame0,
    gTilesetAnims_Rustboro1_Frame1,
};

static const u8 gTilesetAnims_Lavaridge1_Cave0_Frame0[] = INCBIN_U8("data/tilesets/secondary/cave/anim/0.4bpp");
static const u8 gTilesetAnims_Lavaridge1_Cave0_Frame1[] = INCBIN_U8("data/tilesets/secondary/cave/anim/1.4bpp");
static const u8 gTilesetAnims_Lavaridge1_Cave0_Frame2[] = INCBIN_U8("data/tilesets/secondary/cave/anim/2.4bpp");
static const u8 gTilesetAnims_Lavaridge1_Cave0_Frame3[] = INCBIN_U8("data/tilesets/secondary/cave/anim/3.4bpp");
// unused anim tiles for cave
static const u8 gTilesetAnims_Lavaridge1_CaveUnused_Frame0[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/0.4bpp");
static const u8 gTilesetAnims_Lavaridge1_CaveUnused_Frame1[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/1.4bpp");
static const u8 gTilesetAnims_Lavaridge1_CaveUnused_Frame2[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/2.4bpp");
static const u8 gTilesetAnims_Lavaridge1_CaveUnused_Frame3[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/3.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnims_Lavaridge1_Cave0[] =
{
    gTilesetAnims_Lavaridge1_Cave0_Frame0,
    gTilesetAnims_Lavaridge1_Cave0_Frame1,
    gTilesetAnims_Lavaridge1_Cave0_Frame2,
    gTilesetAnims_Lavaridge1_Cave0_Frame3,
};

static const u8 gTilesetAnims_EverGrande0_Frame0[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/0.4bpp");
static const u8 gTilesetAnims_EverGrande0_Frame1[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/1.4bpp");
static const u8 gTilesetAnims_EverGrande0_Frame2[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/2.4bpp");
static const u8 gTilesetAnims_EverGrande0_Frame3[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/3.4bpp");
static const u8 gTilesetAnims_EverGrande0_Frame4[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/4.4bpp");
static const u8 gTilesetAnims_EverGrande0_Frame5[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/5.4bpp");
static const u8 gTilesetAnims_EverGrande0_Frame6[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/6.4bpp");
static const u8 gTilesetAnims_EverGrande0_Frame7[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/7.4bpp");
asm(".space 32");

static const void *const gTilesetAnims_EverGrandeVDests0[] =
{
    (void *)(VRAM + 0x5C00),
    (void *)(VRAM + 0x5C80),
    (void *)(VRAM + 0x5D00),
    (void *)(VRAM + 0x5D80),
    (void *)(VRAM + 0x5E00),
    (void *)(VRAM + 0x5E80),
    (void *)(VRAM + 0x5F00),
    (void *)(VRAM + 0x5F80),
};

static const u8 *const gTilesetAnims_EverGrande0[] =
{
    gTilesetAnims_EverGrande0_Frame0,
    gTilesetAnims_EverGrande0_Frame1,
    gTilesetAnims_EverGrande0_Frame2,
    gTilesetAnims_EverGrande0_Frame3,
    gTilesetAnims_EverGrande0_Frame4,
    gTilesetAnims_EverGrande0_Frame5,
    gTilesetAnims_EverGrande0_Frame6,
    gTilesetAnims_EverGrande0_Frame7,
};

static const u8 gTilesetAnims_InsideBuilding0_Frame0[] = INCBIN_U8("data/tilesets/primary/building/anim/0.4bpp");
static const u8 gTilesetAnims_InsideBuilding0_Frame1[] = INCBIN_U8("data/tilesets/primary/building/anim/1.4bpp");

static const u8 *const gTilesetAnims_InsideBuilding0[] =
{
    gTilesetAnims_InsideBuilding0_Frame0,
    gTilesetAnims_InsideBuilding0_Frame1,
};

static const u8 gTilesetAnims_SootopolisGym0_Frame0[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/0/0.4bpp");
static const u8 gTilesetAnims_SootopolisGym0_Frame1[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/0/1.4bpp");
static const u8 gTilesetAnims_SootopolisGym0_Frame2[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/0/2.4bpp");
static const u8 gTilesetAnims_SootopolisGym1_Frame0[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/1/0.4bpp");
static const u8 gTilesetAnims_SootopolisGym1_Frame1[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/1/1.4bpp");
static const u8 gTilesetAnims_SootopolisGym1_Frame2[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/1/2.4bpp");

static const u8 *const gTilesetAnims_SootopolisGym0[] =
{
    gTilesetAnims_SootopolisGym0_Frame0,
    gTilesetAnims_SootopolisGym0_Frame1,
    gTilesetAnims_SootopolisGym0_Frame2,
};

static const u8 *const gTilesetAnims_SootopolisGym1[] =
{
    gTilesetAnims_SootopolisGym1_Frame0,
    gTilesetAnims_SootopolisGym1_Frame1,
    gTilesetAnims_SootopolisGym1_Frame2,
};

static const u8 gTilesetAnims_EliteFour0_Frame0[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/1/0.4bpp");
static const u8 gTilesetAnims_EliteFour0_Frame1[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/1/1.4bpp");
static const u8 gTilesetAnims_EliteFour1_Frame0[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/0.4bpp");
static const u8 gTilesetAnims_EliteFour1_Frame1[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/1.4bpp");
static const u8 gTilesetAnims_EliteFour1_Frame2[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/2.4bpp");
static const u8 gTilesetAnims_EliteFour1_Frame3[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/3.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnims_EliteFour1[] =
{
    gTilesetAnims_EliteFour1_Frame0,
    gTilesetAnims_EliteFour1_Frame1,
    gTilesetAnims_EliteFour1_Frame2,
    gTilesetAnims_EliteFour1_Frame3,
};

static const u8 *const gTilesetAnims_EliteFour0[] =
{
    gTilesetAnims_EliteFour0_Frame0,
    gTilesetAnims_EliteFour0_Frame1,
};

static const u8 gTilesetAnims_MauvilleGym0_Frame0[] = INCBIN_U8("data/tilesets/secondary/mauville_gym/anim/0.4bpp");
static const u8 gTilesetAnims_MauvilleGym0_Frame1[] = INCBIN_U8("data/tilesets/secondary/mauville_gym/anim/1.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnims_MauvilleGym0[] =
{
    gTilesetAnims_MauvilleGym0_Frame0,
    gTilesetAnims_MauvilleGym0_Frame1,
};

static const u8 gTilesetAnims_BikeShop0_Frame0[] = INCBIN_U8("data/tilesets/secondary/bike_shop/anim/0.4bpp");
static const u8 gTilesetAnims_BikeShop0_Frame1[] = INCBIN_U8("data/tilesets/secondary/bike_shop/anim/1.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnims_BikeShop0[] =
{
    gTilesetAnims_BikeShop0_Frame0,
    gTilesetAnims_BikeShop0_Frame1,
};

static void ClearTilesetAnimDmas(void)
{
    gNumTilesetAnimDmas = 0;
    CpuFill32(0, &gTilesetAnimDmas, sizeof(gTilesetAnimDmas));
}

static void QueueTilesetAnimDma(const void *src, const void *dest, u16 size)
{
    if (gNumTilesetAnimDmas < 20)
    {
        gTilesetAnimDmas[gNumTilesetAnimDmas].src = src;
        gTilesetAnimDmas[gNumTilesetAnimDmas].dest = dest;
        gTilesetAnimDmas[gNumTilesetAnimDmas].size = size;
        gNumTilesetAnimDmas++;
    }
}

void sub_8072E74(void)
{
    int i;
    for (i = 0; i < gNumTilesetAnimDmas; i++)
    {
        DmaCopy16(3,
            gTilesetAnimDmas[i].src,
            gTilesetAnimDmas[i].dest,
            gTilesetAnimDmas[i].size);
    }
    gNumTilesetAnimDmas = 0;
}

void cur_mapheader_run_tileset_funcs_after_some_cpuset(void)
{
    ClearTilesetAnimDmas();
    StartTileset1Animation();
    StartTileset2Animation();
}

void sub_8072ED0(void)
{
    StartTileset2Animation();
}

void sub_8072EDC(void)
{
    ClearTilesetAnimDmas();
    if (++gTileset1AnimFrame >= gTileset1AnimLength)
    {
        gTileset1AnimFrame = 0;
    }
    if (++gTileset2AnimFrame >= gTileset2AnimLength)
    {
        gTileset2AnimFrame = 0;
    }
    if (gTileset1AnimCallback)
    {
        gTileset1AnimCallback(gTileset1AnimFrame);
    }
    if (gTileset2AnimCallback)
    {
        gTileset2AnimCallback(gTileset2AnimFrame);
    }
}

static void StartTileset1Animation(void)
{
    gTileset1AnimFrame = 0;
    gTileset1AnimLength = 0;
    gTileset1AnimCallback = 0;
    if (gMapHeader.mapLayout->primaryTileset)
    {
        if (gMapHeader.mapLayout->primaryTileset->callback)
        {
            gMapHeader.mapLayout->primaryTileset->callback();
        }
    }
}

static void StartTileset2Animation(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = 0;
    gTileset2AnimCallback = 0;
    if (gMapHeader.mapLayout->secondaryTileset)
    {
        if (gMapHeader.mapLayout->secondaryTileset->callback)
        {
            gMapHeader.mapLayout->secondaryTileset->callback();
        }
    }
}

void TilesetCB_General(void)
{
    gTileset1AnimFrame = 0;
    gTileset1AnimLength = 0x100;
    gTileset1AnimCallback = sub_8073014;
}

void TilesetCB_Building(void)
{
    gTileset1AnimFrame = 0;
    gTileset1AnimLength = 0x100;
    gTileset1AnimCallback = sub_8073058;
}

static void sub_8073014(u16 a1)
{
    int v1;
    v1 = a1 % 0x10;
    if (v1 == 0) sub_8073070(a1 / 0x10);
    if (v1 == 1) sub_8073098(a1 / 0x10);
    if (v1 == 2) sub_80730C0(a1 / 0x10);
    if (v1 == 3) sub_80730E8(a1 / 0x10);
    if (v1 == 4) sub_807361C(a1 / 0x10);
}

static void sub_8073058(u16 a1)
{
    if (a1 % 8 == 0)
    {
        sub_8073904(a1 / 8);
    }
}

static void sub_8073070(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnims_General0[v1], BG_TILE_ADDR(127), 0x80);
}

static void sub_8073098(u16 a1)
{
    u8 v1;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnims_General1[v1], BG_TILE_ADDR(108), 0x3c0);
}

static void sub_80730C0(u16 a1)
{
    int v1;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnims_General2[v1], BG_TILE_ADDR(116), 0x140);
}

static void sub_80730E8(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnims_General3[v1], BG_TILE_ADDR(124), 0xc0);
}

void TilesetCB_Petalburg(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Rustboro(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_8073424;
}

void TilesetCB_Dewford(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Slateport(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Mauville(void)
{
    gTileset2AnimFrame = gTileset1AnimFrame;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_80734A0;
}

void TilesetCB_Lavaridge(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_8073514;
}

void TilesetCB_Fallarbor(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Fortree(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Lilycove(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Mossdeep(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_EverGrande(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_8073540;
}

void TilesetCB_Pacifidlog(void)
{
    gTileset2AnimFrame = gTileset1AnimFrame;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_80735B4;
}

void TilesetCB_Sootopolis(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Underwater(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = 0x80;
    gTileset2AnimCallback = sub_80735E4;
}

void TilesetCB_SootopolisGym(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = 0xf0;
    gTileset2AnimCallback = sub_80738A8;
}

void TilesetCB_Cave(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_8073600;
}

void TilesetCB_EliteFour(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = 0x80;
    gTileset2AnimCallback = sub_80738C0;
}

void TilesetCB_MauvilleGym(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_8073890;
}

void TilesetCB_BikeShop(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_80738EC;
}

static void sub_8073424(u16 a1)
{
    int v1;
    v1 = a1 % 8;
    if (v1 == 0)
    {
        sub_80737A4(a1 / 8, 0);
        sub_80737E0(a1 / 8);
    }
    if (v1 == 1) sub_80737A4(a1 / 8, 1);
    if (v1 == 2) sub_80737A4(a1 / 8, 2);
    if (v1 == 3) sub_80737A4(a1 / 8, 3);
    if (v1 == 4) sub_80737A4(a1 / 8, 4);
    if (v1 == 5) sub_80737A4(a1 / 8, 5);
    if (v1 == 6) sub_80737A4(a1 / 8, 6);
    if (v1 == 7) sub_80737A4(a1 / 8, 7);
}

static void sub_80734A0(u16 a1)
{
    int v1;
    v1 = a1 % 8;
    if (v1 == 0) sub_8073704(a1 / 8, 0);
    if (v1 == 1) sub_8073704(a1 / 8, 1);
    if (v1 == 2) sub_8073704(a1 / 8, 2);
    if (v1 == 3) sub_8073704(a1 / 8, 3);
    if (v1 == 4) sub_8073704(a1 / 8, 4);
    if (v1 == 5) sub_8073704(a1 / 8, 5);
    if (v1 == 6) sub_8073704(a1 / 8, 6);
    if (v1 == 7) sub_8073704(a1 / 8, 7);
}

static void sub_8073514(u16 a1)
{
    int v1;
    v1 = a1 % 0x10;
    if (v1 == 0) sub_8073644(a1 / 0x10);
    if (v1 == 1) sub_8073808(a1 / 0x10);
}

static void sub_8073540(u16 a1)
{
    int v1;
    v1 = a1 % 8;
    if (v1 == 0) sub_8073830(a1 / 8, 0);
    if (v1 == 1) sub_8073830(a1 / 8, 1);
    if (v1 == 2) sub_8073830(a1 / 8, 2);
    if (v1 == 3) sub_8073830(a1 / 8, 3);
    if (v1 == 4) sub_8073830(a1 / 8, 4);
    if (v1 == 5) sub_8073830(a1 / 8, 5);
    if (v1 == 6) sub_8073830(a1 / 8, 6);
    if (v1 == 7) sub_8073830(a1 / 8, 7);
}

static void sub_80735B4(u16 a1)
{
    int v1;
    v1 = a1 % 0x10;
    if (v1 == 0) sub_807368C(a1 / 0x10);
    if (v1 == 1) sub_80736DC(a1 / 0x10);
}

static void sub_80735E4(u16 a1)
{
    int v1;
    v1 = a1 % 0x10;
    if (v1 == 0) sub_80736B4(a1 / 0x10);
}

static void sub_8073600(u16 a1)
{
    int v1;
    v1 = a1 % 0x10;
    if (v1 == 1) sub_8073868(a1 / 0x10);
}

static void sub_807361C(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnims_General4[v1], BG_TILE_ADDR(120), 0x140);
}

static void sub_8073644(u8 a1)
{
    u8 v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnims_Lavaridge0[v1], BG_TILE_ADDR(200), 0x80);
    v1 = (a1 + 2) % 4;
    QueueTilesetAnimDma(gTilesetAnims_Lavaridge0[v1], BG_TILE_ADDR(201), 0x80);
}

static void sub_807368C(u8 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnims_Pacifidlog0[v1], BG_TILE_ADDR(244), 0x3c0);
}

static void sub_80736B4(u8 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnims_Underwater0[v1], BG_TILE_ADDR(252), 0x80);
}

static void sub_80736DC(u8 a1)
{
    int v1;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnims_Pacifidlog1[v1], BG_TILE_ADDR(252), 0x100);
}

static void sub_8073704(u16 a1, u8 a2)
{
    int v1;
    a1 -= a2;
    if (a1 < 12)
    {
        v1 = a1 % 12;
        QueueTilesetAnimDma(gTilesetAnims_Mauville0[v1], gTilesetAnims_MauvilleVDests0[a2], 0x80);
        QueueTilesetAnimDma(gTilesetAnims_Mauville1[v1], gTilesetAnims_MauvilleVDests1[a2], 0x80);
    }
    else
    {
        v1 = a1 % 4;
        QueueTilesetAnimDma(gTilesetAnims_Mauville2[v1], gTilesetAnims_MauvilleVDests0[a2], 0x80);
        QueueTilesetAnimDma(gTilesetAnims_Mauville3[v1], gTilesetAnims_MauvilleVDests1[a2], 0x80);
    }
}

static void sub_80737A4(u16 a1, u8 a2)
{
    int v1;
    a1 -= a2;

    v1 = a1 % 8;
    if (gTilesetAnims_Rustboro0[v1])
    {
        QueueTilesetAnimDma(gTilesetAnims_Rustboro0[v1], gTilesetAnims_RustboroVDests0[a2], 0x80);
    }
}

static void sub_80737E0(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnims_Rustboro1[v1], BG_TILE_ADDR(240), 0x80);
}

static void sub_8073808(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnims_Lavaridge1_Cave0[v1], BG_TILE_ADDR(168), 0x80);
}

static void sub_8073830(u16 a1, u8 a2)
{
    int v1;
    a1 -= a2;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnims_EverGrande0[v1], gTilesetAnims_EverGrandeVDests0[a2], 0x80);
}

static void sub_8073868(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnims_Lavaridge1_Cave0[v1], BG_TILE_ADDR(232), 0x80);
}

static void sub_8073890(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    if (!v1)
    {
        sub_80739C4(a1 / 2);
    }
}

static void sub_80738A8(u16 a1)
{
    int v1;
    v1 = a1 % 8;
    if (!v1)
    {
        sub_807392C(a1 / 8);
    }
}

static void sub_80738C0(u16 a1)
{
    if (a1 % 0x40 == 0)
    {
        sub_807399C(a1 / 0x40);
    }
    if (a1 % 8 == 1)
    {
        sub_8073974(a1 / 8);
    }
}

static void sub_80738EC(u16 a1)
{
    if (a1 % 4 == 0)
    {
        sub_80739EC(a1 / 4);
    }
}

static void sub_8073904(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnims_InsideBuilding0[v1], BG_TILE_ADDR(124), 0x80);
}

static void sub_807392C(u16 a1)
{
    int v1;
    v1 = a1 % 3;
    QueueTilesetAnimDma(gTilesetAnims_SootopolisGym0[v1], BG_TILE_ADDR(252), 0x180);
    QueueTilesetAnimDma(gTilesetAnims_SootopolisGym1[v1], BG_TILE_ADDR(244), 0x280);
}

static void sub_8073974(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnims_EliteFour1[v1], BG_TILE_ADDR(254), 0x20);
}

static void sub_807399C(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnims_EliteFour0[v1], BG_TILE_ADDR(248), 0x80);
}

static void sub_80739C4(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnims_MauvilleGym0[v1], BG_TILE_ADDR(164), 0x200);
}

static void sub_80739EC(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnims_BikeShop0[v1], BG_TILE_ADDR(252), 0x120);
}
