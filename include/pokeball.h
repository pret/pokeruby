#ifndef GUARD_POKEBALL_H
#define GUARD_POKEBALL_H

extern const struct SpriteTemplate gBallSpriteTemplates[];

#define POKEBALL_PLAYER_SENDOUT     0xFF
#define POKEBALL_OPPONENT_SENDOUT   0xFE

void CreatePokeballSprite(u8 r0, u8 r1, u8 r2, u8 r3, u8 s1, u8 s2, u8 s3, u32 s4);
void StartHealthboxSlideIn(u8);
void LoadBallGraphics(u8);
void FreeBallGraphics(u8);
u8 sub_8047580(u8, u8, u8, u8, u8, u8, u8, u32);

#endif // GUARD_POKEBALL_H
