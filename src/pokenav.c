
// Includes
#include "global.h"
#include "ewram.h"
#include "main.h"
#include "palette.h"
#include "decompress.h"
#include "trig.h"
#include "data2.h"
#include "scanline_effect.h"
#include "pokemon_storage_system.h"
#include "text.h"
#include "menu.h"
#include "landmark.h"
#include "strings.h"
#include "string_util.h"
#include "event_data.h"
#include "use_pokeblock.h"
#include "overworld.h"
#include "pokemon_summary_screen.h"
#include "link.h"
#include "sound.h"
#include "battle_setup.h"
#include "constants/songs.h"
#include "constants/flags.h"
#include "constants/game_stat.h"
#include "pokenav.h"

// Static type declarations

// Static RAM declarations

EWRAM_DATA u8 gUnknown_020388B0[4] = {};
EWRAM_DATA u16 gUnknown_020388B4 = 0;

extern const u8 gUnknown_083E0314[];
extern const u16 gUnknown_08E9F9E8[];
extern const u16 gUnknown_083E0274[];
extern const u8 gUnknown_08E9FC64[];
extern const u8 gUnknown_083E0354[];
extern const u8 gUnknown_08E9FD64[];
extern const u8 gUnknown_08E9FE54[];
extern const u8 gUnknown_08E9FD1C[];
extern const u16 gPokenavConditionSearch2_Pal[];
extern const u8 gUnknown_083E0334[];
extern const u16 gUnknown_083E02B4[];
extern const u8 gPokenavConditionSearch2_Gfx[];
extern const u8 gUnknown_083E0254[];
extern const u8 gUnknown_08E9FEB4[];
extern const u8 gUnknown_083E01AC[];
extern const u8 gUnknown_08E9AC4C[];
extern const u8 gPokenavConditionMenu2_Pal[];
extern const u8 gPokenavConditionView_Gfx[];
extern const u8 gUnknown_08E9ABB4[];
extern const u8 gUnknown_08E9AC2C[];
extern const u8 *const gPokenavCityMaps[][2];
extern const u8 gPokenavHoennMapSquares_Pal[];
extern const u8 gPokenavHoennMapSquares_Gfx[];
extern const u16 gUnknown_083E003C[];
extern const u8 *const gUnknown_083E31B0[];
extern const u8 *const gUnknown_083E31CC[];
extern const u8 *const gUnknown_083E31D8[];
extern u8 *gUnknown_083DFEC8;
extern const u8 gUnknown_083DFEEC[];
extern const u8 gUnknown_083E005C[];
extern const u8 gUnknown_083E007C[];
extern const u8 gPokenavOutlineTilemap[];
extern const u8 gPokenavOutlineTiles[];
extern const u8 gPokenavOutlinePalette[];
extern const u8 gUnknown_083DFECC[];
extern const u8 gUnknown_083DFF8C[];
extern const u8 gPokenavHoennMapMisc_Gfx[];
extern const u8 gUnknown_08E99FB0[];
extern const u8 gUnknown_08E9A100[];
extern const u16 gPokenavHoennMap1_Pal[];
extern void (*const gUnknown_083E3270[])(u16, u16);
extern const u8 gUnknown_083E039C[];
extern const u8 gUnknown_083E03A0[];
extern const u8 gUnknown_083E01F4[];
extern const u8 *const gTrainerEyeDescriptions[];
extern const u8 gUnknown_08E9FBA0[];
extern const u8 gPokenavRibbonView_Gfx[];
extern const u8 gUnknown_083E040C[];
extern const u16 gPokenavRibbonView_Pal[];
extern const u16 gUnknown_083E03A8[];
extern const u16 gUnknown_083E3C60[][16];
extern const u16 gPokenavRibbonsIconGfx[][2];
extern const u8 *const gRibbonDescriptions[][2];
extern const u8 *const gGiftRibbonDescriptions[][2];
extern const u8 gUnknown_08E9FF58[];
extern const u8 gPokenavRibbonPokeView_Gfx[];
extern const u16 gUnknown_083E0124[];
extern const u16 gUnknown_083E0144[];
extern const u8 gPokenavMenuOptions_Gfx[];
extern const u8 gPokenavConditionMenu_Gfx[];
extern const u8 gPokenavConditionSearch_Gfx[];
extern const struct SpriteTemplate gSpriteTemplate_83E4454;
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_83E4450[];
extern const u16 gUnknown_083E42F8[];
extern const u16 gPokenavMenuOptions1_Pal[];
extern const u16 gPokenavMenuOptions2_Pal[];
extern const u16 gPokenavConditionMenu_Pal[];
extern const u16 gPokenavCondition6_Pal[];
extern const u16 gPokenavCondition7_Pal[];
extern const struct SpriteSheet gSpriteSheet_PokenavBlueLight;
extern const struct SpritePalette gSpritePalette_PokenavBlueLight;
extern const struct SpriteTemplate gSpriteTemplate_83E4484;
extern const u8 gPokenavMainMenu_Gfx[];
extern const u8 gPokenavConditionMenuHeader_Gfx[];
extern const u8 gPokenavRibbonsHeader_Gfx[];
extern const u8 gPokenavHoennMapHeader_Gfx[];
extern const u8 gPokenavConditionMenuOptions_Gfx[];
extern const u8 gPokenavConditionMenuOptions2_Gfx[];
extern const u8 gPokenavTrainersEyesHeader_Gfx[];
extern const struct SpritePalette gUnknown_083E449C[];
extern const struct SpriteTemplate gSpriteTemplate_83E4530;
extern const struct SpriteTemplate gSpriteTemplate_83E4548;
extern const struct SpriteTemplate gSpriteTemplate_83E44E0;
extern const struct SpriteTemplate gSpriteTemplate_83E44F8;
extern const struct SpriteSheet gUnknown_083E4568;
extern const struct SpriteTemplate gSpriteTemplate_83E4570;
extern const struct SpritePalette gUnknown_083E4588;
extern const struct SpriteSheet gUnknown_083E4590[3];
extern const struct SpritePalette gUnknown_083E45A8;
extern const u16 gUnknown_08E9F988[];
extern const struct SpriteTemplate gSpriteTemplate_83E45B8;
extern const struct SpriteTemplate gSpriteTemplate_83E45F0;
extern const struct SpriteSheet gUnknown_083E4628[4];
extern const struct SpritePalette gUnknown_083E4648[3];
extern const struct SpriteTemplate gSpriteTemplate_83E4660;
extern const u16 gUnknown_083E4678[];
extern const u8 gUnknown_083E3D00[];
extern const struct SpriteTemplate gSpriteTemplate_83E476C;
extern const struct SpriteSheet gUnknown_083E4784;
extern const struct SpritePalette gUnknown_083E478C;
extern const struct SpriteTemplate gSpriteTemplate_83E4800;
extern const s16 gUnknown_083E4794[][2];
extern const u8 gUnknown_083E329C[];
extern const struct SpritePalette gUnknown_083E4818;
extern const struct SpriteTemplate gSpriteTemplate_83E4850;
extern const struct SpritePalette gUnknown_083E4868;
extern const struct SpriteTemplate gSpriteTemplate_83E4878;

// Static ROM declarations

u8 sub_80F5E20(void);
u8 sub_80F5EE4(void);
u8 sub_80F5FB4(void);
u8 sub_80F6010(void);

// .rodata

extern const u8 gUnknown_083E4890[];

// .text

void sub_80EEDE8(void)
{
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
}

void sub_80EEE08(void)
{
    gPokenavStructPtr->unkD160 = 0;
}

void sub_80EEE20(void)
{
    gPokenavStructPtr->unkD160 = 0;
    if (!gPokenavStructPtr->unk6DAC)
    {
        while (sub_80EEE54())
            ;
    }
}

bool8 sub_80EEE54(void)
{
    switch (gPokenavStructPtr->unkD160)
    {
    case 0:
        LZ77UnCompVram(gPokenavHoennMapMisc_Gfx, (void *)VRAM + 0xC000);
        break;
    case 1:
        LZ77UnCompVram(gUnknown_08E99FB0, (void *)VRAM + 0xD800);
        break;
    case 2:
        LoadPalette(gPokenavHoennMap1_Pal, 0x10, 0x20);
        break;
    case 3:
        sub_80EF58C(0);
        sub_80EF58C(1);
        sub_80EF58C(2);
        break;
    case 4:
        gPokenavStructPtr->unk030C = 0;
        REG_BG1HOFS = 0;
        REG_BG1VOFS = 0;
        REG_BG1CNT = 0x1B0C;
        gPokenavStructPtr->unkD160++;
    default:
        return FALSE;
    }
    gPokenavStructPtr->unkD160++;
    return TRUE;
}

bool8 sub_80EEF34(void)
{
    bool8 retVal = TRUE;

    if (gPokenavStructPtr->unk030C == 32)
        return FALSE;

    gPokenavStructPtr->unk030C += 2;
    if (gPokenavStructPtr->unk030C > 31)
    {
        gPokenavStructPtr->unk030C = 32;
        retVal = FALSE;
    }

    REG_BG1VOFS = gPokenavStructPtr->unk030C;
    return retVal;
}

bool8 sub_80EEF78(void)
{
    bool8 retVal = TRUE;

    if (gPokenavStructPtr->unk030C == 0)
        return FALSE;

    gPokenavStructPtr->unk030C -= 2;
    if (gPokenavStructPtr->unk030C <= 0)
    {
        gPokenavStructPtr->unk030C = 0;
        retVal = FALSE;
    }

    REG_BG1VOFS = gPokenavStructPtr->unk030C;
    return retVal;
}

void sub_80EEFBC(u8 a)
{
    u8 var1;

    sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 0, 0, 17, 2);

    switch (a)
    {
    case 0:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 17, 0, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 11:
        sub_809D104((void *)VRAM + 0xD800, 8, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 2:
        var1 = gPokenavStructPtr->unk6DAC;
        if (!var1)
        {
            sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 10, 2, 10, 2);
            sub_809D104((void *)VRAM + 0xD800, 10, 22, gUnknown_08E9A100, var1, 6, 7, 2);
        }
        else
        {
            sub_809D104((void *)VRAM + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        }
        break;
    case 3:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 0, 4, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 4:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 20, 2, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 7:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 10, 4, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 7, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 8:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 20, 4, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 7, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 5:
    case 9:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 0, 2, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 8, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 10:
        sub_809D104((void *)VRAM + 0xD800, 8, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    }
}

void sub_80EF248(u8 a)
{
    gPokenavStructPtr->unkD160 = 0;

    if (!gPokenavStructPtr->unk6DAC)
    {
        while (sub_80EF284(a))
            ;
    }
}

bool8 sub_80EF284(u8 a)
{
    switch (gPokenavStructPtr->unkD160)
    {
    case 0:
        sub_80EEDE8();
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E7224);
        break;
    case 2:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E7224);
        break;
    case 3:
        if (!MultistepInitMenuWindowContinue())
            return TRUE;
        break;
    case 4:
    DmaCopy16Defvars(3, gUnknown_083DFEEC, (void *)VRAM + 0x5000, 0xA0);
        break;
    case 5:
        LZ77UnCompVram(gUnknown_083DFF8C, (void *)VRAM + 0xF800);
        break;
    case 6:
    DmaCopy16Defvars(3, gUnknown_083E005C, (void *)VRAM + 0x8000, 0x20);
        break;
    case 7:
        LZ77UnCompVram(gUnknown_083E007C, (void *)VRAM + 0xE000);
        break;
    case 8:
        LZ77UnCompVram(gPokenavOutlineTilemap, (void *)VRAM + 0xE800);
        break;
    case 9:
        LZ77UnCompVram(gPokenavOutlineTiles, (void *)VRAM + 0x8020);
        break;
    case 10:
        sub_80EF54C(a);
        LoadPalette(gUnknown_083DFECC, 0xF0, 0x20);
        LoadPalette(gPokenavOutlinePalette, 0x40, 0x20);
        sub_80EF7D4();
        break;
    case 11:
        REG_BG0CNT = 0x1F01;
        REG_BG2CNT = 0x1D0A;
        REG_BG3CNT = 0x1C0B;
        REG_BLDCNT = 0;

        gPokenavStructPtr->unkD160++;
        return FALSE;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unkD160++;
    return TRUE;
}

void sub_80EF428(u8 a, u8 b)
{
    u8 *tileBuffer;
    const u8 *pcText = 0;

    switch (a)
    {
    case 0:
        pcText = gUnknown_083E31B0[b];
        break;
    case 1:
        pcText = gUnknown_083E31CC[b];
        break;
    case 2:
        pcText = gUnknown_083E31D8[b];
        break;
    }

    tileBuffer = gUnknown_083DFEC8;
    AlignStringInMenuWindow(&tileBuffer[0x800], pcText, 0xC0, 2);
    Menu_PrintText(&tileBuffer[0x800], 3, 17);
}

void sub_80EF490(u8 a)
{
    u16 var1, var2;

    if (a == 2)
        a = 1;

    gPokenavStructPtr->unkCE4E = a * 30;
    var1 = gPokenavStructPtr->unkCE4C;
    var2 = a * 30;
    if (var1 < var2)
        gPokenavStructPtr->unkCE50 = 2;
    else if (var1 > var2)
        gPokenavStructPtr->unkCE50 = -2;
    else
        gPokenavStructPtr->unkCE50 = 0;
}

bool8 sub_80EF4F8(void)
{
    u16 *palettes;

    if (gPokenavStructPtr->unkCE4C == gPokenavStructPtr->unkCE4E)
    {
        return FALSE;
    }
    else
    {
        gPokenavStructPtr->unkCE4C = gPokenavStructPtr->unkCE50 + gPokenavStructPtr->unkCE4C;

        palettes = gPokenavStructPtr->palettesCE52;
        LoadPalette(&palettes[gPokenavStructPtr->unkCE4C], 0x31, 4);
        return TRUE;
    }

}

void sub_80EF54C(u8 a)
{
    if (a == 2)
        a = 1;

    gPokenavStructPtr->unkCE4C = a * 30;
    LoadPalette(&gPokenavStructPtr->palettesCE52[gPokenavStructPtr->unkCE4C], 0x31, 4);
}

void sub_80EF58C(u8 a)
{
    u16 i;
    u16 * palettes;
    const u16 *var1;

    switch (a)
    {
    case 0:
        for (i = 0; i < 62; i++)
            gPokenavStructPtr->palettesCE52[i] = 0;
        break;
    case 1:
        palettes = gPokenavStructPtr->palettesCE52;
        var1 = gUnknown_083E003C;
        sub_80EF624(&var1[1], &var1[3], 16, 2, palettes);
        break;
    case 2:
        palettes = gPokenavStructPtr->palettesCE8E;
        var1 = gUnknown_083E003C;
        sub_80EF624(&var1[3], &var1[7], 16, 2, palettes);
        break;
    }
}

#define RGB2(r, g, b) (((b) << 10) | ((g) << 5) | (r))

void sub_80EF624(const u16 *a, const u16 *b, u8 c, u8 d, u16 *palettes)
{
    u16 i;
    u16 j;
    u16 * r3;

    for (i = 0; i < d; i++)
    {
        s32 r1 = Q_24_8((((*a) >>  0)) & 0x1F);
        s32 g1 = Q_24_8((((*a) >>  5)) & 0x1F);
        s32 b1 = Q_24_8((((*a) >> 10)) & 0x1F);
        s32 r2 = Q_24_8((((*b) >>  0)) & 0x1F);
        s32 g2 = Q_24_8((((*b) >>  5)) & 0x1F);
        s32 b2 = Q_24_8((((*b) >> 10)) & 0x1F);
        s32 dr = (r2 - r1) / c;
        s32 dg = (g2 - g1) / c;
        s32 db = (b2 - b1) / c;
        u16 rf, gf, bf;

        r3 = palettes;
        for (j = 0; j < c - 1; j++)
        {
            rf = Q_24_8_TO_INT(r1);
            gf = Q_24_8_TO_INT(g1);
            bf = Q_24_8_TO_INT(b1);
            *r3 = RGB2(rf, gf, bf);
            r3 += d;
            r1 += dr;
            g1 += dg;
            b1 += db;
        }
        rf = Q_24_8_TO_INT(r2);
        gf = Q_24_8_TO_INT(g2);
        bf = Q_24_8_TO_INT(b2);
        *r3 = RGB2(rf, gf, bf);
        a++;
        b++;
        palettes++;
    }
}

void sub_80EF740(void)
{
    gPokenavStructPtr->unk6DA0 = (gPokenavStructPtr->unk6DA0 + 1) & 1;
    if (gPokenavStructPtr->unk6DA0)
        gPokenavStructPtr->unk6DA2++;

    REG_BG3HOFS = gPokenavStructPtr->unk6DA2;
}

void sub_80EF780(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0 || (gPokenavStructPtr->unk6DA2 & 0x7) != 0)
    {
        sub_80EF740();
    }
    else
    {
        u16 value = gPokenavStructPtr->unk6DA2 & 0x7;
        gPokenavStructPtr->unk6DA2 = value;
        gPokenavStructPtr->unk6DA0 = value;
        REG_BG3HOFS = value;
    }
}

void sub_80EF7D4(void)
{
    gPokenavStructPtr->unk6DA2 = 0;
    gPokenavStructPtr->unk6DA0 = 0;
    gPokenavStructPtr->taskId6DA4 = CreateTask(sub_80EF780, 80);
}

void sub_80EF814(void)
{
    if (FuncIsActiveTask(sub_80EF780))
        DestroyTask(gPokenavStructPtr->taskId6DA4);
}

void sub_80EF840(void)
{
    gPokenavStructPtr->unkD160 = 0;

    if (gPokenavStructPtr->unk6DAC == 0)
    {
        while (sub_80EF874() != 0)
            ;
    }
}

bool8 sub_80EF874(void)
{
    switch (gPokenavStructPtr->unkD160)
    {
    case 0:
        sub_80EEDE8();
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E7224);
        break;
    case 2:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E7224);
        break;
    case 3:
        if (!MultistepInitMenuWindowContinue())
            return TRUE;
        break;
    case 4:
        Menu_EraseScreen();
        break;
    case 5:
        sub_80FA904(&gPokenavStructPtr->regionMap, gSaveBlock2.regionMapZoom ? TRUE : FALSE);
        break;
    case 6:
        if (sub_80FA940())
            return TRUE;
        break;
    case 7:
        LZ77UnCompVram(gPokenavHoennMapSquares_Gfx, (void *)VRAM + 0x5000);
        break;
    case 8:
        LoadPalette(gPokenavHoennMapSquares_Pal, 0x30, 0x20);
        sub_80EFC3C();
        break;
    case 9:
        if (sub_80EFC64())
            return TRUE;
        break;
    case 10:
        Menu_DrawStdWindowFrame(13, 3, 29, 17);
        sub_80EF9F8();
        break;
    case 11:
        if (!gPokenavStructPtr->regionMap.zoomed)
        {
            gPokenavStructPtr->unk7698 = 160;
            REG_BG0VOFS = 160;
        }
        else
        {
            gPokenavStructPtr->unk7698 = 256;
            REG_BG0VOFS = 0;
        }

        REG_BG0CNT = REG_BG0CNT;
        REG_BG0CNT |= 1;
        REG_BLDCNT = 0;
        break;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unkD160++;
    return TRUE;
}

asm(".include \"constants/gba_constants.inc\"\n");

void sub_80EF9F8(void)
{
    bool8 someBool = FALSE;
    u16 top = 4;
    u16 mapSectionId;
    u8 b;

    switch (gPokenavStructPtr->regionMap.unk16)
    {
    case 0:
        break;
    case 1:
    case 4:
        sub_8072A18(gPokenavStructPtr->regionMap.mapSectionName, 0x70, top * 8, 0x78, 1);
        top += 2;
        if (gLinkOpen == TRUE)
        {
            sub_80F1A80();
            someBool = TRUE;
        }
        else
        {
            u16 i;

            for (i = 0; i < 4; i++)
            {
                const u8 *secName = GetLandmarkName(
                    gPokenavStructPtr->regionMap.mapSectionId,
                    gPokenavStructPtr->regionMap.everGrandeCityArea,
                    i);

                if (secName == NULL)
                    break;
                sub_8072A18(secName, 0x70, top * 8, 0x78, 1);
                top += 2;
            }
        }
        break;
    case 2:
        sub_8072A18(gPokenavStructPtr->regionMap.mapSectionName, 0x70, top * 8, 0x78, 1);
        top += 2;
        mapSectionId = gPokenavStructPtr->regionMap.mapSectionId;
        b = gPokenavStructPtr->regionMap.everGrandeCityArea;
        if (gPokenavStructPtr->unkCDCC[mapSectionId][b] != NULL)
        {
            Menu_BlankWindowRect(14, top, 15, 15);
            Menu_BlankWindowRect(26, top, 28, 15);
            sub_8095C8C((void *)(VRAM + 0xF800), 16, 6, gPokenavStructPtr->unkCDCC[mapSectionId][b], 0, 0, 10, 10, 10);
            top += 11;
        }
        break;
    case 3:
        sub_8072A18(gPokenavStructPtr->regionMap.mapSectionName, 0x70, top * 8, 0x78, 1);
        top += 2;
        break;
    }

    // Epic fail by the compiler at optimizing this.
    if (!someBool && top < 16)
        Menu_BlankWindowRect(14, top, 28, 15);

    if (gPokenavStructPtr->regionMap.unk16 == 2)
        sub_80EFD74();
    else
        sub_80EFDA0();
}

void sub_80EFBB0(void)
{
    if (!gPokenavStructPtr->regionMap.zoomed)
        sub_80EEFBC(8);
    else
        sub_80EEFBC(7);
}

bool8 sub_80EFBDC(bool8 a)
{
    bool8 retVal = TRUE;
    u16 var1 = gPokenavStructPtr->unk7698;

    if (a)
    {
        if (var1 > 168)
        {
            var1 = var1 - 8;
        }
        else
        {
            var1 = 160;
            retVal = FALSE;
        }
    }
    else
    {
        if (var1 < 248)
        {
            var1 = var1 + 8;
        }
        else
        {
            var1 = 256;
            retVal = FALSE;
        }
    }

    gPokenavStructPtr->unk7698 = var1;
    REG_BG0VOFS = var1 & 0xFF;

    return retVal;
}

void sub_80EFC3C(void)
{
    gPokenavStructPtr->unkBC9A = 0;
    gPokenavStructPtr->unkBC9B = 0;
    sub_80EFD3C();
}

bool8 sub_80EFC64(void)
{
    u16 i;
    u8 var1;
    u16 var2;

    if (gPokenavStructPtr->unkBC9A >= 16)
        return FALSE;

    var1 = gPokenavStructPtr->unkBC9A;
    var2 = gPokenavStructPtr->unkBC9B;
    for (i = 0; i < 2; i++)
    {
        if (gPokenavCityMaps[var1][i] != 0)
        {
            LZ77UnCompVram(gPokenavCityMaps[var1][i], gPokenavStructPtr->unkBC9C[var2]);
            gPokenavStructPtr->unkCDCC[var1][i] = gPokenavStructPtr->unkBC9C[var2];
            var2++;
        }
        else
        {
            gPokenavStructPtr->unkCDCC[var1][i] = NULL;
        }
    }

    if (++gPokenavStructPtr->unkBC9A >= 16)
        return FALSE;

    gPokenavStructPtr->unkBC9B = var2;
    return TRUE;
}

void sub_80EFD3C(void)
{
    gPokenavStructPtr->unk769E = 0;
    gPokenavStructPtr->unk769C = 47;
    gPokenavStructPtr->unk769D = 0;
    gPokenavStructPtr->unk769A = 0;
}

void sub_80EFD74(void)
{
    gPokenavStructPtr->unk769E = 1;
    if (gPokenavStructPtr->unk769D == 1)
        gPokenavStructPtr->unk769D = 2;
}

void sub_80EFDA0(void)
{
    sub_8095C8C((void *)VRAM + 0xF800, 14, 16, gUnknown_08E9AC2C, 0, 0, 15, 1, 15);
    gPokenavStructPtr->unk769E = 0;
}

void sub_80EFDE4(u8 param0)
{
    u16 var1 = 60 - gPokenavStructPtr->unk769C;

    if (var1 > 15)
        var1 = 15;

    if (gPokenavStructPtr->unk769E != 0)
    {
        sub_8095C8C((void *)VRAM + 0xF800, 14, 16, gUnknown_08E9ABB4, gPokenavStructPtr->unk769C, 0, var1, 1, 60);

        if (var1 < 15)
        {
            u16 var2 = var1 + 14;

            sub_8095C8C((void *)VRAM + 0xF800, var2, 16, gUnknown_08E9ABB4, 0, 0, (u16)(15 - var1), 1, 60);
        }
    }
}

