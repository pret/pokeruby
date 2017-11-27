#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CB298(struct Sprite* sprite);
static void sub_80CB2D4(struct Sprite* sprite);

// tendrils
// Used by Constrict.

void sub_80CB25C(struct Sprite* sprite)
{
    sub_8078764(sprite, 0);
    sprite->affineAnimPaused = 1;
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[2]);
    sprite->data[6] = gBattleAnimArgs[2];
    sprite->data[7] = gBattleAnimArgs[3];
    sprite->callback = sub_80CB298;
}

void sub_80CB298(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->affineAnimPaused = 0;
        GetAnimBankSpriteId(1);
        sprite->data[0] = 0x100;
        sprite->callback = sub_80CB2D4;
    }
}

void sub_80CB2D4(struct Sprite* sprite)
{
    GetAnimBankSpriteId(1);
    if (!sprite->data[2])
    {
        sprite->data[0] += 11;
    }
    else
    {
        sprite->data[0] -= 11;
    }
    sprite->data[1]++;
    if (sprite->data[1] == 6)
    {
        sprite->data[1] = 0;
        sprite->data[2] ^= 1;
    }

    if (sprite->affineAnimEnded)
    {
        sprite->data[7]--;
        if (sprite->data[7] > 0)
        {
            StartSpriteAffineAnim(sprite, sprite->data[6]);
        }
        else
        {
            move_anim_8072740(sprite);
        }
    }
}