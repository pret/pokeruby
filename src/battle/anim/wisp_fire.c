#include "global.h"
#include "battle_anim.h"
#include "main.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankTarget;
// extern u8 gAnimBankAttacker;

void sub_80D5CC0(struct Sprite *sprite)
{
    if (!sprite->data[0])
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[0] += 1;
    }

    sprite->data[3] += 0xC0 * 2;
    sprite->data[4] += 0xA0;

    sprite->pos2.x = Sin(sprite->data[1], sprite->data[3] >> 8);
    sprite->pos2.y = Cos(sprite->data[1], sprite->data[4] >> 8);

    sprite->data[1] = (sprite->data[1] + 7) & 0xFF;

    if (gMain.inBattle)
        if ((u16) (sprite->data[1] - 0x40) > 0x83)
            sprite->oam.priority = sub_8079ED4(gAnimBankTarget);
        else
            sprite->oam.priority = sub_8079ED4(gAnimBankTarget) + 1;
    else
        if ((u16) (sprite->data[1] - 0x40) > 0x83)
            sprite->subpriority = 0x1D;
        else
            sprite->subpriority = 0x1F;

    if (++sprite->data[2] > 0x14)
        sprite->invisible ^= 1;

    if (sprite->data[2] == 0x1E)
        DestroyAnimSprite(sprite);
}

// void sub_80D5DDC(struct Sprite *sprite)
// {

// }