#ifndef GUARD_NEW_GAME_H
#define GUARD_NEW_GAME_H

void write_word_to_mem(u32 a1, u8 *a2);
void sub_8052D10(u8 *a1, u8 *a2);
void set_player_trainer_id(void);
void SetDefaultOptions(void);
void sub_8052D78(void);
void sub_8052DA8(void);
void sub_8052DE4(void);
void sub_8052E04(void);
void ClearSav2(void);
void sub_8052E4C(void);
void NewGameInitData(void);

#endif // GUARD_NEW_GAME_H
