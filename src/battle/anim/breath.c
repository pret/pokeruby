#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

// breath (a puff of smoke, usually from the mouth or nose of the Pokemon.)
// Used in Swagger and Bulk Up.

void sub_80D0930(struct Sprite* sprite)
{
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + 32;
        sprite->data[1] = 0x40;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) - 32;
        sprite->data[1] = -0x40;
    }

    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->data[0] = 0x34;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sprite->callback = sub_8078394;
}
