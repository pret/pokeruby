#include "global.h"
#include "task.h"
#include "songs.h"
#include "menu.h"
#include "main.h"
#include "sprite.h"
#include "palette.h"
#include "sound.h"

extern u8 gSystemText_ClearAllSaveDataPrompt[];
extern u8 gSystemText_ClearingData[];
extern u8 *gUnknown_08376D74[][2];

void c2_clear_save_data_screen_2(void);
void sub_814881C(void);
void sub_8148830(u8);
void sub_81488BC(u8);
void sub_8148930(u8);
void sub_8148954(void);
static void VBlankCB_InitMenu(void);
u8 sub_8148970(void);
void sub_8148B34(void);

void c2_clear_save_data_screen_2(void)
{
    if (sub_8148970())
    {
        CreateTask(sub_8148830, 0);
    }
}

void sub_814881C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_8148830(u8 taskId)
{
    ResetSpriteData();

    REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;

    SetVBlankCallback(sub_814881C);
    MenuDrawTextWindow(2, 14, 27, 19);
    MenuPrint(gSystemText_ClearAllSaveDataPrompt, 3, 15);

    MenuDrawTextWindow(2, 1, 8, 6);
    PrintMenuItems(3, 2, 2, gUnknown_08376D74);
    InitMenu(0, 3, 2, 2, 1, 5);

    gTasks[taskId].func = sub_81488BC;
}

void sub_81488BC(u8 taskId)
{
    switch (ProcessMenuInputNoWrap_())
    {
    case 0:
        PlaySE(SE_SELECT);
        sub_8071F40(gSystemText_ClearingData);
        gTasks[taskId].func = sub_8148930;
        break;
    case -1:
    case 1:
        PlaySE(SE_SELECT);
        DestroyTask(taskId);
        SetMainCallback2(sub_8148B34);
        break;
    }
    AnimateSprites();
    BuildOamBuffer();
}

void sub_8148930(u8 r0_in)
{
    calls_flash_erase_block();
    DestroyTask(r0_in);
    SetMainCallback2(sub_8148B34);
}

void sub_8148954(void)
{
    RunTasks();
    UpdatePaletteFade();
}

static void VBlankCB_InitMenu(void)
{
    TransferPlttBuffer();
}

u8 sub_8148970(void)
{
    u16 i;
    u16 ime;

    switch (gMain.state)
    {
        case 0:
        default:
            SetVBlankCallback(NULL);

            REG_DISPCNT = 0;
            REG_BG0HOFS = 0;
            REG_BG0VOFS = 0;
            REG_BG3HOFS = 0;
            REG_BG3VOFS = 0;
            REG_WIN0H = 0;
            REG_WIN0V = 0;
            REG_WININ = 0;
            REG_WINOUT = 0;
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;
            REG_BLDY = 0;

            DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
            DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
            DmaFill16(3, 0, (void *)(PLTT + 2), PLTT_SIZE - 2);

            ResetPaletteFade();

            gPlttBufferUnfaded[0] = 0x7fff;
            gPlttBufferFaded[0] = 0x7fff;
            gPlttBufferUnfaded[1] = 0x3945;
            gPlttBufferFaded[1] = 0x3945;

            i = 0;
            do
            {
                ((vu16 *)(VRAM + 0x20))[i] = 0x1111;
                i++;
            } while (i < 0x10);

            i = 0;
            do
            {
                ((vu16 *)(VRAM + 0x3800))[i] = 0x0001;
                i++;
            } while (i < 0x500);

            ResetTasks();
            ResetSpriteData();

            SetUpWindowConfig(&gWindowConfig_81E6C3C);
            InitMenuWindow(&gWindowConfig_81E6CE4);
            BeginNormalPaletteFade(-1, 0, 0x10, 0, 0xffff);

            ime = REG_IME;
            REG_IME = 0;
            REG_IE |= INTR_FLAG_VBLANK;
            REG_IME = ime;
            REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;

            SetVBlankCallback(VBlankCB_InitMenu);

            REG_BG3CNT = 0x0703;
            REG_DISPCNT = 0x0900;
            gMain.state = 1;
            return 0;
        case 1:
            UpdatePaletteFade();
            if (gPaletteFade.active)
                return 0;
            SetMainCallback2(sub_8148954);
            return 1;
    }
}

void sub_8148B34(void)
{
    switch (gMain.state)
    {
        case 0:
        default:
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0xffff);
            gMain.state = 1;
            break;
        case 1:
            UpdatePaletteFade();
            if (gPaletteFade.active)
                return;
            DoSoftReset();
            break;
    }
}
