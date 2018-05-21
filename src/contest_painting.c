#include "global.h"
#include "contest_painting.h"
#include "contest_painting_effects.h"
#include "data2.h"
#include "decompress.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "random.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"
#include "scanline_effect.h"
#include "ewram.h"

static u8 gUnknown_03000750;
static u16 gUnknown_03000752;
static u16 gUnknown_03000754;
static u8 gUnknown_03000756;

u16 (*gUnknown_03005E10)[][32];
struct Unk03005E20 gUnknown_03005E20;
u8 gUnknown_03005E40[0x4C];
struct ContestEntry *gUnknown_03005E8C;
u16 (*gUnknown_03005E90)[];

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
const u8 *const gUnknown_083F60AC[] =
{
    OtherText_Cool,
    OtherText_Beauty2,
    OtherText_Cute,
    OtherText_Smart,
    OtherText_Tough,
};
const struct LabelPair gUnknown_083F60C0[] =
{
    {OtherText_NonstopSuperCool, OtherText_Terminator6},
    {OtherText_GoodLookingPoke, OtherText_Terminator7},
    {OtherText_MarvelousGreat, OtherText_Terminator8},
    {OtherText_CenturyLastVenus, OtherText_Terminator9},
    {OtherText_Terminator10, OtherText_DazzlingSmile},
    {OtherText_PokeCenterIdol, OtherText_Terminator11},
    {OtherText_LovelyAndSweet, OtherText_Terminator12},
    {OtherText_ThePretty, OtherText_WinningPortrait},
    {OtherText_GiveUsWink, OtherText_Terminator13},
    {OtherText_SmartnessMaestro, OtherText_Terminator15},
    {OtherText_ChosenPokeAmong, OtherText_Terminator15},
    {OtherText_TheExcellent, OtherText_ItsMomentOfElegance},
    {OtherText_PowerfullyMuscular, OtherText_Terminator16},
    {OtherText_StrongErEst, OtherText_Terminator17},
    {OtherText_MightyTough, OtherText_Exclamation},
};
const struct OamData gOamData_83F6138 =
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
const u16 gUnknown_083F6140[] = {0, 0};

static void ShowContestPainting();
static void CB2_HoldContestPainting(void);
static void HoldContestPainting(void);
static void ContestPaintingInitWindow(u8 arg0);
static void ContestPaintingPrintCaption(u8 arg0, u8 arg1);
static void ContestPaintingInitBG(void);
static void ContestPaintingInitVars(u8 arg0);
static void VBlankCB_ContestPainting(void);
void sub_8106B90();  //should be static
static void sub_8107090(u8 arg0, u8 arg1);

NAKED
void sub_8106630(u32 arg0)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    ldr r2, _0810665C @ =gSharedMem + 0x15DE0\n\
    subs r4, r2, 0x2\n\
    subs r5, r2, 0x1\n\
    ldr r3, _08106660 @ =gSaveBlock1\n\
    subs r0, 0x1\n\
    lsls r1, r0, 5\n\
    adds r1, r3\n\
    ldr r3, _08106664 @ =0x00002dfc\n\
    adds r1, r3\n\
    ldm r1!, {r3,r6,r7}\n\
    stm r2!, {r3,r6,r7}\n\
    ldm r1!, {r3,r6,r7}\n\
    stm r2!, {r3,r6,r7}\n\
    ldm r1!, {r6,r7}\n\
    stm r2!, {r6,r7}\n\
    strb r0, [r4]\n\
    movs r0, 0\n\
    strb r0, [r5]\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0810665C: .4byte gSharedMem + 0x15DE0\n\
