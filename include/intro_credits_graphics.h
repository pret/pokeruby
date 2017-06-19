#ifndef GUARD_INTRO_CREDITS_GRAPHICS_H
#define GUARD_INTRO_CREDITS_GRAPHICS_H

extern const struct CompressedSpriteSheet gIntro2BrendanSpriteSheet;
extern const struct CompressedSpriteSheet gIntro2MaySpriteSheet;
extern const struct CompressedSpriteSheet gIntro2BicycleSpriteSheet;
extern const struct CompressedSpriteSheet gIntro2LatiosSpriteSheet;
extern const struct CompressedSpriteSheet gIntro2LatiasSpriteSheet;
extern const struct SpritePalette gIntro2SpritePalettes[];
extern const struct CompressedSpriteSheet gUnknown_08416E24;
extern const struct CompressedSpriteSheet gUnknown_08416E34;

void load_intro_part2_graphics(/*TODO: arg types*/);
void sub_8148C78(/*TODO: arg types*/);
void sub_8148CB0(u8);
void sub_8148E90(u8);
u8 sub_8148EC0(/*TODO: arg types*/);
void sub_8149020(/*TODO: arg types*/);
u8 intro_create_brendan_sprite(/*TODO: arg types*/);
u8 intro_create_may_sprite(/*TODO: arg types*/);
u8 intro_create_latios_sprite(/*TODO: arg types*/);
u8 intro_create_latias_sprite(/*TODO: arg types*/);

#endif // GUARD_INTRO_CREDITS_GRAPHICS_H
