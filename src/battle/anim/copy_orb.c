#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

// copy_orb
// Used in Mimic.

void sub_80CB4CC(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    {
        if (GetBankSide(gBattleAnimBankTarget) == 0)
        {
            s16 a = gBattleAnimArgs[0];
            gBattleAnimArgs[0] = -a;
        }

        sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 0) + gBattleAnimArgs[0];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 1) + gBattleAnimArgs[1];
        sprite->invisible = 1;
        sprite->data[0]++;
        break;
    }
    case 1:
    {
        sprite->invisible = 0;
        if (sprite->affineAnimEnded)
        {
            ChangeSpriteAffineAnim(sprite, 1);
            sprite->data[0] = 25;
            sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 2);
            sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3);
            sprite->callback = sub_8078CC0;
            StoreSpriteCallbackInData(sprite, move_anim_8072740);
            break;
        }
    }
    }
}
