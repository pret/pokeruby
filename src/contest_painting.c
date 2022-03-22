#include "global.h"
#include "contest_painting.h"
#include "data2.h"
#include "decompress.h"
#include "ewram.h"
#include "image_processing_effects.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "random.h"
#include "scanline_effect.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"

static u8 sHoldState;
static u16 sMosaicVal;
static u16 sFrameCounter;
static u8 sVarsInitialized;

u16 (*gContestMonPixels)[][32];
struct ImageProcessingContext gImageProcessingContext;
u8 sCaptionBuffer[76];
struct ContestWinner *gContestPaintingWinner;
u16 *gContestPaintingMonPalette;

static const u16 gPictureFramePalettes[][16] =
{
    INCBIN_U16("graphics/picture_frame/bg0.gbapal"),
    INCBIN_U16("graphics/picture_frame/bg1.gbapal"),
    INCBIN_U16("graphics/picture_frame/bg2.gbapal"),
    INCBIN_U16("graphics/picture_frame/bg3.gbapal"),
    INCBIN_U16("graphics/picture_frame/bg4.gbapal"),
    INCBIN_U16("graphics/picture_frame/bg5.gbapal"),
    {0},
    {0},
};
const u8 emptySpace[8 * 32] = {0};
const u8 gPictureFrameTiles_0[] = INCBIN_U8("graphics/picture_frame/frame0.4bpp.rl");
const u8 gPictureFrameTiles_1[] = INCBIN_U8("graphics/picture_frame/frame1.4bpp.rl");
const u8 gPictureFrameTiles_2[] = INCBIN_U8("graphics/picture_frame/frame2.4bpp.rl");
const u8 gPictureFrameTiles_3[] = INCBIN_U8("graphics/picture_frame/frame3.4bpp.rl");
const u8 gPictureFrameTiles_4[] = INCBIN_U8("graphics/picture_frame/frame4.4bpp.rl");
const u8 gPictureFrameTiles_5[] = INCBIN_U8("graphics/picture_frame/frame5.4bpp.rl");
const u8 gPictureFrameTilemap_0[] = INCBIN_U8("graphics/picture_frame/frame0_map.bin.rl");
const u8 gPictureFrameTilemap_1[] = INCBIN_U8("graphics/picture_frame/frame1_map.bin.rl");
const u8 gPictureFrameTilemap_2[] = INCBIN_U8("graphics/picture_frame/frame2_map.bin.rl");
const u8 gPictureFrameTilemap_3[] = INCBIN_U8("graphics/picture_frame/frame3_map.bin.rl");
const u8 gPictureFrameTilemap_4[] = INCBIN_U8("graphics/picture_frame/frame4_map.bin.rl");
const u8 gPictureFrameTilemap_5[] = INCBIN_U8("graphics/picture_frame/frame5_map.bin.rl");

const u8 *const sContestRankNames[] =
{
    OtherText_Cool,
    OtherText_Beauty2,
    OtherText_Cute,
    OtherText_Smart,
    OtherText_Tough,
};

const struct LabelPair sMuseumCaptions[] =
{
    // COOL
    {OtherText_NonstopSuperCool, OtherText_Terminator6},
    {OtherText_GoodLookingPoke, OtherText_Terminator7},
    {OtherText_MarvelousGreat, OtherText_Terminator8},
    // BEAUTY
    {OtherText_CenturyLastVenus, OtherText_Terminator9},
    {OtherText_Terminator10, OtherText_DazzlingSmile},
    {OtherText_PokeCenterIdol, OtherText_Terminator11},
    // CUTE
    {OtherText_LovelyAndSweet, OtherText_Terminator12},
    {OtherText_ThePretty, OtherText_WinningPortrait},
    {OtherText_GiveUsWink, OtherText_Terminator13},
    // SMART
    {OtherText_SmartnessMaestro, OtherText_Terminator15},
    {OtherText_ChosenPokeAmong, OtherText_Terminator15},
    {OtherText_TheExcellent, OtherText_ItsMomentOfElegance},
    // TOUGH
    {OtherText_PowerfullyMuscular, OtherText_Terminator16},
    {OtherText_StrongErEst, OtherText_Terminator17},
    {OtherText_MightyTough, OtherText_Exclamation},
};

