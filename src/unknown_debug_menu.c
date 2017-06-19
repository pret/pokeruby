#include "global.h"
#include "menu.h"

extern u8 gUnknown_02024D1E[];

extern u8 (*gCallback_03004AE8)(void);

extern const struct MenuAction gUnknown_0842C29C[];

static u8 sub_814A464(void);

int unref_sub_814A414(void)
{
    MenuZeroFillScreen();
    MenuDrawTextWindow(0, 0, 16, 18);
    PrintMenuItems(2, 1, 8, gUnknown_0842C29C);
    InitMenu(0, 1, 1, 8, 0, 15);
    gCallback_03004AE8 = sub_814A464;
    return 0;
}

static u8 sub_814A464(void)
{
    s8 result = ProcessMenuInput();
    if (result == -2)
    {
        return 0;
    }
    else if (result == -1)
    {
        CloseMenu();
        return 1;
    }
    else
    {
        gUnknown_02024D1E[0] = result;
        gCallback_03004AE8 = gUnknown_0842C29C[result].func;
        return 0;
    }
}

u8 sub_814A4B8(void)
{
    gSaveBlock2.filler_A8.var_4AE = 3;
    gSaveBlock2.filler_A8.var_4AF = 3;
    gSaveBlock2.filler_A8.var_4B4 = gUnknown_02024D1E[0] + 1;
    gSaveBlock2.filler_A8.var_4B6 = gUnknown_02024D1E[0] + 1;
    gSaveBlock2.filler_A8.var_4B0 = 1;
    gSaveBlock2.filler_A8.var_4B2 = 1;
    CloseMenu();
    return 1;
}
