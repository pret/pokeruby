#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u8 gObjectBankIDs[];

static void sub_80CD9D4(struct Sprite* sprite);

// unused_4
// Unknown usage.

void sub_80CD9C4(struct Sprite* sprite)
{
    sprite->data[0] = 0;
    sprite->callback = sub_80CD9D4;
}

void sub_80CD9D4(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = 0;
        sprite->data[2] = gObjectBankIDs[gAnimBankAttacker];
        sprite->data[3] = GetBankSide(gAnimBankAttacker);
        sprite->data[4] = (sprite->data[3] != 0) ? 0x200 : -0x200;
        sprite->data[5] = 0;
        sub_8078E70(sprite->data[2], 0);
        sprite->data[0]++;
    case 1:
        sprite->data[5] += sprite->data[4];
        obj_id_set_rotscale(sprite->data[2], 0x100, 0x100, sprite->data[5]);
        sub_8078F9C(sprite->data[2]);
        if (++sprite->data[1] > 3)
        {
            sprite->data[1] = 0;
            sprite->data[4] *= -1;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[5] += sprite->data[4];
        obj_id_set_rotscale(sprite->data[2], 0x100, 0x100, sprite->data[5]);
        sub_8078F9C(sprite->data[2]);
        if (++sprite->data[1] > 3)
        {
            sub_8078F40(sprite->data[2]);
            DestroyAnimSprite(sprite);
        }
        break;
    }
}
