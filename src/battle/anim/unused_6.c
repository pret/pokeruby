#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

extern void sub_80CEF44(u8 bank, struct Sprite* sprite);
static void sub_80CF310(struct Sprite* sprite);

// unused_6

void sub_80CF2D0(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sub_80CEF44(bank, sprite);
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = sub_80CF310;
}

void sub_80CF310(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos2.y -= 3;
        if (++sprite->data[1] == 6)
            sprite->data[0]++;
        break;
    case 1:
        sprite->pos2.y += 3;
        if (--sprite->data[1] == 0)
            sprite->data[0]++;
        break;
    case 2:
        if (++sprite->data[1] == 0x40)
            move_anim_8072740(sprite);
        break;
    }
}