void sub_80EFE7C(void)
{
    u16 var1;
    u8 var2 = gPokenavStructPtr->unk769D;

    switch (var2)
    {
    case 0:
        var1 = ++gPokenavStructPtr->unk769C;

        if (var1 > 59)
            gPokenavStructPtr->unk769C = var2;

        sub_80EFDE4(gPokenavStructPtr->unk769E);

        switch (gPokenavStructPtr->unk769C)
        {
        case 0:
        case 15:
        case 30:
        case 45:
            gPokenavStructPtr->unk769D = 1;
            gPokenavStructPtr->unk769A = 0;
            break;
        }
        break;
    case 1:
        var1 = ++gPokenavStructPtr->unk769A;
        if (var1 > 120)
        {
            gPokenavStructPtr->unk769A = 0;
            gPokenavStructPtr->unk769D = 0;
        }
        break;
    case 2:
        sub_80EFDE4(1);
        gPokenavStructPtr->unk769D = 1;
        break;
    }
}

void sub_80EFF34(void)
{
    gPokenavStructPtr->unkD160 = 0;

    if (gPokenavStructPtr->unk6DAC == 0)
    {
        while (sub_80EFF68())
            ;
    }
}

bool8 sub_80EFF68(void)
{
    switch (gPokenavStructPtr->unkD160)
    {
    case 0:
        sub_80EEDE8();
        gPokenavStructPtr->unkD162 = 11;
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E7080);
        break;
    case 2:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E7080);
        break;
    case 3:
        if (!MultistepInitMenuWindowContinue())
            return TRUE;
        break;
    case 4:
        Menu_EraseScreen();
        break;
    case 5:
        sub_80F1614();
        break;
    case 6:
        if (sub_80F162C(0))
            return TRUE;
        break;
    case 7:
        LZ77UnCompVram(gPokenavConditionView_Gfx, (void *)VRAM + 0x5000);
        break;
    case 8:
        LZ77UnCompVram(gUnknown_08E9AC4C, (void *)VRAM + 0xF000);
        LoadPalette(gPokenavConditionMenu2_Pal, 0x20, 0x20);
        break;
    case 9:
        if (gPokenavStructPtr->unk76AA == 1)
            sub_8095C8C((void *)VRAM + 0xF000, 0, 5, gUnknown_083E01AC, 0, 0, 9, 4, 9);
        break;
    case 10:
        LZ77UnCompVram(gUnknown_08E9FEB4, (void *)VRAM + 0xB800);
        break;
    case 11:
        LoadPalette(gUnknown_083E0254, 0x30, 0x20);
        LoadPalette(gUnknownPalette_81E6692, 0xB0, 0x20);
        LoadPalette(&gPokenavConditionMenu2_Pal[2], 0xB1, 0x2);
        LoadPalette(&gPokenavConditionMenu2_Pal[16], 0xB5, 0x2);
        LoadPalette(&gPokenavConditionMenu2_Pal[30], 0xBF, 0x2);
        sub_80F01A4();
        break;
    case 12:
        sub_80F01E0(gPokenavStructPtr->unk8fe9);
        break;
    case 13:
        REG_BG3CNT = 0x1E03;
        REG_BG2CNT = 0x1702;
        REG_BLDCNT = 0x844;
        REG_BLDALPHA = 0x40B;
        break;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unkD160++;
    return TRUE;
}

void sub_80F0174(bool8 bg2on)
{
    if (bg2on)
        REG_DISPCNT |= DISPCNT_BG2_ON;
    else
        REG_DISPCNT &= ~DISPCNT_BG2_ON;
}

void sub_80F01A4(void)
{
    REG_WIN0H = WIN_RANGE(0, 240);
    REG_WIN1H = WIN_RANGE(0, 155);
    REG_WIN0V = WIN_RANGE(56, 121);
    REG_WIN1V = WIN_RANGE(56, 121);
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x001B;
}

void sub_80F01E0(u16 a)
{
    Menu_PrintText(gPokenavStructPtr->unk8829[a], 13, 1);

    if (gPokenavStructPtr->unk76AA == 1)
    {
        Menu_PrintText(gPokenavStructPtr->unk88E9[a], 13, 3);
        sub_80F443C(gPokenavStructPtr->unk8788, gPokenavStructPtr->unk893c[gPokenavStructPtr->unk87DC].unk2_5);
        Menu_PrintText(gPokenavStructPtr->unk8788, 1, 6);
    }
}

void sub_80F0264(u8 a)
{
    gPokenavStructPtr->unk306 = 0;
    gPokenavStructPtr->unk87CA = a;

    if (gPokenavStructPtr->unk6DAC == 0)
    {
        while (sub_80F02A0())
            ;
    }
}

bool8 sub_80F02A0(void)
{
    const u16 *pointer;

    switch (gPokenavStructPtr->unk306)
    {
    case 0:
        sub_80EEDE8();

        gPokenavStructPtr->unk87C8 = gPokenavStructPtr->unk87CA == 1;
        gPokenavStructPtr->unkD162 = 11;
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E70D4);
        break;
    case 2:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E70D4);
        break;
    case 3:
        if (!MultistepInitMenuWindowContinue())
        {
            return TRUE;
        }
        break;
    case 4:
        Menu_EraseScreen();
        break;
    case 5:
        LZ77UnCompVram(gUnknown_08E9FC64, (void *)VRAM + 0xE800);
        break;
    case 6:
        LZ77UnCompVram(gPokenavConditionSearch2_Gfx, (void *)VRAM + 0x8000);
        break;
    case 7:
        LoadPalette(gUnknown_083E02B4, 0xB0, 0x20);
        LoadPalette(gUnknown_083E02B4, 0xF0, 0x20);
        LoadPalette(gUnknown_083E0334, 0x40, 0x20);

        if (gPokenavStructPtr->unk87CA == 0)
        {
            LoadPalette(gPokenavConditionSearch2_Pal, 0x30, 0x20);
            gPlttBufferUnfaded[0] = gPokenavConditionSearch2_Pal[5];
            LoadPalette(gUnknownPalette_81E6692, 0xB0, 0x20);
            LoadPalette(&gUnknown_083E02B4[1], 0xB1, 0x2);
            LoadPalette(&gUnknown_083E02B4[8], 0xB5, 0x2);
            LoadPalette(&gPokenavConditionSearch2_Pal[5], 0xBF, 0x2);
        }
        else if (gPokenavStructPtr->unk87CA == 1)
        {
            LoadPalette(gUnknown_083E0274, 0x30, 0x20);
            gPlttBufferUnfaded[0] = gUnknown_083E0274[5];
            LoadPalette(gUnknownPalette_81E6692, 0xB0, 0x20);
            LoadPalette(&gUnknown_083E02B4[1], 0xB1, 0x2);
            LoadPalette(&gUnknown_083E02B4[8], 0xB5, 0x2);
            LoadPalette(&gUnknown_083E0274[5], 0xBF, 0x2);
        }
        else
        {
            LoadPalette(gUnknown_08E9F9E8, 0x30, 0x20);
            gPlttBufferUnfaded[0] = *(pointer = &gUnknown_08E9F9E8[5]);
            LoadPalette(gUnknown_083E0314, 0x50, 0x20);
            LoadPalette(&gUnknown_083E02B4[1], 0xB1, 0x2);
            LoadPalette(&gUnknown_083E02B4[8], 0xB5, 0x2);
            LoadPalette(pointer, 0xBF, 0x2);
            LoadPalette(pointer, 0x5F, 0x2);
        }
        break;
    case 8:
        if (gPokenavStructPtr->unk87CA != 2)
        {
            sub_8095C8C((void *)VRAM + 0xE800, 0, 5, gUnknown_08E9FD1C, 0, 0, 9, 4, 9);
        }
        else
        {
            sub_8095C8C((void *)VRAM + 0xE800, 0, 4, gUnknown_08E9FE54, 0, 0, 12, 10, 12);
            sub_8095C8C((void *)VRAM + 0xE800, 0, 8, gUnknown_08E9FD64, 0, 0, 12, 10, 12);
        }
        break;
    case 9:
        LZ77UnCompVram(gUnknown_083E0354, (void *)VRAM + 0x5000);
        break;
    case 10:
    DmaClear16(3, (void *)VRAM + 0xF800, 0x800);
        break;
    case 11:
        sub_80F0900();
        break;
    case 12:
        if (sub_80F0944())
        {
            return TRUE;
        }
        break;
    case 13:
        if (gPokenavStructPtr->unk87CA != 2)
        {
            ShowMapNamePopUpWindow();
        }
        else
        {
            sub_80F081C(0);
            sub_80F0FFC((u8)gPokenavStructPtr->unk876E);
        }
        break;
    case 14:
        REG_BG2CNT = 0x1D0A;
        REG_BG3CNT = 0x1E03;
        REG_BG0CNT = 0x1F01;
        REG_BG3VOFS = 0xF8;

        gPokenavStructPtr->unk8776 = 0xF8;
        gPokenavStructPtr->unk8778 = 0;

        REG_BLDCNT = 0;
        gPokenavStructPtr->unkD160++;
        return FALSE;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unk306++;
    return TRUE;
}

void sub_80F063C(s16 arg0)
{
    s16 var0;
    s16 var1;
    s16 var2;

    gPokenavStructPtr->unk877C = arg0 * 16;
    gPokenavStructPtr->unk877A = (arg0 == 1 || arg0 == -1) ? 4 : 8;
    if (arg0 < 0)
    {
        gPokenavStructPtr->unk877A *= -1;
        var0 = arg0 * 2 + gPokenavStructPtr->unk8778;
        var1 = arg0 + gPokenavStructPtr->unk8770;
        if (var1 < 0)
            var1 += gPokenavStructPtr->unk8774 + 1;

        arg0 *= -1;
    }
    else
    {
        var0 = gPokenavStructPtr->unk8778 + 16;
        var1 = gPokenavStructPtr->unk8772 + 1;
    }

    if (var1 > gPokenavStructPtr->unk8774)
        var1 = 0;

    var2 = var0 & 0x1F;
    sub_80F0954(var1, var2, arg0);
}

bool8 sub_80F0718(void)
{
    if (!sub_80F098C())
    {
        if (gPokenavStructPtr->unk877C == 0)
            return FALSE;

        gPokenavStructPtr->unk877C -= gPokenavStructPtr->unk877A;
        gPokenavStructPtr->unk8776 += gPokenavStructPtr->unk877A;
        gPokenavStructPtr->unk8776 &= 0xFF;
        REG_BG3VOFS = gPokenavStructPtr->unk8776;
        if (gPokenavStructPtr->unk877C == 0)
        {
            gPokenavStructPtr->unk8778 = ((8 + gPokenavStructPtr->unk8776) & 0xFF) / 8;
            return FALSE;
        }
    }

    return TRUE;
}

void ShowMapNamePopUpWindow(void)
{
    switch (gPokenavStructPtr->unk87CA)
    {
    case 0:
        sub_80F443C(gPokenavStructPtr->unk8788, gPokenavStructPtr->unk893c[gPokenavStructPtr->unk876E].unk2_5);
        break;
    case 1:
        sub_80F445C(gPokenavStructPtr->unk8788, gPokenavStructPtr->unk876E + 1);
        break;
    default:
        return;
    }

    BasicInitMenuWindow(&gWindowTemplate_81E710C);
    Menu_PrintText(gPokenavStructPtr->unk8788, 1, 6);
}

void sub_80F081C(u8 arg0)
{
    u32 numTrainerBattles;

    BasicInitMenuWindow(&gWindowTemplate_81E710C);
    switch (arg0)
    {
    case 0:
    case 1:
        MenuPrint_RightAligned(gOtherText_NumberRegistered, 10, 9);
        if (arg0 != 0)
            break;
        // fall through
    case 2:
        ConvertIntToDecimalStringN(
            gPokenavStructPtr->unk8788,
            gPokenavStructPtr->unk8774 + 1,
            STR_CONV_MODE_RIGHT_ALIGN,
            5);
        MenuPrint_RightAligned(gPokenavStructPtr->unk8788, 10, 11);
        if (arg0 != 0)
            break;
        // fall through
    case 3:
        MenuPrint_RightAligned(gOtherText_NumberBattles, 10, 13);
        if (arg0 != 0)
            break;
        // fall through
    case 4:
        numTrainerBattles = GetGameStat(GAME_STAT_TRAINER_BATTLES);
        if (numTrainerBattles > 99999)
            numTrainerBattles = 99999;

        ConvertIntToDecimalStringN(
            gPokenavStructPtr->unk8788,
            numTrainerBattles,
            STR_CONV_MODE_RIGHT_ALIGN,
            5);
        MenuPrint_RightAligned(gPokenavStructPtr->unk8788, 10, 15);
        break;
    }
}

void sub_80F08E4(void)
{
    BasicInitMenuWindow(&gWindowTemplate_81E710C);
    Menu_EraseWindowRect(0, 9, 11, 16);
}

void sub_80F0900(void)
{
    s16 var0 = (gPokenavStructPtr->unk8772 - gPokenavStructPtr->unk8770) + 1;
    if (var0 < 8)
        Menu_EraseWindowRect(12, 1, 31, 15);

    sub_80F0954(gPokenavStructPtr->unk8770, 0, var0);
}

bool8 sub_80F0944(void)
{
    return sub_80F098C();
}

void sub_80F0954(u16 arg0, u16 arg1, u16 arg2)
{
    gPokenavStructPtr->unk877E = arg0;
    gPokenavStructPtr->unk8780 = arg1;
    gPokenavStructPtr->unk8784 = arg2;
    gPokenavStructPtr->unk8786 = 0;
}

#ifdef NONMATCHING
bool8 sub_80F098C(void)
{
    register u16 zero asm("r8");
    if (!gPokenavStructPtr->unk8784)
    {
        DONE:
        return FALSE;
    }

    zero = 0;
    gUnknown_083E3270[gPokenavStructPtr->unk87CA](gPokenavStructPtr->unk877E, gPokenavStructPtr->unk8780);
    if (!--gPokenavStructPtr->unk8784)
        goto DONE;

    if ((++gPokenavStructPtr->unk877E & 0xFFFF) > gPokenavStructPtr->unk8774)
        gPokenavStructPtr->unk877E = zero;

    gPokenavStructPtr->unk8780 += 2;
    gPokenavStructPtr->unk8780 &= 0x1F;
    return TRUE;
}
#else
NAKED
bool8 sub_80F098C(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    ldr r0, _080F09A4 @ =gPokenavStructPtr\n\
    ldr r6, [r0]\n\
    ldr r0, _080F09A8 @ =0x00008784\n\
    adds r7, r6, r0\n\
    ldrh r0, [r7]\n\
    cmp r0, 0\n\
    bne _080F09AC\n\
_080F09A0:\n\
    movs r0, 0\n\
    b _080F0A02\n\
    .align 2, 0\n\
_080F09A4: .4byte gPokenavStructPtr\n\
_080F09A8: .4byte 0x00008784\n\
_080F09AC:\n\
    movs r1, 0\n\
    mov r8, r1\n\
    ldr r1, _080F0A0C @ =gUnknown_083E3270\n\
    ldr r2, _080F0A10 @ =0x000087ca\n\
    adds r0, r6, r2\n\
    ldrb r2, [r0]\n\
    lsls r2, 2\n\
    adds r2, r1\n\
    ldr r0, _080F0A14 @ =0x0000877e\n\
    adds r4, r6, r0\n\
    ldrh r0, [r4]\n\
    ldr r1, _080F0A18 @ =0x00008780\n\
    adds r5, r6, r1\n\
    ldrh r1, [r5]\n\
    ldr r2, [r2]\n\
    bl _call_via_r2\n\
    ldrh r0, [r7]\n\
    subs r0, 0x1\n\
    strh r0, [r7]\n\
    ldr r2, _080F0A1C @ =0x0000ffff\n\
    adds r1, r2, 0\n\
    lsls r0, 16\n\
    cmp r0, 0\n\
    beq _080F09A0\n\
    ldrh r0, [r4]\n\
    adds r0, 0x1\n\
    strh r0, [r4]\n\
    ands r0, r1\n\
    ldr r2, _080F0A20 @ =0x00008774\n\
    adds r1, r6, r2\n\
    movs r2, 0\n\
    ldrsh r1, [r1, r2]\n\
    cmp r0, r1\n\
    ble _080F09F6\n\
    mov r0, r8\n\
    strh r0, [r4]\n\
_080F09F6:\n\
    ldrh r0, [r5]\n\
    adds r0, 0x2\n\
    movs r1, 0x1F\n\
    ands r0, r1\n\
    strh r0, [r5]\n\
    movs r0, 0x1\n\
_080F0A02:\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080F0A0C: .4byte gUnknown_083E3270\n\
_080F0A10: .4byte 0x000087ca\n\
_080F0A14: .4byte 0x0000877e\n\
_080F0A18: .4byte 0x00008780\n\
_080F0A1C: .4byte 0x0000ffff\n\
_080F0A20: .4byte 0x00008774\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80F0A24(u16 arg0, u16 arg1)
{
    u8 var0 = gPokenavStructPtr->unk87C8 == 0 ? 2 : 1;
    sub_80F4428(gPokenavStructPtr->unk8788, arg0, var0);
    BasicInitMenuWindow(&gWindowTemplate_81E70D4);
    Menu_PrintText(gPokenavStructPtr->unk8788, 13, arg1);
}

void sub_80F0A74(u16 arg0, u16 arg1)
{
    sub_80F700C(gPokenavStructPtr->unk8788, arg0);
    arg1 &= 0x1F;
    BasicInitMenuWindow(&gWindowTemplate_81E70D4);
    Menu_PrintTextPixelCoords(gPokenavStructPtr->unk8788, 97, arg1 * 8, 0);
    if (arg0 < gPokenavStructPtr->unkD158 && gPokenavStructPtr->trainersEye[arg0].rematchNo != 0)
        sub_8095C8C((void *)VRAM + 0xF000, 29, arg1, gUnknown_083E039C, 0, 0, 1, 2, 1);
    else
        sub_8095C8C((void *)VRAM + 0xF000, 29, arg1, gUnknown_083E03A0, 0, 0, 1, 2, 1);
}

void sub_80F0B24(void)
{
    gPokenavStructPtr->unkD15C = 0;
    gPokenavStructPtr->unk306 = 0;
}

bool8 sub_80F0B44(void)
{
    int top;
    if (gPokenavStructPtr->unkD15C > 8)
    {
        return FALSE;
    }

    if (++gPokenavStructPtr->unk306 > 1)
    {
        gPokenavStructPtr->unk306 = 0;
        if (gPokenavStructPtr->unkD15C < 8)
        {
            top = (gPokenavStructPtr->unk8778 + (gPokenavStructPtr->unkD15C * 2)) & 0x1F;
            if (gPokenavStructPtr->unkD15C != gPokenavStructPtr->unk876C)
            {
                BasicInitMenuWindow(&gWindowTemplate_81E70D4);
                Menu_EraseWindowRect(12, top, 31, top + 1);
            }

            if (!gPokenavStructPtr->unkD15C)
                sub_80F08E4();

            gPokenavStructPtr->unkD15C++;
            return TRUE;
        }
        else
        {
            u16 i;
            BasicInitMenuWindow(&gWindowTemplate_81E70D4);
            top = (gPokenavStructPtr->unk8778 + 16) & 0x1F;
            for (i = 0; i < 8; i++)
            {
                Menu_EraseWindowRect(12, top, 31, top + 1);
                top = (top + 2) & 0x1F;
            }

            gPokenavStructPtr->unkD15C++;
            return FALSE;
        }
    }
    else
    {
        return TRUE;
    }
}

void sub_80F0C28(void)
{
    gPokenavStructPtr->unkD15C = 0;
    gPokenavStructPtr->unk306 = 0;
}

bool8 sub_80F0C48(void)
{
    if (gPokenavStructPtr->unkD15C > 7)
        return FALSE;

    if (++gPokenavStructPtr->unk306 > 1)
    {
        gPokenavStructPtr->unk306 = 0;
        BasicInitMenuWindow(&gWindowTemplate_81E70D4);
        sub_80F0A74(gPokenavStructPtr->unk8770 + gPokenavStructPtr->unkD15C,
                    gPokenavStructPtr->unk8778 + gPokenavStructPtr->unkD15C * 2);

        if ((++gPokenavStructPtr->unkD15C) > 7)
        {
            sub_80F081C(0);
            return FALSE;
        }
    }

    return TRUE;
}

void LoadTrainerEyesDescriptionLines(void)
{
    u16 i;
    int trainerEyesId;
    const u8 *curChar;

    gPokenavStructPtr->unk306 = 0;
    gPokenavStructPtr->unkD15C = 0;
    trainerEyesId = gPokenavStructPtr->trainersEye[gPokenavStructPtr->unk876E].rematchTableIdx;
    gPokenavStructPtr->trainerEyeDescriptionLines[0] = gTrainerEyeDescriptions[trainerEyesId];

    // Find the start of the 3 other lines in the Trainer's Eyes description.
    curChar = gPokenavStructPtr->trainerEyeDescriptionLines[0];
    for (i = 0; i < 3; i++)
    {
        while (*curChar != EOS)
            curChar++;
        gPokenavStructPtr->trainerEyeDescriptionLines[i + 1] = ++curChar;
    }
}

#ifdef NONMATCHING
// small register mismatch (r2/r3) on the line where var0 is set.
bool8 sub_80F0D5C(void)
{
    int var0;
    if (gPokenavStructPtr->unkD15C == 7)
        return FALSE;

    if (++gPokenavStructPtr->unk306 > 1)
    {
        gPokenavStructPtr->unk306 = 0;
        BasicInitMenuWindow(&gWindowTemplate_81E70D4);
        var0 = (gPokenavStructPtr->unk8778 + 2 + gPokenavStructPtr->unkD15C * 2) & 0x1F;
        switch (gPokenavStructPtr->unkD15C)
        {
        case 0:
            Menu_PrintTextPixelCoords(gOtherText_Strategy, 97, var0 * 8, 0);
            break;
        case 1:
            AlignStringInMenuWindow(
                gPokenavStructPtr->unk8788,
                gPokenavStructPtr->trainerEyeDescriptionLines[0],
                136,
                0);
            Menu_PrintTextPixelCoords(gPokenavStructPtr->unk8788, 97, var0 * 8, 0);
            break;
        case 2:
            Menu_PrintTextPixelCoords(gOtherText_TrainersPokemon, 97, var0 * 8, 0);
            break;
        case 3:
            AlignStringInMenuWindow(
                gPokenavStructPtr->unk8788,
                gPokenavStructPtr->trainerEyeDescriptionLines[1],
                136,
                0);
            Menu_PrintTextPixelCoords(gPokenavStructPtr->unk8788, 97, var0 * 8, 0);
            break;
        case 4:
            Menu_PrintTextPixelCoords(gOtherText_SelfIntroduction, 97, var0 * 8, 0);
            break;
        case 5:
            AlignStringInMenuWindow(
                gPokenavStructPtr->unk8788,
                gPokenavStructPtr->trainerEyeDescriptionLines[2],
                136,
                0);
            Menu_PrintTextPixelCoords(gPokenavStructPtr->unk8788, 97, var0 * 8, 0);
            break;
        case 6:
            AlignStringInMenuWindow(
                gPokenavStructPtr->unk8788,
                gPokenavStructPtr->trainerEyeDescriptionLines[3],
                136,
                0);
            Menu_PrintTextPixelCoords(gPokenavStructPtr->unk8788, 97, var0 * 8, 0);
        default:
            return FALSE;
        }

        gPokenavStructPtr->unkD15C++;
        return TRUE;
    }
    else
    {
        return TRUE;
    }
}
#else
NAKED
bool8 sub_80F0D5C(void)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    ldr r0, _080F0D70 @ =gPokenavStructPtr\n\
    ldr r4, [r0]\n\
    ldr r0, _080F0D74 @ =0x0000d15c\n\
    adds r5, r4, r0\n\
    ldrh r0, [r5]\n\
    cmp r0, 0x7\n\
    bne _080F0D78\n\
_080F0D6C:\n\
    movs r0, 0\n\
    b _080F0EB0\n\
    .align 2, 0\n\
_080F0D70: .4byte gPokenavStructPtr\n\
_080F0D74: .4byte 0x0000d15c\n\
_080F0D78:\n\
    ldr r0, _080F0DB8 @ =0x00000306\n\
    adds r1, r4, r0\n\
    ldrh r0, [r1]\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0x1\n\
    bhi _080F0D8C\n\
    b _080F0EAE\n\
_080F0D8C:\n\
    movs r0, 0\n\
    strh r0, [r1]\n\
    ldr r0, _080F0DBC @ =gWindowTemplate_81E70D4\n\
    bl BasicInitMenuWindow\n\
    ldr r0, _080F0DC0 @ =0x00008778\n\
    adds r1, r4, r0\n\
    ldrh r3, [r5]\n\
    lsls r0, r3, 1\n\
    adds r0, 0x2\n\
    ldrh r1, [r1]\n\
    adds r5, r0, r1\n\
    movs r0, 0x1F\n\
    ands r5, r0\n\
    cmp r3, 0x6\n\
    bhi _080F0D6C\n\
    lsls r0, r3, 2\n\
    ldr r1, _080F0DC4 @ =_080F0DC8\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_080F0DB8: .4byte 0x00000306\n\
_080F0DBC: .4byte gWindowTemplate_81E70D4\n\
_080F0DC0: .4byte 0x00008778\n\
_080F0DC4: .4byte _080F0DC8\n\
    .align 2, 0\n\
_080F0DC8:\n\
    .4byte _080F0DE4\n\
    .4byte _080F0DF0\n\
    .4byte _080F0E08\n\
    .4byte _080F0E14\n\
    .4byte _080F0E2C\n\
    .4byte _080F0E38\n\
    .4byte _080F0E6C\n\
_080F0DE4:\n\
    ldr r0, _080F0DEC @ =gOtherText_Strategy\n\
    lsls r2, r5, 3\n\
    b _080F0E54\n\
    .align 2, 0\n\
_080F0DEC: .4byte gOtherText_Strategy\n\
_080F0DF0:\n\
    ldr r0, _080F0DFC @ =gPokenavStructPtr\n\
    ldr r0, [r0]\n\
    ldr r1, _080F0E00 @ =0x00008788\n\
    adds r4, r0, r1\n\
    ldr r1, _080F0E04 @ =0x0000d110\n\
    b _080F0E42\n\
    .align 2, 0\n\
_080F0DFC: .4byte gPokenavStructPtr\n\
_080F0E00: .4byte 0x00008788\n\
_080F0E04: .4byte 0x0000d110\n\
_080F0E08:\n\
    ldr r0, _080F0E10 @ =gOtherText_TrainersPokemon\n\
    lsls r2, r5, 3\n\
    b _080F0E54\n\
    .align 2, 0\n\
_080F0E10: .4byte gOtherText_TrainersPokemon\n\
_080F0E14:\n\
    ldr r0, _080F0E20 @ =gPokenavStructPtr\n\
    ldr r0, [r0]\n\
    ldr r1, _080F0E24 @ =0x00008788\n\
    adds r4, r0, r1\n\
    ldr r1, _080F0E28 @ =0x0000d114\n\
    b _080F0E42\n\
    .align 2, 0\n\
_080F0E20: .4byte gPokenavStructPtr\n\
_080F0E24: .4byte 0x00008788\n\
_080F0E28: .4byte 0x0000d114\n\
_080F0E2C:\n\
    ldr r0, _080F0E34 @ =gOtherText_SelfIntroduction\n\
    lsls r2, r5, 3\n\
    b _080F0E54\n\
    .align 2, 0\n\
_080F0E34: .4byte gOtherText_SelfIntroduction\n\
_080F0E38:\n\
    ldr r0, _080F0E60 @ =gPokenavStructPtr\n\
    ldr r0, [r0]\n\
    ldr r1, _080F0E64 @ =0x00008788\n\
    adds r4, r0, r1\n\
    ldr r1, _080F0E68 @ =0x0000d118\n\
_080F0E42:\n\
    adds r0, r1\n\
    ldr r1, [r0]\n\
    adds r0, r4, 0\n\
    movs r2, 0x88\n\
    movs r3, 0\n\
    bl AlignStringInMenuWindow\n\
    lsls r2, r5, 3\n\
    adds r0, r4, 0\n\
_080F0E54:\n\
    movs r1, 0x61\n\
    movs r3, 0\n\
    bl Menu_PrintTextPixelCoords\n\
    b _080F0EA0\n\
    .align 2, 0\n\
_080F0E60: .4byte gPokenavStructPtr\n\
_080F0E64: .4byte 0x00008788\n\
_080F0E68: .4byte 0x0000d118\n\
_080F0E6C:\n\
    ldr r0, _080F0E94 @ =gPokenavStructPtr\n\
    ldr r0, [r0]\n\
    ldr r1, _080F0E98 @ =0x00008788\n\
    adds r4, r0, r1\n\
    ldr r1, _080F0E9C @ =0x0000d11c\n\
    adds r0, r1\n\
    ldr r1, [r0]\n\
    adds r0, r4, 0\n\
    movs r2, 0x88\n\
    movs r3, 0\n\
    bl AlignStringInMenuWindow\n\
    lsls r2, r5, 3\n\
    adds r0, r4, 0\n\
    movs r1, 0x61\n\
    movs r3, 0\n\
    bl Menu_PrintTextPixelCoords\n\
    b _080F0D6C\n\
    .align 2, 0\n\
_080F0E94: .4byte gPokenavStructPtr\n\
_080F0E98: .4byte 0x00008788\n\
_080F0E9C: .4byte 0x0000d11c\n\
_080F0EA0:\n\
    ldr r0, _080F0EB8 @ =gPokenavStructPtr\n\
    ldr r1, [r0]\n\
    ldr r0, _080F0EBC @ =0x0000d15c\n\
    adds r1, r0\n\
    ldrh r0, [r1]\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
_080F0EAE:\n\
    movs r0, 0x1\n\
_080F0EB0:\n\
    pop {r4,r5}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080F0EB8: .4byte gPokenavStructPtr\n\
_080F0EBC: .4byte 0x0000d15c\n\
    .syntax divided\n");
}
#endif

