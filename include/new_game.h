#ifndef GUARD_NEW_GAME_H
#define GUARD_NEW_GAME_H

extern u8 gUnknown_020297ED;

void write_word_to_mem(u32 var, u8 *dataPtr);
void copy_word_to_mem(u8 *copyTo, u8 *copyFrom);
void InitPlayerTrainerId(void);
void SetDefaultOptions(void);
void ClearPokedexFlags(void);
void ResetContestAndMuseumWinners(void);
void sub_8052DE4(void);
void WarpToTruck(void);
void ClearSav2(void);
void sub_8052E4C(void);
void NewGameInitData(void);
void debug_sub_8057508(bool32 arg0);

#endif // GUARD_NEW_GAME_H
