#include "global.h"
#include "field_region_map.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "region_map.h"
#include "sprite.h"
#include "strings2.h"
#include "text.h"
#include "ewram.h"

struct RegionMapStruct
{
    u8 str[0x16];
    u8 unk16;
    u8 filler[0x869];
};

struct UnkStruct
{
    MainCallback callback;
    u8 filler[4];
    // This should be RegionMap, but I can't do that because it overlaps unk888.
    struct RegionMapStruct unk8;
    u16 unk888;
};

void FieldInitRegionMap(MainCallback callback)
{
    SetVBlankCallback(NULL);
    ewram0_5.unk888 = 0;
    ewram0_5.callback = callback;
    SetMainCallback2(CB2_FieldInitRegionMap);
}

void CB2_FieldInitRegionMap(void)
{
    REG_DISPCNT = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    ResetSpriteData();
    FreeAllSpritePalettes();
    // TODO: remove this cast
    InitRegionMap((void *)&ewram0_5.unk8, 0);
    CreateRegionMapPlayerIcon(0, 0);
    CreateRegionMapCursor(1, 1);
    Text_LoadWindowTemplate(&gWindowTemplate_81E709C);
    InitMenuWindow(&gWindowTemplate_81E709C);
    Menu_EraseScreen();
    REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(31) | BGCNT_16COLOR | BGCNT_TXT256x256;
    Menu_DrawStdWindowFrame(21, 0, 29, 3);
    MenuPrint_Centered(gOtherText_Hoenn, 0x16, 1, 0x38);
    Menu_DrawStdWindowFrame(16, 16, 29, 19);
    sub_813F0C8();
    SetMainCallback2(CB2_FieldRegionMap);
    SetVBlankCallback(VBlankCB_FieldRegionMap);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
}

void VBlankCB_FieldRegionMap(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_FieldRegionMap(void)
{
    sub_813EFDC();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_813EFDC(void)
{
    switch (ewram0_5.unk888)
    {
    case 0:
        REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
        ewram0_5.unk888++;
        break;
    case 1:
        if (!gPaletteFade.active)
            ewram0_5.unk888++;
        break;
    case 2:
        switch (sub_80FAB60())
        {
        case 3:
            sub_813F0C8();
            break;
        case 4:
        case 5:
            ewram0_5.unk888++;
        }
        break;
    case 3:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        ewram0_5.unk888++;
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            FreeRegionMapIconResources();
            SetMainCallback2(ewram0_5.callback);
        }
        break;
    }
}

void sub_813F0C8(void)
{
    Menu_BlankWindowRect(17, 17, 28, 18);
    if (ewram0_5.unk8.unk16)
        Menu_PrintText(ewram0_5.unk8.str, 17, 17);
}