void sub_80F0EC0(void)
{
    gPokenavStructPtr->unk306 = 0;
    gPokenavStructPtr->unkD15C = 0;
    StringFill(gPokenavStructPtr->unk8788, CHAR_SPACE, 16);
}

bool8 sub_80F0EF4(void)
{
    int top;
    if (gPokenavStructPtr->unkD15C > 6)
        return FALSE;

    if (++gPokenavStructPtr->unk306 > 1)
    {
        gPokenavStructPtr->unk306 = 0;
        top = (gPokenavStructPtr->unk8778 + 2 + gPokenavStructPtr->unkD15C * 2) & 0x1F;
        BasicInitMenuWindow(&gWindowTemplate_81E70D4);
        Menu_EraseWindowRect(12, top, 31, top + 1);
        gPokenavStructPtr->unkD15C++;
    }

    return TRUE;
}

void sub_80F0F64(void)
{
    s16 var0 = gPokenavStructPtr->unk876C;
    gPokenavStructPtr->unk877C = var0 * 16;
    gPokenavStructPtr->unk877A = var0 == 1 ? 4 : 8;
}

void sub_80F0FA0(void)
{
    s16 var0 = gPokenavStructPtr->unk876C * -1;
    gPokenavStructPtr->unk877C = var0 * 16;
    gPokenavStructPtr->unk877A = var0 == -1 ? -4 : -8;
}

bool8 sub_80F0FEC(void)
{
    return sub_80F0718();
}

void sub_80F0FFC(u8 arg0)
{
    GetMapSectionName(gPokenavStructPtr->unk8788, gPokenavStructPtr->trainersEye[arg0].regionMapSectionId, 0);
    BasicInitMenuWindow(&gWindowTemplate_81E710C);
    sub_80F19DC(gPokenavStructPtr->unk8788);
    AlignStringInMenuWindow(gPokenavStructPtr->unkD138, gPokenavStructPtr->unk8788, 88, 2);
    Menu_PrintText(gPokenavStructPtr->unkD138, 0, 5);
}

void sub_80F105C(void)
{
    sub_80F0A74(gPokenavStructPtr->unk876E, gPokenavStructPtr->unk8778);
}

bool8 sub_80F1080(void)
{
    switch (gPokenavStructPtr->unkD160)
    {
    case 0:
        sub_80EEDE8();
        gPokenavStructPtr->unkD162 = 11;
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E70B8);
        break;
    case 2:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E70B8);
        break;
    case 3:
        if (!MultistepInitMenuWindowContinue())
            return TRUE;
        break;
    case 4:
        Menu_EraseScreen();
        break;
    case 5:
        sub_80F1614();
        break;
    case 6:
        if (sub_80F162C(1))
            return TRUE;
        break;
    case 7:
        LZ77UnCompWram(gUnknown_08E9FBA0, gPokenavStructPtr->unk934C);
        break;
    case 8:
        DrawMonRibbonIcons();
        break;
    case 9:
        sub_80F13FC();
        break;
    case 10:
        LZ77UnCompVram(gPokenavRibbonView_Gfx, (void *)(VRAM + 0x8000));
        break;
    case 11:
        LZ77UnCompVram(gUnknown_083E040C, (void *)(VRAM + 0x8200));
        break;
    case 12:
        LoadPalette(gPokenavRibbonView_Pal, 0x20, 0x20);
        LoadPalette(gUnknown_083E03A8, 0xF0, 0x20);
        LoadPalette(gUnknown_083E3C60[0], 0x30, 0xA0);
        LoadPalette(gUnknownPalette_81E6692, 0xB0, 0x20);
        LoadPalette(gUnknown_083E03A8 + 0xF, 0xBF, 0x2);
        break;
    case 13:
        sub_80F1438();
        break;
    case 14:
        REG_BG2CNT = 0x1E02;
        REG_BG3CNT = 0x170B;
        REG_BLDCNT = 0;
        gPokenavStructPtr->unkD160++;
        return FALSE;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unkD160++;
    return TRUE;
}

void DrawMonRibbonIcons(void)
{
    u16 i;
    u16 offset;
    u8 index, palette, tile;
    u8 var0;

    offset = 0x8B;
    var0 = gPokenavStructPtr->unkBC8E - gPokenavStructPtr->unkBC8F;

    for (i = 0; i < 8; i++)
    CpuFill16(0x2000, &gPokenavStructPtr->unk934C[offset + i * 32], 0x24);

    for (i = 0; i < var0; i++)
    {
        index = gPokenavStructPtr->unkBC4C[i];
        palette = gPokenavRibbonsIconGfx[index][1] + 3;
        tile = gPokenavRibbonsIconGfx[index][0] * 2 + 0x10;
        gPokenavStructPtr->unk934C[offset] = (palette << 12) | tile;
        gPokenavStructPtr->unk934C[offset + 1] = ((palette << 12) | 0x400) | tile;
        gPokenavStructPtr->unk934C[offset + 0x20] = (palette << 12) | (tile + 1);
        gPokenavStructPtr->unk934C[offset + 0x21] = (palette << 12) | 0x400 | (tile + 1);

        if ((i + 1) % 9 == 0)
            offset += 0x30;
        else
            offset += 2;
    }

    offset = 0x14B;
    for (i = 0; i < gPokenavStructPtr->unkBC8F; i++)
    {
        index = gPokenavStructPtr->unkBC4C[var0 + i];
        palette = gPokenavRibbonsIconGfx[index][1] + 3;
        tile = gPokenavRibbonsIconGfx[index][0] * 2 + 0x10;
        gPokenavStructPtr->unk934C[offset] = (palette << 12) | tile;
        gPokenavStructPtr->unk934C[offset + 1] = ((palette << 12) | 0x400) | tile;
        gPokenavStructPtr->unk934C[offset + 0x20] = (palette << 12) | (tile + 1);
        gPokenavStructPtr->unk934C[offset + 0x21] = (palette << 12) | 0x400 | (tile + 1);

        offset += 2;
    }
}

void sub_80F13FC(void)
{
    u16 *src = gPokenavStructPtr->unk934C;
    u16 *dest = (u16 *)(VRAM + 0xB800);
    DmaCopy32(3, src, dest, 0x500);
    gPlttBufferUnfaded[0] = *(gPokenavRibbonView_Pal + 14);
}

void sub_80F1438(void)
{
    Menu_PrintText(gPokenavStructPtr->unk8829[0], 13, 1);
    sub_80F445C(gPokenavStructPtr->unk8788, gPokenavStructPtr->unk876E + 1);
    Menu_PrintText(gPokenavStructPtr->unk8788, 1, 5);
}

void sub_80F1480(void)
{
    Menu_EraseWindowRect(12, 13, 27, 16);
}

// This is a fakematching function, due to a hardcoded access of gSaveBlock1.
// Due to this hardcoded address access, gift ribbons do not properly display
// their descriptions, since the hardcoded access is inside of the LinkBattleRecords
// save data, rather than the giftRibbons array, which is almost certainly what the
// intended access is.
void sub_80F1494(void)
{
    u8 *arr;
    u8 *tileBuffer1 = &gUnknown_083DFEC8[0x800];
    u8 *tileBuffer2 = &gUnknown_083DFEC8[0xA98];

    if (gPokenavStructPtr->unkBC91 < 3)
    {
        gUnknown_020388B4 = gPokenavStructPtr->unkBC91 * 9 + gPokenavStructPtr->unkBC90;
        gUnknown_020388B4 = gPokenavStructPtr->unkBC4C[gUnknown_020388B4];
        AlignStringInMenuWindow(tileBuffer1, gRibbonDescriptions[gUnknown_020388B4][0], 128, 0);
        AlignStringInMenuWindow(tileBuffer2, gRibbonDescriptions[gUnknown_020388B4][1], 128, 0);
    }
    else
    {
        gUnknown_020388B4 = gPokenavStructPtr->unkBC8E - gPokenavStructPtr->unkBC8F;
        gUnknown_020388B4 = gPokenavStructPtr->unkBC4C[gUnknown_020388B4 + gPokenavStructPtr->unkBC90];

        // FIXME!
        arr = ((u8*)&gSaveBlock1);
        asm("ldrh r1, [r5]\n\
            add r0, r0, r1");
        gUnknown_020388B4 = arr[0x30F7];
        // The bug fix for this code is the following:
        // gUnknown_020388B4 = gSaveBlock1.giftRibbons[gUnknown_020388B4];
        if (gUnknown_020388B4)
        {
            gUnknown_020388B4--;
            AlignStringInMenuWindow(tileBuffer1, gGiftRibbonDescriptions[gUnknown_020388B4][0], 128, 0);
            AlignStringInMenuWindow(tileBuffer2, gGiftRibbonDescriptions[gUnknown_020388B4][1], 128, 0);
        }
        else
        {
            AlignStringInMenuWindow(tileBuffer1, gEmptyString_81E72B0, 128, 0);
            AlignStringInMenuWindow(tileBuffer2, gEmptyString_81E72B0, 128, 0);
        }
    }

    Menu_PrintText(tileBuffer1, 12, 13);
    Menu_PrintText(tileBuffer2, 12, 15);
}

void sub_80F15A8(void)
{
    u8 *buffer;
    Menu_EraseWindowRect(12, 13, 27, 16);
    buffer = StringCopy(gPokenavStructPtr->unk8788, gOtherText_Ribbons);
    buffer[0] = CHAR_SPACE;
    buffer++;
    buffer = ConvertIntToDecimalStringN(
        buffer,
        gPokenavStructPtr->unk893c[gPokenavStructPtr->unk87DC].unk0,
        STR_CONV_MODE_LEFT_ALIGN,
        2);
    buffer[0] = EOS;
    Menu_PrintText(gPokenavStructPtr->unk8788, 12, 13);
}

void sub_80F1614(void)
{
    gPokenavStructPtr->unk8764 = 0;
}