_08106660: .4byte gSaveBlock1\n\
_08106664: .4byte 0x00002dfc\n\
    .syntax divided\n");
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
        gUnknown_03005E8C = &ewram15DE0;
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
        ContestPaintingInitWindow(ewram15DDF);
        gMain.state++;
        break;
    case 3:
        sub_8107090(ewram15DDE, ewram15DDF);
        gMain.state++;
        break;
    case 4:
        ContestPaintingPrintCaption(ewram15DDE, ewram15DDF);
        LoadPalette(gUnknown_083F6140, 0, 1 * 2);
        DmaClear32(3, PLTT, 0x400);
        BeginFastPaletteFade(2);
        SetVBlankCallback(VBlankCB_ContestPainting);
        gUnknown_03000750 = 0;
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
    switch (gUnknown_03000750)
    {
    case 0:
        if (!gPaletteFade.active)
            gUnknown_03000750 = 1;
        if (gUnknown_03000756 != 0 && gUnknown_03000754 != 0)
            gUnknown_03000754--;
        break;
    case 1:
        if ((gMain.newKeys & 1) || (gMain.newKeys & 2))
        {
            u8 two = 2;  //needed to make the asm match

            gUnknown_03000750 = two;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        }
        if (gUnknown_03000756 != 0)
            gUnknown_03000754 = 0;
        break;
    case 2:
        if (!gPaletteFade.active)
            SetMainCallback2(CB2_QuitContestPainting);
        if (gUnknown_03000756 != 0 && gUnknown_03000754 <= 0x1D)
            gUnknown_03000754++;
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
    ptr = gUnknown_03005E40;
    type = gUnknown_03005E8C->contestType;
    if (contestType < 8)
    {
        ptr = StringCopy(ptr, gUnknown_083F60AC[type]);
        ptr = StringCopy(ptr, gContestText_ContestWinner);
#if ENGLISH
        ptr = StringCopy(ptr, gUnknown_03005E8C->trainer_name);
#elif GERMAN
        ptr = StringCopy10(ptr, gUnknown_03005E8C->pokemon_name);
#endif

        // {LATIN}
        ptr[0] = 0xFC;
        ptr[1] = 0x16;
        ptr += 2;

        ptr = StringCopy(ptr, gOtherText_Unknown1);
#if ENGLISH
        ptr = StringCopy10(ptr, gUnknown_03005E8C->pokemon_name);
#elif GERMAN
        ptr = StringCopy(ptr, gUnknown_03005E8C->trainer_name);
#endif

        xPos = 6;
        yPos = 14;
    }
    else
    {
        ptr = StringCopy(ptr, gUnknown_083F60C0[type].prefix);
        ptr = StringCopy10(ptr, gUnknown_03005E8C->pokemon_name);
        ptr = StringCopy(ptr, gUnknown_083F60C0[type].suffix);

        xPos = 3;
        yPos = 14;
    }
    Menu_PrintTextPixelCoords(gUnknown_03005E40, xPos * 8 + 1, yPos * 8, 1);
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
        gUnknown_03000756 = FALSE;
        gUnknown_03000752 = 0;
        gUnknown_03000754 = 0;
    }
    else
    {
        gUnknown_03000756 = TRUE;
        gUnknown_03000752 = 15;
        gUnknown_03000754 = 30;
    }
}

static void ContestPaintingMosaic(void)
{
    if (gUnknown_03000756 == FALSE)
    {
        REG_MOSAIC = 0;
        return;
    }

    REG_BG1CNT = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(10) | BGCNT_MOSAIC | BGCNT_16COLOR | BGCNT_TXT256x256;
    gUnknown_03000752 = gUnknown_03000754 / 2;

    REG_MOSAIC = (gUnknown_03000752 << 12) | (gUnknown_03000752 << 8) | (gUnknown_03000752 << 4) | (gUnknown_03000752 << 0);
}

