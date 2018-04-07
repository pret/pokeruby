#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u16 gBattleTypeFlags;

static void sub_80D6218(struct Sprite *);

// thunder (positions the lightning bolts)
// Used in Thunder, Thunder Punch, and Tri Attack.

void sub_80D61C8(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->callback = sub_80D6218;
}

static void sub_80D6218(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        DestroyAnimSprite(sprite);
    }
}