bool8 sub_80F162C(u8 arg0)
{
    switch (gPokenavStructPtr->unk8764)
    {
    case 0:
        break;
    case 1:
        LZ77UnCompVram(gUnknown_08E9FF58, (void *)(VRAM + 0xE800));
        break;
    case 2:
    DmaCopy16Defvars(3, gPokenavRibbonPokeView_Gfx, (void *)(VRAM + 0xE000), 0xE0);
        break;
    case 3:
        if (!arg0)
            LoadPalette(gUnknown_083E0124, 0xD0, 0x20);
        else
            LoadPalette(gUnknown_083E0144, 0xD0, 0x20);

        gPokenavStructPtr->unk8766 = -80;
        REG_BG0CNT = 0x1D0D;
        gPokenavStructPtr->unk8764++;
        return FALSE;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unk8764++;
    return TRUE;
}

bool8 sub_80F170C(void)
{
    gPokenavStructPtr->unk8766 += 0x10;
    if (gPokenavStructPtr->unk8766 > 0)
        gPokenavStructPtr->unk8766 = 0;

    return gPokenavStructPtr->unk8766 != 0;
}

bool8 sub_80F173C(void)
{
    gPokenavStructPtr->unk8766 -= 0x10;
    if (gPokenavStructPtr->unk8766 < -0x50)
        gPokenavStructPtr->unk8766 = -0x50;

    return gPokenavStructPtr->unk8766 != -0x50;
}

bool8 sub_80F1778(void)
{
    switch (gPokenavStructPtr->unkD160)
    {
    case 0:
        sub_80EEDE8();
        gPokenavStructPtr->unkD162 = 2;
        break;
    case 1:
        sub_80F1614();
        break;
    case 2:
        if (sub_80F162C(0))
            return TRUE;
        break;
    case 3:
        LZ77UnCompVram(gPokenavConditionView_Gfx, (void *)(VRAM + 0x5000));
        break;
    case 4:
        LZ77UnCompVram(gUnknown_08E9AC4C, (void *)(VRAM + 0xF000));
        LoadPalette(gPokenavConditionMenu2_Pal, 0x20, 0x20);
        break;
    case 5:
        sub_8095C8C((void *)VRAM + 0xF000, 0, 13, gUnknown_083E01F4, 0, 0, 12, 4, 12);
        break;
    case 6:
        LZ77UnCompVram(gUnknown_08E9FEB4, (void *)(VRAM + 0xB800));
        break;
    case 7:
        LoadPalette(gUnknown_083E0254, 0x30, 0x20);
        LoadPalette(gUnknownPalette_81E6692, 0xB0, 0x20);
        LoadPalette(&gPokenavConditionMenu2_Pal[2], 0xB1, 0x2);
        LoadPalette(&gPokenavConditionMenu2_Pal[16], 0xB5, 0x2);
        LoadPalette(&gPokenavConditionMenu2_Pal[30], 0xBF, 0x2);
        sub_80F01A4();
        break;
    case 8:
        sub_80F01E0(gPokenavStructPtr->unk8fe9);
        break;
    case 9:
        REG_BG3CNT = 0x1E03;
        REG_BG2CNT = 0x1702;
        REG_BLDCNT = 0x844;
        REG_BLDALPHA = 0x40B;
        break;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unkD160++;
    return TRUE;
}

void sub_80F1934(void)
{
    u8 *buffer = gPokenavStructPtr->unk8788;
    if (gPokenavStructPtr->unk893c[gPokenavStructPtr->unk87DC].unk3_14)
    {
        u8 nature = GetNature(&gPlayerParty[sub_8137124(gPokenavStructPtr->unk87DC)]);
        buffer = StringCopy(buffer, gOtherText_Nature2);
        AlignStringInMenuWindow(buffer, gNatureNames[nature], 87, 0);
    }
    else
    {
        AlignStringInMenuWindow(buffer, gEmptyString_81E72B0, 87, 0);
    }

    Menu_PrintTextPixelCoords(gPokenavStructPtr->unk8788, 1, 112, 1);
}

void sub_80F19DC(u8 *text)
{
    while (text[0] != EOS)
    {
        if (text[0] == EXT_CTRL_CODE_BEGIN && text[1] == CHAR_SPACE)
        {
            text[0] = EOS;
            break;
        }

        text++;
    }
}

void sub_80F19FC(void)
{
    // FIXME r4/r5 swapped
    register u8 *ptr asm("r5") = gUnknown_020388B0;
    if (ptr[0] == 1)
    {
        const u8 *landmarkName = GetLandmarkName(
            gPokenavStructPtr->regionMap.mapSectionId,
            gPokenavStructPtr->regionMap.everGrandeCityArea,
            ptr[1]);

        if (landmarkName)
        {
            sub_8072A18(landmarkName, 0x70, 4 * (ptr[1] * 4 + 12), 0x78, 1);
            if (++ptr[1] != 4)
                return;
        }

        Menu_BlankWindowRect(14, ptr[1] * 2 + 6, 28, 15);
        ptr[0] = 0;
    }
}

void sub_80F1A74(void)
{
    gUnknown_020388B0[0] = 0;
}

void sub_80F1A80(void)
{
    gUnknown_020388B0[0] = 1;
    gUnknown_020388B0[1] = 0;
}

void sub_80F1A90(void)
{
    gPokenavStructPtr->unk306 = 0;
    if (gPokenavStructPtr->unk6DAC == 0)
        while (sub_80F1AC4());
}

bool8 sub_80F1AC4(void)
{
    u16 i, j;

    switch (gPokenavStructPtr->unk306)
    {
    case 0:
        for (i = 0; i < 6; i++)
        {
            for (j = 0; j < 4; j++)
                gPokenavStructPtr->unk320[i][j] = NULL;
        }

        gPokenavStructPtr->unk311 = 0;
        break;
    case 1:
        LZ77UnCompWram(gPokenavMenuOptions_Gfx, gPokenavStructPtr->unk388);
        break;
    case 2:
        LZ77UnCompWram(gPokenavConditionMenu_Gfx, gPokenavStructPtr->unk1788);
        break;
    case 3:
        LZ77UnCompWram(gPokenavConditionSearch_Gfx, gPokenavStructPtr->unk2388);
        return FALSE;
    }

    gPokenavStructPtr->unk306++;
    return TRUE;
}

void sub_80F1B8C(u8 arg0)
{
    gPokenavStructPtr->unk306 = 0;
    if (gPokenavStructPtr->unk6DAC == 0)
        while (sub_80F1BC8(arg0));
}

#ifdef NONMATCHING
// very close, but for some reason, (i + 1) is being stored in sp[0x10]
bool8 sub_80F1BC8(u8 arg0)
{
    u16 i, j;
    u16 animNum;
    u16 topOffset;
    u16 height;
    u16 middle;
    u8 spriteId;

    switch (gPokenavStructPtr->unk306)
    {
    case 0:
        sub_80F2458(arg0);
        break;
    case 1:
        sub_80F2514(arg0);
        break;
    case 2:
        switch (arg0)
        {
        case 0:
            topOffset = 42;
            height = 20;
            gPokenavStructPtr->unk30E = 5;
            break;
        case 1:
            topOffset = 56;
            height = 20;
            gPokenavStructPtr->unk30E = 3;
            break;
        case 2:
            topOffset = 40;
            height = 16;
            gPokenavStructPtr->unk30E = 6;
            break;
        default:
            return FALSE;
        }

        animNum = 0;
        for (i = 0; i < gPokenavStructPtr->unk30E; i++)
        {
            middle = (height * i) + topOffset - 8;
            gPokenavStructPtr->unk314[i] = (middle << 8) | (middle + 0x11);
            if (!arg0)
            {
                if (gPokenavStructPtr->unk6DB2[i] == 0)
                {
                    for (j = 0; j < 4; j++)
                        gPokenavStructPtr->unk320[i][j] = NULL;
                    continue;
                }
                else
                {
                    animNum = (gPokenavStructPtr->unk6DB2[i] - 1) * 4;
                }
            }

            for (j = 0; j < 4; j++)
            {
                spriteId = CreateSprite(&gSpriteTemplate_83E4454, j * 32 + 256, (height * i) + topOffset, 0);
                if (spriteId != MAX_SPRITES)
                {
                    gPokenavStructPtr->unk320[i][j] = &gSprites[spriteId];
                    gPokenavStructPtr->unk320[i][j]->data[0] = i;
                    gPokenavStructPtr->unk320[i][j]->data[1] = j;
                    gPokenavStructPtr->unk320[i][j]->data[2] = j * 32 + 152;
                    gPokenavStructPtr->unk320[i][j]->data[3] = j * 32 + 256;
                    StartSpriteAnim(gPokenavStructPtr->unk320[i][j], animNum++);

                    if ((arg0 == 2 || arg0 == 0) && i > 2)
                        gPokenavStructPtr->unk320[i][j]->oam.paletteNum = IndexOfSpritePaletteTag(0x1);
                }
            }
        }
        break;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unk306++;
    return TRUE;
}
#else
NAKED
bool8 sub_80F1BC8(u8 arg0)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0xC\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r9, r0\n\
    ldr r1, _080F1BF4 @ =gPokenavStructPtr\n\
    ldr r2, [r1]\n\
    ldr r3, _080F1BF8 @ =0x00000306\n\
    adds r0, r2, r3\n\
    ldrh r0, [r0]\n\
    adds r3, r1, 0\n\
    cmp r0, 0x1\n\
    beq _080F1C0A\n\
    cmp r0, 0x1\n\
    bgt _080F1BFC\n\
    cmp r0, 0\n\
    beq _080F1C02\n\
    b _080F1DC4\n\
    .align 2, 0\n\
_080F1BF4: .4byte gPokenavStructPtr\n\
_080F1BF8: .4byte 0x00000306\n\
_080F1BFC:\n\
    cmp r0, 0x2\n\
    beq _080F1C12\n\
    b _080F1DC4\n\
_080F1C02:\n\
    mov r0, r9\n\
    bl sub_80F2458\n\
    b _080F1DC8\n\
_080F1C0A:\n\
    mov r0, r9\n\
    bl sub_80F2514\n\
    b _080F1DC8\n\
_080F1C12:\n\
    mov r4, r9\n\
    cmp r4, 0x1\n\
    beq _080F1C40\n\
    cmp r4, 0x1\n\
    bgt _080F1C22\n\
    cmp r4, 0\n\
    beq _080F1C2A\n\
    b _080F1DC4\n\
_080F1C22:\n\
    mov r5, r9\n\
    cmp r5, 0x2\n\
    beq _080F1C54\n\
    b _080F1DC4\n\
_080F1C2A:\n\
    movs r0, 0x2A\n\
    str r0, [sp, 0x4]\n\
    movs r1, 0x14\n\
    str r1, [sp, 0x8]\n\
    ldr r4, _080F1C3C @ =0x0000030e\n\
    adds r1, r2, r4\n\
    movs r0, 0x5\n\
    b _080F1C62\n\
    .align 2, 0\n\
_080F1C3C: .4byte 0x0000030e\n\
_080F1C40:\n\
    movs r5, 0x38\n\
    str r5, [sp, 0x4]\n\
    movs r0, 0x14\n\
    str r0, [sp, 0x8]\n\
    ldr r4, _080F1C50 @ =0x0000030e\n\
    adds r1, r2, r4\n\
    movs r0, 0x3\n\
    b _080F1C62\n\
    .align 2, 0\n\
_080F1C50: .4byte 0x0000030e\n\
_080F1C54:\n\
    movs r5, 0x28\n\
    str r5, [sp, 0x4]\n\
    movs r0, 0x10\n\
    str r0, [sp, 0x8]\n\
    ldr r4, _080F1CDC @ =0x0000030e\n\
    adds r1, r2, r4\n\
    movs r0, 0x6\n\
_080F1C62:\n\
    strb r0, [r1]\n\
    movs r5, 0\n\
    str r5, [sp]\n\
    mov r8, r5\n\
    adds r1, r3, 0\n\
    ldr r0, [r1]\n\
    ldr r2, _080F1CDC @ =0x0000030e\n\
    adds r0, r2\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    cmp r8, r0\n\
    blt _080F1C7E\n\
    b _080F1DC8\n\
_080F1C7E:\n\
    ldr r4, [sp, 0x8]\n\
    mov r3, r8\n\
    muls r3, r4\n\
    ldr r5, [sp, 0x4]\n\
    adds r0, r5, r3\n\
    subs r0, 0x8\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    ldr r4, [r1]\n\
    mov r2, r8\n\
    lsls r1, r2, 1\n\
    movs r5, 0xC5\n\
    lsls r5, 2\n\
    adds r2, r4, r5\n\
    adds r2, r1\n\
    lsls r1, r0, 8\n\
    adds r0, 0x11\n\
    orrs r1, r0\n\
    strh r1, [r2]\n\
    mov r0, r9\n\
    cmp r0, 0\n\
    bne _080F1CF2\n\
    ldr r1, _080F1CE0 @ =0x00006db2\n\
    adds r0, r4, r1\n\
    mov r2, r8\n\
    adds r1, r0, r2\n\
    ldrb r0, [r1]\n\
    cmp r0, 0\n\
    bne _080F1CE8\n\
    movs r5, 0\n\
    ldr r0, _080F1CE4 @ =gPokenavStructPtr\n\
    ldr r0, [r0]\n\
    lsls r2, 4\n\
    movs r3, 0xC8\n\
    lsls r3, 2\n\
    adds r1, r0, r3\n\
    movs r3, 0\n\
_080F1CC8:\n\
    lsls r0, r5, 2\n\
    adds r0, r2\n\
    adds r0, r1, r0\n\
    str r3, [r0]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    cmp r5, 0x3\n\
    bls _080F1CC8\n\
    b _080F1D92\n\
    .align 2, 0\n\
_080F1CDC: .4byte 0x0000030e\n\
_080F1CE0: .4byte 0x00006db2\n\
_080F1CE4: .4byte gPokenavStructPtr\n\
_080F1CE8:\n\
    ldrb r0, [r1]\n\
    subs r0, 0x1\n\
    lsls r0, 18\n\
    lsrs r0, 16\n\
    str r0, [sp]\n\
_080F1CF2:\n\
    movs r5, 0\n\
    ldr r4, [sp, 0x4]\n\
    adds r0, r4, r3\n\
    lsls r0, 16\n\
    mov r10, r0\n\
_080F1CFC:\n\
    lsls r6, r5, 5\n\
    movs r0, 0x80\n\
    lsls r0, 1\n\
    adds r7, r6, r0\n\
    lsls r1, r7, 16\n\
    asrs r1, 16\n\
    ldr r0, _080F1DB4 @ =gSpriteTemplate_83E4454\n\
    mov r3, r10\n\
    asrs r2, r3, 16\n\
    movs r3, 0\n\
    bl CreateSprite\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0x40\n\
    beq _080F1DC4\n\
    ldr r0, _080F1DB8 @ =gPokenavStructPtr\n\
    ldr r2, [r0]\n\
    lsls r1, r5, 2\n\
    mov r4, r8\n\
    lsls r0, r4, 4\n\
    adds r1, r0\n\
    movs r0, 0xC8\n\
    lsls r0, 2\n\
    adds r2, r0\n\
    adds r4, r2, r1\n\
    lsls r0, r3, 4\n\
    adds r0, r3\n\
    lsls r0, 2\n\
    ldr r1, _080F1DBC @ =gSprites\n\
    adds r0, r1\n\
    str r0, [r4]\n\
    mov r1, r8\n\
    strh r1, [r0, 0x2E]\n\
    ldr r0, [r4]\n\
    strh r5, [r0, 0x30]\n\
    ldr r1, [r4]\n\
    adds r0, r6, 0\n\
    adds r0, 0x98\n\
    strh r0, [r1, 0x32]\n\
    ldr r0, [r4]\n\
    strh r7, [r0, 0x34]\n\
    ldr r0, [r4]\n\
    ldr r1, [sp]\n\
    adds r2, r1, 0x1\n\
    lsls r2, 16\n\
    lsrs r2, 16\n\
    str r2, [sp]\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    bl StartSpriteAnim\n\
    mov r2, r9\n\
    cmp r2, 0x2\n\
    beq _080F1D6E\n\
    cmp r2, 0\n\
    bne _080F1D88\n\
_080F1D6E:\n\
    mov r3, r8\n\
    cmp r3, 0x2\n\
    bls _080F1D88\n\
    movs r0, 0x1\n\
    bl IndexOfSpritePaletteTag\n\
    ldr r3, [r4]\n\
    lsls r0, 4\n\
    ldrb r2, [r3, 0x5]\n\
    movs r1, 0xF\n\
    ands r1, r2\n\
    orrs r1, r0\n\
    strb r1, [r3, 0x5]\n\
_080F1D88:\n\
    adds r0, r5, 0x1\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    cmp r5, 0x3\n\
    bls _080F1CFC\n\
_080F1D92:\n\
    mov r0, r8\n\
    adds r0, 0x1\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
    ldr r1, _080F1DB8 @ =gPokenavStructPtr\n\
    ldr r0, [r1]\n\
    ldr r4, _080F1DC0 @ =0x0000030e\n\
    adds r0, r4\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    cmp r8, r0\n\
    bge _080F1DB0\n\
    b _080F1C7E\n\
_080F1DB0:\n\
    b _080F1DC8\n\
    .align 2, 0\n\
_080F1DB4: .4byte gSpriteTemplate_83E4454\n\
_080F1DB8: .4byte gPokenavStructPtr\n\
_080F1DBC: .4byte gSprites\n\
_080F1DC0: .4byte 0x0000030e\n\
_080F1DC4:\n\
    movs r0, 0\n\
    b _080F1DD8\n\
_080F1DC8:\n\
    ldr r0, _080F1DE8 @ =gPokenavStructPtr\n\
    ldr r1, [r0]\n\
    ldr r5, _080F1DEC @ =0x00000306\n\
    adds r1, r5\n\
    ldrh r0, [r1]\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
    movs r0, 0x1\n\
_080F1DD8:\n\
    add sp, 0xC\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080F1DE8: .4byte gPokenavStructPtr\n\
_080F1DEC: .4byte 0x00000306\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80F1DF0(void)
{
    u16 i, j;
    for (i = 0; i < gPokenavStructPtr->unk30E; i++)
    {
        for (j = 0; j < 4; j++)
        {
            if (gPokenavStructPtr->unk320[i][j])
                gPokenavStructPtr->unk320[i][j]->callback = sub_80F2218;
        }
    }

    PlaySE(SE_WIN_OPEN);
}

bool8 sub_80F1E50(void)
{
    if (sub_80F22F8())
    {
        sub_80F2108();
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

bool8 sub_80F1E6C(void)
{
    return !sub_80F22F8();
}

void sub_80F1E84(void)
{
    u16 i, j;

    gPokenavStructPtr->unk30F = 0;
    sub_80F2148();
    for (i = 0; i < gPokenavStructPtr->unk30E; i++)
    {
        if (i != gPokenavStructPtr->unk6DAD)
        {
            for (j = 0; j < 4; j++)
            {
                if (gPokenavStructPtr->unk320[i][j])
                    gPokenavStructPtr->unk320[i][j]->callback = sub_80F2240;
            }
        }
    }
}

bool8 sub_80F1F10(void)
{
    u16 j;

    switch (gPokenavStructPtr->unk30F)
    {
    case 0:
        if (sub_80F2360())
        {
            for (j = 0; j < 4; j++)
            {
                struct Sprite *sprite = gPokenavStructPtr->unk320[gPokenavStructPtr->unk6DAD][j];
                sprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
                sprite->affineAnims = gSpriteAffineAnimTable_83E4450;
                InitSpriteAffineAnim(sprite);
                sprite->data[4] = j * 4 - 6;
                sprite->data[4] /= 2;
                sprite->data[5] = sprite->data[4] * 8;
                sprite->callback = sub_80F2240;
            }

            sub_80F2170();
            gPokenavStructPtr->unk30F++;
        }
        break;
    case 1:
        if (sub_80F23C8())
        {
            sub_80F21F8();
            FreeSpriteTilesByTag(0x0);
            FreeSpritePaletteByTag(0x0);
            FreeSpritePaletteByTag(0x1);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

void sub_80F1FF0(void)
{
    if (gPokenavStructPtr->unk311 == 1)
    {
        REG_WIN0V = gPokenavStructPtr->unk314[gPokenavStructPtr->unk6DAD];
        REG_BLDY = gSineTable[gPokenavStructPtr->unk312] >> 5;
        gPokenavStructPtr->unk312 += 3;
        gPokenavStructPtr->unk312 &= 0x7F;
    }
    else if (gPokenavStructPtr->unk311 == 2)
    {
        REG_BLDALPHA = gUnknown_083E42F8[gPokenavStructPtr->unk312];
        if (gPokenavStructPtr->unk312 < 15)
            gPokenavStructPtr->unk312++;
    }
}

void sub_80F208C(void)
{
    sub_80F2148();
}

void sub_80F2098(void)
{
    REG_WIN0H = 0x77F0;
    REG_WIN0V = gPokenavStructPtr->unk314[gPokenavStructPtr->unk6DAD];
    REG_WININ = 0x3F;
    REG_WINOUT = 0x1F;
    REG_DISPCNT |= DISPCNT_WIN0_ON;
}

void sub_80F20F4(void)
{
    REG_DISPCNT &= ~DISPCNT_WIN0_ON;
}

void sub_80F2108(void)
{
    if (!gPokenavStructPtr->unk311)
    {
        gPokenavStructPtr->unk311 = 1;
        gPokenavStructPtr->unk312 = 0;
        REG_BLDCNT = 0x90;
        REG_BLDY = 0;
        sub_80F2098();
    }
}

void sub_80F2148(void)
{
    gPokenavStructPtr->unk311 = 0;
    REG_BLDCNT = 0;
    sub_80F20F4();
}

void sub_80F2170(void)
{
    u16 j;

    if (!gPokenavStructPtr->unk311)
    {
        sub_80F20F4();
        for (j = 0; j < 4; j++)
        {
            struct Sprite *sprite = gPokenavStructPtr->unk320[gPokenavStructPtr->unk6DAD][j];
            sprite->oam.objMode = ST_OAM_OBJ_BLEND;
        }

        gPokenavStructPtr->unk311 = 2;
        gPokenavStructPtr->unk312 = 0;
        REG_BLDCNT = 0x3F40;
        REG_BLDALPHA = 0x10;
    }
}

void sub_80F21F8()
{
    gPokenavStructPtr->unk311 = 0;
    REG_BLDCNT = 0;
}

void sub_80F2218(struct Sprite *sprite)
{
    sprite->x -= 8;
    if (sprite->x <= sprite->data[2])
    {
        sprite->x = sprite->data[2];
        sprite->callback = sub_80F22B0;
    }
}

void sub_80F2240(struct Sprite *sprite)
{
    if (sprite->data[0] == gPokenavStructPtr->unk6DAD)
    {
        if (sprite->data[5])
        {
            sprite->x += sprite->data[4];
            sprite->data[5] -= sprite->data[4];
        }

        if (sprite->affineAnimEnded)
            sub_80F240C(sprite);
    }
    else
    {
        sprite->x += 8;
        if (sprite->x >= sprite->data[3])
            sub_80F240C(sprite);
    }
}

void sub_80F22B0(struct Sprite *sprite)
{
    if (sprite->data[0] == gPokenavStructPtr->unk6DAD)
    {
        if (sprite->x2 > -16)
            sprite->x2 -= 4;
    }
    else
    {
        if (sprite->x2 < 0)
            sprite->x2 += 4;
    }
}

bool8 sub_80F22F8(void)
{
    u16 i, j;

    for (i = 0; i < gPokenavStructPtr->unk6DAE; i++)
    {
        for (j = 0; j < 4; j++)
        {
            struct Sprite *sprite = gPokenavStructPtr->unk320[i][j];
            if (!sprite)
                return TRUE;

            if (sprite->x2 != 0 && sprite->x2 != -16)
                return FALSE;
        }
    }

    return TRUE;
}

bool8 sub_80F2360(void)
{
    u16 i, j;

    for (i = 0; i < gPokenavStructPtr->unk30E; i++)
    {
        if (i != gPokenavStructPtr->unk6DAD)
        {
            for (j = 0; j < 4; j++)
            {
                struct Sprite *sprite = gPokenavStructPtr->unk320[i][j];
                if (sprite)
                    return FALSE;
            }
        }
    }

    return TRUE;
}

bool8 sub_80F23C8(void)
{
    u16 j;

    for (j = 0; j < 4; j++)
    {
        struct Sprite *sprite = gPokenavStructPtr->unk320[gPokenavStructPtr->unk6DAD][j];
        if (sprite)
            return FALSE;
    }

    return TRUE;
}

void sub_80F240C(struct Sprite *sprite)
{
    gPokenavStructPtr->unk320[sprite->data[0]][sprite->data[1]] = NULL;
    if (sprite->affineAnimEnded)
        FreeOamMatrix(sprite->oam.matrixNum);

    DestroySprite(sprite);
}

void sub_80F2458(u8 arg0)
{
    switch (arg0)
    {
    case 0:
        gPokenavStructPtr->unk380.data = gPokenavStructPtr->unk388;
        gPokenavStructPtr->unk380.size = sizeof(gPokenavStructPtr->unk388);
        gPokenavStructPtr->unk380.tag = 0x0;
        break;
    case 1:
        gPokenavStructPtr->unk380.data = gPokenavStructPtr->unk1788;
        gPokenavStructPtr->unk380.size = sizeof(gPokenavStructPtr->unk1788);
        gPokenavStructPtr->unk380.tag = 0x0;
        break;
    case 2:
        gPokenavStructPtr->unk380.data = gPokenavStructPtr->unk2388;
        gPokenavStructPtr->unk380.size = sizeof(gPokenavStructPtr->unk2388);
        gPokenavStructPtr->unk380.tag = 0x0;
        break;
    default:
        return;
    }

    LoadSpriteSheet(&gPokenavStructPtr->unk380);
}

void sub_80F2514(u8 arg0)
{
    struct SpritePalette spritePalette;

    switch (arg0)
    {
    case 0:
        spritePalette.data = gPokenavMenuOptions1_Pal;
        spritePalette.tag = 0;
        LoadSpritePalette(&spritePalette);
        spritePalette.data = gPokenavMenuOptions2_Pal;
        spritePalette.tag = 0x1;
        break;
    case 1:
        spritePalette.data = gPokenavConditionMenu_Pal;
        spritePalette.tag = 0x0;
        break;
    case 2:
        spritePalette.data = gPokenavCondition6_Pal;
        spritePalette.tag = 0;
        LoadSpritePalette(&spritePalette);
        spritePalette.data = gPokenavCondition7_Pal;
        spritePalette.tag = 0x1;
        break;
    default:
        return;
    }

    LoadSpritePalette(&spritePalette);
}

void sub_80F2598(void)
{
    u8 spriteId;

    gPokenavStructPtr->unk6D9C = NULL;
    if (DoesSomeoneWantRematchIn(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum) == TRUE)
    {
        LoadSpriteSheet(&gSpriteSheet_PokenavBlueLight);
        LoadSpritePalette(&gSpritePalette_PokenavBlueLight);
        spriteId = CreateSprite(&gSpriteTemplate_83E4484, 12, 96, 0);
        if (spriteId != MAX_SPRITES)
        {
            gPokenavStructPtr->unk6D9C = &gSprites[spriteId];
        }
        else
        {
            FreeSpriteTilesByTag(0x19);
            FreeSpritePaletteByTag(0x11);
        }
    }
}

void sub_80F2620(void)
{
    if (gPokenavStructPtr->unk6D9C)
    {
        DestroySprite(gPokenavStructPtr->unk6D9C);
        FreeSpriteTilesByTag(0x19);
        FreeSpritePaletteByTag(0x11);
        gPokenavStructPtr->unk6D9C = NULL;
    }
}

void sub_80F2654(struct Sprite *sprite)
{
    if (++sprite->data[0] > 6)
    {
        sprite->data[0] = 0;
        sprite->invisible = !sprite->invisible;
    }
}

void sub_80F2688(void)
{
    gPokenavStructPtr->unk306 = 0;
    if (!gPokenavStructPtr->unk6DAC)
        while(sub_80F26BC());
}

bool8 sub_80F26BC(void)
{
    switch (gPokenavStructPtr->unk306)
    {
    case 0:
        LZ77UnCompWram(gPokenavMainMenu_Gfx, gPokenavStructPtr->unk3B98);
        break;
    case 1:
        LZ77UnCompWram(gPokenavConditionMenuHeader_Gfx, gPokenavStructPtr->unk4198);
        break;
    case 2:
        LZ77UnCompWram(gPokenavRibbonsHeader_Gfx, gPokenavStructPtr->unk4D98);
        break;
    case 3:
        LZ77UnCompWram(gPokenavHoennMapHeader_Gfx, gPokenavStructPtr->unk5398);
        break;
    case 4:
        LZ77UnCompWram(gPokenavConditionMenuOptions_Gfx, gPokenavStructPtr->unk5F98);
        break;
    case 5:
        LZ77UnCompWram(gPokenavConditionMenuOptions2_Gfx, gPokenavStructPtr->unk6798);
        break;
    case 6:
        LZ77UnCompWram(gPokenavTrainersEyesHeader_Gfx, gPokenavStructPtr->unk4798);
        break;
    case 7:
        LoadSpritePalettes(gUnknown_083E449C);
        break;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unk306++;
    return TRUE;
}

void sub_80F27DC(u8 arg0)
{
    struct SpriteSheet spriteSheet;

    switch (arg0)
    {
    case 0:
        spriteSheet.data = gPokenavStructPtr->unk3B98;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk3B98);
        spriteSheet.tag = 0x1;
        break;
    case 1:
        spriteSheet.data = gPokenavStructPtr->unk4198;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk4198);
        spriteSheet.tag = 0x1;
        break;
    case 3:
        spriteSheet.data = gPokenavStructPtr->unk4798;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk4798);
        spriteSheet.tag = 0x1;
        break;
    case 2:
        spriteSheet.data = gPokenavStructPtr->unk4D98;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk4D98);
        spriteSheet.tag = 0x1;
        break;
    case 4:
        spriteSheet.data = gPokenavStructPtr->unk5398;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk5398);
        spriteSheet.tag = 0x1;
        break;
    case 5:
        spriteSheet.data = gPokenavStructPtr->unk5F98;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk5F98);
        spriteSheet.tag = 0x2;
        break;
    case 6:
        spriteSheet.data = gPokenavStructPtr->unk6198;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk6198);
        spriteSheet.tag = 0x2;
        break;
    case 8:
        spriteSheet.data = gPokenavStructPtr->unk6398;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk6398);
        spriteSheet.tag = 0x2;
        break;
    case 9:
        spriteSheet.data = gPokenavStructPtr->unk6598;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk6598);
        spriteSheet.tag = 0x2;
        break;
    case 11:
        spriteSheet.data = gPokenavStructPtr->unk6998;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk6998);
        spriteSheet.tag = 0x2;
        break;
    case 10:
        spriteSheet.data = gPokenavStructPtr->unk6798;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk6798);
        spriteSheet.tag = 0x2;
        break;
    case 7:
        spriteSheet.data = gPokenavStructPtr->unk6B98;
        spriteSheet.size = sizeof(gPokenavStructPtr->unk6B98);
        spriteSheet.tag = 0x2;
        break;
    default:
        return;
    }

    LoadSpriteSheet(&spriteSheet);
}

void sub_80F29B8(u8 arg0)
{
    u16 i;
    s16 deltaX, endX, initialX;
    u16 y;
    s16 width;
    struct Sprite **sprites;
    const struct SpriteTemplate *spriteTemplate;
    u8 spriteId;

    spriteTemplate = NULL;
    switch (arg0)
    {
    case 0:
    case 1:
    case 2:
    case 3:
        initialX = -96;
        y = 49 - gPokenavStructPtr->unk030C;
        deltaX = 8;
        endX = 32;
        width = 64;
        sprites = gPokenavStructPtr->unk3B88;
        spriteTemplate = arg0 != 3 ? &gSpriteTemplate_83E44E0 : &gSpriteTemplate_83E44F8;
        break;
    case 4:
        initialX = 272;
        y = 49 - gPokenavStructPtr->unk030C;
        deltaX = -8;
        endX = 152;
        width = 64;
        spriteTemplate = &gSpriteTemplate_83E44E0;
        sprites = gPokenavStructPtr->unk3B88;
        break;
    case 5:
    case 6:
    case 8:
    case 9:
        spriteTemplate = &gSpriteTemplate_83E4530;
        // fall through
    case 7:
    case 10:
    case 11:
        if (spriteTemplate == NULL)
            spriteTemplate = &gSpriteTemplate_83E4548;

        initialX = -96;
        y = 68 - gPokenavStructPtr->unk030C;
        deltaX = 8;
        endX = 16;
        width = 32;
        sprites = gPokenavStructPtr->unk3B90;
        break;
    default:
        return;
    }

    for (i = 0; i < 2; i++)
    {
        spriteId = CreateSprite(spriteTemplate, i * width + initialX, y, 0);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[0] = deltaX;
            gSprites[spriteId].data[1] =  endX + i * width;
            gSprites[spriteId].data[2] = i;
            gSprites[spriteId].data[3] = arg0;
            if (arg0 == 4 && i == 1)
            {
                int anim = !gPokenavStructPtr->regionMap.zoomed ? 1 : 2;
                StartSpriteAnim(&gSprites[spriteId], anim);
            }
            else
            {
                StartSpriteAnim(&gSprites[spriteId], i);
            }

            if (arg0 < 4 && i == 1)
            {
                gSprites[spriteId].oam.shape = ST_OAM_SQUARE;
                gSprites[spriteId].oam.size = 2;
            }

            sprites[i] = &gSprites[spriteId];
        }
    }
}

#define sEndX sprite->data[1]
void sub_80F2BBC(struct Sprite *sprite)
{
    s16 x = sprite->x;
    sprite->x += sprite->data[0];
    if ((x <= sEndX && sprite->x >= sEndX) || (x >= sEndX && sprite->x <= sEndX))
    {
        sprite->x = sEndX;
        if (sprite->data[3] == 4 && sprite->data[2] == 1)
            sprite->callback = sub_80F2C58;
        else
            sprite->callback = SpriteCallbackDummy;
    }
}
#undef sEndX

void sub_80F2C14(struct Sprite *sprite)
{
    u16 right;

    sprite->x -= sprite->data[0];
    right = sprite->x + 32;
    if (right > 304)
    {
        if (sprite->data[2] == 1)
        {
            if (sprite->data[3] < 5)
                FreeSpriteTilesByTag(0x1);
            else
                FreeSpriteTilesByTag(0x2);
        }

        DestroySprite(sprite);
    }
}

void sub_80F2C58(struct Sprite *sprite)
{
    int anim = !gPokenavStructPtr->regionMap.zoomed ? 1 : 2;
    StartSpriteAnim(sprite, anim);
}

void sub_80F2C80(u8 arg0)
{
    gPokenavStructPtr->unk306 = 0;
    if (!gPokenavStructPtr->unk6DAC)
        while (sub_80F2CBC(arg0));
}

