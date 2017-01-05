#ifndef GUARD_WALLCLOCK_H
#define GUARD_WALLCLOCK_H

#include "sprite.h"

void CB2_StartWallClock(void);
void CB2_ViewWallClock(void);

void sub_810B05C(struct Sprite *sprite);
void sub_810B0F4(struct Sprite *sprite);
void sub_810B18C(struct Sprite *sprite);
void sub_810B230(struct Sprite *sprite);

#endif // GUARD_WALLCLOCK_H
