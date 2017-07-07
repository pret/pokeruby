#include "global.h"
#include "mori_debug_menu.h"
#include "data2.h"
#include "daycare.h"
#include "learn_move.h"
#include "link.h"
#include "main.h"
#include "menu.h"
#include "pokeblock.h"
#include "start_menu.h"
#include "string_util.h"

#define SIO_MULTI_CNT ((struct SioMultiCnt *)REG_ADDR_SIOCNT)

extern u8 gUnknown_03004DA0[];
extern u8 (*gCallback_03004AE8)(void);

extern u8 gUnknown_0839B22C[][3];
extern u8 gUnknown_0839B24A[];
extern u8 gUnknown_0839B24D[];
extern u8 gUnknown_0839B255[];
extern u8 gUnknown_0839B257[];

extern const struct MenuAction gMoriDebugMenuActions[];

void unref_sub_8083CF0(void)
{
    int i;
    int id = SIO_MULTI_CNT->id;
    gUnknown_03004DA0[0] = EOS;
    StringAppend(gUnknown_03004DA0, gUnknown_0839B24A);
    for (i = 0; i < 10; i++)
        if ((word_3002910[id ^ 1] >> i) & 1)
            StringAppend(gUnknown_03004DA0, gUnknown_0839B22C[i]);
}

bool8 sub_8083D4C(void)
{
     if ( gMain.newKeys & A_BUTTON )
    {
        CloseMenu();
        return TRUE;
    }
    else
        return FALSE;
}

u8 MoriDebugMenu_SearchChild(u8 a1, u8 a2, u8 *ptr)
{
    u8 localPtr[52];
    u16 monData;
    u16 var;

    monData = GetMonData(gPlayerParty, 11, ptr);
    var = sub_8041870(monData);
    StringCopy(localPtr, gSpeciesNames[monData]);
    StringAppend(localPtr, gUnknown_0839B24D);
    StringAppend(localPtr, gSpeciesNames[var]);
    StringAppend(localPtr, gUnknown_0839B255);
    MenuZeroFillScreen();
    MenuDrawTextWindow(0, 14, 30, 19);
    MenuPrint(localPtr, 1, 15);
    gCallback_03004AE8 = sub_8083D4C;
    return 0;
}

s8 MoriDebugMenu_Egg(void)
{
    if ( Daycare_CountPokemon(gSaveBlock1.daycareData) == 2 && daycare_relationship_score_from_savegame() )
        sub_8041940();
    CloseMenu();

    return 1;
}

s8 MoriDebugMenu_MaleEgg(void)
{
    if ( Daycare_CountPokemon(gSaveBlock1.daycareData) == 2 && daycare_relationship_score_from_savegame() )
        sub_8041950();
    CloseMenu();

    return 1;
}

s8 MoriDebugMenu_1000Steps(void)
{
    sub_8041790(1000);
    CloseMenu();
    return 1;
}

s8 MoriDebugMenu_10000Steps(void)
{
    sub_8041790(10000);
    CloseMenu();
    return 1;
}

s8 MoriDebugMenu_MoveTutor(void)
{
    sub_8132670();
    CloseMenu();
    return 1;
}

s8 MoriDebugMenu_BreedEgg(void)
{
    u8 loopCounter;

    for (loopCounter = 0; loopCounter <= 5; loopCounter++)
    {
        //UB: Too few arguments for function 'GetMonData'
        if ( GetMonData(&gPlayerParty[loopCounter], MON_DATA_IS_EGG) )
        {
            u8 friendship = 0;
            SetMonData(&gPlayerParty[loopCounter], MON_DATA_FRIENDSHIP, &friendship);
        }
    }
    gSaveBlock1.filler_30B6 = -3;
    CloseMenu();
    return 1;
}

s8 MoriDebugMenu_LongName(void)
{
    SetMonData(gPlayerParty, MON_DATA_NICKNAME, gUnknown_0839B257);
    CloseMenu();
    return 1;
}

s8 MoriDebugMenu_PokeblockCase(void)
{
    s32 loopCounter;

    for (loopCounter = 0; loopCounter <= 39; loopCounter++)
        sub_810CA6C(loopCounter);

    CloseMenu();
    return 1;
}

bool8 MoriDebugMenuProcessInput(void)
{
    s8 choice = ProcessMenuInput();

    switch (choice)
    {
    default:
        gCallback_03004AE8 = gMoriDebugMenuActions[choice].func;
        return FALSE;
    case -2:
        return FALSE;
    case -1:
        CloseMenu();
        return TRUE;
    }
}

s8 InitMoriDebugMenu(void)
{
    MenuZeroFillScreen();
    MenuDrawTextWindow(0, 0, 10, 19);
    PrintMenuItems(1, 1, 9, gMoriDebugMenuActions);
    InitMenu(0, 1, 1, 9, 0, 9);
    gCallback_03004AE8 = MoriDebugMenuProcessInput;
    return 0;
}
