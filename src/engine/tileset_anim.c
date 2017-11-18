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

static const u8 TilesetAnimTiles_General_0_1[] = INCBIN_U8("data/tilesets/primary/general/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_General_0_0[] = INCBIN_U8("data/tilesets/primary/general/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_General_0_2[] = INCBIN_U8("data/tilesets/primary/general/anim/0/2.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnimTable_General_0[] =
{
    TilesetAnimTiles_General_0_0,
    TilesetAnimTiles_General_0_1,
    TilesetAnimTiles_General_0_0,
    TilesetAnimTiles_General_0_2,
};

static const u8 TilesetAnimTiles_General_1_0[] = INCBIN_U8("data/tilesets/primary/general/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_General_1_1[] = INCBIN_U8("data/tilesets/primary/general/anim/1/1.4bpp");
static const u8 TilesetAnimTiles_General_1_2[] = INCBIN_U8("data/tilesets/primary/general/anim/1/2.4bpp");
static const u8 TilesetAnimTiles_General_1_3[] = INCBIN_U8("data/tilesets/primary/general/anim/1/3.4bpp");
static const u8 TilesetAnimTiles_General_1_4[] = INCBIN_U8("data/tilesets/primary/general/anim/1/4.4bpp");
static const u8 TilesetAnimTiles_General_1_5[] = INCBIN_U8("data/tilesets/primary/general/anim/1/5.4bpp");
static const u8 TilesetAnimTiles_General_1_6[] = INCBIN_U8("data/tilesets/primary/general/anim/1/6.4bpp");
static const u8 TilesetAnimTiles_General_1_7[] = INCBIN_U8("data/tilesets/primary/general/anim/1/7.4bpp");

static const u8 *const gTilesetAnimTable_General_1[] =
{
    TilesetAnimTiles_General_1_0,
    TilesetAnimTiles_General_1_1,
    TilesetAnimTiles_General_1_2,
    TilesetAnimTiles_General_1_3,
    TilesetAnimTiles_General_1_4,
    TilesetAnimTiles_General_1_5,
    TilesetAnimTiles_General_1_6,
    TilesetAnimTiles_General_1_7,
};

static const u8 TilesetAnimTiles_General_2_0[] = INCBIN_U8("data/tilesets/primary/general/anim/2/0.4bpp");
static const u8 TilesetAnimTiles_General_2_1[] = INCBIN_U8("data/tilesets/primary/general/anim/2/1.4bpp");
static const u8 TilesetAnimTiles_General_2_2[] = INCBIN_U8("data/tilesets/primary/general/anim/2/2.4bpp");
static const u8 TilesetAnimTiles_General_2_3[] = INCBIN_U8("data/tilesets/primary/general/anim/2/3.4bpp");
static const u8 TilesetAnimTiles_General_2_4[] = INCBIN_U8("data/tilesets/primary/general/anim/2/4.4bpp");
static const u8 TilesetAnimTiles_General_2_5[] = INCBIN_U8("data/tilesets/primary/general/anim/2/5.4bpp");
static const u8 TilesetAnimTiles_General_2_6[] = INCBIN_U8("data/tilesets/primary/general/anim/2/6.4bpp");

static const u8 *const gTilesetAnimTable_General_2[] =
{
    TilesetAnimTiles_General_2_0,
    TilesetAnimTiles_General_2_1,
    TilesetAnimTiles_General_2_2,
    TilesetAnimTiles_General_2_3,
    TilesetAnimTiles_General_2_4,
    TilesetAnimTiles_General_2_5,
    TilesetAnimTiles_General_2_6,
    TilesetAnimTiles_General_2_0,
};

static const u8 TilesetAnimTiles_General_3_0[] = INCBIN_U8("data/tilesets/primary/general/anim/3/0.4bpp");
static const u8 TilesetAnimTiles_General_3_1[] = INCBIN_U8("data/tilesets/primary/general/anim/3/1.4bpp");
static const u8 TilesetAnimTiles_General_3_2[] = INCBIN_U8("data/tilesets/primary/general/anim/3/2.4bpp");
static const u8 TilesetAnimTiles_General_3_3[] = INCBIN_U8("data/tilesets/primary/general/anim/3/3.4bpp");

static const u8 *const gTilesetAnimTable_General_3[] =
{
    TilesetAnimTiles_General_3_0,
    TilesetAnimTiles_General_3_1,
    TilesetAnimTiles_General_3_2,
    TilesetAnimTiles_General_3_3,
};

static const u8 TilesetAnimTiles_General_4_0[] = INCBIN_U8("data/tilesets/primary/general/anim/4/0.4bpp");
static const u8 TilesetAnimTiles_General_4_1[] = INCBIN_U8("data/tilesets/primary/general/anim/4/1.4bpp");
static const u8 TilesetAnimTiles_General_4_2[] = INCBIN_U8("data/tilesets/primary/general/anim/4/2.4bpp");
static const u8 TilesetAnimTiles_General_4_3[] = INCBIN_U8("data/tilesets/primary/general/anim/4/3.4bpp");

static const u8 *const gTilesetAnimTable_General_4[] =
{
    TilesetAnimTiles_General_4_0,
    TilesetAnimTiles_General_4_1,
    TilesetAnimTiles_General_4_2,
    TilesetAnimTiles_General_4_3,
};

static const u8 TilesetAnimTiles_Lavaridge_0[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/0.4bpp");
static const u8 TilesetAnimTiles_Lavaridge_1[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/1.4bpp");
static const u8 TilesetAnimTiles_Lavaridge_2[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/2.4bpp");
static const u8 TilesetAnimTiles_Lavaridge_3[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/3.4bpp");

static const u8 *const gTilesetAnimTable_Lavaridge[] =
{
    TilesetAnimTiles_Lavaridge_0,
    TilesetAnimTiles_Lavaridge_1,
    TilesetAnimTiles_Lavaridge_2,
    TilesetAnimTiles_Lavaridge_3,
};

static const u8 TilesetAnimTiles_Pacifidlog_0_0[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_0_1[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_0_2[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/0/2.4bpp");

static const u8 *const gTilesetAnimTable_Pacifidlog_0[] =
{
    TilesetAnimTiles_Pacifidlog_0_0,
    TilesetAnimTiles_Pacifidlog_0_1,
    TilesetAnimTiles_Pacifidlog_0_2,
    TilesetAnimTiles_Pacifidlog_0_1,
};

static const u8 TilesetAnimTiles_Underwater_0[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/0.4bpp");
static const u8 TilesetAnimTiles_Underwater_1[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/1.4bpp");
static const u8 TilesetAnimTiles_Underwater_2[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/2.4bpp");
static const u8 TilesetAnimTiles_Underwater_3[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/3.4bpp");

static const u8 *const gTilesetAnimTable_Underwater[] =
{
    TilesetAnimTiles_Underwater_0,
    TilesetAnimTiles_Underwater_1,
    TilesetAnimTiles_Underwater_2,
    TilesetAnimTiles_Underwater_3,
};

static const u8 TilesetAnimTiles_Pacifidlog_1_0[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_1[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/1.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_2[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/2.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_3[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/3.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_4[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/4.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_5[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/5.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_6[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/6.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_7[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/7.4bpp");

static const u8 *const gTilesetAnimTable_Pacifidlog_1[] =
{
    TilesetAnimTiles_Pacifidlog_1_0,
    TilesetAnimTiles_Pacifidlog_1_1,
    TilesetAnimTiles_Pacifidlog_1_2,
    TilesetAnimTiles_Pacifidlog_1_3,
    TilesetAnimTiles_Pacifidlog_1_4,
    TilesetAnimTiles_Pacifidlog_1_5,
    TilesetAnimTiles_Pacifidlog_1_6,
    TilesetAnimTiles_Pacifidlog_1_7,
};

static const u8 TilesetAnimTiles_Mauville_0_0[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_Mauville_0_1[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_Mauville_0_2[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/2.4bpp");
static const u8 TilesetAnimTiles_Mauville_0_3[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/3.4bpp");
static const u8 TilesetAnimTiles_Mauville_0_4[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/4.4bpp");

static const u8 TilesetAnimTiles_Mauville_1_0[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_Mauville_1_1[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/1.4bpp");
static const u8 TilesetAnimTiles_Mauville_1_2[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/2.4bpp");
static const u8 TilesetAnimTiles_Mauville_1_3[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/3.4bpp");
static const u8 TilesetAnimTiles_Mauville_1_4[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/4.4bpp");

static const void *const gUnknown_0837BAE4[] =
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

static const void *const gUnknown_0837BB04[] =
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

static const u8 *const gTilesetAnimTable_Mauville_0A[] =
{
    TilesetAnimTiles_Mauville_0_0,
    TilesetAnimTiles_Mauville_0_0,
    TilesetAnimTiles_Mauville_0_1,
    TilesetAnimTiles_Mauville_0_2,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_2,
    TilesetAnimTiles_Mauville_0_1,
};

static const u8 *const gTilesetAnimTable_Mauville_1A[] =
{
    TilesetAnimTiles_Mauville_1_0,
    TilesetAnimTiles_Mauville_1_0,
    TilesetAnimTiles_Mauville_1_1,
    TilesetAnimTiles_Mauville_1_2,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_2,
    TilesetAnimTiles_Mauville_1_1,
};

static const u8 *const gTilesetAnimTable_Mauville_0B[] =
{
    TilesetAnimTiles_Mauville_0_0,
    TilesetAnimTiles_Mauville_0_0,
    TilesetAnimTiles_Mauville_0_4,
    TilesetAnimTiles_Mauville_0_4,
};

static const u8 *const gTilesetAnimTable_Mauville_1B[] =
{
    TilesetAnimTiles_Mauville_1_0,
    TilesetAnimTiles_Mauville_1_0,
    TilesetAnimTiles_Mauville_1_4,
    TilesetAnimTiles_Mauville_1_4,
};

static const u8 TilesetAnimTiles_Rustboro_0_0[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_1[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_2[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/2.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_3[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/3.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_4[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/4.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_5[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/5.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_6[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/6.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_7[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/7.4bpp");

static const void *const gUnknown_0837BFA4[] =
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

static const u8 *const gTilesetAnimTable_Rustboro_0[] =
{
    TilesetAnimTiles_Rustboro_0_0,
    TilesetAnimTiles_Rustboro_0_1,
    TilesetAnimTiles_Rustboro_0_2,
    TilesetAnimTiles_Rustboro_0_3,
    TilesetAnimTiles_Rustboro_0_4,
    TilesetAnimTiles_Rustboro_0_5,
    TilesetAnimTiles_Rustboro_0_6,
    TilesetAnimTiles_Rustboro_0_7,
};

static const u8 TilesetAnimTiles_Rustboro_1_0[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_Rustboro_1_1[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/1/1.4bpp");

static const u8 *const gTilesetAnimTable_Rustboro_1[] =
{
    TilesetAnimTiles_Rustboro_1_0,
    TilesetAnimTiles_Rustboro_1_1,
};

static const u8 TilesetAnimTiles_Cave_0[] = INCBIN_U8("data/tilesets/secondary/cave/anim/0.4bpp");
static const u8 TilesetAnimTiles_Cave_1[] = INCBIN_U8("data/tilesets/secondary/cave/anim/1.4bpp");
static const u8 TilesetAnimTiles_Cave_2[] = INCBIN_U8("data/tilesets/secondary/cave/anim/2.4bpp");
static const u8 TilesetAnimTiles_Cave_3[] = INCBIN_U8("data/tilesets/secondary/cave/anim/3.4bpp");
// unused anim tiles for cave
static const u8 TilesetAnimTiles_Cave_4[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/0.4bpp");
static const u8 TilesetAnimTiles_Cave_5[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/1.4bpp");
static const u8 TilesetAnimTiles_Cave_6[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/2.4bpp");
static const u8 TilesetAnimTiles_Cave_7[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/3.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnimTable_Cave[] =
{
    TilesetAnimTiles_Cave_0,
    TilesetAnimTiles_Cave_1,
    TilesetAnimTiles_Cave_2,
    TilesetAnimTiles_Cave_3,
};

static const u8 TilesetAnimTiles_EverGrande_0[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/0.4bpp");
static const u8 TilesetAnimTiles_EverGrande_1[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/1.4bpp");
static const u8 TilesetAnimTiles_EverGrande_2[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/2.4bpp");
static const u8 TilesetAnimTiles_EverGrande_3[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/3.4bpp");
static const u8 TilesetAnimTiles_EverGrande_4[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/4.4bpp");
static const u8 TilesetAnimTiles_EverGrande_5[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/5.4bpp");
static const u8 TilesetAnimTiles_EverGrande_6[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/6.4bpp");
static const u8 TilesetAnimTiles_EverGrande_7[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/7.4bpp");
asm(".space 32");

static const void *const gUnknown_0837C93C[] =
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

static const u8 *const gTilesetAnimTable_EverGrande[] =
{
    TilesetAnimTiles_EverGrande_0,
    TilesetAnimTiles_EverGrande_1,
    TilesetAnimTiles_EverGrande_2,
    TilesetAnimTiles_EverGrande_3,
    TilesetAnimTiles_EverGrande_4,
    TilesetAnimTiles_EverGrande_5,
    TilesetAnimTiles_EverGrande_6,
    TilesetAnimTiles_EverGrande_7,
};

static const u8 TilesetAnimTiles_Building_0[] = INCBIN_U8("data/tilesets/primary/building/anim/0.4bpp");
static const u8 TilesetAnimTiles_Building_1[] = INCBIN_U8("data/tilesets/primary/building/anim/1.4bpp");

static const u8 *const gTilesetAnimTable_Building[] =
{
    TilesetAnimTiles_Building_0,
    TilesetAnimTiles_Building_1,
};

static const u8 TilesetAnimTiles_SootopolisGym_0_0[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_SootopolisGym_0_1[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_SootopolisGym_0_2[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/0/2.4bpp");
static const u8 TilesetAnimTiles_SootopolisGym_1_0[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_SootopolisGym_1_1[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/1/1.4bpp");
static const u8 TilesetAnimTiles_SootopolisGym_1_2[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/1/2.4bpp");

static const u8 *const gTilesetAnimTable_SootopolisGym_0[] =
{
    TilesetAnimTiles_SootopolisGym_0_0,
    TilesetAnimTiles_SootopolisGym_0_1,
    TilesetAnimTiles_SootopolisGym_0_2,
};

static const u8 *const gTilesetAnimTable_SootopolisGym_1[] =
{
    TilesetAnimTiles_SootopolisGym_1_0,
    TilesetAnimTiles_SootopolisGym_1_1,
    TilesetAnimTiles_SootopolisGym_1_2,
};

static const u8 TilesetAnimTiles_EliteFour_1_0[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_EliteFour_1_1[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/1/1.4bpp");
static const u8 TilesetAnimTiles_EliteFour_0_0[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_EliteFour_0_1[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_EliteFour_0_2[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/2.4bpp");
static const u8 TilesetAnimTiles_EliteFour_0_3[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/3.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnimTable_EliteFour_0[] =
{
    TilesetAnimTiles_EliteFour_0_0,
    TilesetAnimTiles_EliteFour_0_1,
    TilesetAnimTiles_EliteFour_0_2,
    TilesetAnimTiles_EliteFour_0_3,
};

static const u8 *const gTilesetAnimTable_EliteFour_1[] =
{
    TilesetAnimTiles_EliteFour_1_0,
    TilesetAnimTiles_EliteFour_1_1,
};

static const u8 TilesetAnimTiles_MauvilleGym_0[] = INCBIN_U8("data/tilesets/secondary/mauville_gym/anim/0.4bpp");
static const u8 TilesetAnimTiles_MauvilleGym_1[] = INCBIN_U8("data/tilesets/secondary/mauville_gym/anim/1.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnimTable_MauvilleGym[] =
{
    TilesetAnimTiles_MauvilleGym_0,
    TilesetAnimTiles_MauvilleGym_1,
};

static const u8 TilesetAnimTiles_BikeShop_0[] = INCBIN_U8("data/tilesets/secondary/bike_shop/anim/0.4bpp");
static const u8 TilesetAnimTiles_BikeShop_1[] = INCBIN_U8("data/tilesets/secondary/bike_shop/anim/1.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnimTable_BikeShop[] =
{
    TilesetAnimTiles_BikeShop_0,
    TilesetAnimTiles_BikeShop_1,
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
    if (gMapHeader.mapData->primaryTileset)
    {
        if (gMapHeader.mapData->primaryTileset->callback)
        {
            gMapHeader.mapData->primaryTileset->callback();
        }
    }
}

static void StartTileset2Animation(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = 0;
    gTileset2AnimCallback = 0;
    if (gMapHeader.mapData->secondaryTileset)
    {
        if (gMapHeader.mapData->secondaryTileset->callback)
        {
            gMapHeader.mapData->secondaryTileset->callback();
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
    QueueTilesetAnimDma(gTilesetAnimTable_General_0[v1], BG_TILE_ADDR(127), 0x80);
}

static void sub_8073098(u16 a1)
{
    u8 v1;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnimTable_General_1[v1], BG_TILE_ADDR(108), 0x3c0);
}

static void sub_80730C0(u16 a1)
{
    int v1;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnimTable_General_2[v1], BG_TILE_ADDR(116), 0x140);
}

static void sub_80730E8(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_General_3[v1], BG_TILE_ADDR(124), 0xc0);
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
    QueueTilesetAnimDma(gTilesetAnimTable_General_4[v1], BG_TILE_ADDR(120), 0x140);
}

static void sub_8073644(u8 a1)
{
    u8 v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Lavaridge[v1], BG_TILE_ADDR(200), 0x80);
    v1 = (a1 + 2) % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Lavaridge[v1], BG_TILE_ADDR(201), 0x80);
}

static void sub_807368C(u8 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Pacifidlog_0[v1], BG_TILE_ADDR(244), 0x3c0);
}

static void sub_80736B4(u8 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Underwater[v1], BG_TILE_ADDR(252), 0x80);
}

static void sub_80736DC(u8 a1)
{
    int v1;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnimTable_Pacifidlog_1[v1], BG_TILE_ADDR(252), 0x100);
}

static void sub_8073704(u16 a1, u8 a2)
{
    int v1;
    a1 -= a2;
    if (a1 < 12)
    {
        v1 = a1 % 12;
        QueueTilesetAnimDma(gTilesetAnimTable_Mauville_0A[v1], gUnknown_0837BAE4[a2], 0x80);
        QueueTilesetAnimDma(gTilesetAnimTable_Mauville_1A[v1], gUnknown_0837BB04[a2], 0x80);
    }
    else
    {
        v1 = a1 % 4;
        QueueTilesetAnimDma(gTilesetAnimTable_Mauville_0B[v1], gUnknown_0837BAE4[a2], 0x80);
        QueueTilesetAnimDma(gTilesetAnimTable_Mauville_1B[v1], gUnknown_0837BB04[a2], 0x80);
    }
}

static void sub_80737A4(u16 a1, u8 a2)
{
    int v1;
    a1 -= a2;

    v1 = a1 % 8;
    if (gTilesetAnimTable_Rustboro_0[v1])
    {
        QueueTilesetAnimDma(gTilesetAnimTable_Rustboro_0[v1], gUnknown_0837BFA4[a2], 0x80);
    }
}

static void sub_80737E0(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnimTable_Rustboro_1[v1], BG_TILE_ADDR(240), 0x80);
}

static void sub_8073808(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Cave[v1], BG_TILE_ADDR(168), 0x80);
}

static void sub_8073830(u16 a1, u8 a2)
{
    int v1;
    a1 -= a2;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnimTable_EverGrande[v1], gUnknown_0837C93C[a2], 0x80);
}

static void sub_8073868(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Cave[v1], BG_TILE_ADDR(232), 0x80);
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
    QueueTilesetAnimDma(gTilesetAnimTable_Building[v1], BG_TILE_ADDR(124), 0x80);
}

static void sub_807392C(u16 a1)
{
    int v1;
    v1 = a1 % 3;
    QueueTilesetAnimDma(gTilesetAnimTable_SootopolisGym_0[v1], BG_TILE_ADDR(252), 0x180);
    QueueTilesetAnimDma(gTilesetAnimTable_SootopolisGym_1[v1], BG_TILE_ADDR(244), 0x280);
}

static void sub_8073974(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_EliteFour_0[v1], BG_TILE_ADDR(254), 0x20);
}

static void sub_807399C(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnimTable_EliteFour_1[v1], BG_TILE_ADDR(248), 0x80);
}

static void sub_80739C4(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnimTable_MauvilleGym[v1], BG_TILE_ADDR(164), 0x200);
}

static void sub_80739EC(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnimTable_BikeShop[v1], BG_TILE_ADDR(252), 0x120);
}
