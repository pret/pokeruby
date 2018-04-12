#if DEBUG
#include "global.h"
#include "debug.h"
#include "palette.h"
#include "scanline_effect.h"
#include "main.h"
#include "task.h"
#include "sprite.h"
#include "text.h"
#include "menu.h"
#include "script.h"
#include "overworld.h"

EWRAM_DATA u8 gUnknown_Debug_20389EC[0x20] = { 0 };
EWRAM_DATA u8 gUnknown_Debug_2038A0C[0x10] = { 0 };
EWRAM_DATA u8 gUnknown_Debug_2038A1C[4] = { 0 };
EWRAM_DATA u8 gUnknown_Debug_2038A20[4] = { 0 };

u8 byte_3005E30[0x20];

extern const struct SpriteSheet stru_83F8828[2];
extern const struct SpritePalette stru_83F8838[2];

void debug_69(struct Sprite *sprite)
{

}

void debug_80C35DC(void)
{
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
    DmaFill16Large(3, 0, VRAM, VRAM_SIZE, 0x1000);
    DmaFill32Defvars(3, 0, OAM, OAM_SIZE);
    DmaFill16Defvars(3, 0, PLTT, PLTT_SIZE);
    ResetPaletteFade();
    ScanlineEffect_Stop();
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade(); // I really don't want palette fade here
    FreeAllSpritePalettes();
    LoadSpriteSheet(stru_83F8828);
    LoadSpritePalette(stru_83F8838);
    Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
    InitMenuWindow(&gWindowTemplate_81E6CE4);
}

void debug_80C36F4(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void debug_80C370C(void)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(debug_80C36F4);
    }

    else
    {
        AnimateSprites();
        BuildOamBuffer();
        UpdatePaletteFade();
    }
}

void debug_80C373C(u8 taskId)
{
    DestroyTask(taskId);
    ScriptContext2_Disable();
    SetMainCallback2(sub_80546F0);
}

void debug_80C3758(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void debug_80C376C(u16 a0, u8 a1, u8 a2)
{
    u8 i;
    u8 divresult;
    u8 sp00[4];
    bool8 r4;

    for (i = 0; i < 3; i++)
        sp00[i] = 0;
    sp00[3] = EOS;

    r4 = FALSE;
    divresult = a0 / 100;
    if (divresult)
    {
        sp00[0] = CHAR_0 + divresult;
        r4 = TRUE;
    }

    divresult = (a0 % 100) / 10;
    if (divresult || r4)
    {
        sp00[1] = CHAR_0 + divresult;
    }

    sp00[2] = CHAR_0 + ((a0 % 100) % 10);

    Menu_PrintText(sp00, a1, a2);
}

#endif