static void VBlankCB_ContestPainting(void)
{
    ContestPaintingMosaic();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

#ifdef NONMATCHING
static void sub_8106AC4(u16 species, u8 arg1)
{
    void *pal;

    pal = GetMonSpritePalFromOtIdPersonality(species, gUnknown_03005E8C->otId, gUnknown_03005E8C->personality);
    LZDecompressVram(pal, gUnknown_03005E90);

    if (arg1 == 1)
    {
        HandleLoadSpecialPokePic(
            &gMonFrontPicTable[species],
            gMonFrontPicCoords[species].x,
            gMonFrontPicCoords[species].y,
            0x2000000,
            gUnknown_081FAF4C[1],
            species,
            (u32)gUnknown_03005E8C->personality
        );
        sub_8106B90(gUnknown_081FAF4C[1], gUnknown_03005E90, gUnknown_03005E10);
    }
    else
    {
        HandleLoadSpecialPokePic(
            &gMonBackPicTable[species],
            gMonBackPicCoords[species].x,
            gMonBackPicCoords[species].y,
            0x2000000,
            gUnknown_081FAF4C[0],
            species,
            (u32)gUnknown_03005E8C->personality
        );
        sub_8106B90(gUnknown_081FAF4C[0], gUnknown_03005E90, gUnknown_03005E10);
    }
}
#else
NAKED
static void sub_8106AC4(u16 arg0, u8 arg2)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    sub sp, 0xC\n\
    adds r4, r1, 0\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    ldr r7, _08106B28 @ =gUnknown_03005E8C\n\
    ldr r0, [r7]\n\
    ldr r1, [r0, 0x4]\n\
    ldr r2, [r0]\n\
    adds r0, r6, 0\n\
    bl GetMonSpritePalFromOtIdPersonality\n\
    ldr r1, _08106B2C @ =gUnknown_03005E90\n\
    mov r8, r1\n\
    ldr r1, [r1]\n\
    bl LZDecompressVram\n\
    cmp r4, 0\n\
    bne _08106B40\n\
    lsls r0, r6, 3\n\
    ldr r1, _08106B30 @ =gMonFrontPicTable\n\
    adds r0, r1\n\
    ldr r1, _08106B34 @ =gMonFrontPicCoords\n\
    lsls r2, r6, 2\n\
    adds r2, r1\n\
    ldrb r1, [r2]\n\
    ldrb r2, [r2, 0x1]\n\
    movs r3, 0x80\n\
    lsls r3, 18\n\
    ldr r4, _08106B38 @ =gUnknown_081FAF4C\n\
    ldr r5, [r4, 0x4]\n\
    str r5, [sp]\n\
    str r6, [sp, 0x4]\n\
    ldr r4, [r7]\n\
    ldr r4, [r4]\n\
    str r4, [sp, 0x8]\n\
    bl HandleLoadSpecialPokePic\n\
    mov r2, r8\n\
    ldr r1, [r2]\n\
    ldr r0, _08106B3C @ =gUnknown_03005E10\n\
    ldr r2, [r0]\n\
    adds r0, r5, 0\n\
    bl sub_8106B90\n\
    b _08106B74\n\
    .align 2, 0\n\
_08106B28: .4byte gUnknown_03005E8C\n\
_08106B2C: .4byte gUnknown_03005E90\n\
_08106B30: .4byte gMonFrontPicTable\n\
_08106B34: .4byte gMonFrontPicCoords\n\
_08106B38: .4byte gUnknown_081FAF4C\n\
_08106B3C: .4byte gUnknown_03005E10\n\
_08106B40:\n\
    lsls r0, r6, 3\n\
    ldr r1, _08106B80 @ =gMonBackPicTable\n\
    adds r0, r1\n\
    ldr r1, _08106B84 @ =gMonBackPicCoords\n\
    lsls r2, r6, 2\n\
    adds r2, r1\n\
    ldrb r1, [r2]\n\
    ldrb r2, [r2, 0x1]\n\
    movs r3, 0x80\n\
    lsls r3, 18\n\
    ldr r4, _08106B88 @ =gUnknown_081FAF4C\n\
    ldr r5, [r4]\n\
    str r5, [sp]\n\
    str r6, [sp, 0x4]\n\
    ldr r4, [r7]\n\
    ldr r4, [r4]\n\
    str r4, [sp, 0x8]\n\
    bl HandleLoadSpecialPokePic\n\
    mov r0, r8\n\
    ldr r1, [r0]\n\
    ldr r0, _08106B8C @ =gUnknown_03005E10\n\
    ldr r2, [r0]\n\
    adds r0, r5, 0\n\
    bl sub_8106B90\n\
_08106B74:\n\
    add sp, 0xC\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08106B80: .4byte gMonBackPicTable\n\
_08106B84: .4byte gMonBackPicCoords\n\
_08106B88: .4byte gUnknown_081FAF4C\n\
_08106B8C: .4byte gUnknown_03005E10\n\
    .syntax divided\n");
}
#endif

