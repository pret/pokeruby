#include "global.h"
#include "diploma.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "pokedex.h"
#include "overworld.h"
#include "sprite.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "text.h"
#include "scanline_effect.h"

static void VBlankCB(void);
static void MainCB2(void);
static void Task_DiplomaFadeIn(u8);
static void Task_DiplomaWaitForKeyPress(u8);
static void Task_DiplomaFadeOut(u8);
static void DisplayDiplomaText(void);

static const u16 gDiplomaPalettes[][16] =
{
    INCBIN_U16("graphics/misc/diploma_national.gbapal"),
    INCBIN_U16("graphics/misc/diploma_hoenn.gbapal"),
};

static const u8 gDiplomaTilemap[] = INCBIN_U8("graphics/misc/diploma_map.bin.lz");
static const u8 gDiplomaTiles[] = INCBIN_U8("graphics/misc/diploma.4bpp.lz");

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_ShowDiploma(void)
{
    u32 savedIme;

    SetVBlankCallback(NULL);

    REG_DISPCNT = 0;
    REG_BG3CNT = 0;
    REG_BG2CNT = 0;
    REG_BG1CNT = 0;
    REG_BG0CNT = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;

    DmaFill16(3, 0, VRAM, VRAM_SIZE);
    DmaFill32(3, 0, OAM, OAM_SIZE);
    DmaFill16(3, 0, PLTT, PLTT_SIZE);

    LZ77UnCompVram(gDiplomaTiles, (void *)VRAM);
    LZ77UnCompVram(gDiplomaTilemap, (void *)(VRAM + 0x3000));

    ScanlineEffect_Stop();
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    LoadPalette(gDiplomaPalettes, 0, 64);
    Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
    InitMenuWindow(&gMenuTextWindowTemplate);
    DisplayDiplomaText();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));

    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;

    SetVBlankCallback(VBlankCB);
    SetMainCallback2(MainCB2);

    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(6) | BGCNT_16COLOR | BGCNT_TXT512x256;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;

    CreateTask(Task_DiplomaFadeIn, 0);
}

static void MainCB2(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void Task_DiplomaFadeIn(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = Task_DiplomaWaitForKeyPress;
}

static void Task_DiplomaWaitForKeyPress(u8 taskId)
{
    if (gMain.newKeys & (A_BUTTON | B_BUTTON))
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gTasks[taskId].func = Task_DiplomaFadeOut;
    }
}

static void Task_DiplomaFadeOut(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        SetMainCallback2(sub_80546F0);
    }
}

static void DisplayDiplomaText(void)
{
    if (CompletedNationalPokedex())
    {
        REG_BG3HOFS = 256;
        StringCopy(gStringVar1, gOtherText_NationalDex);
    }
    else
    {
        REG_BG3HOFS = 0;
        StringCopy(gStringVar1, gOtherText_HoennDex);
    }
    Menu_PrintText(gOtherText_DiplomaCertificationGameFreak, 6, 2);
}