bool8 sub_80F2CBC(u8 arg0)
{
    switch (gPokenavStructPtr->unk306)
    {
    case 0:
        sub_80F27DC(arg0);
        gPokenavStructPtr->unk306++;
        return TRUE;
    case 1:
        sub_80F29B8(arg0);
        gPokenavStructPtr->unk306++;
        return FALSE;
    default:
        return FALSE;
    }
}

void sub_80F2D04(u8 arg0)
{
    u16 i;

    if (arg0 < 5)
    {
        for (i = 0; i < 2; i++)
            gPokenavStructPtr->unk3B88[i]->callback = sub_80F2C14;
    }
    else
    {
        for (i = 0; i < 2; i++)
            gPokenavStructPtr->unk3B90[i]->callback = sub_80F2C14;
    }
}

void sub_80F2D6C(u8 arg0)
{
    u16 i;

    if (arg0 < 5)
    {
        FreeSpriteTilesByTag(0x1);
        for (i = 0; i < 2; i++)
            DestroySprite(gPokenavStructPtr->unk3B88[i]);
    }
    else
    {
        FreeSpriteTilesByTag(0x2);
        for (i = 0; i < 2; i++)
            DestroySprite(gPokenavStructPtr->unk3B90[i]);
    }
}

void sub_80F2DD8(void)
{
    CreateRegionMapCursor(7, 7);
    CreateRegionMapPlayerIcon(8, 8);
    sub_80FBF94();
}

void sub_80F2DF4(void)
{
    FreeRegionMapIconResources();
}

void sub_80F2E00(struct Sprite *sprite)
{
    sprite->x = gPokenavStructPtr->unk8766 + 38;
}

void sub_80F2E18(u8 arg0)
{
    u8 spriteId;
    struct SpriteTemplate spriteTemplate;
    struct SpritePalette spritePalette;
    struct SpriteSheet spriteSheet;

    if (!gPokenavStructPtr->unk8768)
    {
        spriteSheet = gUnknown_083E4568;
        spriteTemplate = gSpriteTemplate_83E4570;
        spritePalette = gUnknown_083E4588;

        spriteSheet.data = gPokenavStructPtr->unkD1E4[arg0];
        spritePalette.data = gPokenavStructPtr->unk0[arg0];
        gPokenavStructPtr->unkD1DC = LoadSpritePalette(&spritePalette);
        gPokenavStructPtr->unkD1DE = LoadSpriteSheet(&spriteSheet);

        spriteId = CreateSprite(&spriteTemplate, 38, 104, 0);
        if (spriteId == MAX_SPRITES)
        {
            FreeSpriteTilesByTag(0x6);
            FreeSpritePaletteByTag(0x6);
            gPokenavStructPtr->unk8768 = NULL;
        }
        else
        {
            gPokenavStructPtr->unk8768 = &gSprites[spriteId];
            gPokenavStructPtr->unkD1E0 = (void *)(VRAM + 0x10000) + gPokenavStructPtr->unkD1DE * 32;
            gPokenavStructPtr->unkD1DC = gPokenavStructPtr->unkD1DC * 16 + 0x100;
        }
    }
    else
    {
        DmaCopy16Defvars(3, gPokenavStructPtr->unkD1E4[arg0], gPokenavStructPtr->unkD1E0, 0x800);
        LoadPalette(gPokenavStructPtr->unk0[arg0], gPokenavStructPtr->unkD1DC, 0x20);
    }
}

void sub_80F2F48(void)
{
    if (gPokenavStructPtr->unk8768)
    {
        DestroySprite(gPokenavStructPtr->unk8768);
        FreeSpriteTilesByTag(0x6);
        FreeSpritePaletteByTag(0x6);
        gPokenavStructPtr->unk8768 = NULL;
    }
}

void sub_80F2F7C(u8 arg0)
{
    sub_80F2E18(arg0);
    gPokenavStructPtr->unkCED0 = gPokenavStructPtr->unk8768;
    gPokenavStructPtr->unkCED0->callback = sub_80F2FEC;
}

void sub_80F2FB0(void)
{
    if (gPokenavStructPtr->unkCED0)
    {
        DestroySprite(gPokenavStructPtr->unkCED0);
        FreeSpriteTilesByTag(0x6);
        FreeSpritePaletteByTag(0x6);
        gPokenavStructPtr->unkCED0 = NULL;
        gPokenavStructPtr->unk8768 = NULL;
    }
}

void sub_80F2FEC(struct Sprite *sprite)
{
    sprite->x = gPokenavStructPtr->unkD15A + 40;
    sprite->y = 104;
}

void sub_80F3008(u8 arg0)
{
    u16 i;
    u8 spriteId;
    struct SpritePalette spritePalette;
    struct SpriteSheet spriteSheets[3];

    memcpy(spriteSheets, gUnknown_083E4590, sizeof(gUnknown_083E4590));
    spritePalette = gUnknown_083E45A8;
    switch (arg0)
    {
    case 1:
    case 2:
        spritePalette.data = gUnknown_08E9F988;
        break;
    }

    LoadSpriteSheets(spriteSheets);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&gSpriteTemplate_83E45B8, 95, 0, 0);
    if (spriteId == MAX_SPRITES)
    {
        gPokenavStructPtr->unk87CC = NULL;
    }
    else
    {
        gPokenavStructPtr->unk87CC = &gSprites[spriteId];
        for (i = 0; i < 2; i++)
        {
            spriteId = CreateSprite(&gSpriteTemplate_83E45F0, 168, i * 128 + 8, 0);
            if (spriteId != MAX_SPRITES)
            {
                gPokenavStructPtr->unk87D0[i] = &gSprites[spriteId];
                gSprites[spriteId].invisible = TRUE;
                gSprites[spriteId].data[0] = 0;
                gSprites[spriteId].data[1] = 0;
                gSprites[spriteId].data[2] = i == 0 ? -1 : 1;
                gSprites[spriteId].data[3] = i;
                gSprites[spriteId].data[4] = 1;
                StartSpriteAnim(&gSprites[spriteId], i);
            }
            else
            {
                gPokenavStructPtr->unk87D0[i] = NULL;
            }
        }
    }
}

void sub_80F3130(void)
{
    u16 i;

    if (gPokenavStructPtr->unk87CC)
    {
        DestroySprite(gPokenavStructPtr->unk87CC);
        FreeSpriteTilesByTag(0x9);
        FreeSpritePaletteByTag(0x9);
        gPokenavStructPtr->unk87CC = NULL;
    }

    for (i = 0; i < 2; i++)
    {
        if (gPokenavStructPtr->unk87D0[i])
        {
            DestroySprite(gPokenavStructPtr->unk87D0[i]);
            gPokenavStructPtr->unk87D0[i] = NULL;
        }
    }

    FreeSpriteTilesByTag(0xA);
}

void sub_80F3190(struct Sprite *sprite)
{
    sprite->y = gPokenavStructPtr->unk876C * 16 + 16;
}

void sub_80F31AC(struct Sprite *sprite)
{
    if (gPokenavStructPtr->unk87C9)
    {
        if (sprite->data[4])
        {
            if (!sprite->data[3])
                sprite->invisible = gPokenavStructPtr->unk8770 == 0;
            else
                sprite->invisible = gPokenavStructPtr->unk8772 == gPokenavStructPtr->unk8774;

            sprite->data[4] = 0;
        }

        if (++sprite->data[0] > 4)
        {
            sprite->data[0] = 0;
            if (++sprite->data[1] < 5)
            {
                sprite->y2 += sprite->data[2];
            }
            else
            {
                sprite->data[1] = 0;
                sprite->y2 = 0;
            }
        }
    }
}

void sub_80F3264(void)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        if (gPokenavStructPtr->unk87D0[i])
            gPokenavStructPtr->unk87D0[i]->data[4] = 1;
    }
}

void sub_80F3294(u8 arg0)
{
    gPokenavStructPtr->unk87CC->invisible = arg0;
    if (gPokenavStructPtr->unk87C9)
    {
        if (arg0 == 1)
        {
            gPokenavStructPtr->unk87D0[0]->invisible = arg0;
            gPokenavStructPtr->unk87D0[1]->invisible = arg0;
        }
        else
        {
            gPokenavStructPtr->unk87D0[0]->data[4] = 1;
            gPokenavStructPtr->unk87D0[1]->data[4] = 1;
        }
    }
}

void sub_80F3328(struct Sprite *sprite)
{
    if (sprite->data[0] == gPokenavStructPtr->unk87DC)
        StartSpriteAnim(sprite, 0);
    else
        StartSpriteAnim(sprite, 1);
}

void sub_80F3360(struct Sprite *sprite)
{
    if (gPokenavStructPtr->unk87DC == gPokenavStructPtr->unk87DA - 1)
        sprite->oam.paletteNum = IndexOfSpritePaletteTag(0x4);
    else
        sprite->oam.paletteNum = IndexOfSpritePaletteTag(0x5);
}

void sub_80F33A8(void)
{
    u16 i;
    u8 spriteId;
    struct SpriteSheet spriteSheets[4];
    struct SpritePalette spritePalettes[3];
    struct SpriteTemplate spriteTemplate;

    memcpy(spriteSheets, gUnknown_083E4628, sizeof(gUnknown_083E4628));
    memcpy(spritePalettes, gUnknown_083E4648, sizeof(gUnknown_083E4648));
    spriteTemplate = gSpriteTemplate_83E4660;
    LoadSpriteSheets(spriteSheets);
    LoadSpritePalettes(spritePalettes);

    for (i = 0; i < gPokenavStructPtr->unk87DA - 1; i++)
    {
        spriteId = CreateSprite(&spriteTemplate, 226, i * 20 + 8, 0);
        if (spriteId != MAX_SPRITES)
        {
            gPokenavStructPtr->unk87E4[i] = &gSprites[spriteId];
            gPokenavStructPtr->unk87E4[i]->data[0] = i;
        }
        else
        {
            gPokenavStructPtr->unk87E4[i] = NULL;
        }
    }

    spriteTemplate.tileTag = 0x4;
    spriteTemplate.callback = SpriteCallbackDummy;
    for (; i < 6; i++)
    {
        spriteId = CreateSprite(&spriteTemplate, 230, i * 20 + 8, 0);
        if (spriteId != MAX_SPRITES)
        {
            gPokenavStructPtr->unk87E4[i] = &gSprites[spriteId];
            gPokenavStructPtr->unk87E4[i]->oam.size = 0;
        }
        else
        {
            gPokenavStructPtr->unk87E4[i] = NULL;
        }
    }

    spriteTemplate.tileTag = 0x5;
    spriteTemplate.callback = sub_80F3360;
    spriteId = CreateSprite(&spriteTemplate, 222, i * 20 + 8, 0);
    if (spriteId != MAX_SPRITES)
    {
        gPokenavStructPtr->unk87E4[i] = &gSprites[spriteId];
        gPokenavStructPtr->unk87E4[i]->oam.shape = ST_OAM_H_RECTANGLE;
        gPokenavStructPtr->unk87E4[i]->oam.size = 2;
    }
    else
    {
        gPokenavStructPtr->unk87E4[i] = NULL;
    }
}

void sub_80F357C(void)
{
    u16 i;

    for (i = 0; i < 7; i++)
    {
        if (gPokenavStructPtr->unk87E4[i])
        {
            DestroySprite(gPokenavStructPtr->unk87E4[i]);
            gPokenavStructPtr->unk87E4[i] = NULL;
        }
    }
}

void sub_80F35B4(void)
{
    struct Sprite *sprite;

    gPokenavStructPtr->unk76B0.baseTileTag = 0x1C;
    gPokenavStructPtr->unk76B0.basePaletteTag = 0x13;
    sub_80F727C(&gPokenavStructPtr->unk76B0);
    sub_80F7404();
    sprite = sub_80F7920(27, 21, gUnknown_083E4678);
    sprite->oam.priority = 3;
    sprite->x = 192;
    sprite->y = 32;
    sprite->callback = sub_80F363C;
    gPokenavStructPtr->unk76AC = sprite;
}

void sub_80F3614(void)
{
    DestroySprite(gPokenavStructPtr->unk76AC);
    FreeSpriteTilesByTag(0x1B);
    FreeSpritePaletteByTag(0x15);
}

void sub_80F363C(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, gPokenavStructPtr->unk8934[gPokenavStructPtr->unk8fe9]);
}

void sub_80F3668(void)
{
    sub_80F7418(gPokenavStructPtr->unk8934[gPokenavStructPtr->unk8fe9], 176, 32);
}

void sub_80F3698(void)
{
    struct UnkUsePokeblockSub *var0 = &gPokenavStructPtr->unk893c[gPokenavStructPtr->unk87DC];
    gPokenavStructPtr->unk8934[gPokenavStructPtr->unk8fe9] = gPokenavStructPtr->unk76B0.markings;
    SetMonMarkings(var0->unk1, var0->partyIdx, gPokenavStructPtr->unk76B0.markings);
    sub_80F7470();
}

void sub_80F36F0(void)
{
    gPokenavStructPtr->unk306 = 0;
    if (!gPokenavStructPtr->unk6DAC)
        while (sub_80F3724());
}

bool8 sub_80F3724(void)
{
    switch (gPokenavStructPtr->unk306)
    {
    case 0:
        LZ77UnCompWram(gUnknown_083E3D00, gPokenavStructPtr->unk984C);
        break;
    case 1:
        sub_80F379C();
        gPokenavStructPtr->unk306++;
        // fall through
    case 2:
        if (sub_80F37D0())
            return TRUE;
        break;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unk306++;
    return TRUE;
}

void sub_80F379C(void)
{
    gPokenavStructPtr->unkBC93 = 0;
    if (!gPokenavStructPtr->unk6DAC)
        while (sub_80F37D0());
}

bool8 sub_80F37D0(void)
{
    u16 i;
    u8 j, k, l, m;

    if (gPokenavStructPtr->unkBC93 > 11)
        return FALSE;

    for (i = 0; i < 2; i++)
    {
        u8 *r4 = &gPokenavStructPtr->unk984C[gPokenavStructPtr->unkBC93][0];
        u8 *r5 = &gPokenavStructPtr->unkA44C[gPokenavStructPtr->unkBC93][0];
        for (j = 0; j < 4; j++)
        {
            CpuFastSet(r4, r5, 0x10);
            r5 += 0x40;
            r4 += 0x20;
            for (k = 0; k < 2; k++)
            {
                for (l = 0; l < 8; l++)
                {
                    r4 += 4;
                    for (m = 0; m < 4; m++)
                    {
                        r4 -= 1;
                        *r5 = (*r4 << 4) | ((*r4 >> 4) & 0xF);
                        r5++;
                    }

                    r4 += 4;
                }

                r4 -= 0x40;
            }

            r4 += 0x60;
        }

        if (++gPokenavStructPtr->unkBC93 > 11)
            return FALSE;
    }

    if (gPokenavStructPtr->unkBC93 > 11)
        return FALSE;

    return TRUE;
}

void sub_80F38B8(void)
{
    gPokenavStructPtr->unk306 = 0;
    if (!gPokenavStructPtr->unk6DAC)
        while (sub_80F38EC());
}

bool8 sub_80F38EC(void)
{
    switch (gPokenavStructPtr->unk306)
    {
    case 0:
        gPokenavStructPtr->unk9348 = NULL;
        gPokenavStructPtr->unkBC92 = 0;
        break;
    case 1:
        sub_80F2E18(0);
        break;
    case 2:
        sub_80F3970();
        gPokenavStructPtr->unk306++;
        // fall through
    case 3:
        if (sub_80F39A4())
            return TRUE;
        break;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unk306++;
    return TRUE;
}

void sub_80F3970(void)
{
    gPokenavStructPtr->unkBC93 = 0;
    if (!gPokenavStructPtr->unk6DAC)
        while (sub_80F39A4());
}

bool8 sub_80F39A4(void)
{
    struct SpriteSheet spriteSheet;
    struct SpritePalette spritePalette;
    if (gPokenavStructPtr->unkBC93 > 11)
        return FALSE;

    spriteSheet.data = &gPokenavStructPtr->unkA44C[gPokenavStructPtr->unkBC93][0];
    spriteSheet.size = 0x200;
    spriteSheet.tag = gPokenavStructPtr->unkBC93 + 11;
    LoadSpriteSheet(&spriteSheet);
    if (gPokenavStructPtr->unkBC93 < 5)
    {
        spritePalette.data = gUnknown_083E3C60[gPokenavStructPtr->unkBC93];
        spritePalette.tag = gPokenavStructPtr->unkBC93 + 10;
        LoadSpritePalette(&spritePalette);
    }

    if (++gPokenavStructPtr->unkBC93 > 11)
        return FALSE;

    return TRUE;
}

struct Sprite *sub_80F3A3C(u16 arg0, u16 arg1)
{
    struct SpriteTemplate spriteTemplate;
    u16 var0;
    u8 ribbon;
    u8 spriteId;

    if (arg1 < 3)
        var0 = arg0 + arg1 * 9;
    else
        var0 = arg0 + (gPokenavStructPtr->unkBC8E - gPokenavStructPtr->unkBC8F);

    ribbon = gPokenavStructPtr->unkBC4C[var0];
    spriteTemplate = gSpriteTemplate_83E476C;
    spriteTemplate.tileTag = gPokenavRibbonsIconGfx[ribbon][0] + 11;
    spriteTemplate.paletteTag = gPokenavRibbonsIconGfx[ribbon][1] + 10;
    spriteId = CreateSprite(&spriteTemplate, arg0 * 16 + 96, arg1 * 16 + 40, 2);
    if (spriteId != MAX_SPRITES)
        return &gSprites[spriteId];
    else
        return NULL;
}

void sub_80F3B00(void)
{
    gPokenavStructPtr->unk9348 = sub_80F3A3C(gPokenavStructPtr->unkBC90, gPokenavStructPtr->unkBC91);
    if (gPokenavStructPtr->unk9348)
    {
        StartSpriteAffineAnim(gPokenavStructPtr->unk9348, 1);
        gPokenavStructPtr->unkBC92 = 1;
    }
    else
    {
        gPokenavStructPtr->unkBC92 = 0;
    }
}

bool8 sub_80F3B58(void)
{
    if (gPokenavStructPtr->unkBC92)
    {
        gPokenavStructPtr->unkBC92 = !gPokenavStructPtr->unk9348->affineAnimEnded;
        return gPokenavStructPtr->unkBC92;
    }
    else
    {
        return FALSE;
    }
}

void sub_80F3B94(void)
{
    if (gPokenavStructPtr->unk9348)
    {
        StartSpriteAffineAnim(gPokenavStructPtr->unk9348, 2);
        gPokenavStructPtr->unkBC92 = 1;
    }
    else
    {
        gPokenavStructPtr->unkBC92 = 0;
    }
}

bool8 sub_80F3BD4(void)
{
    if (gPokenavStructPtr->unkBC92)
    {
        gPokenavStructPtr->unkBC92 = !gPokenavStructPtr->unk9348->affineAnimEnded;
        if (!gPokenavStructPtr->unkBC92)
        {
            FreeOamMatrix(gPokenavStructPtr->unk9348->oam.matrixNum);
            DestroySprite(gPokenavStructPtr->unk9348);
            gPokenavStructPtr->unk9348 = NULL;
        }

        return gPokenavStructPtr->unkBC92;
    }
    else
    {
        return FALSE;
    }
}

void sub_80F3C2C(void)
{
    u16 i;

    if (gPokenavStructPtr->unk9348)
    {
        FreeOamMatrix(gPokenavStructPtr->unk9348->oam.matrixNum);
        DestroySprite(gPokenavStructPtr->unk9348);
        gPokenavStructPtr->unk9348 = NULL;
    }

    for (i = 0; i < 12; i++)
        FreeSpriteTilesByTag(i + 0xB);

    for (i = 0; i < 5; i++)
        FreeSpritePaletteByTag(i + 0xA);

    sub_80F2F48();
}

void sub_80F3C94(void)
{
    u16 i;
    struct SpriteSheet spriteSheet;
    struct SpritePalette spritePalette;

    spriteSheet = gUnknown_083E4784;
    spritePalette = gUnknown_083E478C;
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    for (i = 0; i < 10; i++)
        gPokenavStructPtr->unk8800[i] = NULL;
}

void sub_80F3CE8(void)
{
    move_anim_execute();
    FreeSpriteTilesByTag(0x17);
    FreeSpritePaletteByTag(0xF);
}

void sub_80F3D00(void)
{
    u8 spriteId;
    u16 i;
    u8 var1;
    struct UnkUsePokeblockSub *var0 = &gPokenavStructPtr->unk893c[gPokenavStructPtr->unk87DC];

    if (!var0->unk3_14)
        return;

    var1 = gPokenavStructPtr->unk8931[gPokenavStructPtr->unk8fe9];
    for (i = 0; i < var1 + 1; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_83E4800, 0, 0, 0);
        if (spriteId != MAX_SPRITES)
        {
            gPokenavStructPtr->unk8800[i] = &gSprites[spriteId];
            gPokenavStructPtr->unk8800[i]->invisible = TRUE;
        }
        else
        {
            break;
        }
    }

    sub_80F3F20(var1, 1);
}

void move_anim_execute(void)
{
    u16 i;

    for (i = 0; i < 10; i++)
    {
        if (!gPokenavStructPtr->unk8800[i])
            return;

        DestroySprite(gPokenavStructPtr->unk8800[i]);
        gPokenavStructPtr->unk8800[i] = NULL;
    }
}

void sub_80F3DDC(struct Sprite *sprite)
{
    if (++sprite->data[1] > 60)
    {
        sprite->data[1] = 0;
        sub_80F3F20(sprite->data[2], 0);
    }
}

void sub_80F3E04(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        sprite->data[1] = 0;
        sprite->callback = sub_80F3DDC;
    }
}

void sub_80F3E24(struct Sprite *sprite)
{
    if (gPokenavStructPtr->unk8768)
    {
        sprite->x = gPokenavStructPtr->unk8768->x
                         + gPokenavStructPtr->unk8768->x2
                         + gUnknown_083E4794[sprite->data[0]][0];
        sprite->y = gPokenavStructPtr->unk8768->y
                         + gPokenavStructPtr->unk8768->y2
                         + gUnknown_083E4794[sprite->data[0]][1];
    }
    else
    {
        sprite->x = gUnknown_083E4794[sprite->data[0]][0] + 40;
        sprite->y = gUnknown_083E4794[sprite->data[0]][1] + 104;
    }
}

void sub_80F3E9C(struct Sprite *sprite)
{
    if (sprite->data[1])
    {
        if (--sprite->data[1])
            return;

        SeekSpriteAnim(sprite, 0);
        sprite->invisible = FALSE;
    }

    sub_80F3E24(sprite);
    if (sprite->animEnded)
    {
        sprite->invisible = TRUE;
        if (sprite->data[3] == sprite->data[2])
        {
            if (sprite->data[3] == 9)
            {
                sub_80F3FAC();
                sprite->callback = sub_80F3E04;
            }
            else
            {
                sprite->callback = sub_80F3DDC;
            }
        }
        else
        {
            sprite->callback = SpriteCallbackDummy;
        }
    }
}

void sub_80F3F20(u8 arg0, u8 arg1)
{
    u16 i;

    for (i = 0; i < 10; i++)
    {
        if (gPokenavStructPtr->unk8800[i])
        {
            gPokenavStructPtr->unk8800[i]->data[0] = i;
            gPokenavStructPtr->unk8800[i]->data[1] = i * 16 + 1;
            gPokenavStructPtr->unk8800[i]->data[2] = arg0;
            gPokenavStructPtr->unk8800[i]->data[3] = i;

            if (!arg1 || arg0 != 9)
            {
                gPokenavStructPtr->unk8800[i]->callback = sub_80F3E9C;
            }
            else
            {
                sub_80F3E24(gPokenavStructPtr->unk8800[i]);
                sub_80F3FAC();
                gPokenavStructPtr->unk8800[i]->callback = sub_80F3E04;
                gPokenavStructPtr->unk8800[i]->invisible = FALSE;
            }
        }
    }
}

void sub_80F3FAC(void)
{
    u16 i;

    for (i = 0; i < 10; i++)
    {
        if (gPokenavStructPtr->unk8800[i])
        {
            SeekSpriteAnim(gPokenavStructPtr->unk8800[i], 0);
            gPokenavStructPtr->unk8800[i]->invisible = FALSE;
        }
    }
}

void sub_80F3FF0(void)
{
    gPokenavStructPtr->unk306 = 0;
    if (!gPokenavStructPtr->unk6DAC)
        while (sub_80F4024());
}

