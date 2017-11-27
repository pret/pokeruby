#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CF6B4(struct Sprite* sprite);

// sword (sword appears and floats upward.)
// Used in Swords Dance.

void sub_80CF690(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    sprite->callback = sub_80785E4;
    StoreSpriteCallbackInData(sprite, sub_80CF6B4);
}

void sub_80CF6B4(struct Sprite* sprite)
{
    sprite->data[0] = 6;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[4] = sprite->pos1.y - 32;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}
