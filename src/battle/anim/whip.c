#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// whip (does a hitting animation that uses a rotating sprite to invoke the sprite getting hit.)
// Used by Slam and Vine Whip.

void sub_80CC810(struct Sprite* sprite)
{
    if (sprite->animEnded)
        DestroyAnimSprite(sprite);
}

// unused, beta effect for diagonal sprite movement?
void sub_80CC82C(struct Sprite* sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80CC884(struct Sprite* sprite)
{
    if (GetBattlerSide(gAnimBankAttacker) == 0)
        StartSpriteAnim(sprite, 1);

    sprite->callback = sub_80CC810;
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
}
