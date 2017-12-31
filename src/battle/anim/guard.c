#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u16 gBattleTypeFlags;

// guard (moves guard rings upwards)
// Used in Safeguard.

void sub_80D3014(struct Sprite *sprite)
{
    if ((gBattleTypeFlags & 1) && IsAnimBankSpriteVisible(gAnimBankAttacker ^ 2))
    {
        sub_807A3FC(gAnimBankAttacker, 0, &sprite->pos1.x, &sprite->pos1.y);
        sprite->pos1.y += 40;

        StartSpriteAffineAnim(sprite, 1);
    }
    else
    {
        sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 0);
        sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 1) + 40;
    }

    sprite->data[0] = 13;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[4] = sprite->pos1.y - 72;

    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}
