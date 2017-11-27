#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CFF68(struct Sprite* sprite);

// money
// Used by Pay Day.

void sub_80CFE9C(struct Sprite* sprite)
{
    s16 r6;
    s16 r7;
    u16 var;

    sub_80787B0(sprite, 1);
    r6 = sub_8077ABC(gBattleAnimBankTarget, 2);
    r7 = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[3];
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    r6 += gBattleAnimArgs[2];
    var = sub_80790F0(r6 - sprite->pos1.x, r7 - sprite->pos1.y);
    var += 0xC000;
    sub_8078FDC(sprite, 0, 0x100, 0x100, var);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = r6;
    sprite->data[4] = r7;
    sprite->callback = sub_8078C00;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CFF50(struct Sprite* sprite)
{
    sprite->data[2] = -16;
    sprite->pos1.y += 8;
    sprite->callback = sub_80CFF68;
}

void sub_80CFF68(struct Sprite* sprite)
{
    sprite->data[0] += 0x80;
    sprite->pos2.x = sprite->data[0] >> 8;
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
        sprite->pos2.x = -sprite->pos2.x;

    sprite->pos2.y = Sin(sprite->data[1], sprite->data[2]);
    sprite->data[1] += 5;
    if (sprite->data[1] > 0x7E)
    {
        sprite->data[1] = 0;
        sprite->data[2] /= 2;
        if (++sprite->data[3] == 2)
            move_anim_8072740(sprite);
    }
}
