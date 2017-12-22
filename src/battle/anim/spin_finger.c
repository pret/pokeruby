#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

extern void sub_80CF088(struct Sprite* sprite);
static void sub_80CF138(struct Sprite* sprite);
static void sub_80CF158(struct Sprite* sprite);

// spin_finger
// Used in Follow Me.

void sub_80CF0BC(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sprite->pos1.x = sub_8077ABC(bank, 0);
    sprite->pos1.y = sub_807A100(bank, 2);
    if (sprite->pos1.y <= 9)
        sprite->pos1.y = 10;

    sprite->data[0] = 1;
    sprite->data[1] = 0;
    sprite->data[2] = sprite->subpriority;
    sprite->data[3] = sprite->subpriority + 4;
    sprite->data[4] = 0;
    StoreSpriteCallbackInData(sprite, sub_80CF138);
    sprite->callback = sub_80785E4;
}

void sub_80CF138(struct Sprite* sprite)
{
    if (++sprite->data[4] > 12)
        sprite->callback = sub_80CF158;
}

void sub_80CF158(struct Sprite* sprite)
{
    s16 temp;
    s16 temp2;
    sprite->data[1] += 4;
    if (sprite->data[1] > 0xFE)
    {
        if (--sprite->data[0] == 0)
        {
            sprite->pos2.x = 0;
            sprite->callback = sub_80CF088;
            return;
        }
        else
        {
            sprite->data[1] &= 0xFF;
        }
    }

    if (sprite->data[1] > 0x4F)
        sprite->subpriority = sprite->data[3];

    if (sprite->data[1] > 0x9F)
        sprite->subpriority = sprite->data[2];

    temp = gSineTable[sprite->data[1]];
    sprite->pos2.x = (temp2 = temp >> 3) + (temp2 >> 1);
}
