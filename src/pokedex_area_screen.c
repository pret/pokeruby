
// Includes
#include "global.h"
#include "ewram.h"
#include "main.h"
#include "palette.h"
#include "task.h"
#include "sprite.h"
#include "region_map.h"
#include "string_util.h"
#include "text.h"

// Static type declarations

struct PokedexAreaScreenEwramStruct
{
    u8 filler_0000[4];
    u32 unk0004;
    u32 unk0008;
    u8 filler_000C[2];
    u16 unk000E;
    u8 filler_0010[0x6d8];
    struct RegionMap unk06E8;
    u8 unk0F68[16];
};

#define ePokedexAreaScreen (*(struct PokedexAreaScreenEwramStruct *)gSharedMem)

// Static RAM declarations

EWRAM_DATA u16 gUnknown_02039260 = 0;
EWRAM_DATA u16 gUnknown_02039262 = 0;
EWRAM_DATA u16 gUnknown_02039264 = 0;
EWRAM_DATA u16 gUnknown_02039266 = 0;
EWRAM_DATA u16 gUnknown_02039268 = 0;
EWRAM_DATA u16 gUnknown_0203926A = 0;

// Static ROM declarations

void CB2_UnusedPokedexAreaScreen(void);
void sub_81107DC(void);
void sub_81107F0(void);
void sub_8110814(void (*func)(void));
void sub_8110824(void);
void sub_8111084(void);
bool8 DrawAreaGlow(void);
void sub_8111288(void);

// .rodata

// .text

void UnusedPokedexAreaScreen(u16 a0, u32 a1, u32 a2)
{
    ePokedexAreaScreen.unk0004 = a1;
    ePokedexAreaScreen.unk0008 = a2;
    ePokedexAreaScreen.unk000E = a0;
    SetMainCallback2(CB2_UnusedPokedexAreaScreen);
}

void CB2_UnusedPokedexAreaScreen(void)
{
    switch (gMain.state)
    {
        case 0:
            SetVBlankCallback(NULL);
            REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_BG1_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
            ResetPaletteFade();
            ResetSpriteData();
            ResetTasks();
            FreeSpriteTileRanges();
            FreeAllSpritePalettes();
            REG_BG0HOFS = 0;
            REG_BG0VOFS = -8;
            REG_BG2VOFS = 0;
            REG_BG2HOFS = 0;
            REG_BG3HOFS = 0;
            REG_BG3VOFS = 0;
            break;
        case 1:
            InitRegionMap(&ePokedexAreaScreen.unk06E8, FALSE);
            StringFill(ePokedexAreaScreen.unk0F68, CHAR_SPACE, 16);
            break;
        case 2:
            sub_8110824();
            break;
        case 3:
            if (DrawAreaGlow())
                return;
            break;
        case 4:
            CreateRegionMapPlayerIcon(1, 1);
            sub_80FB2A4(0, -8);
            SetVBlankCallback(sub_81107DC);
            break;
        case 5:
            BeginNormalPaletteFade(0xFFFFFFEB, 0, 16, 0, 0);
            break;
        case 6:
            REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD;
            sub_8111084();
            REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
            break;
        case 7:
            sub_8110814(sub_8111288);
            SetMainCallback2(sub_81107F0);
            return;
    }
    gMain.state++;
}
