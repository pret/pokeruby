#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

// cyclone (creates a circling motion like a cyclone, usually a wind sprite.)
// Used in Razor Wind.

void sub_80D0118(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
        sprite->pos1.y += 16;

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[5];
    sprite->data[3] = gBattleAnimArgs[6];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->callback = sub_8078114;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sprite->callback(sprite);
}
