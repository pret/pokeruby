#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

extern void sub_80CEF44(u8 bank, struct Sprite* sprite);
static void sub_80CF228(struct Sprite* sprite);
static void sub_80CF264(struct Sprite* sprite);

// taunt_finger
// Used in Taunt.

void sub_80CF1C8(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sub_80CEF44(bank, sprite);
    if (GetBankSide(bank) == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->data[0] = 2;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->data[0] = 3;
    }

    sprite->callback = sub_80CF228;
}

void sub_80CF228(struct Sprite* sprite)
{
    if (++sprite->data[1] > 10)
    {
        sprite->data[1] = 0;
        StartSpriteAnim(sprite, sprite->data[0]);
        StoreSpriteCallbackInData(sprite, sub_80CF264);
        sprite->callback = sub_8078600;
    }
}

void sub_80CF264(struct Sprite* sprite)
{
    if (++sprite->data[1] > 5)
        move_anim_8072740(sprite);
}
