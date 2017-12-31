#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80D1FA4(struct Sprite* sprite);

// blow_kiss (a heart floating across the screen.)
// Used in Attract.

void sub_80D1F58(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = 0x5F;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3);
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->callback = sub_80D1FA4;
}

void sub_80D1FA4(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) == 0)
    {
        sprite->pos2.y += Sin(sprite->data[5], 14);
        sprite->data[5] = (sprite->data[5] + 4) & 0xFF;
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}
