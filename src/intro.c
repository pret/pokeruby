#include "global.h"
#include "gba/m4a_internal.h"
#include "intro.h"
#include "data2.h"
#include "decompress.h"
#include "hall_of_fame.h"
#include "intro_credits_graphics.h"
#include "libgncmultiboot.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "new_game.h"
#include "palette.h"
#include "random.h"
#include "save.h"
#include "constants/songs.h"
#include "sound.h"
#include "constants/species.h"
#include "task.h"
#include "title_screen.h"
#include "trig.h"
#include "scanline_effect.h"
#include "ewram.h"

extern struct SpriteTemplate gUnknown_02024E8C;
extern u16 gUnknown_02039358;
extern u16 gUnknown_0203935A;
extern u16 gSaveFileStatus;
extern u8 gReservedSpritePaletteCount;
extern const u8 gInterfaceGfx_PokeBall[];
extern const u8 gInterfacePal_PokeBall[];
extern const u8 gIntroCopyright_Gfx[];
extern const u16 gIntroCopyright_Pal[];
extern const u16 gIntroCopyright_Tilemap[];
extern void *const gUnknown_0840B5A0[];

static EWRAM_DATA u16 gUnknown_02039318 = 0;
static EWRAM_DATA u16 gUnknown_0203931A = 0;

u32 gIntroFrameCounter;
struct GcmbStruct gMultibootProgramStruct;

//--------------------------------------------------
// Graphics Data
//--------------------------------------------------

