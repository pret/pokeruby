#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// copy_orb
// Used in Mimic.

void sub_80CB4CC(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    {
        if (GetBattlerSide(gAnimBankTarget) == 0)
        {
            s16 a = gBattleAnimArgs[0];
            gBattleAnimArgs[0] = -a;
        }

        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 0) + gBattleAnimArgs[0];
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 1) + gBattleAnimArgs[1];
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
            sprite->data[2] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
            sprite->data[4] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
            sprite->callback = sub_8078CC0;
            StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
            break;
        }
    }
    }
}
