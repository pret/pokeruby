#ifndef GUARD_STARTER_CHOOSE_H
#define GUARD_STARTER_CHOOSE_H

#include "sprite.h"

extern u16 gBirchBagGrassPal[32];
extern u8 gBirchBagTilemap[];
extern u8 gBirchGrassTilemap[];
extern u8 gBirchHelpGfx[];

u16 GetStarterPokemon(u16);
void CB2_ChooseStarter(void);

#endif // GUARD_STARTER_CHOOSE_H
