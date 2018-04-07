#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80CE3B0(struct Sprite* sprite);

// twinkle (a tiny twinkling star appears above the Pokemon and descends toward the Pokemon.)
// Used in Moonlight.

void sub_80CE36C(struct Sprite* sprite)
{
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = gBattleAnimArgs[1];
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 1;
    sprite->callback = sub_80CE3B0;
}

void sub_80CE3B0(struct Sprite* sprite)
{
    if (++sprite->data[1] > 1)
    {
        sprite->data[1] = 0;
        if (sprite->data[2] <= 0x77)
        {
            sprite->pos1.y++;
            sprite->data[2]++;
        }
    }

    if (sprite->data[0])
        DestroyAnimSprite(sprite);
}
