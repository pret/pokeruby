#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "rng.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

// angel_kiss (a different variation of kiss_fountain.)
// Used in Sweet Kiss.

void sub_80D29CC(struct Sprite* sprite)
{
    sprite->data[5]++;
    sprite->pos2.x = Sin(sprite->data[3], 5);
    sprite->pos2.y = sprite->data[5] / 2;
    sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
    if (sprite->data[5] > 20)
        sprite->invisible = sprite->data[5] % 2;

    if (sprite->data[5] > 30)
        move_anim_8072740(sprite);
}

void sub_80D2A38(struct Sprite* sprite)
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
        if (sprite->data[3] > 0x46)
        {
            sprite->callback = sub_80D29CC;
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[3] = Random() % 0xB4;
        }
    }
}

// this is for the next file, but i didnt feel like deleting it from the original 80C file.
/* void sub_80D2ABC(struct Sprite* sprite)
{
    int var;
    s16 var2;
    int var3;
    if (sprite->data[3] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        StartSpriteAnim(sprite, 0);
        sprite->subpriority = sub_8079E90(gBattleAnimBankTarget) - 1;
        sprite->data[2] = 1;
    }

    sprite->data[0] += sprite->data[2];
    var = sprite->data[0] * 4;
    if (var < 0)
        var += 0xFF;

    sprite->data[1] = (sprite->data[0] * 4) -(((var) >> 8) << 8);
    if (sprite->data[1] < 0)
        sprite->data[1] = 0;

    var3 = sprite->data[1];
    var2 = sprite->data[0];
    var2 /= 4;
    sprite->pos2.x = Cos(var3, 30 - var2);
    var3 = sprite->data[1];
    var2 = sprite->data[0] / 8;
    sprite->pos2.x = Sin(var3, 10 - var2);
    if (sprite->data[1] > 0x80 && sprite->data[2] > 0)
        sprite->data[2] = 0xFFFF;
} */
