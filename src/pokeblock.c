//
// Created by scott on 6/27/2017.
//

#include "global.h"
#include "rom4.h"
#include "sprite.h"
#include "task.h"
#include "unknown_task.h"
#include "text.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "menu_helpers.h"
#include "pokeblock.h"

void sub_810B674(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
}

void sub_810B68C(void)
{
    u16 *src;
    vu16 *dest;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    src = gBGTilemapBuffers[2];
    dest = (vu16 *)(VRAM + 0x7800);
    DmaCopy16(3, src, dest, sizeof gBGTilemapBuffers[2]);
}

bool8 sub_810B998(void);
u8 sub_810BA50(s16, s16, u8);
void sub_810BC98(void);
void sub_810BD08(void);
void sub_810BB0C(void);
void sub_810BB30(void);
void sub_810BC84(u8);

bool32 sub_810B6C0(void)
{
    u16 ime;
    switch (gMain.state)
    {
        case  0:
            sub_80F9438();
            sub_80F9368();
            REG_BG2CNT = BGCNT_SCREENBASE(15) | BGCNT_CHARBASE(2) | BGCNT_PRIORITY(2);
            REG_BLDCNT = 0;
            gMain.state++;
            break;
        case  1:
            remove_some_task();
            gMain.state++;
            break;
        case  2:
            ResetPaletteFade();
            gPaletteFade.bufferTransferDisabled = TRUE;
            gMain.state++;
            break;
        case  3:
            ResetSpriteData();
            gMain.state++;
            break;
        case  4:
            if (gUnknown_02039244 != 2)
            {
                ResetTasks();
            }
            gMain.state++;
            break;
        case  5:
            SetUpWindowConfig(&gWindowConfig_81E6E34);
            gMain.state++;
            break;
        case  6:
            SetUpWindowConfig(&gWindowConfig_81E6E50);
            gMain.state++;
            break;
        case  7:
            MultistepInitMenuWindowBegin(&gWindowConfig_81E6E34);
            gMain.state++;
            break;
        case  8:
            if (MultistepInitMenuWindowContinue())
            {
                gMain.state++;
            }
            break;
        case  9:
            MultistepInitMenuWindowBegin(&gWindowConfig_81E6E50);
            gMain.state++;
            break;
        case 10:
            if (MultistepInitMenuWindowContinue())
            {
                ewram[0x1ffff] = 0;
                gMain.state++;
            }
            break;
        case 11:
            if (sub_810B998())
            {
                gMain.state++;
            }
            break;
        case 12:
            sub_80F944C();
            LoadScrollIndicatorPalette();
            CreateVerticalScrollIndicators(0, 0xb0, 0x08);
            CreateVerticalScrollIndicators(1, 0xb0, 0x98);
            gMain.state++;
            break;
        case 13:
            ewram[0x1fffe] = sub_810BA50(0x38, 0x40, 0);
            gMain.state++;
            break;
        case 14:
            sub_810BC98();
            sub_810BD08();
            gMain.state++;
            break;
        case 15:
            sub_810BB0C();
            sub_810BB30();
            sub_810BC84(gUnknown_02039248[1]);
            gMain.state++;
            break;
        case 16:
            ime = REG_IME;
            REG_IME = 0;
            REG_IE |= 1;
            REG_IME = ime;
            REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
            SetVBlankCallback(sub_810B68C);
            REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG2_ON | DISPCNT_BG1_ON | DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP;
            gMain.state++;
            break;
        case 17:
            if (sub_8055870() != TRUE)
            {
                gMain.state++;
            }
            break;
        case 18:
            BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
            gPaletteFade.bufferTransferDisabled = FALSE;
            SetMainCallback2(sub_810B674);
            return TRUE;
    }
    return FALSE;
}
