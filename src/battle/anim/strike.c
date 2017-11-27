#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CE798(struct Sprite* sprite);

// strike (A red strike towards the opponent.)
// Used in Horn Attack, Fury Attack, and Horn Drill.

void sub_80CE670(struct Sprite* sprite)
{
    if (gBattleAnimArgs[2] <= 1)
        gBattleAnimArgs[2] = 2;

    if (gBattleAnimArgs[2] > 0x7F)
        gBattleAnimArgs[2] = 0x7F;

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[1];
    sprite->data[6] = sprite->pos1.x;
    sprite->data[7] = sprite->pos1.y;
    if (NotInBattle() != 0)
    {
        sprite->oam.matrixNum = 8;
        sprite->pos1.x += 40;
        sprite->pos1.y += 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = -0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = -0xA00 / sprite->data[1];
    }
    else if (GetBankSide(gBattleAnimBankAttacker) == 0)
    {
        sprite->pos1.x -= 40;
        sprite->pos1.y += 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = 0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = -0xA00 / sprite->data[1];
    }
    else
    {
        sprite->pos1.x += 40;
        sprite->pos1.y -= 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = -0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = 0xA00 / sprite->data[1];
        sprite->oam.matrixNum = 24;
    }

    sprite->callback = sub_80CE798;
}

void sub_80CE798(struct Sprite* sprite)
{
    sprite->data[2] += sprite->data[3];
    sprite->data[4] += sprite->data[5];
    sprite->pos1.x = sprite->data[2] >> 7;
    sprite->pos1.y = sprite->data[4] >> 7;
    if (--sprite->data[1] == 1)
    {
        sprite->pos1.x = sprite->data[6];
        sprite->pos1.y = sprite->data[7];
    }

    if (sprite->data[1] == 0)
        move_anim_8072740(sprite);
}
