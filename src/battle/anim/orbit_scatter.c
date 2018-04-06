#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void AnimOrbitScatterStep(struct Sprite* sprite);

// Moves orbs away from the mon, based on where they are in their orbit.
// Used in MOVE_HIDDEN_POWER.
// arg 0: initial wave offset
void AnimOrbitScatter(struct Sprite* sprite)
{
    sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 3);
    sprite->data[0] = Sin(gBattleAnimArgs[0], 10);
    sprite->data[1] = Cos(gBattleAnimArgs[0], 7);
    sprite->callback = AnimOrbitScatterStep;
}

static void AnimOrbitScatterStep(struct Sprite* sprite)
{
    sprite->pos2.x += sprite->data[0];
    sprite->pos2.y += sprite->data[1];
    if (sprite->pos1.x + sprite->pos2.x + 16 > 0x110u || sprite->pos1.y + sprite->pos2.y > 0xA0 || sprite->pos1.y + sprite->pos2.y < -16)
        DestroyAnimSprite(sprite);
}
