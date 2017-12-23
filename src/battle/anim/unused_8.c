#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CF490(struct Sprite* sprite);
static void sub_80CF4B8(struct Sprite* sprite);

// unused_8

void sub_80CF458(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[4];
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, sub_80CF490);
}

void sub_80CF490(struct Sprite* sprite)
{
    sprite->data[0] = sprite->data[1];
    sprite->data[2] = sprite->pos1.x;
    sprite->data[4] = sprite->pos1.y + 15;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, sub_80CF4B8);
}

void sub_80CF4B8(struct Sprite* sprite)
{
    if (sprite->data[5] == 0)
        move_anim_8072740(sprite);
    else
        sprite->data[5]--;
}
