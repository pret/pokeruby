#if DEBUG
#include "global.h"
#include "gba/flash_internal.h"
#include "constants/species.h"
#include "constants/songs.h"
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
#include "data2.h"
#include "fieldmap.h"
#include "save.h"
#include "sound.h"

EWRAM_DATA u8 gUnknown_Debug_20389EC[0x20] = { 0 };
EWRAM_DATA u8 gUnknown_Debug_2038A0C[0x10] = { 0 };
EWRAM_DATA u8 gUnknown_Debug_2038A1C[4] = { 0 };
EWRAM_DATA u8 gUnknown_Debug_2038A20[4] = { 0 };

u8 byte_3005E30[0x20];

extern const u8 gUnknown_Debug_083F7FD4[2]; // = _("▶");
extern const u8 gUnknown_Debug_083F7FD6[8]; // = _("ゆみあくひりつ");

extern const struct SpriteSheet stru_83F8828[2];
extern const struct SpritePalette stru_83F8838[2];

void debug_80C3A50(u8 taskId);

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
        sp00[i] = CHAR_SPACE;
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

void debug_80C3800(u16 a0, u8 a1, u8 a2)
{
    u8 sp00[11];
    u8 i;

    for (i = 0; i < 10; i++)
        sp00[i] = CHAR_SPACE;
    sp00[i] = EOS;

    for (i = 0; gSpeciesNames[a0][i] != EOS && i < 10; i++)
        sp00[i] = gSpeciesNames[a0][i];

    Menu_PrintText(sp00, a1, a2);
}

u16 debug_80C3878(u8 a0, u16 a1)
{
    switch (a0)
    {
        default:
        case 0:
            if (a1 > SPECIES_BULBASAUR)
                a1--;
            else
                a1 = NUM_SPECIES - 1;
            break;
        case 1:
            if (a1 < NUM_SPECIES - 1)
                a1++;
            else
                a1 = SPECIES_BULBASAUR;
            break;
    }
    return a1;
}

u16 debug_80C38B4(u8 a0, u16 a1)
{
    switch (a0)
    {
        default:
        case 0:
            if (a1)
                a1--;
            else
                a1 = 0x52;
            break;
        case 1:
            if (a1 < 0x52)
                a1++;
            else
                a1 = 0;
            break;
    }
    return a1;
}

void debug_80C38E4(u8 a0, u8 a1, u8 a2, u8 a3, u8 a4)
{
    // u8 sp00[] = _("▶");
    u8 sp00[2];

    memcpy(sp00, gUnknown_Debug_083F7FD4, ARRAY_COUNT(gUnknown_Debug_083F7FD4));
    Menu_BlankWindowRect(a1, a2, a1, a3);
    if (a4)
        Menu_PrintText(sp00, a1, a0);
}

void debug_80C393C(void)
{
    ProgramFlashSectorAndVerify(30, (void *)gUnknown_Debug_083F7FD6);
}

void InitWatanabeDebugMenu(void)
{
    switch (gMain.state)
    {
        default:
        case 0:
            save_serialize_map();
            sub_8125E2C();
            gMain.state = 1;
            break;
        case 1:
            if (sub_8125E6C())
                gMain.state++;
            break;
        case 2:
            PlaySE(SE_SAVE);
            gMain.state++;
            break;
        case 3:
            if (!IsSEPlaying())
            {
                ScriptContext2_Disable();
                SetMainCallback2(sub_80546F0);
            }
            break;
    }
}

void InitSizeComparison(void)
{
    u8 taskId;
    debug_80C35DC();
    gReservedSpritePaletteCount = 1;
    LoadPalette(gUnknown_Debug_20389EC, 0x100, 0x20);

    {
        u16 imeBak = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = imeBak;
    }

    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    SetVBlankCallback(debug_80C3758);
    SetMainCallback2(debug_80C370C);
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_OBJ_ON;
    taskId = CreateTask(debug_80C3A50, 0);
    gTasks[taskId].data[0] = 0xfc;
}

#endif