bool8 sub_80F4024(void)
{
    u8 paletteIndex;
    u8 spriteId;
    struct SpritePalette spritePalette;

    switch (gPokenavStructPtr->unk306)
    {
    case 0:
        LZ77UnCompWram(gUnknown_083E329C, gPokenavStructPtr->unk131E4);
        break;
    case 1:
    {
        struct SpriteSheet spriteSheet = {
            .data = gPokenavStructPtr->unk131E4,
            .size = sizeof(gPokenavStructPtr->unk131E4),
            .tag = 0x18,
        };
        LoadSpriteSheet(&spriteSheet);
        break;
    }
    case 2:
        spritePalette = gUnknown_083E4818;
        LoadSpritePalette(&spritePalette);
        paletteIndex = IndexOfSpritePaletteTag(0x10);
        gPokenavStructPtr->unk308 = -3 & ~(1 << (paletteIndex + 0x10));
        break;
    case 3:
        spriteId = CreateSprite(&gSpriteTemplate_83E4850, 218, 14, 0);
        if (spriteId != MAX_SPRITES)
        {
            gPokenavStructPtr->unk6D98 = &gSprites[spriteId];
            gPokenavStructPtr->unk6D98->data[0] = 0;
        }
        else
        {
            gPokenavStructPtr->unk6D98 = NULL;
        }

        gPokenavStructPtr->unk306++;
        return FALSE;
    default:
        return FALSE;
    }

    gPokenavStructPtr->unk306++;
    return TRUE;
}

void sub_80F4138(struct Sprite *sprite)
{
    sprite->y2 = -gPokenavStructPtr->unk030C;
    if (sprite->y2 <= -32)
    {
        if (sprite->data[0] == 0)
        {
            sprite->invisible = TRUE;
            sprite->data[0] = 1;
        }
    }
    else
    {
        if (sprite->data[0] == 1)
        {
            sprite->invisible = FALSE;
            sprite->data[0] = 0;
        }
    }
}

#ifdef NONMATCHING
// close, but the last DmaCopy16 is sharing the 0x400 value from the beginning of the function.
void sub_80F4194(u8 *arg0, u8 *text)
{
    u8 i;
    u8 *tileBuffer;
    u32 *tileBuf2;

    tileBuffer = gUnknown_083DFEC8;
    DmaFill16(3, 0x1111, tileBuffer, 0x280);
    DmaFill16Defvars(3, 0x1111, 0x400 + tileBuffer, 0x280);
    Text_InitWindow8004E3C(&gWindowTemplate_81E70F0, tileBuffer, text);

    DmaClear16(3, tileBuffer + 0x220, 0x60);
    DmaClear16(3, tileBuffer + 0x620, 0x60);

    tileBuf2 = (int *)tileBuffer + 0x80;
    tileBuf2[0] &= 0x0FFFFFFF;
    tileBuf2[1] &= 0x0FFFFFFF;
    tileBuf2[2] &= 0x0FFFFFFF;
    tileBuf2[3] &= 0x0FFFFFFF;
    tileBuf2[4] &= 0x0FFFFFFF;
    tileBuf2[5] &= 0x0FFFFFFF;
    tileBuf2[6] &= 0x0FFFFFFF;
    tileBuf2[7] &= 0x0FFFFFFF;

    tileBuf2 = (int *)tileBuffer + 0x180;
    tileBuf2[0] &= 0x0FFFFFFF;
    tileBuf2[1] &= 0x0FFFFFFF;
    tileBuf2[2] &= 0x0FFFFFFF;
    tileBuf2[3] &= 0x0FFFFFFF;
    tileBuf2[4] &= 0x0FFFFFFF;
    tileBuf2[5] &= 0x0FFFFFFF;
    tileBuf2[6] &= 0x0FFFFFFF;
    tileBuf2[7] &= 0x0FFFFFFF;

    for (i = 0; i < 5; i++)
    {
        DmaCopy16(3, &tileBuffer[128 * i], &arg0[i * 256], 128);
        DmaCopy16(3, &tileBuffer[128 * i + 0x400], &arg0[32 * ((i * 8) + 4)], 128);
    }
}
#else
NAKED
void sub_80F4194(u8 *arg0, u8 *text)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    sub sp, 0x4\n\
    adds r7, r0, 0\n\
    adds r2, r1, 0\n\
    ldr r0, _080F42A4 @ =gUnknown_083DFEC8\n\
    ldr r6, [r0]      @ r6 = tileBuffer\n\
    mov r0, sp        \n\
    ldr r1, _080F42A8 @ =0x00001111\n\
    adds r5, r1, 0\n\
    strh r5, [r0]\n\
    ldr r4, _080F42AC @ =0x040000d4\n\
    str r0, [r4]\n\
    str r6, [r4, 0x4]\n\
    ldr r3, _080F42B0 @ =0x81000140\n\
    str r3, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 3\n\
    adds r1, r6, r0\n\
    mov r0, sp\n\
    strh r5, [r0]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    str r3, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    ldr r0, _080F42B4 @ =gWindowTemplate_81E70F0\n\
    adds r1, r6, 0\n\
    bl Text_InitWindow8004E3C\n\
    movs r3, 0x88\n\
    lsls r3, 2\n\
    adds r1, r6, r3\n\
    mov r0, sp\n\
    movs r3, 0\n\
    strh r3, [r0]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    ldr r2, _080F42B8 @ =0x81000030\n\
    str r2, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    movs r0, 0xC4\n\
    lsls r0, 3\n\
    adds r1, r6, r0\n\
    mov r0, sp\n\
    strh r3, [r0]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    str r2, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    movs r1, 0x80\n\
    lsls r1, 2\n\
    adds r2, r6, r1\n\
    ldr r0, [r2]\n\
    ldr r1, _080F42BC @ =0x0fffffff\n\
    ands r0, r1\n\
    str r0, [r2]\n\
    ldr r0, [r2, 0x4]\n\
    ands r0, r1\n\
    str r0, [r2, 0x4]\n\
    ldr r0, [r2, 0x8]\n\
    ands r0, r1\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0xC]\n\
    ands r0, r1\n\
    str r0, [r2, 0xC]\n\
    ldr r0, [r2, 0x10]\n\
    ands r0, r1\n\
    str r0, [r2, 0x10]\n\
    ldr r0, [r2, 0x14]\n\
    ands r0, r1\n\
    str r0, [r2, 0x14]\n\
    ldr r0, [r2, 0x18]\n\
    ands r0, r1\n\
    str r0, [r2, 0x18]\n\
    ldr r0, [r2, 0x1C]\n\
    ands r0, r1\n\
    str r0, [r2, 0x1C]\n\
    movs r3, 0xC0\n\
    lsls r3, 3\n\
    adds r2, r6, r3\n\
    ldr r0, [r2]\n\
    ands r0, r1\n\
    str r0, [r2]\n\
    ldr r0, [r2, 0x4]\n\
    ands r0, r1\n\
    str r0, [r2, 0x4]\n\
    ldr r0, [r2, 0x8]\n\
    ands r0, r1\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0xC]\n\
    ands r0, r1\n\
    str r0, [r2, 0xC]\n\
    ldr r0, [r2, 0x10]\n\
    ands r0, r1\n\
    str r0, [r2, 0x10]\n\
    ldr r0, [r2, 0x14]\n\
    ands r0, r1\n\
    str r0, [r2, 0x14]\n\
    ldr r0, [r2, 0x18]\n\
    ands r0, r1\n\
    str r0, [r2, 0x18]\n\
    ldr r0, [r2, 0x1C]\n\
    ands r0, r1\n\
    str r0, [r2, 0x1C]\n\
    movs r1, 0\n\
    ldr r2, _080F42C0 @ =0x80000040\n\
_080F4268:\n\
    lsls r0, r1, 7\n\
    adds r0, r6, r0\n\
    str r0, [r4]\n\
    lsls r0, r1, 8\n\
    adds r0, r7, r0\n\
    str r0, [r4, 0x4]\n\
    str r2, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    lsls r0, r1, 7\n\
    movs r3, 0x80\n\
    lsls r3, 3\n\
    adds r0, r3\n\
    adds r0, r6, r0\n\
    str r0, [r4]\n\
    lsls r0, r1, 3\n\
    adds r0, 0x4\n\
    lsls r0, 5\n\
    adds r0, r7, r0\n\
    str r0, [r4, 0x4]\n\
    str r2, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    adds r0, r1, 0x1\n\
    lsls r0, 24\n\
    lsrs r1, r0, 24\n\
    cmp r1, 0x4\n\
    bls _080F4268\n\
    add sp, 0x4\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080F42A4: .4byte gUnknown_083DFEC8\n\
_080F42A8: .4byte 0x00001111\n\
_080F42AC: .4byte 0x040000d4\n\
_080F42B0: .4byte 0x81000140\n\
_080F42B4: .4byte gWindowTemplate_81E70F0\n\
_080F42B8: .4byte 0x81000030\n\
_080F42BC: .4byte 0x0fffffff\n\
_080F42C0: .4byte 0x80000040\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80F42C4(u8 *arg0)
{
    u16 i, tileOffset;
    u8 spriteId;
    struct SpriteSheet spriteSheet = {
        .data = gPokenavStructPtr->unkD1E4[0],
        .size = 0x500,
        .tag = 0x1A,
    };

    sub_80F4194(gPokenavStructPtr->unkD1E4[0], arg0);
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&gUnknown_083E4868);

    tileOffset = 0;
    for (i = 0; i < 5; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_83E4878, i * 32 + 113, 16, 0);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].oam.tileNum += tileOffset;
            gPokenavStructPtr->unkCED4[i] = &gSprites[spriteId];
        }
        else
        {
            gPokenavStructPtr->unkCED4[i] = NULL;
        }

        tileOffset += 8;
    }
}

void sub_80F4394(void)
{
    u16 i;

    for (i = 0; i < 5; i++)
    {
        if (gPokenavStructPtr->unkCED4[i])
            DestroySprite(gPokenavStructPtr->unkCED4[i]);
    }

    FreeSpriteTilesByTag(0x1A);
    FreeSpritePaletteByTag(0x12);
}

void sub_80F43D4(u8 *arg0)
{
    u16 tile;

    sub_80F4194(gPokenavStructPtr->unkD1E4[0], arg0);
    tile = GetSpriteTileStartByTag(0x1A);
    if (tile != 0xFFFF)
    DmaCopy32Defvars(3, gPokenavStructPtr->unkD1E4[0], (void *)(VRAM + 0x10000 + (tile * 32)), 0x500);
}

u8 *sub_80F4428(u8 *arg0, u16 arg1, u8 arg2)
{
    return sub_80F6514(arg0, arg1, arg2);
}

u8 *sub_80F443C(u8 *arg0, u16 arg1)
{
    return AlignInt1InMenuWindow(StringCopy(arg0, gOtherText_Number), arg1, 56, 1);
}

u8 *sub_80F445C(u8 *arg0, u16 arg1)
{
    u8 *buffer = AlignInt1InMenuWindow(arg0, arg1, 23, 1);
    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x11;
    buffer[2] = 1;
    buffer += 3;
    buffer[0] = CHAR_SLASH;
    buffer += 1;
    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x11;
    buffer[2] = 1;
    buffer += 3;
    buffer = AlignInt1InMenuWindow(buffer, gPokenavStructPtr->unk8774 + 1, 50, 1);
    return buffer;
}

u32 sub_80F44B0(u16 box, u16 monIndex, int monDataField, u8 *text)
{
    if (box == 14)
    {
        if (monDataField == MON_DATA_NICKNAME || monDataField == MON_DATA_OT_NAME)
            return GetMonData(&gPlayerParty[monIndex], monDataField, text);
        else
            return GetMonData(&gPlayerParty[monIndex], monDataField);
    }
    else
    {
        if (monDataField == MON_DATA_NICKNAME || monDataField == MON_DATA_OT_NAME)
            return GetBoxMonData(&gPokemonStorage.boxes[box][monIndex], monDataField, text);
        else
            return GetBoxMonData(&gPokemonStorage.boxes[box][monIndex], monDataField);
    }
}

void SetMonMarkings(u16 box, u16 monIndex, u8 markings)
{
    if (box == 14)
        SetMonData(&gPlayerParty[monIndex], MON_DATA_MARKINGS, &markings);
    else
        SetBoxMonData(&gPokemonStorage.boxes[box][monIndex], MON_DATA_MARKINGS, &markings);
}

void sub_80F45A0(s16 arg0, u8 arg1)
{
    u8 box;
    u8 var0 = gPokenavStructPtr->unk893c[arg0].unk3_14;
    if (var0)
    {
        sub_80F4428(gPokenavStructPtr->unk8829[arg1], arg0, 0);
        box = gPokenavStructPtr->unk893c[arg0].unk1;
        if (box == 14)
            AlignStringInMenuWindow(gPokenavStructPtr->unk88E9[arg1], gOtherText_InParty, 64, 0);
        else
            AlignStringInMenuWindow(gPokenavStructPtr->unk88E9[arg1], gPokemonStorage.boxNames[box], 64, 0);

        gPokenavStructPtr->unk8937[arg1] = 1;
    }
    else
    {
        AlignStringInMenuWindow(gPokenavStructPtr->unk8829[arg1], gEmptyString_81E72B0, 104, 0);
        AlignStringInMenuWindow(gPokenavStructPtr->unk88E9[arg1], gEmptyString_81E72B0, 64, 0);
        gPokenavStructPtr->unk8937[arg1] = var0;
    }
}

void sub_80F468C(s16 arg0, u8 arg1)
{
    u16 i;
    u16 box;
    u16 monIndex;

    if (gPokenavStructPtr->unk893c[arg0].unk3_14)
    {
        box = gPokenavStructPtr->unk893c[arg0].unk1;
        monIndex = gPokenavStructPtr->unk893c[arg0].partyIdx;
        gPokenavStructPtr->unk8ff0[arg1][0] = sub_80F44B0(box, monIndex, MON_DATA_COOL, NULL);
        gPokenavStructPtr->unk8ff0[arg1][1] = sub_80F44B0(box, monIndex, MON_DATA_TOUGH, NULL);
        gPokenavStructPtr->unk8ff0[arg1][2] = sub_80F44B0(box, monIndex, MON_DATA_SMART, NULL);
        gPokenavStructPtr->unk8ff0[arg1][3] = sub_80F44B0(box, monIndex, MON_DATA_CUTE, NULL);
        gPokenavStructPtr->unk8ff0[arg1][4] = sub_80F44B0(box, monIndex, MON_DATA_BEAUTY, NULL);

        gPokenavStructPtr->unk8931[arg1] = sub_80F44B0(box, monIndex, MON_DATA_SHEEN, NULL) != 255
                                           ? sub_80F44B0(box, monIndex, MON_DATA_SHEEN, NULL) / 29
                                           : 9;

        gPokenavStructPtr->unk8934[arg1] = sub_80F44B0(box, monIndex, MON_DATA_MARKINGS, NULL);
        sub_80F55AC(gPokenavStructPtr->unk8ff0[arg1], gPokenavStructPtr->unk9004[arg1]);
    }
    else
    {
        for (i = 0; i < 5; i++)
        {
            gPokenavStructPtr->unk8ff0[arg1][i] = 0;
            gPokenavStructPtr->unk9004[arg1][i].unk0 = 0x9B;
            gPokenavStructPtr->unk9004[arg1][i].unk2 = 0x5B;
        }
    }
}

void sub_80F4824(s16 arg0, u8 arg1)
{
    u16 species;
    u32 otId;
    u32 personality;
    u16 box;
    u16 monIndex;

    if (gPokenavStructPtr->unk893c[arg0].unk3_14)
    {
        box = gPokenavStructPtr->unk893c[arg0].unk1;
        monIndex = gPokenavStructPtr->unk893c[arg0].partyIdx;
        species = sub_80F44B0(box, monIndex, MON_DATA_SPECIES2, NULL);
        otId = sub_80F44B0(box, monIndex, MON_DATA_OT_ID, NULL);
        personality = sub_80F44B0(box, monIndex, MON_DATA_PERSONALITY, NULL);

        HandleLoadSpecialPokePic(
            &gMonFrontPicTable[species],
            gMonFrontPicCoords[species].coords,
            1,
            gPokenavStructPtr->unk131E4,
            gPokenavStructPtr->unkD1E4[arg1],
            species,
            personality);

        LZ77UnCompWram(GetMonSpritePalFromOtIdPersonality(species, otId, personality), gPokenavStructPtr->unk0[arg1]);
        gPokenavStructPtr->unkD1D6[arg1] = species;
    }
}

void sub_80F4900(s16 arg0, u8 arg1)
{
    sub_80F45A0(arg0, arg1);
    sub_80F468C(arg0, arg1);
    sub_80F4824(arg0, arg1);
}

void sub_80F492C(void)
{
    gPokenavStructPtr->unk8FE4 = 0;
}

void sub_80F4944(struct UnkUsePokeblockSub *arg0) // This looks like a sorting algorithm. Proposal: Make local variables min, max, and currPos
{
    u16 min, max, currPos;

    min = 0;
    max = gPokenavStructPtr->unk8FE4;
    currPos = min + (max - min)/ 2;
    while (max != currPos)
    {
        if (arg0->unk0 > gPokenavStructPtr->unk893c[currPos].unk0)
            max = currPos;
        else
            min = currPos + 1;

        currPos = min + (max - min) / 2;
    }

    for ( max = gPokenavStructPtr->unk8FE4; max > currPos; max--)
    {
        gPokenavStructPtr->unk893c[max] = gPokenavStructPtr->unk893c[max - 1];
    }

    gPokenavStructPtr->unk893c[currPos] = *arg0;
    gPokenavStructPtr->unk8FE4++;
}

void sub_80F49F4(void)
{
    u16 i;

    gPokenavStructPtr->unk893c[0].unk2_5 = 1;
    for (i = 1; i < gPokenavStructPtr->unk8FE4; i++)
    {
        if (gPokenavStructPtr->unk893c[i].unk0 == gPokenavStructPtr->unk893c[i - 1].unk0)
            gPokenavStructPtr->unk893c[i].unk2_5 = gPokenavStructPtr->unk893c[i - 1].unk2_5;
        else
            gPokenavStructPtr->unk893c[i].unk2_5 = i + 1;
    }

    gPokenavStructPtr->unk876C = 0;
    gPokenavStructPtr->unk8770 = 0;
    gPokenavStructPtr->unk876E = 0;
    gPokenavStructPtr->unk8772 = gPokenavStructPtr->unk8FE4 < 9 ? (gPokenavStructPtr->unk8FE4 - 1) : 7;
    gPokenavStructPtr->unk8774 = gPokenavStructPtr->unk8FE4 - 1;
    gPokenavStructPtr->unk87C9 = gPokenavStructPtr->unk8774 > 7;
}

void sub_80F4B20(void)
{
    s16 var0;
    s16 var1;

    sub_80F4900(gPokenavStructPtr->unk87DC, 0);
    sub_80F2E18(0);
    if (gPokenavStructPtr->unk87DA == 1)
    {
        gPokenavStructPtr->unk8fe9 = 0;
        gPokenavStructPtr->unk8FEA = 0;
        gPokenavStructPtr->unk8FEB = 0;
    }
    else
    {
        gPokenavStructPtr->unk8fe9 = 0;
        gPokenavStructPtr->unk8FEA = 1;
        gPokenavStructPtr->unk8FEB = 2;

        var0 = gPokenavStructPtr->unk87DC + 1;
        if (var0 >= gPokenavStructPtr->unk87DA)
            var0 = 0;

        var1 = gPokenavStructPtr->unk87DC - 1;
        if (var1 < 0)
            var1 = gPokenavStructPtr->unk87DA - 1;

        sub_80F4900(var0, 1);
        sub_80F4900(var1, 2);
    }
}

