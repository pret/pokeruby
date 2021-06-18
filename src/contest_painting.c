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
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 1,
    .bpp = 1,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const u16 sBgPalette[] = {RGB_BLACK, RGB_BLACK};

static void ShowContestPainting();
static void CB2_HoldContestPainting(void);
static void HoldContestPainting(void);
static void ContestPaintingInitWindow(u8 arg0);
static void ContestPaintingPrintCaption(u8 arg0, u8 arg1);
static void ContestPaintingInitBG(void);
static void ContestPaintingInitVars(u8 arg0);
static void VBlankCB_ContestPainting(void);
static void sub_8106B90(u8 *a, u16 *b, u16 *c);
static void sub_8107090(u8 arg0, u8 arg1);

void sub_8106630(u32 contestWinnerId)
{
    // probably fakematching
    struct ContestWinner *ptr1 = &eContestPaintingWinner; // TODO: resolve messy struct duplicates
    u8 *ptr2 = (u8*)&gBattleStruct->contestWinnerSaveIdx;
    u8 *ptr3 = (u8*)&gBattleStruct->contestWinnerIsForArtist;
    *ptr1 = gSaveBlock1.contestWinners[contestWinnerId - 1];
	*ptr2 = contestWinnerId - 1;
	*ptr3 = 0;
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
        gContestPaintingWinner = &eContestPaintingWinner;
        ContestPaintingInitVars(TRUE);
        ContestPaintingInitBG();
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
        ContestPaintingInitWindow(gBattleStruct->contestWinnerIsForArtist);
        gMain.state++;
        break;
    case 3:
        sub_8107090(gBattleStruct->contestWinnerSaveIdx, gBattleStruct->contestWinnerIsForArtist);
        gMain.state++;
        break;
    case 4:
        ContestPaintingPrintCaption(gBattleStruct->contestWinnerSaveIdx, gBattleStruct->contestWinnerIsForArtist);
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
        if (sVarsInitialized != 0 && sFrameCounter != 0)
            sFrameCounter--;
        break;
    case 1:
        if ((gMain.newKeys & 1) || (gMain.newKeys & 2))
        {
            u8 two = 2;  //needed to make the asm match

            sHoldState = two;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        }
        if (sVarsInitialized != 0)
            sFrameCounter = 0;
        break;
    case 2:
        if (!gPaletteFade.active)
            SetMainCallback2(CB2_QuitContestPainting);
        if (sVarsInitialized != 0 && sFrameCounter <= 0x1D)
            sFrameCounter++;
        break;
    }
}

static void ContestPaintingInitWindow(u8 arg0)
{
    InitMenuWindow(&gWindowTemplate_81E7160);
    Text_LoadWindowTemplate(&gWindowTemplate_81E7160);
}

static void ContestPaintingPrintCaption(u8 contestType, u8 arg1)
{
    u8 xPos, yPos;
    u8 *ptr;
    u8 type;

    if (arg1 == TRUE)
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
        ptr = StringCopy10(ptr, gContestPaintingWinner->nickname);
#endif

        // {LATIN}
        ptr[0] = 0xFC;
        ptr[1] = 0x16;
        ptr += 2;

        ptr = StringCopy(ptr, gOtherText_Unknown1);
#if ENGLISH
        ptr = StringCopy10(ptr, gContestPaintingWinner->nickname);
#elif GERMAN
        ptr = StringCopy(ptr, gContestPaintingWinner->trainerName);
#endif

        xPos = 6;
        yPos = 14;
    }
    else
    {
        ptr = StringCopy(ptr, sMuseumCaptions[type].prefix);
        ptr = StringCopy10(ptr, gContestPaintingWinner->nickname);
        ptr = StringCopy(ptr, sMuseumCaptions[type].suffix);

        xPos = 3;
        yPos = 14;
    }
    Menu_PrintTextPixelCoords(sCaptionBuffer, xPos * 8 + 1, yPos * 8, 1);
}

static void ContestPaintingInitBG(void)
{
    REG_DISPCNT = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_BG0CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(12) | BGCNT_MOSAIC | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BG1CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(10) | BGCNT_MOSAIC | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
}

static void ContestPaintingInitVars(bool8 arg0)
{
    if (arg0 == FALSE)
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

static void sub_8106AC4(u16 species, u8 arg1)
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
            EWRAM,
            gUnknown_081FAF4C[1],
            species,
            (u32)gContestPaintingWinner->personality
        );
        sub_8106B90((u8*)gUnknown_081FAF4C[1], (u16*)gContestPaintingMonPalette, (u16*)gContestMonPixels);
    }
    else
    {
        HandleLoadSpecialPokePic(
            &gMonBackPicTable[species],
            gMonBackPicCoords[species].coords,
            gMonBackPicCoords[species].y_offset,
            EWRAM,
            gUnknown_081FAF4C[0],
            species,
            (u32)gContestPaintingWinner->personality
        );
        sub_8106B90((u8*)gUnknown_081FAF4C[0], (u16*)gContestPaintingMonPalette, (u16*)gContestMonPixels);
    }
}

