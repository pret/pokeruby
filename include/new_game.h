#ifndef GUARD_NEW_GAME_H
#define GUARD_NEW_GAME_H

#include "gba/types.h"

void write_word_to_mem(u32 a1, u8 *a2);
void sub_8052D10(u8 *a1, u8 *a2);
void set_player_trainer_id();
void SetDefaultOptions();
void sub_8052D78();
void sub_8052DA8();
void sub_8052DE4();
void sub_8052E04();
void ClearSav2();
void sub_8052E4C();
void NewGameInitData();

#endif // GUARD_NEW_GAME_H