const struct OamData sContestPaintingMonOamData =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = TRUE,
    .bpp = ST_OAM_8BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const u16 sBgPalette[] = {RGB_BLACK, RGB_BLACK};

static void ShowContestPainting();
static void CB2_HoldContestPainting(void);
static void HoldContestPainting(void);
static void InitContestPaintingWindow(bool8 isForArtist);
static void PrintContestPaintingCaption(u8 contestType, bool8 isForArtist);
static void InitContestPaintingBg(void);
static void InitContestPaintingVars(bool8 reset);
static void VBlankCB_ContestPainting(void);
static void _InitContestMonPixels(u8 *spriteGfx, u16 *palette, u16 *destPixels);
static void CreateContestPaintingPicture(u8 contestWinnerId, bool8 isForArtist);

void SetContestWinnerForPainting(u32 contestWinnerId)
{
    struct ContestWinner *curWinner = &eCurContestWinner;
    u8 *saveIdx = (u8*)&eCurContestWinnerSaveIdx;
    u8 *isForArtist = (u8*)&eCurContestWinnerIsForArtist;
    *curWinner = gSaveBlock1.contestWinners[contestWinnerId - 1];
	*saveIdx = contestWinnerId - 1;
	*isForArtist = FALSE;
}

void CB2_ContestPainting(void)
{
    ShowContestPainting();
}

static void ShowContestPainting(void)
{
    switch (gMain.state)
    {
    case 0:
        ScanlineEffect_Stop();
        SetVBlankCallback(NULL);
        gContestPaintingWinner = &eCurContestWinner;
        InitContestPaintingVars(TRUE);
        InitContestPaintingBg();
        gMain.state++;
        break;
    case 1:
    {
        ResetPaletteFade();
        DmaFill32Large(3, 0, (void *)(VRAM + 0x0), 0x18000, 0x1000);
        ResetSpriteData();
        gMain.state++;
        break;
    }
    case 2:
        SeedRng(gMain.vblankCounter1);
        InitKeys();
        InitContestPaintingWindow(eCurContestWinnerIsForArtist);
        gMain.state++;
        break;
    case 3:
        CreateContestPaintingPicture(eCurContestWinnerSaveIdx, eCurContestWinnerIsForArtist);
        gMain.state++;
        break;
    case 4:
        PrintContestPaintingCaption(eCurContestWinnerSaveIdx, eCurContestWinnerIsForArtist);
        LoadPalette(sBgPalette, 0, 1 * 2);
        DmaClear32(3, PLTT, 0x400);
        BeginFastPaletteFade(2);
        SetVBlankCallback(VBlankCB_ContestPainting);
        sHoldState = 0;
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_ON;
        SetMainCallback2(CB2_HoldContestPainting);
        break;
    }
}

static void CB2_HoldContestPainting(void)
{
    HoldContestPainting();
    UpdatePaletteFade();
}

static void CB2_QuitContestPainting(void)
{
    SetMainCallback2(gMain.savedCallback);
}

static void HoldContestPainting(void)
{
    switch (sHoldState)
    {
    case 0:
        if (!gPaletteFade.active)
            sHoldState = 1;
        if (sVarsInitialized&& sFrameCounter != 0)
            sFrameCounter--;
        break;
    case 1:
        if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
        {
            sHoldState++;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        }
        if (sVarsInitialized != 0)
            sFrameCounter = 0;
        break;
    case 2:
        if (!gPaletteFade.active)
            SetMainCallback2(CB2_QuitContestPainting);
        if (sVarsInitialized && sFrameCounter < 30)
            sFrameCounter++;
        break;
    }
}

static void InitContestPaintingWindow(u8 isForArtist)
{
    InitMenuWindow(&gWindowTemplate_ContestPainting);
    Text_LoadWindowTemplate(&gWindowTemplate_ContestPainting);
}

