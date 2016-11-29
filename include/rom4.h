#ifndef GUARD_ROM4_H
#define GUARD_ROM4_H

#include "gba/types.h"

void sav12_xor_increment(u8 index);
void warp_in(void);
void warp1_set(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void sub_805363C(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void sav1_reset_battle_music_maybe(void);
u8 sav1_map_get_light_level(void);
bool8 is_light_level_1_2_3_5_or_6(u8 a1);
void CB2_LoadMap(void);

#endif // GUARD_ROM4_H
