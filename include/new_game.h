#ifndef GUARD_NEW_GAME_H
#define GUARD_NEW_GAME_H

void write_word_to_mem(u32 var, u8 *dataPtr);
void copy_word_to_mem(u8 *copyTo, u8 *copyFrom);
void set_player_trainer_id(void);
void SetDefaultOptions(void);
void ClearPokedexFlags(void);
void sub_8052DA8(void);
void sub_8052DE4(void);
void WarpToTruck(void);
void ClearSav2(void);
void sub_8052E4C(void);
void NewGameInitData(void);

#endif // GUARD_NEW_GAME_H
