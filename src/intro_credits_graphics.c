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

// define register constants for the inline asm
asm(".include \"constants/gba_constants.inc\"\n");

struct IntroCreditsSpriteMetadata
{
    u8 animNum:4;
    u8 shape:2;
    u8 size:2;
    u8 x;
    u8 y;
    u8 subpriority;
    u16 xOff;
};

const u16 gUnknown_084121FC[] = INCBIN_U16("graphics/intro/intro2_grass.gbapal");
const u16 gUnknown_0841221C[] = INCBIN_U16("graphics/intro/intro2_grass_afternoon.gbapal");
const u16 gUnknown_0841223C[] = INCBIN_U16("graphics/intro/intro2_grass_night.gbapal");
const u8 gUnknown_0841225C[] = INCBIN_U8("graphics/intro/intro2_grass.4bpp.lz");
const u8 gUnknown_084126DC[] = INCBIN_U8("graphics/intro/intro2_grass_map.bin.lz");
const u16 gUnknown_08412818[] = INCBIN_U16("graphics/intro/8412818.gbapal");
const u16 gUnknown_08412878[] = INCBIN_U16("graphics/intro/8412878.gbapal");
const u8 gUnknown_084128D8[] = INCBIN_U8("graphics/intro/intro2_bgclouds.4bpp.lz");
const u8 gUnknown_08412EB4[] = INCBIN_U8("graphics/intro/intro2_bgclouds_map.bin.lz");
const u16 gUnknown_08413184[] = INCBIN_U16("graphics/intro/intro2_bgclouds.gbapal");
const u16 gUnknown_084131A4[] = INCBIN_U16("graphics/intro/intro2_bgclouds_afternoon.gbapal");
const u8 gUnknown_084131C4[] = INCBIN_U8("graphics/intro/intro2_bgclouds2.4bpp.lz");
const u16 gUnknown_08413300[] = INCBIN_U16("graphics/intro/intro2_bgtrees2.gbapal");
const u16 gUnknown_08413320[] = INCBIN_U16("graphics/intro/intro2_bgtrees2_afternoon.gbapal");
const u8 gUnknown_08413340[] = INCBIN_U8("graphics/intro/intro2_bgtrees.4bpp.lz");
const u8 gUnknown_084139C8[] = INCBIN_U8("graphics/intro/intro2_bgtrees_map.bin.lz");
const u16 gUnknown_08413CCC[] = INCBIN_U16("graphics/intro/intro2_bgtrees.gbapal");
const u8 gIntro2TreeTiles[] = INCBIN_U8("graphics/intro/intro2_bgtreessmall.4bpp.lz");
const u16 gUnknown_08413E38[] = INCBIN_U16("graphics/intro/8413E38.gbapal");
const u8 gUnknown_08413E78[] = INCBIN_U8("graphics/intro/intro2_bgnight.4bpp.lz"); // only used in credits, coupled with intro because bicycle sequence
const u16 gUnknown_08414064[] = INCBIN_U16("graphics/intro/intro2_bgnight.gbapal");
const u8 gUnknown_08414084[] = INCBIN_U8("graphics/intro/intro2_bgnight_map.bin.lz");
const u8 gIntro2NightTiles[] = INCBIN_U8("graphics/intro/intro2_night.4bpp.lz");
const u16 gIntro2BrendanPalette[] = INCBIN_U16("graphics/intro/intro2_brendan.gbapal");
const u8 gIntro2BrendanTiles[] = INCBIN_U8("graphics/intro/intro2_brendan.4bpp.lz");
const u16 gIntro2MayPalette[] = INCBIN_U16("graphics/intro/intro2_may.gbapal");
const u16 gUnknown_08414F90[0xF0] = {0};
const u8 gIntro2MayTiles[] = INCBIN_U8("graphics/intro/intro2_may.4bpp.lz");
const u8 gIntro2BicycleTiles[] = INCBIN_U8("graphics/intro/intro2_bicycle.4bpp.lz");
const u16 gIntro2LatiosPalette[] = INCBIN_U16("graphics/intro/intro2_latios.gbapal");
const u8 gIntro2LatiosTiles[] = INCBIN_U8("graphics/intro/intro2_latios.4bpp.lz");
const u16 gIntro2LatiasPalette[] = INCBIN_U16("graphics/intro/intro2_latias.gbapal");
const u8 gIntro2LatiasTiles[] = INCBIN_U8("graphics/intro/intro2_latias.4bpp.lz");

