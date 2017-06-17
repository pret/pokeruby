#ifndef GUARD_TITLE_SCREEN_H
#define GUARD_TITLE_SCREEN_H

#include "sprite.h"

extern const u16 gUnknown_08393E64[];

void SpriteCallback_VersionBannerLeft(struct Sprite *sprite);
void SpriteCallback_VersionBannerRight(struct Sprite *sprite);
void SpriteCallback_PressStartCopyrightBanner(struct Sprite *sprite);
void SpriteCallback_PokemonLogoShine(struct Sprite *sprite);

void CB2_InitTitleScreen(void);

#endif // GUARD_TITLE_SCREEN_H
