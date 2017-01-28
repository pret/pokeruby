#include "global.h"
#include "title_screen.h"
#include "asm.h"
#include "clear_save_data_menu.h"
#include "decompress.h"
#include "event_data.h"
#include "gba/m4a_internal.h"
#include "intro.h"
#include "m4a.h"
#include "main.h"
#include "main_menu.h"
#include "palette.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"

extern u8 gReservedSpritePaletteCount;
extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gUnknown_0202F7E4;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_030042C0;
extern const u8 gUnknown_08E9D8CC[];
extern const u16 gUnknown_08E9F624[];
extern const u8 gUnknown_08E9F7E4[];
extern const u8 gVersionTiles[];
extern const u8 gTitleScreenPressStart_Gfx[];
extern const u16 gTitleScreenLogoShinePalette[];

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
    .shape = 1,
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
    .shape = 1,
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
    ANIMCMD_FRAME(64, 30),
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
static const struct SpriteSheet gUnknown_08393EFC[] =
{
    {gVersionTiles, 0x1000, 1000},
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
static const struct SpriteSheet gUnknown_08393F8C[] =
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
static const struct SpriteSheet sPokemonLogoShineSpriteSheet[] =
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

#ifdef SAPPHIRE
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
static void CB2_GoToClearSaveDataScreen(void);
static void CB2_GoToResetRtcScreen(void);
static void CB2_GoToCopyrightScreen(void);
static void UpdateLegendaryMarkingColor(u8);

void SpriteCallback_VersionBannerLeft(struct Sprite *sprite)
{
    struct Task *task = &gTasks[sprite->data1];

    if (task->data[1] != 0)
    {
        sprite->oam.objMode = 0;
        sprite->pos1.y = 66;
        sprite->invisible = FALSE;
    }
    else
    {
        if (task->data[5] != 0)
            task->data[5]--;
        if (task->data[5] < 64)
        {
            sprite->invisible = FALSE;
            if (sprite->pos1.y != 66)
                sprite->pos1.y++;
            REG_BLDALPHA = gUnknown_08393E64[task->data[5] / 2];
        }
    }
}

void SpriteCallback_VersionBannerRight(struct Sprite *sprite)
{
    struct Task *task = &gTasks[sprite->data1];

    if (task->data[1] != 0)
    {
        sprite->oam.objMode = 0;
        sprite->pos1.y = 66;
        sprite->invisible = FALSE;
    }
    else
    {
        if (task->data[5] < 64)
        {
            sprite->invisible = FALSE;
            if (sprite->pos1.y != 66)
                sprite->pos1.y++;
        }
    }
}

void SpriteCallback_PressStartCopyrightBanner(struct Sprite *sprite)
{
    if (sprite->data0 == 1)
    {
        sprite->data1++;
        //Alternate between hidden and shown every 16th frame
        if (sprite->data1 & 16)
            sprite->invisible = FALSE;
        else
            sprite->invisible = TRUE;
    }
    else
        sprite->invisible = FALSE;
}

static void CreatePressStartBanner(s16 x, s16 y)
{
    u8 i;
    u8 spriteId;

    x -= 32;
    for (i = 0; i < 3; i++, x += 32)
    {
        spriteId = CreateSprite(&sStartCopyrightBannerSpriteTemplate, x, y, 0);
        StartSpriteAnim(&gSprites[spriteId], i);
        gSprites[spriteId].data0 = 1;
    }
}

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
        if (sprite->data0) //Flash background
        {
            u16 backgroundColor;

            if (sprite->pos1.x < DISPLAY_WIDTH / 2)
            {
                //Brighten background color
                if (sprite->data1 < 31)
                    sprite->data1++;
                if (sprite->data1 < 31)
                    sprite->data1++;
            }
            else
            {
                //Darken background color
                if (sprite->data1 != 0)
                    sprite->data1--;
                if (sprite->data1 != 0)
                    sprite->data1--;
            }
            backgroundColor = _RGB(sprite->data1, sprite->data1, sprite->data1);
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
    gSprites[spriteId].data0 = flashBackground;
}

static void VBlankCB(void)
{
    sub_8089668();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    REG_BG1VOFS = gUnknown_030041B4;
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
        remove_some_task();
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
        BeginNormalPaletteFade(-1, 1, 0x10, 0, 0xFFFF);
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
        REG_BG0CNT = 0x180B;
        REG_BG1CNT = 0x190A;
        REG_BG2CNT = 0x4981;
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
            sub_8089944(0, 0xA0, 4, 4, 0, 4, 1);
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
        spriteId = CreateSprite(&sVersionBannerLeftSpriteTemplate, 0x62, 0x1A, 0);
        gSprites[spriteId].invisible = TRUE;
        gSprites[spriteId].data1 = taskId;

        //Create right side of version banner
        spriteId = CreateSprite(&sVersionBannerRightSpriteTemplate, 0xA2, 0x1A, 0);
        gSprites[spriteId].invisible = TRUE;
        gSprites[spriteId].data1 = taskId;

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
        CreatePressStartBanner(DISPLAY_WIDTH / 2, 108);
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
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0xFFFF);
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
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            SetMainCallback2(CB2_GoToResetRtcScreen);
        }
        else
        {
            REG_BG2Y = 0;
            gTasks[taskId].tCounter++;
            if (gTasks[taskId].tCounter & 1)
            {
                gTasks[taskId].data[4]++;
                gUnknown_030041B4 = gTasks[taskId].data[4];
                gUnknown_030042C0 = 0;
            }
            UpdateLegendaryMarkingColor(gTasks[taskId].tCounter);
            if ((gMPlay_BGM.status & 0xFFFF) == 0)
            {
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0xFFFF);
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

static void CB2_GoToCopyrightScreen(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitCopyrightScreen);
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

