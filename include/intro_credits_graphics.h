#ifndef GUARD_INTRO_CREDITS_GRAPHICS_H
#define GUARD_INTRO_CREDITS_GRAPHICS_H

extern const struct CompressedSpriteSheet gIntro2BrendanSpriteSheet[];
extern const struct CompressedSpriteSheet gIntro2MaySpriteSheet[];
extern const struct CompressedSpriteSheet gIntro2BicycleSpriteSheet[];
extern const struct CompressedSpriteSheet gIntro2LatiosSpriteSheet[];
extern const struct CompressedSpriteSheet gIntro2LatiasSpriteSheet[];
extern const struct SpritePalette gIntro2SpritePalettes[];
extern const struct CompressedSpriteSheet gUnknown_08416E24[];
extern const struct CompressedSpriteSheet gUnknown_08416E34[];

void load_intro_part2_graphics(u8 a);
void sub_8148C78(u8 a);
void LoadCreditsSceneGraphics(u8);
void SetCreditsSceneBgCnt(u8);
u8 CreateBicycleBgAnimationTask(u8 a, u16 b, u16 c, u16 d);
void sub_8148F3C(u8);
void CycleSceneryPalette(u8);
u8 CreateIntroBrendanSprite(s16 a, s16 b);
u8 CreateIntroMaySprite(s16 a, s16 b);
u8 intro_create_latios_sprite(s16 a, s16 b);
u8 intro_create_latias_sprite(s16 a, s16 b);

#endif // GUARD_INTRO_CREDITS_GRAPHICS_H