static void sub_8106B90(u8 *a, u16 *b, u16 *c)
{
    u16 i, j, k, l;

    /*
        Raw arithmetics are required to match this function.
        At least it's the first known way to match it. The extreme
        sensitivity of this match and Game Freak proving to not have
        been a fan of C's advanced array features, preferring to
        calculate dimensions manually (as seen in other functions),
        tell that it may have been this way in the original code.
    */
    for (i = 0; i < 8; i++)
    {
        for (j = 0; j < 8; j++)
        {
            for (k = 0; k < 8; k++)
            {
                for (l = 0; l < 8; l++)
                {
                    u8 temp = a[(((i * 8) + j) * 32) + (k << 2) + (l >> 1)];
                    /*
                        The shifts have to be there to match r0 and r2's order in one instruction:
                                add     r5, r2, r0
                        This also makes agbcc's expression order parsing even more super sensitive
                        and obscene when it comes to parentheses affecting regalloc regardless if
                        unnecessary, requiring j must be placed in the front to match, or else
                        regalloc breaks again and does this a few instructions above:
                                add     r0, r3, r7 <- regswap
                    */

                    if (l & 1)
                        temp /= 16;
                    else
                        temp %= 16;

                    // Same order as above needs to be written here, or else this happens:
                    //         add     r0, r7, r1 <- regswap
                    if (temp == 0)
                        *(u16 *)(c + (((i * 8) + k) << 6) + ((j * 8) + l)) = 0x8000;
                    else
                        *(u16 *)(c + (((i * 8) + k) << 6) + ((j * 8) + l)) = b[temp];
                }
            }
        }
    }
}

static void sub_8106C40(u8 arg0, u8 arg1)
{
    u8 x, y;

    LoadPalette(gPictureFramePalettes, 0, sizeof(gPictureFramePalettes));
    if (arg1 == 1)
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
    else if (arg0 < 8)
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

static void sub_8106E98(u8 arg0)
{
    //Some hacks just to get the asm to match
#ifndef NONMATCHING
    asm(""::"r"(arg0));
#endif

    gMain.oamBuffer[0] = sContestPaintingMonOamData;
    gMain.oamBuffer[0].tileNum = 0;

#ifndef NONMATCHING
    if (arg0) arg0 = gMain.oamBuffer[0].tileNum;
#endif

    gMain.oamBuffer[0].x = 88;
    gMain.oamBuffer[0].y = 24;
}

static u8 sub_8106EE0(u8 arg0)
{
    u8 contestType;

    if (arg0 < 8)
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

static void sub_8106F4C(void)
{
    gContestPaintingMonPalette = ewram15E00.palette;
    gContestMonPixels = (void *)&ewram15E00.pixels;
}

static void sub_8106F6C(u8 arg0)
{
    gImageProcessingContext.var_4 = gContestMonPixels;
    gImageProcessingContext.var_8 = gContestPaintingMonPalette;
    gImageProcessingContext.var_18 = 0;
    gImageProcessingContext.var_1F = gContestPaintingWinner->personality % 256;
    gImageProcessingContext.var_19 = 0;
    gImageProcessingContext.var_1A = 0;
    gImageProcessingContext.var_1B = 64;
    gImageProcessingContext.var_1C = 64;
    gImageProcessingContext.var_1D = 64;
    gImageProcessingContext.var_1E = 64;

    switch (arg0)
    {
    case CONTESTRESULT_SMART:
    case CONTESTRESULT_TOUGH:
        gImageProcessingContext.var_14 = 3;
        break;
    case CONTESTRESULT_COOL:
    case CONTESTRESULT_BEAUTY:
    case CONTESTRESULT_CUTE:
    default:
        gImageProcessingContext.var_14 = 1;
        break;
    }

    gImageProcessingContext.var_16 = 2;
    gImageProcessingContext.var_0 = arg0;
    gImageProcessingContext.var_10 = OBJ_VRAM0;

    sub_80FC7A0(&gImageProcessingContext);
    sub_80FDA18(&gImageProcessingContext);
    sub_80FD8CC(&gImageProcessingContext);

    LoadPalette(gContestPaintingMonPalette, 256, 256 * 2);
}

static void sub_8107090(u8 arg0, u8 arg1)
{
    sub_8106F4C();
    sub_8106AC4(gContestPaintingWinner->species, 0);
    sub_8106F6C(sub_8106EE0(arg0));
    sub_8106E98(arg0);
    sub_8106C40(arg0, arg1);
}
