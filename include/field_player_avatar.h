#ifndef GUARD_FIELD_PLAYER_AVATAR_H
#define GUARD_FIELD_PLAYER_AVATAR_H

void player_step(u8 a, u16 b, u16 c);
void SetPlayerAvatarTransitionFlags(u16 a);
void sub_8059204(void);
void sub_80594C0(void);
void GetXYCoordsOneStepInFrontOfPlayer(s16 *x, s16 *y);
void PlayerGetDestCoords(s16 *, s16 *);
u8 player_get_direction_lower_nybble(void);
u8 player_get_direction_upper_nybble(void);
u8 TestPlayerAvatarFlags(u8);
void sub_80597E8(void);
void sub_80597F4(void);
void InitPlayerAvatar(s16 a, s16 b, u8 c, u8 d);

#endif
