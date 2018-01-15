#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// perceive (shows a sparkle in a set of eyes, usually for heightened perception.)
// Used in Glare, Tickle, and Scary Face.

void sub_80D2904(struct Sprite* sprite)
{
    if (sprite->animEnded)
        DestroyAnimSprite(sprite);
}

void sub_80D2920(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->callback = sub_80D2904;
}