static const u16 Palette_406340[] = INCBIN_U16("graphics/intro/unknown1.gbapal");
static const u16 Palette_406360[] = INCBIN_U16("graphics/intro/unknown2.gbapal");
#if ENGLISH
static const u8 gIntroTiles[] = INCBIN_U8("graphics/intro/intro.4bpp.lz");
#elif GERMAN
extern const u8 gIntroTiles[];
#endif
static const u16 gIntro1BGPals[][16] =
{
    INCBIN_U16("graphics/intro/intro1_bgpal1.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal2.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal3.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal4.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal5.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal6.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal7.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal8.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal9.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal10.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal11.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal12.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal13.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal14.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal15.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal16.gbapal"),
};
static const u8 gIntro1BG0_Tilemap[] = INCBIN_U8("graphics/intro/intro1_bg0_map.bin.lz");
static const u8 gIntro1BG1_Tilemap[] = INCBIN_U8("graphics/intro/intro1_bg1_map.bin.lz");
static const u8 gIntro1BG2_Tilemap[] = INCBIN_U8("graphics/intro/intro1_bg2_map.bin.lz");
static const u8 gIntro1BG3_Tilemap[] = INCBIN_U8("graphics/intro/intro1_bg3_map.bin.lz");
static const u8 gIntro1BGLeavesGfx[] = INCBIN_U8("graphics/intro/introgfx.4bpp.lz");
static const u16 gIntro3PokeballPal[] = INCBIN_U16("graphics/intro/intro3_pokeball.gbapal");
static const u8 gIntro3Pokeball_Tilemap[] = INCBIN_U8("graphics/intro/intro3_pokeball_map.bin.lz");
static const u8 gIntro3Pokeball_Gfx[] = INCBIN_U8("graphics/intro/intro3_pokeball.8bpp.lz");
static const u16 gIntro3Streaks_Pal[] = INCBIN_U16("graphics/intro/intro3_streaks.gbapal");
static const u8 gIntro3Streaks_Gfx[] = INCBIN_U8("graphics/intro/intro3_streaks.4bpp.lz");
static const u8 gIntro3Streaks_Tilemap[] = INCBIN_U8("graphics/intro/intro3_streaks_map.bin.lz");
static const u16 gIntro3Misc1Palette[] = INCBIN_U16("graphics/intro/intro3_misc1.gbapal");
static const u16 gIntro3Misc2Palette[] = INCBIN_U16("graphics/intro/intro3_misc2.gbapal");
static const u8 gIntro3MiscTiles[] = INCBIN_U8("graphics/intro/intro3_misc.4bpp.lz");
static const u16 gIntro1EonPalette[] = INCBIN_U16("graphics/intro/intro1_eon.gbapal");
static const u8 gIntro1EonTiles[] = INCBIN_U8("graphics/intro/intro1_eon.4bpp.lz");
static const struct OamData gOamData_840ADE8 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840ADF0[] =
{
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840ADF8[] =
{
    ANIMCMD_FRAME(24, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AE00[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AE08[] =
{
    ANIMCMD_FRAME(48, 8),
    ANIMCMD_END,
};
static const union AnimCmd *const gSpriteAnimTable_840AE10[] =
{
    gSpriteAnim_840ADF0,
    gSpriteAnim_840ADF8,
    gSpriteAnim_840AE00,
    gSpriteAnim_840AE08,
};
static void sub_813D208(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840AE20 =
{
    .tileTag = 2000,
    .paletteTag = 2000,
    .oam = &gOamData_840ADE8,
    .anims = gSpriteAnimTable_840AE10,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813D208,
};
static const union AnimCmd Unknown_40AE38[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(128, 4),
    ANIMCMD_FRAME(192, 4),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd Unknown_40AE4C[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(64, 8),
    ANIMCMD_FRAME(128, 8),
    ANIMCMD_FRAME(192, 8),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd Unknown_40AE60[] =
{
    ANIMCMD_FRAME(256, 4),
    ANIMCMD_FRAME(0x140, 4),
    ANIMCMD_FRAME(0x180, 4),
    ANIMCMD_END,
};
static const union AnimCmd Unknown_40AE70[] =
{
    ANIMCMD_FRAME(0x180, 16),
    ANIMCMD_FRAME(0x140, 16),
    ANIMCMD_FRAME(256, 16),
    ANIMCMD_END,
};
static const union AnimCmd *const gUnknown_0840AE80[] =
{
    Unknown_40AE38,
    Unknown_40AE4C,
    Unknown_40AE60,
    Unknown_40AE70,
};
static const struct OamData gOamData_840AE90 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_840AE98 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_840AEA0 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 2,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840AEA8[] =
{
    ANIMCMD_FRAME(80, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AEB0[] =
{
    ANIMCMD_FRAME(84, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AEB8[] =
{
    ANIMCMD_FRAME(88, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AEC0[] =
{
    ANIMCMD_FRAME(92, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AEC8[] =
{
    ANIMCMD_FRAME(96, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AED0[] =
{
    ANIMCMD_FRAME(100, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AED8[] =
{
    ANIMCMD_FRAME(104, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AEE0[] =
{
    ANIMCMD_FRAME(112, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AEE8[] =
{
    ANIMCMD_FRAME(113, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AEF0[] =
{
    ANIMCMD_FRAME(114, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AEF8[] =
{
    ANIMCMD_FRAME(115, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AF00[] =
{
    ANIMCMD_FRAME(116, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AF08[] =
{
    ANIMCMD_FRAME(117, 8),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_840AF10[] =
{
    ANIMCMD_FRAME(128, 8),
    ANIMCMD_END,
};
#if GERMAN
static const union AnimCmd gSpriteAnim_8416DA4[] =
{
    ANIMCMD_FRAME(118, 8),
    ANIMCMD_END,
};
#endif
static const union AnimCmd *const gSpriteAnimTable_840AF18[] =
{
    gSpriteAnim_840AEA8,
    gSpriteAnim_840AEB0,
    gSpriteAnim_840AEB8,
    gSpriteAnim_840AEC0,
    gSpriteAnim_840AEC8,
    gSpriteAnim_840AED0,
    gSpriteAnim_840AED8,
};
static const union AnimCmd *const gSpriteAnimTable_840AF34[] =
{
    gSpriteAnim_840AEE0,
    gSpriteAnim_840AEE8,
    gSpriteAnim_840AEF0,
    gSpriteAnim_840AEF8,
    gSpriteAnim_840AF00,
    gSpriteAnim_840AF08,
#if GERMAN
    gSpriteAnim_8416DA4,
#endif
};
static const union AnimCmd *const gSpriteAnimTable_840AF4C[] =
{
    gSpriteAnim_840AF10,
};
static const s16 gUnknown_0840AF50[][2] =
{
    {0, -72},
    {1, -56},
    {2, -40},
    {3, -24},
    {4, 8},
    {5, 24},
    {3, 40},
    {1, 56},
    {6, 72},
};
static const s16 gUnknown_0840AF74[][2] =
{
    {0, -28},
    {1, -20},
    {2, -12},
    {3, -4},
    {2, 4},
    {4, 12},
    {5, 20},
    {3, 28},
};
static void sub_813D908(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840AF94 =
{
    .tileTag = 2000,
    .paletteTag = 2001,
    .oam = &gOamData_840AE90,
    .anims = gSpriteAnimTable_840AF18,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813D908,
};
static const struct SpriteTemplate gSpriteTemplate_840AFAC =
{
    .tileTag = 2000,
    .paletteTag = 2001,
    .oam = &gOamData_840AE98,
    .anims = gSpriteAnimTable_840AF34,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813D908,
};
static const struct SpriteTemplate gSpriteTemplate_840AFC4 =
{
    .tileTag = 2000,
    .paletteTag = 2001,
    .oam = &gOamData_840AEA0,
    .anims = gSpriteAnimTable_840AF4C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813D908,
};
static const struct OamData gOamData_840AFDC =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840AFE4[] =
{
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd *const gSpriteAnimTable_840AFEC[] =
{
    gSpriteAnim_840AFE4,
};
static void sub_813DA64(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840AFF0 =
{
    .tileTag = 2002,
    .paletteTag = 2002,
    .oam = &gOamData_840AFDC,
    .anims = gSpriteAnimTable_840AFEC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813DA64,
};
const struct CompressedSpriteSheet gUnknown_0840B008[] =
{
    {gIntroTiles, 0x1400, 2000},
    {NULL},
};
const struct CompressedSpriteSheet gUnknown_0840B018[] =
{
    {gIntro1EonTiles, 0x400, 2002},
    {NULL},
};
const struct SpritePalette gUnknown_0840B028[] =
{
    {Palette_406340, 2000},
    {Palette_406360, 2001},
    {gIntro1EonPalette, 2002},
    {NULL},
};
static const union AnimCmd gUnknown_0840B048[] =
{
    ANIMCMD_FRAME(3, 0),
    ANIMCMD_END,
};
static const union AnimCmd gUnknown_0840B050[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END,
};
static const union AnimCmd gUnknown_0840B058[] =
{
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_END,
};
static const union AnimCmd *const gUnknown_0840B064[] =
{
    gUnknown_0840B048,
    gUnknown_0840B050,
    gUnknown_0840B058,
};
static const struct OamData gOamData_840B070 =
{
    .y = 160,
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
static const union AnimCmd gSpriteAnim_840B078[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END,
};
static const union AnimCmd *const gSpriteAnimTable_840B080[] =
{
    gSpriteAnim_840B078,
};
static void sub_813E30C(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B084 =
{
    .tileTag = 2002,
    .paletteTag = 2002,
    .oam = &gOamData_840B070,
    .anims = gSpriteAnimTable_840B080,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E30C,
};
static const struct OamData gOamData_840B09C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840B0A4[] =
{
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_END,
};
static const union AnimCmd *const gSpriteAnimTable_840B0AC[] =
{
    gSpriteAnim_840B0A4,
};
static void sub_813E4B8(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B0B0 =
{
    .tileTag = 2003,
    .paletteTag = 2003,
    .oam = &gOamData_840B09C,
    .anims = gSpriteAnimTable_840B0AC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E4B8,
};
static const struct OamData gOamData_840B0C8 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840B0D0[] =
{
    ANIMCMD_FRAME(14, 8),
    ANIMCMD_END,
};
static const union AnimCmd *const gSpriteAnimTable_840B0D8[] =
{
    gSpriteAnim_840B0D0,
};
static void sub_813E5E0(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B0DC =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B0C8,
    .anims = gSpriteAnimTable_840B0D8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E5E0,
};
static void sub_813E6C0(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B0F4 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B0C8,
    .anims = gSpriteAnimTable_840B0D8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E6C0,
};
static const struct OamData gOamData_840B10C =
{
    .y = 160,
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
static const union AnimCmd gSpriteAnim_840B114[] =
{
    ANIMCMD_FRAME(6, 8),
    ANIMCMD_FRAME(6, 8, .hFlip = TRUE),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd *const gSpriteAnimTable_840B120[] =
{
    gSpriteAnim_840B114,
};
static void sub_813E804(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B124 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B10C,
    .anims = gSpriteAnimTable_840B120,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E804,
};
static const struct OamData gOamData_840B13C =
{
    .y = 160,
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
static const union AnimCmd gSpriteAnim_840B144[] =
{
    ANIMCMD_FRAME(10, 8),
    ANIMCMD_END,
};
static const union AnimCmd *const gSpriteAnimTable_840B14C[] =
{
    gSpriteAnim_840B144,
};
static void sub_813E980(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B150 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B13C,
    .anims = gSpriteAnimTable_840B14C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E980,
};
static const u8 gUnknown_0840B168[] = {0xE6, 0xEB, 0xE4, 0xEA, 0xE5, 0xE9, 0xE7, 0xE8};
static void sub_813EA60(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B170 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B13C,
    .anims = gSpriteAnimTable_840B14C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813EA60,
};
static const u16 gUnknown_0840B188[] = {0x200, 0x1C0, 0x180, 0x140, 0x100, 0xE0, 0xC0, 0xA0, 0x80, 0x80};
static const struct OamData gOamData_840B19C =
{
    .y = 160,
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
static const union AnimCmd gSpriteAnim_840B1A4[] =
{
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_END,
};
static const union AnimCmd *const gSpriteAnimTable_840B1AC[] =
{
    gSpriteAnim_840B1A4,
};
static void sub_813EBBC(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B1B0 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B19C,
    .anims = gSpriteAnimTable_840B1AC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813EBBC,
};
static void sub_813EC90(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B1C8 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B19C,
    .anims = gSpriteAnimTable_840B1AC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813EC90,
};
static const struct OamData gOamData_840B1E0 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840B1E8[] =
{
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_END,
};
static const union AnimCmd *const gSpriteAnimTable_840B1F0[] =
{
    gSpriteAnim_840B1E8,
};
static void sub_813EDFC(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B1F4 =
{
    .tileTag = 2003,
    .paletteTag = 2003,
    .oam = &gOamData_840B1E0,
    .anims = gSpriteAnimTable_840B1F0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813EDFC,
};
const struct CompressedSpriteSheet gIntro3PokeballGfx_Table[] =
{
    {gInterfaceGfx_PokeBall, 0x100, 2002},
    {NULL},
};
const struct CompressedSpriteSheet gIntro3MiscGfx_Table[] =
{
    {gIntro3MiscTiles, 0xa00, 2003},
    {NULL},
};
const struct CompressedSpritePalette gInterfacePokeballPal_Table[] =
{
    {gInterfacePal_PokeBall, 2002},
    {NULL},
};
const struct SpritePalette gIntro3MiscPal_Table[] =
{
    {gIntro3Misc1Palette, 2003},
    {gIntro3Misc2Palette, 2004},
    {NULL},
};

// Game Freak probably used the raw address here.
// Treating this like a u8 * causes the compiler
// to remove it at link time.
const u32 unusedSharedMemPtr = (u32)gSharedMem;

static void MainCB2_EndIntro(void);
void Task_IntroLoadPart1Graphics(u8);
static void Task_IntroFadeIn(u8);
static void Task_IntroWaterDrops(u8);
static void Task_IntroScrollDownAndShowEon(u8);
static void Task_IntroWaitToSetupPart2(u8);
static void Task_IntroLoadPart2Graphics(u8);
static void Task_IntroStartBikeRide(u8);
static void Task_IntroHandleBikeAndEonMovement(u8);
static void Task_IntroWaitToSetupPart3(u8);
static void Task_IntroLoadPart3Graphics(u8);
static void Task_IntroSpinAndZoomPokeball(u8);
static void Task_IntroWaitToSetupPart3DoubleFight(u8);
static void Task_IntroLoadPart3Streaks(u8);
static void task_intro_14(u8);
static void task_intro_15(u8);
static void task_intro_16(u8);
static void task_intro_17(u8);
static void Task_IntroPokemonBattle(u8);
static void task_intro_19(u8);
static void task_intro_20(u8);
static void intro_reset_and_hide_bgs(void);
static void sub_813CCE8(u8);
static u16 sub_813CE88(u16, s16, s16, u16, u8);
static u8 sub_813CFA8(u16, u16, u16, u16);
static void sub_813D084(u8);
static void sub_813D220(struct Sprite *);
static void sub_813D368(struct Sprite *);
static void sub_813D414(struct Sprite *);
static void SpriteCB_WaterDropFall(struct Sprite *);
static u8 CreateWaterDrop(s16, s16, u16, u16, u16, u8);
static void sub_813D788(struct Sprite *);
static void sub_813D880(struct Sprite *);
static u8 CreateGameFreakLogo(s16, s16, u8);
static void sub_813DB9C(struct Sprite *);
static void sub_813DE70(struct Sprite *);
static void sub_813E10C(struct Sprite *);
static void sub_813E210(struct Sprite *);
static void sub_813E580(u16, u16);
static void sub_813E7C0(u8);
static void sub_813E930(u8);
static void InitIntroTorchicAttackAnim(u8);
static void InitIntroMudkipAttackAnim(u8);

static void VBlankCB_Intro(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void MainCB2_Intro(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    if (gMain.newKeys && !gPaletteFade.active)
        SetMainCallback2(MainCB2_EndIntro);
    else if (gIntroFrameCounter != -1)
        gIntroFrameCounter++;
}

static void MainCB2_EndIntro(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitTitleScreen);
}

static void LoadCopyrightGraphics(u16 tilesetAddress, u16 tilemapAddress, u16 paletteAddress)
{
    LZ77UnCompVram(gIntroCopyright_Gfx, (void *)(VRAM + tilesetAddress));
    LoadPalette(gIntroCopyright_Pal, paletteAddress, 0x20);
    CpuCopy16(gIntroCopyright_Tilemap, (void *)(VRAM + tilemapAddress), 0x500);
}

static void SerialCB_CopyrightScreen(void)
{
    GameCubeMultiBoot_HandleSerialInterrupt(&gMultibootProgramStruct);
}

static u8 SetUpCopyrightScreen(void)
{
    u16 ime;

    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BLDY = 0;
        *(u16 *)PLTT = 0x7FFF;
        REG_DISPCNT = 0;
        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;
        DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
        DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
        DmaFill16(3, 0, (void *)(PLTT + 2), PLTT_SIZE - 2);
        ResetPaletteFade();
        LoadCopyrightGraphics(0, 0x3800, 0);
        ScanlineEffect_Stop();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, FADE_COLOR_WHITE);
        REG_BG0CNT = BGCNT_PRIORITY(0)
                   | BGCNT_CHARBASE(0)
                   | BGCNT_SCREENBASE(7)
                   | BGCNT_16COLOR
                   | BGCNT_TXT256x256;
        ime = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = ime;
        REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
        SetVBlankCallback(VBlankCB_Intro);
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON;
        SetSerialCallback(SerialCB_CopyrightScreen);
        GameCubeMultiBoot_Init(&gMultibootProgramStruct);
    default:
        UpdatePaletteFade();
        gMain.state++;
        GameCubeMultiBoot_Main(&gMultibootProgramStruct);
        break;
    case 140:
        GameCubeMultiBoot_Main(&gMultibootProgramStruct);
        if (gMultibootProgramStruct.gcmb_field_2 != 1)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gMain.state++;
        }
        break;
    case 141:
        if (UpdatePaletteFade())
            break;
        CreateTask(Task_IntroLoadPart1Graphics, 0);
        SetMainCallback2(MainCB2_Intro);
        if (gMultibootProgramStruct.gcmb_field_2)
        {
            GameCubeMultiBoot_ExecuteProgram(&gMultibootProgramStruct);
        }
        else
        {
            GameCubeMultiBoot_Quit();
            SetSerialCallback(SerialCB);
        }
        return 0;
    }

    return 1;
}

void CB2_InitCopyrightScreenAfterBootup(void)
{
    if (!SetUpCopyrightScreen())
    {
        sub_8052E4C();
        Save_ResetSaveCounters();
        Save_LoadGameData(SAVE_NORMAL);
        if (gSaveFileStatus == 0 || gSaveFileStatus == 2)
            ClearSav2();
        SetPokemonCryStereo(gSaveBlock2.optionsSound);
    }
}

void CB2_InitCopyrightScreenAfterTitleScreen(void)
{
    SetUpCopyrightScreen();
}

void Task_IntroLoadPart1Graphics(u8 taskId)
{
    SetVBlankCallback(NULL);
    gUnknown_02039318 = Random() & 1;
    intro_reset_and_hide_bgs();
    REG_BG3VOFS = 0;
    REG_BG2VOFS = 0x50;
    REG_BG1VOFS = 0x18;
    REG_BG0VOFS = 0x28;
    LZ77UnCompVram(gIntro1BGLeavesGfx, (void *)VRAM);
    LZ77UnCompVram(gIntro1BG0_Tilemap, (void *)(VRAM + 0x8000));
    DmaClear16(3, VRAM + 0x8800, 0x800);
    LZ77UnCompVram(gIntro1BG1_Tilemap, (void *)(VRAM + 0x9000));
    DmaClear16(3, VRAM + 0x9800, 0x800);
    LZ77UnCompVram(gIntro1BG2_Tilemap, (void *)(VRAM + 0xA000));
    DmaClear16(3, VRAM + 0xA800, 0x800);
    LZ77UnCompVram(gIntro1BG3_Tilemap, (void *)(VRAM + 0xB000));
    DmaClear16(3, VRAM + 0xB800, 0x800);
    LoadPalette(gIntro1BGPals, 0, sizeof(gIntro1BGPals));
    REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(22) | BGCNT_16COLOR | BGCNT_TXT256x512;
    REG_BG2CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(20) | BGCNT_16COLOR | BGCNT_TXT256x512;
    REG_BG1CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(18) | BGCNT_16COLOR | BGCNT_TXT256x512;
    REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(16) | BGCNT_16COLOR | BGCNT_TXT256x512;
    LoadCompressedObjectPic(&gUnknown_0840B008[0]);
    LoadCompressedObjectPic(&gUnknown_0840B018[0]);
    LoadSpritePalettes(gUnknown_0840B028);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1F0, 0x20);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1E1, 0x1E);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1D2, 0x1C);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1C3, 0x1A);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1B4, 0x18);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1A5, 0x16);
    CpuCopy16(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x196, 0x14);
    gTasks[taskId].data[0] = CreateWaterDrop(236, -14, 0x200, 1, 0x78, FALSE);
    gTasks[taskId].func = Task_IntroFadeIn;
}

static void Task_IntroFadeIn(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    SetVBlankCallback(VBlankCB_Intro);
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
    gTasks[taskId].func = Task_IntroWaterDrops;
    gIntroFrameCounter = 0;
    m4aSongNumStart(0x19E);
    ResetSerial();
}

static void Task_IntroWaterDrops(u8 taskId)
{
    //start moving rock
    if (gIntroFrameCounter == 76)
        gSprites[gTasks[taskId].data[0]].data[0] = 1;

    //drop rock
    if (gIntroFrameCounter == 251)
        gSprites[gTasks[taskId].data[0]].data[0] = 2;

    if (gIntroFrameCounter == 368)
        CreateWaterDrop(48, 0, 0x400, 5, 0x70, TRUE);
    if (gIntroFrameCounter == 384)
        CreateWaterDrop(200, 60, 0x400, 9, 0x80, TRUE);

    if (gIntroFrameCounter == 560)
        CreateGameFreakLogo(DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, CreateTask(sub_813CCE8, 0));

    if (gIntroFrameCounter > 739)
    {
        gTasks[taskId].data[1] = 0x50;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 0x18;
        gTasks[taskId].data[4] = 0;
        gTasks[taskId].data[5] = 0x28;
        gTasks[taskId].data[6] = 0;
        gTasks[taskId].func = Task_IntroScrollDownAndShowEon;
    }
}

static void Task_IntroScrollDownAndShowEon(u8 taskId)
{
    if (gIntroFrameCounter < 904)
    {
        s32 r2;

        //slide backgrounds downward
        r2 = (gTasks[taskId].data[1] << 16) + (u16)gTasks[taskId].data[2] - 0xC000;
        gTasks[taskId].data[1] = r2 >> 16;
        gTasks[taskId].data[2] = r2;
        REG_BG2VOFS = gTasks[taskId].data[1];
        r2 = (gTasks[taskId].data[3] << 16) + (u16)gTasks[taskId].data[4] - 0x10000;
        gTasks[taskId].data[3] = r2 >> 16;
        gTasks[taskId].data[4] = r2;
        REG_BG1VOFS = gTasks[taskId].data[3];
        r2 = (gTasks[taskId].data[5] << 16) + (u16)gTasks[taskId].data[6] - 0x18000;
        gTasks[taskId].data[5] = r2 >> 16;
        gTasks[taskId].data[6] = r2;
        REG_BG0VOFS = gTasks[taskId].data[5];

        //show Lati@s sprite
        if (gIntroFrameCounter == 880)
        {
            u8 spriteId = CreateSprite(&gSpriteTemplate_840AFF0, 200, 160, 10);

            gSprites[spriteId].invisible = 1;
        }
    }
    else
    {
        //fade to white
        if (gIntroFrameCounter > 1007)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, FADE_COLOR_WHITE);
            gTasks[taskId].func = Task_IntroWaitToSetupPart2;
        }
    }
}

static void Task_IntroWaitToSetupPart2(u8 taskId)
{
    if (gIntroFrameCounter > 1026)
        gTasks[taskId].func = Task_IntroLoadPart2Graphics;
}

static void Task_IntroLoadPart2Graphics(u8 taskId)
{
    intro_reset_and_hide_bgs();
    SetVBlankCallback(NULL);
    ResetSpriteData();
    FreeAllSpritePalettes();
    gUnknown_02039358 = 0;
    gUnknown_0203935A = 0;
#ifdef SAPPHIRE
    load_intro_part2_graphics(0);
#else
    load_intro_part2_graphics(1);
#endif
    gTasks[taskId].func = Task_IntroStartBikeRide;
}

static void Task_IntroStartBikeRide(u8 taskId)
{
    u8 spriteId;

    if (gUnknown_02039318 == 0)
        LoadCompressedObjectPic(gIntro2BrendanSpriteSheet);
    else
        LoadCompressedObjectPic(gIntro2MaySpriteSheet);
    LoadCompressedObjectPic(gIntro2BicycleSpriteSheet);
#ifdef SAPPHIRE
    LoadCompressedObjectPic(gIntro2LatiasSpriteSheet);
#else
    LoadCompressedObjectPic(gIntro2LatiosSpriteSheet);
#endif
    LoadSpritePalettes(gIntro2SpritePalettes);
    if (gUnknown_02039318 == 0)
        spriteId = intro_create_brendan_sprite(0x110, 100);
    else
        spriteId = intro_create_may_sprite(0x110, 100);
    gSprites[spriteId].callback = sub_813D788;
    gSprites[spriteId].anims = gUnknown_0840AE80;
    gTasks[taskId].data[1] = spriteId;
#ifdef SAPPHIRE
    spriteId = intro_create_latias_sprite(-0x40, 0x3C);
#else
    spriteId = intro_create_latios_sprite(-0x40, 0x3C);
#endif
    gSprites[spriteId].callback = sub_813D880;
    gTasks[taskId].data[2] = spriteId;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, FADE_COLOR_WHITE);
    SetVBlankCallback(VBlankCB_Intro);
#ifdef SAPPHIRE
    gTasks[taskId].data[0] = sub_8148EC0(0, 0x4000, 0x40, 0x10);
    sub_8148C78(0);
#else
    gTasks[taskId].data[0] = sub_8148EC0(1, 0x4000, 0x400, 0x10);
    sub_8148C78(1);
#endif
    gTasks[taskId].func = Task_IntroHandleBikeAndEonMovement;
}

static void Task_IntroHandleBikeAndEonMovement(u8 taskId)
{
    s16 a;
    u16 sine;

    if (gIntroFrameCounter > 1823)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 16, 0, 16, FADE_COLOR_WHITE);
        gTasks[taskId].func = Task_IntroWaitToSetupPart3;
    }
    if (gIntroFrameCounter == 1109)
        gSprites[gTasks[taskId].data[1]].data[0] = 1;
    if (gIntroFrameCounter == 1214)
        gSprites[gTasks[taskId].data[1]].data[0] = 0;
    if (gIntroFrameCounter == 1394)
        gSprites[gTasks[taskId].data[2]].data[0] = 1;
    if (gIntroFrameCounter == 1398)
        gSprites[gTasks[taskId].data[1]].data[0] = 2;
    if (gIntroFrameCounter == 1586)
        gSprites[gTasks[taskId].data[1]].data[0] = 3;
    if (gIntroFrameCounter == 1727)
        gSprites[gTasks[taskId].data[1]].data[0] = 4;

    //TODO: Clean this up
    a = (((u16)gTasks[taskId].data[3] << 16) >> 18) & 0x7F;
    sine = Sin(a, 48);
    gUnknown_0203935A = sine;
    if (gTasks[taskId].data[3] < 512)
        gTasks[taskId].data[3]++;
#ifdef SAPPHIRE
    sub_8149020(0);
#else
    sub_8149020(1);
#endif
}

static void Task_IntroWaitToSetupPart3(u8 taskId)
{
    if (gIntroFrameCounter > 2068)
    {
        DestroyTask(gTasks[taskId].data[0]);
        gTasks[taskId].func = Task_IntroLoadPart3Graphics;
    }
}

static void Task_IntroLoadPart3Graphics(u8 taskId)
{
    intro_reset_and_hide_bgs();
    LZ77UnCompVram(gIntro3Pokeball_Gfx, (void *)VRAM);
    LZ77UnCompVram(gIntro3Pokeball_Tilemap, (void *)(VRAM + 0x4000));
    LoadPalette(gIntro3PokeballPal, 0, 0x200);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    sub_813CE30(0x78, 0x50, 0, 0);
    ResetSpriteData();
    FreeAllSpritePalettes();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, FADE_COLOR_WHITE);
    REG_BG2CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(8) | BGCNT_256COLOR | BGCNT_AFF256x256;
    REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
    gTasks[taskId].func = Task_IntroSpinAndZoomPokeball;
    gIntroFrameCounter = 0;
    m4aSongNumStart(0x1BA);
}

static void Task_IntroSpinAndZoomPokeball(u8 taskId)
{
    gTasks[taskId].data[0] += 0x400;
    if (gTasks[taskId].data[1] <= 0x6BF)
    {
        gTasks[taskId].data[1] += gTasks[taskId].data[2];
        gTasks[taskId].data[2]++;
    }
    else
    {
        gTasks[taskId].func = Task_IntroWaitToSetupPart3DoubleFight;
    }
    sub_813CE30(0x78, 0x50, 0x10000 / gTasks[taskId].data[1], gTasks[taskId].data[0]);
    if (gIntroFrameCounter == 44)
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, FADE_COLOR_WHITE);
}

static void Task_IntroWaitToSetupPart3DoubleFight(u8 taskId)
{
    if (gIntroFrameCounter > 59)
        gTasks[taskId].func = Task_IntroLoadPart3Streaks;
}

//extern u8 gSharedMem[][32];

static void Task_IntroLoadPart3Streaks(u8 taskId)
{
    u16 i;

    intro_reset_and_hide_bgs();
    for (i = 0; i < 32; i++)
    {
        ewram0arr[0][i] = 0;
        ewram0arr[1][i] = 17;
        ewram0arr[2][i] = 34;
    }
    DmaCopy16Defvars(3, gSharedMem, (void *)(VRAM + 0x0), 0x60);
    for (i = 0; i < 0x280; i++)
        ((u16 *)(VRAM + 0x3000))[i] = 0xF001;
    for (i = 0; i < 0x80; i++)
        ((u16 *)(VRAM + 0x3800))[i] = 0xF002;
    for (i = 0; i < 0x180; i++)
        ((u16 *)(VRAM + 0x3900))[i] = 0xF000;
    for (i = 0; i < 0x80; i++)
        ((u16 *)(VRAM + 0x3C00))[i] = 0xF002;
    gPlttBufferUnfaded[0xF0] = RGB_WHITE;
    gPlttBufferFaded[0xF0] = RGB_WHITE;
    sub_813D084(1);
    gPlttBufferUnfaded[0xF2] = RGB_BLACK;
    gPlttBufferFaded[0xF2] = RGB_BLACK;
    LZ77UnCompVram(gIntro3Streaks_Gfx, (void *)(VRAM + 0x4000));
    LZ77UnCompVram(gIntro3Streaks_Tilemap, (void *)(VRAM + 0x7000));
    LoadPalette(gIntro3Streaks_Pal, 0, 0x20);
    ResetSpriteData();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 8;
    LoadCompressedObjectPic(&gIntro3PokeballGfx_Table[0]);
    LoadCompressedObjectPic(&gIntro3MiscGfx_Table[0]);
    LoadCompressedObjectPalette(&gInterfacePokeballPal_Table[0]);
    LoadSpritePalettes(gIntro3MiscPal_Table);
    gTasks[taskId].func = task_intro_14;
}

static void task_intro_14(u8 taskId)
{
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0xA0;
    REG_WININ = 0x1C;
    REG_WINOUT = 0x1D;
    REG_BG3CNT = BGCNT_PRIORITY(3)
               | BGCNT_CHARBASE(0)
               | BGCNT_SCREENBASE(6)
               | BGCNT_16COLOR
               | BGCNT_TXT256x256;
    REG_BG0CNT = BGCNT_PRIORITY(0)
               | BGCNT_CHARBASE(0)
               | BGCNT_SCREENBASE(7)
               | BGCNT_16COLOR
               | BGCNT_TXT256x256;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON;
    gTasks[taskId].data[15] = CreateTask(task_intro_20, 0);
    gTasks[gTasks[taskId].data[15]].data[0] = 0;
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].func = task_intro_15;
}

static void task_intro_15(u8 taskId)
{
    u16 foo = gTasks[taskId].data[0];

    if (gTasks[taskId].data[0] != 32)
    {
        u32 bar; //needed to match for some reason

        gTasks[taskId].data[0] += 4;
        REG_WIN0V = (gTasks[taskId].data[0] * 256) - (bar = foo - 0x9C);
    }
    else
    {
        REG_WIN0V = 0x2080;
        gTasks[taskId].func = task_intro_16;
    }
}

static void task_intro_16(u8 taskId)
{
    gTasks[taskId].func = task_intro_17;
}

static void task_intro_17(u8 taskId)
{
    gUnknown_0203931A = 0;
    gTasks[taskId].func = Task_IntroPokemonBattle;
}

static void Task_IntroPokemonBattle(u8 taskId)
{
    u8 spriteId;

    if (gIntroFrameCounter == 80)
    {
        spriteId = sub_813CE88(SPECIES_SHARPEDO, 0xF0, 0xA0, 5, 1);
        gSprites[spriteId].callback = sub_813DB9C;
        gSprites[spriteId].data[1] = 1;
        gSprites[spriteId].data[2] = 0;
    }
    if (gIntroFrameCounter == 152)
    {
        spriteId = sub_813CE88(SPECIES_DUSKULL, 0, 0xA0, 4, 1);
        gSprites[spriteId].callback = sub_813DB9C;
        gSprites[spriteId].data[1] = 2;
        gSprites[spriteId].data[2] = 1;
    }
    if (gIntroFrameCounter == 219)
    {
        sub_813D084(0);
        spriteId = sub_813CFA8(gUnknown_02039318, 0x110, 0x60, 6);
        gSprites[spriteId].callback = sub_813DE70;
        gTasks[taskId].data[1] = spriteId;
    }
    if (gIntroFrameCounter == 304)
    {
        gTasks[gTasks[taskId].data[15]].data[0] = 4;
        gSprites[gTasks[taskId].data[1]].data[0] = 2;
    }
    if (gIntroFrameCounter == 384)
    {
        gTasks[gTasks[taskId].data[15]].data[0] = 0;
        gSprites[gTasks[taskId].data[1]].data[0] = 4;
    }
    if (gIntroFrameCounter == 400)
    {
        BeginNormalPaletteFade(0xFF0000, 0, 16, 0, RGB(31, 23, 31));
    }
    if (gIntroFrameCounter == 432)
    {
        gSprites[gTasks[taskId].data[1]].data[0] = 5;
    }
    if (gIntroFrameCounter == 462)
    {
        gSprites[gTasks[taskId].data[1]].data[0] = 6;
        gTasks[gTasks[taskId].data[15]].data[0] = 2;
    }
    if (gIntroFrameCounter == 463)
    {
        sub_813D084(1);
        spriteId = sub_813CE88(SPECIES_SHARPEDO, 0xD0, 8, 5, 1);
        gSprites[spriteId].callback = sub_813E10C;
        gTasks[taskId].data[2] = spriteId;
        sub_813E7C0(spriteId);
    }
    if (gIntroFrameCounter == 539)
    {
        spriteId = sub_813CE88(SPECIES_DUSKULL, 0xF8, 0x10, 4, 1);
        gSprites[spriteId].callback = sub_813E10C;
        gTasks[taskId].data[3] = spriteId;
        sub_813E930(spriteId);
    }
    if (gIntroFrameCounter == 623)
    {
        gSprites[gTasks[taskId].data[2]].data[0] = 2;
        gSprites[gTasks[taskId].data[3]].data[0] = 2;
        gTasks[gTasks[taskId].data[15]].data[0] = 3;
    }
    if (gIntroFrameCounter == 624)
    {
        sub_813D084(0);
        spriteId = sub_813CE88(SPECIES_MUDKIP, 0x20, 0x98, 0, 0);
        gSprites[spriteId].callback = sub_813E210;
        gTasks[taskId].data[4] = spriteId;
        InitIntroMudkipAttackAnim(spriteId);
    }
    if (gIntroFrameCounter == 700)
    {
        spriteId = sub_813CE88(SPECIES_TORCHIC, -8, 0x90, 1, 0);
        gSprites[spriteId].callback = sub_813E210;
        gTasks[taskId].data[5] = spriteId;
        InitIntroTorchicAttackAnim(spriteId);
    }
    if (gIntroFrameCounter == 776)
    {
        gUnknown_0203931A = 1;
        gSprites[gTasks[taskId].data[4]].data[0] = 2;
        gSprites[gTasks[taskId].data[5]].data[0] = 2;
        gTasks[gTasks[taskId].data[15]].data[0] = 0;
    }
    if (gIntroFrameCounter == 781)
    {
        sub_813D084(2);
        gSprites[gTasks[taskId].data[2]].data[0] = 3;
        gSprites[gTasks[taskId].data[3]].data[0] = 3;
        gSprites[gTasks[taskId].data[4]].data[0] = 3;
        gSprites[gTasks[taskId].data[5]].data[0] = 3;
        spriteId = CreateSprite(&gSpriteTemplate_840B1F4, 0x78, 0x50, 15);
        gSprites[spriteId].invisible = 1;
    }
    if (gIntroFrameCounter == 800)
        PlaySE(SE_OP_BASYU);
    if (gIntroFrameCounter == 850)
        BeginNormalPaletteFade(0xFFFFFFFF, 4, 0, 16, FADE_COLOR_WHITE);
    if (gIntroFrameCounter == 946)
        gTasks[taskId].func = task_intro_19;
}

static void task_intro_19(u8 taskId)
{
    DestroyTask(taskId);
    SetMainCallback2(MainCB2_EndIntro);
}

static void task_intro_20(u8 taskId)
{
#define BG2_FLAGS (BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(14) | BGCNT_16COLOR | BGCNT_TXT256x256)
#define DISPCNT_FLAGS (DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON)

    gTasks[taskId].data[15]++;
    switch (gTasks[taskId].data[0])
    {
    case 0:
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON;
        REG_BG2CNT = 0;
        gTasks[taskId].data[0] = 0xFF;
        break;
    case 2:
        BeginNormalPaletteFade(0x1, 0, 16, 0, FADE_COLOR_WHITE);
        REG_BG2CNT = BG2_FLAGS;
        REG_DISPCNT = DISPCNT_FLAGS;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[0] = 20;
        //fall through
    case 20:
        REG_BG2VOFS = gTasks[taskId].data[1];
        REG_BG2HOFS = gTasks[taskId].data[2];
        gTasks[taskId].data[1] += 6;
        gTasks[taskId].data[2] -= 8;
        break;
    case 3:
        BeginNormalPaletteFade(0x1, 0, 16, 0, FADE_COLOR_WHITE);
        REG_BG2CNT = BG2_FLAGS;
        REG_DISPCNT = DISPCNT_FLAGS;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[0] = 0x1E;
        //fall through
    case 0x1E:
        REG_BG2VOFS = gTasks[taskId].data[1];
        REG_BG2HOFS = gTasks[taskId].data[2];
        gTasks[taskId].data[1] -= 6;
        gTasks[taskId].data[2] += 8;
        break;
    case 4:
        BeginNormalPaletteFade(0x1, 5, 0, 16, RGB(23, 31, 13));
        REG_BG2CNT = BG2_FLAGS;
        REG_DISPCNT = DISPCNT_FLAGS;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 8;
        gTasks[taskId].data[0] = 0x28;
        //fall through
    case 0x28:
        REG_BG2VOFS = gTasks[taskId].data[1];
        REG_BG2HOFS = gTasks[taskId].data[2];
        gTasks[taskId].data[1] -= gTasks[taskId].data[3];
        gTasks[taskId].data[2] += gTasks[taskId].data[3];
        if (!(gTasks[taskId].data[15] & 7) && gTasks[taskId].data[3] != 0)
            gTasks[taskId].data[3]--;
        break;
    case 0xFF:  //needed to prevent jump table optimization
        break;
    }

#undef BG2_FLAGS
#undef DISPCNT_FLAGS
}

static void intro_reset_and_hide_bgs(void)
{
    REG_DISPCNT = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
}

static void sub_813CCE8(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    default:
    case 0:
        REG_BLDCNT = 0x3F50;
        REG_BLDALPHA = 0x1000;
        REG_BLDY = 0;
        gTasks[taskId].data[1] = 0x40;
        gTasks[taskId].data[0] = 1;
        break;
    case 1:
        if (gTasks[taskId].data[1] != 0)
        {
            u8 foo;

            gTasks[taskId].data[1]--;
            foo = gTasks[taskId].data[1] / 2;
            REG_BLDALPHA = gUnknown_08393E64[foo];
        }
        else
        {
            REG_BLDALPHA = gUnknown_08393E64[0];
            gTasks[taskId].data[1] = 0x80;
            gTasks[taskId].data[0]++;
        }
        break;
    case 2:
        if (gTasks[taskId].data[1] != 0)
        {
            //tail merge at _0813CE0E
            gTasks[taskId].data[1]--;
        }
        else
        {
            gTasks[taskId].data[1] = 0;  //redundant?
            gTasks[taskId].data[0]++;
        }
        break;
    case 3:
        if (gTasks[taskId].data[1] <= 0x3D)
        {
            u8 foo;

            gTasks[taskId].data[1]++;
            foo = gTasks[taskId].data[1] / 2;
            REG_BLDALPHA = gUnknown_08393E64[foo];
        }
        else
        {
            //_0813CDE0
            REG_BLDALPHA = gUnknown_08393E64[0x1F];
            gTasks[taskId].data[1] = 0x10;
            gTasks[taskId].data[0]++;
        }
        break;
    case 4:
        if (gTasks[taskId].data[1] != 0)
        {
            gTasks[taskId].data[1]--;
        }
        else
        {
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;
            REG_BLDY = 0;
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_813CE30(u16 scrX, u16 scrY, u16 zoom, u16 alpha)
{
    struct BgAffineSrcData src;
    struct BgAffineDstData dest;

    src.texX = 0x8000;
    src.texY = 0x8000;
    src.scrX = scrX;
    src.scrY = scrY;
    src.sx = zoom;
    src.sy = zoom;
    src.alpha = alpha;
    BgAffineSet(&src, &dest, 1);
    REG_BG2PA = dest.pa;
    REG_BG2PB = dest.pb;
    REG_BG2PC = dest.pc;
    REG_BG2PD = dest.pd;
    REG_BG2X = dest.dx;
    REG_BG2Y = dest.dy;
}

static u16 sub_813CE88(u16 species, s16 x, s16 y, u16 d, u8 front)
{
    const u8 *lzPaletteData;
    u8 spriteId;

    if (front)
        LoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, 0x2000000, gUnknown_0840B5A0[d], species, 0, 1);
    else
        LoadSpecialPokePic(&gMonBackPicTable[species], gMonBackPicCoords[species].coords, gMonBackPicCoords[species].y_offset, 0x2000000, gUnknown_0840B5A0[d], species, 0, 0);
    lzPaletteData = GetMonSpritePalFromOtIdPersonality(species, 0, 0xFFFF);
    LoadCompressedPalette(lzPaletteData, 0x100 + d * 0x10, 0x20);
    sub_8143648(d, d);
    spriteId = CreateSprite(&gUnknown_02024E8C, x, y, (d + 1) * 4);
    gSprites[spriteId].oam.paletteNum = d;
    gSprites[spriteId].oam.priority = 1;
    return spriteId;
}

static u8 sub_813CFA8(u16 a, u16 b, u16 c, u16 d)
{
    u8 spriteId;

    DecompressPicFromTable_2(&gTrainerBackPicTable[a], gTrainerBackPicCoords[a].coords, gTrainerBackPicCoords[a].y_offset, (void *)0x2000000, gUnknown_0840B5A0[d], a);
    LoadCompressedPalette(gTrainerBackPicPaletteTable[a].data, 0x100 + d * 0x10, 0x20);
    sub_8143680(d, d);
    gUnknown_02024E8C.anims = gUnknown_0840B064;
    spriteId = CreateSprite(&gUnknown_02024E8C, b, c, 1);
    gSprites[spriteId].oam.paletteNum = d;
    gSprites[spriteId].oam.priority = 1;
    return spriteId;
}

static void sub_813D084(u8 a)
{
    u16 color;

    switch (a)
    {
    default:
    case 0:
        color = RGB(22, 31, 15);
        break;
    case 1:
        color = RGB(31, 14, 12);
        break;
    case 2:
        color = RGB(12, 12, 20);
        break;
    }
    gPlttBufferUnfaded[241] = color;
    gPlttBufferFaded[241] = color;
}

static void sub_813D0CC(struct Sprite *sprite)
{
    u8 r0;

    if (sprite->data[2] >= 192)
    {
        if (sprite->data[3] != 0)
        {
            sprite->data[3]--;
        }
        else
        {
            sprite->invisible = FALSE;
            SetOamMatrix(sprite->data[1], sprite->data[2], 0, 0, sprite->data[2]);
            sprite->data[2] = (sprite->data[2] * 95) / 100;
            r0 = (sprite->data[2] - 192) / 128 + 9;
            if (r0 > 15)
                r0 = 15;
            sprite->oam.paletteNum = r0;
        }
    }
    else
    {
        DestroySprite(sprite);
    }
}

static void sub_813D158(struct Sprite *sprite)
{
    if (gSprites[sprite->data[7]].data[7] != 0)
    {
        sprite->invisible = TRUE;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        StartSpriteAnim(sprite, 3);
        sprite->data[2] = 1024;
        sprite->data[3] = 8 * (sprite->data[1] & 3);
        sprite->callback = sub_813D0CC;
        sprite->oam.shape = 1;
        sprite->oam.size = 3;
        CalcCenterToCornerVec(sprite, 1, 3, 2);
    }
    else
    {
        sprite->pos2.x = gSprites[sprite->data[7]].pos2.x;
        sprite->pos2.y = gSprites[sprite->data[7]].pos2.y;
        sprite->pos1.x = gSprites[sprite->data[7]].pos1.x;
        sprite->pos1.y = gSprites[sprite->data[7]].pos1.y;
    }
}

static void sub_813D208(struct Sprite *sprite)
{
    if (sprite->data[0] != 0)
        sprite->callback = sub_813D220;
}

static void sub_813D220(struct Sprite *sprite)
{
    if (sprite->pos1.x <= 116)
    {
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos1.x += 4;
        sprite->pos2.x = -4;
        sprite->data[4] = 128;
        sprite->callback = sub_813D368;
    }
    else
    {
        u16 data2;
        u16 data3;
        u16 data4;
        s16 sin1;
        s16 sin2;
        s16 sin3;
        s16 sin4;
        s16 var1;
        s16 var2;
        s16 var3;
        s16 var4;
        s16 temp;

        data4 = sprite->data[4];
        sin1 = gSineTable[(u8)data4];
        sin2 = gSineTable[(u8)(data4 + 64)];
        sprite->data[4] += 2;
        sprite->pos2.y = sin1 / 32;
        sprite->pos1.x--;
        if (sprite->pos1.x & 1)
            sprite->pos1.y++;
        temp = -sin2 / 16;
        data2 = sprite->data[2];
        data3 = sprite->data[3];
        sin3 = gSineTable[(u8)(temp - 16)];
        sin4 = gSineTable[(u8)(temp + 48)];
        var1 = sin4 * data2 / 256;
        var2 = -sin3 * data3 / 256;
        var3 = sin3 * data2 / 256;
        var4 = sin4 * data3 / 256;
        SetOamMatrix(sprite->data[1], data2, 0, 0, data3);
        SetOamMatrix(sprite->data[1] + 1, var1, var3, var2, var4);
        SetOamMatrix(sprite->data[1] + 2, var1, var3, var2 * 2, var4 * 2);
    }
}

static void sub_813D368(struct Sprite *sprite)
{
    SetOamMatrix(sprite->data[1], sprite->data[6] + 64, 0, 0, sprite->data[6] + 64);
    SetOamMatrix(sprite->data[1] + 1, sprite->data[6] + 64, 0, 0, sprite->data[6] + 64);
    SetOamMatrix(sprite->data[1] + 2, sprite->data[6] + 64, 0, 0, sprite->data[6] + 64);
    if (sprite->data[4] != 64)
    {
        u16 data4;

        sprite->data[4] -= 8;
        data4 = sprite->data[4];
        sprite->pos2.x = gSineTable[(u8)(data4 + 64)] / 64;
        sprite->pos2.y = gSineTable[(u8)data4] / 64;
    }
    else
    {
        sprite->data[4] = 0;
        sprite->callback = sub_813D414;
    }
}

static void sub_813D414(struct Sprite *sprite)
{
    if (sprite->data[0] != 2)
    {
        s16 r2;

        sprite->data[4] += 8;
        r2 = gSineTable[(u8)sprite->data[4]] / 16 + 64;
        sprite->pos2.x = gSineTable[(u8)(r2 + 64)] / 64;
        sprite->pos2.y = gSineTable[(u8)r2] / 64;
    }
    else
    {
        sprite->callback = SpriteCB_WaterDropFall;
    }
}

static void SpriteCB_WaterDropFall(struct Sprite *sprite)
{
    if (sprite->pos1.y < sprite->data[5])
    {
        sprite->pos1.y += 4;
    }
    else
    {
        sprite->data[7] = 1;
        sprite->invisible = TRUE;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        StartSpriteAnim(sprite, 3);
        sprite->data[2] = 1024;
        sprite->data[3] = 8 * (sprite->data[1] & 3);
        sprite->callback = sub_813D0CC;
        sprite->oam.shape = 1;
        sprite->oam.size = 3;
        CalcCenterToCornerVec(sprite, 1, 3, 2);
    }
}

//Duplicate function
static void SpriteCB_WaterDropFall_2(struct Sprite *sprite)
{
    if (sprite->pos1.y < sprite->data[5])
    {
        sprite->pos1.y += 4;
    }
    else
    {
        sprite->data[7] = 1;
        sprite->invisible = TRUE;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        StartSpriteAnim(sprite, 3);
        sprite->data[2] = 1024;
        sprite->data[3] = 8 * (sprite->data[1] & 3);
        sprite->callback = sub_813D0CC;
        sprite->oam.shape = 1;
        sprite->oam.size = 3;
        CalcCenterToCornerVec(sprite, 1, 3, 2);
    }
}

static u8 CreateWaterDrop(s16 x, s16 y, u16 c, u16 d, u16 e, u8 fallImmediately)
{
    u8 spriteId;
    u8 oldSpriteId;

    spriteId = CreateSprite(&gSpriteTemplate_840AE20, x, y, 0);
    gSprites[spriteId].data[0] = 0;
    gSprites[spriteId].data[7] = 0;
    gSprites[spriteId].data[1] = d;
    gSprites[spriteId].data[2] = c;
    gSprites[spriteId].data[3] = c;
    gSprites[spriteId].data[5] = e;
    gSprites[spriteId].data[6] = c;
    gSprites[spriteId].oam.affineMode = 3;
    gSprites[spriteId].oam.matrixNum = d;
    CalcCenterToCornerVec(&gSprites[spriteId], 0, 2, 2);
    StartSpriteAnim(&gSprites[spriteId], 2);
    if (!fallImmediately)
        gSprites[spriteId].callback = sub_813D208;
    else
        gSprites[spriteId].callback = SpriteCB_WaterDropFall_2;
    oldSpriteId = spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_840AE20, x, y, 0);
    gSprites[spriteId].data[7] = oldSpriteId;
    gSprites[spriteId].data[1] = d + 1;
    gSprites[spriteId].oam.affineMode = 3;
    gSprites[spriteId].oam.matrixNum = d + 1;
    CalcCenterToCornerVec(&gSprites[spriteId], 0, 2, 2);
    gSprites[spriteId].callback = sub_813D158;

    spriteId = CreateSprite(&gSpriteTemplate_840AE20, x, y, 0);
    gSprites[spriteId].data[7] = oldSpriteId;
    gSprites[spriteId].data[1] = d + 2;
    StartSpriteAnim(&gSprites[spriteId], 1);
    gSprites[spriteId].oam.affineMode = 3;
    gSprites[spriteId].oam.matrixNum = d + 2;
    CalcCenterToCornerVec(&gSprites[spriteId], 0, 2, 2);
    gSprites[spriteId].callback = sub_813D158;

    SetOamMatrix(d, c + 32, 0, 0, c + 32);
    SetOamMatrix(d + 1, c + 32, 0, 0, c + 32);
    SetOamMatrix(d + 2, c + 32, 0, 0, 2 * (c + 32));

    return oldSpriteId;
}

static void sub_813D788(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        StartSpriteAnimIfDifferent(sprite, 0);
        sprite->pos1.x--;
        break;
    case 1:
        StartSpriteAnimIfDifferent(sprite, 0);
        if (gIntroFrameCounter & 7)
            return;
        sprite->pos1.x++;
        break;
    case 2:
        StartSpriteAnimIfDifferent(sprite, 2);
        if (sprite->pos1.x <= 120 || (gIntroFrameCounter & 7))
            sprite->pos1.x++;
        break;
    case 3:
        StartSpriteAnimIfDifferent(sprite, 3);
        break;
    case 4:
        StartSpriteAnimIfDifferent(sprite, 0);
        if (sprite->pos1.x > -32)
            sprite->pos1.x -= 2;
        break;
    }
    if (gIntroFrameCounter & 7)
        return;
    if (sprite->pos2.y != 0)
    {
        sprite->pos2.y = 0;
    }
    else
    {
        switch (Random() & 3)
        {
        case 0:
            sprite->pos2.y = -1;
            break;
        case 1:
            sprite->pos2.y = 1;
            break;
        case 2:
        case 3:
            sprite->pos2.y = 0;
            break;
        }
    }
}

static void sub_813D880(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        break;
    case 1:
        if (sprite->pos2.x + sprite->pos1.x < 304)
            sprite->pos2.x += 8;
        else
            sprite->data[0] = 2;
        break;
    case 2:
        if (sprite->pos2.x + sprite->pos1.x > 120)
            sprite->pos2.x -= 1;
        else
            sprite->data[0] = 3;
        break;
    case 3:
        if (sprite->pos2.x > 0)
            sprite->pos2.x -= 2;
        break;
    }
    sprite->pos2.y = Sin((u8)sprite->data[1], 8) - gUnknown_0203935A;
    sprite->data[1] += 4;
}

static void sub_813D908(struct Sprite *sprite)
{
    if (gTasks[sprite->data[0]].data[0] == 0)
    {
        sprite->invisible = TRUE;
    }
    else if (gTasks[sprite->data[0]].data[0] != 4)
    {
        sprite->invisible = FALSE;
    }
    else
    {
        DestroySprite(sprite);
    }
}

static u8 CreateGameFreakLogo(s16 a, s16 b, u8 c)
{
    u8 spriteId;
    u16 i;

    for (i = 0; i < 9; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_840AF94, gUnknown_0840AF50[i][1] + a, b - 4, 0);
        gSprites[spriteId].data[0] = c;
        StartSpriteAnim(&gSprites[spriteId], gUnknown_0840AF50[i][0]);
    }
    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_840AFAC, gUnknown_0840AF74[i][1] + a, b + 12, 0);
        gSprites[spriteId].data[0] = c;
        StartSpriteAnim(&gSprites[spriteId], gUnknown_0840AF74[i][0]);
    }
    spriteId = CreateSprite(&gSpriteTemplate_840AFC4, 120, b - 4, 0);
    gSprites[spriteId].data[0] = c;

    return spriteId;
}

static void sub_813DA64(struct Sprite *sprite)
{
    sprite->data[7]++;

    switch (sprite->data[0])
    {
    case 0:
    default:
        sprite->oam.affineMode = 3;
        sprite->oam.matrixNum = 1;
        CalcCenterToCornerVec(sprite, 1, 3, 3);
        sprite->invisible = FALSE;
        sprite->data[0] = 1;
        sprite->data[1] = 128;
        sprite->data[2] = -24;
        sprite->data[3] = 0;
        break;
    case 1:
    {
        s16 sin;
        s16 cos;
        s16 a;
        s16 b;
        s16 c;
        s16 d;

        if (sprite->data[3] < 0x50)
        {
            sprite->pos2.y = -Sin((u8)sprite->data[3], 0x78);
            sprite->pos2.x = -Sin((u8)sprite->data[3], 0x8C);
            if (sprite->data[3] > 64)
                sprite->oam.priority = 3;
        }
        sin = gSineTable[(u8)sprite->data[2]];
        cos = gSineTable[(u8)(sprite->data[2] + 64)];
        d =  cos * sprite->data[1] / 256;
        c = -sin * sprite->data[1] / 256;
        b =  sin * sprite->data[1] / 256;
        a  = cos * sprite->data[1] / 256;

        SetOamMatrix(1, a, b, c, d);

        if (sprite->data[1] < 0x100)
            sprite->data[1] += 8;
        else
            sprite->data[1] += 32;
        if (sprite->data[2] < 0x18)
            sprite->data[2] += 1;
        if (sprite->data[3] < 64)
            sprite->data[3] += 2;
        else if (!(sprite->data[7] & 3))
            sprite->data[3] += 1;
        break;
    }
    }
}

static void sub_813DB9C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    default:
        if (sprite->data[2] != 0)
            sprite->hFlip = TRUE;
        else
            sprite->hFlip = FALSE;
        sprite->data[0] = 1;
        //fall through
    case 1:
        if (sprite->pos1.y > 96)
        {
            sprite->pos1.y -= 4;
            if (sprite->data[2] != 0)
                sprite->pos1.x += 2;
            else
                sprite->pos1.x -= 2;
        }
        else
        {
            sprite->data[0]++;
            sprite->data[3] = 8;
        }
        break;
    case 2:
        if (sprite->data[3] != 0)
        {
            sprite->data[3]--;
        }
        else
        {
            sprite->data[0]++;
            sprite->data[3] = 0;  //redundant?
        }
        break;
    case 3:
        sprite->oam.affineMode = 3;
        sprite->oam.matrixNum = sprite->data[1];
        CalcCenterToCornerVec(sprite, 0, 3, 3);
        if (sprite->data[2] != 0)
            SetOamMatrix(sprite->data[1], -256, 0, 0, 256);
        else
            SetOamMatrix(sprite->data[1], 256, 0, 0, 256);
        sprite->data[0]++;
        sprite->data[4] = 0;
        break;
    case 4:
        sprite->data[4]++;
        if (sprite->pos1.y + sprite->pos2.y > -32
         && sprite->pos1.x + sprite->pos2.x > -64)
        {
            u16 r2;

            sprite->pos2.y = -(sprite->data[4] * sprite->data[4]) / 8;
            if (sprite->data[2] != 0)
                sprite->pos2.x += sprite->data[4];
            else
                sprite->pos2.x -= sprite->data[4];
            if (sprite->data[3] < 128)
                sprite->data[3] += 8;
            r2 = 256 - sprite->data[3];
            if (sprite->data[2] != 0)
                SetOamMatrix(sprite->data[1], -r2, 0, 0, r2);
            else
                SetOamMatrix(sprite->data[1], r2, 0, 0, r2);
        }
        else
        {
            DestroySprite(sprite);
        }
    }
}

static void sub_813DD58(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    default:
        sprite->invisible = FALSE;
        sprite->oam.affineMode = 1;
        sprite->oam.matrixNum = sprite->data[1];
        sprite->data[3] = 2048;
        sprite->data[0] = 1;
        //fall through
    case 1:
        if (sprite->data[3] > 256)
        {
            sprite->data[3] -= 128;
            if (sprite->data[2] != 0)
                SetOamMatrix(sprite->data[1], -sprite->data[3], 0, 0, sprite->data[3]);
            else
                SetOamMatrix(sprite->data[1], sprite->data[3], 0, 0, sprite->data[3]);
        }
        else
        {
            if (sprite->data[2] != 0)
                SetOamMatrix(sprite->data[1], -256, 0, 0, 256);
            else
                SetOamMatrix(sprite->data[1], 256, 0, 0, 256);
            sprite->data[0]++;
        }
        break;
    case 2:
        break;
    case 3:
        sprite->data[4]++;
        sprite->pos2.y = sprite->data[4] * sprite->data[4] / 32;
        if (sprite->data[2] != 0)
            sprite->pos2.x = sprite->data[4] / 4;
        else
            sprite->pos2.x = -(sprite->data[4] / 4);
        break;
    }
}

static void sub_813DE70(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    default:
        if (sprite->pos1.x > 40)
        {
            sprite->pos1.x -= 4;
        }
        else
        {
            StartSpriteAnim(sprite, 1);
            sprite->data[6] = CreateSprite(&gSpriteTemplate_840B084, 16, 104, 100);
            sprite->data[7] = CreateSprite(&gSpriteTemplate_840B084, 12, 106, 101);
            sprite->data[0] = 1;
        }
        break;
    case 1:
        break;
    case 2:
        StartSpriteAnim(sprite, 2);
        gSprites[sprite->data[6]].data[0] = 1;
        gSprites[sprite->data[7]].data[0] = 2;
        sprite->data[0]++;
        break;
    case 3:
        if (sprite->pos1.y > 160)
        {
            sprite->invisible = 1;
            sprite->data[0] = 1;
        }
        else
        {
            sprite->pos1.y += 2;
            sprite->pos1.x--;
        }
        break;
    case 4:
    {
        s16 r4, r5;

        r5 = gSprites[sprite->data[6]].pos1.x + gSprites[sprite->data[6]].pos2.x;
        r4 = gSprites[sprite->data[6]].pos1.y + gSprites[sprite->data[6]].pos2.y;
        DestroySprite(&gSprites[sprite->data[6]]);
        sprite->data[6] = sub_813CE88(SPECIES_TORCHIC, r5, r4, 2, 1);
        gSprites[sprite->data[6]].callback = sub_813DD58;
        gSprites[sprite->data[6]].invisible = TRUE;
        gSprites[sprite->data[6]].data[1] = 1;
        gSprites[sprite->data[6]].data[2] = 1;
        sub_813E580(r5, r4);

        r5 = gSprites[sprite->data[7]].pos1.x + gSprites[sprite->data[7]].pos2.x;
        r4 = gSprites[sprite->data[7]].pos1.y + gSprites[sprite->data[7]].pos2.y;
        DestroySprite(&gSprites[sprite->data[7]]);
        sprite->data[7] = sub_813CE88(SPECIES_MUDKIP, r5, r4, 3, 1);
        gSprites[sprite->data[7]].callback = sub_813DD58;
        gSprites[sprite->data[7]].invisible = TRUE;
        gSprites[sprite->data[7]].data[1] = 2;
        gSprites[sprite->data[7]].data[2] = 0;
        sub_813E580(r5, r4);

        BeginNormalPaletteFade(0xFF0000, 0, 16, 16, RGB(31, 23, 31));
        sprite->data[0] = 1;
        break;
    }
    case 5:
        gSprites[sprite->data[6]].data[0] = 3;
        gSprites[sprite->data[7]].data[0] = 3;
        break;
    case 6:
        DestroySprite(&gSprites[sprite->data[6]]);
        DestroySprite(&gSprites[sprite->data[7]]);
        DestroySprite(sprite);
        break;
    }
}

static void sub_813E10C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    default:
        if (sprite->pos2.x > -56)
        {
            sprite->pos2.x -= 8;
            sprite->pos2.y += 6;
        }
        else
        {
            sprite->data[6] = sprite->pos1.x;
            sprite->data[7] = sprite->pos1.y;
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[0] = 1;
            sprite->data[1] = 0;
        }
        break;
    case 1:
        if (!(sprite->data[1] & 1))
        {
            if (sprite->data[1] & 2)
            {
                sprite->pos2.x = -1;
                sprite->pos2.y = 1;
            }
            else
            {
                sprite->pos2.x = 0;
                sprite->pos2.y = 0;
            }
        }
        sprite->data[1]++;
        break;
    case 2:
        sprite->invisible = TRUE;
        sprite->pos1.x = sprite->data[6];
        sprite->pos1.y = sprite->data[7];
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        break;
    case 3:
        sprite->invisible = FALSE;
        sprite->data[1]++;
        //fall through
    case 4:
        if (sprite->pos2.x > -56)
        {
            sprite->pos2.x -= 4;
            sprite->pos2.y += 3;
        }
        else
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[0] = 1;
        }
        break;
    }
}

static void sub_813E210(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    default:
        if (sprite->pos2.x < 56)
        {
            sprite->pos2.x += 8;
            sprite->pos2.y -= 6;
        }
        else
        {
            sprite->data[6] = sprite->pos1.x;
            sprite->data[7] = sprite->pos1.y;
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[0] = 1;
            sprite->data[1] = 0;
        }
        break;
    case 1:
        if (!(sprite->data[1] & 1))
        {
            if (sprite->data[1] & 2)
            {
                sprite->pos2.x = 1;
                sprite->pos2.y = -1;
            }
            else
            {
                sprite->pos2.x = 0;
                sprite->pos2.y = 0;
            }
        }
        sprite->data[1]++;
        break;
    case 2:
        sprite->invisible = TRUE;
        sprite->pos1.x = sprite->data[6];
        sprite->pos1.y = sprite->data[7];
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        break;
    case 3:
        sprite->invisible = FALSE;
        sprite->data[1]++;
        //fall through
    case 4:
        if (sprite->pos2.x < 56)
        {
            sprite->pos2.x += 4;
            sprite->pos2.y -= 3;
        }
        else
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[0] = 1;
        }
        break;
    }
}

static void sub_813E30C(struct Sprite *sprite)
{
    u16 r4, r1;

    sprite->data[7]++;
    switch (sprite->data[0])
    {
    case 0:
    default:
        break;
    case 1:
        sprite->oam.affineMode = 1;
        sprite->oam.matrixNum = 1;
        sprite->data[0] = 10;
        sprite->data[4] = 36;
        //fall through
    case 10:
        if (sprite->pos1.x <= 144)
        {
            sprite->pos1.x += 4;
            sprite->pos1.y -= 1;
            sprite->pos2.y = -Sin((u8)sprite->data[2], 24);
            sprite->data[2] += 4;
        }
        sprite->data[3] -= sprite->data[4];
        if ((sprite->data[7] & 1) && sprite->data[4] != 0)
            sprite->data[4]--;
        r4 = gSineTable[(u8)sprite->data[3]];
        r1 = gSineTable[(u8)(sprite->data[3] + 64)];
        SetOamMatrix(1, r1, r4, -r4, r1);
        break;
    case 2:
        sprite->oam.affineMode = 1;
        sprite->oam.matrixNum = 2;
        sprite->data[0] = 20;
        sprite->data[4] = 36;
        //fall through
    case 20:
        if (sprite->pos1.x <= 96)
        {
            sprite->pos1.x += 3;
            sprite->pos1.y -= 1;
            sprite->pos2.y = -Sin((u8)sprite->data[2], 24);
            sprite->data[2] += 4;
        }
        sprite->data[3] -= sprite->data[4];
        if ((sprite->data[7] & 1) && sprite->data[4] != 0)
            sprite->data[4]--;
        r4 = gSineTable[(u8)sprite->data[3]];
        r1 = gSineTable[(u8)(sprite->data[3] + 64)];
        SetOamMatrix(2, r1, r4, -r4, r1);
        break;
    }
}

static void sub_813E4B8(struct Sprite *sprite)
{
    u16 r4;
    u16 r2;
    u16 r1;

    sprite->data[7]++;
    if (sprite->data[7] & 1)
        sprite->invisible = FALSE;
    else
        sprite->invisible = TRUE;
    if (sprite->data[2] >= 64)
    {
        DestroySprite(sprite);
        return;
    }
    sprite->data[2] += 2;
    r4 = Sin((u8)sprite->data[2], 40);
    sprite->pos2.x = Cos((u8)(sprite->data[0] * 32), r4);
    sprite->pos2.y = Sin((u8)(sprite->data[0] * 32), r4);
    if (sprite->data[0] == 0)
    {
        sprite->data[3] -= sprite->data[1];
        if ((sprite->data[7] & 1) && sprite->data[1] != 0)
            sprite->data[1]--;
        r2 = gSineTable[(u8)sprite->data[3]];
        r1 = gSineTable[(u8)(sprite->data[3] + 64)];
        SetOamMatrix(16, r1, r2, -r2, r1);
    }
}

static void sub_813E580(u16 x, u16 y)
{
    u8 i;
    u8 spriteId;

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_840B0B0, x, y, 0);
        gSprites[spriteId].oam.affineMode = 1;
        gSprites[spriteId].oam.matrixNum = 16;
        gSprites[spriteId].data[0] = i;
        gSprites[spriteId].data[1] = 32;
    }
}

static void sub_813E5E0(struct Sprite *sprite)
{
    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->invisible = gSprites[sprite->data[0]].invisible;
        if (sprite->data[7] < 12)
            sprite->data[7]++;
        sprite->data[6] += 4;
        sprite->pos1.x = sprite->data[4] + gSineTable[(u8)(sprite->data[3] + 64)] * sprite->data[6] / 256;
        //This useless '+ 0' is needed to make the asm match
        sprite->pos1.y = sprite->data[5] + gSineTable[(u8)(sprite->data[3] + 0)] * sprite->data[6] / 256;
        sprite->pos2.y = gSineTable[(u8)(sprite->data[1] + 0)] * sprite->data[7] / 256;
        sprite->data[1] += 16;
        if (sprite->pos1.y > sprite->data[2])
            DestroySprite(sprite);
    }
}

static void sub_813E6C0(struct Sprite *sprite)
{
    u8 spriteId;
    u8 i;
    s16 var1;
    s16 var2;

    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->data[7]++;
        sprite->invisible = TRUE;
        if (gSprites[sprite->data[0]].data[0] == 1 && !(sprite->data[7] & 3))
        {
            var1 = sprite->data[1] + gSprites[sprite->data[0]].pos1.x;
            var2 = sprite->data[2] + gSprites[sprite->data[0]].pos1.y;
            for (i = 0; i < 3; i++)
            {
                u8 r3 = gSprites[sprite->data[0]].subpriority - 1;
                //Make redundant copies of these variables to get the asm to match
                s16 _var1 = var1;
                s16 _var2 = var2;

                spriteId = CreateSprite(&gSpriteTemplate_840B0DC, _var1, _var2, r3);
                if (spriteId != 64)
                {
                    gSprites[spriteId].data[0] = sprite->data[0];
                    gSprites[spriteId].data[1] = (((sprite->data[7] >> 2) & 7) << 5) + i * 85;
                    gSprites[spriteId].data[2] = sprite->data[3];
                    gSprites[spriteId].data[3] = 104;
                    gSprites[spriteId].data[4] = var1;
                    gSprites[spriteId].data[5] = var2;
                    gSprites[spriteId].data[6] = 0;
                }
            }
        }
    }
}

static void sub_813E7C0(u8 a)
{
    u8 spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_840B0F4, 0, 0, 0);
    if (spriteId != 64)
    {
        gSprites[spriteId].data[0] = a;
        gSprites[spriteId].data[1] = -12;
        gSprites[spriteId].data[2] = 0;
        gSprites[spriteId].data[3] = 136;
    }
}

static void sub_813E804(struct Sprite *sprite)
{
    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->invisible = gSprites[sprite->data[0]].invisible;
        sprite->data[7]++;
        if (sprite->data[3] < 40)
            sprite->data[3] += 2;
        //This useless '+ 0' is needed to make the asm match
        sprite->pos1.x = gSprites[sprite->data[0]].pos1.x + gSprites[sprite->data[0]].pos2.x + gSineTable[(u8)(sprite->data[1] + 64)] * sprite->data[3] / 256;
        sprite->pos1.y = gSprites[sprite->data[0]].pos1.y + gSprites[sprite->data[0]].pos2.y + gSineTable[(u8)(sprite->data[1] + 0)] * sprite->data[3] / 512;
        sprite->data[1] += 2;
        sprite->pos2.y = gSineTable[(u8)(sprite->data[2] + 0)] / 32;
        sprite->data[2] += 8;
        if ((sprite->data[1] & 0xFF) < 128)
            sprite->subpriority = gSprites[sprite->data[0]].subpriority - 1;
        else
            sprite->subpriority = gSprites[sprite->data[0]].subpriority + 1;
    }
}

static void sub_813E930(u8 a)
{
    u8 i;
    u8 spriteId;

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_840B124, gSprites[a].pos1.x, gSprites[a].pos1.y, 0);
        if (spriteId != 64)
        {
            gSprites[spriteId].data[0] = a;
            gSprites[spriteId].data[1] = i * 32;
        }
    }
}

static void sub_813E980(struct Sprite *sprite)
{
    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        u8 r0;
        u16 matrixNum;

        sprite->invisible = gSprites[sprite->data[0]].invisible;
        sprite->data[7]++;
        sprite->data[6] += 8;
        sprite->pos1.x = sprite->data[4] + gSineTable[(u8)(sprite->data[3] + 64)] * sprite->data[6] / 256;
        sprite->pos1.y = sprite->data[5] + gSineTable[(u8)(sprite->data[3] + 0)] * sprite->data[6] / 256;
        r0 = sprite->data[6] / 16;
        if (r0 > 9)
            r0 = 9;
        matrixNum = (r0 + 18) & 31;
        sprite->oam.matrixNum = matrixNum;
        if (sprite->data[6] > 160)
            DestroySprite(sprite);
    }
}

static void sub_813EA60(struct Sprite *sprite)
{
    bool32 r6;
    s16 r1, r2;
    u8 spriteId;

    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->data[7]++;
        sprite->invisible = TRUE;
        if (gSprites[sprite->data[0]].data[0] == 1)
        {
            r6 = (sprite->data[7] & 1);
            if (!r6)
            {
                r1 = sprite->data[1] + gSprites[sprite->data[0]].pos1.x;
                r2 = sprite->data[2] + gSprites[sprite->data[0]].pos1.y;
                spriteId = CreateSprite(&gSpriteTemplate_840B150, r1, r2, gSprites[sprite->data[0]].subpriority + 1);
                if (spriteId != 64)
                {
                    gSprites[spriteId].oam.affineMode = 3;
                    gSprites[spriteId].oam.matrixNum = 18;
                    CalcCenterToCornerVec(&gSprites[spriteId], 0, 1, 3);
                    gSprites[spriteId].data[0] = sprite->data[0];
                    gSprites[spriteId].data[3] = gUnknown_0840B168[(sprite->data[7] >> 1) & 7];
                    gSprites[spriteId].data[4] = r1;
                    gSprites[spriteId].data[5] = r2;
                    gSprites[spriteId].data[6] = r6;
                }
            }
        }
    }
}

static void InitIntroTorchicAttackAnim(u8 a)
{
    u8 spriteId;
    u8 i;

    spriteId = CreateSprite(&gSpriteTemplate_840B170, 0, 0, 0);
    if (spriteId != 64)
    {
        gSprites[spriteId].data[0] = a;
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].data[2] = 8;
        gSprites[spriteId].data[3] = 24;
    }
    for (i = 0; i < 10; i++)
    {
        SetOamMatrix(18 + i, gUnknown_0840B188[i], 0, 0, gUnknown_0840B188[i]);
    }
}

static void sub_813EBBC(struct Sprite *sprite)
{
    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->invisible = gSprites[sprite->data[0]].invisible;
        sprite->data[7] += 1;
        sprite->data[6] += 8;
        sprite->pos1.x = sprite->data[4] + gSineTable[(u8)(sprite->data[3] + 64)] * sprite->data[6] / 256;
        sprite->pos1.y = sprite->data[5] + gSineTable[(u8)(sprite->data[3] + 0)] * sprite->data[6] / 256;
        sprite->pos2.y = gSineTable[(u8)(sprite->data[1] + 0)] / 64;
        sprite->data[1] += 16;
        if (sprite->pos1.y < sprite->data[2])
            DestroySprite(sprite);
    }
}

