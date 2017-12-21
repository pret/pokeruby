#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[8];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80D6278(struct Sprite *);

// beta_beat_up

void sub_80D6234(struct Sprite *sprite)
{
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }

    sprite->callback = sub_80D6278;
}

static void sub_80D6278(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        move_anim_8074EE0(sprite);
    }
}