static void PrintContestPaintingCaption(u8 contestType, u8 isForArtist)
{
    u8 xPos, yPos;
    u8 *ptr;
    u8 type;

    if (isForArtist == TRUE)
        return;
    ptr = sCaptionBuffer;
    type = gContestPaintingWinner->contestCategory;
    if (contestType < 8)
    {
        ptr = StringCopy(ptr, sContestRankNames[type]);
        ptr = StringCopy(ptr, gContestText_ContestWinner);
#if ENGLISH
        ptr = StringCopy(ptr, gContestPaintingWinner->trainerName);
#elif GERMAN
        ptr = StringCopy_Nickname(ptr, gContestPaintingWinner->nickname);
#endif

        // {LATIN}
        ptr[0] = EXT_CTRL_CODE_BEGIN;
        ptr[1] = 0x16;
        ptr += 2;

        ptr = StringCopy(ptr, gOtherText_Unknown1);
#if ENGLISH
        ptr = StringCopy_Nickname(ptr, gContestPaintingWinner->nickname);
#elif GERMAN
        ptr = StringCopy(ptr, gContestPaintingWinner->trainerName);
#endif

        xPos = 6;
        yPos = 14;
    }
    else
    {
        ptr = StringCopy(ptr, sMuseumCaptions[type].prefix);
        ptr = StringCopy_Nickname(ptr, gContestPaintingWinner->nickname);
        ptr = StringCopy(ptr, sMuseumCaptions[type].suffix);

        xPos = 3;
        yPos = 14;
    }
    Menu_PrintTextPixelCoords(sCaptionBuffer, xPos * 8 + 1, yPos * 8, 1);
}

static void InitContestPaintingBg(void)
{
    REG_DISPCNT = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_BG0CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(12) | BGCNT_MOSAIC | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BG1CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(10) | BGCNT_MOSAIC | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
}

static void InitContestPaintingVars(bool8 reset)
{
    if (reset == FALSE)
    {
        sVarsInitialized = FALSE;
        sMosaicVal = 0;
        sFrameCounter = 0;
    }
    else
    {
        sVarsInitialized = TRUE;
        sMosaicVal = 15;
        sFrameCounter = 30;
    }
}

static void ContestPaintingMosaic(void)
{
    if (sVarsInitialized == FALSE)
    {
        REG_MOSAIC = 0;
        return;
    }

    REG_BG1CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(10) | BGCNT_MOSAIC | BGCNT_16COLOR | BGCNT_TXT256x256;
    sMosaicVal = sFrameCounter / 2;

    REG_MOSAIC = (sMosaicVal << 12) | (sMosaicVal << 8) | (sMosaicVal << 4) | (sMosaicVal << 0);
}

