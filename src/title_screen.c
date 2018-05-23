#include "global.h"
#include "gba/m4a_internal.h"
#include "title_screen.h"
#include "clear_save_data_menu.h"
#include "decompress.h"
#include "event_data.h"
#include "intro.h"
#include "m4a.h"
#include "main.h"
#include "main_menu.h"
#include "overworld.h"
#include "palette.h"
#include "reset_rtc_screen.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "scanline_effect.h"

#if ENGLISH
#define VERSION_BANNER_SHAPE 1
#define VERSION_BANNER_RIGHT_TILEOFFSET 64
#define VERSION_BANNER_BYTES 0x1000
#define VERSION_BANNER_LEFT_X 98
#define VERSION_BANNER_RIGHT_X 162
#define VERSION_BANNER_Y 26
#define VERSION_BANNER_Y_GOAL 66
#define START_BANNER_X DISPLAY_WIDTH / 2
#elif GERMAN
#define VERSION_BANNER_SHAPE 0
#define VERSION_BANNER_RIGHT_TILEOFFSET 128
#define VERSION_BANNER_BYTES 0x2000
#define VERSION_BANNER_LEFT_X 108
#define VERSION_BANNER_RIGHT_X 172
#ifdef SAPPHIRE
#define VERSION_BANNER_Y_GOAL 83
#else
#define VERSION_BANNER_Y_GOAL 84
#endif
#define VERSION_BANNER_Y (VERSION_BANNER_Y_GOAL - 40)
#define START_BANNER_X DISPLAY_WIDTH / 2 - 2
#endif

extern u8 gReservedSpritePaletteCount;
extern struct MusicPlayerInfo gMPlay_BGM;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG1_X;
extern const u8 gUnknown_08E9D8CC[];
extern const u16 gUnknown_08E9F624[];
extern const u8 gUnknown_08E9F7E4[];
extern const u8 gVersionTiles[];
extern const u8 gTitleScreenPressStart_Gfx[];
extern const u16 gTitleScreenLogoShinePalette[];

static EWRAM_DATA u8 gUnknown_0202F7E4 = 0;

