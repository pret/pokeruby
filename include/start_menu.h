#ifndef GUARD_STARTER_CHOOSE_H
#define GUARD_STARTER_CHOOSE_H

#include "gba/types.h"

//Public functions
void CreateStartMenuTask(void (*func)(u8));
void sub_80712B4(u8 taskId);
void sub_8071310();
u8 StartMenu_PokedexCallback();
u8 StartMenu_PokemonCallback();
u8 StartMenu_BagCallback();
u8 StartMenu_PokenavCallback();
u8 StartMenu_PlayerCallback();
u8 StartMenu_SaveCallback();
u8 StartMenu_OptionCallback();
u8 StartMenu_ExitCallback();
u8 StartMenu_RetireCallback();
u8 StartMenu_PlayerLinkCallback();
void InitSaveDialog();
void sub_8071B28();
void sub_8071C20();
void AppendToList(u8 *list, u8 *pindex, u32 value);

#endif // GUARD_STARTER_CHOOSE_H
