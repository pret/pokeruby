#include "mori_debug_menu.h"
#include "start_menu.h"
#include "menu.h"
#include "main.h"
#include "string_util.h"

extern u16 sub_8041870(u16);
extern void sub_810CA6C(s32);
extern u8 (*gCallback_03004AE8)(void);

extern u8 daycare_count_pokemon(u32);
extern u8 daycare_relationship_score_from_savegame(void);

struct DebugMenuAction
{
   u8 *text;
   u8 (*func)(void);
};

extern u8 gUnknown_0839B24D[];
extern u8 gUnknown_0839B255[];
extern u8 gUnknown_0839B257[];

extern struct DebugMenuAction gMoriDebugMenuActions[];

extern u8 gSpeciesNames[][11];

s8 sub_8083D4C(void)
{
     if ( gMain.newKeys & 1 )
    {
        sub_8071C20();
        return 1;
    }
    else
        return 0;
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
    if ( daycare_count_pokemon(gSaveBlock1.filler_2F9C) == 2 && daycare_relationship_score_from_savegame() )
        sub_8041940();
    sub_8071C20();

    return 1;
}

s8 MoriDebugMenu_MaleEgg(void)
{
    if ( daycare_count_pokemon(gSaveBlock1.filler_2F9C) == 2 && daycare_relationship_score_from_savegame() )
        sub_8041950();
    sub_8071C20();

    return 1;
}

s8 MoriDebugMenu_1000Steps(void)
{
    sub_8041790(1000);
    sub_8071C20();
    return 1;    
}

s8 MoriDebugMenu_10000Steps(void)
{
    sub_8041790(10000);
    sub_8071C20();
    return 1;    
}

s8 MoriDebugMenu_MoveTutor(void)
{
    sub_8132670();
    sub_8071C20();
    return 1;
}

s8 MoriDebugMenu_BreedEgg(void)
{
    u8 loopCounter;

    for(loopCounter = 0; loopCounter <= 5; loopCounter++)
    {
        //UB: Too few arguments for function 'GetMonData'
        if ( GetMonData(&gPlayerParty[loopCounter], MON_DATA_IS_EGG) )
        {
            u8 friendship = 0;
            SetMonData(&gPlayerParty[loopCounter], MON_DATA_FRIENDSHIP, &friendship);
        }
    }
    gSaveBlock1.filler_30B6 = -3;
    sub_8071C20();
    return 1;
}

s8 MoriDebugMenu_LongName(void)
{
    SetMonData(gPlayerParty, 2, &gUnknown_0839B257);
    sub_8071C20();
    return 1;
}

s8 MoriDebugMenu_PokeblockCase(void)
{
    s32 loopCounter;
    
    for(loopCounter = 0; loopCounter <= 39; loopCounter++)
        sub_810CA6C((u8)loopCounter);
    
    sub_8071C20();
    return 1;
}

s8 MoriDebugMenuProcessInput(void)
{
    s8 choice = ProcessMenuInput();

    switch (choice)
    {
    default:
        gCallback_03004AE8 = gMoriDebugMenuActions[choice].func;
        return 0;
    case -2:
        return 0;
    case -1:
        sub_8071C20();
        return 1;
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
