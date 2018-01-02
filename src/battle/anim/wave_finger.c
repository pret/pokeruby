#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern void sub_80CEF44(u8 bank, struct Sprite* sprite);
void sub_80CF088(struct Sprite* sprite);

// wave_finger
// Used by Metronome.

void sub_80CF040(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    sub_80CEF44(bank, sprite);
    sprite->data[0] = 0;
    StoreSpriteCallbackInData(sprite, sub_80CF088);
    sprite->callback = sub_80785E4;
}

void sub_80CF088(struct Sprite* sprite)
{
    if (++sprite->data[0] > 16)
    {
        StartSpriteAffineAnim(sprite, 1);
        StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
        sprite->callback = sub_80785E4;
    }
}
