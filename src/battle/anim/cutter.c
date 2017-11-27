#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CB09C(struct Sprite* sprite);
static void sub_80CB1A4(struct Sprite* sprite);

// cutter (the cresent shaped leaf used in throwing projectiles for the listed moves.)
// Used by Razor Leaf and Magical Leaf.

void sub_80CAFD0(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    if (GetBankSide(gBattleAnimBankAttacker))
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[4];
    if (!(gBattleAnimArgs[6]))
    {
        sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[2];
        sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[3];
    }
    else
    {
        sub_807A3FC(gBattleAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
        sprite->data[2] += gBattleAnimArgs[2];
        sprite->data[4] += gBattleAnimArgs[3];
    }

    sprite->data[5] = gBattleAnimArgs[5];
    sub_80786EC(sprite);
    if (GetBankSide(gBattleAnimBankAttacker) == GetBankSide(gBattleAnimBankTarget))
    {
        sprite->data[0] = 1;
    }
    else
    {
        sprite->data[0] = 0;
    }

    sprite->callback = sub_80CB09C;
}

void sub_80CB09C(struct Sprite* sprite)
{
    bool8 c = FALSE;
    s16 a = sprite->data[0];
    s16 b = sprite->data[7];
    s16 r0;
    
    sprite->data[0] = 1;
    sub_8078718(sprite);
    r0 = sprite->data[7];
    sprite->data[0] = a;
    if (b > 0xC8 && r0 <= 0x37 && sprite->oam.affineParam == 0)
        sprite->oam.affineParam++;

    if (sprite->oam.affineParam != 0 && sprite->data[0] != 0)
    {
        sprite->invisible ^= 1;
        sprite->oam.affineParam++;
        if (sprite->oam.affineParam == 0x1E)
            c = TRUE;
    }
    
    if (sprite->pos1.x + sprite->pos2.x > 0x100
     || sprite->pos1.x + sprite->pos2.x < -16
     || sprite->pos1.y + sprite->pos2.y > 0xA0
     || sprite->pos1.y + sprite->pos2.y < -16)
        c = TRUE;

    if (c)
        move_anim_8072740(sprite);
}

void sub_80CB144(struct Sprite* sprite)
{
    if (!NotInBattle() && IsDoubleBattle() == TRUE)
    {
        sub_807A3FC(gBattleAnimBankTarget, 1, &sprite->pos1.x, &sprite->pos1.y);
    }

    sprite->pos1.y += 32;
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = gBattleAnimArgs[2];
    sprite->data[3] = gBattleAnimArgs[3];
    sprite->data[4] = gBattleAnimArgs[4];
    sprite->callback = sub_80CB1A4;
}

void sub_80CB1A4(struct Sprite* sprite)
{
    if (sprite->data[1] == 0xFF)
    {
        sprite->pos1.y -= 2;
    }
    else if (sprite->data[1] > 0)
    {
        sprite->pos1.y -= 2;
        sprite->data[1] -= 2;
    }

    sprite->data[5] += sprite->data[2];
    if (sprite->data[0] < sprite->data[4])
        sprite->data[5] += sprite->data[2];

    sprite->data[5] &= 0xFF;
    sprite->pos2.x = Cos(sprite->data[5], sprite->data[3]);
    sprite->pos2.y = Sin(sprite->data[5], 5);
    if (sprite->data[5] <= 0x7F)
    {
        sprite->oam.priority = sub_8079ED4(gBattleAnimBankTarget) - 1;
    }
    else
    {
        sprite->oam.priority = sub_8079ED4(gBattleAnimBankTarget) + 1;
    }

    sprite->data[0]--;
    if (!sprite->data[0])
        move_anim_8072740(sprite);
}
