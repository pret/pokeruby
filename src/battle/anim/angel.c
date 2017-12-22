#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

// angel (a little angel descends from somewhere towards a position)
// Used in Sweet Kiss.

void sub_80D2938(struct Sprite* sprite)
{
    s16 r5;
    if (sprite->data[0] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    sprite->data[0]++;
    r5 = (sprite->data[0] * 10) & 0xFF;
    sprite->pos2.x = Sin(r5, 0x50) >> 8;
    if (sprite->data[0] <= 0x4F)
        sprite->pos2.y = (sprite->data[0] / 2) + (Cos(r5, 0x50) >> 8);

    if (sprite->data[0] > 0x5A)
    {
        sprite->data[2]++;
        sprite->pos2.x -= sprite->data[2] / 2;
    }

    if (sprite->data[0] > 0x64)
        move_anim_8072740(sprite);
}
