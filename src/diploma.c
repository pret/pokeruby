#include "global.h"
#include "asm.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "pokedex.h"
#include "rom4.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"

extern u8 gDiplomaTiles[];
extern u8 gDiplomaTilemap[];
extern u8 gDiplomaPalettes[];
extern u8 gOtherText_NationalDex[];
extern u8 gOtherText_HoennDex[];
extern u8 gOtherText_DiplomaCertificationGameFreak[];

static void VBlankCB(void);
static void MainCB2(void);
static void Task_DiplomaFadeIn(u8);
static void Task_DiplomaWaitForKeyPress(u8);
static void Task_DiplomaFadeOut(u8);
static void DisplayDiplomaText(void);

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_8145D88(void)
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
    
    remove_some_task();
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    LoadPalette(gDiplomaPalettes, 0, 64);
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    DisplayDiplomaText();
    BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
    
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
    REG_BG3CNT = 0x4603;
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
    if(!gPaletteFade.active)
        gTasks[taskId].func = Task_DiplomaWaitForKeyPress;
}

static void Task_DiplomaWaitForKeyPress(u8 taskId)
{
    if(gMain.newKeys & (A_BUTTON | B_BUTTON))
    {
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
        gTasks[taskId].func = Task_DiplomaFadeOut;
    }
}

static void Task_DiplomaFadeOut(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        DestroyTask(taskId);
        SetMainCallback2(sub_80546F0);
    }
}

static void DisplayDiplomaText(void)
{
    if(sub_8090FF4())
    {
        REG_BG3HOFS = 256;
        StringCopy(gStringVar1, gOtherText_NationalDex);
    }
    else
    {
        REG_BG3HOFS = 0;
        StringCopy(gStringVar1, gOtherText_HoennDex);
    }
    MenuPrint(gOtherText_DiplomaCertificationGameFreak, 6, 2);
}