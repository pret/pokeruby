#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"

// sunlight (creates sunlight orbs)
// Used in Sunny Day

void sub_80D517C(struct Sprite *sprite)
{
    sprite->pos1.x = 0;
    sprite->pos1.y = 0;
    sprite->data[0] = 60;
    sprite->data[2] = 140;
    sprite->data[4] = 80;
    sprite->callback = StartTranslateAnimSpriteByDeltas;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}