void sub_814910C(struct Sprite *sprite);
void nullsub_82(struct Sprite *sprite);
void sub_81492A0(struct Sprite *sprite);
void nullsub_83(struct Sprite *sprite);

const struct SpriteTemplate gSpriteTemplate_8416B3C = {
    2000, 0xFFFF, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_814910C
};

const struct CompressedSpriteSheet gUnknown_08416B54[] = {
    { gUnknown_084131C4, 0x400, 2000 },
    {}
};

const union AnimCmd gSpriteAnim_8416B64[] = {
    ANIMCMD_FRAME( 0, 30),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_8416B6C[] = {
    ANIMCMD_FRAME(16, 30),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_8416B74[] = {
    ANIMCMD_FRAME(20, 30),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_8416B7C[] = {
    ANIMCMD_FRAME(22, 30),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_8416B84[] = {
    gSpriteAnim_8416B64,
    gSpriteAnim_8416B6C,
    gSpriteAnim_8416B74,
    gSpriteAnim_8416B7C
};

const struct IntroCreditsSpriteMetadata gUnknown_08416B94[] = {
    {  0, ST_OAM_SQUARE,      2,   72, 32, 100, 0xc00 },
    {  0, ST_OAM_SQUARE,      2,  158, 32, 100, 0xc00 },
    {  1, ST_OAM_SQUARE,      1,  192, 40, 101, 0x800 },
    {  1, ST_OAM_SQUARE,      1,   56, 40, 101, 0x800 },
    {  2, ST_OAM_H_RECTANGLE, 0,  100, 44, 102, 0x400 },
    {  2, ST_OAM_H_RECTANGLE, 0,  152, 44, 102, 0x400 },
    {  3, ST_OAM_H_RECTANGLE, 0,    8, 46, 103, 0x100 },
    {  3, ST_OAM_H_RECTANGLE, 0,   56, 46, 103, 0x100 },
    {  3, ST_OAM_H_RECTANGLE, 0,  240, 46, 103, 0x100 },
};

const struct CompressedSpriteSheet gUnknown_08416BDC[] = {
    { gIntro2TreeTiles, 0x400, 2000 },
    {}
};

const union AnimCmd gSpriteAnim_8416BEC[] = {
    ANIMCMD_FRAME( 0, 30),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_8416BF4[] = {
    ANIMCMD_FRAME(16, 30),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_8416BFC[] = {
    ANIMCMD_FRAME(24, 30),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_8416C04[] = {
    gSpriteAnim_8416BEC,
    gSpriteAnim_8416BF4,
    gSpriteAnim_8416BFC
};

const struct IntroCreditsSpriteMetadata gUnknown_08416C10[] = {
    {  0, ST_OAM_SQUARE,      2,   16, 88, 100, 0x2000 },
    {  0, ST_OAM_SQUARE,      2,   80, 88, 100, 0x2000 },
    {  0, ST_OAM_SQUARE,      2,  144, 88, 100, 0x2000 },
    {  0, ST_OAM_SQUARE,      2,  208, 88, 100, 0x2000 },
    {  1, ST_OAM_V_RECTANGLE, 2,   40, 88, 101, 0x1000 },
    {  1, ST_OAM_V_RECTANGLE, 2,  104, 88, 101, 0x1000 },
    {  1, ST_OAM_V_RECTANGLE, 2,  168, 88, 101, 0x1000 },
    {  1, ST_OAM_V_RECTANGLE, 2,  232, 88, 101, 0x1000 },
    {  2, ST_OAM_V_RECTANGLE, 2,   56, 88, 102, 0x800  },
    {  2, ST_OAM_V_RECTANGLE, 2,  120, 88, 102, 0x800  },
    {  2, ST_OAM_V_RECTANGLE, 2,  184, 88, 102, 0x800  },
    {  2, ST_OAM_V_RECTANGLE, 2,  248, 88, 102, 0x800  },
};

const struct CompressedSpriteSheet gUnknown_08416C70[] = {
    { gIntro2NightTiles, 0x400, 2000 },
    {}
};

const union AnimCmd gSpriteAnim_8416C80[] = {
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_8416C88[] = {
    gSpriteAnim_8416C80
};

const struct IntroCreditsSpriteMetadata gUnknown_08416C8C[] = {
    { 0, ST_OAM_SQUARE, 2,   24, 88, 100, 0x1000 },
    { 0, ST_OAM_SQUARE, 2,   64, 88, 100, 0x1000 },
    { 0, ST_OAM_SQUARE, 2,  104, 88, 100, 0x1000 },
    { 0, ST_OAM_SQUARE, 2,  144, 88, 100, 0x1000 },
    { 0, ST_OAM_SQUARE, 2,  184, 88, 100, 0x1000 },
    { 0, ST_OAM_SQUARE, 2,  224, 88, 100, 0x1000 },
};

const struct OamData gOamData_8416CBC = {
    .y = 160, .shape = ST_OAM_SQUARE, .size = 3, .priority = 1
};

const union AnimCmd gSpriteAnim_8416CC4[] = {
    ANIMCMD_FRAME(  0, 8),
    ANIMCMD_FRAME( 64, 8),
    ANIMCMD_FRAME(128, 8),
    ANIMCMD_FRAME(192, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gSpriteAnimTable_8416CD8[] = {
    gSpriteAnim_8416CC4
};

const struct SpriteTemplate gSpriteTemplate_8416CDC = {
    1002, 1002, &gOamData_8416CBC, gSpriteAnimTable_8416CD8, NULL, gDummySpriteAffineAnimTable, nullsub_82
};

const struct SpriteTemplate gSpriteTemplate_8416CF4 = {
    1003, 1003, &gOamData_8416CBC, gSpriteAnimTable_8416CD8, NULL, gDummySpriteAffineAnimTable, nullsub_82
};

const struct OamData gOamData_8416D0C = {
    .y = 160, .shape = ST_OAM_H_RECTANGLE, .size = 3, .priority = 1
};

const union AnimCmd gSpriteAnim_8416D14[] = {
    ANIMCMD_FRAME(  0, 8),
    ANIMCMD_FRAME( 32, 8),
    ANIMCMD_FRAME( 64, 8),
    ANIMCMD_FRAME( 96, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gSpriteAnimTable_8416D28[] = {
    gSpriteAnim_8416D14
};

const struct SpriteTemplate gSpriteTemplate_Brendan = {
    1001, 1002, &gOamData_8416D0C, gSpriteAnimTable_8416D28, NULL, gDummySpriteAffineAnimTable, sub_81492A0
};

const struct SpriteTemplate gSpriteTemplate_May = {
    1001, 1003, &gOamData_8416D0C, gSpriteAnimTable_8416D28, NULL, gDummySpriteAffineAnimTable, sub_81492A0
};

const struct OamData gOamData_8416D5C = {
    .y = 160, .shape = ST_OAM_SQUARE, .size = 3, .priority = 1
};

const union AnimCmd gSpriteAnim_8416D64[] = {
    ANIMCMD_FRAME(  0, 16),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_8416D6C[] = {
    ANIMCMD_FRAME( 64, 16),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_8416D74[] = {
    gSpriteAnim_8416D64,
    gSpriteAnim_8416D6C
};

const struct SpriteTemplate gSpriteTemplate_8416D7C = {
    1004, 1004, &gOamData_8416D5C, gSpriteAnimTable_8416D74, NULL, gDummySpriteAffineAnimTable, nullsub_83
};

const struct SpriteTemplate gSpriteTemplate_8416D94 = {
    1005, 1005, &gOamData_8416D5C, gSpriteAnimTable_8416D74, NULL, gDummySpriteAffineAnimTable, nullsub_83
};

const struct CompressedSpriteSheet gIntro2BrendanSpriteSheet[] = {
    { gIntro2BrendanTiles, 0x3800, 1002 },
    {}
};
const struct CompressedSpriteSheet gIntro2MaySpriteSheet[] = {
    { gIntro2MayTiles, 0x3800, 1003 },
    {}
};
const struct CompressedSpriteSheet gIntro2BicycleSpriteSheet[] = {
    { gIntro2BicycleTiles, 0x1000, 1001 },
    {}
};
const struct CompressedSpriteSheet gIntro2LatiosSpriteSheet[] = {
    { gIntro2LatiosTiles, 0x1000, 1004 },
    {}
};
const struct CompressedSpriteSheet gIntro2LatiasSpriteSheet[] = {
    { gIntro2LatiasTiles, 0x1000, 1005 },
    {}
};

const struct SpritePalette gIntro2SpritePalettes[] = {
    {gIntro2BrendanPalette, 1002},
    {gIntro2MayPalette,     1003},
    {gIntro2LatiosPalette,  1004},
    {gIntro2LatiasPalette,  1005},
    {}
};

const struct CompressedSpriteSheet gUnknown_08416E24[] = {
    { gIntro2BrendanTiles, 0x2000, 1002},
    {}
};

const struct CompressedSpriteSheet gUnknown_08416E34[] = {
    { gIntro2MayTiles, 0x2000, 1003},
    {}
};


EWRAM_DATA u16 gUnknown_02039358 = 0;
EWRAM_DATA s16 gUnknown_0203935A = 0;
EWRAM_DATA s16 gUnknown_0203935C = 0;

extern u8 gReservedSpritePaletteCount;

void sub_8149248();
void sub_8149264();

void load_intro_part2_graphics(u8 a)
{
    LZ77UnCompVram(&gUnknown_0841225C, (void *)(VRAM + 0x4000));
    LZ77UnCompVram(&gUnknown_084126DC, (void *)(VRAM + 0x7800));
    LoadPalette(&gUnknown_084121FC, 240, 32);
    switch (a)
    {
    case 0:
    default:
        LZ77UnCompVram(&gUnknown_084128D8, (void *)(VRAM));
        LZ77UnCompVram(&gUnknown_08412EB4, (void *)(VRAM + 0x3000));
        LoadPalette(&gUnknown_08412818, 0, 96);
        LoadCompressedObjectPic(gUnknown_08416B54);
        LoadPalette(&gUnknown_08413184, 256, 32);
        sub_8149248();
        break;
    case 1:
        LZ77UnCompVram(&gUnknown_08413340, (void *)(VRAM));
        LZ77UnCompVram(&gUnknown_084139C8, (void *)(VRAM + 0x3000));
        LoadPalette(&gUnknown_08413300, 0, 32);
        LoadCompressedObjectPic(gUnknown_08416BDC);
        LoadPalette(&gUnknown_08413CCC, 256, 32);
        sub_8149264();
        break;
    }
    gUnknown_0203935C = 0;
    gReservedSpritePaletteCount = 8;
}

void sub_8148C78(u8 a)
{
    if (a == 1)
    {
        REG_BG3CNT = 0x603;
        REG_BG2CNT = 0x702;
        REG_BG1CNT = 0xF05;
        REG_DISPCNT = 0x1E40;
    }
    else
    {
        REG_BG3CNT = 0x603;
        REG_BG2CNT = 0x702;
        REG_BG1CNT = 0xF05;
        REG_DISPCNT = 0x1E40;
    }
}

void sub_8149280();

void sub_8148CB0(u8 a)
{
    LZ77UnCompVram(&gUnknown_0841225C, (void *)(VRAM + 0x4000));
    LZ77UnCompVram(&gUnknown_084126DC, (void *)(VRAM + 0x7800));
    switch (a)
    {
    case 0:
    default:
        LoadPalette(&gUnknown_084121FC, 240, 32);
        LZ77UnCompVram(&gUnknown_084128D8, (void *)(VRAM));
        LZ77UnCompVram(&gUnknown_08412EB4, (void *)(VRAM + 0x3000));
        LoadPalette(&gUnknown_08412818, 0, 96);
        LoadCompressedObjectPic(gUnknown_08416B54);
        LZ77UnCompVram(&gUnknown_084131C4, (void *)(VRAM + 0x10000));
        LoadPalette(&gUnknown_08413184, 256, 32);
        sub_8149248();
        break;
    case 1:
        LoadPalette(&gUnknown_0841221C, 240, 32);
        LZ77UnCompVram(&gUnknown_084128D8, (void *)(VRAM));
        LZ77UnCompVram(&gUnknown_08412EB4, (void *)(VRAM + 0x3000));
        LoadPalette(&gUnknown_08412878, 0, 96);
        LoadCompressedObjectPic(gUnknown_08416B54);
        LZ77UnCompVram(&gUnknown_084131C4, (void *)(VRAM + 0x10000));
        LoadPalette(&gUnknown_084131A4, 256, 32);
        sub_8149248();
        break;
    case 2:
    case 3:
        LoadPalette(&gUnknown_0841221C, 240, 32);
        LZ77UnCompVram(&gUnknown_08413340, (void *)(VRAM));
        LZ77UnCompVram(&gUnknown_084139C8, (void *)(VRAM + 0x3000));
        LoadPalette(&gUnknown_08413320, 0, 32);
        LoadCompressedObjectPic(gUnknown_08416BDC);
        LoadPalette(&gUnknown_08413320, 256, 32);
        sub_8149264();
        break;
    case 4:
        LoadPalette(&gUnknown_0841223C, 240, 32);
        LZ77UnCompVram(&gUnknown_08413E78, (void *)(VRAM));
        LZ77UnCompVram(&gUnknown_08414084, (void *)(VRAM + 0x3000));
        LoadPalette(&gUnknown_08413E38, 0, 64);
        LoadCompressedObjectPic(gUnknown_08416C70);
        LoadPalette(&gUnknown_08414064, 256, 32);
        sub_8149280();
        break;
    }
    gReservedSpritePaletteCount = 8;
    gUnknown_0203935C = 0;
}

void sub_8148E90(u8 a)
{
    REG_BG3CNT = 0x603;
    REG_BG2CNT = 0x702;
    REG_BG1CNT = 0xF05;
    REG_DISPCNT = 0x1F40;
}

u8 sub_8148EC0(u8 a, u16 b, u16 c, u16 d)
{
    u8 taskId = CreateTask(&sub_8148F3C, 0);

    gTasks[taskId].data[0] = a;
    gTasks[taskId].data[1] = b;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    gTasks[taskId].data[4] = c;
    gTasks[taskId].data[5] = 0;
    gTasks[taskId].data[6] = 0;
    gTasks[taskId].data[7] = d;
    gTasks[taskId].data[8] = 8;
    gTasks[taskId].data[9] = 0;
    sub_8148F3C(taskId);
    return taskId;
}

void sub_8148F3C(u8 taskId)
{
    s16 deltaBG1HOFS;
    s16 deltaBG2HOFS;
    s16 deltaBG3HOFS;
    s32 r2;

    deltaBG1HOFS = gTasks[taskId].data[1];
    if (deltaBG1HOFS != 0)
    {
        r2 = (gTasks[taskId].data[2] << 16) + (u16)gTasks[taskId].data[3];
        r2 -= 16 * (u16)deltaBG1HOFS;
        gTasks[taskId].data[2] = r2 >> 16;
        gTasks[taskId].data[3] = r2;
        REG_BG1HOFS = gTasks[taskId].data[2];
        REG_BG1VOFS = gUnknown_02039358 + gUnknown_0203935A;
    }

    deltaBG2HOFS = gTasks[taskId].data[4];
    if (deltaBG2HOFS != 0)
    {
        r2 = (gTasks[taskId].data[5] << 16) + (u16)gTasks[taskId].data[6];
        r2 -= 16 * (u16)deltaBG2HOFS;
        gTasks[taskId].data[5] = r2 >> 16;
        gTasks[taskId].data[6] = r2;
        REG_BG2HOFS = gTasks[taskId].data[5];
        if (gTasks[taskId].data[0] != 0)
            REG_BG2VOFS = gUnknown_02039358 + gUnknown_0203935A;
        else
            REG_BG2VOFS = gUnknown_02039358;
    }

    deltaBG3HOFS = gTasks[taskId].data[7];
    if (deltaBG3HOFS != 0)
    {
        r2 = (gTasks[taskId].data[8] << 16) + (u16)gTasks[taskId].data[9];
        r2 -= 16 * (u16)deltaBG3HOFS;
        gTasks[taskId].data[8] = r2 >> 16;
        gTasks[taskId].data[9] = r2;
        REG_BG3HOFS = gTasks[taskId].data[8];
        REG_BG3VOFS = gUnknown_02039358;
    }
}

void sub_8149020(u8 mode)
{
    u16 x;
    u16 y;
    switch (mode)
    {
        case 0:
        default:
            /* stuff */
            if (gMain.vblankCounter1 & 3 || gPaletteFade.active)
                break;
            if (gMain.vblankCounter1 & 4)
            {
                x = gPlttBufferUnfaded[9];
                y = gPlttBufferUnfaded[10];
            }
            else
            {
                x = gPlttBufferUnfaded[10];
                y = gPlttBufferUnfaded[9];
            }
            LoadPalette(&x, 9, 2);
            LoadPalette(&y, 10, 2);
            break;
        case 2:
            if (gMain.vblankCounter1 & 3 || gPaletteFade.active)
                break;
            if (gMain.vblankCounter1 & 4)
            {
                x = 0x3D27;
                y = 0x295;
            }
            else
            {
                x = 0x31C;
                y = 0x3D27;
            }
            LoadPalette(&x, 12, 2);
            LoadPalette(&y, 13, 2);
            break;
        case 1:
            break;
    }
}

void sub_814910C(struct Sprite *sprite)
{
    if (gUnknown_0203935C)
    {
        DestroySprite(sprite);
    }
    else
    {
        s32 var = ((sprite->pos1.x << 16) | (u16)sprite->data[2]) + (u16)sprite->data[1];
        sprite->pos1.x = var >> 16;
        sprite->data[2] = var;
        if (sprite->pos1.x > 255) sprite->pos1.x = 0xFFE0;
        if (sprite->data[0])
        {
            sprite->pos2.y = -(gUnknown_02039358 + gUnknown_0203935A);
        }
        else
        {
            sprite->pos2.y = -gUnknown_02039358;
        }
    }
}

void sub_8149174(u8 a, const struct IntroCreditsSpriteMetadata *b, const union AnimCmd *const *c, u8 d)
{
    u8 i;

    for(i = 0; i < d; i++)
    {
        u8 sprite = CreateSprite(&gSpriteTemplate_8416B3C, b[i].x, b[i].y, b[i].subpriority);
        CalcCenterToCornerVec(&gSprites[sprite], b[i].shape, b[i].size, 0);
        gSprites[sprite].oam.priority = 3;
        gSprites[sprite].oam.shape = b[i].shape;
        gSprites[sprite].oam.size = b[i].size;
        gSprites[sprite].oam.paletteNum = 0;
        gSprites[sprite].anims = c;
        StartSpriteAnim(&gSprites[sprite], b[i].animNum);
        gSprites[sprite].data[0] = a;
        gSprites[sprite].data[1] = b[i].xOff;
        gSprites[sprite].data[2] = 0;
    }
}

void sub_8149248()
{
    sub_8149174(0, gUnknown_08416B94, gSpriteAnimTable_8416B84, 9);
}

void sub_8149264()
{
    sub_8149174(1, gUnknown_08416C10, gSpriteAnimTable_8416C04, 12);
}

void sub_8149280()
{
    sub_8149174(1, gUnknown_08416C8C, gSpriteAnimTable_8416C88, 6);
}

void nullsub_82(struct Sprite *sprite)
{
}

void sub_81492A0(struct Sprite* sprite)
{
    sprite->invisible = gSprites[sprite->data[0]].invisible;
    sprite->pos1.x = gSprites[sprite->data[0]].pos1.x;
    sprite->pos1.y = gSprites[sprite->data[0]].pos1.y + 8;
    sprite->pos2.x = gSprites[sprite->data[0]].pos2.x;
    sprite->pos2.y = gSprites[sprite->data[0]].pos2.y;
}



u8 intro_create_brendan_sprite(s16 a, s16 b)
{
    u8 sprite = CreateSprite(&gSpriteTemplate_8416CDC, a, b, 0);
    u8 brendan = CreateSprite(&gSpriteTemplate_Brendan, a, b + 8, 1);
    gSprites[brendan].data[0] = sprite;
    return sprite;
}

u8 intro_create_may_sprite(s16 a, s16 b)
{
    u8 sprite = CreateSprite(&gSpriteTemplate_8416CF4, a, b, 0);
    u8 may = CreateSprite(&gSpriteTemplate_May, a, b + 8, 1);
    gSprites[may].data[0] = sprite;
    return sprite;
}

void nullsub_83(struct Sprite *sprite)
{
}

void sub_81493C4(struct Sprite* sprite)
{
    sprite->invisible = gSprites[sprite->data[0]].invisible;
    sprite->pos1.y = gSprites[sprite->data[0]].pos1.y;
    sprite->pos2.x = gSprites[sprite->data[0]].pos2.x;
    sprite->pos2.y = gSprites[sprite->data[0]].pos2.y;
}

u8 intro_create_latios_sprite(s16 a, s16 b)
{
    u8 sprite = CreateSprite(&gSpriteTemplate_8416D7C, a - 32, b, 2);
    u8 latios = CreateSprite(&gSpriteTemplate_8416D7C, a + 32, b, 2);
    gSprites[latios].data[0] = sprite;
    StartSpriteAnim(&gSprites[latios], 1);
    gSprites[latios].callback = &sub_81493C4;
    return sprite;
}

u8 intro_create_latias_sprite(s16 a, s16 b)
{
    u8 sprite = CreateSprite(&gSpriteTemplate_8416D94, a - 32, b, 2);
    u8 latios = CreateSprite(&gSpriteTemplate_8416D94, a + 32, b, 2);
    gSprites[latios].data[0] = sprite;
    StartSpriteAnim(&gSprites[latios], 1);
    gSprites[latios].callback = &sub_81493C4;
    return sprite;
}
