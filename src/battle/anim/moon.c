#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CE354(struct Sprite* sprite);

// moon (shows a moon image.)
// Used in Moonlight.

void sub_80CE30C(struct Sprite* sprite)
{
    if (NotInBattle())
    {
        sprite->pos1.x = 0x30;
        sprite->pos1.y = 0x28;
    }
    else
    {
        sprite->pos1.x = gBattleAnimArgs[0];
        sprite->pos1.y = gBattleAnimArgs[1];
    }

    sprite->oam.shape = 0;
    sprite->oam.size = 3;
    sprite->data[0] = 0;
    sprite->callback = sub_80CE354;
}

void sub_80CE354(struct Sprite* sprite)
{
    if (sprite->data[0])
        move_anim_8072740(sprite);
}