static void VBlankCB_ContestPainting(void)
{
    ContestPaintingMosaic();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void InitContestMonPixels(u16 species, u8 arg1)
{
    const void *pal;

    pal = GetMonSpritePalFromOtIdPersonality(species, gContestPaintingWinner->otId, gContestPaintingWinner->personality);
    LZDecompressVram(pal, gContestPaintingMonPalette);

    if (arg1 == 0)
    {
        HandleLoadSpecialPokePic(
            &gMonFrontPicTable[species],
            gMonFrontPicCoords[species].coords,
            gMonFrontPicCoords[species].y_offset,
            (void *)EWRAM,
            gMonSpriteGfx_Sprite_ptr[1],
            species,
            (u32)gContestPaintingWinner->personality
        );
        _InitContestMonPixels((u8*)gMonSpriteGfx_Sprite_ptr[1], (u16*)gContestPaintingMonPalette, (u16*)gContestMonPixels);
    }
    else
    {
        HandleLoadSpecialPokePic(
            &gMonBackPicTable[species],
            gMonBackPicCoords[species].coords,
            gMonBackPicCoords[species].y_offset,
            (void *)EWRAM,
            gMonSpriteGfx_Sprite_ptr[0],
            species,
            (u32)gContestPaintingWinner->personality
        );
        _InitContestMonPixels((u8*)gMonSpriteGfx_Sprite_ptr[0], (u16*)gContestPaintingMonPalette, (u16*)gContestMonPixels);
    }
}

static void _InitContestMonPixels(u8 *spriteGfx, u16 *palette, u16 *destPixels)
{
    u16 tileY, tileX, pixelY, pixelX;

    /*
        Raw arithmetics are required to match this function.
        At least it's the first known way to match it. The extreme
        sensitivity of this match and Game Freak proving to not have
        been a fan of C's advanced array features, preferring to
        calculate dimensions manually (as seen in other functions),
        tell that it may have been this way in the original code.
    */
    for (tileY = 0; tileY < 8; tileY++)
    {
        for (tileX = 0; tileX < 8; tileX++)
        {
            for (pixelY = 0; pixelY < 8; pixelY++)
            {
                for (pixelX = 0; pixelX < 8; pixelX++)
                {
                    u8 colorIndex = spriteGfx[(((tileY * 8) + tileX) * 32) + (pixelY << 2) + (pixelX >> 1)];
                    /*
                        The shifts have to be there to match r0 and r2's order in one instruction:
                                add     r5, r2, r0
                        This also makes agbcc's expression order parsing even more super sensitive
                        and obscene when it comes to parentheses affecting regalloc regardless if
                        unnecessary, requiring tileX must be placed in the front to match, or else
                        regalloc breaks again and does this a few instructions above:
                                add     r0, r3, r7 <- regswap
                    */

                    if (pixelX & 1)
                        colorIndex /= 16;
                    else
                        colorIndex %= 16;

                    // Same order as above needs to be written here, or else this happens:
                    //         add     r0, r7, r1 <- regswap
                    if (colorIndex == 0)
                        *(u16 *)(destPixels + (((tileY * 8) + pixelY) << 6) + ((tileX * 8) + pixelX)) = 0x8000;
                    else
                        *(u16 *)(destPixels + (((tileY * 8) + pixelY) << 6) + ((tileX * 8) + pixelX)) =
                            palette[colorIndex];
                }
            }
        }
    }
}

static void LoadContestPaintingFrame(u8 contestWinnerId, u8 isForArtist)
{
    u8 x, y;

    LoadPalette(gPictureFramePalettes, 0, sizeof(gPictureFramePalettes));
    if (isForArtist == TRUE)
    {
        switch (gContestPaintingWinner->contestCategory / 3)
        {
        case CONTEST_COOL:
            RLUnCompVram(gPictureFrameTiles_0, (void *)VRAM);
            RLUnCompWram(gPictureFrameTilemap_0, gContestMonPixels);
            break;
        case CONTEST_BEAUTY:
            RLUnCompVram(gPictureFrameTiles_1, (void *)VRAM);
            RLUnCompWram(gPictureFrameTilemap_1, gContestMonPixels);
            break;
        case CONTEST_CUTE:
            RLUnCompVram(gPictureFrameTiles_2, (void *)VRAM);
            RLUnCompWram(gPictureFrameTilemap_2, gContestMonPixels);
            break;
        case CONTEST_SMART:
            RLUnCompVram(gPictureFrameTiles_3, (void *)VRAM);
            RLUnCompWram(gPictureFrameTilemap_3, gContestMonPixels);
            break;
        case CONTEST_TOUGH:
            RLUnCompVram(gPictureFrameTiles_4, (void *)VRAM);
            RLUnCompWram(gPictureFrameTilemap_4, gContestMonPixels);
            break;
        }

#define VRAM_PICTURE_DATA(x, y) (((u16 *)(VRAM + 0x6000))[(y) * 32 + (x)])

        // Set the background
        for (y = 0; y < 20; y++)
        {
            for (x = 0; x < 32; x++)
                VRAM_PICTURE_DATA(x, y) = 0x1015;
        }

        // Copy the image frame
        for (y = 0; y < 10; y++)
        {
            for (x = 0; x < 18; x++)
                VRAM_PICTURE_DATA(x + 6, y + 2) = (*gContestMonPixels)[y + 2][x + 6];
        }

        // Re-set the entire top row to the first top frame part
        for (x = 0; x < 16; x++)
            VRAM_PICTURE_DATA(x + 7, 2) = (*gContestMonPixels)[2][7];

#undef VRAM_PICTURE_DATA
    }
    else if (contestWinnerId < 8)
    {
        RLUnCompVram(gPictureFrameTiles_5, (void *)VRAM);
        RLUnCompVram(gPictureFrameTilemap_5, (void *)(VRAM + 0x6000));
    }
    else
    {
        switch (gContestPaintingWinner->contestCategory / 3)
        {
        case CONTEST_COOL:
            RLUnCompVram(gPictureFrameTiles_0, (void *)VRAM);
            RLUnCompVram(gPictureFrameTilemap_0, (void *)(VRAM + 0x6000));
            break;
        case CONTEST_BEAUTY:
            RLUnCompVram(gPictureFrameTiles_1, (void *)VRAM);
            RLUnCompVram(gPictureFrameTilemap_1, (void *)(VRAM + 0x6000));
            break;
        case CONTEST_CUTE:
            RLUnCompVram(gPictureFrameTiles_2, (void *)VRAM);
            RLUnCompVram(gPictureFrameTilemap_2, (void *)(VRAM + 0x6000));
            break;
        case CONTEST_SMART:
            RLUnCompVram(gPictureFrameTiles_3, (void *)VRAM);
            RLUnCompVram(gPictureFrameTilemap_3, (void *)(VRAM + 0x6000));
            break;
        case CONTEST_TOUGH:
            RLUnCompVram(gPictureFrameTiles_4, (void *)VRAM);
            RLUnCompVram(gPictureFrameTilemap_4, (void *)(VRAM + 0x6000));
            break;
        }
    }
}

static void InitPaintingMonOamData(u8 contestWinnerId)
{
    gMain.oamBuffer[0] = sContestPaintingMonOamData;
    gMain.oamBuffer[0].tileNum = 0;

    if (contestWinnerId > 1)
    {
        gMain.oamBuffer[0].x = 88;
        gMain.oamBuffer[0].y = 24;
    }
    else // duplicated code branch
    {
        gMain.oamBuffer[0].x = 88;
        gMain.oamBuffer[0].y = 24;
    }
}

static u8 GetImageEffectForContestWinner(u8 contestWinnerId)
{
    u8 contestType;

    if (contestWinnerId < 8)
        contestType = gContestPaintingWinner->contestCategory;
    else
        contestType = gContestPaintingWinner->contestCategory / 3;

    switch (contestType)
    {
    case CONTEST_COOL:
        return CONTESTRESULT_COOL;
    case CONTEST_BEAUTY:
        return CONTESTRESULT_BEAUTY;
    case CONTEST_CUTE:
        return CONTESTRESULT_CUTE;
    case CONTEST_SMART:
        return CONTESTRESULT_SMART;
    case CONTEST_TOUGH:
        return CONTESTRESULT_TOUGH;
    }

    return contestType;
}

static void AllocPaintingResources(void)
{
    gContestPaintingMonPalette = eContestPaintingBuffers.palette;
    gContestMonPixels = (void *)eContestPaintingBuffers.pixels;
}

static void DoContestPaintingImageProcessing(u8 imageEffect)
{
    gImageProcessingContext.canvasPixels = gContestMonPixels;
    gImageProcessingContext.canvasPalette = gContestPaintingMonPalette;
    gImageProcessingContext.paletteStart = 0;
    gImageProcessingContext.personality = gContestPaintingWinner->personality % 256;
    gImageProcessingContext.columnStart = 0;
    gImageProcessingContext.rowStart = 0;
    gImageProcessingContext.columnEnd = 64;
    gImageProcessingContext.rowEnd = 64;
    gImageProcessingContext.canvasWidth = 64;
    gImageProcessingContext.canvasHeight = 64;

    switch (imageEffect)
    {
    case CONTESTRESULT_SMART:
    case CONTESTRESULT_TOUGH:
        gImageProcessingContext.quantizeEffect = QUANTIZE_EFFECT_GRAYSCALE;
        break;
    case CONTESTRESULT_COOL:
    case CONTESTRESULT_BEAUTY:
    case CONTESTRESULT_CUTE:
    default:
        gImageProcessingContext.quantizeEffect = QUANTIZE_EFFECT_STANDARD_LIMITED_COLORS;
        break;
    }

    gImageProcessingContext.bgType = 2;
    gImageProcessingContext.effect = imageEffect;
    gImageProcessingContext.dest = OBJ_VRAM0;

    ApplyImageProcessingEffects(&gImageProcessingContext);
    ApplyImageProcessingQuantization(&gImageProcessingContext);
    ConvertImageProcessingToGBA(&gImageProcessingContext);

    LoadPalette(gContestPaintingMonPalette, 256, 256 * 2);
}

static void CreateContestPaintingPicture(u8 contestWinnerId, u8 isForArtist)
{
    AllocPaintingResources();
    InitContestMonPixels(gContestPaintingWinner->species, 0);
    DoContestPaintingImageProcessing(GetImageEffectForContestWinner(contestWinnerId));
    InitPaintingMonOamData(contestWinnerId);
    LoadContestPaintingFrame(contestWinnerId, isForArtist);
}