#ifdef NONMATCHING
void sub_8106B90(u8 a[][8][8][4], u16 b[], u16 c[][8][8][8])
{
    u16 i;
    u16 j;
    u16 k;
    u16 l;

    for (i = 0; i < 8; i++)
    {
        for (j = 0; j < 8; j++)
        {
            for (k = 0; k < 8; k++)
            {
                for (l = 0; l < 8; l++)
                {
                    //u8 *arr = a[i][j][k];
                    //u8 r1 = arr[l / 2];
                    u8 r1 = a[i][j][k][l / 2];

                    if (l & 1)
                        r1 /= 16;
                    else
                        r1 %= 16;
                    //_08106BEA
                    if (r1 == 0)
                        c[i][k][j][l] = 0x8000;
                    else
                        c[i][k][j][l] = b[r1];
                }
            }
        }
    }
}
#else
NAKED
void sub_8106B90()
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0xC\n\
    mov r10, r0\n\
    mov r9, r1\n\
    str r2, [sp]\n\
    movs r0, 0\n\
_08106BA4:\n\
    movs r3, 0\n\
    adds r1, r0, 0x1\n\
    str r1, [sp, 0x4]\n\
    lsls r0, 3\n\
    str r0, [sp, 0x8]\n\
_08106BAE:\n\
    movs r1, 0\n\
    adds r2, r3, 0x1\n\
    mov r8, r2\n\
    ldr r7, [sp, 0x8]\n\
    adds r0, r7, r3\n\
    lsls r0, 5\n\
    mov r12, r0\n\
    lsls r4, r3, 3\n\
_08106BBE:\n\
    movs r3, 0\n\
    lsls r0, r1, 2\n\
    adds r6, r1, 0x1\n\
    mov r2, r12\n\
    adds r5, r2, r0\n\
    ldr r7, [sp, 0x8]\n\
    adds r0, r7, r1\n\
    lsls r0, 7\n\
    ldr r1, [sp]\n\
    adds r2, r0, r1\n\
_08106BD2:\n\
    lsrs r0, r3, 1\n\
    adds r0, r5, r0\n\
    add r0, r10\n\
    ldrb r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r3\n\
    cmp r0, 0\n\
    beq _08106BE6\n\
    lsrs r1, 4\n\
    b _08106BEA\n\
_08106BE6:\n\
    movs r0, 0xF\n\
    ands r1, r0\n\
_08106BEA:\n\
    cmp r1, 0\n\
    bne _08106BFC\n\
    adds r0, r4, r3\n\
    lsls r0, 1\n\
    adds r0, r2\n\
    movs r7, 0x80\n\
    lsls r7, 8\n\
    adds r1, r7, 0\n\
    b _08106C08\n\
_08106BFC:\n\
    adds r0, r4, r3\n\
    lsls r0, 1\n\
    adds r0, r2\n\
    lsls r1, 1\n\
    add r1, r9\n\
    ldrh r1, [r1]\n\
_08106C08:\n\
    strh r1, [r0]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    cmp r3, 0x7\n\
    bls _08106BD2\n\
    lsls r0, r6, 16\n\
    lsrs r1, r0, 16\n\
    cmp r1, 0x7\n\
    bls _08106BBE\n\
    mov r1, r8\n\
    lsls r0, r1, 16\n\
    lsrs r3, r0, 16\n\
    cmp r3, 0x7\n\
    bls _08106BAE\n\
    ldr r2, [sp, 0x4]\n\
    lsls r0, r2, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0x7\n\
    bls _08106BA4\n\
    add sp, 0xC\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif

