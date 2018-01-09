#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// osmose (I didn't want to use "absorb" as thats confusing)
// Used by Ingrain.

void sub_80CB768(struct Sprite* sprite)
{
    if (!sprite->data[0])
    {
        sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 2) + gBattleAnimArgs[0];
        sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 1) + gBattleAnimArgs[1];
        sprite->data[1] = gBattleAnimArgs[2];
        sprite->data[2] = gBattleAnimArgs[3];
        sprite->data[3] = gBattleAnimArgs[4];
    }

    sprite->data[0]++;
    sprite->pos2.x = sprite->data[1] * sprite->data[0];
    sprite->pos2.y = Sin((sprite->data[0] * 20) & 0xFF, sprite->data[2]);
    if (sprite->data[0] > sprite->data[3])
        DestroyAnimSprite(sprite);
}
