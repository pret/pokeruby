#ifndef GUARD_STARTER_CHOOSE_H
#define GUARD_STARTER_CHOOSE_H

//Public functions
void CreateStartMenuTask(void (*func)(u8));
void sub_80712B4(u8 taskId);
void sub_8071310(void);
u8 StartMenu_PokedexCallback(void);
u8 StartMenu_PokemonCallback(void);
u8 StartMenu_BagCallback(void);
u8 StartMenu_PokenavCallback(void);
u8 StartMenu_PlayerCallback(void);
u8 StartMenu_SaveCallback(void);
u8 StartMenu_OptionCallback(void);
u8 StartMenu_ExitCallback(void);
u8 StartMenu_RetireCallback(void);
u8 StartMenu_PlayerLinkCallback(void);
void InitSaveDialog(void);
void sub_8071B28(void);
void sub_8071C20(void);
void AppendToList(u8 *list, u8 *pindex, u32 value);

#endif // GUARD_STARTER_CHOOSE_H
