#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CAB88(struct Sprite* sprite);
static void sub_80CABC0(struct Sprite* sprite);

// seed (sprouts a sapling from a seed.)
// Used by Leech Seed.

void sub_80CAB18(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    if (GetBankSide(gBattleAnimBankAttacker))
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 0) + gBattleAnimArgs[2];
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 1) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    sub_80786EC(sprite);
    sprite->callback = sub_80CAB88;
}

void sub_80CAB88(struct Sprite* sprite)
{
    if (sub_8078718(sprite))
    {
        sprite->invisible = 1;
        sprite->data[0] = 10;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CABC0);
    }
}

void sub_80CABC0(struct Sprite* sprite)
{
    sprite->invisible = 0;
    StartSpriteAnim(sprite, 1);
    sprite->data[0] = 60;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}
