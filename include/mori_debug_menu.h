#ifndef GUARD_MORI_DEBUG_MENU_H
#define GUARD_MORI_DEBUG_MENU_H

#include "gba/types.h"

s8 sub_8083D4C();
u8 MoriDebugMenu_SearchChild(u8 a1, u8 a2, u8 *ptr);
s8 MoriDebugMenu_Egg();
s8 MoriDebugMenu_MaleEgg();
s8 MoriDebugMenu_1000Steps();
s8 MoriDebugMenu_10000Steps();
s8 MoriDebugMenu_MoveTutor();
s8 MoriDebugMenu_BreedEgg();
s8 MoriDebugMenu_LongName();
s8 MoriDebugMenu_PokeblockCase();
s8 MoriDebugMenuProcessInput();
s8 InitMoriDebugMenu();


#endif // GUARD_MORI_DEBUG_MENU_H