#ifdef SAPPHIRE
static const u16 sLegendaryMonPalettes[][16] =
{
    INCBIN_U16("graphics/title_screen/kyogre_dark.gbapal"),
    INCBIN_U16("graphics/title_screen/kyogre_glow.gbapal"),
};
static const u8 sLegendaryMonPixelData[] = INCBIN_U8("graphics/title_screen/kyogre.4bpp.lz");
static const u8 sLegendaryMonTilemap[] = INCBIN_U8("graphics/title_screen/kyogre_map.bin.lz");
static const u8 sBackdropTilemap[] = INCBIN_U8("graphics/title_screen/water_map.bin.lz");
#else
static const u16 sLegendaryMonPalettes[][16] =
{
    INCBIN_U16("graphics/title_screen/groudon_dark.gbapal"),
    INCBIN_U16("graphics/title_screen/groudon_glow.gbapal"),
};
static const u8 sLegendaryMonPixelData[] = INCBIN_U8("graphics/title_screen/groudon.4bpp.lz");
static const u8 sLegendaryMonTilemap[] = INCBIN_U8("graphics/title_screen/groudon_map.bin.lz");
static const u8 sBackdropTilemap[] = INCBIN_U8("graphics/title_screen/lava_map.bin.lz");
#endif
static const u8 sLogoShineTiles[] = INCBIN_U8("graphics/title_screen/logo_shine.4bpp.lz");
const u16 gUnknown_08393E64[] =
{
    0x10,
    0x110,
    0x210,
    0x310,
    0x410,
    0x510,
    0x610,
    0x710,
    0x810,
    0x910,
    0xA10,
    0xB10,
    0xC10,
    0xD10,
    0xE10,
    0xF10,
    0x100F,
    0x100E,
    0x100D,
    0x100C,
    0x100B,
    0x100A,
    0x1009,
    0x1008,
    0x1007,
    0x1006,
    0x1005,
    0x1004,
    0x1003,
    0x1002,
    0x1001,
    0x1000,
};
static const struct OamData sVersionBannerLeftOamData =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 1,
    .shape = VERSION_BANNER_SHAPE,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData sVersionBannerRightOamData =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 1,
    .shape = VERSION_BANNER_SHAPE,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd sVersionBannerLeftAnimSequence[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END,
};
static const union AnimCmd sVersionBannerRightAnimSequence[] =
{
    ANIMCMD_FRAME(VERSION_BANNER_RIGHT_TILEOFFSET, 30),
    ANIMCMD_END,
};
static const union AnimCmd *const sVersionBannerLeftAnimTable[] =
{
    sVersionBannerLeftAnimSequence,
};
static const union AnimCmd *const sVersionBannerRightAnimTable[] =
{
    sVersionBannerRightAnimSequence,
};
static const struct SpriteTemplate sVersionBannerLeftSpriteTemplate =
{
    .tileTag = 1000,
    .paletteTag = 1000,
    .oam = &sVersionBannerLeftOamData,
    .anims = sVersionBannerLeftAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallback_VersionBannerLeft,
};
static const struct SpriteTemplate sVersionBannerRightSpriteTemplate =
{
    .tileTag = 1000,
    .paletteTag = 1000,
    .oam = &sVersionBannerRightOamData,
    .anims = sVersionBannerRightAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallback_VersionBannerRight,
};
static const struct CompressedSpriteSheet gUnknown_08393EFC[] =
{
    {gVersionTiles, VERSION_BANNER_BYTES, 1000},
    {NULL},
};
static const struct OamData gOamData_8393F0C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_8393F14[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_8393F1C[] =
{
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_8393F24[] =
{
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_8393F2C[] =
{
    ANIMCMD_FRAME(12, 4),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_8393F34[] =
{
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_8393F3C[] =
{
    ANIMCMD_FRAME(20, 4),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_8393F44[] =
{
    ANIMCMD_FRAME(24, 4),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_8393F4C[] =
{
    ANIMCMD_FRAME(28, 4),
    ANIMCMD_END,
};
#if GERMAN
static const union AnimCmd gSpriteAnim_839F73C[] =
{
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_839F744[] =
{
    ANIMCMD_FRAME(36, 4),
    ANIMCMD_END,
};
#endif
static const union AnimCmd *const sStartCopyrightBannerAnimTable[] =
{
    gSpriteAnim_8393F14,
    gSpriteAnim_8393F1C,
    gSpriteAnim_8393F24,
    gSpriteAnim_8393F2C,
    gSpriteAnim_8393F34,
    gSpriteAnim_8393F3C,
    gSpriteAnim_8393F44,
    gSpriteAnim_8393F4C,
#if GERMAN
    gSpriteAnim_839F73C,
    gSpriteAnim_839F744,
#endif
};
static const struct SpriteTemplate sStartCopyrightBannerSpriteTemplate =
{
    .tileTag = 1001,
    .paletteTag = 1001,
    .oam = &gOamData_8393F0C,
    .anims = sStartCopyrightBannerAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallback_PressStartCopyrightBanner,
};
static const struct CompressedSpriteSheet gUnknown_08393F8C[] =
{
    {gTitleScreenPressStart_Gfx, 0x520, 1001},
    {NULL},
};
const struct SpritePalette sPokemonLogoShinePalette[] =
{
    {gTitleScreenLogoShinePalette, 1001},
    {NULL},
};
static const struct OamData sPokemonLogoShineOamData =
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
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd sPokemonLogoShineAnimSequence[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};
static const union AnimCmd *const sPokemonLogoShineAnimTable[] =
{
    sPokemonLogoShineAnimSequence,
};
static const struct SpriteTemplate sPokemonLogoShineSpriteTemplate =
{
    .tileTag = 1002,
    .paletteTag = 1001,
    .oam = &sPokemonLogoShineOamData,
    .anims = sPokemonLogoShineAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallback_PokemonLogoShine,
};
static const struct CompressedSpriteSheet sPokemonLogoShineSpriteSheet[] =
{
    {sLogoShineTiles, 0x800, 1002},
    {NULL},
};

#define _RGB(r, g, b) ((((b) & 31) << 10) + (((g) & 31) << 5) + ((r) & 31))

#ifdef SAPPHIRE
//Red Kyogre markings
#define LEGENDARY_MARKING_COLOR(c) RGB((c), 0, 0)
#else
//Blue Groundon markings
#define LEGENDARY_MARKING_COLOR(c) RGB(0, 0, (c))
#endif

#if defined(GERMAN) && defined(SAPPHIRE)
#define PLTT_BUFFER_INDEX 9
#elif defined(SAPPHIRE)
#define PLTT_BUFFER_INDEX 26
#else
#define PLTT_BUFFER_INDEX 21
#endif

#define CLEAR_SAVE_BUTTON_COMBO (B_BUTTON | SELECT_BUTTON | DPAD_UP)
#define RESET_RTC_BUTTON_COMBO (B_BUTTON | SELECT_BUTTON | DPAD_LEFT)
#define A_B_START_SELECT (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON)

static void MainCB2(void);
static void Task_TitleScreenPhase1(u8);
static void Task_TitleScreenPhase2(u8);
static void Task_TitleScreenPhase3(u8);
static void CB2_GoToMainMenu(void);
#if DEBUG
static void CB2_GoToTestMenu(void);
#endif
static void CB2_GoToClearSaveDataScreen(void);
static void CB2_GoToResetRtcScreen(void);
static void CB2_GoToCopyrightScreen(void);
static void UpdateLegendaryMarkingColor(u8);

void SpriteCallback_VersionBannerLeft(struct Sprite *sprite)
{
    struct Task *task = &gTasks[sprite->data[1]];

    if (task->data[1] != 0)
    {
        sprite->oam.objMode = 0;
        sprite->pos1.y = VERSION_BANNER_Y_GOAL;
        sprite->invisible = FALSE;
    }
    else
    {
        if (task->data[5] != 0)
            task->data[5]--;
        if (task->data[5] < 64)
        {
            sprite->invisible = FALSE;
            if (sprite->pos1.y != VERSION_BANNER_Y_GOAL)
                sprite->pos1.y++;
            REG_BLDALPHA = gUnknown_08393E64[task->data[5] / 2];
        }
    }
}

void SpriteCallback_VersionBannerRight(struct Sprite *sprite)
{
    struct Task *task = &gTasks[sprite->data[1]];

    if (task->data[1] != 0)
    {
        sprite->oam.objMode = 0;
        sprite->pos1.y = VERSION_BANNER_Y_GOAL;
        sprite->invisible = FALSE;
    }
    else
    {
        if (task->data[5] < 64)
        {
            sprite->invisible = FALSE;
            if (sprite->pos1.y != VERSION_BANNER_Y_GOAL)
                sprite->pos1.y++;
        }
    }
}

void SpriteCallback_PressStartCopyrightBanner(struct Sprite *sprite)
{
    if (sprite->data[0] == 1)
    {
        sprite->data[1]++;
        //Alternate between hidden and shown every 16th frame
        if (sprite->data[1] & 16)
            sprite->invisible = FALSE;
        else
            sprite->invisible = TRUE;
    }
    else
        sprite->invisible = FALSE;
}

#if ENGLISH
static void CreatePressStartBanner(s16 x, s16 y)
{
    u8 i;
    u8 spriteId;

    x -= 32;
    for (i = 0; i < 3; i++, x += 32)
    {
        spriteId = CreateSprite(&sStartCopyrightBannerSpriteTemplate, x, y, 0);
        StartSpriteAnim(&gSprites[spriteId], i);
        gSprites[spriteId].data[0] = 1;
    }
}
#elif GERMAN
NAKED
static void CreatePressStartBanner(s16 x, s16 y)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    lsls r0, 16\n\
    ldr r2, _0807C3AC @ =0xffe00000\n\
    adds r0, r2\n\
    lsrs r0, 16\n\
    movs r6, 0\n\
    lsls r1, 16\n\
    mov r10, r1\n\
    mov r8, r10\n\
_0807C302:\n\
    lsls r5, r0, 16\n\
    asrs r5, 16\n\
    ldr r0, _0807C3B0 @ =sStartCopyrightBannerSpriteTemplate\n\
    adds r1, r5, 0\n\
    mov r3, r8\n\
    asrs r2, r3, 16\n\
    movs r3, 0\n\
    bl CreateSprite\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    lsls r4, r0, 4\n\
    adds r4, r0\n\
    lsls r4, 2\n\
    ldr r0, _0807C3B4 @ =gSprites\n\
    mov r9, r0\n\
    add r4, r9\n\
    adds r0, r4, 0\n\
    adds r1, r6, 0\n\
    bl StartSpriteAnim\n\
    movs r7, 0x1\n\
    strh r7, [r4, 0x2E]\n\
    adds r0, r6, 0x1\n\
    lsls r0, 24\n\
    lsrs r6, r0, 24\n\
    adds r5, 0x20\n\
    lsls r5, 16\n\
    lsrs r0, r5, 16\n\
    cmp r6, 0x2\n\
    bls _0807C302\n\
    ldr r1, _0807C3B0 @ =sStartCopyrightBannerSpriteTemplate\n\
    mov r8, r1\n\
    lsls r5, r0, 16\n\
    asrs r5, 16\n\
    mov r2, r10\n\
    asrs r6, r2, 16\n\
    mov r0, r8\n\
    adds r1, r5, 0\n\
    adds r2, r6, 0\n\
    movs r3, 0\n\
    bl CreateSprite\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    lsls r4, r0, 4\n\
    adds r4, r0\n\
    lsls r4, 2\n\
    add r4, r9\n\
    adds r0, r4, 0\n\
    movs r1, 0x8\n\
    bl StartSpriteAnim\n\
    strh r7, [r4, 0x2E]\n\
    subs r5, 0x60\n\
    lsls r5, 16\n\
    asrs r5, 16\n\
    subs r6, 0x8\n\
    lsls r6, 16\n\
    asrs r6, 16\n\
    mov r0, r8\n\
    adds r1, r5, 0\n\
    adds r2, r6, 0\n\
    movs r3, 0\n\
    bl CreateSprite\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    lsls r4, r0, 4\n\
    adds r4, r0\n\
    lsls r4, 2\n\
    add r4, r9\n\
    adds r0, r4, 0\n\
    movs r1, 0x9\n\
    bl StartSpriteAnim\n\
    strh r7, [r4, 0x2E]\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0807C3AC: .4byte 0xffe00000\n\
_0807C3B0: .4byte sStartCopyrightBannerSpriteTemplate\n\
_0807C3B4: .4byte gSprites\n\
    .syntax divided\n");
}
#endif

static void CreateCopyrightBanner(s16 x, s16 y)
{
    u8 i;
    u8 spriteId;

    x -= 64;
    for (i = 0; i < 5; i++, x += 32)
    {
        spriteId = CreateSprite(&sStartCopyrightBannerSpriteTemplate, x, y, 0);
        StartSpriteAnim(&gSprites[spriteId], i + 3);
    }
}

void SpriteCallback_PokemonLogoShine(struct Sprite *sprite)
{
    if (gTasks[gUnknown_0202F7E4].data[1] == 0 && sprite->pos1.x < 272)
    {
        if (sprite->data[0]) //Flash background
        {
            u16 backgroundColor;

            if (sprite->pos1.x < DISPLAY_WIDTH / 2)
            {
                //Brighten background color
                if (sprite->data[1] < 31)
                    sprite->data[1]++;
                if (sprite->data[1] < 31)
                    sprite->data[1]++;
            }
            else
            {
                //Darken background color
                if (sprite->data[1] != 0)
                    sprite->data[1]--;
                if (sprite->data[1] != 0)
                    sprite->data[1]--;
            }
            backgroundColor = _RGB(sprite->data[1], sprite->data[1], sprite->data[1]);
            gPlttBufferFaded[0] = backgroundColor;
            gPlttBufferFaded[PLTT_BUFFER_INDEX] = backgroundColor;
        }
        sprite->pos1.x += 4;
    }
    else
    {
        gPlttBufferFaded[0] = RGB_BLACK;
        gPlttBufferFaded[PLTT_BUFFER_INDEX] = RGB_BLACK;
        DestroySprite(sprite);
    }
}

static void StartPokemonLogoShine(bool8 flashBackground)
{
    u8 spriteId = CreateSprite(&sPokemonLogoShineSpriteTemplate, 0, 68, 0);

    gSprites[spriteId].oam.objMode = 2;
    gSprites[spriteId].data[0] = flashBackground;
}

static void VBlankCB(void)
{
    ScanlineEffect_InitHBlankDmaTransfer();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    REG_BG1VOFS = gBattle_BG1_Y;
}


#define tCounter data[0]
#define tSkipToNext data[1]

void CB2_InitTitleScreen(void)
{
    switch (gMain.state)
    {
    default:
    case 0:
        SetVBlankCallback(NULL);
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BLDY = 0;
        *((u16 *)PLTT) = RGB_WHITE;
        REG_DISPCNT = 0;
        REG_BG2CNT = 0;
        REG_BG1CNT = 0;
        REG_BG0CNT = 0;
        REG_BG2HOFS = 0;
        REG_BG2VOFS = 0;
        REG_BG1HOFS = 0;
        REG_BG1VOFS = 0;
        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;
        DmaFill16(3, 0, (void *)VRAM, 0x18000);
        DmaFill32(3, 0, (void *)OAM, 0x400);
        DmaFill16(3, 0, (void *)(PLTT + 2), 0x3FE);
        ResetPaletteFade();
        gMain.state = 1;
        break;
    case 1:
        LZ77UnCompVram(gUnknown_08E9D8CC, (void *)VRAM);
        LZ77UnCompVram(gUnknown_08E9F7E4, (void *)(VRAM + 0x4800));
        LoadPalette(gUnknown_08E9F624, 0, 0x1C0);
        LZ77UnCompVram(sLegendaryMonPixelData, (void *)(VRAM + 0x8000));
        LZ77UnCompVram(sLegendaryMonTilemap, (void *)(VRAM + 0xC000));
        LZ77UnCompVram(sBackdropTilemap, (void *)(VRAM + 0xC800));
        LoadPalette(sLegendaryMonPalettes, 0xE0, sizeof(sLegendaryMonPalettes));
        ScanlineEffect_Stop();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 14;
        LoadCompressedObjectPic(&gUnknown_08393EFC[0]);
        LoadCompressedObjectPic(&gUnknown_08393F8C[0]);
        LoadCompressedObjectPic(&sPokemonLogoShineSpriteSheet[0]);
        LoadPalette(gUnknown_08E9F624, 0x100, 0x1C0);
        LoadSpritePalette(&sPokemonLogoShinePalette[0]);
        gMain.state = 2;
        break;
    case 2:
    {
        u8 taskId = CreateTask(Task_TitleScreenPhase1, 0);

        gTasks[taskId].tCounter = 256;
        gTasks[taskId].tSkipToNext = FALSE;
        gTasks[taskId].data[2] = -16;
        gTasks[taskId].data[3] = -32;
        gUnknown_0202F7E4 = taskId;
        gMain.state = 3;
        break;
    }
    case 3:
        BeginNormalPaletteFade(0xFFFFFFFF, 1, 16, 0, FADE_COLOR_WHITE);
        SetVBlankCallback(VBlankCB);
        gMain.state = 4;
        break;
    case 4:
    {
        u16 savedIme;

        sub_813CE30(0x78, 0x50, 0x100, 0);
        REG_BG2X = -29 * 256;
        REG_BG2Y = -33 * 256;
        REG_WIN0H = 0;
        REG_WIN0V = 0;
        REG_WIN1H = 0;
        REG_WIN1V = 0;
        REG_WININ = 0x1F1F;
        REG_WINOUT = 0x3F1F;
        REG_BLDCNT = 0x84;
        REG_BLDALPHA = 0;
        REG_BLDY = 0x8;
        REG_BG0CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(24) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_BG1CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(25) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_BG2CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(9) | BGCNT_256COLOR | BGCNT_AFF256x256;
        savedIme = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = savedIme;
        REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
        REG_DISPCNT = DISPCNT_MODE_1
                    | DISPCNT_OBJ_1D_MAP
                    | DISPCNT_BG2_ON
                    | DISPCNT_OBJ_ON
                    | DISPCNT_WIN0_ON
                    | DISPCNT_OBJWIN_ON;
        m4aSongNumStart(0x19D);
        gMain.state = 5;
        break;
    }
    case 5:
        if (!UpdatePaletteFade())
        {
            StartPokemonLogoShine(FALSE);
            ScanlineEffect_InitWave(0, DISPLAY_HEIGHT, 4, 4, 0, SCANLINE_EFFECT_REG_BG1HOFS, TRUE);
            SetMainCallback2(MainCB2);
        }
        break;
    }
}

static void MainCB2(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

//Shine the Pokemon logo two more times, and fade in the version banner
static void Task_TitleScreenPhase1(u8 taskId)
{
    //Skip to next phase when A, B, Start, or Select is pressed
    if ((gMain.newKeys & A_B_START_SELECT) || gTasks[taskId].data[1] != 0)
    {
        gTasks[taskId].tSkipToNext = TRUE;
        gTasks[taskId].tCounter = 0;
    }

    if (gTasks[taskId].tCounter != 0)
    {
        u16 frameNum = gTasks[taskId].tCounter;

        if (frameNum == 160 || frameNum == 64)
            StartPokemonLogoShine(TRUE);
        gTasks[taskId].tCounter--;
    }
    else
    {
        u8 spriteId;

        REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
        REG_WININ = 0;
        REG_WINOUT = 0;
        REG_BLDCNT = 0x3F50;
        REG_BLDALPHA = 0x1F;
        REG_BLDY = 0;

        //Create left side of version banner
        spriteId = CreateSprite(&sVersionBannerLeftSpriteTemplate, VERSION_BANNER_LEFT_X, VERSION_BANNER_Y, 0);
        gSprites[spriteId].invisible = TRUE;
        gSprites[spriteId].data[1] = taskId;

        //Create right side of version banner
        spriteId = CreateSprite(&sVersionBannerRightSpriteTemplate, VERSION_BANNER_RIGHT_X, VERSION_BANNER_Y, 0);
        gSprites[spriteId].invisible = TRUE;
        gSprites[spriteId].data[1] = taskId;

        gTasks[taskId].data[5] = 88;
        gTasks[taskId].tCounter = 144;
        gTasks[taskId].func = Task_TitleScreenPhase2;
    }
}

//Create "Press Start" and copyright banners, and slide Pokemon logo up
static void Task_TitleScreenPhase2(u8 taskId)
{
    //Skip to next phase when A, B, Start, or Select is pressed
    if ((gMain.newKeys & A_B_START_SELECT) || gTasks[taskId].tSkipToNext)
    {
        gTasks[taskId].tSkipToNext = TRUE;
        gTasks[taskId].tCounter = 0;
    }

    if (gTasks[taskId].tCounter != 0)
        gTasks[taskId].tCounter--;
    else
    {
        gTasks[taskId].tSkipToNext = TRUE;
        REG_DISPCNT = DISPCNT_MODE_1
                    | DISPCNT_OBJ_1D_MAP
                    | DISPCNT_BG0_ON
                    | DISPCNT_BG1_ON
                    | DISPCNT_BG2_ON
                    | DISPCNT_OBJ_ON;
        CreatePressStartBanner(START_BANNER_X, 108);
        CreateCopyrightBanner(DISPLAY_WIDTH / 2, 148);
        gTasks[taskId].data[4] = 0;
        gTasks[taskId].func = Task_TitleScreenPhase3;
    }

    if (!(gTasks[taskId].tCounter & 1) && gTasks[taskId].data[3] != 0)
        gTasks[taskId].data[3]++;

    //Slide Pokemon logo up
    REG_BG2Y = gTasks[taskId].data[3] * 256;
}

//Show Kyogre/Groundon silhouette and process main title screen input
static void Task_TitleScreenPhase3(u8 taskId)
{
    REG_BLDCNT = 0x2142;
    REG_BLDALPHA = 0x1F0F;
    REG_BLDY = 0;

    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & START_BUTTON))
    {
        FadeOutBGM(4);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, FADE_COLOR_WHITE);
        SetMainCallback2(CB2_GoToMainMenu);
    }
    else
    {
        if ((gMain.heldKeys & CLEAR_SAVE_BUTTON_COMBO) == CLEAR_SAVE_BUTTON_COMBO)
            SetMainCallback2(CB2_GoToClearSaveDataScreen);
        if ((gMain.heldKeys & RESET_RTC_BUTTON_COMBO) == RESET_RTC_BUTTON_COMBO
          && CanResetRTC() == 1)
        {
            FadeOutBGM(4);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            SetMainCallback2(CB2_GoToResetRtcScreen);
        }
#if DEBUG
        else if (gMain.heldKeys == SELECT_BUTTON)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            SetMainCallback2(CB2_GoToTestMenu);
        }
#endif
        else
        {
            REG_BG2Y = 0;
            gTasks[taskId].tCounter++;
            if (gTasks[taskId].tCounter & 1)
            {
                gTasks[taskId].data[4]++;
                gBattle_BG1_Y = gTasks[taskId].data[4];
                gBattle_BG1_X = 0;
            }
            UpdateLegendaryMarkingColor(gTasks[taskId].tCounter);
            if ((gMPlay_BGM.status & 0xFFFF) == 0)
            {
                BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, FADE_COLOR_WHITE);
                SetMainCallback2(CB2_GoToCopyrightScreen);
            }
        }
    }
}

static void CB2_GoToMainMenu(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitMainMenu);
}

#if DEBUG
static void CB2_GoToTestMenu(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitTestMenu);
}
#endif

static void CB2_GoToCopyrightScreen(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitCopyrightScreenAfterTitleScreen);
}

static void CB2_GoToClearSaveDataScreen(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitClearSaveDataScreen);
}

static void CB2_GoToResetRtcScreen(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitResetRtcScreen);
}

static void UpdateLegendaryMarkingColor(u8 frameNum)
{
    u16 palette;

    if ((frameNum % 4) == 0) //Change color every 4th frame
    {
        u8 colorIntensity = (frameNum >> 2) & 31; //Take bits 2-6 of frameNum the color intensity
        u8 fadeDarker = (frameNum >> 2) & 32;

        if (!fadeDarker)
            palette = LEGENDARY_MARKING_COLOR(colorIntensity);
        else
            palette = LEGENDARY_MARKING_COLOR(31 - colorIntensity);
        LoadPalette(&palette, 0xEF, sizeof(palette));
   }
}