static void sub_813EC90(struct Sprite *sprite)
{
    bool32 r6;
    s16 r1, r2;
    u8 spriteId;
    u16 foo;

    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->data[7]++;
        sprite->invisible = TRUE;
        if (gSprites[sprite->data[0]].data[0] == 1)
        {
            r6 = sprite->data[7] & 1;
            if (!r6)
            {
                r1 = sprite->data[1] + gSprites[sprite->data[0]].pos1.x;
                r2 = sprite->data[2] + gSprites[sprite->data[0]].pos1.y;
                spriteId = CreateSprite(&gSpriteTemplate_840B1B0, r1, r2, gSprites[sprite->data[0]].subpriority + 1);
                if (spriteId != 64)
                {
                    gSprites[spriteId].oam.affineMode = 3;
                    gSprites[spriteId].oam.matrixNum = 17;
                    CalcCenterToCornerVec(&gSprites[spriteId], 0, 1, 3);
                    gSprites[spriteId].data[0] = sprite->data[0];
                    gSprites[spriteId].data[1] = ((sprite->data[7] >> 2) & 7) << 5;
                    gSprites[spriteId].data[2] = sprite->data[3];
                    gSprites[spriteId].data[3] = 232;
                    gSprites[spriteId].data[4] = r1;
                    gSprites[spriteId].data[5] = r2;
                    gSprites[spriteId].data[6] = r6;
                }
            }
            if (sprite->data[6] < 112)
                sprite->data[6] += 4;
        }
        foo = 256 - gSineTable[(u8)sprite->data[6]] / 2;
        SetOamMatrix(17, foo, 0, 0, foo);
    }
}

static void InitIntroMudkipAttackAnim(u8 a)
{
    u8 spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_840B1C8, 0, 0, 0);
    if (spriteId != 64)
    {
        gSprites[spriteId].data[0] = a;
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].data[2] = 12;
        gSprites[spriteId].data[3] = 24;
    }
}

static void sub_813EDFC(struct Sprite *sprite)
{
    u16 foo;

    //I'm not sure why a switch statement was used here.
    //if (sprite->data[0] != 1) would have been more appropriate.
    switch (sprite->data[0])
    {
    case 0:
    default:
        sprite->invisible = FALSE;
        sprite->oam.affineMode = 3;
        sprite->oam.matrixNum = 18;
        CalcCenterToCornerVec(sprite, 0, 3, 3);
        sprite->data[1] = 0;
        sprite->data[0] = 1;
        //fall through
    case 1:
        break;
    }
    sprite->data[7]++;
    if (sprite->data[7] & 1)
    {
        sprite->invisible = TRUE;
    }
    else
    {
        sprite->invisible = FALSE;
        if (sprite->data[1] < 64)
            sprite->data[1]++;
    }
    foo = 256 - gSineTable[(u8)sprite->data[1]] / 2;
    SetOamMatrix(18, foo, 0, 0, foo);
}
