#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80D02D0(struct Sprite* sprite);
static void sub_80D0344(struct Sprite* sprite);
static void sub_80D03A8(struct Sprite* sprite);

// guillotine (does a reverse grip where the slices can reverse at a given period.)
// Used in Guillotine.

void sub_80D0228(struct Sprite* sprite)
{
    s16 r8 = 32;
    s16 r4 = -32;
    s16 r9 = 16;
    s16 r6 = -16;
    if (gBattleAnimArgs[0] != 0)
    {
        r8 = r4;
        r4 = 32;
        r9 = r6;
        r6 = 16;
        StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    }

    sprite->pos1.x += r8;
    sprite->pos1.y += r4;
    sprite->data[0] = 6;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + r9;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + r6;
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[5] = gBattleAnimArgs[0];
    sprite->data[6] = sprite->data[0];
    sprite->callback = sub_80D02D0;
}

void sub_80D02D0(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) && sprite->animEnded == 1)
    {
        SeekSpriteAnim(sprite, 0);
        sprite->animPaused = 1;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 2;
        sprite->pos2.y = -2;
        sprite->data[0] = sprite->data[6];
        sprite->data[1] ^= 1;
        sprite->data[2] ^= 1;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->callback = sub_80D0344;
    }
}

void sub_80D0344(struct Sprite* sprite)
{
    if (sprite->data[3])
    {
        sprite->pos2.x = -sprite->pos2.x;
        sprite->pos2.y = -sprite->pos2.y;
    }

    sprite->data[3] ^= 1;
    if (++sprite->data[4] == 0x33)
    {
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->animPaused = 0;
        StartSpriteAnim(sprite, sprite->data[5] ^ 1);
        sprite->callback = sub_80D03A8;
    }
}

void sub_80D03A8(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) != 0)
        move_anim_8072740(sprite);
}
