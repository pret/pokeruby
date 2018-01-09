#ifndef GUARD_MORI_DEBUG_MENU_H
#define GUARD_MORI_DEBUG_MENU_H

bool8 sub_8083D4C(void);
u8 MoriDebugMenu_SearchChild(u8 a1, u8 a2, u8 *ptr);
u8 MoriDebugMenu_Egg(void);
u8 MoriDebugMenu_MaleEgg(void);
u8 MoriDebugMenu_1000Steps(void);
u8 MoriDebugMenu_10000Steps(void);
u8 MoriDebugMenu_MoveTutor(void);
u8 MoriDebugMenu_BreedEgg(void);
u8 MoriDebugMenu_LongName(void);
u8 MoriDebugMenu_PokeblockCase(void);
bool8 MoriDebugMenuProcessInput(void);
s8 InitMoriDebugMenu(void);

#endif // GUARD_MORI_DEBUG_MENU_H
