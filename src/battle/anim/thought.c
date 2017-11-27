#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CF008(struct Sprite* sprite);

// thought (thought bubble)
// Used in Metronome and Taunt.

void sub_80CEF44(u8 bank, struct Sprite* sprite)
{
    if (GetBankSide(bank) == 0)
        sprite->pos1.x = sub_807A100(bank, 5) + 8;
    else
        sprite->pos1.x = sub_807A100(bank, 4) - 8;

    sprite->pos1.y = sub_8077ABC(bank, 3) - (s16)sub_807A100(bank, 0) / 4;
}

void sub_80CEF9C(struct Sprite* sprite)
{
    u8 a;
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sub_80CEF44(bank, sprite);
    a = (GetBankSide(bank) == 0) ? 0 : 1;
    sprite->data[0] = gBattleAnimArgs[1];
    sprite->data[1] = a + 2;
    StartSpriteAnim(sprite, a);
    StoreSpriteCallbackInData(sprite, sub_80CF008);
    sprite->callback = sub_8078600;
}

void sub_80CF008(struct Sprite* sprite)
{
    if (--sprite->data[0] == 0)
    {
        StoreSpriteCallbackInData(sprite, move_anim_8072740);
        StartSpriteAnim(sprite, sprite->data[1]);
        sprite->callback = sub_8078600;
    }
}
