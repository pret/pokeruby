#ifndef GUARD_PLAYER_PC_H
#define GUARD_PLAYER_PC_H

void NewGameInitPCItems(void);
void InitPlayerPCMenu(u8 taskId);
void PlayerPCProcessMenuInput(u8 taskId);
void InitItemStorageMenu(u8);
void ItemStorageMenuPrint(u8 *);
void ItemStorageMenuProcessInput(u8);
void sub_813A240(u8);
void sub_813A280(u8);
void sub_813A468(u8);
void sub_813A4B4(u8);
void HandleQuantityRolling(u8);
void sub_813A6FC(u8);
void sub_813A794(u8);
void sub_813A8F0(u8);
void sub_813A984(u8);
void sub_813A9EC(u8);
void sub_813AA30(u8, u8);
void sub_813ABE8(u8);
void sub_813AD58(u16);
void sub_813AE0C(u8);
void sub_813AE6C(u8, u8);
u8 sub_813AF3C(void);
void sub_813AF78(void);
void sub_813B108(u8);
void sub_813B174(u8);

#endif // GUARD_PLAYER_PC_H
