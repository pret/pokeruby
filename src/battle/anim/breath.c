#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// breath (a puff of smoke, usually from the mouth or nose of the Pokemon.)
// Used in Swagger and Bulk Up.

void sub_80D0930(struct Sprite* sprite)
{
    if (GetBankSide(gAnimBankAttacker) == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 2) + 32;
        sprite->data[1] = 0x40;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 2) - 32;
        sprite->data[1] = -0x40;
    }

    sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 3);
    sprite->data[0] = 0x34;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078394;
}