static void sub_8106C40(u8 arg0, u8 arg1)
{
    u8 x, y;

    LoadPalette(gPictureFramePalettes, 0, sizeof(gPictureFramePalettes));
    if (arg1 == 1)
    {
        switch (gUnknown_03005E8C->contestType / 3)
        {
        case CONTEST_COOL:
            RLUnCompVram(gPictureFrameTiles_0, (void *)VRAM);
            RLUnCompWram(gPictureFrameTilemap_0, gUnknown_03005E10);
            break;
        case CONTEST_BEAUTY:
            RLUnCompVram(gPictureFrameTiles_1, (void *)VRAM);
            RLUnCompWram(gPictureFrameTilemap_1, gUnknown_03005E10);
            break;
        case CONTEST_CUTE:
            RLUnCompVram(gPictureFrameTiles_2, (void *)VRAM);
            RLUnCompWram(gPictureFrameTilemap_2, gUnknown_03005E10);
            break;
        case CONTEST_SMART:
            RLUnCompVram(gPictureFrameTiles_3, (void *)VRAM);
            RLUnCompWram(gPictureFrameTilemap_3, gUnknown_03005E10);
            break;
        case CONTEST_TOUGH:
            RLUnCompVram(gPictureFrameTiles_4, (void *)VRAM);
            RLUnCompWram(gPictureFrameTilemap_4, gUnknown_03005E10);
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
                VRAM_PICTURE_DATA(x + 6, y + 2) = (*gUnknown_03005E10)[y + 2][x + 6];
        }

        // Re-set the entire top row to the first top frame part
        for (x = 0; x < 16; x++)
            VRAM_PICTURE_DATA(x + 7, 2) = (*gUnknown_03005E10)[2][7];

#undef VRAM_PICTURE_DATA
    }
    else if (arg0 < 8)
    {
        RLUnCompVram(gPictureFrameTiles_5, (void *)VRAM);
        RLUnCompVram(gPictureFrameTilemap_5, (void *)(VRAM + 0x6000));
    }
    else
    {
        switch (gUnknown_03005E8C->contestType / 3)
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

    gMain.oamBuffer[0] = gOamData_83F6138;
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
        contestType = gUnknown_03005E8C->contestType;
    else
        contestType = gUnknown_03005E8C->contestType / 3;

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
    gUnknown_03005E90 = &ewram15E00.unk2017e00;
    gUnknown_03005E10 = &ewram15E00.unk2015e00;
}

static void sub_8106F6C(u8 arg0)
{
    gUnknown_03005E20.var_4 = gUnknown_03005E10;
    gUnknown_03005E20.var_8 = gUnknown_03005E90;
    gUnknown_03005E20.var_18 = 0;
    gUnknown_03005E20.var_1F = gUnknown_03005E8C->personality % 256;
    gUnknown_03005E20.var_19 = 0;
    gUnknown_03005E20.var_1A = 0;
    gUnknown_03005E20.var_1B = 64;
    gUnknown_03005E20.var_1C = 64;
    gUnknown_03005E20.var_1D = 64;
    gUnknown_03005E20.var_1E = 64;

    switch (arg0)
    {
    case CONTESTRESULT_SMART:
    case CONTESTRESULT_TOUGH:
        gUnknown_03005E20.var_14 = 3;
        break;
    case CONTESTRESULT_COOL:
    case CONTESTRESULT_BEAUTY:
    case CONTESTRESULT_CUTE:
    default:
        gUnknown_03005E20.var_14 = 1;
        break;
    }

    gUnknown_03005E20.var_16 = 2;
    gUnknown_03005E20.var_0 = arg0;
    gUnknown_03005E20.var_10 = 0x6010000;

    sub_80FC7A0(&gUnknown_03005E20);
    sub_80FDA18(&gUnknown_03005E20);
    sub_80FD8CC(&gUnknown_03005E20);

    LoadPalette(gUnknown_03005E90, 256, 256 * 2);
}

static void sub_8107090(u8 arg0, u8 arg1)
{
    sub_8106F4C();
    sub_8106AC4(gUnknown_03005E8C->species, 0);
    sub_8106F6C(sub_8106EE0(arg0));
    sub_8106E98(arg0);
    sub_8106C40(arg0, arg1);
}