void sub_80F4BD0(void)
{
    u16 i, j;

    for (i = 0, j = 0; i < gPokenavStructPtr->unk8828; i++)
    {
        if (!GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
        {
            gPokenavStructPtr->unk893c[j].unk1 = 14;
            gPokenavStructPtr->unk893c[j].partyIdx = i;
            gPokenavStructPtr->unk893c[j].unk2_5 = j + 1;
            gPokenavStructPtr->unk893c[j].unk3_14 = 1;
            j++;
        }
    }

    gPokenavStructPtr->unk893c[j].unk1 = 0;
    gPokenavStructPtr->unk893c[j].partyIdx = 0;
    gPokenavStructPtr->unk893c[j].unk2_5 = 0;
    gPokenavStructPtr->unk893c[j].unk3_14 = 0;
    gPokenavStructPtr->unk87DC = 0;
    gPokenavStructPtr->unk87DA = j + 1;
    sub_80F4B20();
    gPokenavStructPtr->unk87CB = 1;
}

void sub_80F4CF0(void)
{
    gPokenavStructPtr->unk87DC = gPokenavStructPtr->unk876E;
    sub_80F4B20();

    if (gPokenavStructPtr->unk8774 == 0)
        gPokenavStructPtr->unk87CB = 0;
    else
        gPokenavStructPtr->unk87CB = 1;
}

void sub_80F4D44(void)
{
    gPokenavStructPtr->unk8FE6 = 0;
    gPokenavStructPtr->unk8FE7 = 0;
    sub_80F492C();

    if (!gPokenavStructPtr->unk6DAC)
        while (sub_80F4D88());
}

bool8 sub_80F4D88(void)
{
    u16 i;
    register int mask asm("r3"); // FIXME
    int nextValue;
    struct UnkUsePokeblockSub var0;

    switch (gPokenavStructPtr->unk8FE6)
    {
    default:
        var0.unk3_14 = 1;
        for (i = 0; i < 15; i++)
        {

            if (GetBoxMonData(&gPokemonStorage.boxes[gPokenavStructPtr->unk8FE6][gPokenavStructPtr->unk8FE7], MON_DATA_SPECIES)
                && !GetBoxMonData(&gPokemonStorage.boxes[gPokenavStructPtr->unk8FE6][gPokenavStructPtr->unk8FE7], MON_DATA_IS_EGG))
            {
                var0.unk1 = gPokenavStructPtr->unk8FE6;
                var0.partyIdx = gPokenavStructPtr->unk8FE7;
                var0.unk0 = GetBoxMonData(
                    &gPokemonStorage.boxes[gPokenavStructPtr->unk8FE6][gPokenavStructPtr->unk8FE7],
                    gPokenavStructPtr->unk87D8);
                sub_80F4944(&var0);
            }

            gPokenavStructPtr->unk8FE7++;
            mask = 0xFF;
            if (gPokenavStructPtr->unk8FE7 == 30)
            {
                gPokenavStructPtr->unk8FE7 = 0;
                nextValue = gPokenavStructPtr->unk8FE6 + 1;
                gPokenavStructPtr->unk8FE6 = nextValue;
                if ((nextValue & mask) == 14)
                    break;
            }
        }
        break;
    case 14:
        var0.unk3_14 = 1;
        var0.unk1 = 14;
        for (i = 0; i < gPokenavStructPtr->unk8828; i++)
        {
            if (!GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
            {
                var0.partyIdx = i;
                var0.unk0 = GetMonData(&gPlayerParty[i], gPokenavStructPtr->unk87D8);
                sub_80F4944(&var0);
            }
        }

        sub_80F49F4();
        gPokenavStructPtr->unk87DA = gPokenavStructPtr->unk8FE4;
        gPokenavStructPtr->unk8FE6++;
        break;
    case 15:
        return FALSE;
    }

    return TRUE;
}

void sub_80F4F78(void)
{
    sub_80F53EC(gPokenavStructPtr->unk9004[3], gPokenavStructPtr->unk9004[gPokenavStructPtr->unk8fe9]);
    sub_80F5504();
}

bool8 sub_80F4FB4(void)
{
    bool8 var0 = sub_80F5504();
    bool8 var1 = sub_80F170C();
    return var0 || var1;
}

void sub_80F4FDC(void)
{
    if (gPokenavStructPtr->unk76AA || gPokenavStructPtr->unk87DC != gPokenavStructPtr->unk8828)
        sub_80F53EC(gPokenavStructPtr->unk9004[gPokenavStructPtr->unk8fe9], gPokenavStructPtr->unk9004[3]);
}

bool8 sub_80F5038(void)
{
    bool8 var0 = sub_80F5504();
    bool8 var1 = sub_80F173C();
    return var0 || var1;
}

void sub_80F5060(u8 arg0)
{
    u16 var0;
    u8 var1;
    u8 var2;

    if (arg0)
        var0 = gPokenavStructPtr->unk8FEB;
    else
        var0 = gPokenavStructPtr->unk8FEA;

    sub_80F53EC(gPokenavStructPtr->unk9004[gPokenavStructPtr->unk8fe9], gPokenavStructPtr->unk9004[var0]);
    var1 = gPokenavStructPtr->unk893c[gPokenavStructPtr->unk87DC].unk3_14;
    if (arg0)
    {
        gPokenavStructPtr->unk8FEB = gPokenavStructPtr->unk8FEA;
        gPokenavStructPtr->unk8FEA = gPokenavStructPtr->unk8fe9;
        gPokenavStructPtr->unk8fe9 = var0;
        gPokenavStructPtr->unk8FEC = gPokenavStructPtr->unk8FEB;

        gPokenavStructPtr->unk87DC = gPokenavStructPtr->unk87DC
                                     ? gPokenavStructPtr->unk87DC - 1
                                     : gPokenavStructPtr->unk87DA - 1;
        gPokenavStructPtr->unk8FEE = gPokenavStructPtr->unk87DC
                                     ? gPokenavStructPtr->unk87DC - 1
                                     : gPokenavStructPtr->unk87DA - 1;
    }
    else
    {
        gPokenavStructPtr->unk8FEA = gPokenavStructPtr->unk8FEB;
        gPokenavStructPtr->unk8FEB = gPokenavStructPtr->unk8fe9;
        gPokenavStructPtr->unk8fe9 = var0;
        gPokenavStructPtr->unk8FEC = gPokenavStructPtr->unk8FEA;

        gPokenavStructPtr->unk87DC = (gPokenavStructPtr->unk87DC < gPokenavStructPtr->unk87DA - 1)
                                     ? gPokenavStructPtr->unk87DC + 1
                                     : 0;
        gPokenavStructPtr->unk8FEE = (gPokenavStructPtr->unk87DC < gPokenavStructPtr->unk87DA - 1)
                                     ? gPokenavStructPtr->unk87DC + 1
                                     : 0;
    }

    var2 = gPokenavStructPtr->unk893c[gPokenavStructPtr->unk87DC].unk3_14;
    if (!var1)
        gPokenavStructPtr->unk87E0 = sub_80F5264;
    else if (!var2)
        gPokenavStructPtr->unk87E0 = sub_80F52F8;
    else
        gPokenavStructPtr->unk87E0 = sub_80F5364;

    gPokenavStructPtr->unk87DE = 0;
}

bool8 gpu_sync_bg_show(void)
{
    return gPokenavStructPtr->unk87E0();
}

bool8 sub_80F5264(void)
{
    switch (gPokenavStructPtr->unk87DE)
    {
    case 0:
        sub_80F2E18(gPokenavStructPtr->unk8fe9);
        sub_80F01E0(gPokenavStructPtr->unk8fe9);
        gPokenavStructPtr->unk87DE++;
        // fall through
    case 1:
        if (!sub_80F4FB4())
        {
            sub_80F4900(gPokenavStructPtr->unk8FEE, gPokenavStructPtr->unk8FEC);
            gPokenavStructPtr->unk87DE++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_80F52F8(void)
{
    switch (gPokenavStructPtr->unk87DE)
    {
    case 0:
        if (!sub_80F5038())
        {
            sub_80F01E0(gPokenavStructPtr->unk8fe9);
            sub_80F4900(gPokenavStructPtr->unk8FEE, gPokenavStructPtr->unk8FEC);
            gPokenavStructPtr->unk87DE++;
        }
        break;
    case 1:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_80F5364(void)
{
    switch (gPokenavStructPtr->unk87DE)
    {
    case 0:
        sub_80F5504();
        if (!sub_80F173C())
        {
            sub_80F2E18(gPokenavStructPtr->unk8fe9);
            sub_80F01E0(gPokenavStructPtr->unk8fe9);
            gPokenavStructPtr->unk87DE++;
        }
        break;
    case 1:
        if (!sub_80F4FB4())
            gPokenavStructPtr->unk87DE++;
        break;
    case 2:
        sub_80F4900(gPokenavStructPtr->unk8FEE, gPokenavStructPtr->unk8FEC);
        return FALSE;
    }

    return TRUE;
}

void sub_80F53EC(struct UnkPokenav11 *arg0, struct UnkPokenav11 *arg1)
{
    u16 i, j;
    int r5;
    int r6;

    for (i = 0; i < 5; i++)
    {
        r5 = arg0[i].unk0 << 8;
        r6 = ((arg1[i].unk0 - arg0[i].unk0) << 8) / 10;
        for (j = 0; j < 9; j++)
        {
            gPokenavStructPtr->unk9054[j][i].unk0 = (r5 >> 8) + ((r5 >> 7) & 1);
            r5 += r6;
        }

        gPokenavStructPtr->unk9054[j][i].unk0 = arg1[i].unk0;
        r5 = arg0[i].unk2 << 8;
        r6 = ((arg1[i].unk2 - arg0[i].unk2) << 8) / 10;
        for (j = 0; j < 9; j++)
        {
            gPokenavStructPtr->unk9054[j][i].unk2 = (r5 >> 8) + ((r5 >> 7) & 1);
            r5 += r6;
        }

        gPokenavStructPtr->unk9054[j][i].unk2 = arg1[i].unk2;
    }

    gPokenavStructPtr->unk9342 = 0;
}

bool8 sub_80F5504(void)
{
    if (gPokenavStructPtr->unk9342 < 10)
    {
        sub_80F556C(gPokenavStructPtr->unk9054[gPokenavStructPtr->unk9342++]);
        return gPokenavStructPtr->unk9342 != 10;
    }
    else
    {
        return FALSE;
    }
}

void sub_80F5550(struct UnkPokenav11 *arg0, struct UnkPokenav11 *arg1)
{
    sub_80F53EC(arg0, arg1);
}

bool8 sub_80F555C(void)
{
    return sub_80F5504();
}

void sub_80F556C(struct UnkPokenav11 *arg0)
{
    u16 i;

    for (i = 0; i < 5; i++)
        gPokenavStructPtr->unk911C[i] = arg0[i];

    gPokenavStructPtr->unk9344 = 1;
}

void sub_80F55AC(u8 *a0, struct UnkPokenav11 a1[])
{
    u16 i;
    u8 r2 = gUnknown_083E4890[*a0++];
    u8 r7;
    s8 r12;

    a1[0].unk0 = 0x9b;
    a1[0].unk2 = 0x5b - r2;

    r7 = 0x40;
    r12 = 0;
    for (i = 1; i < 5; i++)
    {
        r7 += 0x33;
        r12--;
        if (r12 < 0)
            r12 = 4;
        if (r12 == 2)
            r7++;
        r2 = gUnknown_083E4890[*a0++];
        a1[r12].unk0 = ((r2 * gSineTable[r7 + 0x40]) >> 8) + 0x9b;
        a1[r12].unk2 = 0x5b - ((r2 * gSineTable[r7]) >> 8);

        if (r12 <= 2 && (r2 != 0x20 || r12 != 2))
            a1[r12].unk0 = ((r2 * gSineTable[r7 + 0x40]) >> 8) + 0x9c;
    }
}

void sub_80F567C(u8 *a0, struct UnkPokenav11 a1[])
{
    sub_80F55AC(a0, a1);
}

/* TODO
// emerald: sub_81D2278
void sub_80F5688(u16 * r6, u16 * r5, u16 * sp0, u8 r9, u16 * r7)
{
    u16 sp04;
    u16 r0;
    u16 r4;
    u16 r10;
    if (r5[1] < sp0[1])
    {
        sp04 = r5[1];
        r4 = r5[0] << 10;
        r0 = sp0[1];
        r10 = sp0[0];
    }
}
*/

NAKED
void sub_80F5688(u16 r6[66][2], struct UnkPokenav11 * r5, struct UnkPokenav11 * sp0, u8 r9, u16 r7[66][2])
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x14\n"
                "\tadds r6, r0, 0\n"
                "\tadds r5, r1, 0\n"
                "\tstr r2, [sp]\n"
                "\tldr r7, [sp, 0x34]\n"
                "\tlsls r3, 24\n"
                "\tlsrs r3, 24\n"
                "\tmov r9, r3\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tldrh r0, [r5, 0x2]\n"
                "\tldrh r1, [r2, 0x2]\n"
                "\tcmp r0, r1\n"
                "\tbcs _080F56D0\n"
                "\tadds r2, r0, 0\n"
                "\tstr r2, [sp, 0x4]\n"
                "\tldr r3, [sp]\n"
                "\tldrh r0, [r3, 0x2]\n"
                "\tldrh r1, [r5]\n"
                "\tlsls r4, r1, 10\n"
                "\tldrh r2, [r3]\n"
                "\tmov r10, r2\n"
                "\tldr r3, [sp, 0x4]\n"
                "\tsubs r0, r3\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmov r8, r0\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F56FC\n"
                "\tsubs r0, r2, r1\n"
                "\tb _080F56F2\n"
                "_080F56D0:\n"
                "\tldrh r0, [r5, 0x2]\n"
                "\tldr r1, [sp]\n"
                "\tldrh r1, [r1, 0x2]\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tldr r2, [sp]\n"
                "\tldrh r1, [r2]\n"
                "\tlsls r4, r1, 10\n"
                "\tldrh r3, [r5]\n"
                "\tmov r10, r3\n"
                "\tldr r2, [sp, 0x4]\n"
                "\tsubs r0, r2\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmov r8, r0\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F56FC\n"
                "\tsubs r0, r3, r1\n"
                "_080F56F2:\n"
                "\tlsls r0, 10\n"
                "\tmov r1, r8\n"
                "\tbl __divsi3\n"
                "\tstr r0, [sp, 0x8]\n"
                "_080F56FC:\n"
                "\tmov r0, r8\n"
                "\tadds r0, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmov r8, r0\n"
                "\tcmp r7, 0\n"
                "\tbne _080F5746\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r6, r0\n"
                "\tmovs r5, 0\n"
                "\tmov r3, r9\n"
                "\tlsls r3, 1\n"
                "\tmov r12, r3\n"
                "\tmov r0, r10\n"
                "\tadd r0, r9\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tcmp r7, r8\n"
                "\tbcs _080F57D4\n"
                "\tmovs r7, 0x1\n"
                "_080F5726:\n"
                "\tadds r2, r3, r6\n"
                "\tasrs r1, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tands r0, r7\n"
                "\tadds r1, r0\n"
                "\tadd r1, r9\n"
                "\tstrh r1, [r2]\n"
                "\tldr r1, [sp, 0x8]\n"
                "\tadds r4, r1\n"
                "\tadds r6, 0x4\n"
                "\tadds r0, r5, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tcmp r5, r8\n"
                "\tbcc _080F5726\n"
                "\tb _080F57D4\n"
                "_080F5746:\n"
                "\tldr r2, [sp, 0x8]\n"
                "\tcmp r2, 0\n"
                "\tble _080F57E4\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r7, r0\n"
                "\tmovs r5, 0\n"
                "\tmov r3, r9\n"
                "\tlsls r3, 1\n"
                "\tmov r12, r3\n"
                "\tmov r0, r10\n"
                "\tadd r0, r9\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F5798\n"
                "\tldr r0, _080F57D8 @ =0x00026bff\n"
                "\tcmp r4, r0\n"
                "\tbgt _080F5798\n"
                "\tmov r1, r12\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tmov r10, r0\n"
                "_080F5772:\n"
                "\tldr r3, [sp, 0x10]\n"
                "\tadds r2, r3, r7\n"
                "\tasrs r1, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tmovs r3, 0x1\n"
                "\tands r0, r3\n"
                "\tadds r1, r0\n"
                "\tadd r1, r9\n"
                "\tstrh r1, [r2]\n"
                "\tldr r0, [sp, 0x8]\n"
                "\tadds r4, r0\n"
                "\tadds r7, 0x4\n"
                "\tadds r0, r5, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F5798\n"
                "\tcmp r4, r10\n"
                "\tble _080F5772\n"
                "_080F5798:\n"
                "\tldr r1, _080F57DC @ =gPokenavStructPtr\n"
                "\tldr r0, [r1]\n"
                "\tldr r2, [sp, 0x4]\n"
                "\tadds r1, r2, r5\n"
                "\tldr r3, _080F57E0 @ =0x00009340\n"
                "\tadds r0, r3\n"
                "\tstrh r1, [r0]\n"
                "\tldrh r0, [r0]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r6, r0\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F57D4\n"
                "\tmov r3, r12\n"
                "\tmovs r7, 0x1\n"
                "_080F57B6:\n"
                "\tadds r2, r3, r6\n"
                "\tasrs r1, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tands r0, r7\n"
                "\tadds r1, r0\n"
                "\tadd r1, r9\n"
                "\tstrh r1, [r2]\n"
                "\tldr r0, [sp, 0x8]\n"
                "\tadds r4, r0\n"
                "\tadds r6, 0x4\n"
                "\tadds r0, r5, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tcmp r5, r8\n"
                "\tbcc _080F57B6\n"
                "_080F57D4:\n"
                "\tsubs r0, r6, 0x4\n"
                "\tb _080F58C4\n"
                "\t.align 2, 0\n"
                "_080F57D8: .4byte 0x00026bff\n"
                "_080F57DC: .4byte gPokenavStructPtr\n"
                "_080F57E0: .4byte 0x00009340\n"
                "_080F57E4:\n"
                "\tldr r1, [sp, 0x8]\n"
                "\tcmp r1, 0\n"
                "\tbge _080F5890\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r6, r0\n"
                "\tmovs r5, 0\n"
                "\tmov r2, r9\n"
                "\tlsls r2, 1\n"
                "\tmov r12, r2\n"
                "\tmov r3, r10\n"
                "\tadd r3, r9\n"
                "\tstr r3, [sp, 0xC]\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F5842\n"
                "\tadds r3, r2, r6\n"
                "\tasrs r1, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tmovs r2, 0x1\n"
                "\tands r0, r2\n"
                "\tadds r1, r0\n"
                "\tadd r1, r9\n"
                "\tstrh r1, [r3]\n"
                "\tb _080F5838\n"
                "_080F5816:\n"
                "\tldr r0, [sp, 0x8]\n"
                "\tadds r4, r0\n"
                "\tadds r6, 0x4\n"
                "\tadds r0, r5, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F5842\n"
                "\tmov r1, r12\n"
                "\tadds r3, r1, r6\n"
                "\tasrs r2, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tmovs r1, 0x1\n"
                "\tands r0, r1\n"
                "\tadds r2, r0\n"
                "\tadd r2, r9\n"
                "\tstrh r2, [r3]\n"
                "_080F5838:\n"
                "\tldr r0, _080F5884 @ =0x00026bff\n"
                "\tcmp r4, r0\n"
                "\tbgt _080F5816\n"
                "\tmovs r0, 0x9B\n"
                "\tstrh r0, [r3]\n"
                "_080F5842:\n"
                "\tldr r2, _080F5888 @ =gPokenavStructPtr\n"
                "\tldr r0, [r2]\n"
                "\tldr r3, [sp, 0x4]\n"
                "\tadds r1, r3, r5\n"
                "\tldr r2, _080F588C @ =0x00009340\n"
                "\tadds r0, r2\n"
                "\tstrh r1, [r0]\n"
                "\tldrh r0, [r0]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r7, r0\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F587E\n"
                "\tmov r3, r12\n"
                "\tmovs r6, 0x1\n"
                "_080F5860:\n"
                "\tadds r2, r3, r7\n"
                "\tasrs r1, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tands r0, r6\n"
                "\tadds r1, r0\n"
                "\tadd r1, r9\n"
                "\tstrh r1, [r2]\n"
                "\tldr r0, [sp, 0x8]\n"
                "\tadds r4, r0\n"
                "\tadds r7, 0x4\n"
                "\tadds r0, r5, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tcmp r5, r8\n"
                "\tbcc _080F5860\n"
                "_080F587E:\n"
                "\tsubs r0, r7, 0x4\n"
                "\tb _080F58C4\n"
                "\t.align 2, 0\n"
                "_080F5884: .4byte 0x00026bff\n"
                "_080F5888: .4byte gPokenavStructPtr\n"
                "_080F588C: .4byte 0x00009340\n"
                "_080F5890:\n"
                "\tldr r0, _080F58BC @ =gPokenavStructPtr\n"
                "\tldr r0, [r0]\n"
                "\tldr r1, _080F58C0 @ =0x00009340\n"
                "\tadds r0, r1\n"
                "\tmov r2, sp\n"
                "\tldrh r2, [r2, 0x4]\n"
                "\tstrh r2, [r0]\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r6, r0\n"
                "\tadds r7, r0\n"
                "\tldrh r0, [r5]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r6, 0x2]\n"
                "\tldr r3, [sp]\n"
                "\tldrh r0, [r3]\n"
                "\tstrh r0, [r7]\n"
                "\tmovs r0, 0x9B\n"
                "\tstrh r0, [r7, 0x2]\n"
                "\tb _080F58CC\n"
                "\t.align 2, 0\n"
                "_080F58BC: .4byte gPokenavStructPtr\n"
                "_080F58C0: .4byte 0x00009340\n"
                "_080F58C4:\n"
                "\tadd r0, r12\n"
                "\tmov r1, sp\n"
                "\tldrh r1, [r1, 0xC]\n"
                "\tstrh r1, [r0]\n"
                "_080F58CC:\n"
                "\tadd sp, 0x14\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0");
}

void sub_80F58DC(struct UnkPokenav11 * a0)
{
    u16 i, r6, varMax;

    if (a0[0].unk2 < a0[1].unk2)
    {
        r6 = a0[0].unk2;
        sub_80F5688(gPokenavStructPtr->unk9130, &a0[0], &a0[1], 1, NULL);
    }
    else
    {
        r6 = a0[1].unk2;
        sub_80F5688(gPokenavStructPtr->unk9130, &a0[1], &a0[0], 0, NULL);
    }
    sub_80F5688(gPokenavStructPtr->unk9130, &a0[1], &a0[2], 1, NULL);

    i = a0[2].unk2 <= a0[3].unk2;
    sub_80F5688(gPokenavStructPtr->unk9130, &a0[2], &a0[3], i, gPokenavStructPtr->unk9238);
    for (i = 56; i < r6; i++)
    {
        gPokenavStructPtr->unk9130[i - 56][0] = 0;
        gPokenavStructPtr->unk9130[i - 56][1] = 0;
    }

    for (i = a0[0].unk2; i <= gPokenavStructPtr->unk9340; i++)
        gPokenavStructPtr->unk9130[i - 56][0] = 155;

    varMax = max(gPokenavStructPtr->unk9340, a0[2].unk2);
    for (i = varMax + 1; i < 122; i++)
    {
        gPokenavStructPtr->unk9130[i - 56][0] = 0;
        gPokenavStructPtr->unk9130[i - 56][1] = 0;
    }

//    for (i = 56; i < 122; i++)
//    {
//        if (gPokenavStructPtr->unk9130[i - 56][0] == 0 && gPokenavStructPtr->unk9130[i - 56][1] != 0)
//            gPokenavStructPtr->unk9130[i - 56][0] = 155;
//    }
}

void sub_80F5A1C(struct UnkPokenav11 *arg0)
{
    u16 i, r6, varMax;

    if (arg0[0].unk2 < arg0[4].unk2)
    {
        r6 = arg0[0].unk2;
        sub_80F5688(gPokenavStructPtr->unk9238, &arg0[0], &arg0[4], 0, NULL);
    }
    else
    {
        r6 = arg0[4].unk2;
        sub_80F5688(gPokenavStructPtr->unk9238, &arg0[4], &arg0[0], 1, NULL);
    }

    sub_80F5688(gPokenavStructPtr->unk9238, &arg0[4], &arg0[3], 0, NULL);

    for (i = 56; i < r6; i++)
    {
        gPokenavStructPtr->unk9238[i - 56][0] = 0;
        gPokenavStructPtr->unk9238[i - 56][1] = 0;
    }

    for (i = arg0[0].unk2; i <= gPokenavStructPtr->unk9340; i++)
        gPokenavStructPtr->unk9238[i - 56][1] = 155;

    varMax = max(gPokenavStructPtr->unk9340, arg0[3].unk2 + 1);
    for (i = varMax; i < 122; i++)
    {
        gPokenavStructPtr->unk9238[i - 56][0] = 0;
        gPokenavStructPtr->unk9238[i - 56][1] = 0;
    }

//    for (i = 0; i < 66; i++)
//    {
//        if (gPokenavStructPtr->unk9238[i][0] >= gPokenavStructPtr->unk9238[i][1])
//        {
//            gPokenavStructPtr->unk9238[i][1] = 0;
//            gPokenavStructPtr->unk9238[i][0] = 0;
//        }
//    }
}

void sub_80F5B38(void)
{
    gPokenavStructPtr->unk9345 = 0;
}

extern const struct ScanlineEffectParams gUnknown_083E4990;

bool8 sub_80F5B50(void)
{
    s32 i;
    struct ScanlineEffectParams params;

    switch (gPokenavStructPtr->unk9345)
    {
    case 0:
        ScanlineEffect_Clear();
        for (i = 0; i < 16; i++)
        {
            gScanlineEffectRegBuffers[0][16 + 2 * i] = 0xEF;
            gScanlineEffectRegBuffers[0][17 + 2 * i] = 0xEF;
            gScanlineEffectRegBuffers[1][16 + 2 * i] = 0xEF;
            gScanlineEffectRegBuffers[1][17 + 2 * i] = 0xEF;
        }
        gPokenavStructPtr->unk9345++;
        return TRUE;
    case 1:
        params = gUnknown_083E4990;
        ScanlineEffect_SetParams(params);
        gPokenavStructPtr->unk9345++;
        break;
    }
    return FALSE;
}

void sub_80F5BDC(void)
{
    gScanlineEffect.state = 3;
    ScanlineEffect_InitHBlankDmaTransfer();
}

void sub_80F5BF0(void)
{
    u16 i;

    if (gPokenavStructPtr->unk9344)
    {
        sub_80F58DC(gPokenavStructPtr->unk911C);
        sub_80F5A1C(gPokenavStructPtr->unk911C);
        for (i = 0; i < 66; i++)
        {
            gScanlineEffectRegBuffers[1][(i + 55) * 2 + 0] = gScanlineEffectRegBuffers[0][(i + 55) * 2 + 0] = (gPokenavStructPtr->unk9130[i][0] << 8) | (gPokenavStructPtr->unk9130[i][1]);
            gScanlineEffectRegBuffers[1][(i + 55) * 2 + 1] = gScanlineEffectRegBuffers[0][(i + 55) * 2 + 1] = (gPokenavStructPtr->unk9238[i][0] << 8) | (gPokenavStructPtr->unk9238[i][1]);
        }
        gPokenavStructPtr->unk9344 = 0;
    }
}

void sub_80F5CDC(u8 a0)
{
    u16 i, r5;

    if (gPokenavStructPtr->unk9344)
    {
        sub_80F58DC(gPokenavStructPtr->unk911C);
        sub_80F5A1C(gPokenavStructPtr->unk911C);
        r5 = 2 * (55 - a0);
        for (i = 0; i < 66; i ++)
        {
            gScanlineEffectRegBuffers[1][r5 + 0] = gScanlineEffectRegBuffers[0][r5 + 0] = (gPokenavStructPtr->unk9130[i][0] << 8) | (gPokenavStructPtr->unk9130[i][1]);
            gScanlineEffectRegBuffers[1][r5 + 1] = gScanlineEffectRegBuffers[0][r5 + 1] = (gPokenavStructPtr->unk9238[i][0] << 8) | (gPokenavStructPtr->unk9238[i][1]);
            r5 += 2;
        }
        gPokenavStructPtr->unk9344 = 0;
    }
}

u8 sub_80F5DD4(void)
{
    if (({gMain.newAndRepeatedKeys & DPAD_UP;}))
    {
        return sub_80F5E20();
    }
    else if (({gMain.newAndRepeatedKeys & DPAD_DOWN;}))
    {
        return sub_80F5EE4();
    }
    else if (({gMain.newAndRepeatedKeys & DPAD_LEFT;}))
    {
        return sub_80F5FB4();
    }
    else if (({gMain.newAndRepeatedKeys & DPAD_RIGHT;}))
    {
        return sub_80F6010();
    }
    else
    {
        return 0;
    }
}

u8 sub_80F5E20(void)
{
    if (gPokenavStructPtr->unk876E == 0)
    {
        return 0;
    }
    if (gPokenavStructPtr->unk87C9 != 0 && gPokenavStructPtr->unk876C == 0)
    {
        sub_80F063C(-1);
        sub_80F6074(-1);
        return 2;
    }
    gPokenavStructPtr->unk876C--;
    if (gPokenavStructPtr->unk87C9 == 0 && gPokenavStructPtr->unk876C < 0)
    {
        gPokenavStructPtr->unk876C = gPokenavStructPtr->unk8772;
    }
    gPokenavStructPtr->unk876E = gPokenavStructPtr->unk8770 + gPokenavStructPtr->unk876C;
    if (gPokenavStructPtr->unk876E > gPokenavStructPtr->unk8774)
    {
        gPokenavStructPtr->unk876E -= gPokenavStructPtr->unk8774 + 1;
    }
    return 1;
}

u8 sub_80F5EE4(void)
{
    if (gPokenavStructPtr->unk876E == gPokenavStructPtr->unk8774)
    {
        return 0;
    }
    if (gPokenavStructPtr->unk87C9 != 0 && gPokenavStructPtr->unk876C == 7)
    {
        sub_80F063C(1);
        sub_80F6074(1);
        return 2;
    }
    gPokenavStructPtr->unk876C++;
    if (gPokenavStructPtr->unk87C9 == 0 && gPokenavStructPtr->unk876C > gPokenavStructPtr->unk8772)
    {
        gPokenavStructPtr->unk876C = 0;
    }
    gPokenavStructPtr->unk876E = gPokenavStructPtr->unk8770 + gPokenavStructPtr->unk876C;
    if (gPokenavStructPtr->unk876E > gPokenavStructPtr->unk8774)
    {
        gPokenavStructPtr->unk876E -= gPokenavStructPtr->unk8774 + 1;
    }
    return 1;
}

u8 sub_80F5FB4(void)
{
    s16 r4;
    if (gPokenavStructPtr->unk8770 == 0 || gPokenavStructPtr->unk87C9 == 0)
    {
        return 0;
    }
    if (gPokenavStructPtr->unk8770 < 8)
    {
        r4 = -gPokenavStructPtr->unk8770;
    }
    else
    {
        r4 = -8;
    }
    sub_80F063C(r4);
    sub_80F6074(r4);
    return 2;
}

u8 sub_80F6010(void)
{
    s16 r4;
    if (gPokenavStructPtr->unk8772 == gPokenavStructPtr->unk8774 || gPokenavStructPtr->unk87C9 == 0)
    {
        return 0;
    }
    r4 = gPokenavStructPtr->unk8774 - gPokenavStructPtr->unk8772;
    if (r4 > 8)
    {
        r4 = 8;
    }
    sub_80F063C(r4);
    sub_80F6074(r4);
    return 2;
}

void sub_80F6074(s16 a0)
{
    gPokenavStructPtr->unk8770 += a0;
    if (gPokenavStructPtr->unk8770 > gPokenavStructPtr->unk8774)
    {
        gPokenavStructPtr->unk8770 -= gPokenavStructPtr->unk8774 + 1;
    }
    if (gPokenavStructPtr->unk8770 < 0)
    {
        gPokenavStructPtr->unk8770 += gPokenavStructPtr->unk8774 + 1;
    }
    gPokenavStructPtr->unk8772 += a0;
    if (gPokenavStructPtr->unk8772 > gPokenavStructPtr->unk8774)
    {
        gPokenavStructPtr->unk8772 -= gPokenavStructPtr->unk8774 + 1;
    }
    if (gPokenavStructPtr->unk8772 < 0)
    {
        gPokenavStructPtr->unk8772 += gPokenavStructPtr->unk8774 + 1;
    }
    gPokenavStructPtr->unk876E += a0;
    if (gPokenavStructPtr->unk876E > gPokenavStructPtr->unk8774)
    {
        gPokenavStructPtr->unk876E -= gPokenavStructPtr->unk8774 + 1;
    }
    if (gPokenavStructPtr->unk876E < 0)
    {
        gPokenavStructPtr->unk876E += gPokenavStructPtr->unk8774 + 1;
    }
}

void sub_80F6134(void)
{
    if (gPokenavStructPtr->unk87C9 != 0)
    {
        if (gPokenavStructPtr->unk87DC < gPokenavStructPtr->unk8774 - 7)
        {
            gPokenavStructPtr->unk876C = 0;
            gPokenavStructPtr->unk8770 = gPokenavStructPtr->unk87DC;
            gPokenavStructPtr->unk876E = gPokenavStructPtr->unk87DC;
            gPokenavStructPtr->unk8772 = gPokenavStructPtr->unk8770 + 7;
            if (gPokenavStructPtr->unk8772 > gPokenavStructPtr->unk8774)
            {
                gPokenavStructPtr->unk8772 -= gPokenavStructPtr->unk8774 + 1;
            }
        }
        else
        {
            gPokenavStructPtr->unk8770 = gPokenavStructPtr->unk8774 - 7;
            gPokenavStructPtr->unk8772 = gPokenavStructPtr->unk8774;
            gPokenavStructPtr->unk876E = gPokenavStructPtr->unk87DC;
            gPokenavStructPtr->unk876C = 7 - (gPokenavStructPtr->unk8774 -  gPokenavStructPtr->unk876E);
        }
    }
    else
    {
        gPokenavStructPtr->unk876C = gPokenavStructPtr->unk87DC;
        gPokenavStructPtr->unk876E = gPokenavStructPtr->unk87DC;
    }
}

void sub_80F6208(void)
{
    gPokenavStructPtr->unk8FE6 = 0;
    gPokenavStructPtr->unk8FE7 = 0;
    gPokenavStructPtr->unk8FE8 = 0xFF;
    if (gPokenavStructPtr->unk6DAC == 0)
    {
        while (sub_80F6250())
            ;
    }
}

bool8 sub_80F6250(void)
{
    u16 i;

    if (gPokenavStructPtr->unk8FE8 != -1)
        return FALSE;

    switch (gPokenavStructPtr->unk8FE6)
    {
    default:
        for (i = 0; i < 10; i++)
        {
            if (GetBoxMonData(&gPokemonStorage.boxes[gPokenavStructPtr->unk8FE6 + 0][gPokenavStructPtr->unk8FE7], MON_DATA_RIBBON_COUNT) != 0)
            {
                gPokenavStructPtr->unk8FE8 = 1;
                return FALSE;
            }
            if (GetBoxMonData(&gPokemonStorage.boxes[gPokenavStructPtr->unk8FE6 + 7][gPokenavStructPtr->unk8FE7], MON_DATA_RIBBON_COUNT) != 0)
            {
                gPokenavStructPtr->unk8FE8 = 1;
                return FALSE;
            }
            if (++gPokenavStructPtr->unk8FE7 >= 30)
            {
                gPokenavStructPtr->unk8FE7 = 0;
                if (++gPokenavStructPtr->unk8FE6 >= 7)
                {
                    break;
                }
            }
        }
        break;
    case 8:
        return FALSE;
    case 7:
        gPokenavStructPtr->unk8FE8 = 0;
        for (i = 0; i < 6; i++)
        {
            if (GetMonData(&gPlayerParty[i], MON_DATA_RIBBON_COUNT) != 0)
            {
                gPokenavStructPtr->unk8FE8 = 1;
                break;
            }
        }
        gPokenavStructPtr->unk8FE6++;
        return FALSE;
    }
    return TRUE;
}

void sub_80F638C(void)
{
    gPokenavStructPtr->unk8FE6 = 0;
    gPokenavStructPtr->unk8FE7 = 0;
    sub_80F492C();
    if (gPokenavStructPtr->unk6DAC == 0)
    {
        while (sub_80F63D0())
            ;
    }
}

bool8 sub_80F63D0(void)
{
    struct UnkUsePokeblockSub sp0;
    u8 ribbons;
    u16 i;

    switch (gPokenavStructPtr->unk8FE6)
    {
    default:
        sp0.unk3_14 = 1;
        for (i = 0; i < 15; i++)
        {
            ribbons = GetBoxMonData(&gPokemonStorage.boxes[gPokenavStructPtr->unk8FE6][gPokenavStructPtr->unk8FE7 + 0], MON_DATA_RIBBON_COUNT);
            if (ribbons != 0)
            {
                sp0.unk1 = gPokenavStructPtr->unk8FE6;
                sp0.partyIdx = gPokenavStructPtr->unk8FE7;
                sp0.unk0 = ribbons;
                sub_80F4944(&sp0);
            }
            if (++gPokenavStructPtr->unk8FE7 == 30)
            {
                gPokenavStructPtr->unk8FE7 = 0;
                if (++gPokenavStructPtr->unk8FE6 == 14)
                    break;
            }
        }
        break;
    case 15:
        return FALSE;
    case 14:
        sp0.unk3_14 = 1;
        sp0.unk1 = 14;
        for (i = 0; i < 6; i++)
        {
            ribbons = GetMonData(&gPlayerParty[i], MON_DATA_RIBBON_COUNT);
            if (ribbons != 0)
            {
                sp0.partyIdx = i;
                sp0.unk0 = ribbons;
                sub_80F4944(&sp0);
            }
        }
        sub_80F49F4();
        gPokenavStructPtr->unk8FE6++;
        return FALSE;
    }
    return TRUE;
}

u8 * sub_80F6514(u8 * r10, u16 sp0, u8 sp4)
{
    u8 * dest = r10;
    u8 box = gPokenavStructPtr->unk893c[sp0].unk1;
    u8 monNo = gPokenavStructPtr->unk893c[sp0].partyIdx;
    u16 species;
    u16 level;
    u8 gender;

    if (!sub_80F44B0(box, monNo, MON_DATA_IS_EGG, NULL))
    {
        sub_80F44B0(box, monNo, MON_DATA_NICKNAME, dest);
        StringGetEnd10(dest);
        species = sub_80F44B0(box, monNo, MON_DATA_SPECIES, NULL);
        if (box == 14)
        {
            level = GetMonData(&gPlayerParty[monNo], MON_DATA_LEVEL);
            gender = GetMonGender(&gPlayerParty[monNo]);
        }
        else
        {
            level = GetLevelFromBoxMonExp(&gPokemonStorage.boxes[box][monNo]);
            gender = GetGenderFromSpeciesAndPersonality(species, sub_80F44B0(box, monNo, MON_DATA_PERSONALITY, NULL));
        }
        if (ShouldHideGenderIcon(species, r10))
        {
            gender = MON_GENDERLESS;
        }
        dest += StringLength(dest);

        dest[0] = EXT_CTRL_CODE_BEGIN;
        dest[1] = 0x13; // CLEAR_TO
        dest[2] = 63;
        dest += 3;

        switch (gender)
        {
        case MON_MALE:
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 0x01; // COLOR
            dest[2] = TEXT_COLOR_WHITE;
            dest[3] = EXT_CTRL_CODE_BEGIN;
            dest[4] = 0x03; // SHADOW
            dest[5] = TEXT_COLOR_SKY_BLUE;
            dest[6] = CHAR_MALE;
            dest += 7;
            break;
        case MON_FEMALE:
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 0x01; // COLOR
            dest[2] = TEXT_COLOR_BLACK2;
            dest[3] = EXT_CTRL_CODE_BEGIN;
            dest[4] = 0x03; // SHADOW
            dest[5] = TEXT_COLOR_SILVER;
            dest[6] = CHAR_FEMALE;
            dest += 7;
            break;
        }
        dest[0] = EXT_CTRL_CODE_BEGIN;
        dest[1] = 0x01; // COLOR
        dest[2] = TEXT_COLOR_DARK_GREY;
        dest[3] = EXT_CTRL_CODE_BEGIN;
        dest[4] = 0x03; // SHADOW
        dest[5] = TEXT_COLOR_YELLOW;
        dest += 6;

        dest[0] = EXT_CTRL_CODE_BEGIN;
        dest[1] = 0x13; // CLEAR_TO
        dest[2] = 70;
        dest += 3;

        dest[0] = CHAR_SLASH;
        dest[1] = EXT_CTRL_CODE_BEGIN;
        dest[2] = EXT_CTRL_CODE_CLEAR;
        dest[3] = 1;
        dest[4] = CHAR_LV;
        dest += 5;

        dest = ConvertIntToDecimalString(dest, level);
        if (sp4 == 1)
        {
            dest = AlignInt1InMenuWindow(dest, gPokenavStructPtr->unk893c[sp0].unk0, 0x80, 0x01);
        }
        else
        {
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 0x13; // CLEAR_TO
            dest[2] = 103;
            dest += 3;
            *dest = EOS;
        }
    }
    else
    {
        *dest = EOS;
    }
    return dest;
}

extern const u16 gUnknown_083E499C[];

void sub_80F66E0(void)
{
    u8 r9;
    u32 r7;
    u16 i, j;
    u8 r2;
    u8 r0;

    sub_80F6514(gPokenavStructPtr->unk8829[0], gPokenavStructPtr->unk876E, 0);
    sub_80F4824(gPokenavStructPtr->unk876E, 0);
    gPokenavStructPtr->unk87DC = gPokenavStructPtr->unk876E;
    gPokenavStructPtr->unkBC8E = 0;
    r9 = 0;
    r7 = sub_80F44B0(gPokenavStructPtr->unk893c[gPokenavStructPtr->unk876E].unk1, gPokenavStructPtr->unk893c[gPokenavStructPtr->unk876E].partyIdx, MON_DATA_RIBBONS, NULL);
    gPokenavStructPtr->unkBC8F = 0;
    for (i = 0; i < 17; i++)
    {
        switch (gUnknown_083E499C[i])
        {
        case MON_DATA_COOL_RIBBON:
        case MON_DATA_BEAUTY_RIBBON:
        case MON_DATA_CUTE_RIBBON:
        case MON_DATA_SMART_RIBBON:
        case MON_DATA_TOUGH_RIBBON:
            r2 = r7 & 7;
            r7 >>= 3;
            r0 = 4;
            break;
        default:
            r2 = r7 & 1;
            r7 >>= 1;
            r0 = 1;
            break;
        };
        for (j = 0; j < r2; j++)
        {
            gPokenavStructPtr->unkBC4C[gPokenavStructPtr->unkBC8E++] = r9 + j;
        }
        if (r2 && r9 > 24)
        {
            gPokenavStructPtr->unkBC8F++;
        }
        r9 += r0;
    }
    if (gPokenavStructPtr->unkBC8E != gPokenavStructPtr->unkBC8F)
    {
        gPokenavStructPtr->unkBC90 = 0;
        gPokenavStructPtr->unkBC91 = 0;
    }
    else
    {
        gPokenavStructPtr->unkBC90 = 0;
        gPokenavStructPtr->unkBC91 = 3;
    }
    r2 = gPokenavStructPtr->unkBC8E - gPokenavStructPtr->unkBC8F;
    for (i = 0; i < 3; i++)
    {
        if (r2 > 8)
        {
            gPokenavStructPtr->unkBC96[i] = 9;
            r2 -= 9;
        }
        else
        {
            gPokenavStructPtr->unkBC96[i] = r2;
            r2 = 0;
        }
    }
    gPokenavStructPtr->unkBC96[i] = gPokenavStructPtr->unkBC8F;
}

// FIXME: wtf is this control flow
#ifdef NONMATCHING
u8 sub_80F68E8(void)
{
    s8 r5 = gPokenavStructPtr->unkBC90;
    s8 r4 = gPokenavStructPtr->unkBC91;
    u8 r12 = 1;
    if (({gMain.newAndRepeatedKeys & DPAD_UP;}) && r4 > 0)
    {
        while (r4 > 0)
        {
            r4--;
            if (gPokenavStructPtr->unkBC96[r4] != 0)
            {
                break;
            }
        }
        if (gPokenavStructPtr->unkBC96[r4] != 0)
        {
            goto check_r5;
        }
        r4 = gPokenavStructPtr->unkBC91;
    }
    if (({gMain.newAndRepeatedKeys & DPAD_DOWN;}) && r4 < 3)
    {
        while (r4 < 3)
        {
            r4++;
            if (gPokenavStructPtr->unkBC96[r4] != 0)
            {
                break;
            }
        }
        if (gPokenavStructPtr->unkBC96[r4] != 0)
        {
            goto check_r5;
        }
        r4 = gPokenavStructPtr->unkBC91;
    }
    if (({gMain.newAndRepeatedKeys & DPAD_LEFT;}) && r5 > 0)
    {
        r5--;
    }
    else if (({gMain.newAndRepeatedKeys & DPAD_RIGHT;}) && r5 < gPokenavStructPtr->unkBC96[r4] - 1)
    {
        r5++;
    }
    else
    {
        r12 = 0;
    }
    goto end;

    check_r5:
    if (r5 >= gPokenavStructPtr->unkBC96[r4])
    {
        r5--;
    }
    end:
    if (r12)
    {
        if (r5 != gPokenavStructPtr->unkBC90 || r4 != gPokenavStructPtr->unkBC91)
        {
            gPokenavStructPtr->unkBC90 = r5;
            gPokenavStructPtr->unkBC91 = r4;
        }
        else
        {
            r12 = 0;
        }
    }
    return r12;
}
#else
NAKED
bool8 sub_80F68E8(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tldr r3, _080F6918 @ =gPokenavStructPtr\n"
                "\tldr r0, [r3]\n"
                "\tldr r2, _080F691C @ =0x0000bc90\n"
                "\tadds r1, r0, r2\n"
                "\tldrb r5, [r1]\n"
                "\tldr r6, _080F6920 @ =0x0000bc91\n"
                "\tadds r0, r6\n"
                "\tldrb r4, [r0]\n"
                "\tmovs r0, 0x1\n"
                "\tmov r12, r0\n"
                "\tldr r2, _080F6924 @ =gMain\n"
                "\tldrh r1, [r2, 0x30]\n"
                "\tmovs r0, 0x40\n"
                "\tands r0, r1\n"
                "\tadds r6, r3, 0\n"
                "\tadds r7, r2, 0\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F692E\n"
                "\tlsls r0, r4, 24\n"
                "\tcmp r0, 0\n"
                "\tble _080F692E\n"
                "\tb _080F69BC\n"
                "\t.align 2, 0\n"
                "_080F6918: .4byte gPokenavStructPtr\n"
                "_080F691C: .4byte 0x0000bc90\n"
                "_080F6920: .4byte 0x0000bc91\n"
                "_080F6924: .4byte gMain\n"
                "_080F6928:\n"
                "\tldr r1, _080F69B0 @ =0x0000bc91\n"
                "\tadds r0, r2, r1\n"
                "\tldrb r4, [r0]\n"
                "_080F692E:\n"
                "\tldrh r1, [r7, 0x30]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F6978\n"
                "\tlsls r0, r4, 24\n"
                "\tasrs r0, 24\n"
                "\tcmp r0, 0x2\n"
                "\tbgt _080F6978\n"
                "\tldr r3, _080F69B4 @ =gPokenavStructPtr\n"
                "\tldr r2, _080F69B8 @ =0x0000bc96\n"
                "_080F6944:\n"
                "\tlsls r0, r4, 24\n"
                "\tasrs r0, 24\n"
                "\tcmp r0, 0x2\n"
                "\tbgt _080F6960\n"
                "\tadds r0, 0x1\n"
                "\tlsls r0, 24\n"
                "\tldr r1, [r3]\n"
                "\tlsrs r4, r0, 24\n"
                "\tasrs r0, 24\n"
                "\tadds r1, r2\n"
                "\tadds r1, r0\n"
                "\tldrb r0, [r1]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F6944\n"
                "_080F6960:\n"
                "\tldr r2, [r6]\n"
                "\tlsls r0, r4, 24\n"
                "\tasrs r0, 24\n"
                "\tldr r3, _080F69B8 @ =0x0000bc96\n"
                "\tadds r1, r2, r3\n"
                "\tadds r1, r0\n"
                "\tldrb r0, [r1]\n"
                "\tcmp r0, 0\n"
                "\tbne _080F69EC\n"
                "\tldr r1, _080F69B0 @ =0x0000bc91\n"
                "\tadds r0, r2, r1\n"
                "\tldrb r4, [r0]\n"
                "_080F6978:\n"
                "\tldrh r2, [r7, 0x30]\n"
                "\tmovs r0, 0x20\n"
                "\tands r0, r2\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F698A\n"
                "\tlsls r0, r5, 24\n"
                "\tasrs r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbgt _080F6A3C\n"
                "_080F698A:\n"
                "\tmovs r0, 0x10\n"
                "\tands r0, r2\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F69AA\n"
                "\tlsls r0, r5, 24\n"
                "\tasrs r2, r0, 24\n"
                "\tldr r1, [r6]\n"
                "\tlsls r0, r4, 24\n"
                "\tasrs r0, 24\n"
                "\tldr r3, _080F69B8 @ =0x0000bc96\n"
                "\tadds r1, r3\n"
                "\tadds r1, r0\n"
                "\tldrb r0, [r1]\n"
                "\tsubs r0, 0x1\n"
                "\tcmp r2, r0\n"
                "\tblt _080F6A38\n"
                "_080F69AA:\n"
                "\tmovs r0, 0\n"
                "\tmov r12, r0\n"
                "\tb _080F69FC\n"
                "\t.align 2, 0\n"
                "_080F69B0: .4byte 0x0000bc91\n"
                "_080F69B4: .4byte gPokenavStructPtr\n"
                "_080F69B8: .4byte 0x0000bc96\n"
                "_080F69BC:\n"
                "\tlsls r0, r4, 24\n"
                "\tasrs r0, 24\n"
                "\tcmp r0, 0\n"
                "\tble _080F69DA\n"
                "\tsubs r0, 0x1\n"
                "\tlsls r0, 24\n"
                "\tldr r1, [r6]\n"
                "\tlsrs r4, r0, 24\n"
                "\tasrs r0, 24\n"
                "\tldr r2, _080F6A2C @ =0x0000bc96\n"
                "\tadds r1, r2\n"
                "\tadds r1, r0\n"
                "\tldrb r0, [r1]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F69BC\n"
                "_080F69DA:\n"
                "\tldr r2, [r6]\n"
                "\tlsls r0, r4, 24\n"
                "\tasrs r0, 24\n"
                "\tldr r3, _080F6A2C @ =0x0000bc96\n"
                "\tadds r1, r2, r3\n"
                "\tadds r1, r0\n"
                "\tldrb r0, [r1]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F6928\n"
                "_080F69EC:\n"
                "\tlsls r0, r5, 24\n"
                "\tasrs r0, 24\n"
                "\tldrb r1, [r1]\n"
                "\tcmp r0, r1\n"
                "\tblt _080F69FC\n"
                "\tsubs r0, r1, 0x1\n"
                "_080F69F8:\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "_080F69FC:\n"
                "\tmov r0, r12\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F6A44\n"
                "\tlsls r0, r5, 24\n"
                "\tasrs r0, 24\n"
                "\tldr r3, [r6]\n"
                "\tldr r1, _080F6A30 @ =0x0000bc90\n"
                "\tadds r2, r3, r1\n"
                "\tldrb r6, [r2]\n"
                "\tcmp r0, r6\n"
                "\tbne _080F6A20\n"
                "\tlsls r0, r4, 24\n"
                "\tasrs r0, 24\n"
                "\tldr r6, _080F6A34 @ =0x0000bc91\n"
                "\tadds r1, r3, r6\n"
                "\tldrb r1, [r1]\n"
                "\tcmp r0, r1\n"
                "\tbeq _080F6A40\n"
                "_080F6A20:\n"
                "\tstrb r5, [r2]\n"
                "\tldr r1, _080F6A34 @ =0x0000bc91\n"
                "\tadds r0, r3, r1\n"
                "\tstrb r4, [r0]\n"
                "\tb _080F6A44\n"
                "\t.align 2, 0\n"
                "_080F6A2C: .4byte 0x0000bc96\n"
                "_080F6A30: .4byte 0x0000bc90\n"
                "_080F6A34: .4byte 0x0000bc91\n"
                "_080F6A38:\n"
                "\tadds r0, r2, 0x1\n"
                "\tb _080F69F8\n"
                "_080F6A3C:\n"
                "\tsubs r0, 0x1\n"
                "\tb _080F69F8\n"
                "_080F6A40:\n"
                "\tmovs r2, 0\n"
                "\tmov r12, r2\n"
                "_080F6A44:\n"
                "\tmov r0, r12\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1");
}
#endif //NONMATCHING

void sub_80F6A4C(s8 a0)
{
    gPokenavStructPtr->unk876E += a0;
    if (gPokenavStructPtr->unk876E < 0)
    {
        gPokenavStructPtr->unk876E = gPokenavStructPtr->unk8774;
    }
    if (gPokenavStructPtr->unk876E > gPokenavStructPtr->unk8774)
    {
        gPokenavStructPtr->unk876E = 0;
    }
    gPokenavStructPtr->unkBC94 = a0;
    gPokenavStructPtr->unk87DC = gPokenavStructPtr->unk876E;
    REG_WININ = 0x3F37;
    REG_WINOUT = 0x3F3F;
    REG_WIN0H = 0x58F0;
    REG_WIN0V = 0x2060;
    gPokenavStructPtr->unk87DE = 0;
}

bool8 sub_80F6AF0(void)
{
    switch (gPokenavStructPtr->unk87DE)
    {
    case 0:
        if (!sub_80F173C())
        {
            gPokenavStructPtr->unk87DE++;
        }
        break;
    case 1:
        REG_DISPCNT |= DISPCNT_WIN0_ON;
        sub_80F1480();
        sub_80F66E0();
        gPokenavStructPtr->unk87DE++;
        break;
    case 2:
        DrawMonRibbonIcons();
        gPokenavStructPtr->unk87DE++;
        break;
    case 3:
        sub_80F13FC();
        gPokenavStructPtr->unk87DE++;
        break;
    case 4:
        sub_80F4824(gPokenavStructPtr->unk876E, 0);
        gPokenavStructPtr->unk87DE++;
        break;
    case 5:
        sub_80F2E18(0);
        gPokenavStructPtr->unk87DE++;
        break;
    case 6:
        if (!sub_80F170C())
        {
            sub_80F1438();
            REG_DISPCNT &= ~DISPCNT_WIN0_ON;
            gPokenavStructPtr->unk87DE++;
            return FALSE;
        }
        break;
    default:
        return FALSE;
    }

    return TRUE;
}
