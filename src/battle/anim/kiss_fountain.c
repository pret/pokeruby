#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

// kiss_fountain (a series of hearts pour out of a target Pokemon.)
// Used in Attract and Sweet Kiss.

void sub_80D1FDC(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[1];
        sprite->data[0]++;
    }
    else
    {
        sprite->data[4] += sprite->data[1];
        sprite->pos2.x = sprite->data[4] >> 8;
        sprite->pos2.y = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
        if (sprite->data[3] > 0x64)
        {
            sprite->invisible = sprite->data[3] % 2;
        }

        if (sprite->data[3] > 0x78)
        {
            move_anim_8072740(sprite);
        }
    }
}
